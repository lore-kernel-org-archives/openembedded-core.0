Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3590260FFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 23:42:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h4so5480881wru.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 16:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=KHcpZDZXmyaCat+ePpe+BqhbEv6pQVHthQ2d8bjyKbw=;
	b=bBHSJ5y5BXMRLVT6Zgp6ZrW85Su2p1tEbaHlbmQU29vToklJbDJFHbDn3i7Itjd6QV
	PHvT5wmH+Rxn59AGnkGmWaHx/jCtL8UN8NElAlvjes3FGJzQ3dxtmmajtW6OXe14/GBs
	ff8UyhFmiZMtJIiPpvdnaceOstg1J2GZ8I3mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KHcpZDZXmyaCat+ePpe+BqhbEv6pQVHthQ2d8bjyKbw=;
	b=qlbQ4WWWVQpuXeR4pflJGxNTVfMIHj0bBz7aLh1RVsFRHTlEgfe9MUJzTzsJCvXIJf
	hiGlPoUBkSIgeEuWHrsOhfemnCNpwWqiSXNvqGVOSKd0SckNogLO6igKls3XoJGokyaj
	JJFBGVLTx4Tusm4PcDF1o8xgEPJsJB7B6Mf3Aav51LnS/ez7mHzJQUazbWlaS1LVQW9K
	ML/1gCOJSAcLS8Gu0+pEsyNpbJttPvyAjTf+LrgTpRh9nXNT9HKibxf0MudVWnY321vp
	2NAmr42Kkts6yulUYpDMZmPkhU/Bit6iiJgsoXlBZ7qaEYNWxIzhlbaV+B2TVmec4bro
	ZiGw==
X-Gm-Message-State: ANhLgQ0k1GxjfcYb8HVg/CK98u1x1bUUC7tsVebtGZOm4ktnMtmuAnsI
	2VxhpA450l7x5jpi1ewjaGS2WuUl4n4=
X-Google-Smtp-Source: ADFU+vspf7G7J+aBCGXYzHFT6+PPQXsRs/VhdS0p0NYB3Yxg0lke32+0q4zG3qqxl87w1F7zsnEwoQ==
X-Received: by 2002:adf:fc8a:: with SMTP id g10mr7008017wrr.82.1584661359706; 
	Thu, 19 Mar 2020 16:42:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c124sm5374471wma.10.2020.03.19.16.42.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 16:42:38 -0700 (PDT)
Message-ID: <80d37c49027b32c2bebe939dbcd439240b0139c6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Hochstein <tom.hochstein@nxp.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 23:42:37 +0000
In-Reply-To: <20200319183425.12294-2-tom.hochstein@nxp.com>
References: <20200319183425.12294-1-tom.hochstein@nxp.com>
	<20200319183425.12294-2-tom.hochstein@nxp.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] wayland: Fix wayland-scanner missing from SDK
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
X-List-Received-Date: Thu, 19 Mar 2020 23:42:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-19 at 13:34 -0500, Tom Hochstein wrote:
> The FILES variable is customized to package wayland-scanner
> in the target -dev package. However, this is not correct for
> the nativesdk packages and causes wayland-scanner to be
> missing from the SDK.
> 
> Fix the nativesdk packaging by properly limiting the
> wayland-scanner target packaging.
> 
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta/recipes-graphics/wayland/wayland_1.18.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> index 00be3aac27..c7098483bc 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> @@ -54,8 +54,8 @@ sysroot_stage_all_append_class-target () {
>  	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
>  }
>  
> -FILES_${PN} = "${libdir}/*${SOLIBS}"
> -FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
> +FILES_${PN}_class-target = "${libdir}/*${SOLIBS}"
> +FILES_${PN}-dev_append_class-target = " ${bindir} ${datadir}/wayland"

Nobody can look at that and tell that its an fix for nativesdk
packaging. At the very least it needs a comment about what its doing
but I can't help feeling there must be some neater way we can do this
that overrides for nativesdk instead of misleading with target
references?

Cheers,

Richard




