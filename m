Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web10.1619.1588048426856922916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 21:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lLaPJ0VK;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: samuli.piippo@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id b18so18996804ilf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 21:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9qzQtbQPy7mmhzCzr9MwWLkBPUQtTTndCKaIz6ExEXw=;
        b=lLaPJ0VKjw+xg0+csOWo9vXT2/qfY1rSrPQIh+UUd1xm0vpiFvVy/F6ED6kc/K6yWm
         bCm1B8fIq/AQeRUOKONk0s4G63XgQLwidHsrjmljWnmbgNBTKqe4xAGjJ363oqMQ0MOF
         zb3UUfcUi/j78MLdhNduLWoqT2K8Ahz4BlSf8Ot+7oPQ3GchVJ3c8n696Lz7uurJavIA
         qqsb5tUVC9tmwm+kzhcDSS5gy3Wq0zsN8XdKOoaYEj9YYMSbN0kGKaJO67KPu8aOdzoj
         Q2X72UhAqc6u7Uh5UGD4cM+lG2fyuGW1kNrUr++DrRNs0mt5uYVVEZhxDdfqJJF0T0eg
         X+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9qzQtbQPy7mmhzCzr9MwWLkBPUQtTTndCKaIz6ExEXw=;
        b=WLfuoo9XzXC1Wtpg2FTrl7H4HaiYWzFFW5ibzGcfu9d/tH9sOZxSkNcxoRUXtOWtTK
         705gDIPOUf9vs71q+tlObtddrjTwJudGqEoO2xCTfuVKtaIVZGlQ9s9BR64QXO+XHxLJ
         7nVApE/qn9BXG5foOvJdkCrfH2xMqTlX/hM6zz8QSbBX6+UsbIqk6QlFc5vzCJ7CZ4SH
         Wfui+TSoFfBP6CzI9lUCKPiEMa4Gib80grQF101jz5PCVcPoG6VLA+ZwtGGw9QyZ2rNR
         DQJwV0HQV9L0aXLfq53TxK0Mms7KqKc+Ma4uqEb17VkKJoL5WCjeZT9NUZpPlGC7YDY0
         8CZA==
X-Gm-Message-State: AGi0PuYXSy9p06AFudFbl9XlJxw1iJkLkUj5RDnme+HmNvPfXQmzAuU1
	Y6VE/Dw3Yt0CYf9ZCRz2o/BDFvWrVfGkkkeTeeU=
X-Google-Smtp-Source: APiQypLreCxXA9u5iZA5ckpJYehmNOmqKcjIdzEGH/XjLjnG7vz9uc8H+O3a3JDqKW0NTxJVcd28ItvF2JCq05sKkNQ=
X-Received: by 2002:a92:d18f:: with SMTP id z15mr25632756ilz.226.1588048426207;
 Mon, 27 Apr 2020 21:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200427131328.12044-1-samuli.piippo@qt.io> <ef0f940014c41b2cd66e4e74c85fea6389f66fe1.camel@linuxfoundation.org>
 <CABXoSoX--qaiLGJM0MJ2Uo=jZDd+Srav+-xaXb60PqtyVOm=Uw@mail.gmail.com> <a7b33d1d-49ef-c20d-c8e8-32e9d155ec1b@gmail.com>
