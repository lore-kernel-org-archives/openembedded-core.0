Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web12.29861.1609048970126666494
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 22:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JvcRdc/3;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id a4so3693820qvd.12
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 22:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ocfA6zi4KYzFFVh+VT+bJO/JA2jaoNZSbZjoMV4Un0g=;
        b=JvcRdc/3h8oRi6GMl0RnD5xs+vlzUphLjwA9qhZcWY95UduW4pBfqr2yOxICvezOZY
         obD3/CJDv36JkYdTcyUuz9ikrfwikmsdzwvjx8EiYTgOapvdLloASBOJeh1kUiYdU+hz
         bumQiXwyl14gy5W0DJWuOPNAr7pMSOVGWnzy/Tg535Kr+hcysYaBJ7yxphxu5hWMVZCm
         V89FTzhi3KidVHH+Dtg/ZVFBbLT/XL8mnSUNGiUm+d8Of8hDS61tsisByCaMtIlHs9+J
         W0cG8g5BLY0tJBNNIk3Cugmjs34nx68EM//qevDPjmtHaKI1+kaOqae1hS4fsG5p3LGk
         6w/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ocfA6zi4KYzFFVh+VT+bJO/JA2jaoNZSbZjoMV4Un0g=;
        b=GLy3upavRu3FSv3h0STngbCxLeX4BkM3cK4x/MFmkhMN7JMGOs2tlSLlCZzGq/O7y5
         jB1yS57jI2bjW0XCQkp249FXpeE2C8u5vKtuYsS1XKDR/qmbUeGIoKN5IKVIVbMGOoV0
         YGPc+KIqeIinhuWfl4E8awH5sTkBO9utLlrId4+d/CLSx7kYz/DNcuign/frZTcQ9sEc
         2bPDPoyKx4YoLCJHoee19B0HqpL5Ken+7g+GZqr1S9KTZca+JMKQ/h83JtHyHYIPOh+V
         hDveMdLpZXTap1tnZ5/wJsDQq9YpN57OwyT8AvrBGt64O6GvgwVFVLssHUYqCXyrqHpW
         1/xA==
X-Gm-Message-State: AOAM531Hw9XNSH4I30bamimKkrPzxXfSV2/nYxREQFVNnu+3y9FLF0yp
	/FX8dwPB3jNh1Ry+KYx8W6NJu1jCW88TVX4i26s=
X-Google-Smtp-Source: ABdhPJzeZrlEHlGAokIX5+fhImh804BWTNRD4Pid9Q34QNsL996Vto5P3WpK7DaqgWyHhH70rXpTf1nCD3zoTk2RKO4=
X-Received: by 2002:ad4:4431:: with SMTP id e17mr41342616qvt.21.1609048969185;
 Sat, 26 Dec 2020 22:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20201226092732.52323-1-alex.kanavin@gmail.com> <20201226092732.52323-35-alex.kanavin@gmail.com>
In-Reply-To: <20201226092732.52323-35-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 26 Dec 2020 22:02:23 -0800
Message-ID: <CAMKF1sp=O9JCsc3gDJ8Oqh2uXCtVjUZG6kT0syz3sQT7ijVLZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/48] ell: upgrade 0.33 -> 0.35
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

regresses iwd builds see

https://errors.yoctoproject.org/Errors/Details/540274/

On Sat, Dec 26, 2020 at 1:29 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...l-add-missing-include-in-dhcp-server.patch | 23 ++++++++++++++++
>  .../ell/0001-pem.c-do-not-use-rawmemchr.patch | 27 +++++++++++++++++++
>  .../ell/{ell_0.33.bb => ell_0.35.bb}          |  7 +++--
>  3 files changed, 55 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
>  create mode 100644 meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
>  rename meta/recipes-core/ell/{ell_0.33.bb => ell_0.35.bb} (73%)
>
> diff --git a/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch b/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
> new file mode 100644
> index 0000000000..2460d26bdc
> --- /dev/null
> +++ b/meta/recipes-core/ell/ell/0001-ell-add-missing-include-in-dhcp-server.patch
> @@ -0,0 +1,23 @@
> +From dd350f4e2258b5a638bc8fb26a6193147902d292 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?=C3=89rico=20Nogueira?= <ericonr@disroot.org>
> +Date: Mon, 30 Nov 2020 18:40:33 -0300
> +Subject: [PATCH] ell: add missing include in dhcp-server.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + ell/dhcp-server.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/ell/dhcp-server.c b/ell/dhcp-server.c
> +index c983ed4..144e83e 100644
> +--- a/ell/dhcp-server.c
> ++++ b/ell/dhcp-server.c
> +@@ -24,6 +24,7 @@
> + #include <config.h>
> + #endif
> +
> ++#include <linux/types.h>
> + #include <net/ethernet.h>
> + #include <sys/socket.h>
> + #include <arpa/inet.h>
> diff --git a/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch b/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
> new file mode 100644
> index 0000000000..f0ce6f1364
> --- /dev/null
> +++ b/meta/recipes-core/ell/ell/0001-pem.c-do-not-use-rawmemchr.patch
> @@ -0,0 +1,27 @@
> +From 277e1eca67fcc23cb31be7b826d83a19d9b89bd2 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 22 Dec 2020 10:30:54 +0000
> +Subject: [PATCH] pem.c: do not use rawmemchr()
> +
> +This is a glibc-only function, and causes build failures with
> +alternative libc implementations such as musl.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + ell/pem.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ell/pem.c b/ell/pem.c
> +index 790f2c2..237ae02 100644
> +--- a/ell/pem.c
> ++++ b/ell/pem.c
> +@@ -224,7 +224,7 @@ static uint8_t *pem_load_buffer(const void *buf, size_t buf_len,
> +
> +               /* Check that each header line has a key and a colon */
> +               while (start < end) {
> +-                      const char *lf = rawmemchr(start, '\n');
> ++                      const char *lf = memchr(start, '\n', end - start);
> +                       const char *colon = memchr(start, ':', lf - start);
> +
> +                       if (!colon)
> diff --git a/meta/recipes-core/ell/ell_0.33.bb b/meta/recipes-core/ell/ell_0.35.bb
> similarity index 73%
> rename from meta/recipes-core/ell/ell_0.33.bb
> rename to meta/recipes-core/ell/ell_0.35.bb
> index 2fa05104fb..ccc54b5ff7 100644
> --- a/meta/recipes-core/ell/ell_0.33.bb
> +++ b/meta/recipes-core/ell/ell_0.35.bb
> @@ -13,8 +13,11 @@ DEPENDS = "dbus"
>
>  inherit autotools pkgconfig
>
> -SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "d9e40e641164150394b74b719b9726fc734f24b2cde679cf5f3be6915c34eded"
> +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
> +           file://0001-ell-add-missing-include-in-dhcp-server.patch \
> +           file://0001-pem.c-do-not-use-rawmemchr.patch \
> +           "
> +SRC_URI[sha256sum] = "2bfe9da7781f65f1cb1595a5a068a3ae74d4b68b74f287c6f0c892cfe623913f"
>
>  do_configure_prepend () {
>      mkdir -p ${S}/build-aux
> --
> 2.29.2
>
>
> 
>
