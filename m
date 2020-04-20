Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.85])
 by mx.groups.io with SMTP id smtpd.web10.2416.1587391005877691551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 06:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=O2qS3zcw;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.85, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3r0NlVstf2OyBNhb92Cx5UWCSYzScki1BRYnTmZzNHYuraCL82q13V755FDtSSlQgmOKO6RdD9SLcKiGZkaOdIyZ0MkiXBlyczZeo8v6fwzPP15u7OcUSgDR65JDTfjIGG0MiYndmjfspx7UMfNegVWPRe4RhdGPmAt6QlD13ipwUhmps1vyZYidu8iIpMh2p+Gq1q4d7KclWFY/7I3LMkkVZCGOAMruO6LDhmeFYjKo1yNs7ILjy2PHwnzScEbeCVivv6RFY3i9js4b7Gfrff5UiVP7pC+iST7hYJ+XPTTbxT0zjZhzNYpiJfO0Wkhu9qezhkqWXvLSSO7z1RN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyXHbFsej5y/sZKDX0isTqJAsCFH3QCnZTgC86+ZP/E=;
 b=Z75MrGCECUgatZqd0crWhh25K/Z1NcBOd5Ilbxu7A1ZgMx1FAmoMAkgLf3DchaOBk1nXB0SRcOsd8hcpGEFPCCE+ywOzPQyF9QPBjASmLyakr/otKntoraTYntUwXqgRPAtRNohUjo04RVKrK0WIeBrAKg9SGhA8jXIA/xRKcGziQQDh7PuNAW6HT7j/Ps/EHBkcRlNrnTn/sAWcFpO3QRd8x5M4OIyaN8zFE15bTFqEJH9ZvMHi+RPaTwazLtK5dIzMoDAsnFsNOiJttXZahVs6oYdQwwMvFt0IMqACdCOTv3iUsKC6QdBaKfKMw7uJX/qziByGxDwZOPfhnfDv8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyXHbFsej5y/sZKDX0isTqJAsCFH3QCnZTgC86+ZP/E=;
 b=O2qS3zcwBLrSxa+4IHsuxBSpV5EuByNfVQYj34bJ7/iz1SYPiRw/xxV2pLkpgETADLiVwLNW4pivrifwTL2f/ZwMFj+6yuhNLeY9zInPW3w6Tf4gg3iqNggmVZIhI/aFAOEwxzUsPUF4Paj62mynF/C9bmS5KGOBxJIrXJt8dXs=
Received: from DM5PR12MB2471.namprd12.prod.outlook.com (2603:10b6:4:b5::10) by
 DM5PR12MB1145.namprd12.prod.outlook.com (2603:10b6:3:77::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.29; Mon, 20 Apr 2020 13:56:45 +0000
Received: from DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab]) by DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab%5]) with mapi id 15.20.2921.030; Mon, 20 Apr 2020
 13:56:44 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Uninative for i386 native tool?
Thread-Topic: [OE-core] Uninative for i386 native tool?
Thread-Index: AdYWkVM2trCb21KjTGaQ4NZX8woV6AAAwS0AAAATDeAAAN0CgAAgydzw
Date: Mon, 20 Apr 2020 13:56:44 +0000
Message-ID: 
 <DM5PR12MB2471EFA4F9009E30FF859FC28BD40@DM5PR12MB2471.namprd12.prod.outlook.com>
References: 
 <DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
	 <DM5PR12MB2471B5B5A25824BCF32B57DA8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
 <207860401ddfafd8de45143986549873935deff7.camel@linuxfoundation.org>
In-Reply-To: 
 <207860401ddfafd8de45143986549873935deff7.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1019731-1d62-41fb-e0fd-08d7e532a957
