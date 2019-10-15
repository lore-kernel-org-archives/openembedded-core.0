Return-Path: <danc@opengear.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770080.outbound.protection.outlook.com [40.107.77.80])
	by mail.openembedded.org (Postfix) with ESMTP id 00C40760A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 06:01:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=USKK1Sk8Ex9bm8k4UGkQcQBafue3OQyFtWkmIrL1OdAq/aP59I7vqQmlb4C3crX42C6ldF/NZNREZYT68cBi58/neR5MWJZmsV19D4UveSIes3PxkLElMBIZ14Oc1vTH4MGUCPgO7DeFz6pTvvQuAaGjY0T7RquhR1wGoDL+4jvmQJBHKbLS8KoS3j48+hMVAjR0C1G7j/nYoaaespAExuywwdibLcqjPkK46xGOCD5csv1WUlf0NkLCveWwVb2o4si/mUhezZw/tuucdzqiN2B/ylpQeJg95c3FLUQDdPJEKFpYiIwyMKmliOE4RsFddkoNCLeLJ9dn9Td72bZH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SxvEnvIhMDsBSH/zpePYbHJ0RsQBT0or68GEoR39yvU=;
	b=Rngh+EvWUTroH1hoQMmsIuV4JdbpFUZAlwzEclU3E2tSAME+6csTI/Ovp8lvVM7IcBip8MV6P1H/01na0L3h+0qLmiQe1GNy86W6i60Ex2Yj7YBODsDdXW9jewm1eIjEomdp58Wv8jvrMzGjQGIY85cpKVDxID9nfrvAhQyKwu1WOhykDHwl3Llbp5ptjF7M1ZELVdpsVtJ9l+B+qD3Qx0oYeIZxIdSXmRH+7hFYt3turTfVRlITRQtAeZeEQbaloZtUMvXgOp8nAOsPTrddxhzSGVVumNDn7FechbQxaOzEwMm/e8twGE04s246qH9MKRQq3G6X+0PzdCGak+0K6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SxvEnvIhMDsBSH/zpePYbHJ0RsQBT0or68GEoR39yvU=;
	b=hSN3HPvZ6G3t91MPktQxVrj6Y6ImXeQwvpvC3E4e0Fal5bunTXmYKeOA0RPe1Iqj7/yU1fYmBE/i80Q/tmntBLDcgzMzGIVpX62ZSILPrPYduGWxpIN20en1RhS8tAF3b9Vy3+dazgKhSXq/CtJDaLaY8HRWxgIZJlmlBqNn1Lw=
