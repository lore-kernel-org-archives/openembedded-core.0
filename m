Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BDBC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 09:29:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.41552.1674120570783555230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 01:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PA7c4E+p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4CDC140006;
	Thu, 19 Jan 2023 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674120568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTMKpmmdw1m6NovbxgxeiYfeJLXzbjpDaMKItsMRCy4=;
	b=PA7c4E+pg0ebLbexbHASoM2L3PHIr2/bFnWeEwZ5LqkNsShEuU4YohnMCbH5tmexHI4NH+
	b/UmW6s1+Y6ympcZ08fP9Mw/beKh5pBOIFDRwy9AJ9GhssQ71M5ta5QEBP4M5C5Uyp2kIp
	PaqD7zmqjgujlLQ86FyWXdLuB1sVjVDHoJn52VpPg/2J5ka2VsHmvmkOG03+7BTpAUuWI7
	twvfWk64wiIxlTLPVJ9ZGbKOPIPjytjdAJ691saASA9v9xW8Hmas0t2mbw5Iga0loAhOU4
	Q0UaAef523q40z3i7mkmYVVe31Z/G7+THDmMpK7hQrlYNxw9EPbw86H+tUjX/w==
Date: Thu, 19 Jan 2023 10:29:26 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
 GObject Introspection is enabled
Message-ID: <20230119102926.607b2f34@booty>
In-Reply-To: <2c4678f5a769445f90b4759a6d6dd259@axis.com>
References: <20230118112759.3909741-1-pkj@axis.com>
	<20230118172227.28bdb930@booty>
	<2c4678f5a769445f90b4759a6d6dd259@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176129

Hello Peter,

On Wed, 18 Jan 2023 22:22:22 +0000
"Peter Kjellerstedt" <peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Sent: den 18 januari 2023 17:22
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: openembedded-core@lists.openembedded.org; Richard Purdie
> > <richard.purdie@linuxfoundation.org>
> > Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
> > GObject Introspection is enabled
> > 
> > Hello Peter,
> > 
> > On Wed, 18 Jan 2023 12:27:59 +0100
> > "Peter Kjellerstedt" <peter.kjellerstedt@axis.com> wrote:
> >   
> > > This avoids the following error:
> > >
> > >   configure: error: Vala bindings require GObject Introspection
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>  
> > 
> > A different patch [0] to address the same bug is already in my testing
> > branch and is possibly being merged soon on master by Richard. Can you
> > please check whether your think your patch is better and let us know?  
> 
> I had not seen that patch when I sent mine. I think mine is a little better 
> since it defines and uses a PACKAGECONFIG for the vala support, which should 
> make it easier for anyone wanting to, e.g., disable the vala support even if 
> it is enabled by default.

Indeed. I'm replacing Alex's patch with yours in my testing branch in
order to have both tested. None is on master at the moment.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

