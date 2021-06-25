Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.9409.1624635708005874472
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 08:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W64UQLfr;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id y21so4915160plb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iBOhhy92+QrCX10wCL7E0NT1gYBLPLmV8s0he87GVc8=;
        b=W64UQLfrhclbqzYCxg23NBzWELECKlCxs6Ls3zA5sEifzi7CETNGyhfYud0TAHw60F
         K06KyZ8G0cycEAqiNkXXkxU1B6sXXW+/DoPdRd0KF7xwDcoP4so/G7icfIufh/7P77pM
         W/3JT9TbdC9UxbljNoBV0mM0lnfxSLOqPv3A077UA1HW1CgrEjnNLZjwZHGLPN7Pw0+J
         TbmnviEHZhCdSGVohpJT7RvLYzIlVnMuzfKWG17HeMBdq1K+F8GTDru993dBeKZx00NC
         duwjJuCLDioVL5Rh+ev9Rwiczi6e+y3jwDeDsgI1agNvw3Wt6PUHGdFZi84oA+IjhNGe
         XSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iBOhhy92+QrCX10wCL7E0NT1gYBLPLmV8s0he87GVc8=;
        b=YcYMvIyuWTmAAoMirjiWq56lbqyxip459DtI2AzmaJL8/ern+GCYb8Wmq/5OVpTovG
         4cSaK8+sOiAur6WodHc4Ysgs2suoelVpUAaKH3HmfV4ahhWIzyZZjKd2bNsCeV8KDjhY
         +0GCBdYvxjl9Sp0JeJ5YI3HM+nlmI2gu+3cLSvCqt0qqyBB79DCQc9JxsJAjNs69fO1H
         DTaaMzjoaKOOdDTtrz5JNFCTRDYRS90Wh2LMGbmuW88Qd4Q4nFkAyNNhOkUYTTmzeL98
         6CI/cboTYCG4rCcrvr4QPTdoBl9df4Rn24WamOZqlRI2zdZL1tUOTgZ2F69P/kSPEhpw
         5VLw==
X-Gm-Message-State: AOAM530WhcTtqH5vIAuB4DPWzhOChzMK/JUqdr1DJJuJN+UqQD+V0ROY
	Z928acwn8NuDnSwDGGWWXq8=
X-Google-Smtp-Source: ABdhPJyj4y1pX9b5uVbJrRqd2GaFf2cOEYoOsGhiRTHBz08rz8RdtKmHiqm3OqdrplKGaz9xXM9fOg==
X-Received: by 2002:a17:90a:194a:: with SMTP id 10mr21519492pjh.188.1624635707349;
        Fri, 25 Jun 2021 08:41:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9c2:2fa:950b:5920? ([2601:646:9200:a0f0:9c2:2fa:950b:5920])
        by smtp.gmail.com with ESMTPSA id gg5sm5811846pjb.18.2021.06.25.08.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 08:41:46 -0700 (PDT)
Subject: Re: [OE-core][PATCH] busybox: add tmpdir option into mktemp applet
To: Andrej Valek <andrej.valek@siemens.com>,
 openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Peter Marko <peter.marko@siemens.com>
References: <20210622121531.13424-1-andrej.valek@siemens.com>
 <20210625061011.10871-1-andrej.valek@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <bdb3cd51-b2b7-f5d6-4353-287d339dcbc6@gmail.com>
Date: Fri, 25 Jun 2021 08:41:45 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625061011.10871-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/24/21 11:10 PM, Andrej Valek wrote:
> - Make mktemp applet compatible with --tmpdir option in ca-certificate
> update script.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>   .../busybox/0001-mktemp-add-tmpdir-option.patch    | 81 ++++++++++++++++++++++
>   meta/recipes-core/busybox/busybox_1.33.1.bb        |  5 +-
>   2 files changed, 84 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
> 
> diff --git a/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
> new file mode 100644
> index 0000000000..4a1960dff2
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
> @@ -0,0 +1,81 @@
> +From ceb378209f953ea745ed93a8645567196380ce3c Mon Sep 17 00:00:00 2001
> +From: Andrej Valek <andrej.valek@siemens.com>
> +Date: Thu, 24 Jun 2021 19:13:22 +0200
> +Subject: [PATCH] mktemp: add tmpdir option
> +
> +Make mktemp more compatible with coreutils.
> +- add "--tmpdir" option
> +- add long variants for "d,q,u" options
> +
> +Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2021-June/088932.html]
> +

