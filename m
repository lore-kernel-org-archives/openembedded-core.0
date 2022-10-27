Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D094ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 18:32:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.1020.1666895553488462226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 11:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FArxZNw2;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: yashinde145@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id c24so2425572pls.9
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IwYXZm/URbMp7HxvNT7ZFwXM6OG0ox4ry1O2HbXX95w=;
        b=FArxZNw201eXbEFnG4pwVfWxN7sH9oUuZIl5ht4CJl9Jbp8LO+xB/rPMBSqEiApsXV
         ylAS2rFlFLP6dxsnJMv8RfdVoXhKou3vtQcK23cY3TLSUeGuI5rdcEKL5V2bLfTAorbi
         giADXNRM51sp7459vRd9TJ3G2wgLeOSn4t0v8U4/gDhHeyDKY/HVfSFVbArdK7KsHiUc
         +48H+U4j8KzaCH4T8ycUqXYjPcbjnrP1VFGJhVoAiT8PUSFWgea9vBTggxYGK05kT9LE
         trwFv2+gASuOIZ7V/Se9A9D3H0GS8u71YHsM/zbT7jGuFIjaQ4enWvMHOaMyXb+KEdM8
         u+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IwYXZm/URbMp7HxvNT7ZFwXM6OG0ox4ry1O2HbXX95w=;
        b=QVr5qs+Vdb7i4ozQD76YKfRGpPTaI6xEGpaZjlTngWLAz/v4Tz+5bkJkYwzR941nLb
         RL/KmcnPtHKDzCNIpFMk/2x8QmXTAy7Ea4k9AIyN7Yw2LLuiFwybI7B9Vjhd8rdGwQa3
         sTVjl2j5baeOzmWJ6Tg1BJywaojscy6ebyeDk6nH2R0m7KUXU4LE244gFNQNeCPbtmqA
         91U7AAx2tA8y2aosLgrOQz5R32rGdApw4k/HQni/6LTOISjKMN6Xy0EkCPgHHcU7zBdd
         X466SnaSEaTYADJPS85cvATw5JsBTzoycVx/j8lftoKqqCJW5b3SXdD+K8/JMceMTENO
         i9BQ==
X-Gm-Message-State: ACrzQf19Qpw/7PAbtI65eyYxx02Xs+XnDQdMxvKbOjUar+81YTVzBLTO
	b4owvVn7Y4hJIDVKZKS19Evo4/nesT8Ct++zZ80=
X-Google-Smtp-Source: AMsMyM5lfML81vnELpQjSmkrfmgzjREx2XloxjlHZak/h9Hqm121ah/mv/6OnXlM51Qj9WzJvr94n4R4/aa7kAGbqOQ=
X-Received: by 2002:a17:90b:4a09:b0:20c:316d:e58b with SMTP id
 kk9-20020a17090b4a0900b0020c316de58bmr11708128pjb.217.1666895552575; Thu, 27
 Oct 2022 11:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221025091832.535612-1-yashinde145@gmail.com> <be23f9e3-1527-df63-938f-6611de6b242f@windriver.com>
In-Reply-To: <be23f9e3-1527-df63-938f-6611de6b242f@windriver.com>
From: Yash Shinde <yashinde145@gmail.com>
Date: Fri, 28 Oct 2022 00:02:20 +0530
Message-ID: <CALDccsE8H+vjnkyi87zXXtPFDR2KyRAcBzCkzCFEg8T8MRrv9g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] glibc: stable 2.35 branch updates.
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, 
	shivams@gmail.com, sundeep.kokkonda@gmail.com
Content-Type: multipart/alternative; boundary="00000000000049fdf505ec085de7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 18:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172198

--00000000000049fdf505ec085de7
Content-Type: text/plain; charset="UTF-8"

Yes, I will try to post the future updates 2 weeks before the given build
date. This was the first time I was working on these updates. Please keep
updating us about the timeline of the upcoming updates.

Thanks,
Yash.

On Thu, 27 Oct 2022, 10:50 pm Randy MacLeod, <randy.macleod@windriver.com>
wrote:

