Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.1319.1588273699571014296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 12:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k+0NYx9n;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id b188so6899236qkd.9
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 12:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xLSWxmFlaMJ15HjhvAF8nELQtZZl+SYgYav07RBWRWA=;
        b=k+0NYx9niwKVC1VaZigV0lfFh0Dqgu2BxzD0aD4C8akMB5an4wqcW9496TlBnufpJw
         09e8Uvq8gEu67NouCiuhnl0u1wWHxC1g6LhoJpNXGcRayo5YINEkNA9+/rDJMzGq2ZNN
         H4lnUOOV6mqOKBAJInSBCaJ0Y28YzlSTOXB+ITnFTLolTv82i/LOKz8wYZ4MX/4fsULM
         mKvm9/PI2k23pXN/BzYBkW8UW6bMOfJW8Z7KCyLgJ/SVI4gQD4ABJHPiCQUo0eDw7ww6
         k+nRf1nbnZG7EshurvHrY1sNU/uKDOQNlJLy0PtYcZ2tmQYlhhNQ2sVk6TG3UJXjUSu5
         hm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xLSWxmFlaMJ15HjhvAF8nELQtZZl+SYgYav07RBWRWA=;
        b=Thnjj1VZD2Qkh+bE4on8OsCHRARaQj2Iu3ijayV7xMQ8+OBO96x0CHbzz2Y6tji4xL
         2UciTIYDy9/upgw8VrTgUH+3aZMAydLv1xtMA1oN6tH/AeXO7Tda6oa52myEtaMwpEI2
         Mt+kawc8cR5TeYMwOhJIaeV5GVYTjPnHjdMjDCaLuOQALpnCRmsjHhtQkBa2Wl64d2B0
         tOT0RV4TypXRIUe0wVnV3qEGq8GAA/VcuOaO/Og9KE1RDmQx5IIwFw924Ofqm/gKfhgR
         5yZYvSf4NsK/PVJalorZcsfy1MySlvGvi32G57XDiRy8ZfmfNAmip51TDXntL2UXFe0S
         6PjQ==
X-Gm-Message-State: AGi0PuZu9jZVL1HsoGiBiHQAgp58MJsCwRogEWyFQFUTacTg8FaT3XXd
	QAEzTz/Q7r0QvdVfMm+/wSdQ8O9ExkRgT7+QZyZXvnD6Swk=
X-Google-Smtp-Source: APiQypKjO6uMILbxqXHfwcix7bX159IgwUeRoND+/cg5FaRji69c8q10KAZX26SHVs2P75unJRuVoViTS3IasAKEEUA=
X-Received: by 2002:a37:52c6:: with SMTP id g189mr4857963qkb.17.1588273696897;
 Thu, 30 Apr 2020 12:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200429111356.34973-1-wangmy@cn.fujitsu.com> <20200429111356.34973-2-wangmy@cn.fujitsu.com>
In-Reply-To: <20200429111356.34973-2-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 30 Apr 2020 12:07:49 -0700
Message-ID: <CAMKF1sqfQcLWfaTzHJSZ-mnEpZJXH6CB=cMqSCahG+LiRSxrgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] json-c: upgrade 0.13.1 -> 0.14
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

This is causing a couple of packages to fail so please address them
before we accept this patch.

https://errors.yoctoproject.org/Errors/Build/102058/

On Tue, Apr 28, 2020 at 8:14 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>
> add-disable-werror-option-to-configure.patch
> removed since it is included in 0.14
>
> Make mode changes from autotools to cmake.
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...d-disable-werror-option-to-configure.patch | 45 -------------------
>  .../{json-c_0.13.1.bb => json-c_0.14.bb}      |  9 ++--
>  2 files changed, 3 insertions(+), 51 deletions(-)
>  delete mode 100644 meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
>  rename meta/recipes-devtools/json-c/{json-c_0.13.1.bb => json-c_0.14.bb} (70%)
>
> diff --git a/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch b/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
> deleted file mode 100644
> index 0c20c8458a..0000000000
> --- a/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -json-c: Backport --disable-werror patch to allow compilation under icecc
> -
> -icecc preprocesses source files locally before shipping them off to be compiled
> -on remote hosts. This preprocessing removes comments, including /* fallthough */
> -comments in switch statements that normally prevent an implicit-fallthrough
> -warning, see https://github.com/icecc/icecream/issues/419
> -
> -Rather than turning off -Werror, the upstream project has implemented a
> -configure option, --disable-werror, in response to Ross's
> -https://github.com/json-c/json-c/issues/489
> -
> -This patch from
> -https://github.com/json-c/json-c/commit/21c886534f8927fdc0fb5f8647394f3e0e0874b8
> -
> -Upstream-Status: Backport [Not yet released]
> -Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> -
> -From 21c886534f8927fdc0fb5f8647394f3e0e0874b8 Mon Sep 17 00:00:00 2001
> -From: Pierce Lopez <pierce.lopez@gmail.com>
> -Date: Sun, 9 Jun 2019 10:52:08 -0400
> -Subject: [PATCH] build: add --disable-werror option to configure
> -
> -to omit -Werror compiler option
> ----
> - configure.ac | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 272ea6af9c..798fd5b747 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -165,7 +165,12 @@ AS_IF([test "x$enable_Bsymbolic" = "xcheck"],
> - AS_IF([test "x$enable_Bsymbolic" = "xyes"], [JSON_BSYMBOLIC_LDFLAGS=-Wl[,]-Bsymbolic-functions])
> - AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
> -
> --AX_APPEND_COMPILE_FLAGS([-Wall -Werror -Wcast-qual -Wno-error=deprecated-declarations])
> -+AC_ARG_ENABLE([werror],
> -+    AS_HELP_STRING([--disable-werror], [avoid treating compiler warnings as fatal errors]))
> -+
> -+AS_IF([test "x$enable_werror" != "xno"], [AX_APPEND_COMPILE_FLAGS([-Werror])])
> -+
> -+AX_APPEND_COMPILE_FLAGS([-Wall -Wcast-qual -Wno-error=deprecated-declarations])
> - AX_APPEND_COMPILE_FLAGS([-Wextra -Wwrite-string -Wno-unused-parameter])
> - AX_APPEND_COMPILE_FLAGS([-D_GNU_SOURCE])
> -
> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.14.bb
> similarity index 70%
> rename from meta/recipes-devtools/json-c/json-c_0.13.1.bb
> rename to meta/recipes-devtools/json-c/json-c_0.14.bb
> index 522879f21f..15226d2a3f 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.14.bb
> @@ -5,18 +5,15 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
>
>  SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
> -           file://add-disable-werror-option-to-configure.patch \
>             "
> -SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
> -SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
> +SRC_URI[md5sum] = "72cbb065b43376d825cd521d115ae1f6"
> +SRC_URI[sha256sum] = "b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb35005a794f30c6870"
>
>  UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>  UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
>
>  RPROVIDES_${PN} = "libjson"
>
> -inherit autotools
> -
> -EXTRA_OECONF = "--disable-werror"
> +inherit cmake
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
>
> 
