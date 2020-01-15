Return-Path: <chris.laplante@agilent.com>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB137F9B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 20:59:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=lvCY/uK8PUdtU0WxaxKhrQ6c8rotNFg9UxYrM36KLa6XRPXJ3XXSIAyTc91ZXNxvPzOIBZLUqT2wGsFPb/wUGjhbca17tvrCg36Hubgcg/Brky9ahcFhKcQfdNsfnAO2tk24h5yb2JdtcpHZPnkrhFzN584yAypiFV0XfV3oUU+SFmgPR2mn7oammfPcNasENQDlNddGmdG3LaokiS6XqO9AmFOyEPe7ZBjeOkpu9FPHn8QPpaYZTQvTSTMloDIrB6C9UeqM/87tp4bgZ1rXqAja7UzwyC4Qz621LQbOfo9oYrJ8KKZ+Qmva2tJsYkpuK872v+iI92/k2LH07M4T0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KDcu1oXVHLHCTDjdaEFv2H+1ax6hIAQP5JzcLOlugD4=;
	b=K4BprBWFpHNcXoAbaoKayoazNdRTHCfXZMHaYUZStJ4IyPr/1gMFABPXkdboxVzP3laEWR75L017dxp0dft2AoCJso4wAvcv/IezOspL8l9CMBEASlxzpKJqkj0he0YLmRBIj+rHlhNfpnCPbHMiPuuIkrID7NfB8shFEqHUjdSrwvNMko31SzFv7Fd8jUE0WKtDzzZy7qd203xQufFOHAGVLHRetJC9LIrqnRuX52TZJ+G4PTrUBBvDbe333tEJMzJOLxUvdooYyiX5fEvVeVZaF827Q56paODgtW5Lz2akAY6iP7P4ahyvfuqHpgDy1LtwfOpA/eKNgbo7tvAN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KDcu1oXVHLHCTDjdaEFv2H+1ax6hIAQP5JzcLOlugD4=;
	b=ar1sx3nrryharYgb4vkbMvIs7LCK2zdyDmqA91zX/JmEXlx2yQWOl9l6AOcR8070xlGBO3nGP1KWCrSwQIQpqXyLmGMXjbOTdtzhk/Znl3kpup3Y/qZm8AHunGdcJM9iQq3mr5azNnMR1gwhz11JDQR5oAUU53DND+81txGo4G4=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1704.namprd12.prod.outlook.com (10.175.60.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2623.10; Wed, 15 Jan 2020 20:59:03 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2623.018;
	Wed, 15 Jan 2020 20:59:03 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Pascal Huerst
	<pascal.huerst@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Looking for a way to build latest tagged releases in
	recipes
Thread-Index: AQHVxtrVLP5ZK3dnBEaFuu03GmqUsqfiOsqAgAACogCAADZ9MIAJtE3A
Date: Wed, 15 Jan 2020 20:59:03 +0000
Message-ID: <CY4PR12MB16537AE4F18230211893EAFB8B370@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
	<f9a33ecd524bae8ad83d1c1b94f7908ea7258712.camel@linuxfoundation.org>
	<d7dbdb87-d763-2ae0-923f-d293d6c24d27@gmail.com>
	<a9e23045b333589e58bb1e771a508bd39a347dc6.camel@linuxfoundation.org>
	<CY4PR12MB1653B76238099F8FD42B7F228B350@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB1653B76238099F8FD42B7F228B350@CY4PR12MB1653.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d7c84e9-a989-4367-30da-08d799fdc0d4
x-ms-traffictypediagnostic: CY4PR12MB1704:
x-microsoft-antispam-prvs: <CY4PR12MB17046D1B181408E1D5D4D8C38B370@CY4PR12MB1704.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(366004)(136003)(346002)(376002)(189003)(199004)(29502001)(81156014)(81166006)(2906002)(5660300002)(33656002)(71200400001)(8676002)(478600001)(7696005)(52536014)(8936002)(76116006)(316002)(64756008)(66446008)(66946007)(66476007)(110136005)(9686003)(186003)(26005)(55016002)(6506007)(4326008)(86362001)(66556008)(43043002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1704;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K35I+rRYwg89XRNU/viBuFrYzMc2UiSvw8e2CSMECMSA30ZioAuIrmnir0wl2QFvrkHialu2vYWhlbwLXtVBI37clzNQjF0HbnYRWHm8hodlSRxYVv4fvMU6EnG1tZUVhQVtp+n+JjhIjU9D/NTkVsSo0idfIuvDcQyNFoPp9tfRsBZC4J1Ep2jvCq5G6ScRkglNi6gN1R/mCZG7YNcP+Ngo2iyDz3UWdnLqjcg989vWTrInAaBv9r5LlO0vM/O2uuhcMfEl0oc5JqxCXIRC9aXQrK0bO2KCe5zidsnhxaG/vKORQ1tcrPERHRNliXr6pbVelluBFbtYYyEybP0cWut+ZnVibuBAohD67TtT4rOa135qtPdilYQxb7tZ0AJdH4uFsXCTpcBptAg+92hR8X1H2q21gGrdnzCmR3wu4dT+6eI/wn0cUK6CWJhfd8YrezHAfdn5EkD6A0rVwpdVs/kI8b13LTshDNZvaw/lwNAN4938Ozy6YOe86gmwNywTcWCm/+GRcYsWwSngJdRBSA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7c84e9-a989-4367-30da-08d799fdc0d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 20:59:03.5452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qasPnG4yrLvclzohCGhyM+Sx6qzCig7D+YOjAhlkFNHfkB/MISbgs/xv0MhZ5D1wFKsc18O2pAMu9e/38OWPr0lg9oqxHL6yF67AswWKI6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1704
Cc: Rich Persaud <persaur@gmail.com>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Wed, 15 Jan 2020 20:59:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> I've gone back and forth and re-implemented the code to do so a half doze=
n times. Chronologically, these are the fundamental
> strategies I've attempted:
>=20
> 1. Simply in terms of buildhistory-collect-srcrevs.
> 	Pros: dead simple
> 	Cons: requires that you actually build stuff first; requires buildhistor=
y to be enabled
> 2. As a bbclass, injecting a task between do_fetch and do_unpack ("do_cap=
ture_srcrevs")
> 	Pros: can be invoked without actually building stuff, e.g. bitbake my-im=
age --runall=3Ddo_capture_srcrevs
> 	Cons: adds yet another task to the recipe; a little ugly since you eithe=
r need to INHERIT the class, or individually inherit it in
> recipes
> 3. As a separate tinfoil script (as you suggest) which I run before the a=
ctual bitbake.
> 	Pros: decoupled from the actual build
> 	Cons: since it's decoupled, it's slower - each recipe needs to be parsed
> 4. Hacking the srcrev cache (inside fetch2) to log all information necess=
ary to generate the SRCREV overrides, paired with a script that
> reads the cache and does it
> 	Pros: Equally suitable for the "config-then-build" workflow ("bitbake --=
parse-only && generate_overrides.py >> local.conf &&
> bitbake image") or the "build-then-config" workflow ("bitbake image && ge=
nerate_overrides.py > overrides.conf")
> 	Cons: Invasive, required large changes to fetch2/__init__.py and some sm=
aller changes to fetch2/git.py
>=20
> In the current incarnation (#4), I also go a step further and, in cases w=
here a SRC_URI has a parameterized branch, I generate BRANCH
> override lines as well. For example, if I see:

As mentioned in IRC, as I get deeper into it, I'll be going with approach #=
3 after all :/. Hope to post a tinfoil script soon.=20

Chris

