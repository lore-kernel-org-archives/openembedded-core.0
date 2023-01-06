Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8396DC4708E
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 03:15:17 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.5510.1672974914516683450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 19:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l1tJxB16;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id c133so200418oif.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 19:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lGfa47SeJWEmtTDKLE9R0hMKZ+2DM9nMO+TxEYBRY0w=;
        b=l1tJxB16f2lB5sfinYwUezaAWXihXgCxjHXbpfxyvbhyxlAeIFkEBdBqyPuMdQ9BGM
         bYSDo7yNEnjayCGax+SSbiwDdH8sdsy6E1eJxDiO6WDMzopRlMwdBDO3u50MOzfQFAVa
         lOqVSdsXgtJXoOIkwePf3Z84jciP4zaWG3OJFafa9NYWIyMO5jYOCGNKuGtP23b2zBrl
         nOi5mDfFwLHpi4NCp0NrpQLft6QlZr56ltUX68BSBdoQ9QRwxD/TgzgNVB7R1v0ugQEs
         WqPCsAcPnsk0I3ONRqNDhbjWGt2MS+ixjxKDLQrxATs+v63QYaq1AQPwhhpAlyiKFj0V
         EfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGfa47SeJWEmtTDKLE9R0hMKZ+2DM9nMO+TxEYBRY0w=;
        b=iDgUTFpah2mj6ZFGSbda1Cq3RikcCgYNzIjIW6MuH4Z7EDZYODYQTG12WFk/SdMV2C
         nd1N0+Ihb+FxeSXbb+g3zwKCxN91urkgYwA3hSsDSeOTCT4AZRsnuV/bayMGEAHTfeA5
         WmrQoY5qw74LhVMjZ7WJOU0qoPfTUSMnCmm/O33IbshYh39bnbZR0Kr5rkcLcS91BVRJ
         5tw57UG2v5l6Ial5ZTH6ehd0LUGyOF6lEZroFQSLkzWhk4b3wcMRWEi691iqcZgHPJN+
         8G/cLrviDDybnbM5fflGy+p1LA5OtNkxQiJTPxoxC7RfQiFGh91sUzgTYZ9av3dY0PgW
         l2xw==
X-Gm-Message-State: AFqh2kr+D/AXkfPDrLfwbVc/MaybQjeKsQe1jQooog81Pqi5QIWfWDYB
	YzVDqcuLAVBv7lKXdKAtDKMsQWjn0ruWJsZODn8=
X-Google-Smtp-Source: AMrXdXuYI2NYfg9OJ1NFG/lvOW7de5CXCNkYc/3wc0zpSpKQT7ByLkihRQ+P6qCV/wyZmhTDDxO4bzSBAH/QYjhKQP4=
X-Received: by 2002:aca:6085:0:b0:363:240c:bdc7 with SMTP id
 u127-20020aca6085000000b00363240cbdc7mr2216536oib.55.1672974913735; Thu, 05
 Jan 2023 19:15:13 -0800 (PST)
MIME-Version: 1.0
References: <20230101132326.398971-1-f_l_k@t-online.de> <CAMKF1srnx4w1Vm=KxmM+LCnLdOCbWgOj6BkhpVZTx133P0_95Q@mail.gmail.com>
In-Reply-To: <CAMKF1srnx4w1Vm=KxmM+LCnLdOCbWgOj6BkhpVZTx133P0_95Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jan 2023 19:14:47 -0800
Message-ID: <CAMKF1sp2ekBLcmKBJm59pd_cD+nxawh1i77z1iWEp1bpoEruHg@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gtk4: update 4.8.2 -> 4.8.3
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 03:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175555

On Thu, Jan 5, 2023 at 11:57 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> I am seeing native build failure
>
> https://errors.yoctoproject.org/Errors/Details/686967/
>

A deeper look into this reveals that issue is tiff recipe upgrade to
4.5.0 and not this upgrade.

Alex,

Perhaps restage this patch but unstage tiff update patch [1]

[1] https://lists.openembedded.org/g/openembedded-core/topic/96047877#175554

> On Sun, Jan 1, 2023 at 5:23 AM Markus Volk <f_l_k@t-online.de> wrote:
> >
> > Overview of Changes in 4.8.3, 12-22-2022
> > ========================================
> >
> > * GtkText:
> >  - Claim gestures more selectively
> >  - Prevent unexpected notify::direction emissions
> >
> > * Accessibility:
> >  - Remember if we don't find the a11y bus
> >
> > * DND:
> >  - Prefer file:// urls over other protocols
> >
> > * GtkMountOperation:
> >  - Work on Wayland
> >
> > * GtkListView:
> >  - Cancel rubberband if not handling drag
> >
> > * Wayland:
> >  - Fix button masks
> >
> > * Windows:
> >  - Fix resizes with native decorations
> >
> > * X11:
> >  - Fix some ordering problems with surface destruction
> >
> > * Translation updates
> >  Abkhazian
> >  Basque
> >  Dutch
> >  Hungarian
> >  Interlingue
> >  Georgian
> >  Persian
> >  Russian
> >  Spanish
> >  Turkish
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb => gtk4_4.8.3.bb} | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >  rename meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb => gtk4_4.8.3.bb} (98%)
> >
> > diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> > similarity index 98%
> > rename from meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
> > rename to meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> > index fe18fa2ffd..6101905128 100644
> > --- a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
> > +++ b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> > @@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> >  UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
> >
> >  SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
> > -SRC_URI[sha256sum] = "85b7a160b6e02eafa4e7d38f046f8720fab537d3fe73c01c864333a983a692a9"
> > +SRC_URI[sha256sum] = "b362f968d085b4d3d9340d4d38c706377ded9d5374e694a2b6b7e6292e3cba74"
> >
> >  S = "${WORKDIR}/gtk-${PV}"
> >
> > @@ -106,7 +106,6 @@ GTKBASE_RRECOMMENDS ?= " \
> >      adwaita-icon-theme-symbolic \
> >  "
> >
> > -
> >  GTKBASE_RRECOMMENDS:class-native ?= ""
> >
> >  GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#175185): https://lists.openembedded.org/g/openembedded-core/message/175185
> > Mute This Topic: https://lists.openembedded.org/mt/95987319/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

