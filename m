Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C396C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 13:59:30 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.25948.1639490369661660328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:58274 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mx8L1-00034h-Ou; Tue, 14 Dec 2021 08:59:27 -0500
Date: Tue, 14 Dec 2021 08:59:24 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Ross Burton <ross@burtonini.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] ROOTFS_POSTPROCESS_COMMAND versus do_install_append()
 and using ${D}?
In-Reply-To: 
 <CAAnfSTvyCdxsF1jjGqKXEecA2t_wj9UohEnuzAPLJV-My7mEKg@mail.gmail.com>
Message-ID: <15a0e56c-1782-38ab-ea1f-bf5c386b994@crashcourse.ca>
References: <a3f88955-541b-7aef-d3b6-b5de28cfa83@crashcourse.ca>
 <CAAnfSTvyCdxsF1jjGqKXEecA2t_wj9UohEnuzAPLJV-My7mEKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 13:59:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159691

On Tue, 14 Dec 2021, Ross Burton wrote:

> On Tue, 14 Dec 2021 at 11:39, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   what i'm looking at now does it in a more curious way. there is a
> > catch-all recipe file (call it "catchall.bb") which lists, as its
> > DEPENDS list, *all* of the recipes that make up the image, which means
> > that building catchall.bb builds and populates an image directory with
> > the combination of all those other recipes, after which it defines
> > both pkg_postinst_${PN} *and* do_install_append(), both of which run
> > around and make changes relative to ${D}, given that the image
> > directory for that recipe effectively contains, well, everything that
> > will go into the rootfs.
>
> Either you're explaining badly, or that isn't doing what you expect.
>
> A normal catchall.bb recipe which DEPENDS on all other relevant
> recipes will result in the recipe-sysroot directory containing the
> sysroots for those recipes, but that is all.  the image directory
> won't contain anything apart from what catchall.bb's do_install
> installs.

  yeah, i was typing quickly and screwed up my explanation totally.
i'll try again after imminent meeting. le *sigh*.

rday

