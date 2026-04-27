Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961D0FF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 08:06:05 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38198.1777277156226929875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 01:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ET2pOGRl;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2AF1CC5CD44;
	Mon, 27 Apr 2026 08:06:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F21E600D1;
	Mon, 27 Apr 2026 08:05:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9979107222A5;
	Mon, 27 Apr 2026 10:05:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777277153; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w7rgxEaMxCnwe1hDsDA+CIUYO1BKngXfPhPLHsbLcyc=;
	b=ET2pOGRlr/ypJr9DWPQSVrY/Wb0SFuUJp0ygT2JrrsmjIBfxSdk383kkyBqH+hsaB2/Z4E
	r1qsPiFE/VeqD8ZG6AqwnHHf8ZFfqba8d8dm1naS+qe1WLXck3CfZXko8YV7qXn8jhbQIB
	cPM3iSJYsUwSoF+Wt6LUHUiuri6Lhcesr1oHoxivFead09mPSyR0K7W61GW5sspkxF1OG9
	kyoIgLLvcexurPvoVrYuwxrJK7AaLYsM1UtFp2RGXY8C15QIiFaxzzmESBknoWLD39sLXN
	VEaQA/uUnzqVj+MuMNO35BOPRggHdChq7AHKkjz8Rw1F2rLfFmBU0CGtHf5v5A==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "Marko, Peter" <Peter.Marko@siemens.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>,
 "jpewhacker@gmail.com" <jpewhacker@gmail.com>,
 "olivier.benjamin@bootlin.com" <olivier.benjamin@bootlin.com>,
 "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
 "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/3] python3-shacl2code: Update to version 1.0.1
Date: Mon, 27 Apr 2026 10:05:50 +0200
Message-ID: <6mazmQ5FTz6zTys132BKJQ@bootlin.com>
In-Reply-To: 
 <2b38a0354bdcb17270f8ce97db3eca2835320b3c.camel@linuxfoundation.org>
References: 
 <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
 <7o6_XKvhQ267WrzPXGIUdQ@bootlin.com>
 <2b38a0354bdcb17270f8ce97db3eca2835320b3c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 08:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235991

On Monday, April 27, 2026 at 9:59=E2=80=AFAM, Richard Purdie wrote:
> On Mon, 2026-04-27 at 09:25 +0200, Benjamin Robin wrote:
> > On Sunday, April 26, 2026 at 9:22=E2=80=AFPM, Marko, Peter wrote:
> > > I have sent ton of new false-positive cleanup commits this weekend.
> > > For many I couldn't find any explanation why they reappeared.
> > > Since there were also new true positives I think this is fine.
> > >=20
> > > But there should be a follow-up investigation for most of my
> > > commits to identify why those false-positives appeared and if the
> > > tooling can be fixed.
> > > Peter
> >=20
> > The current behavior of sbom-cve-check is documented here:
> > https://sbom-cve-check.readthedocs.io/en/latest/design.html#find-applic=
able-cve
> >=20
> > I don't think that the tool is not currently working as designed, but
> > maybe
> > there are wrong entries the product database. Also maybe we could
> > improve
> > the algorithm to try to reduce the number of false-positives.
> > The main problem is that the current state of the CVEs databases is
> > not great.
> > This is really not an easy problem to solve.
> >=20
> > Most of the time, the proper solution is going to define CVE_PRODUCT.
> >=20
> > If you have a list of CVEs that need to be investigated, could you
> > send it.
> > This way I could explain or investigate why there is a problem?
>=20
> One idea in the back of my mind is our own "enrichment" data.
>=20
> Rather than recipe fixes every time, perhaps we start maintaining our
> own supplement to the CVE database data?

I am not sure this is the proper way of doing this.
=20
> That might be useful to others, encourage collaboration and perhaps get
> the upstream entries ultimately updated?

The proper way is to contact the CNA which is responsible for the entry.
=46or example for https://cveawg.mitre.org/api/cve/CVE-2025-9951
The providerMetadata->orgId is 14ed7db2-1595-443d-9d34-6215bf890778, which
is "Google LLC", and the associated contact email is "alphabet-cna@google.c=
om"
(see the CNA database inside sbom-cve-check: look for cna.toml)

But yes it is more work...

> Cheers,
>=20
> Richard
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




