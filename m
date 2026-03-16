Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52689D58B36
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 04:52:11 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43804.1773636723616163160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 21:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Yl/5zHCf;
 spf=pass (domain: mvista.com, ip: 74.125.82.177, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c0b7eda342so778381eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 21:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773636723; x=1774241523; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5/hQqVmfKH5thf87FWikCPaQAxTSaFTYjKe9nwDQtU=;
        b=Yl/5zHCfQRqQU+Uq+51xC6lJgloy3KubRLFjQsSE0TYoYGmsgzGA92Nb+2proKL9A3
         FLqYuyA6vUw7cY7k0/A4MNq3eUYuAriBUHhyxLfD2x2biuRlcnX6WTKtq9UNTKyQkO2h
         5L9ZGt2Qe9LghfCreHthExzC8gb+UcfLwA9D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773636723; x=1774241523;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5/hQqVmfKH5thf87FWikCPaQAxTSaFTYjKe9nwDQtU=;
        b=RNiJeso5ie5+Hv7g3IwlMLgUFrKAWibIopkNkboRdDV+wfm55t24yrYT3pXT1JpT8g
         YGIktF4CTQpvHjoga+UrCI4jv2Mpp4eSeqaM8ZcxKZeZTo67W71+uLKqSxoN9ZSiJStL
         GGbq1jr44ndg+qufJnGkM3Pdc+Z+jlAfaNj90VHIkDqRB7v0ZBfDNIfYzQL56aI+U4IO
         90nzaf6oCo2DhQ2I31297O8+fTj4okxiwKxPU6q5hU3QLfc4VUzRJHpSbq8Dr4Qm4uoO
         6eqsnk78IWVJavPUk0ABTrX+1c/sLLmzGsxMGdKphVK54HVxE+YoQZQ/JPOWH7i6VPfb
         0I3w==
X-Forwarded-Encrypted: i=1; AJvYcCUciZZfCNEjiP2Lp0mIIJljymcqKkTBhtY2QMotaN9xeUo1wWPE0wml/dCvMUKpQV+9Nqy33ybco8XneIDt0P6X1A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkJ9kxsXuX9CBNzt/52Xohyc8f+UiWnDJAjiLXz92gHULQ6vjL
	a7tf4LITiFp5q3pLIIc9o+DXR1hbeEAcvejCJ/YYLihzpKjC36bHQK8AwB5QDK4sFZ8=
X-Gm-Gg: ATEYQzwXIomPZJl7lXP/BylW8kj8mRdVqGjWwWEF2HUhu9WXmWt8yde+hfxPwvCVZKe
	Iyezr/ErgcYTT7+Yp/CUdew1wkzNUQFCi6DkNGuTDu0yWQYhtGF9z3qsScNnpHgu2J7Z6U/FNvx
	RNKZZqvYtMtu5FpHNHCPzisBDytyByY1FKcTxtzkx0ZvYMWYT33JL21Zk1Qybg89yS3pOw7b9Rs
	JYOIeIERMrwWYh6hIJXBSdq7z7rH1zavy4KcvNDkj/Fdd5lsnUitQ4IoyNHYbBzUksEX/jxPylH
	zlnIUcKIv7NqnPMFEYuE9JdtB9Hp6jSXU3LVgeSSoXPfIgfJJqm0GfWeFUFhDJ+fm5MllwKcucx
	I9VzMUv7bKo1M1CXyzWKdI8rroPmG2iAb/ydn5NtSB9vAH8HEIZJXV4x42V6M0Du1fUZeHoabOH
	GMT0damH9kFL0NPlSTx9c8cGGHrPQxww==
X-Received: by 2002:a05:7300:e887:b0:2be:2043:614b with SMTP id 5a478bee46e88-2bea554ad84mr4805845eec.18.1773636722483;
        Sun, 15 Mar 2026 21:52:02 -0700 (PDT)
Received: from [192.168.1.100] ([103.250.136.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0bfd41aacsm4803630eec.27.2026.03.15.21.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 21:52:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------xsBDl08mroTXDUVuSxIkakVJ"
Message-ID: <38450c35-5cbe-4f60-ad6b-a02353712329@mvista.com>
Date: Mon, 16 Mar 2026 10:21:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] perl: fix CVE-2025-40909
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260227083801.544222-1-hprajapati@mvista.com>
 <DH2MQQRN46UP.32FYBDWM15C6I@smile.fr>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <DH2MQQRN46UP.32FYBDWM15C6I@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:52:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233210

This is a multi-part message in MIME format.
--------------xsBDl08mroTXDUVuSxIkakVJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yoann,

I'll look into this.

On 14/03/26 9:32 pm, Yoann Congal wrote:
> Hello,
>
> On Fri Feb 27, 2026 at 9:38 AM CET, Hitendra Prajapati via lists.openembedded.org wrote:
>> Backport the patch[1] which fixes this vulnerability as mentioned in NVD report.
>> Details:https://nvd.nist.gov/vuln/detail/CVE-2025-40909
>>
>> [1]https://github.com/Perl/perl5/commit/918bfff86ca8d6d4e4ec5b30994451e0bd74aba9
>>
>> Backport of upstream commit 918bfff (CVE-2025-40909) introduces a new
>> configuration variable "d_fdopendir" which is used by config_h.SH to
>> generate HAS_FDOPENDIR.
> Looks to me that this fix is needed for scarthgap and whinlatter. Can
> you please send an equivalent fix there first?
>
>> In standard Perl builds this variable is detected by Configure.
>> However in Yocto the perl-native/perl builds rely on
>> perlcross with pre-seeded config.sh and Configure is not fully
>> executed. As a result d_fdopendir may be unset, which causes
>> config_h.SH to emit an invalid preprocessor directive:
>>
>>      # HAS_FDOPENDIR
>>
>> leading to build failures.
>>
>> Additionally, leaving the variable unset disables the new code path
>> introduced by the CVE fix.
>>
>> Seed d_fdopendir to "define" to match expected Linux/glibc behaviour
>> where fdopendir() is available. This restores correct config.h
>> generation and ensures the CVE fix is active.
> I'm not really familiar with perl integration but instead of using sed
> to patch a generated file, shouldn't we patch perl-cross with this
> (submitted but not merged) PR?
> https://github.com/arsv/perl-cross/pull/159/changes/f702c387e6940fab3801d7562a668b974a2b3a8f
>
>
> I'm also not that much familier with perl. But, I'll look to fix this in perl-cross and give proper patch.
>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> ---
>>   .../perl/files/CVE-2025-40909.patch           | 415 ++++++++++++++++++
>>   meta/recipes-devtools/perl/perl_5.34.3.bb     |   2 +
>>   2 files changed, 417 insertions(+)
>>   create mode 100644 meta/recipes-devtools/perl/files/CVE-2025-40909.patch
>>
>> diff --git a/meta/recipes-devtools/perl/files/CVE-2025-40909.patch b/meta/recipes-devtools/perl/files/CVE-2025-40909.patch
>> new file mode 100644
>> index 0000000000..b5cb20e112
>> --- /dev/null
>> +++ b/meta/recipes-devtools/perl/files/CVE-2025-40909.patch
>> @@ -0,0 +1,415 @@
>> +From 918bfff86ca8d6d4e4ec5b30994451e0bd74aba9 Mon Sep 17 00:00:00 2001
>> +From: Leon Timmermans<fawaka@gmail.com>
>> +Date: Fri, 23 May 2025 15:40:41 +0200
>> +Subject: [PATCH] CVE-2025-40909: Clone dirhandles without fchdir
>> +
>> +This uses fdopendir and dup to dirhandles. This means it won't change
>> +working directory during thread cloning, which prevents race conditions
>> +that can happen if a third thread is active at the same time.
>> +
>> +CVE: CVE-2025-40909
>> +Upstream-Status: Backport [https://github.com/Perl/perl5/commit/918bfff86ca8d6d4e4ec5b30994451e0bd74aba9]
>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> +---
>> + Configure                      |   6 ++
>> + Cross/config.sh-arm-linux      |   1 +
>> + Cross/config.sh-arm-linux-n770 |   1 +
>> + Porting/Glossary               |   5 ++
>> + Porting/config.sh              |   1 +
>> + config_h.SH                    |   6 ++
>> + configure.com                  |   1 +
>> + plan9/config_sh.sample         |   1 +
>> + sv.c                           |  91 +----------------------------
>> + t/op/threads-dirh.t            | 104 +--------------------------------
>> + win32/config.gc                |   1 +
>> + win32/config.vc                |   1 +
>> + 12 files changed, 28 insertions(+), 191 deletions(-)
>> +
>> +diff --git a/Configure b/Configure
>> +index 913e080..b668593 100755
>> +--- a/Configure
>> ++++ b/Configure
>> +@@ -476,6 +476,7 @@ d_fd_set=''
>> + d_fds_bits=''
>> + d_fdclose=''
>> + d_fdim=''
>> ++d_fdopendir=''
>> + d_fegetround=''
>> + d_fgetpos=''
>> + d_finite=''
>> +@@ -13222,6 +13223,10 @@ esac
>> + set i_fcntl
>> + eval $setvar
>> +
>> ++: see if fdopendir exists
>> ++set fdopendir d_fdopendir
>> ++eval $inlibc
>> ++
>> + : see if fork exists
>> + set fork d_fork
>> + eval $inlibc
>> +@@ -24329,6 +24334,7 @@ d_flockproto='$d_flockproto'
>> + d_fma='$d_fma'
>> + d_fmax='$d_fmax'
>> + d_fmin='$d_fmin'
>> ++d_fdopendir='$d_fdopendir'
>> + d_fork='$d_fork'
>> + d_fp_class='$d_fp_class'
>> + d_fp_classify='$d_fp_classify'
>> +diff --git a/Cross/config.sh-arm-linux b/Cross/config.sh-arm-linux
>> +index c472b09..4b346a3 100644
>> +--- a/Cross/config.sh-arm-linux
>> ++++ b/Cross/config.sh-arm-linux
>> +@@ -211,6 +211,7 @@ d_fd_macros='define'
>> + d_fd_set='define'
>> + d_fdclose='undef'
>> + d_fdim='undef'
>> ++d_fdopendir='undef'
>> + d_fds_bits='undef'
>> + d_fegetround='define'
>> + d_fgetpos='define'
>> +diff --git a/Cross/config.sh-arm-linux-n770 b/Cross/config.sh-arm-linux-n770
>> +index 7b10cbf..8dc2f83 100644
>> +--- a/Cross/config.sh-arm-linux-n770
>> ++++ b/Cross/config.sh-arm-linux-n770
>> +@@ -210,6 +210,7 @@ d_fd_macros='define'
>> + d_fd_set='define'
>> + d_fdclose='undef'
>> + d_fdim='undef'
>> ++d_fdopendir='undef'
>> + d_fds_bits='undef'
>> + d_fegetround='define'
>> + d_fgetpos='define'
>> +diff --git a/Porting/Glossary b/Porting/Glossary
>> +index d28e8c5..0a98386 100644
>> +--- a/Porting/Glossary
>> ++++ b/Porting/Glossary
>> +@@ -933,6 +933,11 @@ d_fmin (d_fmin.U):
>> + 	This variable conditionally defines the HAS_FMIN symbol, which
>> + 	indicates to the C program that the fmin() routine is available.
>> +
>> ++d_fdopendir (d_fdopendir.U):
>> ++	This variable conditionally defines the HAS_FORK symbol, which
>> ++	indicates that the fdopen routine is available to open a
>> ++	directory descriptor.
>> ++
>> + d_fork (d_fork.U):
>> + 	This variable conditionally defines the HAS_FORK symbol, which
>> + 	indicates to the C program that the fork() routine is available.
>> +diff --git a/Porting/config.sh b/Porting/config.sh
>> +index a88cffb..6ab32ac 100644
>> +--- a/Porting/config.sh
>> ++++ b/Porting/config.sh
>> +@@ -227,6 +227,7 @@ d_fd_macros='define'
>> + d_fd_set='define'
>> + d_fdclose='undef'
>> + d_fdim='define'
>> ++d_fdopendir='define'
>> + d_fds_bits='define'
>> + d_fegetround='define'
>> + d_fgetpos='define'
>> +diff --git a/config_h.SH b/config_h.SH
>> +index 8264f91..61040b5 100755
>> +--- a/config_h.SH
>> ++++ b/config_h.SH
>> +@@ -142,6 +142,12 @@ sed <<!GROK!THIS! >$CONFIG_H -e 's!^#undef\(.*/\)\*!/\*#define\1 \*!' -e 's!^#un
>> +  */
>> + #$d_fcntl HAS_FCNTL		/**/
>> +
>> ++/* HAS_FDOPENDIR:
>> ++ * This symbol, if defined, indicates that the fdopen routine is
>> ++ * available to open a directory descriptor.
>> ++ */
>> ++#$d_fdopendir HAS_FDOPENDIR		/**/
>> ++
>> + /* HAS_FGETPOS:
>> +  *	This symbol, if defined, indicates that the fgetpos routine is
>> +  *	available to get the file position indicator, similar to ftell().
>> +diff --git a/configure.com b/configure.com
>> +index df29582..0d80fa0 100644
>> +--- a/configure.com
>> ++++ b/configure.com
>> +@@ -6211,6 +6211,7 @@ $ WC "d_fd_set='" + d_fd_set + "'"
>> + $ WC "d_fd_macros='define'"
>> + $ WC "d_fdclose='undef'"
>> + $ WC "d_fdim='" + d_fdim + "'"
>> ++$ WC "d_fdopendir='undef'"
>> + $ WC "d_fds_bits='define'"
>> + $ WC "d_fegetround='undef'"
>> + $ WC "d_fgetpos='define'"
>> +diff --git a/plan9/config_sh.sample b/plan9/config_sh.sample
>> +index d4f6928..c87fc9b 100644
>> +--- a/plan9/config_sh.sample
>> ++++ b/plan9/config_sh.sample
>> +@@ -211,6 +211,7 @@ d_fd_macros='undef'
>> + d_fd_set='undef'
>> + d_fdclose='undef'
>> + d_fdim='undef'
>> ++d_fdopendir='undef'
>> + d_fds_bits='undef'
>> + d_fegetround='undef'
>> + d_fgetpos='define'
>> +diff --git a/sv.c b/sv.c
>> +index 46bf981..1fd16ca 100644
>> +--- a/sv.c
>> ++++ b/sv.c
>> +@@ -13619,15 +13619,6 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAMS *const param)
>> + {
>> +     DIR *ret;
>> +
>> +-#if defined(HAS_FCHDIR) && defined(HAS_TELLDIR) && defined(HAS_SEEKDIR)
>> +-    DIR *pwd;
>> +-    const Direntry_t *dirent;
>> +-    char smallbuf[256]; /* XXX MAXPATHLEN, surely? */
>> +-    char *name = NULL;
>> +-    STRLEN len = 0;
>> +-    long pos;
>> +-#endif
>> +-
>> +     PERL_UNUSED_CONTEXT;
>> +     PERL_ARGS_ASSERT_DIRP_DUP;
>> +
>> +@@ -13639,89 +13630,13 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAMS *const param)
>> +     if (ret)
>> + 	return ret;
>> +
>> +-#if defined(HAS_FCHDIR) && defined(HAS_TELLDIR) && defined(HAS_SEEKDIR)
>> ++#ifdef HAS_FDOPENDIR
>> +
>> +     PERL_UNUSED_ARG(param);
>> +
>> +-    /* create anew */
>> +-
>> +-    /* open the current directory (so we can switch back) */
>> +-    if (!(pwd = PerlDir_open("."))) return (DIR *)NULL;
>> +-
>> +-    /* chdir to our dir handle and open the present working directory */
>> +-    if (fchdir(my_dirfd(dp)) < 0 || !(ret = PerlDir_open("."))) {
>> +-	PerlDir_close(pwd);
>> +-	return (DIR *)NULL;
>> +-    }
>> +-    /* Now we should have two dir handles pointing to the same dir. */
>> +-
>> +-    /* Be nice to the calling code and chdir back to where we were. */
>> +-    /* XXX If this fails, then what? */
>> +-    PERL_UNUSED_RESULT(fchdir(my_dirfd(pwd)));
>> +-
>> +-    /* We have no need of the pwd handle any more. */
>> +-    PerlDir_close(pwd);
>> +-
>> +-#ifdef DIRNAMLEN
>> +-# define d_namlen(d) (d)->d_namlen
>> +-#else
>> +-# define d_namlen(d) strlen((d)->d_name)
>> +-#endif
>> +-    /* Iterate once through dp, to get the file name at the current posi-
>> +-       tion. Then step back. */
>> +-    pos = PerlDir_tell(dp);
>> +-    if ((dirent = PerlDir_read(dp))) {
>> +-	len = d_namlen(dirent);
>> +-        if (len > sizeof(dirent->d_name) && sizeof(dirent->d_name) > PTRSIZE) {
>> +-            /* If the len is somehow magically longer than the
>> +-             * maximum length of the directory entry, even though
>> +-             * we could fit it in a buffer, we could not copy it
>> +-             * from the dirent.  Bail out. */
>> +-            PerlDir_close(ret);
>> +-            return (DIR*)NULL;
>> +-        }
>> +-	if (len <= sizeof smallbuf) name = smallbuf;
>> +-	else Newx(name, len, char);
>> +-	Move(dirent->d_name, name, len, char);
>> +-    }
>> +-    PerlDir_seek(dp, pos);
>> +-
>> +-    /* Iterate through the new dir handle, till we find a file with the
>> +-       right name. */
>> +-    if (!dirent) /* just before the end */
>> +-	for(;;) {
>> +-	    pos = PerlDir_tell(ret);
>> +-	    if (PerlDir_read(ret)) continue; /* not there yet */
>> +-	    PerlDir_seek(ret, pos); /* step back */
>> +-	    break;
>> +-	}
>> +-    else {
>> +-	const long pos0 = PerlDir_tell(ret);
>> +-	for(;;) {
>> +-	    pos = PerlDir_tell(ret);
>> +-	    if ((dirent = PerlDir_read(ret))) {
>> +-		if (len == (STRLEN)d_namlen(dirent)
>> +-                    && memEQ(name, dirent->d_name, len)) {
>> +-		    /* found it */
>> +-		    PerlDir_seek(ret, pos); /* step back */
>> +-		    break;
>> +-		}
>> +-		/* else we are not there yet; keep iterating */
>> +-	    }
>> +-	    else { /* This is not meant to happen. The best we can do is
>> +-	              reset the iterator to the beginning. */
>> +-		PerlDir_seek(ret, pos0);
>> +-		break;
>> +-	    }
>> +-	}
>> +-    }
>> +-#undef d_namlen
>> +-
>> +-    if (name && name != smallbuf)
>> +-	Safefree(name);
>> +-#endif
>> ++    ret = fdopendir(dup(my_dirfd(dp)));
>> +
>> +-#ifdef WIN32
>> ++#elif defined(WIN32)
>> +     ret = win32_dirp_dup(dp, param);
>> + #endif
>> +
>> +diff --git a/t/op/threads-dirh.t b/t/op/threads-dirh.t
>> +index bb4bcfc..14c399c 100644
>> +--- a/t/op/threads-dirh.t
>> ++++ b/t/op/threads-dirh.t
>> +@@ -13,16 +13,12 @@ BEGIN {
>> +      skip_all_if_miniperl("no dynamic loading on miniperl, no threads");
>> +      skip_all("runs out of memory on some EBCDIC") if $ENV{PERL_SKIP_BIG_MEM_TESTS};
>> +
>> +-     plan(6);
>> ++     plan(1);
>> + }
>> +
>> + use strict;
>> + use warnings;
>> + use threads;
>> +-use threads::shared;
>> +-useFile::Path;
>> +-useFile::Spec::Functions  qw 'updir catdir';
>> +-use Cwd 'getcwd';
>> +
>> + # Basic sanity check: make sure this does not crash
>> + fresh_perl_is <<'# this is no comment', 'ok', {}, 'crash when duping dirh';
>> +@@ -31,101 +27,3 @@ fresh_perl_is <<'# this is no comment', 'ok', {}, 'crash when duping dirh';
>> +    async{}->join for 1..2;
>> +    print "ok";
>> + # this is no comment
>> +-
>> +-my $dir;
>> +-SKIP: {
>> +- skip "telldir or seekdir not defined on this platform", 5
>> +-    if !$Config::Config{d_telldir} || !$Config::Config{d_seekdir};
>> +- my $skip = sub {
>> +-   chdir($dir);
>> +-   chdir updir;
>> +-   skip $_[0], 5
>> +- };
>> +-
>> +- if(!$Config::Config{d_fchdir} && $^O ne "MSWin32") {
>> +-  $::TODO = 'dir handle cloning currently requires fchdir on non-Windows platforms';
>> +- }
>> +-
>> +- my @w :shared; # warnings accumulator
>> +- local $SIG{__WARN__} = sub { push @w, $_[0] };
>> +-
>> +- $dir = catdir getcwd(), "thrext$$" . int rand() * 100000;
>> +-
>> +- rmtree($dir) if -d $dir;
>> +- mkdir($dir);
>> +-
>> +- # Create a dir structure like this:
>> +- #   $dir
>> +- #     |
>> +- #     `- toberead
>> +- #            |
>> +- #            +---- thrit
>> +- #            |
>> +- #            +---- rile
>> +- #            |
>> +- #            `---- zor
>> +-
>> +- chdir($dir);
>> +- mkdir 'toberead';
>> +- chdir 'toberead';
>> +- {open my $fh, ">thrit" or &$skip("Cannot create file thrit")}
>> +- {open my $fh, ">rile" or &$skip("Cannot create file rile")}
>> +- {open my $fh, ">zor" or &$skip("Cannot create file zor")}
>> +- chdir updir;
>> +-
>> +- # Then test that dir iterators are cloned correctly.
>> +-
>> +- opendir my $toberead, 'toberead';
>> +- my $start_pos = telldir $toberead;
>> +- my @first_2 = (scalar readdir $toberead, scalar readdir $toberead);
>> +- my @from_thread = @{; async { [readdir $toberead ] } ->join };
>> +- my @from_main = readdir $toberead;
>> +- is join('-', sort @from_thread), join('-', sort @from_main),
>> +-     'dir iterator is copied from one thread to another';
>> +- like
>> +-   join('-', "", sort(@first_2, @from_thread), ""),
>> +-   qr/(?<!-rile)-rile-thrit-zor-(?!zor-)/i,
>> +-  'cloned iterator iterates exactly once over everything not already seen';
>> +-
>> +- seekdir $toberead, $start_pos;
>> +- readdir $toberead for 1 .. @first_2+@from_thread;
>> +- {
>> +-  local $::TODO; # This always passes when dir handles are not cloned.
>> +-  is
>> +-    async { readdir $toberead // 'undef' } ->join, 'undef',
>> +-   'cloned dir iterator that points to the end of the directory'
>> +-  ;
>> +- }
>> +-
>> +- # Make sure the cloning code can handle file names longer than 255 chars
>> +- SKIP: {
>> +-  chdir 'toberead';
>> +-  open my $fh,
>> +-    ">floccipaucinihilopilification-"
>> +-   . "pneumonoultramicroscopicsilicovolcanoconiosis-"
>> +-   . "lopadotemachoselachogaleokranioleipsanodrimypotrimmatosilphiokarabo"
>> +-   . "melitokatakechymenokichlepikossyphophattoperisteralektryonoptokephal"
>> +-   . "liokinklopeleiolagoiosiraiobaphetraganopterygon"
>> +-    or
>> +-     chdir updir,
>> +-     skip("OS does not support long file names (and I mean *long*)", 1);
>> +-  chdir updir;
>> +-  opendir my $dirh, "toberead";
>> +-  my $test_name
>> +-    = "dir iterators can be cloned when the next fn > 255 chars";
>> +-  while() {
>> +-   my $pos = telldir $dirh;
>> +-   my $fn = readdir($dirh);
>> +-   if(!defined $fn) { fail($test_name); last SKIP; }
>> +-   if($fn =~ 'lagoio') {
>> +-    seekdir $dirh, $pos;
>> +-    last;
>> +-   }
>> +-  }
>> +-  is length async { scalar readdir $dirh } ->join, 258, $test_name;
>> +- }
>> +-
>> +- is scalar @w, 0, 'no warnings during all that' or diag @w;
>> +- chdir updir;
>> +-}
>> +-rmtree($dir);
>> +diff --git a/win32/config.gc b/win32/config.gc
>> +index af6fed9..7ae6f9b 100644
>> +--- a/win32/config.gc
>> ++++ b/win32/config.gc
>> +@@ -198,6 +198,7 @@ d_fd_macros='define'
>> + d_fd_set='define'
>> + d_fdclose='undef'
>> + d_fdim='undef'
>> ++d_fdopendir='undef'
>> + d_fds_bits='define'
>> + d_fegetround='undef'
>> + d_fgetpos='define'
>> +diff --git a/win32/config.vc b/win32/config.vc
>> +index f4625bf..8725177 100644
>> +--- a/win32/config.vc
>> ++++ b/win32/config.vc
>> +@@ -198,6 +198,7 @@ d_fd_macros='define'
>> + d_fd_set='define'
>> + d_fdclose='undef'
>> + d_fdim='undef'
>> ++d_fdopendir='undef'
>> + d_fds_bits='define'
>> + d_fegetround='undef'
>> + d_fgetpos='define'
>> +--
>> +2.50.1
>> +
>> diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
>> index c8475fc450..25c4e4991d 100644
>> --- a/meta/recipes-devtools/perl/perl_5.34.3.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
>> @@ -22,6 +22,7 @@ SRC_URI ="https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \ 
>> file://CVE-2023-31486-0001.patch \ file://CVE-2023-31486-0002.patch \ 
>> file://0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch \ + 
>> file://CVE-2025-40909.patch \ "
>>   SRC_URI:append:class-native = " \
>>              file://perl-configpm-switch.patch  \
>> @@ -56,6 +57,7 @@ CVE_CHECK_IGNORE:append = " CVE-2023-47038"
>>   
>>   do_configure:prepend() {
>>       cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
>> +    sed -i '1i d_fdopendir=define' ${S}/config_h.SH
>>   }
>>   
>>   do_configure:class-target() {
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
Mo: +91 9998906483
--------------xsBDl08mroTXDUVuSxIkakVJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Yoann,</p>
    <p>I'll look into this.<br>
    </p>
    <div class="moz-cite-prefix">On 14/03/26 9:32 pm, Yoann Congal
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:DH2MQQRN46UP.32FYBDWM15C6I@smile.fr">
      <pre class="moz-quote-pre" wrap="">Hello,

On Fri Feb 27, 2026 at 9:38 AM CET, Hitendra Prajapati via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Backport the patch[1] which fixes this vulnerability as mentioned in NVD report.
Details: <a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2025-40909">https://nvd.nist.gov/vuln/detail/CVE-2025-40909</a>

[1] <a class="moz-txt-link-freetext" href="https://github.com/Perl/perl5/commit/918bfff86ca8d6d4e4ec5b30994451e0bd74aba9">https://github.com/Perl/perl5/commit/918bfff86ca8d6d4e4ec5b30994451e0bd74aba9</a>

Backport of upstream commit 918bfff (CVE-2025-40909) introduces a new
configuration variable "d_fdopendir" which is used by config_h.SH to
generate HAS_FDOPENDIR.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Looks to me that this fix is needed for scarthgap and whinlatter. Can
you please send an equivalent fix there first?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In standard Perl builds this variable is detected by Configure.
However in Yocto the perl-native/perl builds rely on
perlcross with pre-seeded config.sh and Configure is not fully
executed. As a result d_fdopendir may be unset, which causes
config_h.SH to emit an invalid preprocessor directive:

    # HAS_FDOPENDIR

leading to build failures.

Additionally, leaving the variable unset disables the new code path
introduced by the CVE fix.

Seed d_fdopendir to "define" to match expected Linux/glibc behaviour
where fdopendir() is available. This restores correct config.h
generation and ensures the CVE fix is active.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not really familiar with perl integration but instead of using sed
to patch a generated file, shouldn't we patch perl-cross with this
(submitted but not merged) PR?
<a class="moz-txt-link-freetext" href="https://github.com/arsv/perl-cross/pull/159/changes/f702c387e6940fab3801d7562a668b974a2b3a8f">https://github.com/arsv/perl-cross/pull/159/changes/f702c387e6940fab3801d7562a668b974a2b3a8f</a>


I'm also not that much familier with perl. But, I'll look to fix this in perl-cross and give proper patch.
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
---
 .../perl/files/CVE-2025-40909.patch           | 415 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.3.bb     |   2 +
 2 files changed, 417 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2025-40909.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2025-40909.patch b/meta/recipes-devtools/perl/files/CVE-2025-40909.patch
new file mode 100644
index 0000000000..b5cb20e112
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2025-40909.patch
@@ -0,0 +1,415 @@
+From 918bfff86ca8d6d4e4ec5b30994451e0bd74aba9 Mon Sep 17 00:00:00 2001
+From: Leon Timmermans <a class="moz-txt-link-rfc2396E" href="mailto:fawaka@gmail.com">&lt;fawaka@gmail.com&gt;</a>
+Date: Fri, 23 May 2025 15:40:41 +0200
+Subject: [PATCH] CVE-2025-40909: Clone dirhandles without fchdir
+
+This uses fdopendir and dup to dirhandles. This means it won't change
+working directory during thread cloning, which prevents race conditions
+that can happen if a third thread is active at the same time.
+
+CVE: CVE-2025-40909
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/Perl/perl5/commit/918bfff86ca8d6d4e4ec5b30994451e0bd74aba9">https://github.com/Perl/perl5/commit/918bfff86ca8d6d4e4ec5b30994451e0bd74aba9</a>]
+Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ Configure                      |   6 ++
+ Cross/config.sh-arm-linux      |   1 +
+ Cross/config.sh-arm-linux-n770 |   1 +
+ Porting/Glossary               |   5 ++
+ Porting/config.sh              |   1 +
+ config_h.SH                    |   6 ++
+ configure.com                  |   1 +
+ plan9/config_sh.sample         |   1 +
+ sv.c                           |  91 +----------------------------
+ t/op/threads-dirh.t            | 104 +--------------------------------
+ win32/config.gc                |   1 +
+ win32/config.vc                |   1 +
+ 12 files changed, 28 insertions(+), 191 deletions(-)
+
+diff --git a/Configure b/Configure
+index 913e080..b668593 100755
+--- a/Configure
++++ b/Configure
+@@ -476,6 +476,7 @@ d_fd_set=''
+ d_fds_bits=''
+ d_fdclose=''
+ d_fdim=''
++d_fdopendir=''
+ d_fegetround=''
+ d_fgetpos=''
+ d_finite=''
+@@ -13222,6 +13223,10 @@ esac
+ set i_fcntl
+ eval $setvar
+ 
++: see if fdopendir exists
++set fdopendir d_fdopendir
++eval $inlibc
++
+ : see if fork exists
+ set fork d_fork
+ eval $inlibc
+@@ -24329,6 +24334,7 @@ d_flockproto='$d_flockproto'
+ d_fma='$d_fma'
+ d_fmax='$d_fmax'
+ d_fmin='$d_fmin'
++d_fdopendir='$d_fdopendir'
+ d_fork='$d_fork'
+ d_fp_class='$d_fp_class'
+ d_fp_classify='$d_fp_classify'
+diff --git a/Cross/config.sh-arm-linux b/Cross/config.sh-arm-linux
+index c472b09..4b346a3 100644
+--- a/Cross/config.sh-arm-linux
++++ b/Cross/config.sh-arm-linux
+@@ -211,6 +211,7 @@ d_fd_macros='define'
+ d_fd_set='define'
+ d_fdclose='undef'
+ d_fdim='undef'
++d_fdopendir='undef'
+ d_fds_bits='undef'
+ d_fegetround='define'
+ d_fgetpos='define'
+diff --git a/Cross/config.sh-arm-linux-n770 b/Cross/config.sh-arm-linux-n770
+index 7b10cbf..8dc2f83 100644
+--- a/Cross/config.sh-arm-linux-n770
++++ b/Cross/config.sh-arm-linux-n770
+@@ -210,6 +210,7 @@ d_fd_macros='define'
+ d_fd_set='define'
+ d_fdclose='undef'
+ d_fdim='undef'
++d_fdopendir='undef'
+ d_fds_bits='undef'
+ d_fegetround='define'
+ d_fgetpos='define'
+diff --git a/Porting/Glossary b/Porting/Glossary
+index d28e8c5..0a98386 100644
+--- a/Porting/Glossary
++++ b/Porting/Glossary
+@@ -933,6 +933,11 @@ d_fmin (d_fmin.U):
+ 	This variable conditionally defines the HAS_FMIN symbol, which
+ 	indicates to the C program that the fmin() routine is available.
+ 
++d_fdopendir (d_fdopendir.U):
++	This variable conditionally defines the HAS_FORK symbol, which
++	indicates that the fdopen routine is available to open a
++	directory descriptor.
++
+ d_fork (d_fork.U):
+ 	This variable conditionally defines the HAS_FORK symbol, which
+ 	indicates to the C program that the fork() routine is available.
+diff --git a/Porting/config.sh b/Porting/config.sh
+index a88cffb..6ab32ac 100644
+--- a/Porting/config.sh
++++ b/Porting/config.sh
+@@ -227,6 +227,7 @@ d_fd_macros='define'
+ d_fd_set='define'
+ d_fdclose='undef'
+ d_fdim='define'
++d_fdopendir='define'
+ d_fds_bits='define'
+ d_fegetround='define'
+ d_fgetpos='define'
+diff --git a/config_h.SH b/config_h.SH
+index 8264f91..61040b5 100755
+--- a/config_h.SH
++++ b/config_h.SH
+@@ -142,6 +142,12 @@ sed &lt;&lt;!GROK!THIS! &gt;$CONFIG_H -e 's!^#undef\(.*/\)\*!/\*#define\1 \*!' -e 's!^#un
+  */
+ #$d_fcntl HAS_FCNTL		/**/
+ 
++/* HAS_FDOPENDIR:
++ * This symbol, if defined, indicates that the fdopen routine is
++ * available to open a directory descriptor.
++ */
++#$d_fdopendir HAS_FDOPENDIR		/**/
++
+ /* HAS_FGETPOS:
+  *	This symbol, if defined, indicates that the fgetpos routine is
+  *	available to get the file position indicator, similar to ftell().
+diff --git a/configure.com b/configure.com
+index df29582..0d80fa0 100644
+--- a/configure.com
++++ b/configure.com
+@@ -6211,6 +6211,7 @@ $ WC "d_fd_set='" + d_fd_set + "'"
+ $ WC "d_fd_macros='define'"
+ $ WC "d_fdclose='undef'"
+ $ WC "d_fdim='" + d_fdim + "'"
++$ WC "d_fdopendir='undef'"
+ $ WC "d_fds_bits='define'"
+ $ WC "d_fegetround='undef'"
+ $ WC "d_fgetpos='define'"
+diff --git a/plan9/config_sh.sample b/plan9/config_sh.sample
+index d4f6928..c87fc9b 100644
+--- a/plan9/config_sh.sample
++++ b/plan9/config_sh.sample
+@@ -211,6 +211,7 @@ d_fd_macros='undef'
+ d_fd_set='undef'
+ d_fdclose='undef'
+ d_fdim='undef'
++d_fdopendir='undef'
+ d_fds_bits='undef'
+ d_fegetround='undef'
+ d_fgetpos='define'
+diff --git a/sv.c b/sv.c
+index 46bf981..1fd16ca 100644
+--- a/sv.c
++++ b/sv.c
+@@ -13619,15 +13619,6 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAMS *const param)
+ {
+     DIR *ret;
+ 
+-#if defined(HAS_FCHDIR) &amp;&amp; defined(HAS_TELLDIR) &amp;&amp; defined(HAS_SEEKDIR)
+-    DIR *pwd;
+-    const Direntry_t *dirent;
+-    char smallbuf[256]; /* XXX MAXPATHLEN, surely? */
+-    char *name = NULL;
+-    STRLEN len = 0;
+-    long pos;
+-#endif
+-
+     PERL_UNUSED_CONTEXT;
+     PERL_ARGS_ASSERT_DIRP_DUP;
+ 
+@@ -13639,89 +13630,13 @@ Perl_dirp_dup(pTHX_ DIR *const dp, CLONE_PARAMS *const param)
+     if (ret)
+ 	return ret;
+ 
+-#if defined(HAS_FCHDIR) &amp;&amp; defined(HAS_TELLDIR) &amp;&amp; defined(HAS_SEEKDIR)
++#ifdef HAS_FDOPENDIR
+ 
+     PERL_UNUSED_ARG(param);
+ 
+-    /* create anew */
+-
+-    /* open the current directory (so we can switch back) */
+-    if (!(pwd = PerlDir_open("."))) return (DIR *)NULL;
+-
+-    /* chdir to our dir handle and open the present working directory */
+-    if (fchdir(my_dirfd(dp)) &lt; 0 || !(ret = PerlDir_open("."))) {
+-	PerlDir_close(pwd);
+-	return (DIR *)NULL;
+-    }
+-    /* Now we should have two dir handles pointing to the same dir. */
+-
+-    /* Be nice to the calling code and chdir back to where we were. */
+-    /* XXX If this fails, then what? */
+-    PERL_UNUSED_RESULT(fchdir(my_dirfd(pwd)));
+-
+-    /* We have no need of the pwd handle any more. */
+-    PerlDir_close(pwd);
+-
+-#ifdef DIRNAMLEN
+-# define d_namlen(d) (d)-&gt;d_namlen
+-#else
+-# define d_namlen(d) strlen((d)-&gt;d_name)
+-#endif
+-    /* Iterate once through dp, to get the file name at the current posi-
+-       tion. Then step back. */
+-    pos = PerlDir_tell(dp);
+-    if ((dirent = PerlDir_read(dp))) {
+-	len = d_namlen(dirent);
+-        if (len &gt; sizeof(dirent-&gt;d_name) &amp;&amp; sizeof(dirent-&gt;d_name) &gt; PTRSIZE) {
+-            /* If the len is somehow magically longer than the
+-             * maximum length of the directory entry, even though
+-             * we could fit it in a buffer, we could not copy it
+-             * from the dirent.  Bail out. */
+-            PerlDir_close(ret);
+-            return (DIR*)NULL;
+-        }
+-	if (len &lt;= sizeof smallbuf) name = smallbuf;
+-	else Newx(name, len, char);
+-	Move(dirent-&gt;d_name, name, len, char);
+-    }
+-    PerlDir_seek(dp, pos);
+-
+-    /* Iterate through the new dir handle, till we find a file with the
+-       right name. */
+-    if (!dirent) /* just before the end */
+-	for(;;) {
+-	    pos = PerlDir_tell(ret);
+-	    if (PerlDir_read(ret)) continue; /* not there yet */
+-	    PerlDir_seek(ret, pos); /* step back */
+-	    break;
+-	}
+-    else {
+-	const long pos0 = PerlDir_tell(ret);
+-	for(;;) {
+-	    pos = PerlDir_tell(ret);
+-	    if ((dirent = PerlDir_read(ret))) {
+-		if (len == (STRLEN)d_namlen(dirent)
+-                    &amp;&amp; memEQ(name, dirent-&gt;d_name, len)) {
+-		    /* found it */
+-		    PerlDir_seek(ret, pos); /* step back */
+-		    break;
+-		}
+-		/* else we are not there yet; keep iterating */
+-	    }
+-	    else { /* This is not meant to happen. The best we can do is
+-	              reset the iterator to the beginning. */
+-		PerlDir_seek(ret, pos0);
+-		break;
+-	    }
+-	}
+-    }
+-#undef d_namlen
+-
+-    if (name &amp;&amp; name != smallbuf)
+-	Safefree(name);
+-#endif
++    ret = fdopendir(dup(my_dirfd(dp)));
+ 
+-#ifdef WIN32
++#elif defined(WIN32)
+     ret = win32_dirp_dup(dp, param);
+ #endif
+ 
+diff --git a/t/op/threads-dirh.t b/t/op/threads-dirh.t
+index bb4bcfc..14c399c 100644
+--- a/t/op/threads-dirh.t
++++ b/t/op/threads-dirh.t
+@@ -13,16 +13,12 @@ BEGIN {
+      skip_all_if_miniperl("no dynamic loading on miniperl, no threads");
+      skip_all("runs out of memory on some EBCDIC") if $ENV{PERL_SKIP_BIG_MEM_TESTS};
+ 
+-     plan(6);
++     plan(1);
+ }
+ 
+ use strict;
+ use warnings;
+ use threads;
+-use threads::shared;
+-use <a class="moz-txt-link-freetext" href="File::Path">File::Path</a>;
+-use <a class="moz-txt-link-freetext" href="File::Spec::Functions">File::Spec::Functions</a> qw 'updir catdir';
+-use Cwd 'getcwd';
+ 
+ # Basic sanity check: make sure this does not crash
+ fresh_perl_is &lt;&lt;'# this is no comment', 'ok', {}, 'crash when duping dirh';
+@@ -31,101 +27,3 @@ fresh_perl_is &lt;&lt;'# this is no comment', 'ok', {}, 'crash when duping dirh';
+    async{}-&gt;join for 1..2;
+    print "ok";
+ # this is no comment
+-
+-my $dir;
+-SKIP: {
+- skip "telldir or seekdir not defined on this platform", 5
+-    if !$Config::Config{d_telldir} || !$Config::Config{d_seekdir};
+- my $skip = sub {
+-   chdir($dir);
+-   chdir updir;
+-   skip $_[0], 5
+- };
+-
+- if(!$Config::Config{d_fchdir} &amp;&amp; $^O ne "MSWin32") {
+-  $::TODO = 'dir handle cloning currently requires fchdir on non-Windows platforms';
+- }
+-
+- my @w :shared; # warnings accumulator
+- local $SIG{__WARN__} = sub { push @w, $_[0] };
+-
+- $dir = catdir getcwd(), "thrext$$" . int rand() * 100000;
+-
+- rmtree($dir) if -d $dir;
+- mkdir($dir);
+-
+- # Create a dir structure like this:
+- #   $dir
+- #     |
+- #     `- toberead
+- #            |
+- #            +---- thrit
+- #            |
+- #            +---- rile
+- #            |
+- #            `---- zor
+-
+- chdir($dir);
+- mkdir 'toberead';
+- chdir 'toberead';
+- {open my $fh, "&gt;thrit" or &amp;$skip("Cannot create file thrit")}
+- {open my $fh, "&gt;rile" or &amp;$skip("Cannot create file rile")}
+- {open my $fh, "&gt;zor" or &amp;$skip("Cannot create file zor")}
+- chdir updir;
+-
+- # Then test that dir iterators are cloned correctly.
+-
+- opendir my $toberead, 'toberead';
+- my $start_pos = telldir $toberead;
+- my @first_2 = (scalar readdir $toberead, scalar readdir $toberead);
+- my @from_thread = @{; async { [readdir $toberead ] } -&gt;join };
+- my @from_main = readdir $toberead;
+- is join('-', sort @from_thread), join('-', sort @from_main),
+-     'dir iterator is copied from one thread to another';
+- like
+-   join('-', "", sort(@first_2, @from_thread), ""),
+-   qr/(?&lt;!-rile)-rile-thrit-zor-(?!zor-)/i,
+-  'cloned iterator iterates exactly once over everything not already seen';
+-
+- seekdir $toberead, $start_pos;
+- readdir $toberead for 1 .. @first_2+@from_thread;
+- {
+-  local $::TODO; # This always passes when dir handles are not cloned.
+-  is
+-    async { readdir $toberead // 'undef' } -&gt;join, 'undef',
+-   'cloned dir iterator that points to the end of the directory'
+-  ;
+- }
+-
+- # Make sure the cloning code can handle file names longer than 255 chars
+- SKIP: {
+-  chdir 'toberead';
+-  open my $fh,
+-    "&gt;floccipaucinihilopilification-"
+-   . "pneumonoultramicroscopicsilicovolcanoconiosis-"
+-   . "lopadotemachoselachogaleokranioleipsanodrimypotrimmatosilphiokarabo"
+-   . "melitokatakechymenokichlepikossyphophattoperisteralektryonoptokephal"
+-   . "liokinklopeleiolagoiosiraiobaphetraganopterygon"
+-    or
+-     chdir updir,
+-     skip("OS does not support long file names (and I mean *long*)", 1);
+-  chdir updir;
+-  opendir my $dirh, "toberead";
+-  my $test_name
+-    = "dir iterators can be cloned when the next fn &gt; 255 chars";
+-  while() {
+-   my $pos = telldir $dirh;
+-   my $fn = readdir($dirh);
+-   if(!defined $fn) { fail($test_name); last SKIP; }
+-   if($fn =~ 'lagoio') { 
+-    seekdir $dirh, $pos;
+-    last;
+-   }
+-  }
+-  is length async { scalar readdir $dirh } -&gt;join, 258, $test_name;
+- }
+-
+- is scalar @w, 0, 'no warnings during all that' or diag @w;
+- chdir updir;
+-}
+-rmtree($dir);
+diff --git a/win32/config.gc b/win32/config.gc
+index af6fed9..7ae6f9b 100644
+--- a/win32/config.gc
++++ b/win32/config.gc
+@@ -198,6 +198,7 @@ d_fd_macros='define'
+ d_fd_set='define'
+ d_fdclose='undef'
+ d_fdim='undef'
++d_fdopendir='undef'
+ d_fds_bits='define'
+ d_fegetround='undef'
+ d_fgetpos='define'
+diff --git a/win32/config.vc b/win32/config.vc
+index f4625bf..8725177 100644
+--- a/win32/config.vc
++++ b/win32/config.vc
+@@ -198,6 +198,7 @@ d_fd_macros='define'
+ d_fd_set='define'
+ d_fdclose='undef'
+ d_fdim='undef'
++d_fdopendir='undef'
+ d_fds_bits='define'
+ d_fegetround='undef'
+ d_fgetpos='define'
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/perl/perl_5.34.3.bb b/meta/recipes-devtools/perl/perl_5.34.3.bb
index c8475fc450..25c4e4991d 100644
--- a/meta/recipes-devtools/perl/perl_5.34.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.3.bb
@@ -22,6 +22,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl\file://CVE-2023-31486-0001.patch\file://CVE-2023-31486-0002.patch\file://0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch\+file://CVE-2025-40909.patch\">"https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2023-31486-0001.patch \
            file://CVE-2023-31486-0002.patch \
            file://0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch \
+           file://CVE-2025-40909.patch \
            "</a>
 SRC_URI:append:class-native = " \
            <a class="moz-txt-link-freetext" href="file://perl-configpm-switch.patch">file://perl-configpm-switch.patch</a> \
@@ -56,6 +57,7 @@ CVE_CHECK_IGNORE:append = " CVE-2023-47038"
 
 do_configure:prepend() {
     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
+    sed -i '1i d_fdopendir=define' ${S}/config_h.SH
 }
 
 do_configure:class-target() {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000FF">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
        Mo: +91 9998906483 <br>
      </font></div>
  </body>
</html>

--------------xsBDl08mroTXDUVuSxIkakVJ--

