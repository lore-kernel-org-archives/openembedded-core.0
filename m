Return-Path: <danc@opengear.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800075.outbound.protection.outlook.com [40.107.80.75])
	by mail.openembedded.org (Postfix) with ESMTP id BC78B7FB60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=GG18ssOYU6z4suIw1Xchw+4/uOPsfWTOoIrnhTmkNKKowxMjFnejJIx4PFkV8EdnRQeGeORFgBJFDjy8DV21bkz/yHBcqNUoZR9FIY87bKGlLbCJzDlnMybZOPg6oJElS8OcRgBOrrXxAkIACC1tbJJCeJ6Ha8e/F5GWnB5otxxtCzYaTsuF6X81UrDJKh71fKfEUWYb8ZtPe2znI5/B0Q2/iz9AnvldPLUf0nfEJf+inD04Av/PwvVttvjt93uDyDLweNgxwD0upkFr4J9ftTAmy1KytAqtQTDst/a5BJB8k2qZz7eT6pFkTArRcgSDHiohbPUQBXQZJ0EjBH+Bbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vnv+MuaFjm1rYO3i+nM/524gqdloMgNTk7syfQxH1W4=;
	b=cQ+t/6v2XBDXU4M31WSBjIT2rzCu+tl5nn3MjnWviAfukfkbHmIC5yaiZAsgKrNcVtXOShPhNlvojSxnV9/fjb+vN3BMAm+T5qgrsrei6YVNLf0b6AwxxKoS2F3MqN+H4TK4UMAcdY5wztNCVP3HhwfAlDoCjDQyJCnwc0DUPG5CkdIzAV4YMTlrovLUfeJDRvcUlcdkFSGWjxZAbwVekOJpK7/grHV0l9jQNuumxt1xDdCjTnId5kstBwFd6rWzkd1CNDqR+ze16ynSjaBCO82CRTOs8Unx+8oOMdG4zpzCUkhZq+MoWshxcdpw4lconQ/umT6ixliYpT2ilOaOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vnv+MuaFjm1rYO3i+nM/524gqdloMgNTk7syfQxH1W4=;
	b=l+XQQcBy7fNgYM9ao7+cxWbSJmcqPZkV92azdNlFrpREzHixERHcI2hNd0mnuLrGLyhir0SHV3X4A7or6efPvTcB+PL0dYGg0kHy1aOYi/Qk2geYwERY+pKPitX+lQ6KGKDIWasPhWWlEOpAwXhIYtt+g4+037Y2Xi30qhAqC3k=
