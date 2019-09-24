Return-Path: <alban.bedel@aerq.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130090.outbound.protection.outlook.com [40.107.13.90])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCE37F21B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 07:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VxkNk83x0IDXVBYtT2ZAQeSNg/CLl7l88xhrq+6SBqYRRS/nK0pQk3Z9Qnyfkr93VCD/BujFOAqAEqy47fc0mjsDrDQoREzohWtDiOJxPRfGZUOEQLOVMxCFbUXUfXjsQFcra3qwlsctukvpo2fQY0WjbiHiZlbXFQ4fm7DbuE+FAv5oKBg1N1/BiFZ3It0dNAqtJty8+c1nXTu/eJlOu4mgXjuqo2utGFvVCJx2zz01hnQZTmpyG1G/anuI5nQ24hEkN6TwDT6bi1/fIOEdmeIUaNyryanQtzP+xFP+/v3yIhSizsuGrteU3ipkzPReUi6tZz9Uk6albQoeQ/i+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cnhpJeVjlv7YMzfR8+ucxWBJFFfHgJsyBkLtSudjVTU=;
	b=kmSz6kcS8BbSxrQRc4VZGWRWo+eH5rop+sNxSA6WNOoL++hN3IVKzcoDZARQu4zlETPIW8ckvJme+9An2BcF8IwYUASjeJMUqJumykZwVtTP2oXflrz8bYWO8fCy2ZtlNqcayAZnU2o46kDS1yhIPoAi4MFCsmC+xCYbsx43jKLBAybooH9wlBshFGiA/LGqEVSLcUqo3ziR2jdyB9sJUXoZpnpK105NEyAk2JWffm7mpw9HTNKUqfcgBv1q9z+LgmmnfIc0vuftonEBWedwQagbFyW0KIBFErBbk/MFMibQLYNvkpitVai9cTcu9AAgxp0Ebjir33b3sixnFe3pyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cnhpJeVjlv7YMzfR8+ucxWBJFFfHgJsyBkLtSudjVTU=;
	b=amAWHDf46+iZlQcvd7gTHUxcN+ywLYHdmAPJYqrvWZ7/V8xS9TqU17hAlU6pf1OJ2yM20/UklqGNQjcR17oKa7kWO6jrQJTTxA96k9krJ5vrP5X0qRkHkRCSv+4FTvlLyOneAcj6xwK31yk5r7Oy/0t1EnMYdVT2v1OEtTyBFho=
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM (52.134.115.151) by
	AM6PR10MB1925.EURPRD10.PROD.OUTLOOK.COM (52.134.116.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2284.22; Tue, 24 Sep 2019 07:23:26 +0000
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8]) by
	AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8%3]) with mapi id 15.20.2284.023;
	Tue, 24 Sep 2019 07:23:26 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [warrior][PATCH] kernel-uboot: compress arm64 kernels
Thread-Index: AQHVR6defzhnBU0AEUmRfvXMV9SCuKcZ6DmAgCDaYIA=
Date: Tue, 24 Sep 2019 07:23:26 +0000
Message-ID: <6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>
References: <20190731135317.20174-1-alban.bedel@aerq.com>
	<2306529da2e15035d6070ab9ba109dca6718e127.camel@aerq.com>
In-Reply-To: <2306529da2e15035d6070ab9ba109dca6718e127.camel@aerq.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7242b8e2-b9c2-487c-5b24-08d740c0176d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600167)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
	SRVR:AM6PR10MB1925; 
