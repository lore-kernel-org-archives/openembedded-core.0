Return-Path: <danc@opengear.com>
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr710042.outbound.protection.outlook.com [40.107.71.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7D16B7F225
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 22:46:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IlJ18DOLV/LzWq/4JhzmTV54U6uhDZS5AmCV9vtQUyja/XKEE9sBQy5NOuAzK6uG+JsUIHnyA4mYYI1wnhHywHIfSESr2hmQJVURJA/DmpYr6rt2ZoAodR3A20/0Svo7liZqBz3ITD2yciJZzF+F1E6kHqcuBUjDO6w6eUf7hk40cDYT98ZsDiAAZ6FxZR5e4WeYY7xdYaZkJPqaq+2oGnyXf9jCE9viAT+udzO+IYWCWS83AHMzytWEAr208rJXXqLu3KO6ouHnpjInP3EQjhp4POurZo/UGknBR6NZH6Gaa/jjXqgxJpVvD5NdZXSzO1sJq42lx0MtjAGapb3YjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pzQIfHITlUECwhf7EHJwZH11+iYLrDeqeFIDQLGDFk8=;
	b=cDUCBsGmLq1ywTg6viDN4HrztapkUiZMKz0jn9E8SkGUGET9MrViXjpvcXyummuu0QVW3hikZ3n+24/Ftr1yJuwBBHueEbakisIv7YEHPVw/Ifql9970wlSstc70W+vpi37Br2D/G51HcPb6Wzpeg/O+D7zRfxBlUHwZ52+ZFNRGT/pSREhThRSdiFsrfJY7YhyONBkCmVsKJ2URHCIiX49hDxZFzYVdBUXA4kQufTLghcDhGXI2UhHxe1J8m8PfYPgyjGRR3NJiScUfpFFu6cKIEHI7GmBdb4qyrHkEqEEscwDc7Q3X55M1qdjWiuT/RPPkf0sEU7By4htgmoNjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pzQIfHITlUECwhf7EHJwZH11+iYLrDeqeFIDQLGDFk8=;
	b=mNBXEhylBLSrkTvUNs7ByDwYcJtJLkBCYamgSj6ovupQyQ/rBfRr5GFrVYcNYavQHpIoke9BH/UqR73reQT8K+gxevNe3NbSKYzHvL3uOmG5a9j72XTxWjttQN6pHZKhaE7wCGLwGmHIpzMg7QxJKPouGDv9AEZhNYZN1KnDZYM=
Received: from DM5PR15CA0048.namprd15.prod.outlook.com (2603:10b6:4:4b::34) by
	MN2PR15MB3662.namprd15.prod.outlook.com (2603:10b6:208:181::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16;
	Tue, 15 Oct 2019 22:46:31 +0000
Received: from BN3NAM04FT022.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4e::209) by DM5PR15CA0048.outlook.office365.com
	(2603:10b6:4:4b::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via
	Frontend Transport; Tue, 15 Oct 2019 22:46:31 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	BN3NAM04FT022.mail.protection.outlook.com (10.152.92.174) with
	Microsoft SMTP Server id 15.20.2347.16 via Frontend Transport;
	Tue, 15 Oct 2019 22:46:30 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 452BCE84FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 08:46:28 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 305434294606; Wed, 16 Oct 2019 08:46:28 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
In-reply-to: <84b5c0f5-e790-84e4-967c-6eace1f673ba@intel.com>
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
	<20191015061510.21803-1-dan.callaghan@opengear.com>
	<e41fa2a4-1744-993c-d38a-f98229726251@gmail.com>
	<1571123420-sup-6304@galangal.danc.bne.opengear.com>
	<84b5c0f5-e790-84e4-967c-6eace1f673ba@intel.com>
Date: Wed, 16 Oct 2019 08:46:26 +1000
Message-Id: <1571178617-sup-8448@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(376002)(346002)(39850400004)(396003)(448002)(51914003)(199004)(189003)(11346002)(316002)(33964004)(76176011)(42186006)(426003)(103686004)(336012)(26826003)(478600001)(305945005)(186003)(2870700001)(21480400003)(568964002)(7636002)(5000100001)(2906002)(71190400001)(6916009)(235185007)(5660300002)(36906005)(58126008)(446003)(26005)(246002)(229853002)(6246003)(4001150100001)(5024004)(6266002)(6306002)(476003)(76130400001)(44832011)(126002)(486006)(70586007)(70206006)(8936002)(8676002)(356004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR15MB3662;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a62fa08f-1c43-495f-3d8a-08d751c185bf
X-MS-TrafficTypeDiagnostic: MN2PR15MB3662:
X-Microsoft-Antispam-PRVS: <MN2PR15MB36620DF5B81CAD14E156C28DB8930@MN2PR15MB3662.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01917B1794
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xuswhWakk7Q2Vbw+S8nQrlgNgMDTCyAdjG9q64xbiVeqIfimRj0zZWOsR9EEKj52mT9MyQ0lFmqdsF3NSyuNnaaDA18WPON2C3c+CbSGVeyqTxRwUQOL6225+2WiU2jNwHR83xasMTVmjf8GXVMwoFnGCV/fk8WsQ2kedT8bUPbhFX6h8toEXLkArs+wGus5aklk9A/sRvAFz9fgKNn73JZL4+7aogHxErRURgIPNbcZWSz+xUVAhhzi58kZpvEu9jtTaSANq1wdma9IEXLfOpyKFP0NxMoaH6JT/jGo3BPNMGRyfZnUzikgzCDfOZC5qa4XdZ6mnZwyqCjlqc9WAWNc/h4oWfYiNFTyxcYT0MelhcubSTHk4BaBESNout5XyEaOU1kKlTpnxQRwxe498D/r9+qxDps/cMS7h6webhU=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 22:46:30.6041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a62fa08f-1c43-495f-3d8a-08d751c185bf
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3662
Subject: Re: [PATCH v2] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 15 Oct 2019 22:46:33 -0000
X-Groupsio-MsgNum: 130155
Content-Transfer-Encoding: 8bit
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha256";
	boundary="=-1571179588-176831-13184-2539-2-="

--=-1571179588-176831-13184-2539-2-=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Excerpts from Ross Burton's message of 2019-10-15 11:55:31 +01:00:
> If you need bzip-native for the libraries, DEPEND on
> bzip2-replacement-native.

Oh, thanks for the hint! I hadn't seen that trick used before but now =

I see it is in quite a few places. I will post a fresh patch using that.

It does seem like it would be simpler to just take bzip2-native out of =

ASSUME_PROVIDED, but I guess leaving it in there lets people avoid =

building bzip2-native under some circumstances.

-- =

Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

--=-1571179588-176831-13184-2539-2-=
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8/IWiXUxKipVpVyoQuSr4gkXmaQFAl2mTEIACgkQQuSr4gkX
maRP5g/+I+fAl0+aRlMY9xw4pkLWqB5xRUU/5rEPHgkAv8Fepr2IhPzV7REpSYrj
REJjdqsmgN3jSp2VOPy947kaMwqZaQAJDSuWoFWEOXGHu0WQfrdsQphjeUDmoHIa
RafC+sgyDI/jefxWWM0/y2/9p5EW5D/3XJ76y0DvHUQBZdVkQ9O02ErTL/T0JcAz
OFtTiYEudIBa5Ad+tv6+x1jGXVL5ZvQG/FRQ/AML6ZTpp7u2WOng/qWKfyzTkidh
gyKMl1wfyc77zSqx0bHl+WzazgpOsWIbpurt8nhOs61pnMfyA3XcTL5lzJeaVmLq
oo7wqYM/STu1riID/Bmu4QOlCmqJ5nvY923koAJhJff3NZUgmF+3leCTXs7jljnJ
BE91RjhI0X4L14R15ROVtxdvds0h409bMwMsiFQirZ+e/MvtxIe4JqoUVQxA9Y3g
ZZ7C5YdYGKEbv/x81YRuJOKBlh0V3UySOIwGKLXX1yY9TQ2572U6HMEDboBLWg4Q
QRkrgt7Q3fzk7BCFRN5Tob2jOKREgUSqBExGVccNnRsTA84DuJLJQy7PxKHjxptO
LrTfVbuhMKoosljyb/fZZdnO4+i/P038folcnVSoSsIAgrcH6mKkNOIF6FhIUFcM
FiEnx9eRcaYYxqf3sj64zrbMBQpp8iLnKEtq56vwmI08mS9NrLo=
=pX5e
-----END PGP SIGNATURE-----

--=-1571179588-176831-13184-2539-2-=--