Received: from DM5PR15CA0061.namprd15.prod.outlook.com (2603:10b6:3:ae::23) by
	CY4PR15MB1256.namprd15.prod.outlook.com (2603:10b6:903:112::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17;
	Tue, 29 Oct 2019 21:46:08 +0000
Received: from SN1NAM04FT041.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::204) by DM5PR15CA0061.outlook.office365.com
	(2603:10b6:3:ae::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22 via
	Frontend Transport; Tue, 29 Oct 2019 21:46:08 +0000
Authentication-Results: spf=pass (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=opengear.com;
Received-SPF: Pass (protection.outlook.com: domain of opengear.com designates
	60.241.24.90 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=60.241.24.90; helo=postman.bne.opengear.com;
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT041.mail.protection.outlook.com (10.152.89.19) with Microsoft
	SMTP Server id 15.20.2387.20 via Frontend Transport;
	Tue, 29 Oct 2019 21:46:07 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 844E4DEBA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 07:46:05 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 6941E43E8B39; Wed, 30 Oct 2019 07:46:05 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
In-reply-to: <20191029201821.GA26658@localhost>
References: <20191015061510.21803-1-dan.callaghan@opengear.com>
	<20191015224456.22136-1-dan.callaghan@opengear.com>
	<20191029201821.GA26658@localhost>
Date: Wed, 30 Oct 2019 07:46:03 +1000
Message-Id: <1572385232-sup-1496@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(346002)(39840400004)(136003)(376002)(189003)(199004)(33964004)(26005)(44832011)(476003)(2906002)(229853002)(2870700001)(106002)(568964002)(478600001)(8676002)(186003)(966005)(26826003)(486006)(7636002)(103686004)(5024004)(246002)(76176011)(305945005)(6306002)(6246003)(58126008)(42186006)(316002)(336012)(70206006)(6266002)(5660300002)(356004)(6916009)(76130400001)(8936002)(70586007)(235185007)(126002)(21480400003)(4001150100001)(11346002)(446003)(426003)(36906005)(71190400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR15MB1256;
	H:postman.bne.opengear.com; FPR:; SPF:Pass; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71a8182a-1abe-4078-2fa9-08d75cb967f9
X-MS-TrafficTypeDiagnostic: CY4PR15MB1256:
X-Microsoft-Antispam-PRVS: <CY4PR15MB1256EDE72126966724402299B8610@CY4PR15MB1256.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0LDOk4lePJzuxwdTwn6Pl1xxCAotJQHvdpfD55CGaJzZxgAeXVTo0vwQ8voeNfK582nwI/OezqKa6KHOrLcIInrqk6nl0j9aNLlPYO7RsnWPebkt7iXXCqpAogsoXzxeLuURtLuwJ0B/lqBR7Q5ds+wkRmqjiED8b5bx7F+xPcF8yfzPCnFwqSsQfQLgF1HK+U44LupOd9R8C2PDgZGFfJYfadXpIaKeuiyogy0tHcmOAylJlvzsCZXyxF7cMsCODEl179JQYlszLbooPKTC2sIkNygXvO7hoECyqEDjOmkLJO46qMkEXeivWS2cEC03X2LwaVt4nByUd5U34wMjwUdrAb2PaedE/b3Z0A9Ss7Lx+J0O1MUPaBjZVJJ/5nL7nK5zlLN4uONdMBjpjS2qM6TNtfeRyOW1qfX1piIL2pwkzztfnfDl+cJn+p0Wd6jK
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 21:46:07.5210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a8182a-1abe-4078-2fa9-08d75cb967f9
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1256
Subject: Re: [PATCH v3] elfutils: add PACKAGECONFIG for compression algorithms
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2019 21:46:13 -0000
X-Groupsio-MsgNum: 130731
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha256"; boundary="=-1572385565-405692-5071-4388-1-="

--=-1572385565-405692-5071-4388-1-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Adrian Bunk's message of 2019-10-29 22:18:21 +02:00:
> On Wed, Oct 16, 2019 at 08:44:56AM +1000, Dan Callaghan wrote:
> > Elfutils has optional support for bzip2 and xz (lzma). It uses
> > this for decompressing embedded ELF sections like the .gnu_debugdata
> > section for "mini debuginfo":
> >
> > https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
> >...
> > +PACKAGECONFIG ??=3D "bzip2"
> > +PACKAGECONFIG[bzip2] =3D "--with-bzlib,--without-bzlib,${DEPENDS_BZI=
P2}"
> > +PACKAGECONFIG[xz] =3D "--with-lzma,--without-lzma,xz"
> >...
> =

> Is any tooling actually doing this compression by default?
> =

> It is a bit surprising that this has the mostly-obsolete bzip2 enabled
> by default but not the more common (and better compressing) xz.

I couldn't find anything that would ever use the bzip2 decompression in =

elfutils, so I had a quick look at why they even added bzip2 support in =

the first place. It turns out it was for reading compressed kernel =

images (presumably, in the elfutils tools like eu-readelf):

https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommitdiff;h=3Dd6ccdc1a0=
5f27bf0bb5d802ec14f879aa9fe3e98

    commit d6ccdc1a05f27bf0bb5d802ec14f879aa9fe3e98
    Author: Roland McGrath <roland@redhat.com>
    Date:   Wed Aug 26 00:23:01 2009 -0700

        libdwfl: Support Linux bzip2 kernel images for automatic decompre=
ssion.

And indeed on my Fedora host eu-readelf can decode ELF information from =

a kernel bzImage, but the eu-readelf built by Yocto's elfutils-native =

recipe says "not a valid ELF file" when I feed it the same bzImage.

Whether that's useful or not is a different question. In our product =

I am planning to disable bzip2 (because we don't use the elfutils tools =

for anything) and enable xz (for .gnu_debugdata sections).

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1572385565-405692-5071-4388-1-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAl24sxsACgkQQuSr4gkX
maS+mg/9ExR7i4rTQ8AVp9G4n53Y+eEABdZjLhVARDKYU4FTYp7Zq8X/rJpDVjtR
ulvAcey3XJR4+d0gus3/YFoiMwrS21gNKisHVODjiFdieiOI7Nsl9qePgmLSncoc
4rgePEQJyGmCLhtD+gUtvXeAclkEfF+y+g3zdZf5oVX+rMhKlaFGl6ra/eUrOFaI
ZBPVu6mAVDQBf8C9ssVaAORIyQ7y8QuDU8TBxRNwtaEKPxD4DN3gtGTifjTmQO3Z
7neZfVACwi0AjRtcrx1R2dIgha6Y3JpgkI4iTHtf+X+tLU6+m8vRWcJI7jcFjbc0
Rf2Qe+bLxLxLCjFwYiNDFxy9Q2erAcemzqk2vehcS3T4t24XsBtkl6OiRy2zMMeT
0ssa4XJdN0zrHUimbHykF28zB/Z3IxCqa3YU6iOa8OjOefsPdJ9AYwjpsgaNysJy
Fp06jBu/rHLBPdInK5z7b/OKwQ7jX6HwFKdJzd+tyasTm0Gb9sYHdPqKpOAMH+Ql
VGFpPkoLPVak9kx5Zv4xICEHbQAYqW0CXdUx3gI+e4W9cmOAtyQkI1xAtSgOj6Zp
KiatpBkFSKyIb24PRjqgG3VdIhOQfSjKi3tmsA8qgtpQapvJmpdjjHw5Sy9U9lme
9f6WWISk0xI6FOkM1Rui2TFz7Esa+r+npcDyD5Z6itRaO7821xY=
=mVt1
-----END PGP SIGNATURE-----

--=-1572385565-405692-5071-4388-1-=--
