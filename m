Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.64])
 by mx.groups.io with SMTP id smtpd.web11.6433.1599684414451915544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 13:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=UjQlEmfN;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.64, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEStIoidFw6+KUzfEMRUkQY+gbuSe5Dk/oSXhwOjF8nTMiPDJ7FQq1hf5foG7TISJYLi2nNeWw6gDl+BiLFFyUnADB4yZhGwdHA/356vBCWnbj6Mg2Co7q/vE3UBTxUqeCxzl04u7kdEcqr+7J971+RYDtk71HmWbnmBl1MqIGiyrh0a7v+7VQGtg+NvnPEIrFz3LNZBQx0ZxNaP7I/E5ySLxnHLV6ipYXD5xWX8C9It4fdIAJWigTeAgd4Nkz4IEYuEQBiT9KCIudbiNZxsJp5q4Ddn+xgaNnYZilvSuSaBjvCwQr5C7mo4Rt1Kttz0t8GY0tlXsPYdntlYJdGe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrFczzdLRpInOcBn1OK8OEiEab0o65jejrYYsBwi9Ws=;
 b=ANcliasfq/2tV/jd7PnnPaXjV3OXHUs/yB3hxKd43PizsqxEYKlmL+zQwTs6Wb+Xkktfyel5Gg+y1CzilCpl05ybasGKadnRf6bA2RkhHHykLBvoVB3ofPetrrM43l8ey7m4aWdxanqPNseVoTih3pn4ZEj3RUKn7Ho75Ygoq2AkvHOU3kDwU9tGElB8lXhImkE29DkJKapIPmjZI0yEGOtTsMNg2DizT0atTZznDJczK5Vr9fOkOWZtBSIfnOTsWvncyNpuC1oh9XecJQINhrtlNRLUyRyj9PPhOByKgMEOlTkbeAygwcwcJb3+fsNhRM1Zm80R7uAO7hMux0l/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrFczzdLRpInOcBn1OK8OEiEab0o65jejrYYsBwi9Ws=;
 b=UjQlEmfNrFVUbL7Cuu3CusQBGl4oKae8QHcz52uohe6wizjem1XgvPuCnVjtxakzLShFJHJGhangWF7UTH1PHoTO2Dw+i10eLZLaCChChM90EUD5OTXGUg1OXZ9kcsTKHFRbczXb+DXGC12yzcaVOvBpg3wVCdKkHllAeBaUZl8YeAoId1j9TqelE5RFEtcTR+cvEG7qQNq3dY3I+kN6mijYbKyWs3Qy+f6AQHPysmszGvi2OoS23Avhhjif7+8NGzjnC/NXWMkfPP3ovekE6soeUKRsjJj1anOfyT8z5fdGpVmq2SRXRKzMWBipKj4KH663nGRqEMcof9hxcaYexA==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 20:46:52 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d%7]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 20:46:52 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Ross Burton <ross@burtonini.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/4] cve-check/cve-update-db-native: fix under multiconfig
Thread-Topic: [OE-core] [PATCH 2/4] cve-check/cve-update-db-native: fix under
 multiconfig
Thread-Index: AQHWhs+ce3cEfbaSDkagVkODTXL5Sqlgv2SAgAAC9HCAAASFoA==
Date: Wed, 9 Sep 2020 20:46:52 +0000
Message-ID: 
 <SN1PR12MB248086350406CEA62DFE61278B260@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200909173510.114925-1-chris.laplante@agilent.com>
 <20200909173510.114925-2-chris.laplante@agilent.com>
 <CAAnfSTufbRYeTjS4ovx=5Bj1jqYsheYzJcysCo7j-1PqmD+x-A@mail.gmail.com>
 <SN1PR12MB24802B0C1DBDBC6FF5C4AA188B260@SN1PR12MB2480.namprd12.prod.outlook.com>
In-Reply-To: 
 <SN1PR12MB24802B0C1DBDBC6FF5C4AA188B260@SN1PR12MB2480.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7ea0059-0310-41f0-478c-08d855017b6d
