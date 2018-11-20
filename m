Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 128554 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Nov 2018 21:39:09 UTC
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
	by mail.openembedded.org (Postfix) with ESMTP id 81C926C496
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 21:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HnlRLbl1ar1SyDcQwq15jhGMtwhbSbyW7sk7deJLPA0=;
	b=oCWQtx3aiST12UNv0VKU4/h5PDsk22PaWPAaQgZ+jRk4njpfa3PHLbTsmUg+hQ9hk4IQI4NaxskzuNd+BG43/rok//qrkKgkklt4hLarhKwd/mv43MJn057sismbVA1xU0/+5u0UcUbdvzS742MsgoLtRy6rTYX+sM8k8Vc2DN8=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4026.eurprd04.prod.outlook.com (52.134.107.27) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.26; Tue, 20 Nov 2018 08:07:39 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::891a:cab2:b71c:5651]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::891a:cab2:b71c:5651%2]) with mapi id 15.20.1339.021;
	Tue, 20 Nov 2018 08:07:39 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "C.r. Guo" <chunrong.guo@nxp.com>
Thread-Topic: [[thud][PATCH] meta/classes/qemu.bbclass: set -cpu of e500v2 to
	e500mc
Thread-Index: AQHUfJSDnNdjKAqGEEqowRAjXocPOqVYVqZg
Date: Tue, 20 Nov 2018 08:07:38 +0000
Message-ID: <DB7PR04MB5068BF3F3037E38315AF500284D90@DB7PR04MB5068.eurprd04.prod.outlook.com>
References: <1542253004-1490-1-git-send-email-chunrong.guo@nxp.com>
In-Reply-To: <1542253004-1490-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR04MB4026;
	6:i123Yml3pHRmSJv3nTQ1b3RnDnh2DJLkQQ+ehv2omOW95Fjdv9L68T8ZdZGAfpM+7ou+rSlXU6E6RwnmfMxWF7vPcojYMvrio0yt8/nQJedNY0ksMPx0AdIWu30b1pplTS3qwfPhewzEqFCJ4JjfQfKXt0Y2/tboR4hoDe4jgLNUzaxY+OtO9u20Q8Jm7BLCK7M1klqfz/N2W2Mop7JcxR1oumwMRZtRlkzq8AU7GJBmr32vQcXw+dpQyARCXPDyfBi2pHWS3DVh99lk1Q0mBT64xSCexR3JMJFIWGmph/w9lqt0QvJj3+oKTYSGeoim9eYhIF4pkFJAwWzzOHFiwb2uON4Qrk4WdocfJ/pSaHn0I5P1aKyA8b/GnkSqdLWquORKafOpgA6vUnn83NOFWQ7Rk4ZWzJdW+ta69F+c9pV9/rLg1yVxUuTBN/euvmNyEJPcZEet8UI+Rq2wzQt2yw==;
	5:kzflrxx8ts5pvZLGnBy5Z+CWtS72ngq5lBVnh09Xs6de9BzQv7C5+Vye6msS0fJyOHi61P63HOywlFGXEDrJAU5YKS0cgyPuZ9qyw5ifKUWw3Q+JvjadjKkCUNHU9zBYWtzr0nyKTQxM5eD0G2sXjx6ZfCrzZGNOC6RMl3l3z2U=;
	7:11pFekL0Ma2L02zrkRjKWlxtCq7J7ri/8ipVrNSMsoFAXNnW+8p/sNdOVp5cBETK2Me8I8XNL/ylMotTZ7NrofSP1gRYH3OeECaXy3diLzXTrxzXqbI57JM4sPjO0OUScq8WPcd5bTGZiEVovDZzUA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: c003feff-db08-4e9a-5787-08d64ebf3d1c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4026; 
x-ms-traffictypediagnostic: DB7PR04MB4026:
x-microsoft-antispam-prvs: <DB7PR04MB40268E2E4A26A8D74730717784D90@DB7PR04MB4026.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231442)(944501410)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DB7PR04MB4026; BCL:0; PCL:0; RULEID:; SRVR:DB7PR04MB4026; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(39860400002)(376002)(366004)(346002)(13464003)(189003)(199004)(26005)(2906002)(102836004)(3846002)(6116002)(66066001)(7736002)(6200100001)(74316002)(6436002)(305945005)(186003)(55016002)(9686003)(33656002)(6246003)(76176011)(53936002)(97736004)(6506007)(81166006)(81156014)(8936002)(8676002)(14454004)(25786009)(256004)(14444005)(478600001)(2900100001)(71190400001)(71200400001)(476003)(486006)(11346002)(446003)(5660300001)(106356001)(229853002)(4326008)(68736007)(7696005)(105586002)(316002)(86362001)(99286004)(6862004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4026;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: /yRblO7VEC8xDjG9Lr0qob8s1Vumzpm/kqYExWBtC5naHA5Cmk8HA8SBnFUdCzpYP+xnhd8quTiCarjQr8Loq+C9Y62SfV43NfAt8fjbFpGefxyQpnQS7IzuVm9O6dcQROy7gtkMGilcEEidGuob7jDiAlvpTr4Y63oYA3INHEnlWF43YL8puWV5MEwM/H2vPXtLXNC0Q84gXN+T9r3lWB49fBkSxda43TfO0Ez7sIGUD19O3zgo2b4WMrzVP4RqibJpvUusNL/J5t82O5rpW16rGK2LVDmc1gqiDUWg9g5BJw+bQuejseyMOb5XNdWMOcWfXBare/YlDW5tnmbVC1jvQtwdAf4fdTd3UhBUD3w=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c003feff-db08-4e9a-5787-08d64ebf3d1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 08:07:38.9866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4026
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [[thud][PATCH] meta/classes/qemu.bbclass: set -cpu of e500v2 to e500mc
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
X-List-Received-Date: Tue, 20 Nov 2018 21:39:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8gLCANClBsZWFzZSBhcHBseSB0aGlzIHBhdGNoIGluIHRodWQgYnJhbmNoIC4NCk5vdyBi
dWlsZCBnY2MgZmFpbGVkIGZvciBlNTAwdjIgDQoNCg0KVGhhbmtzDQpDaHVucm9uZw0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQy5yLiBHdW8gDQpTZW50OiAyMDE4xOoxMdTC
MTXI1SAxMTozNw0KQ2M6IEMuci4gR3VvIDxjaHVucm9uZy5ndW9AbnhwLmNvbT4NClN1YmplY3Q6
IFtbdGh1ZF1bUEFUQ0hdIG1ldGEvY2xhc3Nlcy9xZW11LmJiY2xhc3M6IHNldCAtY3B1IG9mIGU1
MDB2MiB0byBlNTAwbWMNCg0KRnJvbTogQ2h1bnJvbmcgR3VvIDxjaHVucm9uZy5ndW9AbnhwLmNv
bT4NCg0KKmZpeCB0aGUgYmVsb3cgZXJyb3INCnxUaGUgcG9zdGluc3RhbGwgaW50ZXJjZXB0IGhv
b2sgJ3VwZGF0ZV9mb250X2NhY2hlJyBmYWlsZWQNCnxxZW11OiB1bmNhdWdodCB0YXJnZXQgc2ln
bmFsIDQgKElsbGVnYWwgaW5zdHJ1Y3Rpb24pIC0gY29yZSBkdW1wZWQNCg0KVGhpcyB3b3JrYXJv
dW5kIHdpbGwgbmVlZCB0byBiZSByZXZlcnRlZCBvbmNlIHRoZSBwcm9wZXIgZml4IGlzIGZvdW5k
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBDaHVucm9uZyBHdW8gPGNodW5yb25nLmd1b0BueHAuY29tPg0K
LS0tDQogbWV0YS9jbGFzc2VzL3FlbXUuYmJjbGFzcyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nl
cy9xZW11LmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvcWVtdS5iYmNsYXNzIGluZGV4IGY1YzU3ODAu
LmU4NTQ1ZjEgMTAwNjQ0DQotLS0gYS9tZXRhL2NsYXNzZXMvcWVtdS5iYmNsYXNzDQorKysgYi9t
ZXRhL2NsYXNzZXMvcWVtdS5iYmNsYXNzDQpAQCAtNTUsNyArNTUsNyBAQCBkZWYgcWVtdV9ydW5f
YmluYXJ5KGRhdGEsIHJvb3Rmc19wYXRoLCBiaW5hcnkpOg0KIFFFTVVfT1BUSU9OUyA9ICItciAk
e09MREVTVF9LRVJORUx9ICR7QGQuZ2V0VmFyKCJRRU1VX0VYVFJBT1BUSU9OU18lcyIgJSBkLmdl
dFZhcignUEFDS0FHRV9BUkNIJykpIG9yICIifSINCiBRRU1VX09QVElPTlNbdmFyZGVwc10gKz0g
IlFFTVVfRVhUUkFPUFRJT05TXyR7UEFDS0FHRV9BUkNIfSINCiANCi1RRU1VX0VYVFJBT1BUSU9O
U19wcGNlNTAwdjIgPSAiIC1jcHUgZTUwMHYyIg0KK1FFTVVfRVhUUkFPUFRJT05TX3BwY2U1MDB2
MiA9ICIgLWNwdSBlNTAwbWMiDQogUUVNVV9FWFRSQU9QVElPTlNfcHBjZTUwMG1jID0gIiAtY3B1
IGU1MDBtYyINCiBRRU1VX0VYVFJBT1BUSU9OU19wcGNlNTUwMCA9ICIgLWNwdSBlNTAwbWMiDQog
UUVNVV9FWFRSQU9QVElPTlNfcHBjNjRlNTUwMCA9ICIgLWNwdSBlNTAwbWMiDQotLQ0KMi43LjQN
Cg0K

