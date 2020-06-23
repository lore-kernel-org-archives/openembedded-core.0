Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.78])
 by mx.groups.io with SMTP id smtpd.web12.10181.1592927885053785623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 08:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=YRO9bAGJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.78, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqpOAPzreIk2aeD87/dFmUFKRCctWoaluvq5tZpCvjI2mFX30AFVABzasCTwaw9TrnHB4dlZTEI1MKy+pq6RXDQ4iIqh/mKBZCuO6H7xEqP9FbhPog0fCY8g2heTK4LBZPxkOB6W4clAVyk+36W3gAaoYK/tZeN71Qp1LxGb7TrlJNURSynKa8Ms86Q50yds0yWO4xdedwrckYe8LxDpl8rmYzHKS+e4lCZ5AgvFxmirQp1ucMWsrQEtWbe9wgjnHQ2a6YYpJk1ivQJOP+j+MQ6PcoekdbtMx3dkZBZZ6a1v5GWh4Jqo4KY7Ilep0V1EwmDg/jb4WWfqj9jT9w50/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojj+n2Sk3KClKserp+0aawsGaVAM5b+TmMOFsF2/hPM=;
 b=UhX+3JYlt5XBDAKIttRj0WDmvtCRbX46aTAmjzv6h7b038gIrDrLrfd9fr/RAssTHhaYIet+UK6Tig+iyTQ8exXEhVgoeMtcbrTQ+RCIcruwqOe4Emjvo+BjxzVI8YS3pyy2RojSTLFX5Lbb5LPCHV3rRjjQmDiu7Bgo2VUIpoGdGQAmAYf2Ta60KHoqi8jGg5W7hmXkcM/AVP1+VfRup0B+9qPJiB+cAGpVw89UCMuPRomCG5PXzD58DAkH3qMGdQTdsoQSZo22KYT5aVlCvUW5JMm304+O7C/36yyTgmjJcl7LsCBGV+8SW/hzx0LBxlztdCDPUJ7Y2hg10W+zfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojj+n2Sk3KClKserp+0aawsGaVAM5b+TmMOFsF2/hPM=;
 b=YRO9bAGJINBalNSdA9YO5tIrcrFbd02cNPSzPUO2qC50hfT8wZhmSkle3RS6JmX4jIIKa2J0xlPkZwRPSf656PfaArOBXI7iox14o+tnlH1vGOFAxZn/vzRzmL3vPy8HBU+xopRJ2pVhmyzk5a6SKrTs5Jv9zSvm6M8pZkYW7qpXFVuAXftz8WZNNW25RjOMu1Ix0iDlWbgBjWnLNx6mlqwrB7tYI5UYFS0aa+Xe/FImA+Yr5D1pTi40dV3RaB70RUOjIC5npaIUSI4FkeO4mpCqlTm9DtQ3gR/1bag+yOnXO1LkOsnXF+D60rT+UoFfiKO4D3IOH6cOsWlJDlWcYA==
Received: from MW2PR12MB2474.namprd12.prod.outlook.com (2603:10b6:907:9::13)
 by MWHPR12MB1293.namprd12.prod.outlook.com (2603:10b6:300:9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 15:58:04 +0000
Received: from MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::9c61:7026:1495:5660]) by MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::9c61:7026:1495:5660%7]) with mapi id 15.20.3109.026; Tue, 23 Jun 2020
 15:58:04 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Yocto Project Status WW25'20
Thread-Topic: [OE-core] Yocto Project Status WW25'20
Thread-Index: AdZJbUdP+FsSdrtKSByBV3SeDZdVTwACStUQ
Date: Tue, 23 Jun 2020 15:58:03 +0000
Message-ID: 
 <MW2PR12MB247418580E300A77C479C1698B940@MW2PR12MB2474.namprd12.prod.outlook.com>
