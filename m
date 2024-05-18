Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E64C25B74
	for <webhook@archiver.kernel.org>; Sat, 18 May 2024 07:13:59 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.14628.1716016429450372880
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 00:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=0kt6z3RU;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4BO+T4wuc+jA6EWVbNqYw2WH+1DZ6oWHPzdj0yQJrec=; b=0kt6z3RUfZbFPa5OlMkbhUPNLr
	gqhDaVX4hfCY8uQZKyMWlycpaWlmNhKCoqJ9J91dxnrka1LZekdoDgcYgL9oHEIaF5vMBNhIaCUTO
	b99LZGrbfhUYcnJHP16XSeMRUrAgXm7G1Ro8/5XklB2U/pwwRbJSfDRVCPhV/JuWNDivuC0eih5Yy
	YYDEAp73BdrZD3vzUqBhFQeBibpng+awEvdWe3txruhg5zpGhP2K9X7hBjteC7Jjjmua5VQce8LUp
	tgOImKjkd01e8pkhPsrVbFDrdxWryC4BJ7UD0y//gk00+f3HdMEb8rWImVwEu6cCgmI7cm83cSxgh
	Zp+DylvA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s8EGI-000GW4-HQ; Sat, 18 May 2024 09:13:46 +0200
Received: from [85.184.138.13] (helo=[192.168.8.223])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s8EGH-000O1L-2w;
	Sat, 18 May 2024 09:13:46 +0200
Message-ID: <25736e15345c70d9ba4e21de106429b66a99cbae.camel@geanix.com>
Subject: Re: [PATCH 3/5] ninja: build modified version with GNU Make
 jobserver support
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Randy MacLeod <randy.macleod@windriver.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 May 2024 09:13:45 +0200
In-Reply-To: <b4aacad7-313d-4fdc-84c1-e1717f32ccc0@windriver.com>
References: <20240403070204.367470-1-martin@geanix.com>
	 <20240403070204.367470-4-martin@geanix.com>
	 <CANNYZj8x4kEP4GAuaei6Ct3bqcZoBnLk21xArzSgTGRmO71sXQ@mail.gmail.com>
	 <af5f84b11560409a0cb7e1657341d91d50beb84d.camel@geanix.com>
	 <b4aacad7-313d-4fdc-84c1-e1717f32ccc0@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27278/Fri May 17 10:25:09 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 07:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199530

Hi Randy,

On Mon, 2024-04-08 at 17:39 -0400, Randy MacLeod wrote:
> =C2=A0On 2024-04-03 3:08 p.m., Martin Hundeb=C3=B8ll wrote:
> > On Wed, 2024-04-03 at 17:58 +0200, Alexander Kanavin wrote:
> > > We can't carry this mass of patches. It has to land upstream
> > > first.
> > >=20
> > Understandable.
> > >=20
> > > Are you able/willing to drive the upstream pull request to
> > > completion?
> > >=20
> > No, I don't think so. I'm not familiar with the ninja codebase, and
> > the
> > pull requests has been lingering for too long.
> >=20
> > Another option might be to propose adding the fifo feature to the
> > kitware fork of ninja:
> > https://github.com/Kitware/ninja
> >=20
> > They have forked ninja to get the jobserver feature in, but haven't
> > taken the fifo part so far.
> >=20
> > The kitware fork is also used by buildroot:
> > https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/ninja/=
ninja.mk
> >=20
> I see that v2 has switched to kitware, which is fine in the short
> run.
>=20
> =C2=A0I'm just back from vacation. I plan to test this patchset out.
>=20
> =C2=A0I can spend some time convincing upstream ninja that a solution is
> needed for our use-case and=20
> =C2=A0that perhaps the jobsever approach and the kitware fork is a good
> starting point.=20
>=20
> =C2=A0Of course, I can't promise to "drive it to completion" but I'll
> hound the upstream devs for months or even years!
>=20
> Thanks for re-submitting the patchset Martin!
> =C2=A0

I got hit by a strike of motivation and submitted a new attempt on
jobserver support to ninja:
https://github.com/ninja-build/ninja/pull/2450

First review from the ninja maintainer seems positive. I'll resubmit
the my patchset to OE once the ninja PR is (hopefully) merged.

// Martin