x-ms-traffictypediagnostic: SA0PR12MB4494:
x-microsoft-antispam-prvs: 
 <SA0PR12MB4494784E70EC4CD815660BBB8B260@SA0PR12MB4494.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 szTIUTdcmB+GM2x/uN81sJ5dlMvyuazptIGtbKz/FRG6njUeIMsGjaXaFtbl0Th6CcFRGkQ/wxFb/weWyBJ6OnwIo8cDd6H1ZVdcNnmyoWxZOPdAB2qOE3XEHVlDv6OmL8+dnifsmfhZKvl8FIrdjoIILXuDrnjqvsDLmKXQ/csMl9UxXN4P/RmwAFg/7EBCO6SuLW3ErJ0e4ikfg05V17D+qaHChuxZmOqLUQGe4Mg1myHavQL00nOT5WEuvS7/aPnB57FuliXO1Re8SRFldJxNzrDrqsUtajTI7x4wVfwUY7L0nRd/RDz6aQz5S7ymfX93ATs+4SZZBXG6dSE1Yzdb4S8yFWm+y97bZPXfPkMbOpu2D3HK7hiQP26UmXwC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(29502001)(9686003)(2906002)(26005)(52536014)(2940100002)(316002)(8936002)(71200400001)(83380400001)(4326008)(8676002)(6506007)(55016002)(33656002)(5660300002)(7696005)(4744005)(186003)(66556008)(64756008)(76116006)(66446008)(478600001)(6916009)(66946007)(66476007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 scrEeLgxrtnS/EmV4dJwvb1QaJp0vULq/35vh2q34BstgZ4zGLfyEQisD0Oxiwn7yqAylPSx+K3gjWA7sS5LKrCTNoI+STyX0KLoisNzDoCgSMEOLDej1au97hcCxX1k3yOnpjrrlt6xVW4RW2G1ztFqFeNfcP42aFr/AGtY5ZTILqVVFZgfF20vJn+FCMYy3u5QHTDu+OAjg/XcWB+Hra1YvJwF/H3DtjL5QzMT7pgmX2TLWFSwMWnpxzQk5SwAm84HKtDjoXR3Y/XzaJV+9EeGoKvxqvEeowZeCeglc/BcmKt0a022WPF1z1YYn/CGnGo628v83WqiRX2izJS6dmExRoGG85KaVT5AkTTKdjnEBOMFlpJyyT2i9NnKEm7pqR14jyIGkeiLeyJ1Ae/geLT2Y4jPDzMh2t9tN/r6pQrsPkbA8CpTVSeacmVFCBfL3RFJyzKuDD6alzVDlypGzPbUdCOofkXlaCI0sI72P2hxqNO3A0fZHqTe1lxtc8SPyM9sfJCHJKpggnta/Q31WQR5veyuc3ZG78DE7mAy3MqaPNJeeFlwuZJ1KP9/x45KUPdqWQg2VXFDUglyri6atrEHyIysdQLFUsvcqoAVppuEgX++DaMOyQ0wL0pjMC004Nf1YFwqVTTISr6VU+SOIQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ea0059-0310-41f0-478c-08d855017b6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 20:46:52.6083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ekXDF+gxg4x3FJK4bV71zYTVQv9cX/f5FmaC1aIwY+pkNcQhRyAV9usOCzZbyvnQ+Z61pHWiPX/BXjxVxMme4gAqmGPFKEVmvS7QxMW+TQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IEJ1dCB0aGUgZGF0YWJhc2VzIHdpbGwgYmUgaWRlbnRpY2FsIHNvIHRoYXQncyBiYXNpY2Fs
bHkgYSB3YXN0ZSBvZg0KPiA+IHRpbWUuICBIb3cgYWJvdXQgYWRkaW5nIGEgbG9jayBmaWxlIHNv
IHRoZSBzZWNvbmQgdGFzayB3YWl0cyBmb3IgdGhlDQo+ID4gZmlyc3QgdG8gY29tcGxldGUsIGFu
ZCB0aGVuIGRvZXMgbm90aGluZyBhcyB0aGUgZGF0YWJhc2UgaXMgdXAgdG8gZGF0ZT8NCj4gDQo+
IFRoYXQncyBhIGdvb2QgcG9pbnQuIEkgYWxzbyBjb25zaWRlcmVkIGp1c3QgbWFraW5nIGl0IGEg
YmIuZXZlbnQuQnVpbGRTdGFydGVkDQo+IGV2ZW50IGhhbmRsZXIsIGxpa2UgaG93IHVuaW5hdGl2
ZSB3b3Jrcy4NCg0KU2hvdWxkIGhhdmUgbWVudGlvbmVkLCBJIGxpa2UgeW91ciBhcHByb2FjaCBi
ZXR0ZXIgYW5kIGFtIHdvcmtpbmcgb24gYSB2MiBwYXRjaCBzZXJpZXMuIA0KDQpUaGFua3MsDQpD
aHJpcyANCg==
