Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.88])
 by mx.groups.io with SMTP id smtpd.web10.12502.1593002446693318689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 05:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=DbFqVSvJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.223.88, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XChtW+NYtL1l6/s0EjjM4VxIvkH9o1dW0r7OBUewzl5IQ9dP+9G8JZK5l4gdTJvbUWig04v6orjAVaZy/6gpjMJGMU+wKUdYhfAHQR9I5sohUPxYf8syCB8gOluuQ/rRvM6C8OjfBNgKJquglYfSzN56m/16sp+Ed/3Iq4CraBryuWRbX6Y4rrPIyyZRzq17lZAdCdcfPr/IqZETAIOISaDO96nZh2dANosGxqa0WhNnDIOi1zijWCtMjeFw0E0ibCz98j6PyWaV647175BawElHclTFRJrpkqN6TsNAjQqbUt+82ZG3OshzrnCz7nnlhje9FqO56/hpK1JjB7SfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6Yxc5UUf2SELrCp2JM4KFGESBWiCQsiOt7G4yOacQA=;
 b=SP5DON6MTNqzuTKo9Aq60Z2EGNm3X5PK6/lwskICeuU9gQW3YOK9KXx5U8gSGgddgiMrMSx0rf6NfACYTRPoz0pbF+CZLJUF4QD7/+oD106Li+Q9rSKh0aTnl0KpLHoxt+gdGemmc+J3NccPdLB/1El58OWvw2MF5XDB9aokhLApEfYIxl5Kb46UXmneXU6C9s3EKXBLhQuxTpbF95Prll9B1F4z8noVGcocs3cOibjLj/Cfx7TrMb7r3DlIWxq5YS++lqsF1I9Fu4ZdGnMapp3MgFeJNfqylEo/sXnr3uMAoDPbUd0niImAKd0v6t+1sK2OEW8ekUee3xl0bf0hQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6Yxc5UUf2SELrCp2JM4KFGESBWiCQsiOt7G4yOacQA=;
 b=DbFqVSvJN+eaHiDczLjcrpS6Bf/Q+mjYhOAMwCIxErzSUqE50mIyD571DP0br/62cOJ26C3SXom9HRpPSHx/yWmSNS21HREz2IrBArmS1TMzGEBSBkFPRHpTH4vGZ8Cxr68OyEcVR6xnRYpT7gQ+LEWbHafJLNgwOQFMbSG15WK0L0xAhtxn2HKjlEU+Y5VQxGqSxO6JB7wU6Zgksmn7yP17wKRLavePVMtjBFtMiKqoEUZ/DmEiMN2s2amwI2BtP8RXrDYZ2qDm+q3jAkktWTGrsB/8jSMNnPxFvVRU44uNPcWMQdKTf3W8W9at88A4mEaRhfHVbeEMC9WpiwRD6g==
Received: from MW2PR12MB2474.namprd12.prod.outlook.com (2603:10b6:907:9::13)
 by MW3PR12MB4588.namprd12.prod.outlook.com (2603:10b6:303:2e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 12:40:45 +0000
Received: from MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::9c61:7026:1495:5660]) by MW2PR12MB2474.namprd12.prod.outlook.com
 ([fe80::9c61:7026:1495:5660%7]) with mapi id 15.20.3109.026; Wed, 24 Jun 2020
 12:40:45 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: "Reyna, David" <david.reyna@windriver.com>, "sjolley.yp.pm@gmail.com"
	<sjolley.yp.pm@gmail.com>, "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Yocto Project Status WW25'20
Thread-Topic: [OE-core] Yocto Project Status WW25'20
Thread-Index: AdZJbUdP+FsSdrtKSByBV3SeDZdVTwACStUQABrs1tAAEJQusA==
Date: Wed, 24 Jun 2020 12:40:45 +0000
Message-ID: 
 <MW2PR12MB2474A5D2D05F52EE3970AD478B950@MW2PR12MB2474.namprd12.prod.outlook.com>
References: <067a01d6496d$5f46d9b0$1dd48d10$@gmail.com>
 <MW2PR12MB247418580E300A77C479C1698B940@MW2PR12MB2474.namprd12.prod.outlook.com>
 <BY5PR11MB4167B414192233E0A5F8F241EA950@BY5PR11MB4167.namprd11.prod.outlook.com>
In-Reply-To: 
 <BY5PR11MB4167B414192233E0A5F8F241EA950@BY5PR11MB4167.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38a4b315-6f22-4095-6633-08d8183bd076