In-Reply-To: <a7b33d1d-49ef-c20d-c8e8-32e9d155ec1b@gmail.com>
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Date: Tue, 28 Apr 2020 07:33:34 +0300
Message-ID: <CABXoSoXSoaY5dg9p=CNaSmnMWNSOJHzG+PpXjZjqzpEPXrrA9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: make sure mingw builds use mingw32-w64 configs
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Samuli Piippo <samuli.piippo@qt.io>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Apr 2020 at 23:20, Joshua Watt <jpewhacker@gmail.com> wrote:
>
>
> On 4/27/20 12:35 PM, Samuli Piippo wrote:
>
> On Mon, 27 Apr 2020 at 17:51, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-04-27 at 16:13 +0300, Samuli Piippo wrote:
>
> meta-mingw is using Mingw-w64 but the host triplet does not match
> the expected pattern. config/os/mingw32-w64 enables more features
> that were not working with mingw32.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
>  ...nfig-os-mingw32-w64-for-mingw-builds.patch | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-con=
fig-os-mingw32-w64-for-mingw-builds.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtool=
s/gcc/gcc-9.3.inc
> index b0411078d3..4c8275bf2a 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
> @@ -67,6 +67,7 @@ SRC_URI =3D "\
>             file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_=
elf.patch \
>             file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintai=
nin.patch \
>             file://0039-process_alt_operands-Don-t-match-user-defined-reg=
s-o.patch \
> +           file://0040-Always-use-config-os-mingw32-w64-for-mingw-builds=
.patch \
>  "
>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>  SRC_URI[sha256sum] =3D "71e197867611f6054aa1119b13a0c0abac12834765fe2d81=
f35ac57f84f742d1"
> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-=
mingw32-w64-for-mingw-builds.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040=
-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
> new file mode 100644
> index 0000000000..5a167f252c
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32=
-w64-for-mingw-builds.patch
> @@ -0,0 +1,36 @@
> +From 052f7e5db0d793155015530b639c4e42d37eb7eb Mon Sep 17 00:00:00 2001
> +From: Samuli Piippo <samuli.piippo@qt.io>
> +Date: Fri, 23 Aug 2019 10:10:43 +0300
> +Subject: [PATCH] Always use config/os/mingw32-w64 for mingw builds
> +
> +Make sure we use the w64 version of the configs, since that's what
> +meta-mingw is using.
> +
> +Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> +---
> + libstdc++-v3/configure.host | 12 ++----------
> + 1 file changed, 2 insertions(+), 10 deletions(-)
> +
> +diff --git a/libstdc++-v3/configure.host b/libstdc++-v3/configure.host
> +index 155a3cdea..adbda8784 100644
> +--- a/libstdc++-v3/configure.host
> ++++ b/libstdc++-v3/configure.host
> +@@ -277,16 +277,8 @@ case "${host_os}" in
> +     os_include_dir=3D"os/hpux"
> +     ;;
> +   mingw32*)
> +-    case "$host" in
> +-      *-w64-*)
> +-        os_include_dir=3D"os/mingw32-w64"
> +-        error_constants_dir=3D"os/mingw32-w64"
> +-        ;;
> +-      *)
> +-        os_include_dir=3D"os/mingw32"
> +-        error_constants_dir=3D"os/mingw32"
> +-        ;;
> +-    esac
> ++    os_include_dir=3D"os/mingw32-w64"
> ++    error_constants_dir=3D"os/mingw32-w64"
> +     OPT_LDFLAGS=3D"${OPT_LDFLAGS} \$(lt_host_flags)"
>
> It might make things a bit more obvious and upstreamable to just change
>       *-w64-*)
> to
>       *-w64*)
> if I understand correct?
>
> With meta-mingw, the host triplet is actually either
> i686-pokysdk-mingw32 or x86_64-pokysdk-mingw32, depending on bitness
> in the SDKMACHINE value.
>
> Hmm, it does indeed look like we are not correctly setting the host in a =
way it can be detected by GCC. It's a little surprising this hasn't caused =
any actual problems (at least up to this point)... is this something new to=
 gcc 9.3, and do we have any idea why the AB MinGW tests aren't seeing any =
problems?
>
> Either way, it would probably be better to figure out a way to make the h=
ost look correct in meta-mingw if at all possible.
>
> Your commit message is also a little confusing because the first few time=
s I read it, I thought we were configuring for 64-bit when 32-bit is desire=
d, but based on the current GCC code being replaced and the value of the ho=
st-triplets, it would seem to be the opposite (we are getting 32-bit when 6=
4-bit is desired).

It's not actually the bitness that GCC is looking for here but the
version of the MinGW. The MingGW-w64 is a fork of the original MinGW
and can be used for both 32- and 64-bit builds. With the os/mingw32
config, GCC is using subset of the features that are available in
os/mingw32-w64, so builds still work although perhaps not always
optimally.

I don't see clear way to change the host value in meta-mingw without
breaking other layers and recipes. Only part that could be changed is
the -mingw32 part (HOST_OS), but recipes that do mingw specific things
already rely on that for the overrides.
