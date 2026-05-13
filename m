Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C643CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 12:51:51 +0000 (UTC)
Received: from mailer194.gate185.sl.smtp.com (mailer194.gate185.sl.smtp.com [192.40.185.194])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5502.1778672650451238841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 04:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=lGJOhA4R;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=L2pb0I1X;
 spf=pass (domain: centricular.com, ip: 192.40.185.194, mailfrom: nirbheek@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.124] (unknown [10.138.12.245])
	by mtl-mta04-out1 (Halon) with ESMTP
	id e92c6e4d-d6ff-45f8-8253-b6912cf1d287;
	Wed, 13 May 2026 11:24:07 +0000 (UTC)
Received: Received from 10.138.12.40 by Caffeine (s0-aws-app2-swarm-manager-2)
 with SMTP id 62f051a7-1726-4323-955b-02ccdda27567  for
 openembedded-core@lists.openembedded.org;
  Wed, 13 May 2026 11:23:48 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app-mta-in-1 (Halon) with ESMTPSA
	id 62f051a7-1726-4323-955b-02ccdda27567;
	Wed, 13 May 2026 11:23:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0DF769CB2D;
	Wed, 13 May 2026 13:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1778671426;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mbakEvN8lhCVVl5i0EFax6W5fdJGMA2Ai61WmKO4alc=;
	b=lGJOhA4RL97Sgv2jtty8UY3NahIFAFtJ/Bu0muS+1at8VY7UewnDfaQrWEVUVddQqoqF5E
	prcV7mDsOaS48abfCvjvVHD2QvUqiwqRxuw6B/7b1TWqSETzR4cv+KyLAJJ8WDMAP+rzxg
	FBFAydRtQWw8Bfdk6DFEUaSvLDxyFpjPby7zxjp+WZgAoQWFNX92GfRPuvGguPt4shg6dk
	0M9ZXv3UX4kKsOEDcvoh68iSWrCguYmiD2EnyHkCBtC6ewK/DkJ81tgmm3e914BoTO9JwK
	BbbgjrJeXr59R067Lpt4OK3i2zUpkPlD/5ST/+gE8JKumc0TzhmGJRt1w/he5A==
Message-ID: <885d89d6d131a5b1649189936537154f290e1dc6.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-rs: add new package
From: Nirbheek Chauhan <nirbheek@centricular.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, tarun@centricular.com
Cc: openembedded-core@lists.openembedded.org, sebastian@centricular.com
Date: Wed, 13 May 2026 16:53:33 +0530
In-Reply-To: 
 <CANNYZj8sYaa=hGCCWViiOQojN9TjuroAPs7FHhVLCT=g+Ut1=w@mail.gmail.com>
References: <20260511133450.50595-1-tarun@centricular.com>
	 <20260513071155.1215141-1-tarun@centricular.com>
	 <CANNYZj8sYaa=hGCCWViiOQojN9TjuroAPs7FHhVLCT=g+Ut1=w@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: 62f051a7-1726-4323-955b-02ccdda27567
X-SMTPCOM-Message-ID: 68bd0628-17f9-4b54-92f4-6989c6164320
X-SMTPCOM-Payload: 
 VoVXOsIOQtluNzaKwV4aw9FHwMsT9KmSrImshLfqFtARo5VmbInSXpYpKjSmOO9F79cRXlOi3t6lZCBKOL5qg_fxEEwzcq3jK8wU6A4xWFM5cetG_oVF_SqhYEYBtYvocGRB8RlNTfKZ5nPdbJ0mwRoSY5gxhQtQ8bSyASOsq2KaW0wXF14nuz8GC9vNBFqNgV5xwyFOYN8RhiyNNFUT7A==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=68bd0628-17f9-4b54-92f4-6989c6164320_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=68bd0628-17f9-4b54-92f4-6989c6164320&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1778671440;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : content-transfer-encoding :
 mime-version : list-unsubscribe : list-unsubscribe-post : subject :
 from : to : cc : date;
 bh=mbakEvN8lhCVVl5i0EFax6W5fdJGMA2Ai61WmKO4alc=;
 b=L2pb0I1XJHG6LE3gbvOyl+qnxKzkfhhq5JfY4Ss0YYh10IZ17Pdo4TMNrCk0U0XW6KPUB
 KwE9uRRx2YFXwK5u9qF2cMhdPKKkDBHHaH1xFJiv7eSlm1xe/3wjRuW7Dlqsaowq/y28rQ/
 ki5CSfaisGNL8dycDnKQ6fslqAyAh5cAGmoQupkudZn+uY5ONbRCxP9JSHV3Yw5F2JE6kKn
 h+T5DIwe7hxptVTiFtNwiF8TbXkQB1kFMHlYSXLiK9SOJMSqGikv3knf2d2DHwfNH8D+oIN
 +q/qaaN/om5ON6Dp1cF0rpjj1hR0zpBChom7+RvnOp0zWjCyewGyk9DvGvKg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 12:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236971

Hi Alexander,

I thought I'd chip in as a GStreamer maintainer and answer some of your
questions :)

On Wed, 2026-05-13 at 12:19 +0200, Alexander Kanavin wrote: =20
> > Unlike the other GStreamer submodules, the Rust plugins follow a =20
> > separate release cycle and versioning scheme. These plugins are
fully =20
> > stable and required for a fully-featured GStreamer installation, as
most =20
> > new features and plugins are being written in Rust. =20
> =20
> =20
> There should be evidence for this claim. If most new features are =20
> written in rust, then the rust plugins should be in the core
gstreamer =20
> project, following its release cadence, and they aren't.

gst-plugins-rs is a part of the core GStreamer project. Most new
features and plugins are written in Rust, and in fact we are
*rewriting* C plugins in Rust.

These plugins aren't in the GStreamer monorepo and have their own
release cadence for technical reasons that are documented in the
project's README:

https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs#why-is-this-separat=
e-from-the-gstreamer-monorepo-with-an-independent-release-schedule

We have already rewritten the RTP/RTSP stack in Rust, including most of
the RTP payloaders and depayloaders. As of the 1.29.1 development
release (soon to be 1.30), these Rust implementations are preferred
over the C implementations[1]. The WebRTC stack has also been rewritten
in Rust[2], including the ICE library[3], and when this implementation
is stable, it will replace the C version.

1)
https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs/-/work_items/755
2)
https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs/-/merge_requests/29=
55
3) https://docs.rs/librice/latest/librice/

The recommended fragmented MP4 muxer (used for HLS/DASH etc) is also
the one written in Rust. Generally, all the plugins that are enabled-
by-default in this V2 recipe posted by Tarun are important plugins that
replace or accentuate functionality provided by C GStreamer plugins.

This is also why at least _these_ plugins should be in oe-core. They
are at-par with core functionality in gst-plugins-{base,good,bad}, and
provide functionality that is not available elsewhere, e.g. RTP AV1
support or AC-4 audio parsing.

> These all need to be split into their own recipes, or there should be
> an explanation of why that isn't possible.

It should be possible to split this recipe into N recipes one for each
plugin, since these plugins are published individually to crates.io[4].
Then we could make a call for which ones should be in oe-core and which
should be in meta-oe. That affects the maintenance burden, though.

4) for example: https://crates.io/crates/gst-plugin-webrtc

Cheers,
Nirbheek

