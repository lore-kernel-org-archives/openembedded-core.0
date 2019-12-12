Return-Path: <chris.laplante@agilent.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750073.outbound.protection.outlook.com [40.107.75.73])
	by mail.openembedded.org (Postfix) with ESMTP id E35E27F994
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 15:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=k3t7em9sBVUT/j5BWQGJmcOWeayp2nex8m8oLZRqsFsxhLTCsgq/WFI5XES+YSln9G5wz6Jma+Jua9rvoz9kyZ/OBT6hHxwmQyHADQFt+BkUsdL4YgYhtPc/8QURW+fEBaS+bc0SWQpQfspNXRiDNDNNHfV5n2BUTsGjNJ+D6Bp8zDzzFd9loBqU6O9nobbDk6PCYtI43aH5lAm9qQh9/byuQu2B2iogxuUhZSlKvs+A17OtWfYeBzQOBugThOaU+UkhJUrjbsE/M5LZp90xtJQE+n6sXrYxbIsDalBI8YGZQa+Yr43WaBy6vEnwfTi9rUPLqOnlOdt1WC/MNBPJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MZMpqYanPxhi08Y+L3lkrgNDNeDAdMgoLS+9S3zMrSE=;
	b=UY4UQsJuWkfyo8O9gPqXIm1uoswCjCamm/0U1HvEO9WUB3N9CybURXy+xXZ13w9xROoNqXO6KuSbbL6frOYHIIDbIVcoCsLInfkevl4u+IUfn0abRMGBSoWvnw6ECtnbDew6OSii6vu0dOhtlwbHiwKiqt7nAoEikl5f6k1ZpphRysQzMZ2h2phn6DyNZutz+mYfK0hG2rKhY2ZmEkwDnT6kEy1QIaCj6gS9YFYeDgb81ZnGc6jMMY6R6D9SvUITudM9PQT7/FEp5jby9XqXbuTrZF7utPzrXVwxJ9iZBvI8VkiIX0gt4ABBgVwoPOhFdRcBI04XZs8IhtlXongtGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MZMpqYanPxhi08Y+L3lkrgNDNeDAdMgoLS+9S3zMrSE=;
	b=FdA3u/i7+v2zza1PZbqEUBHPDCC++GiiAYTBFoqAQifqq5IoNTlDS6Hly9u1qAJ2xD6sCmwWwnErWkyyxTT+qMccw3lvB+VbtbiENHLwvaAFOudsX/VsAuiGzS8XUP01MsL5oXr4+cjt6g5RGjc15sQhS1hPcksezj8/R4ymnlg=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1912.namprd12.prod.outlook.com (10.175.60.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2516.12; Thu, 12 Dec 2019 15:20:52 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::8048:9c4a:16a1:f584]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::8048:9c4a:16a1:f584%4]) with mapi id 15.20.2516.018;
	Thu, 12 Dec 2019 15:20:52 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Joshua Watt
	<jpewhacker@gmail.com>
Thread-Topic: [bitbake-devel] hashequiv, pseudo, and GIDs
Thread-Index: AdWvxXGeOYsqYFTMSCmAlM1iHqCZyQAEnsAAABdChhAAAqrAAAAv537wAAAZohA=
Date: Thu, 12 Dec 2019 15:20:51 +0000
Message-ID: <CY4PR12MB16537AFC2A829D19A06E94738B550@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CY4PR12MB16537AC33CB9D19F94A126458B5A0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CAJdd5GZ0LTrTtU=gYMp0ZqTwQA9UQyU7WMx6mNG2scv--7wNVw@mail.gmail.com>
	<CY4PR12MB16536C79902AB2538F4206508B5A0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<318f567345524ba08950eb1c0daa3ec6@XBOX03.axis.com>
	<CY4PR12MB1653C569E980C9CD9723D6DC8B550@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB1653C569E980C9CD9723D6DC8B550@CY4PR12MB1653.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 052fa45d-3643-4168-d3f9-08d77f16e005
x-ms-traffictypediagnostic: CY4PR12MB1912:
x-microsoft-antispam-prvs: <CY4PR12MB19123604D18F3CA9E379E5A88B550@CY4PR12MB1912.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(346002)(366004)(376002)(136003)(39860400002)(199004)(51914003)(189003)(29502001)(5660300002)(52536014)(66476007)(55016002)(966005)(33656002)(6506007)(64756008)(8936002)(478600001)(71200400001)(26005)(316002)(2940100002)(110136005)(86362001)(7696005)(81166006)(66946007)(8676002)(4326008)(186003)(9686003)(2906002)(66556008)(66446008)(76116006)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1912;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PI4xU6PhKupGKpbVx1e56sWSkqBkyH1JWlJMDycdTKz64YOnnROq9tOXXad0XPh9Pp+i7ExJiUXz79Dpca/O9K0SWvWvbSB2U2PguZoJxRn5PzGG6do2VZwpqnN57hP+8/jXcIbUtP/uLysnGlxgvFBjYSdUcJSxrsuGGBXMmvRyUg8Nvg8M8sSuh++nSM4lGOTetIWZjil+fSi5hzB+0uUwMmT2Ys0/le4FLFC04hDmna4ztxuK3SrBWPmPXqyYfCg4MobPi7Pmjk4Gp06Ft8UonmZumVLNZ6wsKIPtWldwtTTzFXB6cae8QGDulspYMTrRl0b8p6qUzeB5fBrfLMyMEX7zLLdr3PmJpNEk21t+Tp07RNJ8SvvixuG/NsKcfWKggPFg9jkaprSVBg1YM+IHnlRm1GPqOSBDVaiMvyLkrUO9aE6RJ35DDgJrjwoZ/3qiVjNmg1nnlSoIV7RyI2muipUa4KVQCDaZe/Slv4YmAZ2ztf7alxNwv39XgwY+/s2Ma4OfkQ1thkXPdQz3PA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 052fa45d-3643-4168-d3f9-08d77f16e005
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 15:20:52.0131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DMqBnmGswpafOu1WU+KRU3aE7H6ZA9gNqLHboGkiw4cev9SeTI1A1U+GcoC9RL0GfY0p1ueiOTfTLZS+Hjo1oyApHC5CcfXGHMFIgLKz3M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1912
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
X-List-Received-Date: Thu, 12 Dec 2019 15:20:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > On the contrary. For almost all practical use cases you care about what
> > user/group owns a file, not what UID/GID they happen to be. E.g., in th=
e
> > recipe (or Makefile or whatever) you typically want to specify that a
> > file shall be owned by user foo, not UID 1234. Then, either you do not
> > care about the actual UIDs used, or if you do, you use statically assig=
ned
> > UIDs/GIDs for all users/groups. This is typically necessary if you want
> > to be able to support upgrading your product, and it is very well
> > supported by the useradd-staticids.bbclass.
>=20
> Interesting, thanks for the background. Out of curiosity, what is the dif=
ference between using useradd-staticids.bbclass vs. using
> normal useradd.bbclass but hardcoding the GIDs/UIDs anyway? I ask because=
 meta-skeleton/recipes-skeleton/useradd/useradd-
> example.bb does the latter.

Actually never mind, sorry. I see how it works in https://www.yoctoproject.=
org/docs/latest/ref-manual/ref-manual.html#var-USERADDEXTENSION.=20

Chris

