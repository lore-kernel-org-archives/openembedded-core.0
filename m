Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.42])
 by mx.groups.io with SMTP id smtpd.web12.15562.1592942703834740694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 13:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=samcXa3o;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.42, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCOYsyOmOu4ESklpXEvlSmXjCnu/ROJzFgpgqbr0MhhZ8aZ5VC9qDcXXQqCXMQhshm/wPYkG7BvzJ0AYDIavnhFOmMu1EzGwPnpnK4lYB5uNqb4gWebCdWFsUPv5kt4XwyttDi6LXfWzEMEN9qbVmp2Wz+XCnTN7Gfgn+TN0MSde5e1HSVHUoxeEOT1cbSgOF+YBBwEl35Ul2gSMmmH5pIKAAGsfPtOdrw4UBUxKXgJncJZ1osdqJofiYnClR/s4mR2GV4qw+xzsv9sv5fJR/GicQHFIDVtKkEp/Jnbs90Vrl0EB9NMk1655KeSDgn+lFgIwIocPEwtBUAo69LlDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzTapFhI5JT0B4J/Hy25Fp69w7glup6kAoY+xZmckZQ=;
 b=I7rBr0MJq2jmpscKX+lVQR18WdTn2GNtJgj1FhgQR1f6spbsEb6rL06YnolF6cnDNMyyaWMYvr8P/apeqTSvz2RB7I0wi6OVwvDzAKFp0LLPbZ8HGM2uId+VbgVjG1gz1saCm5OsFNlgY4z+OYmA8ML5OAww6jJFHriQCi59vkDtYUyas78iHcNUNUT6M6NkqYguDj0wcuQL8QWi9Z2Owhd80ncnsK4Wy0K6eqfFX9ut1US6T2gW5NiKa7LprfhP+5p4HOZGZQ/+uEbR8pBkY2d8uVpgbS1chRwvH+qFOunD7D28uVLX6yd6hCXm3Q1ovDFYqP0V5Qag4vu2TGvS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzTapFhI5JT0B4J/Hy25Fp69w7glup6kAoY+xZmckZQ=;
 b=samcXa3oqmSNDAWcDx2hcFkP9Yrp83M+z4GuMakvevK+xQrhkkXCJLKhRgUYRgIekl1FhGyo8pGsAtkoSuOsu5ry2No87tuIRzHAIHVwnmI5ihrpxWHMJU6prdisHBVxM/KwQ2ISZRJ1dpr3KqRJKszMz7EV6WI/8Vokj1QqOxcKX+JqxW8t8P/miXsCeMoQWCkA8mx+pGi3tN2a46BuAXkhJrnR6vurxQADLb6pMK/OhoVpvmBXt6JaYnL2GoxCbuTQelbYvuXuceSyGE6enzxD2g6bUOxCN0s0VS3sAr3YprNpUV8BPOxueCUJQvzt64l1MKBPi/Bmhee326E6zg==
Received: from MW2PR12MB2474.namprd12.prod.outlook.com (2603:10b6:907:9::13)
 by MW3PR12MB4489.namprd12.prod.outlook.com (2603:10b6:303:5e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Tue, 23 Jun
 2020 20:05:02 +0000
Received: from MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::9c61:7026:1495:5660]) by MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::9c61:7026:1495:5660%7]) with mapi id 15.20.3109.026; Tue, 23 Jun 2020
 20:05:02 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Khem Raj <raj.khem@gmail.com>, "sjolley.yp.pm@gmail.com"
	<sjolley.yp.pm@gmail.com>, "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Yocto Project Status WW25'20
Thread-Topic: [OE-core] Yocto Project Status WW25'20
Thread-Index: AdZJbUdP+FsSdrtKSByBV3SeDZdVTwACStUQAAhYWAAAAAXVgA==
Date: Tue, 23 Jun 2020 20:05:02 +0000
Message-ID: 
 <MW2PR12MB2474BE8BA49651369970014F8B940@MW2PR12MB2474.namprd12.prod.outlook.com>
