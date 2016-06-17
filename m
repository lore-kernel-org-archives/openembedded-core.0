Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 576587327F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 02:46:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r201so1264661wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 19:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IIfq0ohjqvCW3kYA0Mak7ER4Yp6+AzCu1ld/5zERHHs=;
	b=Av9amPNfcfkOc8qe+RF4BqzKNC1TwNz2rcy1aGbVUnNYl6rtZt8PeAxNotTu3Dt8k+
	yov6rQz918bFrkUrUSeeg6RwLpf6ly+aEFEh0dQk0FNpOkYWLjIjBHkS18KGfcUfPazx
	RW6a3jVSgXZIWTEZ/SRe1LOMNODl+SNOZvACv1nw2J5o/XA0VictCQTdUMs9tPrCXgd7
	El6TuOG2zdk0qV/+ZVWibCIGvAqM1iUuIRr/pWm73459GgBb2UH1nGhyNZ4EoGCAY9Wb
	2RsoYGNXXjtT58MBtO/ZgNT5ZVF9pkrAqZTD6Ftk2hSYiz6wa/IJfOPQv9q/QuqJPRFL
	KYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IIfq0ohjqvCW3kYA0Mak7ER4Yp6+AzCu1ld/5zERHHs=;
	b=iRAJLQSQ93thJ/eNU5X6acKOU2YACd9o1h3zkw77Kd4bfHa2ew9LSZcLX0ctgEB9an
	GtmY0q7YEOkeJ9feICPJpeJAPn+X5/oBrtNbp6RXxNuTkBHISbqEE3g8Suqe0VDA5RLU
	iGFWSpVUhjQPptnFEO7PmC8gabDP+bFL6XWxS2cNU4bpGFJo9i+9TEAOpVwd51aJLMOS
	jzsdM7xSM3GyelAC+T2JJO4o/iGcf9Pvr3daZoy3UOcYmYXjZ42riMlYGNQx5K7h54ww
	0+MRxalFGbHv1nIxL+EMcKgxQBas+6AVJ+InTsS60RfBsXPH/IdmijCNqaCLCCpbwuGF
	/M3g==
X-Gm-Message-State: ALyK8tLPHu8s6hjspC8PjJIZFEO2DQ8i/GbpIh+6NPs8FVKAQybDBg7Q8Kfv5vY5hlYhbazJ0LISsxC/cc438g==
X-Received: by 10.194.172.36 with SMTP id az4mr2526643wjc.114.1466131572629;
	Thu, 16 Jun 2016 19:46:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.165 with HTTP; Thu, 16 Jun 2016 19:46:11 -0700 (PDT)
In-Reply-To: <1461870393-3545-2-git-send-email-dv@pseudoterminal.org>
References: <1461870393-3545-1-git-send-email-dv@pseudoterminal.org>
	<1461870393-3545-2-git-send-email-dv@pseudoterminal.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Jun 2016 19:46:11 -0700
Message-ID: <CAJ86T=W1ZwM7j-OJUfBBj6eqMz08346xpvu2VKqeD1JWtob=jA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/8] gstreamer1.0: upgrade to version 1.8.1
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
X-List-Received-Date: Fri, 17 Jun 2016 02:46:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 28, 2016 at 12:06 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> The gst-inspect patch no longer applies, and according to upstream, is
> not needed.

This patch series seems to be missing an update for gstreamer1.0-plugins-bad ?


> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  2 ++
>  .../0001-Fix-crash-with-gst-inspect.patch          | 28 ----------------------
>  ...gstreamer1.0_1.6.3.bb => gstreamer1.0_1.8.1.bb} |  5 ++--
>  .../gstreamer/gstreamer1.0_git.bb                  |  5 ----
>  4 files changed, 4 insertions(+), 36 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.6.3.bb => gstreamer1.0_1.8.1.bb} (62%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> index 10b4668..86ac10c 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> @@ -24,6 +24,8 @@ PACKAGECONFIG[check] = "--enable-check,--disable-check"
>  PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
>  PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
>  PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
> +PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
> +PACKAGECONFIG[trace-historic] = "--enable-trace,--disable-trace,"
>
>  EXTRA_OECONF = " \
>      --disable-dependency-tracking \
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
> deleted file mode 100644
> index 94f5cc5..0000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 6b26f3dbf9bf577d71534ab7410de66d06e46ba2 Mon Sep 17 00:00:00 2001
> -From: Carlos Rafael Giani <dv@pseudoterminal.org>
> -Date: Sat, 6 Apr 2013 23:52:11 +0200
> -Subject: [PATCH] Fix crash with gst-inspect Chris Lord <chris@openedhand.com>
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ----
> - tools/gst-inspect.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/gst-inspect.c b/tools/gst-inspect.c
> -index 23b7c44..b79b02e 100644
> ---- a/tools/gst-inspect.c
> -+++ b/tools/gst-inspect.c
> -@@ -1556,7 +1556,7 @@ main (int argc, char *argv[])
> -   g_option_context_add_main_entries (ctx, options, GETTEXT_PACKAGE);
> -   g_option_context_add_group (ctx, gst_init_get_option_group ());
> -   if (!g_option_context_parse (ctx, &argc, &argv, &err)) {
> --    g_printerr ("Error initializing: %s\n", err->message);
> -+    g_printerr ("Error initializing: %s\n", err ? err->message : "(null)");
> -     return -1;
> -   }
> -   g_option_context_free (ctx);
> ---
> -1.8.2
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.1.bb
> similarity index 62%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.1.bb
> index ba1b83b..475ebf9 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.1.bb
> @@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
>
>  SRC_URI = " \
>      http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
> -    file://0001-Fix-crash-with-gst-inspect.patch \
>  "
>
> -SRC_URI[md5sum] = "b4cdeb2b9cb20dd6ac022a4f417eae0d"
> -SRC_URI[sha256sum] = "22f9568d67b87cf700a111f381144bd37cb93790a77e4e331db01fe854a37f24"
> +SRC_URI[md5sum] = "711ada79b63e47ac96adb4e5444dc908"
> +SRC_URI[sha256sum] = "5a3722fb9302dd977c17ced4240293dc777cb716dc98c8cca63d75c27e5e3107"
>
>  S = "${WORKDIR}/gstreamer-${PV}"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> index 7715bb2..f04fc6e 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
> @@ -20,11 +20,6 @@ SRCREV_FORMAT = "base"
>
>  S = "${WORKDIR}/git"
>
> -# The option to configure tracer hooks was added prior to the 1.7.2 release
> -# https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?id=e5ca47236e4df4683707f0bcf99181a937d358d5
> -PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
> -PACKAGECONFIG[trace-historic] = "--enable-trace,--disable-trace,"
> -
>  do_configure_prepend() {
>         ${S}/autogen.sh --noconfigure
>  }
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

