Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 02DDF78C15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 13:43:20 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id p81-v6so23039724itp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oTy6WUqlEFDvu1y2Q2JnEnlFap8MNobbv5AbALXPSfY=;
	b=tiHpMuvubXzzfsoZ53iju2QEag66dBhYDYvlTXuqopCDweQEr2ipOIJzTXyiZyR3pe
	xaOK1MB6oK3Qz+218N1iqsbHJ6PhYDy5OxzffH/tozWapsLQEtmQoOaGinPEhayMdO9X
	WabKu05izfC0eYmGeDp1CjFNM1R3ewJbdIEZbZYBtRlWokmzr8KVpJQUxSAAll+UBEaU
	6DkCaX76tPWsTSYxcya5KBVDSFSqUfzLDfN0pCjhEYnU6Q3WiBHD463xoE8+C3gS3hIG
	5qq+xTCPv7jjioaDb0CHjq6OWvBm1CLoRYEllJM3Wg8YBJTBfNX1vJ+uOU+bkVOoVz9L
	w8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oTy6WUqlEFDvu1y2Q2JnEnlFap8MNobbv5AbALXPSfY=;
	b=ON4xWCxssksbtIa0OFd4YuH4xu3kGIKPuWTgPoXTUJB0FUCqORo5zI7JFBDCQyUOtp
	TbVDS/BklXXDeOVMUHD6Gr4Uc657aRQ2zjzLiwPyDkemQjD1B+4kseGGPcqxR+yTN616
	mQEgyk9G+twWhJpcjdBQUywzH/M8rFXiB2RrgIKOW6VMPYsoELY5CJ7ppmAmbqzZ6TxO
	l0OmtancTmIpwZ6FnJbDZ5oft0PAcPejuw9+yIxddTeOXHOVkAw4gWLDpFw2IkNuhTk4
	GXnLoMF1l6MFAhg6QyZ4/b/L7+kmpIWRDvIxCnP3/mCDMMzfDy9XQDCX5gMCmHHWXPW2
	zu1Q==
X-Gm-Message-State: AOUpUlFg/8ewb5x760XskQB1J5nb9DYqXoXF0GhxX7elqX24J9Q/NH3v
	OBEV9ymRNbEVM3XWpMx8F9vZURIg
X-Google-Smtp-Source: AA+uWPwLyxn/6YzJ9idf2RHH2hzh0F4yO1l3T2qXwOtoRbgI43RZSglZoskX5qpgXcZwobWQpyK5xQ==
X-Received: by 2002:a24:818a:: with SMTP id
	q132-v6mr2003089itd.51.1533649401853; 
	Tue, 07 Aug 2018 06:43:21 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	y15-v6sm565960ioy.18.2018.08.07.06.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 06:43:21 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1be435b4a64a753ed4ae8139d2d7c002b3d08500.camel@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2018 08:43:20 -0500
In-Reply-To: <20180807134004.27653-1-JPEWhacker@gmail.com>
References: <20180807134004.27653-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Subject: Re: [sumo][PATCH] alsa-lib: Cleanup packaging
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
X-List-Received-Date: Tue, 07 Aug 2018 13:43:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-07 at 08:40 -0500, Joshua Watt wrote:
> From: Joshua Watt <jpewhacker@gmail.com>
> 
> Cleans up the packaging by moving libasound.so.2 back into the alsa-
> lib
> package which was previously empty.
> 
> Previously, it was difficult to create an image that had
> libasound.so.2,
> then create an SDK from that image that had the proper development
> files, because the only way to get libasound.so.2 was to do:
> 
>  IMAGE_INSTALL += "libasound"
> 
> This however caused a problem because all of the development files
> that
> would be desired in the SDK were located in alsa-lib-dev, which
> wouldn't
> be included because alsa-lib wasn't included, and it was impossible
> to
> include alsa-lib because it was an empty package that was culled.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 30352f3d84344bff8c06625f9674947417f6e8e1)
> 
> Change-Id: I2fb065b7e00569ba3a6aac631ac863999455bfb2

Oops. Sorry for the Change-ID... my git commit hooks get the better of
me sometimes :) You can remove this when you apply, or I can push up a
V2 if you prefer.

> ---
>  meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
> b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
> index c5bf107e5ee..0f1e2db8d7a 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
> @@ -19,18 +19,17 @@ EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)}
> "
>  
>  EXTRA_OECONF += "--disable-python"
>  
> -PACKAGES =+ "alsa-server libasound alsa-conf alsa-doc"
> -FILES_libasound = "${libdir}/libasound.so.*"
> +PACKAGES =+ "alsa-server alsa-conf alsa-doc"
>  FILES_alsa-server = "${bindir}/*"
>  FILES_alsa-conf = "${datadir}/alsa/"
>  
> -RDEPENDS_libasound = "alsa-conf"
> -
> -# alsa-lib gets automatically added to alsa-lib-dev dependencies,
> but the
> -# alsa-lib package doesn't exist. libasound is the real library
> package.
> -RDEPENDS_${PN}-dev = "libasound"
> +RDEPENDS_${PN}_class-target = "alsa-conf"
>  
>  # upgrade path
> +RPROVIDES_${PN} = "libasound"
> +RREPLACES_${PN} = "libasound"
> +RCONFLICTS_${PN} = "libasound"
> +
>  RPROVIDES_${PN}-dev = "alsa-dev"
>  RREPLACES_${PN}-dev = "alsa-dev"
>  RCONFLICTS_${PN}-dev = "alsa-dev"
-- 
Joshua Watt <JPEWhacker@gmail.com>