x-ms-traffictypediagnostic: DM5PR12MB1145:
x-microsoft-antispam-prvs: 
 <DM5PR12MB11456C1B5B53AFF96630CC508BD40@DM5PR12MB1145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2471.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(136003)(39860400002)(396003)(376002)(346002)(29502001)(66556008)(316002)(8676002)(64756008)(66446008)(52536014)(66946007)(66476007)(186003)(76116006)(86362001)(9686003)(110136005)(2906002)(8936002)(478600001)(4326008)(33656002)(6506007)(5660300002)(4744005)(26005)(55016002)(71200400001)(7696005)(81156014);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: agilent.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JcGx1EMmj3s//SdBxtxucGS1q2Xxw7iit0HgUAopvBsQ9fPgP3crIXFFLoi/kBX4QHnljEJFyuyJ9slFyV0AY36nRSs3Q4k72DsKnXPBo3OMXXMcQS/0TrLg3Y/nrjD8dIV+QSxueeGDMxHYUhX0P5NmJ7B2fwKw27K9YEww12lTSzBh8OKDni1abLX1tiD0auhgRuj1lsdNMj3eDyy20CqiA0TEUi0GAo3DNOwM9HGnikU1qsEm9p5ru0OKXdQEoiH8tvG/jJul+pVhvp0Z0LxYoihftGNqcf1NUewV8K1yVVmQNv7X89y0ie0tCa8P1DOuE6BQByy0Wftpiu2aNfqOI66KByrkYTPAz+KFaOGYzeTbfIfTwGzkGUWPN/AHfan1sPpTYhNGRpoSRTjCG2PJC6dHSjM/ZmfzvOfJoSWziDAqlUVcKB9sON583avgcyK3h9X5yb3eSB5tPw2YvKcmQrfsG5tebRX7gQQ3zhSYgVPxXWGANFz7czpNuOOP
x-ms-exchange-antispam-messagedata: 
 /nId7DAosRDtuybMCo1zvtCfNgFyf3FCtpHcb+D8kL8U3rkk8nnBxAnm87LZZ93hnT5W2PG09NMzEq6/YAr6OtL61DaoQ7KArjSc8I37esDBF5RzWo3ZdrijL7Bir22YFPF9yWZSBMdXKAFBRS2D/Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1019731-1d62-41fb-e0fd-08d7e532a957
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 13:56:44.6669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6xp0iJcgNZGqGQ6/890zkT+aJgSgYo9vcCpw/fBTsF2Y/Wmz/tJ6RTaJRSk/uvv2E/OwwdneVoCnJCOQVmgKwSYoC+buhyfKRxsNIdpQzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1145
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBJIHN1c3BlY3QgdW5pbmF0aXZlIGFzc3VtZXMgYWxsIGJpbmFyaWVzIGFyZSBmb3IgdGhlIG1h
aW4gc3lzdGVtIGFyY2hpdGVjdHVyZQ0KPiBzbyBpdHMgcHJvYmFibHkgdHJ5aW5nIHRvIGNoYW5n
ZSB0aGUgaW50ZXJwcmV0ZXIgdG8gYSA2NCBiaXQgb25lIHdoaWNoIGNsZWFybHkNCj4gd29uJ3Qg
d29yayBpbiB0aGlzIGNhc2UuDQo+IA0KPiBJdCB3b3VsZCBiZSBhIHF1ZXN0aW9uIG9mIHN0b3Bw
aW5nIGl0IGZvciB0aGVzZSBiaW5hcmllcyBzb21laG93Li4uDQoNCk1heWJlIGEgbWF0dGVyIG9m
IGRvaW5nIHNvbWV0aGluZyBsaWtlIFVOSU5BVElWRV9MT0FERVJfcG4tbXktdG9vbCA9ICI/Pz8i
DQoNCldoZXJlICI/Pz8iIHdvdWxkIGJlIHRoZSBsb2FkZXIgaW4gYSBoeXBvdGhldGljYWwgaTM4
NiB1bmluYXRpdmUuIA0KDQpDaHJpcyANCg==