> On 2022-10-25 05:18, Yash Shinde wrote:
>
> Below commits on glibc-2.35 stable branch are updated.
> 8d125a1f91 (HEAD -> release/2.35/master, origin/release/2.35/master) elf: Do not completely clear reused namespace in dlmopen (bug 29600)
> f8730697d2 nss: Use shared prefix in IPv4 address in tst-reload1
> 135c29bf9c nss: Fix tst-nss-files-hosts-long on single-stack hosts (bug 24816)
> 767c99850b nss: Implement --no-addrconfig option for getent
> bca80a916e nscd: Drop local address tuple variable [BZ #29607]
> 20152a849b x86-64: Require BMI1/BMI2 for AVX2 strrchr and wcsrchr implementations
> 02aa1f4a5b x86-64: Require BMI2 and LZCNT for AVX2 memrchr implementation
> c85a45acac x86-64: Require BMI2 for AVX2 (raw|w)memchr implementations
> 1523fbedff x86-64: Require BMI2 for AVX2 wcs(n)cmp implementations
> 7e1326c43a x86-64: Require BMI2 for AVX2 strncmp implementation
> 6260de8867 x86-64: Require BMI2 for AVX2 strcmp implementation
> 0161ebf15b x86-64: Require BMI2 for AVX2 str(n)casecmp implementations
> 97ff96b0e1 x86: include BMI1 and BMI2 in x86-64-v3 level
> a6d2e2c192 hppa: undef __ASSUME_SET_ROBUST_LIST
> 562e5b2821 hppa: Fix initialization of dp register [BZ 29635]
> e36aeeaf08 nptl: Add backoff mechanism to spinlock loop
> 4f3c6dcd20 sysdeps: Add 'get_fast_jitter' interace in fast-jitter.h
> a7d5383328 m68k: Enforce 4-byte alignment on internal locks (BZ #29537)
> dee4146cec gconv: Use 64-bit interfaces in gconv_parseconfdir (bug 29583)
> 6fea8e6b94 resolv: Fix building tst-resolv-invalid-cname for earlier C standards
> 649213ae27 nss_dns: Rewrite _nss_dns_gethostbyname4_r using current interfaces
> 4a214c7448 resolv: Add new tst-resolv-invalid-cname
> 519e1b0251 nss_dns: In gaih_getanswer_slice, skip strange aliases (bug 12154)
> ee74c14325 nss_dns: Rewrite getanswer_r to match getanswer_ptr (bug 12154, bug 29305)
> 692fc980eb nss_dns: Remove remnants of IPv6 address mapping
> def97e7f71 nss_dns: Rewrite _nss_dns_gethostbyaddr2_r and getanswer_ptr
> 51b6c3c28b nss_dns: Split getanswer_ptr from getanswer_r
> 492d259ebc resolv: Add DNS packet parsing helpers geared towards wire format
> a333ba1d50 resolv: Add internal __ns_name_length_uncompressed function
> d7c22ec359 resolv: Add the __ns_samebinaryname function
> 83b09a8e86 resolv: Add internal __res_binary_hnok function
> 6e56f918a8 resolv: Add tst-resolv-aliases
> fae10fcb3b resolv: Add tst-resolv-byaddr for testing reverse lookup
> d883d02008 elf: Implement force_first handling in _dl_sort_maps_dfs (bug 28937)
> c15c0f1985 elf: Rename _dl_sort_maps parameter from skip to force_first
> ff344711ea scripts/dso-ordering-test.py: Generate program run-time dependencies
> f4687bb416 elf: Fix hwcaps string size overestimation
> 55a636430b Use __ehdr_start rather than _begin in _dl_start_final
> 61e15f6815 elf: Run tst-audit-tlsdesc, tst-audit-tlsdesc-dlopen everywhere
>
> Thanks Yash.
>
> There are more commits that I expected but what can you do!
> I think this will go into the 4.0.6 since it's only a few days to 4.0.5
> build.
>
> - YP 4.0.5 build date 2022/10/31
> - YP 4.0.5 Release date 2022/11/11
> - YP 4.0.6 build date 2022/12/12
> - YP 4.0.6 Release date 2022/12/23
>
> Next time, we do the update try to send it 2 weeks before the build date
> so on or before Nov 28th.
>
>
> What test results for this update do you have to show Steve?
>
> Please present the results and put them in context by comparing
> them to the previous tests without this update and summarizing
> what you think of any new failures.
>
> Thanks,
>
> ../Randy
>
>
>
>
> Signed-off-by: Yash Shinde <yashinde145@gmail.com> <yashinde145@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index d3cea19f9c..7d7db46c2f 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?= "release/2.35/master"
>  PV = "2.35"
> -SRCREV_glibc ?= "f8ad66a4cab14ed294bf50e7a9eddb73da6cf307"
> +SRCREV_glibc ?= "8d125a1f9145ad90c94e438858d6b5b7578686f2"
>  SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
>
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172125): https://lists.openembedded.org/g/openembedded-core/message/172125
> Mute This Topic: https://lists.openembedded.org/mt/94554674/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

--00000000000049fdf505ec085de7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, I will try to post the future updates 2 weeks before=
=C2=A0the given build date. This was the first time I was working on these =
updates. Please keep updating us about the timeline of the upcoming updates=
.<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"aut=
o">Yash.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 27 Oct 2022, 10:50 pm Randy MacLeod, &lt;<a href=3D=
"mailto:randy.macleod@windriver.com" rel=3D"noreferrer noreferrer noreferre=
r" target=3D"_blank">randy.macleod@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">

 =20
  <div>
    <div>On 2022-10-25 05:18, Yash Shinde wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>Below commits on glibc-2.35 stable branch are updated.
8d125a1f91 (HEAD -&gt; release/2.35/master, origin/release/2.35/master) elf=
: Do not completely clear reused namespace in dlmopen (bug 29600)
f8730697d2 nss: Use shared prefix in IPv4 address in tst-reload1
135c29bf9c nss: Fix tst-nss-files-hosts-long on single-stack hosts (bug 248=
16)
767c99850b nss: Implement --no-addrconfig option for getent
bca80a916e nscd: Drop local address tuple variable [BZ #29607]
20152a849b x86-64: Require BMI1/BMI2 for AVX2 strrchr and wcsrchr implement=
ations
02aa1f4a5b x86-64: Require BMI2 and LZCNT for AVX2 memrchr implementation
c85a45acac x86-64: Require BMI2 for AVX2 (raw|w)memchr implementations
1523fbedff x86-64: Require BMI2 for AVX2 wcs(n)cmp implementations
7e1326c43a x86-64: Require BMI2 for AVX2 strncmp implementation
6260de8867 x86-64: Require BMI2 for AVX2 strcmp implementation
0161ebf15b x86-64: Require BMI2 for AVX2 str(n)casecmp implementations
97ff96b0e1 x86: include BMI1 and BMI2 in x86-64-v3 level
a6d2e2c192 hppa: undef __ASSUME_SET_ROBUST_LIST
562e5b2821 hppa: Fix initialization of dp register [BZ 29635]
e36aeeaf08 nptl: Add backoff mechanism to spinlock loop
4f3c6dcd20 sysdeps: Add &#39;get_fast_jitter&#39; interace in fast-jitter.h
a7d5383328 m68k: Enforce 4-byte alignment on internal locks (BZ #29537)
dee4146cec gconv: Use 64-bit interfaces in gconv_parseconfdir (bug 29583)
6fea8e6b94 resolv: Fix building tst-resolv-invalid-cname for earlier C stan=
dards
649213ae27 nss_dns: Rewrite _nss_dns_gethostbyname4_r using current interfa=
ces
4a214c7448 resolv: Add new tst-resolv-invalid-cname
519e1b0251 nss_dns: In gaih_getanswer_slice, skip strange aliases (bug 1215=
4)
ee74c14325 nss_dns: Rewrite getanswer_r to match getanswer_ptr (bug 12154, =
bug 29305)
692fc980eb nss_dns: Remove remnants of IPv6 address mapping
def97e7f71 nss_dns: Rewrite _nss_dns_gethostbyaddr2_r and getanswer_ptr
51b6c3c28b nss_dns: Split getanswer_ptr from getanswer_r
492d259ebc resolv: Add DNS packet parsing helpers geared towards wire forma=
t
a333ba1d50 resolv: Add internal __ns_name_length_uncompressed function
d7c22ec359 resolv: Add the __ns_samebinaryname function
83b09a8e86 resolv: Add internal __res_binary_hnok function
6e56f918a8 resolv: Add tst-resolv-aliases
fae10fcb3b resolv: Add tst-resolv-byaddr for testing reverse lookup
d883d02008 elf: Implement force_first handling in _dl_sort_maps_dfs (bug 28=
937)
c15c0f1985 elf: Rename _dl_sort_maps parameter from skip to force_first
ff344711ea scripts/dso-ordering-test.py: Generate program run-time dependen=
cies
f4687bb416 elf: Fix hwcaps string size overestimation
55a636430b Use __ehdr_start rather than _begin in _dl_start_final
61e15f6815 elf: Run tst-audit-tlsdesc, tst-audit-tlsdesc-dlopen everywhere<=
/pre>
    </blockquote>
    <p>Thanks Yash.<br>
    </p>
    <p>There are more commits that I expected but what can you do!<br>
      I think this will go into the 4.0.6 since it&#39;s only a few days to
      4.0.5 build.<br>
    </p>
    <p>
      <li style=3D"color:black;margin-top:0in;margin-bottom:0in;vertical-al=
ign:baseline"><span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 4=
.0.5
          build date 2022/10/31</span></li>
      <li style=3D"color:black;margin-top:0in;margin-bottom:0in;vertical-al=
ign:baseline"><span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 4=
.0.5
          Release date 2022/11/11</span></li>
      <li style=3D"color:black;margin-top:0in;margin-bottom:0in;vertical-al=
ign:baseline"><span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 4=
.0.6
          build date 2022/12/12</span></li>
      <li style=3D"color:black;margin-top:0in;margin-bottom:0in;vertical-al=
ign:baseline"><span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 4=
.0.6
          Release date 2022/12/23</span></li>
    </p>
    <p>Next time, we do the update try to send it 2 weeks before the
      build date<br>
      so on or before Nov 28th.</p>
    <p><br>
    </p>
    <p>What test results for this update do you have to show Steve?<br>
    </p>
    <p>Please present the results and put them in context by comparing<br>
      them to the previous tests without this update and summarizing<br>
      what you think of any new failures.<br>
    </p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <pre>

Signed-off-by: Yash Shinde <a href=3D"mailto:yashinde145@gmail.com" rel=3D"=
noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">&lt;yashinde=
145@gmail.com&gt;</a>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/=
glibc/glibc-version.inc
index d3cea19f9c..7d7db46c2f 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D &quot;release/2.35/master&quot;
 PV =3D &quot;2.35&quot;
-SRCREV_glibc ?=3D &quot;f8ad66a4cab14ed294bf50e7a9eddb73da6cf307&quot;
+SRCREV_glibc ?=3D &quot;8d125a1f9145ad90c94e438858d6b5b7578686f2&quot;
 SRCREV_localedef ?=3D &quot;794da69788cbf9bf57b59a852f9f11307663fa87&quot;
=20
 GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/glibc.=
git" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">=
sourceware.org/git/glibc.git</a>&quot;
</pre>
      <br>
      <fieldset></fieldset>
      <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#172125): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172125" rel=3D"noreferrer noreferrer noreferrer nor=
eferrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-co=
re/message/172125</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94554674/3616=
765" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">=
https://lists.openembedded.org/mt/94554674/3616765</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">o=
penembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank=
">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"=
mailto:randy.macleod@windriver.com" rel=3D"noreferrer noreferrer noreferrer=
 noreferrer" target=3D"_blank">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div>

--00000000000049fdf505ec085de7--