x-ms-traffictypediagnostic: MW3PR12MB4588:
x-microsoft-antispam-prvs: 
 <MW3PR12MB45882134B72FFBBA304A4C398B950@MW3PR12MB4588.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YUqxGHeC8VviDK1RJInHKiLgvRTmCpfz3u1fibOfmIrvRca6lgIRoXxkjnfh/Ga3PL3ubZiZZm6qIgOR7EH4GmKbbWPZyqHOF380qaLJBvUXMd8mioQmyv998atWes3jtaJEkHnuAwiNpAQCtE2YvfgqJD6OGzrUIyvifnbtMlFrLpEwlyN96dt29Ni3Ks4dO5pimj/AHn5EPTBL/49KVx5ZCtAsVyryNv4V0uSIDehSMWch22RgDTuUTMyoZ0NlAuc0KaMjSL0O15GSsGXBa+HGoT6Nt5hegAp7v4WmJoCkNLWaVWZsJLQ5xH8BOJNxHtSmC9SKT70UDk9YYEKXG7+eOIihr7KKKaydsrdEsnRD/hexeASPAo6qOMztRZU9SrCxf1FuBBKFS+IGDghNntTOv+r83fRQebE7WoTZRRdxNiklBc2l2BtPcTgAIXjM0b41dje1KwNvlRTjic5GUw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB2474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(366004)(136003)(346002)(39860400002)(396003)(29502001)(71200400001)(966005)(7696005)(8936002)(6506007)(8676002)(2906002)(86362001)(478600001)(26005)(33656002)(186003)(66476007)(316002)(110136005)(76116006)(64756008)(52536014)(55016002)(66446008)(5660300002)(66946007)(9686003)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Lbu6OzcPJN6PKpLnNzTK27WQQUbDxSG6W7Ov+OLJ/KKhVH1tQ8bvUZPyiKhNEDtnYKed3AdWMEztXKg4QcGL6U9ch39y9kwCBhC5iLxU/Nw8I3equx+Bdkz6Mfj9liQpzXN5g60/dUopH3ElUd4mGii1M3OYZH1XilME4Cbm5kbnUAPdmdK1v4eJqMCCIJaxd4vOg3srbE2oaSW1wMuAub7mHEcfaW+n4kTYJ5HpjOVEsZDZliq7SBlizYkPDIoCsSNukZpkfyAKfjoxLSMreRymhbTChDeuZ+pZlFz2RR65aFnRcsddb7eQciDN2WZW5AN6EYwPa8WrmkxNad3uNEasPMRTPP0FDDuoQ7XefjICQSJloxndrqY2nwWBTT6Ki54uyCzfp38hGB70S1mOLgTkN8YQ5lZhBwVKeSbJ8KTlBx7X3bwx/KW4e5p62Bxg2sHWnzECNeEAd3PXh4hla2LBbeklKu35aDQhn2dQUTY9X7JTIyVZWsfkIVROIr4t
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a4b315-6f22-4095-6633-08d8183bd076
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 12:40:45.0873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pu8csDi0aAdms02n9soO1sOYUCQf+8ZKiFwCLf9VdPSP3J06BzGwekq1b5uud/N9nE3oOadZkyH1UKIop6wJTf/9fdubPSgwDBYpMtA0m1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4588
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi David,

> > "Does anyone know what the intended audience is for the Developer Day
> presentations?"
>=20
> The official description for the intended audience can be found here:
> https://www.yoctoproject.org/yocto-project-dev-day-virtual-north-america-
> 2020/
>=20
> We will be covering a lot of topics that can give you ideas on how to use=
 OE/YP
> in perhaps new ways, for example in containers, virtualization, micro ser=
vices,
> and CI/CD frameworks.
>=20
> There will be practical instruction in such topics as image size reductio=
n.
>=20
> There will also be hands-on exercises in the kernel development tools and=
 user
> space management.
>=20
> There will be many ways to expand your horizons with Yocto Project at
> DevDay, to meet and hear the community experts behind all the magic, and
> even bring them your questions directly.
>=20
> All of this plus being with people passionate about OE/YP and having fun =
at the
> same time! A bargain at any price!
>=20
> - David

Excellent, thank you! I was going to attend anyway :). Was just trying to f=
igure out if others on my team might also benefit, and it sounds like they =
will.

Thanks again,
Chris=20

