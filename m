Return-Path: <cbugot@sierrawireless.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0072.outbound.protection.outlook.com [104.47.40.72])
	by mail.openembedded.org (Postfix) with ESMTP id 4D032749EC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 14:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=SierraWirelessInc.onmicrosoft.com; s=selector1-sierrawireless-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=E/jqRHp6M5WfCZ8ttXb/l1oHuw+LrbuNj21M9+315Yc=;
	b=Bd8U7i6pg0qNkNJd3dBpIGcyzxGHp3nGA8oo1gWAxhLFs2pkMQh0ycp4C/I/sCNRO1BlVcv+B3tHVlgQ/rC3fWFQzLcG2gMNwPCvAlYCGXCMomZ8vIMct/CIYItb9NDeWgwI8ADYpRIimQ7q3lvAMqfY1GjCU5+Id67c7pFQIhE=
Received: from CY1PR02MB1152.namprd02.prod.outlook.com (10.163.15.154) by
	CY1PR02MB1349.namprd02.prod.outlook.com (10.161.170.28) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.631.10; Tue, 3 Apr 2018 14:15:11 +0000
Received: from CY1PR02MB1152.namprd02.prod.outlook.com
	([fe80::39e8:b5a6:a20d:d4d3]) by
	CY1PR02MB1152.namprd02.prod.outlook.com
	([fe80::39e8:b5a6:a20d:d4d3%13]) with mapi id 15.20.0631.013;
	Tue, 3 Apr 2018 14:15:11 +0000
From: Cuero Bugot <cbugot@sierrawireless.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] uninative: add variables to the whitelist so
	that it does not re-triger recipe parsing
Thread-Index: AdO9TH9RHM3TjEkGRgOC2+RK0UYmKwALiVWAAIPGOEAAAAwkgAImFIdgAMxVQYAAAA2nwA==
Date: Tue, 3 Apr 2018 14:15:11 +0000
Message-ID: <CY1PR02MB11529A719BDE5DD784C82C69A3A50@CY1PR02MB1152.namprd02.prod.outlook.com>
References: <CY1PR02MB115212269AF12AA9BC2963DBA3D40@CY1PR02MB1152.namprd02.prod.outlook.com>
	<BY1PR02MB11478B00DEE78E80BF02468CA3A10@BY1PR02MB1147.namprd02.prod.outlook.com>
	<1522763797.11431.234.camel@linuxfoundation.org>
In-Reply-To: <1522763797.11431.234.camel@linuxfoundation.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=cbugot@sierrawireless.com; 
x-originating-ip: [84.14.163.134]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR02MB1349;
	7:N/ld0N6TFabrQRFm/U9PiKuG6dOrzarnNU/z3ASWyBAXZlYejVmelq2z6etCqk9MXh9uGb97oCUEGC7Nz/ZAKK4bXLUBW0BJfbRXClzEqHsA7Af7TSfBzLfNZiR9hZcBqrm4LPBFAJOPpKctn6NDV3Aalofdg+i1RRIPuJ6nzMnh8Yvy7E4wfyjhZ507dgsOLTrtiB0dv4MYPVID46WlGz1rti4zsPGPEZBMCz21hnkx25/x9YL6PX+CXF0VzMOh
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: eafab06a-c1d4-444d-a45f-08d5996d4fd9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(48565401081)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY1PR02MB1349; 
x-ms-traffictypediagnostic: CY1PR02MB1349:
x-microsoft-antispam-prvs: <CY1PR02MB1349744E59CAC7056626D062A3A50@CY1PR02MB1349.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231221)(944501327)(52105095)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:CY1PR02MB1349; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1349; 
x-forefront-prvs: 0631F0BC3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(39380400002)(39860400002)(346002)(376002)(189003)(199004)(6116002)(305945005)(3846002)(316002)(105586002)(33656002)(2501003)(5250100002)(106356001)(55016002)(66066001)(9686003)(6506007)(99286004)(229853002)(74316002)(76176011)(102836004)(2906002)(7736002)(25786009)(3280700002)(55236004)(8676002)(97736004)(6436002)(5660300001)(3660700001)(81156014)(8936002)(478600001)(14454004)(110136005)(2900100001)(6246003)(81166006)(68736007)(86362001)(7696005)(186003)(486005)(53936002)(486005)(446003)(476003)(26005)(11346002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1349;
	H:CY1PR02MB1152.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: sierrawireless.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: lEfjTai7Q9nqDWBR3pzKFbxQmAAe3ygLciqkstf5L9qpjUM2LMPTOv/HWkfdnh1B5xvEkTM8BqiFTL2s+S2WuWneRhSRoRdE5tLX2vvEykSue5uTG1QFPprmfVu8LrJ9ZEBVATiQc4WhaUgVerqvzofa0NWfHzEq8UH3MkK8zGwLXFMw0RDdpFhK3ZuODGDGyOCq9d9UXDZwrZLdf+aWvLhte5Kc0caoAnBVGbnMcX8FzNm3lX8jheaL/3YUWhPabk33a/WWEmXTBPb9Pi7lwrkoc8e40D1tT9I0yqamQT/gmxV5vlHaM7uqsgbaiADlK619SL5i/JCQuHzLtqGCxyez3iSnHfj2MXUYKlkKX1RzXuZus66h7rdldE0LrfmgY+F0WF1paGZ1VW3Cb7vGZkFiG1ScydRh6GoXNuWB3eI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: sierrawireless.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eafab06a-c1d4-444d-a45f-08d5996d4fd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2018 14:15:11.2160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 08059a4c-2486-43dd-89e3-3a747e0dcbe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1349
Subject: Re: [PATCH] uninative: add variables to the whitelist so that it does not re-triger recipe parsing
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
X-List-Received-Date: Tue, 03 Apr 2018 14:15:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBJbiBzaG9ydCB0aGUgYW5zd2VyIGlzIHRoYXQgbm8sIHdlIHNob3VsZG4ndCBhbmQgeW91ciBw
YXRjaCBpcyB0aGUgYmV0dGVyIG9wdGlvbi4gSSd2ZSBxdWV1ZWQgaXQgaW4gc3Vtby1uZXh0LiBU
aGFua3MgZm9yIGZpZ3VyaW5nIGl0IG91dCBhcyBpdCBpcyBhbiBhbm5veWluZyBwcm9ibGVtLg0K
DQpIZXkgbm8gcHJiICEgR2l2ZW4gaGUgdHJhZmZpYyBvbiB0aGlzIGxpc3QgSSB1bmRlcnN0YW5k
IGV2ZXJ5b25lIGlzIGJ1c3khDQpXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBhZGQgaXQgdG8gcm9j
a28tbmV4dCAgYXMgd2VsbCA/ICh0aGUgcGF0Y2ggYXBwbGllcyBhcyBpcykgKEkgYXNrIGluIG15
IHNlbGYgaW50ZXJlc3QgYXMgd2UgYXJlIHVzaW5nIHJvY2tvIGFzIG9mIG5vdyk7IG9yIGRvZXMg
aXQgY29udHJhZGljdCBzcGVjaWZpYyBwb2xpY2llcyBmb3IgcmVsZWFzZWQgYnJhbmNoZXMgPw0K
VGh4LA0KQ3Vlcm8NCg==

