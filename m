Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668D6C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 19:09:54 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.31211.1644433792735167324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 11:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=hD4Hwl3O;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1644433793;
  x=1675969793;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PwJnzUo5a0jnt09Ntwtn10LkZpPepGa6cXBqER3/INM=;
  b=hD4Hwl3OLMv77mRDyl99HIqS79Oo8DVVrETc+liJCnECgVEX8n+lYLRC
   cjw/XmieSmND4nLa5yhujvm4ePzMLrmdfD6PjKk/Ww7HiARCfu5MX5Wvr
   iXWAv06Q6QPFh/Q5EyLUJxLmTwnQ1M7VcxMmgTETHbk6OI9AfYPFVhsVs
   rQCd75kjJ0ul6N3MVw+fEaTWz6bt8dMmosYodO0D0f8tMthGKvnDNYqjX
   yiTGLr8BoEtsL4kL8/yVBjxn/v5vtR1vu+wNdXFwGBsnoU1uD6zv/Q3KL
   3bCFDjQiiPHx1+ce3n07Cxneia6Ukv2ZkDGpxWa9d4OpZAgYwvN5owPNv
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
Thread-Topic: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
Thread-Index: AQHYG79tJgBWxo/iOkaUvfBvB9yosqyLlVvA
Date: Wed, 9 Feb 2022 19:09:50 +0000
Message-ID: <dcb645fd99ba4e2ebdda348373486076@axis.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
 <20220207010823.143664-7-quaresma.jose@gmail.com>
In-Reply-To: <20220207010823.143664-7-quaresma.jose@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 19:09:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161586

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Jose Quaresma
> Sent: den 7 februari 2022 02:08
> To: openembedded-core@lists.openembedded.org
> Cc: Jose Quaresma <quaresma.jose@gmail.com>
> Subject: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
>=20
> - License update:
>   The code actually is LGPLv2.1 but the COPYING file is wrong.
>   https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0c=
e175b167611a4cb019599d9017042

Since the COPYING file for the GStreamer sub-projects now states=20
that the used license is LGPL-2.1, shouldn't the LICENSE for these=20
recipes be updated to say "LGPL-2.1-or-later"?

As for -bad and -ugly, they should really have individual LICENSE:foo=20
for each generated package, so that only the packages that are affected=20
by the GPL license includes it, and the others only specify LGPL.

//Peter


