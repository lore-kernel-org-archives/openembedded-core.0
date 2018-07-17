Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 05E12789A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 17:18:29 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id s198-v6so3451642oih.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PFj04UZ1F0wWoqHmcIq6Zg8VB9Zr3o4rHnaPgoc7ZdY=;
	b=jhkcthV8mTeTsyo4W0Jbstw2UQwqoPU1XZ69PyoYAhgsL34MUYm+k65flk1gy49Ald
	iqvMgZprFERgQukqU7RUa7k8V8WrXMvYpD1LQwVujgip7xsKLXcwVArLCSUmrr2N2JdJ
	li427fbxXSM2FCntCxl4R0qrT+my/0YI0NgsQUCKLJH/rNXMAPM05Foy2hclFFWrQJ+U
	SJXzhhNE//SkR1PrrWjvDIGafaVlf8tpU1ip+BQtu41RujZIJOuzevDUsXci0gvV2WWc
	HNg7xkWbV3vQtssALj6x2A3ZcNOUuUvY/V+eC5WqOFDZVHb6zoD4ojSTVMZjuB0Hnyf7
	mCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PFj04UZ1F0wWoqHmcIq6Zg8VB9Zr3o4rHnaPgoc7ZdY=;
	b=CU+O4S3L1MKd79HljrRcE4sUWISKzCHTINFe3Ww/qKBIzc2leM1VSq0tY12h6E6Cy2
	yGW6TQpXEOadF14z3x82SAVCPaXdeYUSDsWFPDYTy5BmjYuwPdIN6HI31xJtUKV/X93h
	w3ASa/SwTzugMRlozkW4W9jI8c5o8tm9tSOd/2BWJ6/o2DlpkPE5/ibxx32uotEIBK5g
	2R48mlkDFfcP0IaDV1iTmDQe8oot8L/R5RFjJkmVEp8mJE+iFhPn7q/5Q2Z4nubf/r/C
	GBOqEN2O03jC9HEvIBE91462PFQRcXsrTfYmTHRKu2kFz3SrP+XEp3+vh6upzfeV9Ptc
	aeVw==
X-Gm-Message-State: AOUpUlHHfK8f8gxj6/CEaxZjO8ouk0xl79TiDAp2wOGXHPLrtYh66b1c
	xvGU6bEQSpuIa8rlGsASO6Ef5KjAsPtzMomYfDY=
X-Google-Smtp-Source: AAOMgpd/g9mctxTmb+B2WBSfvDH2wJ+/vD12ar47B/FiyD34StvVZF9GVoGss59eQ0D0t+Waill9NRtahSlDzsEIcz8=
X-Received: by 2002:aca:e80c:: with SMTP id
	f12-v6mr2802303oih.38.1531847911046; 
	Tue, 17 Jul 2018 10:18:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 10:18:30
	-0700 (PDT)
In-Reply-To: <20180717163910.3196-15-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
	<20180717163910.3196-15-ross.burton@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Jul 2018 19:18:30 +0200
Message-ID: <CANNYZj-QE-zsxP=HDaFw-ZYwOwGqO5vcLDPhocAC-TuqxBkJEQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/15] ca-certificates: upgrade 20170717 -> 20180409
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
X-List-Received-Date: Tue, 17 Jul 2018 17:18:30 -0000
Content-Type: text/plain; charset="UTF-8"

I vaguely remember something in the latest ca-certificates required
openssl 1.1 (probably one of the scripts assumes a feature only
present in 1.1). So I placed it into the upcoming openssl-1.1 branch,
instead of sending it out.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/openssl-1.1.1

Alex

2018-07-17 18:39 GMT+02:00 Ross Burton <ross.burton@intel.com>:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../{ca-certificates_20170717.bb => ca-certificates_20180409.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)
>
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
> similarity index 95%
> rename from meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
> rename to meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
> index 24d3a6e4d3e..0d57083c522 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
> @@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
>  HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
>  SECTION = "misc"
>  LICENSE = "GPL-2.0+ & MPL-2.0"
> -LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968"
> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=aeb420429b1659507e0a5a1b123e8308"
>
>  # This is needed to ensure we can run the postinst at image creation time
>  DEPENDS = ""
> @@ -14,7 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
>  # Need c_rehash from openssl and run-parts from debianutils
>  PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
>
> -SRCREV = "34b8e19e541b8af4076616b2e170c7a70cdaded0"
> +SRCREV = "dbbd11e56af93bb79f21d0ee6059a901f83f70a5"
>
>  SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
>             file://0002-update-ca-certificates-use-SYSROOT.patch \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

