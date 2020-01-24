Return-Path: <chris.laplante@agilent.com>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	by mail.openembedded.org (Postfix) with ESMTP id 244747FD5F
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 16:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CfQ8L1ezWWUbXaEokNc76oUyOfv4Uubk9f9aEsfXrWDZ6XxiNLbQDhepuh68Tg+madh/Iyyw7QlV+AFMo7N0YFNQ9JhNQ4rHpKxS2oHfkqWgGZZg1CNbhC08IQm1BbSQ446yx155jbnHvUWJL3Z4pr5j0Ovij2/oiCW1rSKw3vvie1cI8VAEUyrrmZmruC5THYtX1h0C4sHR4ZjGfNt+XrJWbrrfUQXjQiS9yA7qWcK8MYGtfimlCIFKSPQ1uxSOjS8ENUPLM7RxvhNp01oagMd5g5fdqh4VKa5q+H9VITDaiJpbJt0M+C6W2srYfaL+6BuTy/qPlDpdSY0C3XCJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MXddLVDlPG7dgmpZWyug17WB/rwS+pr6TS2D4WokZzg=;
	b=GxiDNzd3e8bCfrdA2PxK+bmAbnKa5YGwrf4KC4NtKfzO4lliiiD/ZkwqiOyFN6l0bJ1TV7sq0Zf2yCf5mNtWRFf+6A7VXwUdO6ti3PZxsfw1pcxklEe9vi8uqxR79OnNNr7keaxUxjDbn4BKqpiV1AUWeFGOdWksMTpCZPK0Wi4CDLG8I1yWwdAO11KDYh/rlwg06gG7OMIru5x5HEsofnWgE/tpkqrj67JgfnVWjLOjZB4SiVFfJc0hfiPLuNDa9CWbCW7VpO2SZlE6rcoV+c2pulNXgLJOB6+rnQgfjdjTQNgUvqTWT0VteX0IDw+u3cXrZi+X+05WWAZIC+HV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MXddLVDlPG7dgmpZWyug17WB/rwS+pr6TS2D4WokZzg=;
	b=n6DHvuKwLYPgS4qKEVFJnMVfF92M+sX9J9i6GGPYer2D6l5zpwSMMRMqIl0g+437BwuLmmeQ2LNmr34s9z40zUJzrxMwEmHF7vrPTrJflWLArkabuohH+OYlo/MQ6WRlbkEAPRqK4qmMsOipwZffsvyVoZu3jqfqgUyIZgv/gmY=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1863.namprd12.prod.outlook.com (10.175.62.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.24; Fri, 24 Jan 2020 16:25:58 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::3c16:3c42:ee9f:b486%9]) with mapi id 15.20.2644.028;
	Fri, 24 Jan 2020 16:25:58 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Custom CLASSOVERRIDE and a "sub-sysroot" for JavaScript
Thread-Index: AdXSu2r5qh8vRNvQSy2wYaWkj47c6wADCyQAAAB32eAAAZZQgAAAoB+g
Date: Fri, 24 Jan 2020 16:25:58 +0000
Message-ID: <CY4PR12MB1653FB5B97BA8B92042EE63D8B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CY4PR12MB165355D4A69E257FD4AB30298B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<e2eb64a553a0b7bf89a942cdf9a1c177c5145aaf.camel@linuxfoundation.org>
	<CY4PR12MB1653D3CA9B953DF531F2FD7B8B0E0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<49070937ed7f0ea84d7a667abd88af4c3ae6b92b.camel@linuxfoundation.org>
