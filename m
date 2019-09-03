Return-Path: <alban.bedel@aerq.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140098.outbound.protection.outlook.com [40.107.14.98])
	by mail.openembedded.org (Postfix) with ESMTP id 132067F343
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 09:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ClufAarJf3JhRYIEL2/q7jQfyIvSRlRqhu06Ma3BgfD1aun2fiZ/RBt/jQRIIymiKzKyLGcNmI7jPVWw7gy3OZL2KMp96PhocICJAAFnPFNd0vAnfuTOkZBYtdZLnmwhUglOVzXz9BCc0O3eHB/lRXLBLyESGHQBPre7jdyFTuiAxDstPAxmFKe2fME/ZtStpezi8P6RvzT56ndIQgP8BteoWbiYifG4HGtIlF+vLlWbWP5um+c+sdZRpK/KOY7FGXjLyPCz+QYGGBeIdgwKaKc9v6zmKz8w/baLjuF1RTQXZF/3+C2VMsLRQ62drWFExjMHufp6joAuvA5irn/SLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rI4ku+SmLpGpkboOsT8ZIgpuTN534qGSOulKhsdv2xg=;
	b=bO0rT3F7LTTAd782GOxs7s1YnQZ6adOEY8suK+Z3+LZt4+paPGGDjxFIaK4Vu/JLem0fOCJEJSeBFFi+D5OrbT90W5yQUKN/hB2pA9Ty3PVkfl+M3Pu4+fNfneTutbwV0IDHOoFmDXGwgwRcYJIOmFqKDKwqVHryykJDzgor2IaWovPwtt2/8HJo1oa7x9ZL1eWT+YGT0xgCH1tDTyy2WZPqeuhdjd4nZ8tYWPsNKjmOW88n+G1EKGp45ljcOZdgIge440JabF9wPiB8E/00Yjm3jIZCHNpzXf+KEcrqKtjmJFbutDtIWvxy9ce1Ktq4Ndg773Zo4Sv27yN8Nj/avA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rI4ku+SmLpGpkboOsT8ZIgpuTN534qGSOulKhsdv2xg=;
	b=qMmKMGD2b+3NqeC08s/zr09R4N7RXeOE4hC0kKitbTrxBMURaa1UxZi7N7LbueIBdIf5sQBjUfTfvqVWCoSNj1AQvUx+6XxCVHR101Rky/7xnQreqltJJAaT1EK4VAUXZoUI72ONyGG1KlQ7tA0ZXZJ57jHtkIMycPHxXtzlbRg=
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM (52.134.115.151) by
	AM6PR10MB2934.EURPRD10.PROD.OUTLOOK.COM (10.255.123.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2220.18; Tue, 3 Sep 2019 09:41:32 +0000
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8]) by
	AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8%3]) with mapi id 15.20.2220.022;
	Tue, 3 Sep 2019 09:41:32 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [warrior][PATCH] kernel-uboot: compress arm64 kernels
