Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id F315D731CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 19:20:54 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id f81so1926365iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FuwULWN9vfSlaBi5rfgdsUvX26Xm4UVP23UdXVDScQs=;
	b=D3Gmx7VKaLEiDaaknnkftYOHMbdal9r235bcEcI7VCJNOnQ60anDf9cHHb6DW0aLCK
	7kKV7gsgL1uG4rtN3i0mzhKUspO9hU/xD/M4XeNUQ8SndZ94XQYvbub7n6nNgfmG5XlK
	oB7kxM22aQ7UV22da7IhOTLHSvcm8Jm6AQlUmjReWuSOgKqn4WTFLYZsg6pj+xRz8Gmk
	v5jDltlHk4PqT+yrIlk+E4QxHhrWMlH5gyl78Z2kfEvTyPtO1K1v/+zGAX30nNp/3oBq
	dtoDQTo9SWL+s3ZISGd9pXGBHGIN/ZHpYMIucSPn/XLThPAwkvoCPGWHXfQr5nOn7fSa
	SMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FuwULWN9vfSlaBi5rfgdsUvX26Xm4UVP23UdXVDScQs=;
	b=AYaj749Y51iZsJw6uYDVrfq1/LCXG9q4KRe4ldrrPVA58mQh4X1OMRss3FCsekiXeT
	43J/IcEnBToPRZJYuXO3v1jxtolHZdsP2eIqSPlMyS6UO3+vJ3WZsQL5CbQUZP6tA8Cr
	IA7tlI/slNa3qqJGYZvblkP8eNZ8smC6tR601JT8Vp5Uqo41GXBDujYeC1xfWrPKdnms
	Rjfots3UCIpDSQSZnVMaUThyfTw2TjrV1OJBTd5jiWFnGBMPbNcRdHuOd1Ek9MLcJpZT
	uLQn4a1yi86AXLcvBZsw8D4tGI+lxADjeN1ss0Qu8qfDFz+w4hri8ghh9dXEPDMLkIeb
	JEPA==
X-Gm-Message-State: AG10YOS5CMgxz+cjCboPOFoZvIyZ9OlK86bkBPcd6SsFyZuGf/AfDBI3YUS6d3JIeW47d49La4wJlQbNSOWxNA==
X-Received: by 10.107.9.224 with SMTP id 93mr28788267ioj.112.1453922454968;
	Wed, 27 Jan 2016 11:20:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Wed, 27 Jan 2016 11:20:25 -0800 (PST)
In-Reply-To: <be19e4a4529ff007c210a60768874e7c37cab02f.1453882496.git.hongxu.jia@windriver.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
	<be19e4a4529ff007c210a60768874e7c37cab02f.1453882496.git.hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jan 2016 14:20:25 -0500
Message-ID: <CAMKF1sr9Hwv5zyPnJoRJdvSA_sgAG7Nzg6fiXP91MGsk7NU_9A@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] base/bbclass: disallow appending the compile options in debugging info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 19:20:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 27, 2016 at 3:45 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> In order to drop TMPDIR in debugging info, add option '-gno-record-gcc-switches'
> to disallow appending the compile options to the DW_AT_producer attribute in
> DWARF debugging information.

this is vital information when debugging field issues. What is the
purpose of this ?

>
> Compile with '-fdebug-prefix-map':
> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
> ...
> | <0><5e>: Abbrev Number: 1 (DW_TAG_compile_unit)
> |    <5f>   DW_AT_producer    : (indirect string, offset: 0xbb): GNU C99 5.3.0 -m32
> -march=core2 -mtune=core2 -msse3 -mfpmath=sse -mpreferred-stack-boundary=4 -g -O2
> -std=gnu99 -fgnu89-inline -fdebug-prefix-map=/buildarea/raid0/hjia/build-20160119-
> yocto-buildpath/tmp/work/core2-32-pokymllib32-linux/lib32-glibc/2.22-r0/git=/usr/src/glibc
> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math -ftls-model=initial-exec
> |    <64>   DW_AT_name        : (indirect string, offset: 0xb9): init.c
> |    <68>   DW_AT_comp_dir    : (indirect string, offset: 0x60): /usr/src/glibc/csu
> ...
>
> Compile with '-gno-record-gcc-switches' and '-fdebug-prefix-map':
> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
> ...
> |    <5f>   DW_AT_producer    : (indirect string, offset: 0x1b): GNU C99 5.3.0
> |    <64>   DW_AT_name        : (indirect string, offset: 0xb9): init.c
> |    <68>   DW_AT_comp_dir    : (indirect string, offset: 0x6e): /usr/src/glibc/csu
> ...
>
> [YOCTO #7058]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 3159587..e05552c 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -91,6 +91,7 @@ def debug_prefix_map(d):
>          buildsrc = d.getVar("S", True)
>          targetsrc = "/usr/src/%s" % d.getVar("BPN", True)
>          opts += " -fdebug-prefix-map=%s=%s" % (buildsrc, targetsrc)
> +        opts += " -gno-record-gcc-switches"
>      return opts
>
>  TARGET_CFLAGS += "${@debug_prefix_map(d)}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

