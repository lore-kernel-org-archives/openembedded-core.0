Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6147C2F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 22:12:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r10so8182265wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 14:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=KbQRmWDWL1aISXxYlbIOeoTFvbAGZWsegqNIOmZMMIQ=;
	b=MkTEAIvMpFXdZuaUFV3EP3T6oTu7o++lHzdy9k9i++jFXrdizzYXjMlDDkKBOHMDa7
	JGBEhXydDbmbQ/+DTB3SLIIaTojr+LOzXgD8ZhrRo3mvCXHFrriwghnbXfBaHFQ1NG1y
	gag7qmpRyMKhaj5FFsRA4VMfeDpssSiVVNdRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KbQRmWDWL1aISXxYlbIOeoTFvbAGZWsegqNIOmZMMIQ=;
	b=TirNA2f7aHQ2Du2ucY0UBMEEbKh2Un3T+73iR2F4vWe/uR+Q//RMgCg26ehjV6m7QL
	qnBiNd7NKpbF5CCZM5JlpGa2wsTBaWqM56c7r+gJ7h7SzO//wXth4v0Uc3Y2tbf5WMZX
	hcSl0wY+kdt+iSW/VIVhVtWla79T5PadeI+PSiHL6St6uO2s5O/+lGGiKdK6nn2ixHCB
	kq/vQGGgaLoKtYOsODk43juXSHUfhUdJn5n6t4OyFh9hVnnmlWesRfJbxWkkvJOVgGLZ
	TfGuNk77x7TYLvogG/Y/R/qSAjwLNnJnvjBolhO/YJxTcuHNsdfhaM9/UsJd/Ix6iJ0r
	di5g==
X-Gm-Message-State: AJcUukcAC0/2+H2iJfAiUmD3snt7ly9nyW3csDUnHT4veE+xtOgUaF5W
	AeGL59WYiA1wszjfiEFouPoPXVFscZ0=
X-Google-Smtp-Source: ALg8bN56oZDb54m/d4zx4ARRNB8CPitgcfUt9mtUTbX9l3RRJ3vB0i/xMaUk+CKYZGIsf5eRudf2JQ==
X-Received: by 2002:a5d:454f:: with SMTP id p15mr9278565wrr.39.1548367954661; 
	Thu, 24 Jan 2019 14:12:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o5sm41420269wrw.46.2019.01.24.14.12.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 14:12:33 -0800 (PST)
Message-ID: <42a56aea5450286e3172f5c88b8025ef21aecde7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <Alistair.Francis@wdc.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 22:12:32 +0000
In-Reply-To: <20190124220816.6193-1-alistair.francis@wdc.com>
References: <20190124220816.6193-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] lubusb1: Add udev support
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
X-List-Received-Date: Thu, 24 Jan 2019 22:12:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-24 at 22:08 +0000, Alistair Francis wrote:
> I don't see circular dependencies anymore between libusb1 and udev,
> so
> enable udev support for libusb1.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-support/libusb/libusb1_1.0.22.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> index 0c6e116dd7..9d1b8f4abb 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
> @@ -3,6 +3,8 @@ HOMEPAGE = "http://libusb.sf.net"
>  BUGTRACKER = "http://www.libusb.org/report"
>  SECTION = "libs"
>  
> +DEPENDS = "udev"
> +
>  LICENSE = "LGPLv2.1+"
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>  
> @@ -20,9 +22,7 @@ S = "${WORKDIR}/libusb-${PV}"
>  
>  inherit autotools pkgconfig ptest
>  
> -# Don't configure udev by default since it will cause a circular
> -# dependecy with udev package, which depends on libusb
> -EXTRA_OECONF = "--libdir=${base_libdir} --disable-udev"
> +EXTRA_OECONF = "--libdir=${base_libdir}"

Might as well turn this into a PACKAGECONFIG:

PACKAGECONFIG ??= "udev"
PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"

or something like that anyway :)

Cheers,

Richard