References: <067a01d6496d$5f46d9b0$1dd48d10$@gmail.com>
 <MW2PR12MB247418580E300A77C479C1698B940@MW2PR12MB2474.namprd12.prod.outlook.com>
 <5267904d-6871-40aa-af46-6cc7f5249d09@gmail.com>
In-Reply-To: <5267904d-6871-40aa-af46-6cc7f5249d09@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3fd027f-11a9-4d5a-430b-08d817b0b706
x-ms-traffictypediagnostic: MW3PR12MB4489:
x-microsoft-antispam-prvs: 
 <MW3PR12MB4489EE7774FBD5C9086908AF8B940@MW3PR12MB4489.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IU5QnIlpRtAZ9WtLQjZ5s3Ty5MNdQ93lP8fwViNs7pC4cIctRWlFknJ/rEqPmeSUt08KKxpp7EJt55IvZCAS93M4pkFJEA4MDVVZQIAcnoiMOkvqnm6A42kRlbbG4hAumD6Q4eqZVQ6uDFHrc3M7VehP3sXOga3hNVntpu9zscHvwaEXQoG36AWjAjZPDXXed0qyvjL8DnEcjUnZbUcIamHrSPST1paAVUxtISz8FFGS3lWfUo56J4RV00kChUOi2voTVof0yOlry97XPB3chAOLoMg+XMXJKzmvReAS3+Ooc/jM2jh78guMD5MmgsDEtA9ztwHwUMhfnp1vgxUMhvkovcBBxJqkVnMLcwOVEunCiBMrSbXR0yGKz1DyuiFR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB2474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(39850400004)(366004)(136003)(376002)(29502001)(478600001)(2906002)(8936002)(7696005)(33656002)(110136005)(316002)(8676002)(66946007)(4744005)(9686003)(55016002)(66556008)(66446008)(64756008)(66476007)(76116006)(52536014)(6506007)(86362001)(186003)(26005)(5660300002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 apEimKqvokSRjuSOoxM87TzGHLQHgcH6tfvQlCX2cwbfcRvLjJOsB7mJUI6pdlxemwDyU355HPYHx6dSMz6yCELMNobCC5keY2t1H9l7Qb+Kv89ctGTgi7FfFRpvyvN6OEiD83hYKi0t4qduj9IW1NifsfaC5MQt2ifeZ/arAfK2vTW7awtP7qy2ORF1cgK4UO/gRms+IiZGw/9w5/XxsZt4+p3bP4aAtzvccIVrz1xyhEea1YoNYd9w3L6aaO8+EBlSl82oX7zB15bjPJc0E7Iahi5YInp1fwYv0Kn3A2aqPdaotcAXLi2A+0dERB1mWFXmN3x51NqcbHTyAHP2gQqFdCVNSDax8UM1A5sJdcZILXX6clghqcwFGKOHy8iNShZMCrSIQCVnCCgY/6igA71iJd6B4WER2Tby1eF94NbViF4QGbujkaGpC7bC41GhPlPHi17jbI60RYCNU6Is3rj5FEQI0ZhGcXJ9gz1jDh8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB2474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fd027f-11a9-4d5a-430b-08d817b0b706
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 20:05:02.3639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKFruBLL2RaZX/y98GlZxa2EQYD8BjUxgct3StJ4tWi+p1pSnAuMexgGGOdQ22NHvbytZ3QKGVMJBoQ5Ytg6tJ9WCqYwLGwB+6eMBa+Ekb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4489
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > Does anyone know what the intended audience is for the Developer Day
> presentations? E.g. would someone who uses bitbake day-to-day but perhaps
> doesn't edit recipes benefit?
> >
>=20
> I would say look at the schedule and see if there are talks of interest t=
o you.

I did, but the schedule says nothing about the level of the topics.

Thanks,
Chris=20