References: <067a01d6496d$5f46d9b0$1dd48d10$@gmail.com>
In-Reply-To: <067a01d6496d$5f46d9b0$1dd48d10$@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=agilent.com;
x-originating-ip: [69.2.185.84]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fdb813b-eb0a-4b45-064c-08d8178e3684
x-ms-traffictypediagnostic: MWHPR12MB1293:
x-microsoft-antispam-prvs: 
 <MWHPR12MB12935A34834B0F03C21D53D38B940@MWHPR12MB1293.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 H1z/Zws03MEV4j8WukeeoP3toVm4bZT8xQk2UPEG4xP90gm4XxjisiYqwM48jnVyS7aIY9iuXs8PFYHN1SG7E6n0PvvSBAARbQ2dWw6f0Tl03oEGbmPSEIxzb2ar3SU9FHXi1GxnxqEE61StLNVN2WNDPQwFJoLZ+1u7UVssijxJ6bHjvVs0r/efQUQorrCIKrvQHb/B4sqfqJfOt7GchdZfhJrtXb8GROXEXVwmcPgQc8DG7X1Od6j7Jr5/wFBXC3ZBvl/raDQOX18zmbvJ001+WWsYRYzG2MC+4zqYsgQqgESGExNCQdC93vS8i3S2pHNOuYzsxuMyhRa3Ie6rEFgLQ837TD7qWWIf5xZ6n153/WC62HdyL4hBDzkgSa9rnoafjhg2uwKJA/WDtHezH2XXd7hkg92kFUS+aXiMe+bo4ip1aEwmQ87P3q9VRYQLWzbeI1gbmpgKP+iAOQK4zw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB2474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(366004)(346002)(136003)(396003)(39860400002)(29502001)(186003)(8676002)(9686003)(55016002)(2906002)(33656002)(52536014)(5660300002)(86362001)(4744005)(71200400001)(6506007)(966005)(8936002)(26005)(66446008)(76116006)(110136005)(478600001)(66476007)(7696005)(66556008)(66946007)(316002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 NC9TByUhciV3ui0L/n4M6NTXvQwe6IXeEMJ8fSTYXCh6yVO2qHwkwLLqHKEC9nn0CxoAHZ+H6zW9CRZkEmOhQliQXz5DA200hpF0etfRBpZzTmkPfHu5+QOz+lGteU19Y5lRvIvt4DoFyBA0kAEaBar1eJO9W0+ub5n0crJq9QvGIdLE1CJFYj2dmQDSlYC2B1ObGPNB/oSnY76AL7NB8KQ8R5cWeL+F540q84ytWH/qu0XSMRnsnmTHC5zrtgofCgEzJoPilsk91DjU8dakVQ5OZd9uj8AUBwffG0kF+jfPh8Iw8QhMFARe+EhaJ+vyaad68BgWQ4XCez0JQ3izHBHOYx5zkddEjem6GRZ0FNDvIussBxC2vpcaQih7u/LgkkDLaPQeFWEGJj0RpYqK9quWI5B4U+vcNw5b4Q4FofyXz9SUZRZy5peol+pLYHWj1pDXJ9EKatkHvUPrREnp5ETysqCMGudfD7uJTThSlNw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fdb813b-eb0a-4b45-064c-08d8178e3684
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 15:58:03.8663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wBnmGSP43aDZmSoysH+aykVmjqweJPFT+ybMZhb4m0HBhwntt5PANwYTJcsfegnNeJvNQs1QQa8EzzcHTFDEB/HWbN1a+w21aL1mMXWjivk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1293
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> * Next week is ELC which is taking place virtually this year and Yocto Pr=
oject
> has a presence there. There is also a virtual Yocto Project Developer Day=
:
> https://events.linuxfoundation.org/yocto-dev-day-north-america/

Does anyone know what the intended audience is for the Developer Day presen=
tations? E.g. would someone who uses bitbake day-to-day but perhaps doesn't=
 edit recipes benefit?
=20
Thanks,
Chris
