Return-Path: <Alexandre.Bard@netmodule.com>
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
	(mail-zr0che01on2132.outbound.protection.outlook.com [40.107.24.132])
	by mail.openembedded.org (Postfix) with ESMTP id F23BF7FC8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 12:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=iGqqVTfynkIp5pwiKGPq0aqeSyu6IKk15nzmtVh5P+WWXZ5iYUry/vb6yhM+Tm6zwhh2p+sOtTpN3Jk/VetjZzkEecdfpu/JotipPpUp9wPSz4gnW9oWnABJ+9agq8c7xWLvJNgAMJSEOISTwwEtFuYZCBMFCsxIhteq3MH6hyhAf5hTXFsbmsMpmNFc7RM5C7lA0aTIbnJqOHVk2/uYXdJ05EVtGUudrlC5qjIiroNcbGMEXE/FyQlP44dcPvZ4gENPzycidNFq8TZZvEJ1lwEp/BJjaAW4FGb3MJUEpfmXVK3ksm8YtYt/feqkG0RsXpLHJ2MAHliz50nxiMIs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1VDUF+0R4yivoutpj4yFEF26UxDkBt1m8d1d2F5o2pw=;
	b=FF2jXjWkYVGJI2o4YX11IQQfDhqgmcYa4gIBQKEQz/oVpLtIH0WMnrvyN7zODxJFsMUcDfUIK1XUIpOyQsa43LvlnEd+KUJR6B1LLJnjsLmS958bT5uUx22LPqXXD5L0SRY/gY/ZyQR7aMb0tzZPW5LvbPPyXNrpquRkp3AideYlSWeMZT2lUPMg6qG1tuM5445cNQRkzVSj6MV1TBCPeBS6BbFhP/FtHe9LcZYwgwb3BSAEHTZkMdIHjlfb5ZcZYsmDd9DQYXzO7Hyx27samFiGXgcbSEY7qGIm1YZ+RElbXmYUjjVRWyx/wze8uEurGhMEe93v9v5OmzeCEfFgvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=netmodule.com; dmarc=pass action=none
	header.from=netmodule.com; dkim=pass header.d=netmodule.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netmodule.onmicrosoft.com; s=selector2-netmodule-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1VDUF+0R4yivoutpj4yFEF26UxDkBt1m8d1d2F5o2pw=;
	b=NeRdNx9ZM3wMAtgRlJdGXfyE1dhBdWnwWENi1Fyo3ebv50l6kOziV9bMZqyrU/Ffia6cdVhKNG77kbR5l4i/Y/TMZfU+RzhkhdnfLX4VK5vPOQLGAmU2KcYcj3O/J4GNnWxdr/SiWhUGkazZXI1LK8M0YSCXy35isajpTS8d5K0=
Received: from GV0P278MB0115.CHEP278.PROD.OUTLOOK.COM (10.186.181.139) by
	GV0P278MB0081.CHEP278.PROD.OUTLOOK.COM (10.186.181.200) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.19; Wed, 22 Jan 2020 12:41:19 +0000
Received: from GV0P278MB0115.CHEP278.PROD.OUTLOOK.COM
	([fe80::3dbf:aedf:35e7:c16f]) by GV0P278MB0115.CHEP278.PROD.OUTLOOK.COM
	([fe80::3dbf:aedf:35e7:c16f%6]) with mapi id 15.20.2644.027;
	Wed, 22 Jan 2020 12:41:19 +0000
Received: from [192.168.43.109] (194.230.158.180) by
	PR0P264CA0108.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20
	via Frontend Transport; Wed, 22 Jan 2020 12:41:19 +0000
