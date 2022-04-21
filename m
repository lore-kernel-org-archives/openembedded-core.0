Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600D9C8302E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.19546.1650534843604789507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aftA4j09;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso3026889wml.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SeMrwk+YgYW/sLczwyyupDQbFL6Ezcn846Ftqlt16m4=;
        b=aftA4j09tAAkQlt+iRqcO6gg1kGF5cy9JKHNfVFfwR5uZCveq7aA++jGbJ/AkEm0Xm
         pz9Xs1BirMvaR4zGrag6/YQ4HeXfcktJEYTW9yYceoIvTDrls+hy610CWellloVgYDG1
         ucC/XvRqtFCYZIxEKQKrNpPbe18hexpE1/RXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SeMrwk+YgYW/sLczwyyupDQbFL6Ezcn846Ftqlt16m4=;
        b=BxnJ3VxNoIastuEOuHDNXMe6JPN04nAS8vyEgKgmTokFYnIohKjhGoYh5YYE7qp6cO
         jCXCMQWvjLUjd3HmsWUGl+dvlZ1iLpH0pZGOksxqZW1AZjOqBguRuvOIdcAsQp1fCI0V
         TKBFqFnYwlXbysYSbGW8/GghDE6vRSJiUymQ9HQMlfHflkeTwjRK09n+0XxpyMz5LeU5
         sDEPPM4JfCAufeltmvee2hxwycIZidVLZ25O8O6aVGKPUhmtA5PstrEDm00/+lu+/kQp
         yHoSIUOEIEFXd5FzmSNYQKVZtzGiqwjJRyWPQ+RpV7kyX1AF7IaSdsxR7R57cxN60Y/1
         94rQ==
X-Gm-Message-State: AOAM533pvnAHPWOrX2jpJrRxpti/od/RxSedG00c7oLBHKavcEnVgcWH
	SWwdmGbbqPqhUDFMrZJQ8hrDrNXtvUHWvw==
X-Google-Smtp-Source: 
 ABdhPJz+++dTjd514SXAPvJieuGfsXe1lSehQMFN1v853OWlo+OIVqUeWBLCuXV9xxA1iKiudOjtjQ==
X-Received: by 2002:a1c:2904:0:b0:37b:ea53:4cbf with SMTP id
 p4-20020a1c2904000000b0037bea534cbfmr7797186wmp.46.1650534841930;
        Thu, 21 Apr 2022 02:54:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:be2e:566:8fa4:996b?
 ([2001:8b0:aba:5f3c:be2e:566:8fa4:996b])
        by smtp.gmail.com with ESMTPSA id
 h14-20020adfa4ce000000b0020a7f8aeca8sm1894430wrb.16.2022.04.21.02.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 02:54:01 -0700 (PDT)
Message-ID: 
 <384d53b187a6fd3856720d56148cc24b6fd3e684.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] xorg-app: Tweak handling of compression
 changes in SRC_URI
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2022 10:54:00 +0100
In-Reply-To: <20220421113133.783bd083@melee>
References: <20220420115509.2525431-1-richard.purdie@linuxfoundation.org>
	 <20220421113133.783bd083@melee>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164753

On Thu, 2022-04-21 at 11:31 +0200, Luca Ceresoli wrote:
> Hi Richard,
> 
> Il giorno Wed, 20 Apr 2022 12:55:09 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> ha scritto:
> 
> > Rather than duplicating SRC_URI, change the compression to a variable.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb | 3 +--
> >  meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb    | 3 +--
> >  meta/recipes-graphics/xorg-app/xorg-app-common.inc  | 3 ++-
> >  meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb      | 3 +--
> >  4 files changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
> > b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb index
> > 573b05128e4..cd658ab219c 100644 ---
> > a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb +++
> > b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb @@ -15,8 +15,7
> > @@ RPROVIDES:${PN} += "mkfontdir" 
> >  BBCLASSEXTEND = "native"
> >  
> > -SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
> > -
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=99b1e1269aba5179139b9e4380fc0934" 
> > +SRC_URI_EXT = "xz"
> >  SRC_URI[sha256sum] =
> > "8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4"
> > diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb
> > b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb index
> > fa0fe36451a..e75a840b7de 100644 ---
> > a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb +++
> > b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.3.bb @@ -8,14 +8,13 @@
> > predefined values for various parameters used in communicating
> > between \ clients and the server, and the different types of screens
> > and visuals \ that are available." -SRC_URI =
> > "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz" -
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3" DEPENDS +=
> > "libxtst libxext libxxf86vm libxi libxrender libxinerama libdmx
> > libxau libxcomposite" PE = "1" 
> >  SRC_URI += "file://disable-xkb.patch"
> >  
> > +SRC_URI_EXT = "xz"
> >  SRC_URI[sha256sum] =
> > "356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206" 
> >  EXTRA_OECONF = "--disable-xkb"
> > diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
> > b/meta/recipes-graphics/xorg-app/xorg-app-common.inc index
> > 1c64e20aac7..6a9ebe842de 100644 ---
> > a/meta/recipes-graphics/xorg-app/xorg-app-common.inc +++
> > b/meta/recipes-graphics/xorg-app/xorg-app-common.inc @@ -8,7 +8,8 @@
> > DEPENDS = "util-macros-native virtual/libx11" # depends on
> > virtual/libx11 REQUIRED_DISTRO_FEATURES = "x11"
> >  
> > -SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
> > +SRC_URI_EXT = ".bz2"
> > +SRC_URI =
> > "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.${SRC_URI_EXT}" 
> 
> There's an extra '.' in ".bz2" that causes fetch failures.
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/725/steps/12/logs/errors
> 
> stdio: WARNING: xkbcomp-1.4.5-r0 do_fetch: Failed to fetch URL
> https://www.x.org/releases//individual/app/xkbcomp-1.4.5.tar..bz2,
> attempting MIRRORS if available
> 
> I'm dropping this patch from my master-next branch for now.

There is an updated version in master-next.

Cheers,

Richard




