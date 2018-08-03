Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 37F4178E22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 18:17:00 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id v8-v6so11413397oie.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 11:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NBtnQcXSU1VysXoLlXHuHZrBcKo6xd7094IasV8VEHg=;
	b=UTEXjq5xrqMVZrlDBXNAfpf6usyjESZJfYYZxaoxsr3vszPxHTDH8QsJ01aYhb+cOP
	iNjl3+SnjPjRFUNpMQr2p0rUXxc8Q0DADLViG1AnvTrx9VNbBPzm52BUtjt5x0jTaAFm
	hz16zDb24Gq8heuk/7iM/PMCsYHxIrJHvBv/xptjPaHTUhWrHHsb5wyXGIcOxf/7mFZP
	CFdlIeV4LQA8M23XSJ1scd2diua75xip28oT+bIN799TOCBGjnL+q9cctOjO0Yvulhq6
	9HTH20z3b3XjZArWoKMf0+rpSrmaklO28PMbrJtM9DKCaLca05DYyHfNMTCblHXpbp+q
	U+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NBtnQcXSU1VysXoLlXHuHZrBcKo6xd7094IasV8VEHg=;
	b=M3Q5PXYNZYw3tyGmafnkl6HJL1+K8zhH7kJW19I7+C8xMXDckevuSP0cyx3Jq8M2YY
	V3mVZPv3qGOBvbBX+5hhKZv+VByG7a8o9wYq2+wxG0QFkco1V3VRYQXMcOgKBhUQa0vY
	r1By/vnMYCSIlszyxCJZVlCdCJ/O9VN9rzjIXGpKmTyg47j85dbaP1YLQh9ajvKEL9j1
	oVfF/ABfNzjYG0YyNnHqRQFlxZcMleFh0+VPrtix9tYeVpYZoS4CCG1cl06KEWKkRkpU
	HECAaKHSi9xw906AWNad+F8TxTP3I8Vn6xTflh9mYHUGPV9CSw/pzrOieXhz7wWCFYiK
	eXhg==
X-Gm-Message-State: AOUpUlFeRvmu+lhcOeS1HbrFHWgB9mcdGo+BrHGYDgXHVp0EcqWm4tVF
	qVJRB5Ao9juUE5sSuDpvYdWMkid4+Lw5lSzmwTOR8iT2
X-Google-Smtp-Source: AA+uWPxDd9ssG7H1l9H8mb9PpjoEySyvH7SQOhWtTiOiwBQhE99wKxlL1DxBEOha6anKAZXSwXpu+SFHXIaqked7GIw=
X-Received: by 2002:aca:5f56:: with SMTP id
	t83-v6mr4503478oib.115.1533320221202; 
	Fri, 03 Aug 2018 11:17:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Fri, 3 Aug 2018 11:16:40 -0700 (PDT)
In-Reply-To: <20180803173014.20748-1-raj.khem@gmail.com>
References: <20180803173014.20748-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Aug 2018 19:16:40 +0100
Message-ID: <CAJTo0La79XMhGOVqHiinp7TKJM=1BD2zg5dZACecao7C9RLDsQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libidn2: Fix charset.alias issue with musl
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
X-List-Received-Date: Fri, 03 Aug 2018 18:17:00 -0000
Content-Type: text/plain; charset="UTF-8"

Has that actually been fixed in gnulib yet?

Ross

On 3 August 2018 at 18:30, Khem Raj <raj.khem@gmail.com> wrote:
> Fixes
> ERROR: libidn2-2.0.5-r0 do_package: QA Issue: libidn2: Files/directories were installed but not shipped in any packag
> e:
>   /usr/lib/charset.alias
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or del
> ete them within do_install.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...charset_alias-when-building-for-musl.patch | 23 +++++++++++++++++++
>  meta/recipes-extended/libidn/libidn2_2.0.5.bb |  4 +++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
>
> diff --git a/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
> new file mode 100644
> index 0000000000..ace50bbfde
> --- /dev/null
> +++ b/meta/recipes-extended/libidn/libidn2/Unset-need_charset_alias-when-building-for-musl.patch
> @@ -0,0 +1,23 @@
> +Unset need_charset_alias when building for musl
> +
> +localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
> +which actually shoudl be fixed in gnulib and then all downstream
> +projects will get it eventually. For now we apply the fix to
> +coreutils
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Index: libidn2-2.0.5/unistring/Makefile.am
> +===================================================================
> +--- libidn2-2.0.5.orig/unistring/Makefile.am
> ++++ libidn2-2.0.5/unistring/Makefile.am
> +@@ -293,7 +293,7 @@ install-exec-localcharset: all-local
> +         case '$(host_os)' in \
> +           darwin[56]*) \
> +             need_charset_alias=true ;; \
> +-          darwin* | cygwin* | mingw* | pw32* | cegcc*) \
> ++          darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
> +             need_charset_alias=false ;; \
> +           *) \
> +             need_charset_alias=true ;; \
> diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> index aaf9ecd7e7..0d7bddbc7f 100644
> --- a/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> +++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> @@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
>                      file://src/idn2.c;endline=16;md5=0283aec28e049f5bcaaeee52aa865874 \
>                      file://lib/idn2.h.in;endline=27;md5=c2cd28d3f87260f157f022eabb83714f"
>
> -SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
> +SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
> +           file://Unset-need_charset_alias-when-building-for-musl.patch \
> +          "
>  SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
>  SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

