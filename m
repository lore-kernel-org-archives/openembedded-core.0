Return-Path: <chris.laplante@agilent.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	by mail.openembedded.org (Postfix) with ESMTP id F21017F9BD
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 15:18:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=YRr6YfJMtLIiI1V4FBg/5xc9bfCStK7pKIJgT1txHK+rxwki/dKKebUwOd5AsA5B/I/4U3tQbtNzEx7hX1vpK1XIOx1z25QRfiAJQciW6Q7MBRVTv7TIGVj/XdN3E2T/YJ7qdTbhO0UJc+zDxps3TFmxYhFqC48YQ/633fbRTel0m7f6zZVgXAKBFnGbAQU4wzdVsPFVip5hz4vXTGHC7acF5AXbbbeyEu7M29ZSVd+1mFhb+GvI8wufc0o1DKjmfRwQq9RxhhjuVQl52x6GPXCBeevPxuQbRcRnv8gHlQbMZwBEHVapmP4y2l09CvIqw1Rs2UH9GaITmCRK4ulUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LJ7dTbOb2xRU4UrIwrTxPT1IWlHF0eVMgL5eRsnaUx8=;
	b=knbJUr0xq29sFAeaLgE3RJIvVXrFxiezN6LxClwl69wG88ai3rSDxP+fME+IUY6jLuNAtqy8VULPgXc4DzfMAu6iQ29E2qfE49wayV3C3n6ZndLh1Jv8jOdX04k0qzt8Xpysb6n2voNTRskgWtEzsM0cHnibQWotzBU3iFXT2r3hH3xl+l5S/z9uC+oFrvAh29Oqm+/vhX5t9midVwm+9iAzAlXupEMjybYxK0wt2HGcjeR24YWm/boHLz3adng3Dua3CAqnGG4lbuhj767c8qdh6fmqKg397wD7WSo4ydSCeGHSjHNYYBJUMN7Inlz5RwG56NoUzFAQQBOX3gM/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LJ7dTbOb2xRU4UrIwrTxPT1IWlHF0eVMgL5eRsnaUx8=;
	b=dAhTCvGBp3fZYOH9fHtVhseZDNtEmfvdX1Ivo/j0Lre3hJX+2lCZ74xot5I19ZrgcjDu0iX9N2Uby0O5Ju81SAp+SIef5wcvEWhWIzBHyrSWHwUEhV6BsuAmJ8pRaDPwss3N2JWA7PXb2BJAX31sGmdafS0WnD+nlAn+7PqAWas=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1767.namprd12.prod.outlook.com (10.175.62.137) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2516.12; Thu, 12 Dec 2019 15:18:44 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::8048:9c4a:16a1:f584]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::8048:9c4a:16a1:f584%4]) with mapi id 15.20.2516.018;
	Thu, 12 Dec 2019 15:18:44 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Joshua Watt
	<jpewhacker@gmail.com>
Thread-Topic: [bitbake-devel] hashequiv, pseudo, and GIDs
Thread-Index: AdWvxXGeOYsqYFTMSCmAlM1iHqCZyQAEnsAAABdChhAAAqrAAAAv537w
Date: Thu, 12 Dec 2019 15:18:44 +0000
Message-ID: <CY4PR12MB1653C569E980C9CD9723D6DC8B550@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CY4PR12MB16537AC33CB9D19F94A126458B5A0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CAJdd5GZ0LTrTtU=gYMp0ZqTwQA9UQyU7WMx6mNG2scv--7wNVw@mail.gmail.com>
	<CY4PR12MB16536C79902AB2538F4206508B5A0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<318f567345524ba08950eb1c0daa3ec6@XBOX03.axis.com>
In-Reply-To: <318f567345524ba08950eb1c0daa3ec6@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d63c1040-8fc5-4eee-5026-08d77f169416
x-ms-traffictypediagnostic: CY4PR12MB1767:
x-microsoft-antispam-prvs: <CY4PR12MB1767C2D0E9A8FBDB7BB978A08B550@CY4PR12MB1767.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(136003)(346002)(396003)(39860400002)(366004)(51914003)(29502001)(189003)(199004)(186003)(316002)(26005)(478600001)(33656002)(71200400001)(52536014)(6506007)(5660300002)(7696005)(64756008)(8936002)(81166006)(66476007)(66946007)(86362001)(66446008)(66556008)(8676002)(76116006)(4326008)(2906002)(9686003)(110136005)(81156014)(55016002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1767;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z/QJkd7doJBriH9sV7mnxChvWthXMOJKtdpRhEHnS4CI3B8VvlgWHd0zPdfhjw4DqLYEIJ297u4TaHcHBVoieLRYyw0bISY8aLcrzstnM5H8FLuZNukAT9LcUjOXjIwOtTmHnikO+aF1nQVUmR6R1PuCecScmTbPutt72Zcm3EeKLRL92vb2eL2Xogdh1clpzsj3wGn8WFm99WbDOYWC8DfMiSeJMMlX+eUILsDL8vHa6JTfB9QHLphXwsPUjjc0Pdvr46zbtRD3an3JFHJBoUb6pPXSh4UXSKL/N9RB4diQ0UU7Q8V5wu+6T1FUjwzSaul4ZNeZ2TOkSIYDNgyCXtVIsFfI41ChX+T6PcG5AKMPnQTtdAfsJTWiu13FyBOTyZTsCihgHoeEg9Ax6fW+bLsWuslc2Y2HxTw/w7E669MXayJrgy2BsMWvMOCn5DUFBcnRY3bFG/fOa0gtYpKdD+xz8cKyBFKxV/HJrVugZPcynS/Z7Upo96A1wQkvPytGP+iMJo60xWLqVBFD6XNnIg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63c1040-8fc5-4eee-5026-08d77f169416
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 15:18:44.6093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4RxN2ihVWdQCrSGKXNXXdV3wKEyjqpxGzvASVxvH4nOs+LjoMhJv2HFoTEewJQrB6g08n0maOH11yepMGi5brnsNJYUUUYyFyyRsjOR7Uf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1767
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [bitbake-devel] hashequiv, pseudo, and GIDs
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
X-List-Received-Date: Thu, 12 Dec 2019 15:18:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > From a caching point of view, it seems incorrect to care about what the
> > corresponding group name happened to be at the time when the cache was
> > created.
>=20
> On the contrary. For almost all practical use cases you care about what
> user/group owns a file, not what UID/GID they happen to be. E.g., in the
> recipe (or Makefile or whatever) you typically want to specify that a
> file shall be owned by user foo, not UID 1234. Then, either you do not
> care about the actual UIDs used, or if you do, you use statically assigne=
d
> UIDs/GIDs for all users/groups. This is typically necessary if you want
> to be able to support upgrading your product, and it is very well
> supported by the useradd-staticids.bbclass.

Interesting, thanks for the background. Out of curiosity, what is the diffe=
rence between using useradd-staticids.bbclass vs. using normal useradd.bbcl=
ass but hardcoding the GIDs/UIDs anyway? I ask because meta-skeleton/recipe=
s-skeleton/useradd/useradd-example.bb does the latter.

Chris

