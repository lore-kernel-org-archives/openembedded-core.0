Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD789CEACEA
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 16:54:20 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.86828.1727801659554687842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 09:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EGzzzbKX;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2780827dbafso2781890fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727801659; x=1728406459; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3bNUfK6Ru7CJx1xroLwkfDrZuMsHmPnvjxTAAP6xKQ=;
        b=EGzzzbKXG4eiaWbzRyWh3zG0pvVTAgxesiiURGu9KHfzFFte21XJQZGWJKw8pBIOKp
         ifJmUd+Mpz1casRV5rOaJwBuduVSSlFlVKG20uCZY/FzbzKDgKEXF8caBBzlQpdoIocI
         LHGGeOC9UeOyTAZJiCjg0nKKXKj7AKEHJhuEF4/LlUkM/47QAW9xsi4ISoa61GLmftaa
         H7yIYniUD+0JDDjDNDVzw4aa5KPLcYcezmUQJKUHW9xhA9NIMq4gnMibSZZ/BYjPWATD
         NnxDknLKc0Wd7Ix7zLN9WSaxQA7Ekn9lSuCxeD0TMMdihEpKyejve7BETaEVqMWS6epp
         Ej3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801659; x=1728406459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3bNUfK6Ru7CJx1xroLwkfDrZuMsHmPnvjxTAAP6xKQ=;
        b=TQMEU7Wi0v4t/7fz4f/OAlWpnHPNYM1WFmqYksRhVlNJzEozlCj0N5vd4gr4XnJINI
         ivgdpmdONYHLsVkQ4pJkS2yGUlRI8Yo9GU2+jgENsbbhyMfZAcZ626yy3+VuqpeEeRi1
         VmrwjQUCSGOcJJyV6bH8bgVZ9onmS4Dt6IJGUi9yp0tev1MMCYOjZn59O7GpFMkzqP6R
         y0VS2fCGnw1B83Jm4TVfcwUpeFNF09H+4F67x9sUgyf4n5VhFGhfUGFfNwA6o4vfiqU6
         BPMSqTgtrCi2QE7bEmYASoaW/xlNzNjPcEnr7eXDnwkVNl97WWHsiRka6psM1ce8nfJN
         Hunw==
X-Gm-Message-State: AOJu0YzMVWhZMq5z7DnBBJ7xbXJ+1RteHqLRG5l9xhOks+9hZB+e0wVW
	gvpPqzW3kSYoD6kwMnYRNu7ro1kRGCRX2jqrhW0qBpwzvXawnsyiQ5LZ5KUz8FTjxbTY7rbtNcW
	Ye12XXSFJ/xnbVxECflHnLIEEryc=
X-Google-Smtp-Source: AGHT+IEqSjyZksucev8odMQTuS2lNRFF8kY9I1HyiN3otPNjCb+7Oh7bSKwGD8+cYPXBXgolINXhqsE1QTd6J+7yh6g=
X-Received: by 2002:a05:6870:a708:b0:254:994b:5e6b with SMTP id
 586e51a60fabf-287891d8e0bmr61621fac.44.1727801658806; Tue, 01 Oct 2024
 09:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241001120107.365354-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20241001120107.365354-1-Deepthi.Hemraj@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Oct 2024 09:53:53 -0700
Message-ID: <CAMKF1srGKw_nmdFOa=8c-O9jvgRCy6JTA4_R+z4ktBYKssC8bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gdb: Upgrade 15.1 -> 15.2
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 16:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205177

lgtm

