Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 26BC67D7A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 16:12:44 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id y25so5726401oih.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3C+4Upx/K3TUZn8Dj8AJsBRYuY6atLx6qotRUpRA37U=;
	b=sxM0oWXPDYAOmbZOHcVTb0IHSTHAnYsY0IF7EBdPOU5BExYhV19lcX0DDE8r2jIP6g
	GxhRJNfts97ssmCk9J1cJRJeG9/v/VapTpcWXJqOPigySeMCtsB8XLRqADo4UaD2OSpJ
	fr0fonCGAFsOo9frVDSonM2gZm4CsEuSZaKMLkT9h39F0x+28ACeN/j86d4T91BYvdIu
	YOX85I3m02NQmfx/yApicOFKTMP2Y9GWOdYDdJV/J/rQ32PiKPz/f+Av4L9eOskwUsMP
	0vu2agqgXIF+PuqPnEngfZYqd9WTxB5GR+qLDUTcf/OawK4ChOuVz/vn4REeSoQHDXzO
	68eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3C+4Upx/K3TUZn8Dj8AJsBRYuY6atLx6qotRUpRA37U=;
	b=tJTnlR+64ASI7t259ek+aDDyd80/CpraARuW+QAiLy+Vh6b0YmRPVvxG5T6f82JP5x
	Y5+3l4wJOW9b9zc8kMiFvs3gxcU4Gqpfp9OojE8I6XXXGgOG/D3uaxQsOHEa4wNUxW5D
	4+ROf6qdpD4WvZU1ZgfH8os90B9mt4NRpQnWF5gjJpdxRU14YPy1/D+7wjWmKW5vlnX9
	Uy9Y9PWkBenjq/tgJKuXPoJ4Vc3edazR4AOYonJkkOhEh8PUJfEANCBdJgHOelb7bAud
	GKzwAvpyiK9K4d/fMZQdaVkftBbps5NLVA5sTjdT1DM/Q3mdvC2abV9kXuCYrSteMoUZ
	uaVA==
X-Gm-Message-State: APjAAAVXkV7E9Xh6tmRo6J8ZYPQ05NI9SddE9GjR7Ocy+pE9hR5eWOKy
	ZP9pajk7IweYmF5TZbMFAVB0n3yqGA5vJop/EXM=
X-Google-Smtp-Source: APXvYqyEGgvDwQiM+s3NxEjvq/ONV45IQ9RMjac1CPG/ApkRCqnHsiJw9+Ci4iCDVc3BivgSzOBdVg8jkd+jGEKvZ84=
X-Received: by 2002:aca:5d86:: with SMTP id r128mr678202oib.135.1557245566035; 
	Tue, 07 May 2019 09:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190507161021.4893-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190507161021.4893-1-open.source@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 May 2019 18:12:34 +0200
Message-ID: <CANNYZj_eBFiGKqzU5=6BhWgeb2_+yUoeJKSBt1wTi6KJawVzzg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] socat: update to 1.7.3.3
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
X-List-Received-Date: Tue, 07 May 2019 16:12:45 -0000
Content-Type: text/plain; charset="UTF-8"

Please do remember to explain why patches were removed. Are the
problems fixed in the new version?

Alex

