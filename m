Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B00DEB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 14:34:30 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8692.1689950069688454704
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 07:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L7fGA05g;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F89120012;
	Fri, 21 Jul 2023 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689950067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NE0gaEvn6Sezn9Zyet2hixui21S/L5dtFd4LAc4WYfI=;
	b=L7fGA05gcePnms6kicJmjKrNONAjwSCemNQL51zU0i6ow76TPK71BY8JoUoy+ZBwXt1FCO
	GaGhudnN4YiznpzO3SUv2OoNYYWnRD6K7qKovckURl0RleksLc1izIRAfHLCbCHROcejj3
	e3jGNdi754HsVQwxlYntCKdsSMB0hMTPoB7phYuPKc+GL5ksorF1svjgfn+3PHqj9czQ5M
	L3sc5hq94m+tBOC0typg1c5CPNxlOBmIXvKj+JbGu+xN/szhq8GDP2D82xvOJE8uhn4X0q
	TKhFONwV3L+vXOUPZ0GS9xngHz4hCgoKti2TJQHfhfdqFkbd7z/X5ij/RlVRVQ==
Date: Fri, 21 Jul 2023 16:34:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] tunes: Add support for sve instructions on
 armv8/armv9
Message-ID: <20230721143426fc21c0b0@mail.local>
References: <20230711201042.38285-1-raj.khem@gmail.com>
 <B1D99B0D-B820-43F0-A699-C7A121D74205@arm.com>
 <CAMKF1spwCD0=UumG2ffh+_1F8AVcsLxxs63+pDkbkvHAwYr7sA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1spwCD0=UumG2ffh+_1F8AVcsLxxs63+pDkbkvHAwYr7sA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 14:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184701

Hello Khem,

On 12/07/2023 09:12:54-0700, Khem Raj wrote:
> On Wed, Jul 12, 2023 at 3:29 AM Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 11 Jul 2023, at 21:10, Khem Raj via lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> wrote:
> > >
> > > This helps in defining correct compiler options and configure options
> > > for glibc and overall ABI for toolchain
> >
> > Given this, shouldn’t the glibc patch respect the tune flags instead of forcibly turning sve off?
> 
> It will as a follow up.

I think we are still waiting for the follow up.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