x-ms-traffictypediagnostic: AM6PR10MB1925:
x-microsoft-antispam-prvs: <AM6PR10MB1925438F9769FFAC2BB280AB96840@AM6PR10MB1925.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(396003)(366004)(39840400004)(346002)(136003)(199004)(189003)(66616009)(118296001)(81156014)(55236004)(14454004)(99286004)(2906002)(81166006)(508600001)(6246003)(36756003)(186003)(6506007)(6116002)(3846002)(25786009)(66476007)(66446008)(2351001)(66066001)(86362001)(76116006)(64756008)(102836004)(66556008)(66946007)(71200400001)(76176011)(4326008)(26005)(71190400001)(2501003)(6436002)(6512007)(5640700003)(476003)(256004)(8936002)(11346002)(7736002)(305945005)(91956017)(6916009)(486006)(99936001)(229853002)(6486002)(14444005)(2616005)(5660300002)(4744005)(446003)(316002)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR10MB1925;
	H:AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pkJ2o0JB1ga/lwCqwe0fiUspRmo3EGlyf5DQ8FzfC+UxuoLf7UcYeUWVZlc2dNzrBZewWGWf6QdliBrxMgVaYuw4m1pyab6tuYL0edIW/NytAcYeJelWICT3Gd0aw4nMaF3j4EoY18waz0MsfkD4RzOFPRuc36xtw+vfhuva9LK9o2awzKihlne9s7xJDp0qQUuKcOseb74DLQC7S5ZWkNRu+Hze9/hggpzwk1NY2O7IxjvE06XofJ55zWboTRz0ck+cELYCtWWse74iwPEIT+LHK3oTXhv8EJtCWyWrZ4ky2IEGDhye1069S721HhS9zscvxOFw7dPujq0TsMI4/8N9Vkd0pk78ciy94gEFH0mE8WJ34Jl8O4nfLETn5RtRTLrRL3BByE8j27hfCzejNabvVul8DK3jU2N8e+JcGH4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7242b8e2-b9c2-487c-5b24-08d740c0176d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 07:23:26.6276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m/NY47OlY0bEurCEstSJRj0Omc2OlmWkU7P2buJKgtg9kGsJoSaYLjnQJi97s9CRen8vkBRpsz6Cj9WwsfqnQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB1925
Subject: Re: [warrior][PATCH] kernel-uboot: compress arm64 kernels
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
X-List-Received-Date: Tue, 24 Sep 2019 07:23:28 -0000
X-Groupsio-MsgNum: 129415
Content-Language: en-US
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-84kzOn/E6sI/RwEzD73A"

--=-84kzOn/E6sI/RwEzD73A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-09-03 at 09:41 +0000, Bedel, Alban wrote:
> On Wed, 2019-07-31 at 13:53 +0000, Bedel, Alban wrote:
> > AArch64 images are not self-decompressing, thus usually much
> > larger.
> > Boot times can be reduced by compressing them in FIT and uImages.
> >=20
> > This commit is a backport of commit a725d188b5 (kernel-uboot:
> > compress
> > arm64 kernels) and commit 60bc7e180e (kernel-uboot: remove useless
> > special casing of arm64 Image) from master. Both commit were melted
> > into one to avoid some useless churn.
>=20
> Was this patch overlooked, or is there a reason it is not considered
> in
> the next round of update for warrior? Without this patch kernel
> images
> are too large to fit in the flash of the system I'm using.
> Furthermore
> it is not trivial to fix this in my own layer.

Please, I really like to get an answer here. I'm fine if there is a
reason why this patch is not considered for warrior, but just getting
ignored is very frustrating.

Alban


--=-84kzOn/E6sI/RwEzD73A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE0W61GceYqNjiMSkodJSaS524LbwFAl2JxG0ACgkQdJSaS524
Lbx7Ow//Xm9jbd1iQUrpn7cFgiFMg9RaeB19kd6Is8H3jnumVASE57sGQzGsQW7r
bcnbgl8YO+pMbAb9GrmBJnkS299Nd7uX4pcDIbWU4k45LZp/oskrSEdopVJ6A0nu
rJuDpaU7mSf4q3NynuLzqTauuCJIkSalXRDNhVLTn3QWIzFIjfF0dNrCKQymZq7V
lEfVvNoDTir8NPP9Od6igPS5Dydh6HVbFd+FC4wqWQibZhdT7CYflGUOrA9jUqne
THsd669Nq3wZq56aR2VH+WO94au70vS5D7a7x9sz++1daDNi20DuivHYXP10/grU
ysXBUw1zj4j6oBYNNDdwPqwsltD6SIBsh4tO6f7Mne7Ii//e6Ph7WWruu2erAFX/
s8DSOs+/RY5Vd/q+ENIytcv/Ug85gcqH5pbJklW+LgLmEoUJPZgMQ0CdUWSLfwC9
8KpikozQhOlwdWORT2vmTW+4cDZzJwfZwELqs4CwguajfuQC7Be+rvmIvNBj6JJD
lyuDzKIEv4E94xWeoK10jN2zj5eIE2U//y3m7pwlbxUc8sy/IoQGSbm1ma7Wbmcv
vz1RoMNpSNv1QgJYAnBr9u3Ge++HSTOBWebTdjXzpiOjqvTER8ndcJNGZFqw2KPn
yeFNsGB7bHis4LcZmvawVqJUR7tRCcvq0FHHR9/+bQNGyRquYTI=
=rRve
-----END PGP SIGNATURE-----

--=-84kzOn/E6sI/RwEzD73A--
