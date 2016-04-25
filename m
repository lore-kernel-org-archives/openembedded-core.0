Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D796C60290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 19:54:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r12so24547968wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=BP7Mp+Wk2d0zvWN/Iy5UYK3f7/0W/Wl+4CjqKBP/neM=;
	b=xrZXFV7D1poHVZMEgvDP4kKdGET7rqgS3TsgXNUDP5OIdjrHY9mFL2hDX7PNjfY1NO
	CZ42Ub9qCX4FdjTp5V2BVYvIQ2WtZ41V2Rl6nJ1UE8V9NuQ0LBPczIzCsoARQuvPR4Rq
	qVbRjPrNfYZAxFeY7Zw0vdsMNpCaI0Zx3N8g6hECxaN5HnEWz3EGmpDiwBBQr+rEsVIA
	cHNLllXx3pRQRyh3kB8JN4Mg0w5oIg1ndzL1BobDOvGZRD911vxmUBOUtFf2HUGiTXj0
	12bjVNR70YP45SO45mV6g/lh3utgfGx22LKw+eShuhfx6nXMpWIzS3EIdWIYa1Efnqq4
	4uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=BP7Mp+Wk2d0zvWN/Iy5UYK3f7/0W/Wl+4CjqKBP/neM=;
	b=cY8Nfr7BTDAmOpjQk60ifJJTBEQzALcOSe+HQEKMk7gxEN+8Cnfauny358vSZLXlyw
	3A4p5oIgxxyoe9J9DgyXkEv7Yc+nAziAIvWnR4qi3kD/UVmazxsX0LFwIk0WLFFSy2TO
	qaW9kgWE0i5IBjE8X0GMU9+IY0+vmBGyBkB+IRY0u0vONxP6k7VChwqYMMKn8jUmwftl
	hl1RO8NMuMgqqVHkv5XG33BE0nZ2F7XdpdDv4vE5MuUJPXY8z66NFIw4FlxrOlKj9g6y
	Wtm1cH5diLNTT/1fZMXbXq6OlJ1HrNk1AcMs5lRgZw5lJK/HRip/biudmTL1GYKGZ/qr
	lNXQ==
X-Gm-Message-State: AOPr4FV2WISKTXmjLmM/2rFy8kK5H7cjG62dmBiB5Bzrh4+o5SWQStfBfvYrLY+xQF3AcGjn1Hd3wXgYTZM+nw==
MIME-Version: 1.0
X-Received: by 10.28.138.196 with SMTP id m187mr13712902wmd.61.1461614057807; 
	Mon, 25 Apr 2016 12:54:17 -0700 (PDT)
Received: by 10.194.231.98 with HTTP; Mon, 25 Apr 2016 12:54:17 -0700 (PDT)
In-Reply-To: <1460713909-5823-2-git-send-email-dv@pseudoterminal.org>
References: <1460713909-5823-1-git-send-email-dv@pseudoterminal.org>
	<1460713909-5823-2-git-send-email-dv@pseudoterminal.org>
Date: Mon, 25 Apr 2016 12:54:17 -0700
Message-ID: <CAJ86T=USu=kn89PqU=p4NZsViK3FkZ1yFUPooL+En3mwWbbynQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] gstreamer1.0: upgrade to version 1.8.0
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
X-List-Received-Date: Mon, 25 Apr 2016 19:54:18 -0000
Content-Type: text/plain; charset=UTF-8

Hi Carlos,

On Fri, Apr 15, 2016 at 2:51 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> The gst-inspect patch no longer applies, and according to upstream, is
> not needed.

I'd like to start testing gstreamer 1.8.x. Are these patches still
your latest version? Or do you perhaps now have patches for gstreamer
1.8.1?

>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  2 ++
>  .../0001-Fix-crash-with-gst-inspect.patch          | 28 ----------------------
>  ...gstreamer1.0_1.6.3.bb => gstreamer1.0_1.8.0.bb} |  5 ++--
>  .../gstreamer/gstreamer1.0_git.bb                  |  5 ----
>  4 files changed, 4 insertions(+), 36 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.6.3.bb => gstreamer1.0_1.8.0.bb} (62%)
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
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.0.bb
> similarity index 62%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.0.bb
> index ba1b83b..7de0832 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.3.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.0.bb
> @@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
>
>  SRC_URI = " \
>      http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
> -    file://0001-Fix-crash-with-gst-inspect.patch \
>  "
>
> -SRC_URI[md5sum] = "b4cdeb2b9cb20dd6ac022a4f417eae0d"
> -SRC_URI[sha256sum] = "22f9568d67b87cf700a111f381144bd37cb93790a77e4e331db01fe854a37f24"
> +SRC_URI[md5sum] = "6846d7289ec323c38c49b818171e955a"
> +SRC_URI[sha256sum] = "947a314a212b5d94985d89b43440dbe66b696e12bbdf9a2f78967b98d74abedc"
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

