Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC63DD35176
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 11:34:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10839.1775043277641885830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 04:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tasrzKNk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 80A781A3145;
	Wed,  1 Apr 2026 11:34:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EA69602BF;
	Wed,  1 Apr 2026 11:34:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E43E10450F65;
	Wed,  1 Apr 2026 13:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775043274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rjXOZpJ62g1cckrkjQoieN9WhOjcIspwbQCU7twv3aM=;
	b=tasrzKNkOB1T6HVE2PhXlCDLDL2glFBBSU5haqyvAuGkFMf0POP2avdQeFc6d8eeOcOJ4z
	oZJ0ozOYqf2D6KCZ1WSsRYuZAUuc3Szz1qXD8nTCib+hG5cuqE1dLl4Z6uhtlWHqbb6MGo
	XNBD79ylt0kcq1yFBQQViBh65vdPakivlDqwo4DM9Ord2lkksoqrgq9hlKnonoCVckUOWe
	/1r3V8zTW9POFpBzlBfNGgisbFw6m7FAAZ9YBY92Fknd8qPxmFK6FLfUIVKH+7d3YRHw7m
	U3unrvUblYON7OEUHohVcvuDT9UpRUCcmhlKE/ECaZCF/1neBFgGrIDeFUzjKA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: "stondo@gmail.com" <stondo@gmail.com>,
 "Tondo, Stefano" <stefano.tondo.ext@siemens.com>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Cc: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "ross.burton@arm.com" <ross.burton@arm.com>,
 Joshua Watt <jpewhacker@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 "marta.rybczynska@syslinbit.com" <marta.rybczynska@syslinbit.com>,
 "Marko, Peter" <Peter.Marko@siemens.com>,
 "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: 
 Re: [RFC PATCH 0/2] spdx30: Add OpenVEX standalone document generation
Date: Wed, 01 Apr 2026 13:34:31 +0200
Message-ID: <2048783.yKVeVyVuyW@brobin-bootlin>
In-Reply-To: <37522fb2c1dcceab49ab917cd0c1f880e5f23618.camel@siemens.com>
References: 
 <20260331141956.608976-1-stondo@gmail.com>
 <9600909.CDJkKcVGEf@brobin-bootlin>
 <37522fb2c1dcceab49ab917cd0c1f880e5f23618.camel@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 11:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234343

On Wednesday, April 1, 2026 at 11:58=E2=80=AFAM, Freihofer, Adrian wrote:
> On Wed, 2026-04-01 at 09:43 +0200, Benjamin Robin wrote:
> > [You don't often get email from benjamin.robin@bootlin.com. Learn why
> > this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >=20
> > Hello,
> >=20
> > On Wednesday, April 1, 2026 at 12:05=E2=80=AFAM, Freihofer, Adrian wrot=
e:
> > > I agree that generating the SBOM and then processing it with
> > > independent, specialized tools is the right approach =E2=80=94 and I
> > > believe
> > > that was also what I proposed, based on Ross's post in that earlier
> > > discussion.
> > >=20
> > > Taking this further, though, raises an interesting question: how
> > > could
> > > CVEs discovered after the SBOM/VEX was built with Bitbake be
> > > handled in
> > > a more automated way?
> >=20
> > I=E2=80=99m not sure I fully understand the question. This is exactly t=
he
> > purpose
> > of `sbom-cve-check`. It can be executed automatically from Yocto
> > post-build, or at any time later outside of Yocto.
>=20
> I was not aware that sbom-cve-check can export the CVE status as
> OpenVEX. If so, this question is obsolete and sbom-cve-check already
> does what I'm proposing. :-)

Hum, sorry. I have no idea why I said that sbom-cve-check can export
to OpenVEX. It can take has input (as annotation) an OpenVEX file.
But currently there is no export to OpenVEX

> > > A tool with access to the latest CVE database, an XL SBOM, and the
> > > corresponding source and debug packages could likely mark many CVEs
> > > as
> > > not_affected automatically =E2=80=94 for instance, because certain so=
urce
> > > files
> > > are not compiled, or a relevant #ifdef is disabled.
> >=20
> > `sbom-cve-check` is designed to do precisely this, or at least that
> > is
> > the goal. However, supporting `#ifdef` is not planned in the short
> > term;
> > filtering is currently done by filename.
> > Unfortunately, not many CVE entries contain the information needed to
> > automatically mark them as not affected. Only the kernel typically
> > has
> > this information properly filled in.
>=20
> That sounds already very good. The kernel is by far the most relevant
> part which should be supported by this feature.
> Let's hope that other projects start adding the source lines to their
> CVEs in the future. Then it will become even more valuable.
>=20
> >=20
> > > Would it make sense to extend sbom-cve-check to support exporting
> > > an
> > > OpenVEX document covering all CVEs at the time of execution? Such a
> > > tool would need to:
> > >=20
> > >  * Download the CVE database
> > >  * Extract static CVE status information from the SPDX document
> > >  * Attempt to automatically evaluate the status of CVEs found in
> > > the
> > >    database but not mentioned in the static SPDX
> >=20
> > I=E2=80=99m not sure I follow what you mean, this is exactly what
> > `sbom-cve-check` is already trying to do. It can generate OpenVEX
> > files.
> > Perhaps not everything is perfect yet (far from it), and some parts
> > may
> > still need improvement.

Sorry see answer above. It cannot generate for now OpenVEX file.

> Having an initial version which defines this new architecture would
> already be a very big step! Thank you for driving this.
>=20
> >=20
> > > This essentially describes merging Joshua's tool with Benjamin's
> > > sbom-
> > > cve-check into a unified tool that can ingest SPDX data, NIST
> > > information, source files, and more =E2=80=94 and produce various out=
puts
> > > such
> > > as CVE check graphs, summary tables, and VEX documents in multiple
> > > variants.
> >=20
> > `sbom-cve-check` can generate multiple export formats and can be
> > extended
> > to support additional formats.
>=20
> That leads then to the question about the purpose of the tool from
> Joshua. If I understand correctly it does something like e.g.
>   sbom-cve-check --do-not-use-cve-db-just-filter-sbom
> could do, right? The code used for that would probably already be in
> the sbom-cve-check and probably have 99% overlap with the code from
> Joshua's tool.

The command would be something like that:

sbom-cve-check --ignore-default-config --sbom sbom.spdx.json \
 --export-path openvex.json --export-type openvex

But again there is no openvex export-type (Yet)

> I'm just guessing and trying to understand where we could help.
>=20
> Thank you,
> Adrian
>=20
> >=20
> > > It's also worth asking how Yocto-specific such a tool would
> > > actually
> > > need to be. It could potentially be generic enough to support
> > > various
> > > Linux distributions =E2=80=94 which leads to the question: does somet=
hing
> > > like
> > > this already exist?
> >=20
> > The goal of `sbom-cve-check` is not to be tied to Yocto. As long as
> > you
> > can provide an SBOM in a supported format, `sbom-cve-check` should
> > work.
> > That said, there is still a lot of development needed to fully
> > achieve
> > this goal.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




