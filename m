Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13667C982CE
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:48:48 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14109.1789562918053713420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=Y6LWD8YG;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=Y6LWD8YG;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789562915;
	bh=HiHYycidY/c8EkUMN7Ja9C9YWwbi3uM4frND6a5nRHc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Y6LWD8YGRd/hfHvQtiJTnuDtLCBsJ1FEy9MtjgUm1S7N6L54ANDXMcTd8S9Egbm/m
	 0nYqHuGX0mgwt9lISJSF+g6DHamogAavsgrwMN/T6XHUm/PKAQBdfixWGIy/ZTlUVw
	 jgVd6T8NDv+1IHORtbXHOMqIF1UG5nxx2Py7Nsy+iKtPTInGEWeJqRBoffDLFuyH6p
	 L6vr2rGJO9d3oc9CCi96CR5/vrI73bb0DqL2DtdiIwZ3i6BDvZZuL93AAP6CaKbpIw
	 /mrkzz9cHOORO4psS308hWZfzYNMgjbsM2jR8T/DhwZo+sKKECHhoT7GERoQXM9Xsc
	 1zBLyAllg7UDw==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 7F6E85F784;
	Wed, 16 Sep 2026 14:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1789562915;
	bh=HiHYycidY/c8EkUMN7Ja9C9YWwbi3uM4frND6a5nRHc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Y6LWD8YGRd/hfHvQtiJTnuDtLCBsJ1FEy9MtjgUm1S7N6L54ANDXMcTd8S9Egbm/m
	 0nYqHuGX0mgwt9lISJSF+g6DHamogAavsgrwMN/T6XHUm/PKAQBdfixWGIy/ZTlUVw
	 jgVd6T8NDv+1IHORtbXHOMqIF1UG5nxx2Py7Nsy+iKtPTInGEWeJqRBoffDLFuyH6p
	 L6vr2rGJO9d3oc9CCi96CR5/vrI73bb0DqL2DtdiIwZ3i6BDvZZuL93AAP6CaKbpIw
	 /mrkzz9cHOORO4psS308hWZfzYNMgjbsM2jR8T/DhwZo+sKKECHhoT7GERoQXM9Xsc
	 1zBLyAllg7UDw==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 6BBAF5F749;
	Wed, 16 Sep 2026 14:48:35 +0200 (CEST)
Message-ID: <4428c5f1232a7c9bb98f3e441c3448c084074b8c.camel@emlix.com>
Subject: Re: [OE-core] [PATCH v2] classes: image-buildinfo: allow deploying
 the buildinfo file
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, paul@pbarker.dev
Date: Wed, 16 Sep 2026 14:48:35 +0200
In-Reply-To: <CANNYZj9nBkwDg0=O15BruyCwC1sr1gJ=VR-r4xr9xDq4UD049w@mail.gmail.com>
References: <93102958cda7288847f11ee797480f16ba36962f.camel@pbarker.dev>
	 <20260916062028.2282187-1-dwagenknecht@emlix.com>
	 <CANNYZj9nBkwDg0=O15BruyCwC1sr1gJ=VR-r4xr9xDq4UD049w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245970

Hello,

On Wed, 2026-09-16 at 12:43 +0200, Alexander Kanavin wrote:
> > +IMAGE_BUILDINFO_DEPLOY ??=3D "0"
>=20
> Do we need yet another variable and yet more conditional code paths
> that are never tested? Why not just always deploy it?

I'd be fine with adding it unconditionally. Waiting for further
opinions on this before changing that.

Daniel