lgtm, this is right approach

> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + coreutils/mktemp.c | 26 ++++++++++++++++++--------
> + 1 file changed, 18 insertions(+), 8 deletions(-)
> +
> +diff --git a/coreutils/mktemp.c b/coreutils/mktemp.c
> +index 5393320a5..05c6d98c6 100644
> +--- a/coreutils/mktemp.c
> ++++ b/coreutils/mktemp.c
> +@@ -39,16 +39,17 @@
> + //kbuild:lib-$(CONFIG_MKTEMP) += mktemp.o
> +
> + //usage:#define mktemp_trivial_usage
> +-//usage:       "[-dt] [-p DIR] [TEMPLATE]"
> ++//usage:       "[-dt] [-p DIR, --tmpdir[=DIR]] [TEMPLATE]"
> + //usage:#define mktemp_full_usage "\n\n"
> + //usage:       "Create a temporary file with name based on TEMPLATE and print its name.\n"
> + //usage:       "TEMPLATE must end with XXXXXX (e.g. [/dir/]nameXXXXXX).\n"
> + //usage:       "Without TEMPLATE, -t tmp.XXXXXX is assumed.\n"
> +-//usage:     "\n	-d	Make directory, not file"
> +-//usage:     "\n	-q	Fail silently on errors"
> +-//usage:     "\n	-t	Prepend base directory name to TEMPLATE"
> +-//usage:     "\n	-p DIR	Use DIR as a base directory (implies -t)"
> +-//usage:     "\n	-u	Do not create anything; print a name"
> ++//usage:     "\n	-d			Make directory, not file"
> ++//usage:     "\n	-q			Fail silently on errors"
> ++//usage:     "\n	-t			Prepend base directory name to TEMPLATE"
> ++//usage:     "\n	-p DIR, --tmpdir[=DIR]	Use DIR as a base directory (implies -t)"
> ++//usage:     "\n				For --tmpdir is a optional one."
> ++//usage:     "\n	-u			Do not create anything; print a name"
> + //usage:     "\n"
> + //usage:     "\nBase directory is: -p DIR, else $TMPDIR, else /tmp"
> + //usage:
> +@@ -72,13 +73,22 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
> + 		OPT_t = 1 << 2,
> + 		OPT_p = 1 << 3,
> + 		OPT_u = 1 << 4,
> ++		OPT_td = 1 << 5,
> + 	};
> +
> + 	path = getenv("TMPDIR");
> + 	if (!path || path[0] == '\0')
> + 		path = "/tmp";
> +
> +-	opts = getopt32(argv, "^" "dqtp:u" "\0" "?1"/*1 arg max*/, &path);
> ++	opts = getopt32long(argv, "^"
> ++	       "dqtp:u\0"
> ++	       "?1" /* 1 arg max */,
> ++	       "directory\0" No_argument       "d"
> ++	       "quiet\0"     No_argument       "q"
> ++	       "dry-run\0"   No_argument       "u"
> ++	       "tmpdir\0"    Optional_argument "\xff"
> ++	       , &path, &path
> ++	);
> +
> + 	chp = argv[optind];
> + 	if (!chp) {
> +@@ -95,7 +105,7 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
> + 		goto error;
> + 	}
> + #endif
> +-	if (opts & (OPT_t|OPT_p))
> ++	if (opts & (OPT_t|OPT_p|OPT_td))
> + 		chp = concat_path_file(path, chp);
> +
> + 	if (opts & OPT_u) {
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.33.1.bb b/meta/recipes-core/busybox/busybox_1.33.1.bb
> index a71ff530cb..4c2bc1106d 100644
> --- a/meta/recipes-core/busybox/busybox_1.33.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.33.1.bb
> @@ -38,6 +38,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
>              file://syslog.cfg \
>              file://unicode.cfg \
> +           file://rev.cfg \
> +           file://pgrep.cfg \
>              file://rcS \
>              file://rcK \
>              file://makefile-libbb-race.patch \
> @@ -45,9 +47,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
>              file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
>              file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
> -           file://rev.cfg \
> -           file://pgrep.cfg \
>              file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
> +           file://0001-mktemp-add-tmpdir-option.patch \
>              "
>   SRC_URI_append_libc-musl = " file://musl.cfg "
>   
> 
> 
> 
> 
> 
