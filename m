Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D6D1378372
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 17:03:56 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y192so5700215pgd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 10:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lOZcYjkBaD2tqo/Y1tWMfBG/JAKuiu09S+QYwWftsSc=;
	b=rkBqLsnjUDAgQyTx1zQzWDfMszJ7Pt7neF/FFdnMUMvV2Onad7Pnmg3mHlfz9FHx2N
	sW/RoCgb/7NmnJIbHVWgKPNXFwjjvLFJ5eIC3RTIotf3lbAvgjA83lvjgCgfBQ9NbpMF
	kffcowuHQEsGMo9T7K6bfwyT3a5UvYwKZZ03vhk3yiQ0oqnLu1fUAzkL/bIGMKsDNW1X
	KLzuSSR1ChdsgdKDurcxk0ws3QzF8uoCulG9K1qIaUbaqwZfuQj5/kixBU0Mzaq/Ox4i
	6PRqTA9ch5vh8gmMkbygQXFx4xZ+atc89oPaC1BIXwr+yPHjXVoCMTKQpCDnx/lHeAbT
	a0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lOZcYjkBaD2tqo/Y1tWMfBG/JAKuiu09S+QYwWftsSc=;
	b=Y4PQyQBcq7BDFnOghk4vP8bM/y76lda+RnxbrltJr7jLpH3a6RPfeXyI4yMWzQfk+L
	NJlSJ9jjTMgjOkYIDYocjVdSA937S1A0fNe1WebTXQE3mkKRvO5Zz+BTnsDayk7SNUpB
	PSGw5VikCTUEyXMiAbRoki5xv+yQ2uqRVLjYxSOZF3hGRz/sJ+CLCwN0aX5TOleXntii
	vRDtoQZG0tu9AMQ+gJapeioV5zuS9zXsmgr7f9VocYMZg77IygNz8Ul8Fr8HyJ4hNjql
	Z3yN4DGvETmjQ3nDZirOudP694XP6C0cPpPU6UVEubwjR9DzGEg5senZrrr5LRidK9Ih
	tPfg==
X-Gm-Message-State: AHYfb5jong0gIGf1pDgGPSOWv/j/q8P/Pev5xTkBbbXygGiAffQonbow
	yKdVr3sr9ZZ8GlE87ku9Pukqw2lOow==
X-Received: by 10.99.133.65 with SMTP id u62mr1506381pgd.100.1502903037748;
	Wed, 16 Aug 2017 10:03:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 16 Aug 2017 10:03:27 -0700 (PDT)
In-Reply-To: <1502884151-17561-1-git-send-email-jussi.kukkonen@intel.com>
References: <1502884151-17561-1-git-send-email-jussi.kukkonen@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2017 10:03:27 -0700
Message-ID: <CAMKF1sor8S8Sdmp9OGDVqj+MeziGfT+WzZK3uS-uu30vjA-s-A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: Remove musl patch that's no longer needed
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
X-List-Received-Date: Wed, 16 Aug 2017 17:03:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 4:49 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> libc headers now have a backported patch that fixes this.
>

Yes right.
thanks for taking care of this.

> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  ...x-compile-on-musl-with-kernel-4.9-headers.patch | 81 ----------------------
>  meta/recipes-connectivity/connman/connman_1.34.bb  |  2 +-
>  2 files changed, 1 insertion(+), 82 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
>
> diff --git a/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch b/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
> deleted file mode 100644
> index da5756e..0000000
> --- a/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -From 594b67df7ca923d13265906a71fbbf748273a5f5 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Mon, 23 Jan 2017 17:41:39 +0200
> -Subject: [PATCH] Fix compile on musl with kernel 4.9 headers
> -
> -Kernel headers break when musl defines IFF_LOWER_UP. While
> -waiting for more proper fix in musl, add a hack to connman.
> -
> -Upstream-Status: Inappropriate [Workaround]
> -
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ----
> - src/6to4.c              | 4 ++++
> - src/firewall-iptables.c | 4 ++++
> - src/firewall-nftables.c | 3 +++
> - src/iptables.c          | 4 ++++
> - 4 files changed, 15 insertions(+)
> -
> -diff --git a/src/6to4.c b/src/6to4.c
> -index 71a2882..1938afb 100644
> ---- a/src/6to4.c
> -+++ b/src/6to4.c
> -@@ -24,6 +24,10 @@
> - #include <config.h>
> - #endif
> -
> -+/* hack to make sure kernel headers understand that libc (musl)
> -+   does define IFF_LOWER_UP et al. */
> -+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
> -+
> - #include <errno.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> -diff --git a/src/firewall-iptables.c b/src/firewall-iptables.c
> -index 45943a8..e04bb91 100644
> ---- a/src/firewall-iptables.c
> -+++ b/src/firewall-iptables.c
> -@@ -23,6 +23,10 @@
> - #include <config.h>
> - #endif
> -
> -+/* hack to make sure kernel headers understand that libc (musl)
> -+   does define IFF_LOWER_UP et al. */
> -+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
> -+
> - #include <errno.h>
> -
> - #include <xtables.h>
> -diff --git a/src/firewall-nftables.c b/src/firewall-nftables.c
> -index 2503ee2..583d1c4 100644
> ---- a/src/firewall-nftables.c
> -+++ b/src/firewall-nftables.c
> -@@ -30,6 +30,9 @@
> - #ifdef HAVE_CONFIG_H
> - #include <config.h>
> - #endif
> -+/* hack to make sure kernel headers understand that libc (musl)
> -+   does define IFF_LOWER_UP et al. */
> -+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
> -
> - #include <stdlib.h>
> - #include <time.h>
> -diff --git a/src/iptables.c b/src/iptables.c
> -index 82e3ac4..46ad9e2 100644
> ---- a/src/iptables.c
> -+++ b/src/iptables.c
> -@@ -23,6 +23,10 @@
> - #include <config.h>
> - #endif
> -
> -+/* hack to make sure kernel headers understand that libc (musl)
> -+   does define IFF_LOWER_UP et al. */
> -+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
> -+
> - #include <getopt.h>
> - #include <stdlib.h>
> - #include <stdio.h>
> ---
> -2.4.0
> -
> diff --git a/meta/recipes-connectivity/connman/connman_1.34.bb b/meta/recipes-connectivity/connman/connman_1.34.bb
> index d520568..868f940 100644
> --- a/meta/recipes-connectivity/connman/connman_1.34.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.34.bb
> @@ -9,7 +9,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>              file://includes.patch \
>              "
>  SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
> -                             file://0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch"
> +                             "
>
>  SRC_URI[md5sum] = "e200028702c831d5f535d20d61e608ef"
>  SRC_URI[sha256sum] = "a9a0808c729c1f348fc36d8cecb52d19b72bc34cb411c502608cb0e0190fc71e"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