On Tue, 7 May 2019 at 18:10, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...ccess-c_ispeed-and-c_ospeed-via-APIs.patch | 52 -------------------
>  .../Makefile.in-fix-for-parallel-build.patch  | 35 -------------
>  .../{socat_1.7.3.2.bb => socat_1.7.3.3.bb}    |  6 +--
>  3 files changed, 2 insertions(+), 91 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
>  delete mode 100644 meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch
>  rename meta/recipes-connectivity/socat/{socat_1.7.3.2.bb => socat_1.7.3.3.bb} (85%)
>
> diff --git a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch b/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
> deleted file mode 100644
> index c0e27f3d78..0000000000
> --- a/meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From fb10ab134d630705cae0c7be42437cc289af7d32 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 15 Mar 2016 21:36:02 +0000
> -Subject: [PATCH] Use __c_ispeed and __c_ospeed on musl
> -
> -Original intention of these asserts is to find if termios structure
> -is mapped correctly to locally define union, the get* APIs for
> -baudrate would not do the right thing since they do not return the
> -value from c_ospeed/c_ispeed but the value which is stored in iflag
> -for baudrate.
> -
> -So we check if we are on Linux but not using glibc then we use
> -__c_ispeed and __c_ospeed as defined in musl, however these are
> -internal elements of structs it should not have been used this
> -way.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> -Upstream-Status: Pending
> -
> - xioinitialize.c | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/xioinitialize.c b/xioinitialize.c
> -index 9f50155..8fb2e4c 100644
> ---- a/xioinitialize.c
> -+++ b/xioinitialize.c
> -@@ -65,6 +65,12 @@ int xioinitialize(void) {
> - #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET != -1)
> - #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
> - #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
> -+#if defined(__linux__) && !defined(__GLIBC__)
> -+      tdata.termarg.__c_ispeed = 0x56789abc;
> -+      tdata.termarg.__c_ospeed = 0x6789abcd;
> -+      assert(tdata.termarg.__c_ispeed == tdata.speeds[ISPEED_OFFSET]);
> -+      assert(tdata.termarg.__c_ospeed == tdata.speeds[OSPEED_OFFSET]);
> -+#else
> -       tdata.termarg.c_ispeed = 0x56789abc;
> -       tdata.termarg.c_ospeed = 0x6789abcd;
> -       assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
> -@@ -72,6 +78,7 @@ int xioinitialize(void) {
> - #endif
> - #endif
> - #endif
> -+#endif
> -    }
> - #endif
> -
> ---
> -2.8.0
> -
> diff --git a/meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch b/meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch
> deleted file mode 100644
> index aa4db65a79..0000000000
> --- a/meta/recipes-connectivity/socat/socat/Makefile.in-fix-for-parallel-build.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From c6f0080b55679b6e8b5d332d6e05fdcbda1e4064 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Mon, 4 May 2015 00:58:47 -0700
> -Subject: [PATCH] Makefile.in: fix for parallel build
> -
> -Fixed:
> -vsnprintf_r.o: file not recognized: File truncated
> -collect2: error: ld returned 3 exit status
> -Makefile:122: recipe for target 'filan' failed
> -
> -Let filan depend on vsnprintf_r.o and snprinterr.o to fix the issue.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - Makefile.in |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index f2a6edb..88b784b 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -118,7 +118,7 @@ PROCAN_OBJS=procan_main.o procan.o procan-cdefs.o hostan.o error.o sycls.o sysut
> - procan: $(PROCAN_OBJS)
> -       $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(PROCAN_OBJS) $(CLIBS)
> -
> --filan: filan_main.o filan.o fdname.o error.o sycls.o sysutils.o utils.o
> -+filan: filan_main.o filan.o fdname.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o
> -       $(CC) $(CFLAGS) $(LDFLAGS) -o $@ filan_main.o filan.o fdname.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o $(CLIBS)
> -
> - libxio.a: $(XIOOBJS) $(UTLOBJS)
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
> similarity index 85%
> rename from meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> rename to meta/recipes-connectivity/socat/socat_1.7.3.3.bb
> index b2d6b1dea4..7a889a3801 100644
> --- a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> +++ b/meta/recipes-connectivity/socat/socat_1.7.3.3.bb
> @@ -12,13 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
>
>  SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
> -           file://Makefile.in-fix-for-parallel-build.patch \
>             file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
> -           file://0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch \
>  "
>
> -SRC_URI[md5sum] = "607a24c15bd2cb54e9328bfbbd3a1ae9"
> -SRC_URI[sha256sum] = "e3561f808739383eb10fada1e5d4f26883f0311b34fd0af7837d0c95ef379251"
> +SRC_URI[md5sum] = "b2a032a47b8b89a18485697fa975154f"
> +SRC_URI[sha256sum] = "0dd63ffe498168a4aac41d307594c5076ff307aa0ac04b141f8f1cec6594d04a"
>
>  inherit autotools
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