From: Alexandre Bard <Alexandre.Bard@netmodule.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: License not found when building for different architectures
Thread-Index: AQHV0SE+PGhXVhDbhUm+P0bh9Z2iyg==
Date: Wed, 22 Jan 2020 12:41:19 +0000
Message-ID: <30d21dc4-8cc4-9fae-ff2f-37b5a4912cf7@netmodule.com>
Accept-Language: fr-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0108.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:19::24) To GV0P278MB0115.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:710:1d::11)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alexandre.Bard@netmodule.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [194.230.158.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1133aac9-1fec-490d-18df-08d79f38614b
x-ms-traffictypediagnostic: GV0P278MB0081:
x-microsoft-antispam-prvs: <GV0P278MB0081D5B5A00DD8C1341876ED870C0@GV0P278MB0081.CHEP278.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39840400004)(136003)(376002)(346002)(396003)(189003)(199004)(31686004)(186003)(16526019)(6486002)(508600001)(16576012)(316002)(66446008)(66476007)(66556008)(64756008)(66946007)(6916009)(71200400001)(36756003)(5660300002)(86362001)(31696002)(81156014)(8676002)(8936002)(81166006)(2906002)(52116002)(44832011)(2616005)(26005)(956004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:GV0P278MB0081;
	H:GV0P278MB0115.CHEP278.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: netmodule.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cvH2Dnt5GRf+21ue/iE0+7cteH24UkCwORrkgs9qRVCEtq07aGQ5/+G3Eopt3py+jp8x40PluWj72MyOiNuYCXRhGes/Fv3+dlMAI0+4JmSYBDMCamVBkCPYWT/OV7c/TXai4jzs43a4+w3a7MjKX2l4C7qse+o8VtFMBvY5oUN/prKAtKbomFSaS59RZKTbF+1jkYWXTpyqr39ZEGdIQvgfgsMta4LgMEyQsrrN2IWAZUvJIeSZZjoGhkpC+OrdqO02oKwTsqQD8S2nXylYn6dRRJbKvORWUg5/nX3qOW6v4EkAAiHH1Pa3nyXhs/jeBjXld5/lXREFX6Z+vwFSy0lOp5e9zcOQKd7dKPvgXELjR2YOSs374MsAtA8ehnVVf1B05n6HIKP0BwIvk4t9QMzoTCnYG9pT3LyEC9Tzt1uEvmLLZ84t6xjlWDBrPbXd
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: netmodule.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1133aac9-1fec-490d-18df-08d79f38614b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 12:41:19.6526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcdfa962-340b-405e-be0c-5bfcc8a0841e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jagZr3qCb2J3L9FQPIYHs3INlknhmPBJY13pmMjAg1EXi+Mq1lvZVOhZVKKFOKaZq6Ak5ZmLekpAIR4fjeQbfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0081
Subject: License not found when building for different architectures
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
X-List-Received-Date: Wed, 22 Jan 2020 12:41:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C73B458D81E48E45840242C29225A57F@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SGkgdGhlcmUsDQoNCkkgZW5jb3VudGVyZWQgYSBwcm9ibGVtIHVzaW5nIGJpdGJha2UgZm9yIGRp
ZmZlcmVudCBhcmNoaXRlY3R1cmVzIGFuZCBidWlsZGluZyBhbiBpbWFnZSB3aXRoIHRoZSBsaWNl
bnNlczoNCg0KbG9jYWwuY29uZjoNCiDCoENPUFlfTElDX01BTklGRVNUID0gIjEiDQogIENPUFlf
TElDX0RJUlMgPSAiMSINCiAgTElDRU5TRV9DUkVBVEVfUEFDS0FHRSA9ICIxIg0KDQpUaGUgcHJv
YmxlbSBhcHBlYXJzIGluIHdhcnJpb3IgYW5kIGNhbiBiZSByZXByb2R1Y2VkIHdpdGggdGhlIGZv
bGxvd2luZyBzdGVwczoNCg0KMS4gQnVpbGQgYSBmdWxsIGltYWdlIHdpdGggbGljZW5zZSBmb3Ig
YXJjaGl0ZWN0dXJlIEENCjIuIEJ1aWxkIHRoZSBzYW1lIGltYWdlIGZvciBhcmNoaXRlY3R1cmUg
Qg0KMy4gV2l0aCBhcmNoaXRlY3R1cmUgQSBlbnZpcm9ubmVtZW50LCBjbGVhbmFsbCBwYWNrYWdl
IFggdGhhdCB3YXMgcGFja2VkIGluIHRoZSBpbWFnZQ0KNC4gQnVpbGQgYWdhaW4gZnVsbCBpbWFn
ZSBmb3IgYXJjaGl0ZWN0dXJlIEINCg0KQXQgc3RlcHMgMSBhbmQgMiwgdGhlIGRpcmVjdG9yeSBi
dWlsZC90bXAvZGVwbG95L2xpY2Vuc2VzIGlzIHBvcHVsYXRlZCB3aXRoIHRoZSBwcm9wZXIgbGlj
ZW5zZXMgKGJ1dCBvbmx5IG9uY2UpLg0KQXQgc3RlcCAzLCB0aGUgbGljZW5zZSBvZiB0aGUgcGFj
a2FnZSBYIGlzIHJlbW92ZWQgZnJvbSB0aGUgZGVwbG95IGRpcmVjdG9yeS4NCkF0IHN0ZXAgNCwg
dGhlIHNzdGF0ZSBvZiB0aGUgcGFja2FnZSBYIHNheXMgdGhlcmUgaXMgbm90aGluZyB0byBkbywg
YnV0IHdoZW4gdGhlIHJvb3RmcyBpcyBjcmVhdGVkLCB0aGUgbGljZW5zZSBpcyBtaXNzaW5nLg0K
DQpEb2VzIGFueWJvZHkga25vd3MgYWJvdXQgdGhpcyBwcm9ibGVtIGFuZCBoYXZlIGEgc29sdXRp
b24gPw0KVGhlIG9ubHkgdGhpbmcgSSBjb3VsZCBkbyBub3cgaXMgdG8gcHV0IHRoZSBsaWNlbnNl
cyBpbiAiJHtERVBMT1lfRElSfS9saWNlbnNlcy8ke1BBQ0tBR0VfQVJDSH0iDQpBbmQgY2hhbmdl
IHRoZSBjb2RlIGluIGxpY2Vuc2VfaW1hZ2UgdG8gY2hlY2sgc3ViZGlyZWN0b3JpZXMgaW4gJHtE
RVBMT1lfRElSfS9saWNlbnNlcyBpbiBvcmRlciB0byByZXRyaWV2ZSB0aGUgbGljZW5zZXMuDQoN
CkJlc3QgcmVnYXJkcywNCkFsZXhhbmRyZSBCYXJkDQoNCg0KDQo=

