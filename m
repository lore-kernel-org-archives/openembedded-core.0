Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 1105 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 20 Jan 2018 00:05:51 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0081.outbound.protection.outlook.com [104.47.41.81])
	by mail.openembedded.org (Postfix) with ESMTP id 48018787C6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jan 2018 00:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=8IryIv5IH3PlSm/b5Feu6ie8p6J/ENEvSUiHTyGzfW4=;
	b=Sp1gnIknDK/+IEYF70v1IXk39EHKDVdZkuRveR5KFCzngKFehDEwNxEx8kfs+iHE3mj4iPAFrpSY20PE41qjzcC3VTkERtog3wrk5JSPhnK+9X8B5aEe7iYs2MD2psrKFu0zEF2/WM8GVFCR7SMnIMXwn7pTHffBmuZusvkMghc=
Received: from MWHPR0201MB3401.namprd02.prod.outlook.com (10.167.161.138) by
	MWHPR0201MB3515.namprd02.prod.outlook.com (10.167.162.12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Fri, 19 Jan 2018 23:33:17 +0000
Received: from MWHPR0201MB3401.namprd02.prod.outlook.com
	([fe80::b0fb:d931:3c9d:3682]) by
	MWHPR0201MB3401.namprd02.prod.outlook.com
	([fe80::b0fb:d931:3c9d:3682%13]) with mapi id 15.20.0428.014;
	Fri, 19 Jan 2018 23:33:17 +0000
From: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] cmake: use Ninja by default
Thread-Index: AQHTkFlNDBiPAvdtCUqHLO+3Mdo4WaN7VLSA
Date: Fri, 19 Jan 2018 23:33:17 +0000
Message-ID: <MWHPR0201MB3401AEB863CF0C9F08C35402ACEF0@MWHPR0201MB3401.namprd02.prod.outlook.com>
References: <20180118123804.2465-1-ross.burton@intel.com>
	<20180118123804.2465-2-ross.burton@intel.com>
In-Reply-To: <20180118123804.2465-2-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MWHPR0201MB3401.namprd02.prod.outlook.com
	(15.20.0428.000)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alejandr@xilinx.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR0201MB3515;
	7:Vp+Cr0lTkOCRFu7v32fp5qI93K3H2wVPmBBkE0tBUxvkkhrx8jNwkqK4LF7LswqXu0nEFwBkdMoYr9kLusmTxHJ+l4taR8tyXD9GWGv4G+yN/MKmJrvcIo//dbaxE8cRaROEDg48dIv7Js/LucRBOVfsdA9MRl8b2Qag/CH3iIS56j1YHEj1JYAVLMgvN1eXVIR/ErUVjaUy2b+Z+7XHjyQkauiNN3iQFfnzouRxAEwKE9ScYxTeJofiqg3XPNum
x-ms-office365-filtering-correlation-id: 6303af57-7578-4a44-f464-08d55f9504a4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(48565401081)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0201MB3515; 
x-ms-traffictypediagnostic: MWHPR0201MB3515:
x-microsoft-antispam-prvs: <MWHPR0201MB35153253B727621A58B7F086ACEF0@MWHPR0201MB3515.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040498)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231023)(2400081)(944501161)(6055026)(6041285)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:MWHPR0201MB3515; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR0201MB3515; 
x-forefront-prvs: 0557CBAD84
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(396003)(39860400002)(39380400002)(189003)(199004)(55016002)(106356001)(2351001)(66066001)(5640700003)(9686003)(3280700002)(3660700001)(6436002)(68736007)(6916009)(81156014)(81166006)(8676002)(8936002)(316002)(3846002)(6116002)(229853002)(6506007)(53546011)(102836004)(86362001)(59450400001)(26005)(97736004)(2906002)(6246003)(105586002)(5250100002)(2501003)(76176011)(53936002)(7696005)(33656002)(478600001)(25786009)(14454004)(5660300001)(99286004)(2950100002)(2900100001)(7736002)(305945005)(74316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3515;
	H:MWHPR0201MB3401.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: TwO3NiHbukyNg/xWIgSmTD8zEstLRctLAw5iMur2/osFxdghxNEeFI9i+j5q8z8byxT3UB8AMo7nu9UUKfCzZQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6303af57-7578-4a44-f464-08d55f9504a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2018 23:33:17.4853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3515
Subject: Re: [PATCH 2/2] cmake: use Ninja by default
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
X-List-Received-Date: Sat, 20 Jan 2018 00:05:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EA3DC4859554A4EB6C03E5982E1D0AB@xilinx.onmicrosoft.com>
Content-Transfer-Encoding: base64

DQpPbiAwMS8xOC8yMDE4IDA0OjM4IEFNLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4gVGhpcyBjaGFu
Z2VzIHRoZSBjbWFrZSBjbGFzcyB0byB1c2UgTmluamEgaW5zdGVhZCBvZiBNYWtlIGJ5IGRlZmF1
bHQuDQo+DQo+IElmIGEgcmVjaXBlIGlzIGJyb2tlbiB3aXRoIE5pbmphIHRoZW4gdGhlIHJlY2lw
ZSBjYW4gc2V0IE9FQ01BS0VfR0VORVJBVE9SPSJVbml4DQo+IE1ha2VmaWxlcyIgdG8gY2hhbmdl
IGJhY2sgdG8gTWFrZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVy
dG9uQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgbWV0YS9jbGFzc2VzL2NtYWtlLmJiY2xhc3MgfCAy
ICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvY21ha2UuYmJjbGFzcyBiL21ldGEvY2xhc3Nl
cy9jbWFrZS5iYmNsYXNzDQo+IGluZGV4IDc0YTk1MjE0MmZmLi5kNjBkYWQ4ZDY2YiAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS9jbGFzc2VzL2NtYWtlLmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2Vz
L2NtYWtlLmJiY2xhc3MNCj4gQEAgLTksNyArOSw3IEBAIENDQUNIRSA9ICIiDQo+ICAgDQo+ICAg
IyBXaGF0IENNYWtlIGdlbmVyYXRvciB0byB1c2UuDQo+ICAgIyBUaGUgc3VwcG9ydGVkIG9wdGlv
bnMgYXJlICJVbml4IE1ha2VmaWxlcyIgb3IgIk5pbmphIi4NCj4gLU9FQ01BS0VfR0VORVJBVE9S
ID89ICJVbml4IE1ha2VmaWxlcyINCj4gK09FQ01BS0VfR0VORVJBVE9SID89ICJOaW5qYSINCj4g
ICANCj4gICBweXRob24oKSB7DQo+ICAgICAgIGdlbmVyYXRvciA9IGQuZ2V0VmFyKCJPRUNNQUtF
X0dFTkVSQVRPUiIpDQoNCkF3ZXNvbWUsIHRlc3RpbmcgaXQgbm93IQ0KDQpBbGVqYW5kcm8NCg==