Thread-Index: AQHVR6defzhnBU0AEUmRfvXMV9SCuKcZ6DmA
Date: Tue, 3 Sep 2019 09:41:32 +0000
Message-ID: <2306529da2e15035d6070ab9ba109dca6718e127.camel@aerq.com>
References: <20190731135317.20174-1-alban.bedel@aerq.com>
In-Reply-To: <20190731135317.20174-1-alban.bedel@aerq.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 355f8e40-3db1-4eae-f3a4-08d73052e7b4
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM6PR10MB2934; 
x-ms-traffictypediagnostic: AM6PR10MB2934:
x-microsoft-antispam-prvs: <AM6PR10MB2934855BA888EB783CBA676096B90@AM6PR10MB2934.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39840400004)(396003)(366004)(136003)(376002)(199004)(189003)(66066001)(8676002)(305945005)(66476007)(66556008)(66946007)(229853002)(64756008)(66446008)(91956017)(76116006)(256004)(76176011)(14444005)(5660300002)(7736002)(2501003)(2351001)(3846002)(6116002)(81166006)(81156014)(6916009)(316002)(118296001)(8936002)(14454004)(6436002)(102836004)(55236004)(36756003)(6506007)(446003)(11346002)(2616005)(71200400001)(508600001)(26005)(186003)(2906002)(6486002)(5640700003)(86362001)(4744005)(6512007)(25786009)(476003)(486006)(71190400001)(53936002)(6246003)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR10MB2934;
	H:AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r7nElmnXEDva62pJsu/umgV14uOgp1+xSiMHEneqObzx/QR0iJcy6Cb9SHnU8/xl7d0Vtskyxywb/9WXCGwN3gZfuXXGolrfgvf178IFra3EvMJ1DbceeiAT+yG0loTbLfpCIxcxfjROYrwzWVw5dB/Tmf/IQpSBpNSVaQdiEL8DZiMcoDcxU3frpHZP9V/kqvW6ToomJpCfIC++EDlh5jdFpkfbE5U1YuNeMcq7piFwrL5hIDQ64G9mOtrTOQXKcAe8ENVQTNp3cWKlBG40yne6LeXKuhtbf9Qk0y7dPIKTIxT0YtCScEbW7j7gy0K/o0F7AXrdCHKSGPNpZNoEObRedFUlPyqLebVIkR37g210mEKEk9q6s70CBPMMg0iNDZG9v1D7mIfoNZHP4QhkDiI1eecDCECfRZzxwtonbhA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355f8e40-3db1-4eae-f3a4-08d73052e7b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 09:41:32.8062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: notZvXj8mYYFZOhVc0MYGUeeoJG2EEFiHpwRBhlOpsgk5oBsUzvrX3RU3n2seA/8yojyuJdq9NIyKqk/BVO+Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2934
Subject: Re: [warrior][PATCH] kernel-uboot: compress arm64 kernels
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
X-List-Received-Date: Tue, 03 Sep 2019 09:41:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FC95311FD7E5E48B179AF97EEA47B91@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTA3LTMxIGF0IDEzOjUzICswMDAwLCBCZWRlbCwgQWxiYW4gd3JvdGU6DQo+
IEFBcmNoNjQgaW1hZ2VzIGFyZSBub3Qgc2VsZi1kZWNvbXByZXNzaW5nLCB0aHVzIHVzdWFsbHkg
bXVjaCBsYXJnZXIuDQo+IEJvb3QgdGltZXMgY2FuIGJlIHJlZHVjZWQgYnkgY29tcHJlc3Npbmcg
dGhlbSBpbiBGSVQgYW5kIHVJbWFnZXMuDQo+IA0KPiBUaGlzIGNvbW1pdCBpcyBhIGJhY2twb3J0
IG9mIGNvbW1pdCBhNzI1ZDE4OGI1IChrZXJuZWwtdWJvb3Q6DQo+IGNvbXByZXNzDQo+IGFybTY0
IGtlcm5lbHMpIGFuZCBjb21taXQgNjBiYzdlMTgwZSAoa2VybmVsLXVib290OiByZW1vdmUgdXNl
bGVzcw0KPiBzcGVjaWFsIGNhc2luZyBvZiBhcm02NCBJbWFnZSkgZnJvbSBtYXN0ZXIuIEJvdGgg
Y29tbWl0IHdlcmUgbWVsdGVkDQo+IGludG8gb25lIHRvIGF2b2lkIHNvbWUgdXNlbGVzcyBjaHVy
bi4NCg0KV2FzIHRoaXMgcGF0Y2ggb3Zlcmxvb2tlZCwgb3IgaXMgdGhlcmUgYSByZWFzb24gaXQg
aXMgbm90IGNvbnNpZGVyZWQgaW4NCnRoZSBuZXh0IHJvdW5kIG9mIHVwZGF0ZSBmb3Igd2Fycmlv
cj8gV2l0aG91dCB0aGlzIHBhdGNoIGtlcm5lbCBpbWFnZXMNCmFyZSB0b28gbGFyZ2UgdG8gZml0
IGluIHRoZSBmbGFzaCBvZiB0aGUgc3lzdGVtIEknbSB1c2luZy4gRnVydGhlcm1vcmUNCml0IGlz
IG5vdCB0cml2aWFsIHRvIGZpeCB0aGlzIGluIG15IG93biBsYXllci4NCg0KQWxiYW4NCg0K

