Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DD3E6F086
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 20:23:34 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.3810.1730492607505841082
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 13:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iKYzE+7W;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c8c50fdd9so23459435ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 13:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730492607; x=1731097407; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DDNjVFJ84B1hi+MVHFwnSF/TvuFadxG9nvtanL26OuI=;
        b=iKYzE+7W5tnnVfhj1Y5hraXKr7Tpn/8Fba6Yd0sy2k3N89MvBxlH2LpwwqWEIwdh20
         INkTnmuXV+j26fnppPq3IUrfx5mTbyRPCwUQatTZ7hhN04xNjuwO4LwRv/KY3lHeC7Km
         65C5iXSC3B/ZKD7qfkVmzSidmOLh0TV3LmvydWxO1k25YmB2lFMDFvMRyg79Rp2NcJ4j
         5cE5eZw9Hf2XR8cqW7LEbc+0oolO14QZFWQ0e9qZ7CmesSXzorf8ZrcE9rgmZ5DOQuUW
         kmqwGC1LmdheRNH31sr5qcfTrab6a+tHDmM/Sn+PTH/VB81FBdA4VDX6Myv2AmovUo9P
         6mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730492607; x=1731097407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDNjVFJ84B1hi+MVHFwnSF/TvuFadxG9nvtanL26OuI=;
        b=o3C+AX2Mbuehfxj/Oq5Vm5YgkNK2HrVIFsk9V9jv5wdszIfIMIBzI15LQX/i/nOTb0
         mGgXuI2/tL7lw3w5DsVav2CN4Y+E5+2I5jNFOThbd7mYrIRbyoE4yi4a8CyY0mpc6QWa
         2s2UnSjOso/sPw+1kNEBn/znhyNK40KmlltSu3Tt++CoQr7ReCBTKabXg/anIB8lDNIL
         mI/iSNUrMbHFF0i+NqwNlhdvvjZEwyU5RFi5oHmkhsPCz0kpyeM1fNUrGZRkb4C2StH7
         6mOlK031svACF/cvo3qn9Y4NnDHrVupT2haKpUv+OVjBZccfHEJcwFohL3JuSGpPXFfu
         XjRQ==
X-Gm-Message-State: AOJu0YzGVApGOxBBptXBsIHRmbmOXILvvImoCxlAtt5sVijHmA1Q+uQt
	yDZv1ScyU4AuMhvrtEd2TO9BYW0/ZC+faV+p05HKR0cqr3NnU5AAZ4NbgI4J
X-Google-Smtp-Source: AGHT+IHmbFIZ2ypP7XzbElhLN2DuKBagFf8cTcuQpY1GBa2+7lGCdD+t9No4IdOzonnWSb9iGB5tMA==
X-Received: by 2002:a17:902:da92:b0:20c:5a7b:dcb3 with SMTP id d9443c01a7336-2111949740bmr66306275ad.30.1730492606795;
        Fri, 01 Nov 2024 13:23:26 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d43efsm24841535ad.264.2024.11.01.13.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 13:23:26 -0700 (PDT)
Date: Fri, 1 Nov 2024 17:23:23 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [oe-core][PATCH] drm-info: add recipe
Message-ID: <20241101202323.4ld6jdczxaoxk6fb@hiago-nb>
References: <20241101184156.2368109-1-hiagofranco@gmail.com>
 <CANNYZj-nmnzTFqPT2nCY2EWWirCpyo1Yw9gFUz9_=dMt3diYXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-nmnzTFqPT2nCY2EWWirCpyo1Yw9gFUz9_=dMt3diYXA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 20:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206632

Hi Alexander,

On Fri, Nov 01, 2024 at 08:22:03PM +0100, Alexander Kanavin wrote:
> Should this go to meta-oe rather? Why core?

I was not 100% sure, I just selected here because I saw the recipe for
'libdrm' and the 'recipes-graphics/drm'. I can move this to meta-oe if
openembedded-core is not the correct place. Please let me know.

> 
> Alex
> 
> On Fri 1. Nov 2024 at 19.42, Hiago De Franco via lists.openembedded.org
> <hiagofranco=gmail.com@lists.openembedded.org> wrote:
> 
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This recipe provides information about DRM devices, useful for debugging
> > and checking information about DRM.
> >
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc    |  1 +
> >  meta/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 meta/recipes-graphics/drm/drm-info_2.7.0.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> > b/meta/conf/distro/include/maintainers.inc
> > index 7aafa7a2d146..2c2779f8cf83 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -156,6 +156,7 @@ RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi
> > Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org>"
> > +RECIPE_MAINTAINER:pn-drm-info = "Hiago De Franco <
> > hiago.franco@toradex.com>"
> >  RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
> >  RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <
> > alex.kanavin@gmail.com>"
> > diff --git a/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > new file mode 100644
> > index 000000000000..9f1cbb47fbfd
> > --- /dev/null
> > +++ b/meta/recipes-graphics/drm/drm-info_2.7.0.bb
> > @@ -0,0 +1,13 @@
> > +SUMMARY = "Small utility to dump info about DRM devices"
> > +HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
> > +
> > +SRC_URI = "git://
> > gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
> > +SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit meson pkgconfig
> > +
> > +DEPENDS = "json-c libdrm"
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#206628):
> > https://lists.openembedded.org/g/openembedded-core/message/206628
> > Mute This Topic: https://lists.openembedded.org/mt/109340073/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >

Regards,

Hiago.

