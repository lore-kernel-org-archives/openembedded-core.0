Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA477D486
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 10:45:21 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id x132so5466177itf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BLcag8+HPCSCEr8rOCmAgJE+eviF5GqVxrXvnbD8Fo4=;
	b=BI9S99Izjp/32XLZ+X6P6gpcL3/GSOtwX14ZCIw/yOhyg/yFVHB3U4sqRKkoUIK0q2
	3NVSPQFxISMOSqHGT2hKENIhfFG5tXNbVcXaKEQ468GI7ro3nOd9JC9B4MerxAGtstwj
	XJDAEOHKqxRlpnHAXpTDBb1lymJPlBbVTW5xoihha8N8TFckN67YM15gfDbx9IsZJp0L
	ZvtfJMPYDHE5SGZpVMQBG/goMyHPmVAdCB6qNs1SVzUPvXO1lbqYPDAvxrGDN0xQrWYS
	HBy0es9HwG4kOnYMzvrX0Jhew0Ssa2GvoKv2t0Aeqev2b4NEHI0WpFJQF+sN7XOuoKi5
	XEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BLcag8+HPCSCEr8rOCmAgJE+eviF5GqVxrXvnbD8Fo4=;
	b=Tl2thwpp52zXMTpqhRnZ3c9sQTeKWPOsPl6s2ag4mVKfcNUsYiBDwJftPZSRgyTCxG
	CDL0U5vgmNWipgI7c3L3G8ErpNlxabgVTgYcDYOoVaDcUXxlPBSaY/LpsyUF8PWdNscv
	QLRd+wqRMdJyb+w+y3ONc233kZQKy9NKNm6BPSraTRSTfAAKvzMWg7Iku4ReO09iBzsV
	CFlyRHIpA2ZCkLbsBIYHqWiDRQSufWSUc66JXDNltb0czaJ6muVVm7YSCb4eq++Npfn5
	ferM6f8no0NXLfnqdmuWeV6d58El53FlcHLwpr1/Ac+G2CbS9FIg6ldX09+9BSsCndQj
	sl0A==
X-Gm-Message-State: APjAAAU3YEA+GySNjCOW/enfRMKR6zGGIaATUpWEJUXnisIRb3h63mp7
	bOBCb8Za+HH5b8eLFdoW0SLIu7rjGpO0U2g+hLbv4UIE
X-Google-Smtp-Source: APXvYqyOAXTGX2KuR1VJtwQ51tM9w0+tRA/ODg/EPcOCoI0jZxRI9ncCkD5dmGcDOASgIF05CQ46P8+IdHCO2LRSuOY=
X-Received: by 2002:a02:ad15:: with SMTP id s21mr9852474jan.79.1556102722894; 
	Wed, 24 Apr 2019 03:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190424062244.1306-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190424062244.1306-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2019 11:45:11 +0100
Message-ID: <CAJTo0LYpOtdDZnUWxAS0B8cCqukz_+6_0b1gv=ApYovCDTVspg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: update to 8.31
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
X-List-Received-Date: Wed, 24 Apr 2019 10:45:22 -0000
Content-Type: text/plain; charset="UTF-8"

The new patch needs an explanation, a Upstream-Status, and your
signed-off-by.  Also if a musl-fixing patch doesn't hinder builds
using glibc in some way then apply it always.  The problem with
patches-in-overrides is that they tend to not be tested enough on
upgrades.

Ross

On Wed, 24 Apr 2019 at 07:23, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Musl fix was suggested by:
> https://www.mail-archive.com/bug-coreutils@gnu.org/msg30888.html
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../coreutils/fix-minus_zero-first-defined-here.patch | 11 +++++++++++
>  .../{coreutils_8.30.bb => coreutils_8.31.bb}          |  8 +++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-core/coreutils/coreutils/fix-minus_zero-first-defined-here.patch
>  rename meta/recipes-core/coreutils/{coreutils_8.30.bb => coreutils_8.31.bb} (94%)
>
> diff --git a/meta/recipes-core/coreutils/coreutils/fix-minus_zero-first-defined-here.patch b/meta/recipes-core/coreutils/coreutils/fix-minus_zero-first-defined-here.patch
> new file mode 100644
> index 0000000000..fa9d047d4a
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils/fix-minus_zero-first-defined-here.patch
> @@ -0,0 +1,11 @@
> +--- a/lib/strtod.c
> ++++ b/lib/strtod.c
> +@@ -302,7 +302,7 @@ compute_minus_zero (void)
> + }
> + # define minus_zero compute_minus_zero ()
> + #else
> +-DOUBLE minus_zero = -0.0;
> ++static DOUBLE minus_zero = -0.0;
> + #endif
> +
> + /* Convert NPTR to a DOUBLE.  If ENDPTR is not NULL, a pointer to the
> diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
> similarity index 94%
> rename from meta/recipes-core/coreutils/coreutils_8.30.bb
> rename to meta/recipes-core/coreutils/coreutils_8.31.bb
> index 8f4ee55712..fa4c0d9007 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.30.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
>  BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>  LICENSE = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> -                    file://src/ls.c;beginline=1;endline=15;md5=dbe356a88b09c29232b083d1ff8ac82a"
> +                    file://src/ls.c;beginline=1;endline=15;md5=c456f9896277a0543e3866777ccc0255"
>  DEPENDS = "gmp libcap"
>  DEPENDS_class-native = ""
>
> @@ -20,8 +20,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
>            "
>
> -SRC_URI[md5sum] = "ab06d68949758971fe744db66b572816"
> -SRC_URI[sha256sum] = "e831b3a86091496cdba720411f9748de81507798f6130adeaef872d206e1b057"
> +SRC_URI_append_libc-musl = "file://fix-minus_zero-first-defined-here.patch"
> +
> +SRC_URI[md5sum] = "0009a224d8e288e8ec406ef0161f9293"
> +SRC_URI[sha256sum] = "ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd"
>
>  EXTRA_OECONF_class-native = "--without-gmp"
>  EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

