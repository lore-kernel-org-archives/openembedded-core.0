Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420CEC55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 11:54:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38646.1785930839527099458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 04:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NE6bgzBg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 40F611A142F;
	Wed,  5 Aug 2026 11:53:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D437602AB;
	Wed,  5 Aug 2026 11:53:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D82C711C30773;
	Wed,  5 Aug 2026 13:53:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785930832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yvgq1uA5cixMGU2OOPoHPOxb5QrU3rEeKkblOJe4egQ=;
	b=NE6bgzBgiBLaPrHCYZrtU2ILt9EEFBqTQZV1M9HDaZWkdBbpikcphgjBBguoxfLwOCiHHV
	KeixOsVab5Vmi+fokyB9lhwg0J2vb26j94RpdOf6AUXGF8GMBvVCH/+bnkXNxaMbnlYarW
	h2ODHh8Ca/ZqDx7cWEv/7bOGmV7Eq9QlvnbDLZR8ogmQMOYlVqloxlr2idersRFYjoDko3
	Pc6ySqKDEyBoMz+Gp5hNA1kq7fJaGBEscLhTocT74jNsWzPjLOXSG1XjcHM0QXHurdKKdG
	GRaowVPnmG/i0ue2h1IfcyEOV4zdnUizjEe3yyGPdqQArljAJ/EgfepRY26hEA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>,
 "olivier.benjamin@bootlin.com" <olivier.benjamin@bootlin.com>,
 "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "pascal.eberhard@se.com" <pascal.eberhard@se.com>,
 "wahid.essid@se.com" <wahid.essid@se.com>
Subject: 
 Re: [PATCH 0/3] sbom-cve-check: Update to version 1.3.3 and update CVE
 databases
Date: Wed, 05 Aug 2026 13:53:49 +0200
Message-ID: <bw3zkoBBRe-stxJ7o3YWrw@bootlin.com>
In-Reply-To: 
 <AS8PR10MB5073728DC68610A9254ED210FDD32@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260803-update-sbom-cve-check-1-3-3-v1-0-c0e5e198030e@bootlin.com>
 <AS8PR10MB5073728DC68610A9254ED210FDD32@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 11:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242864

Hello Peter,

On Wednesday, August 5, 2026 at 12:00=E2=80=AFPM, Marko, Peter wrote:
> I have noticed that right after merging this commit, 9 historical CVEs we=
re newly reported in Yocto master metrics.
> (which is higher number than what was resolved by this update, which was =
3 or 4).
>=20
> All are caused by "no-version-ranges":
>=20
> gnutls CVE-2023-0361
> glibc CVE-2011-0536=20
> glibc CVE-2025-0577 (was "Fixed from version >2.40-17.fc41")

=46or the CVE-2025-0577:
 - The NVD database does not provide any version range.
 - The CVE List database only provides the following ranges:
   - >=3D 2.39-28.fc40 , <=3D 2.39-33.fc40
   - >=3D 2.40-12.fc41 , <=3D 2.40-17.fc41

These ranges are no longer used, since the range contains a packaging distro
version. It is not possible (programmatically) to know that version
2.44 contains the fix for this CVE. Indeed the 2.40-17.fc41 may provide
an additional patch to fix that particular CVE.

See associated issue [1]

> ovmf CVE-2017-5731
> ovmf CVE-2019-14584
> pulseaudio CVE-2020-15710
> pulseaudio CVE-2020-16123
> openssl CVE-2015-3216
> ppp CVE-2020-15704 (was "Fixed from version 2.4.7-2\\+2ubuntu1.3")

=46or the CVE-2020-15704 this is exactly the same case as CVE-2025-0577.

>=20
> I guess the two above which I extra commented are something which in theo=
ry could be looked at and handled in code?
> The rest are unfortunately all data source issues.
>=20
> I'll send annotations for all anyway...

The proper way is to send an email to the CNA to fix these version ranges.
Most of the CNA that we contacted fixed the CVE entry pretty quickly.

CVE-2025-0577 and CVE-2020-15704 do not provide proper version ranges
(with upstream version). This is why sbom-cve-check indicates
"no-version-ranges".


[1] https://github.com/bootlin/sbom-cve-check/issues/26

Best regards,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