Received: from MWHPR15CA0045.namprd15.prod.outlook.com (2603:10b6:300:ad::31)
	by MW2PR1501MB2074.namprd15.prod.outlook.com (2603:10b6:302:c::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19;
	Tue, 15 Oct 2019 06:01:40 +0000
Received: from CO1NAM04FT033.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::207) by MWHPR15CA0045.outlook.office365.com
	(2603:10b6:300:ad::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via
	Frontend Transport; Tue, 15 Oct 2019 06:01:40 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT033.mail.protection.outlook.com (10.152.91.232) with
	Microsoft SMTP Server id 15.20.2347.16 via Frontend Transport;
	Tue, 15 Oct 2019 06:01:39 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 00D8CE84FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:01:37 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id D79A34294606; Tue, 15 Oct 2019 16:01:37 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
In-reply-to: <20191015054827.7103-1-dan.callaghan@opengear.com>
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
Date: Tue, 15 Oct 2019 16:01:34 +1000
Message-Id: <1571119195-sup-6589@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(136003)(39840400004)(376002)(448002)(189003)(199004)(21480400003)(70586007)(356004)(336012)(26005)(58126008)(7636002)(186003)(103686004)(305945005)(71190400001)(4001150100001)(6666004)(5660300002)(76130400001)(235185007)(70206006)(5000100001)(478600001)(568964002)(26826003)(316002)(5024004)(6916009)(6306002)(2906002)(2870700001)(8936002)(126002)(446003)(11346002)(476003)(426003)(486006)(42186006)(36906005)(229853002)(44832011)(6246003)(33964004)(6266002)(8676002)(246002)(76176011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR1501MB2074;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bcbc3d1-05cb-40a7-e3d7-08d7513525a7
X-MS-TrafficTypeDiagnostic: MW2PR1501MB2074:
X-Microsoft-Antispam-PRVS: <MW2PR1501MB2074E862FF44DDDD3727B4BAB8930@MW2PR1501MB2074.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 01917B1794
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I1YTjD4FmQmfaw1F/HP32+EzT68Rtxy770X5BWGiJMNvqjd2Y2Gn20B82YbUJZRaWqaRjHVD6aQfE2rEvIHIh2fl90JOX+rAP0cw5bQRnwc3ZstVu1a/WF6q5+AOCObTP+guyaQem6eADnvDXmALl06RePT4dl7EGTvRnBKb28EsGXqQepGTEpGcVdmkr5YIHZAzAYDdlfWiuRn/yWWj1cD63wKHBdk+F4lcFaU9fOKFMOVvdJ4xcKWMmJj6aq/XeyAuE1ae0AloBhBJdB91ISqgXhrvRQXgkdilmV8J3AocDO1M80qYKFVfImS7HOk/A7gXS3jYoCAh7IDuFE8hd//LQJwtaoQhbnZCexcn4S+nKRQFxcGasSTLredfn5f4vbingVM6Z4i6fXweAZRDmzStMvkfwb5DYMjHjzXCPHM=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 06:01:39.8911 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bcbc3d1-05cb-40a7-e3d7-08d7513525a7
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1501MB2074
Subject: Re: [PATCH] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 15 Oct 2019 06:01:41 -0000
X-Groupsio-MsgNum: 130128
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha256"; boundary="=-1571119297-847822-1981-5933-1-="

--=-1571119297-847822-1981-5933-1-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Dan Callaghan's message of 2019-10-15 15:48:27 +10:00:
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
> +PACKAGECONFIG[bzip2] =3D "--with-bzlib,--without-bzlib,bzip2"
> +PACKAGECONFIG[xz] =3D "--with-lzma,--without-lzma,xz"

I just realised that the --without-zlib option doesn't make sense, zlib =

is actually mandatory.

And bzip2 should probably be in the default PACKAGECONFIG, because the =

recipe is currently enabling it for the target (although not for the =

native variant).

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1571119297-847822-1981-5933-1-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAl2lYL4ACgkQQuSr4gkX
maQv0hAArWW+2bd2zGoOwFiscuySfKR6FwMDyJtjtxC+6oVy9A28d5ahJnPfpimw
0QmIOONfrq+anS+pihbBSJev0fBUUTfD7CmF6UstW+1QZC2B9BTMZ2DVmE4areEV
hzbPV5258GTATJUgi5tugsHcXqsycWZGYUKPrjTrpmUGGOSseckoSAw6U1VBLXy1
4mrLC+ZpURTNXP6g2fKA7YEyaG/XBeELPo3t3nTWGNRbEEuJwKQzMnN7DhoSdxZz
eubq/HCTKR5Jiq9hPmcD/CquLc/Jz5F7xV/+7Aw81WM7bTng6TtkrNth/llR0EbS
7A4f9tsyR0v6tVIkaCQzgpb5eXrmZR44WFrGy+ULfhKZPZd2kF8RZjKQ0NuStD63
LeXKhIbv11ASAguZ4HQ5qiUUNmR/BzCeCahwzrqutP4zqHs5z3FcgEmR6/Vl/J3h
yM95kSNQdu/FipOCu7E2QwT+Qr+xoUiM7sFmEmG2oc9l5AOKifA9BoYS7x4StjFI
b0AvgPEEGZlrEjBbwiRvF8gwdyTnJZiP8ynDFebnHPztVXeEBG1XbPGuDvyWXvOL
L91FsrApHonPAeANF6o940h3h40bYFER2xuxO4dI36vtlqIwP4GbOqZKTSodDj7P
DXMRlXGLebjjbEjVtBJKnzbMAsrlvF1/Kx5PjRk0OPTuMJq3tXU=
=dIyM
-----END PGP SIGNATURE-----

--=-1571119297-847822-1981-5933-1-=--