On Tue, Oct 1, 2024 at 5:01=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> GDB 15.2 brings the following fixes:
>  * PR gdb/31727 (-exec-next fails in mingw (infrun.c:2794: internal-error=
: resume_1: Assertion `pc_in_thread_step_range (pc, tp)' failed))
>  * PR c++/31900 (libstdc++-prettyprinters/debug.cc print redirected fails=
 since gdb-14-branchpoint-2123-g4e417d7bb1c)
>  * PR python/31946 (sys.exit from Python no longer exits the GDB process)
>  * PR record/31971 (Loading a saved record file asserts if we try to exec=
ute the inferior)
>  * PR gdb/32005 (frv_current_sos doesn't set solib::lm_info)
>  * PR exp/32015 (GDB crashes while printing large D array)
>  * PR gdb/32025 (Fatal error when the disassemble command is interrupted =
with SIGINT)
>  * PR gdb/32143 ([15 Regression] arch/amd64.c:71: internal-error: amd64_c=
reate_target_description: Assertion `!is_x32' failed)
>  * PR symtab/32158 ([gdb/symtab] enum class enumerator has incorrect pare=
nt in cooked index)
>  * PR symtab/32160 ([gdb/symtab] Parent map: die parent or scope parent?)
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/conf/distro/include/time64.inc                             | 2 +-
>  .../{gdb-cross-canadian_15.1.bb =3D> gdb-cross-canadian_15.2.bb}  | 0
>  .../gdb/{gdb-cross_15.1.bb =3D> gdb-cross_15.2.bb}                | 0
>  meta/recipes-devtools/gdb/gdb.inc                               | 2 +-
>  meta/recipes-devtools/gdb/{gdb_15.1.bb =3D> gdb_15.2.bb}          | 0
>  5 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_15.1.bb =3D> gdb-cr=
oss-canadian_15.2.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_15.1.bb =3D> gdb-cross_15.2.=
bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb_15.1.bb =3D> gdb_15.2.bb} (100%)
>
> diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/inclu=
de/time64.inc
> index 9d556bac16..f939f9b7c7 100644
> --- a/meta/conf/distro/include/time64.inc
> +++ b/meta/conf/distro/include/time64.inc
> @@ -49,5 +49,5 @@ INSANE_SKIP:append:pn-strace =3D " 32bit-time"
>  INSANE_SKIP:append:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
=3D " 32bit-time"
>  #gcc-cross-canadian-arm-14.1.0-r0 do_package_qa: QA Issue: xxx/x86_64-oe=
sdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/14.1.0/=
plugin/gengtype uses 32-bit api 'ctime'
>  INSANE_SKIP:append:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
 32bit-time"
> -#gdb-cross-canadian-arm-15.1-r0 do_package_qa: QA Issue: xxx/x86_64-oesd=
k-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gdb uses 32-bit a=
pi 'lstat'
> +#gdb-cross-canadian-arm-15.2-r0 do_package_qa: QA Issue: xxx/x86_64-oesd=
k-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gdb uses 32-bit a=
pi 'lstat'
>  INSANE_SKIP:append:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
 32bit-time"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_15.1.bb b/meta/=
recipes-devtools/gdb/gdb-cross-canadian_15.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_15.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_15.2.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_15.1.bb b/meta/recipes-d=
evtools/gdb/gdb-cross_15.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_15.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_15.2.bb
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
> index 6aa9dced86..ff0db68da7 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -14,4 +14,4 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>             file://0007-Define-alignof-using-_Alignof-when-using-C11-or-n=
ewe.patch \
>             file://0001-Fix-Wenum-constexpr-conversion-in-enum-flags.h.pa=
tch \
>             "
> -SRC_URI[sha256sum] =3D "38254eacd4572134bca9c5a5aa4d4ca564cbbd30c369d881=
f733fb6b903354f2"
> +SRC_URI[sha256sum] =3D "83350ccd35b5b5a0cba6b334c41294ea968158c573940904=
f00b92f76345314d"
> diff --git a/meta/recipes-devtools/gdb/gdb_15.1.bb b/meta/recipes-devtool=
s/gdb/gdb_15.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_15.1.bb
> rename to meta/recipes-devtools/gdb/gdb_15.2.bb
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205160): https://lists.openembedded.org/g/openembedde=
d-core/message/205160
> Mute This Topic: https://lists.openembedded.org/mt/108756318/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