In-Reply-To: <49070937ed7f0ea84d7a667abd88af4c3ae6b92b.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 854c45e6-547c-406c-fe11-08d7a0ea182b
x-ms-traffictypediagnostic: CY4PR12MB1863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1863C91DB9637C390806CCFC8B0E0@CY4PR12MB1863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(376002)(346002)(39860400002)(396003)(366004)(29502001)(199004)(189003)(107886003)(76116006)(66476007)(55016002)(66556008)(64756008)(478600001)(66946007)(186003)(7696005)(9686003)(66446008)(26005)(81166006)(6506007)(86362001)(52536014)(2906002)(71200400001)(33656002)(8936002)(5660300002)(8676002)(316002)(4326008)(110136005)(81156014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1863;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lVPQIZ268107eqJfw0NhRSSN8wkwePKuX8OLIAHcEPKAstEicm1jRX3Cfb00XMcqOxbGas+j0BPlDAlq5xUSIUaeGZSBkRbEbfS7rBmpTHrF9LGxeXc721BTWasKIBCheRneR5HpfDwY6zPaR3jTVfBh4rALYgqR0V9k+S8FyY74WqPPHjUIwdn/L5c2bilIP818EgMrchnzWixhtyv+5sXzBRGldwL+oYKQ3szbpneaMxcmlEpJSzBH7JjFuWMIOjUbtCJAzverGa5l/YCHYq4xq7AKxjdiyR2vw1Ck6US/lev1peYDVa7msudmzAk4551Ex0Wf5/Ovp+ZnBTRD9ukarpIdP3Bod5vRd7ukAs0FhwcB+HR/7Xkr72FlCYM6oLl0wgrEoKiUA9QvR2JBgGGt7lmnsdekYxyUS1gwZgyRikPjqWU1t6lEyqcqHz/HUPEXYEg6qwuwqzYptTPLSHCmDfR8rMP5G5JHa3Iaj0kdKKULyLqrw27tbbXmPQX/
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854c45e6-547c-406c-fe11-08d7a0ea182b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 16:25:58.3322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZHW5yQpkocAQzg5/BDKT8CT58tQJ0oEup7hD22HIKYOhDJIkSo6ZCFXpzKTvFThA15cYWmMjVnHWu20cD8GMBipK6t+DxN+eFHgQA3twLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1863
Cc: "dave_clouser@agilent.com" <dave_clouser@agilent.com>
Subject: Re: Custom CLASSOVERRIDE and a "sub-sysroot" for JavaScript
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
X-List-Received-Date: Fri, 24 Jan 2020 16:25:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IFRvIGJlIGhvbmVzdCwgSSdtIG5vdCBjb21wbGV0ZWx5IHN1cmUuIEkgYmFzZWQgdGhpcyBj
bGFzcyBvZmYgb2YNCj4gPiBuYXRpdmUuYmJjbGFzcyBhbmQgbmF0aXZlc2RrLmJiY2xhc3MgYW5k
IHRoZXkgYm90aCBkbyBpdC4gSSBoYXZlDQo+ID4gbGl0dGxlIGlkZWEgd2hhdCBzdGFtcC1leHRy
YS1pbmZvIGFjdHVhbGx5IGRvZXMuDQo+IA0KPiBNeSBzdWdnZXN0aW9uIGlzIG5vdCB0byBkbyB0
aGF0LiBuYXRpdmUgYW5kIHRvIGEgbGVzc2VyIGV4dGVudA0KPiBuYXRpdmVzZGsgYXJlICJzcGVj
aWFsIiBpbiB3YXlzIHlvdXIgY2xhc3MgKGJlaW5nIHRhcmdldCByZWxhdGVkKQ0KPiBpc24ndC4N
Cj4gDQo+IEJhc2ljYWxseSB0aGlzIGNvZGUgaXMgaG93IHdlIHdlcmUgYWJsZSB0byBtYWludGFp
biBhIHN5c3Jvb3QgcGVyDQo+IG1hY2hpbmUgYW5kIHBrZ2RhdGEgcGVyIG1hY2hpbmUuDQo+IA0K
PiBUaGUgc3lzcm9vdCBwZXIgbWFjaGluZSBpcyBkZWFkIHdpdGggcmVjaXBlIHNwZWNpZmljIHN5
c3Jvb3RzIGJ1dCB0b2RheQ0KPiB3ZSBzdGlsbCBoYXZlIHBrZ2RhdGEgc2hhcmVkIHBlciBtYWNo
aW5lOg0KPiANCj4gbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzczpkb19wYWNrYWdlZGF0YVtz
dGFtcC1leHRyYS1pbmZvXSA9ICIke01BQ0hJTkVfQVJDSH0iDQo+IA0KPiB3aGljaCBtZWFucyB0
aGUgcGFja2FnZWRhdGEgdGFzayB3aWxsIHJlcnVuIHBlciBtYWNoaW5lLg0KPiANCj4gVGhlIG5h
dGl2ZXNkayBzdGFtcHMgb25seSBuZWVkIHRvIGNoYW5nZSBwZXIgU0RLTUFDSElORSB0YXJnZXQg
KHdoaWNoDQo+IGNoYW5nZXMgU0RLX0FSQ0ggc28gd2UncmUgZmluZSB0aGVyZSkuDQo+IA0KPiBJ
J2xsIHRyeSBhbmQgcmVtZW1iZXIgdG8gcXVldWUgYSBjbGVhbnVwIGZvciBzb21lIGJpdHMgb2Yg
dGhpcyBhcyB0aGVyZQ0KPiBpcyBhIHRpbnkgYml0IG9mIGRlYWQgYnV0IGhhcm1sZXNzIGNvZGUu
DQo+IA0KPiBJdHMgaW4gbXkgcXVldWUgdG8gdGhpbmsgYWJvdXQgbWFraW5nIHBrZ2RhdGEgaW4g
V09SS0RJUiB0aGVuIHdlIGNvdWxkDQo+IGRpdGNoIHRoaXMgd2hvbGUgdGhpbmcuDQoNCkhtbSwg
cmVtb3ZpbmcgdGhlIHN0YW1wLWV4dHJhLWluZm8gbGluZXMgbGVhdmVzIG1lIHdpdGggZXJyb3Jz
IGxpa2UgdGhlc2U6DQoNCkVSUk9SOiBtYzptYy1uYW1lOmxpYnJhcnktZW1zY3JpcHRlbi0xLjAr
Z2l0QVVUT0lOQythYjZkMzBjMTBjLXIwIGRvX3BhY2thZ2VkYXRhX3NldHNjZW5lOiBUaGUgcmVj
aXBlIGxpYnJhcnktZW1zY3JpcHRlbiBpcyB0cnlpbmcgdG8gaW5zdGFsbCBmaWxlcyBpbnRvIGEg
c2hhcmVkIGFyZWEgd2hlbiB0aG9zZSBmaWxlcyBhbHJlYWR5IGV4aXN0LiBUaG9zZSBmaWxlcyBh
bmQgdGhlaXIgbWFuaWZlc3QgbG9jYXRpb24gYXJlOg0KICAvaG9tZS9sYXBsYW50ZS95b2N0by9i
dWlsZC90bXAtbWMtbWMtbmFtZS9wa2dkYXRhL21hY2gvbGlicmFyeS1lbXNjcmlwdGVuDQogICAg
KG1hdGNoZWQgaW4gbWFuaWZlc3QtY29ydGV4YTl0MmhmLW5lb24tbGlicmFyeS1lbXNjcmlwdGVu
LnBhY2thZ2VkYXRhKQ0KICAvaG9tZS9sYXBsYW50ZS95b2N0by9idWlsZC90bXAtbWMtbWMtbmFt
ZS9wa2dkYXRhL21hY2gvcnVudGltZS9saWJyYXJ5LWVtc2NyaXB0ZW4tc3RhdGljZGV2DQogICAg
KG1hdGNoZWQgaW4gbWFuaWZlc3QtY29ydGV4YTl0MmhmLW5lb24tbGlicmFyeS1lbXNjcmlwdGVu
LnBhY2thZ2VkYXRhKQ0KICAvaG9tZS9sYXBsYW50ZS95b2N0by9idWlsZC90bXAtbWMtbWMtbmFt
ZS9wa2dkYXRhL21hY2gvcnVudGltZS9saWJyYXJ5LWVtc2NyaXB0ZW4tZGV2DQogICAgKG1hdGNo
ZWQgaW4gbWFuaWZlc3QtY29ydGV4YTl0MmhmLW5lb24tbGlicmFyeS1lbXNjcmlwdGVuLnBhY2th
Z2VkYXRhKQ0KLi4uDQoNClRoYXQgbWlnaHQgYmUgd2h5IEkgYWRkZWQgdGhlIHN0YW1wLWV4dHJh
LWluZm8gbGluZXMgaW4gdGhlIGZpcnN0IHBsYWNlIC0gYXMgYSBiYW5kYWlkIHRvIGZpeCB0aGlz
IDovLg0KDQpDaHJpcw0K

