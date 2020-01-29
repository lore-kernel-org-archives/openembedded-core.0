Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 72B9860785
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:28:03 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id q15so3101998qki.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9VacGQJDgq5wJaQlasR5kQhrYEeumjLlJ0Rt0nR6viI=;
	b=TL1Rzgp+JWjaOq75ih6b+EFBywYAck8vaZ2YLcJ28wK7X4Btyrxf3Z9P5EEb4XzAR/
	uAlxpVYJeQW3yPibghKfRQH53C5XLSqCIYFgAV99JQZDKp5qOWa01wBlqlSuSIO3yYGY
	iyfVbJZRm9Wl1UpOfNNmmRn6Po3ZvHE4jjH0Sqvv8eF83nSaUDg+cgTUPkKTLwuMpXsu
	GMI8s4Uvyd5A+KKrqfDTJTEIN63pol2hF1FW1M2rZWsHHh6pvGSLRc11Wzf0/sEXyhcP
	QOfoKB0N8WElyYT4Z5Awj6bmsakK+b2U2G3RGwbwFMaU2C2Ed89wcSGciJyyf2by41J7
	pPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9VacGQJDgq5wJaQlasR5kQhrYEeumjLlJ0Rt0nR6viI=;
	b=UwPG2PVAZrA2S9zbmvLEeejhdRTEiuB+rrodbDFuM3m5XWPD7O25Pv7gMA+o/8C8YX
	7oMCmrI/Jw+EMPGZned+tjNIp7lCTz8kgVwqrcOaNxVAFyN79vc2qxZtZZw87s+TT4ZP
	xhS9HyCjcwqwwzAm1mn5LSGhJ5dbVluY77DmudXRU4my+mH5x8LovPNx9v1C6ob4fmYs
	VnrwpribBeSe1NZ5wrvIpGh9mphcwALqahCnVkvsF27NvRiy1A5TPK/XYB+cwQO+J58m
	BnveZmDuMS6IRxJDpSFyLleXyeGVFUkCcrScA49Wsdp0pzKF6JtzPOyq63lZy35+HoCA
	um4A==
X-Gm-Message-State: APjAAAV/s29liclePNE8vzLWDUxH6tQMXaUB0zVTZ38TKEFgre6t+VK7
	+yYGaZHoy+d+1qOnU/3bJKyIdnwNcspeX34OSuoWCVnJlgk=
X-Google-Smtp-Source: APXvYqzBKmAhjVbAgJeOqXGcIEQEQ4oQghWGtYNfWD3SbGa8AXvSoe71PT0/Z+7zUWHF8qoEaW7XWGhQIKD23ekRJw8=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr23971738qtn.378.1580263255159;
	Tue, 28 Jan 2020 18:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
	<20200128151643.9711-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200128151643.9711-3-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2020 18:00:28 -0800
Message-ID: <CAMKF1sqYswYbOA+N80sK3sELzPPCTymDna8bgSKETCvZROi2Fw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] texinfo/texinfo-dummy-native: Drop native path prefix
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
X-List-Received-Date: Thu, 30 Jan 2020 14:28:32 -0000
Content-Type: text/plain; charset="UTF-8"

it perhaps is the reason for most of failures seen here

https://errors.yoctoproject.org/Errors/Build/97736/

perhaps we need to explicitly inherit gettext in these recipes ?

On Tue, Jan 28, 2020 at 7:17 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Now we have recipe specific sysroots we don't need this native path
> prefix. It was breaking the crosssdk/cross-canadian cases and causing
> bugs, removing it is the simplest solution.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/texinfo.bbclass                                  | 4 +---
>  .../texinfo-dummy-native/texinfo-dummy-native.bb              | 2 --
>  2 files changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta/classes/texinfo.bbclass b/meta/classes/texinfo.bbclass
> index 6b0def0eac4..72091c733e5 100644
> --- a/meta/classes/texinfo.bbclass
> +++ b/meta/classes/texinfo.bbclass
> @@ -10,9 +10,7 @@ TEXDEP = "texinfo-native"
>  TEXDEP_class-native = "texinfo-dummy-native"
>  TEXDEP_class-cross = "texinfo-dummy-native"
>  DEPENDS_append = " ${TEXDEP}"
> -PATH_prepend_class-native = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
> -PATH_prepend_class-cross = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
>
>  # libtool-cross doesn't inherit cross
>  TEXDEP_pn-libtool-cross = "texinfo-dummy-native"
> -PATH_prepend_pn-libtool-cross = "${STAGING_BINDIR_NATIVE}/texinfo-dummy-native:"
> +
> diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
> index 1254bc89b48..3e6dfb0f1b9 100644
> --- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
> +++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
> @@ -9,8 +9,6 @@ SRC_URI = "file://template.py file://COPYING"
>
>  S = "${WORKDIR}"
>
> -NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
> -
>  inherit native
>
>  do_install_name() {
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

