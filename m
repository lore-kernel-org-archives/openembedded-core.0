Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067C1CE79A9
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 16:00:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.13379.1695139200007071990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 09:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QNtpfNvl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3AC91BF203;
	Tue, 19 Sep 2023 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695139198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/RbCXoXmY4Nx5U027aDqmvr7ABUa55XkCVvg4JjI+I=;
	b=QNtpfNvlkAquRo5moBAXnfF+e6aqeSXzcmmxmwuDiZl7m0bDQ/LRM0VQz+RmzTmAdFCFlo
	unh+PCO/C4kbeo8zQARsZqfsNGac0kvohBURQJCgbKeAEx4pl0bnViXeShLkLq0nuIPmMr
	Qmk2C7RILeq7zr0AvDSRnQXzciIHQPIm4CFqh/O7Nrzka3HdMEKdY1lo/LGy0L39W648/m
	KunUBO70SM4trhM3uLILjtgOpLtlxNbQa/QbZaLi1p1OGN4T+rFNBytDo4G59/hdlnHuPB
	d2wgdFS0RfU86cq7u3okXHRFMbISaHzfQeh0O7Tn4dJbDQKaP4Y2ZuN7j1b0Zw==
Date: Tue, 19 Sep 2023 17:59:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] vte: upgrade 2.72.2 -> 2.74.0
Message-ID: <202309191559576fcd373c@mail.local>
References: <20230919114941.1819808-1-f_l_k@t-online.de>
 <CANNYZj_+k_AjWNXMK-uPFpH3uNL_aYFeCkXw=+3UCUKnmnGMcg@mail.gmail.com>
 <9RH81S.9NI7WQZ7L6QX@t-online.de>
 <CANNYZj967eyFsoO2uuQ0U185MFe9Dk9NXwDMWdp3Z-FYrPQkfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj967eyFsoO2uuQ0U185MFe9Dk9NXwDMWdp3Z-FYrPQkfA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 16:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187872

On 19/09/2023 15:20:59+0200, Alexander Kanavin wrote:
> Having gpl3-only recipes in core is not a problem. Ability to build
> basic images without gpl3 items is tested, since that kind of thing is

I don't think we test this anymore.

> important to certain industries, but otherwise there are no hard
> feelings towards gpl3. It is open source, and products do ship with
> gpl3, with all gpl3 license obligations fulfilled.
> 
> Alex
> 
> On Tue, 19 Sept 2023 at 15:06, Markus Volk <f_l_k@t-online.de> wrote:
> >
> > On Tue, Sep 19 2023 at 02:02:48 PM +02:00:00, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > we need to find a different terminal (rxvt or indeed gnome-terminal).
> >
> >
> > gnome-console is a simple thing. but it is necessary to build vte with gtk4 support (by the way, the default of vte is to build gtk3 and gtk4 support). Maybe the problem with both gnome-console and gnome-terminal is that they are GPL-3.0-only.
> >
> > SUMMARY = "GNOME Console"
> > LICENSE = "GPL-3.0-only"
> > LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
> >
> > GNOMEBASEBUILDCLASS = "meson"
> > inherit gtk-icon-cache gnomebase pkgconfig meson gsettings gnome-help upstream-version-is-even
> >
> > DEPENDS = " \
> >     desktop-file-utils-native \
> >     gtk4-native \
> >     gtk4 \
> >     libadwaita \
> >     vte \
> >     libgtop \
> >     pcre2 \
> >     gsettings-desktop-schemas \
> > "
> >
> > SRC_URI[archive.sha256sum] = "24cbd5680e525c2c0c57ad8d8c1ad199ef5b45b1ff1c80be22a37848e46e93ac"
> >
> > FILES:${PN} += "${datadir}"
> >
> > RRECOMMENDS:${PN} += "gsettings-desktop-schemas hicolor-icon-theme"

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187865): https://lists.openembedded.org/g/openembedded-core/message/187865
> Mute This Topic: https://lists.openembedded.org/mt/101454079/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

