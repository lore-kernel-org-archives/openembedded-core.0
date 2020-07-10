Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web12.786.1594420150461652306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 15:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=I3I0mky3;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2292; q=dns/txt; s=iport;
  t=1594420150; x=1595629750;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qkfKnJJC3nVAHgNzNc/jwS/gWrZ3wLfA9MgZo2TM2LE=;
  b=I3I0mky3YWGvps1WMajwQIqYPpa9QXoDGEhJJln3C4KNXfmBhYZqCQro
   9ro23/Sp1ugUof1BcOgeo/82Nji1BlHv4YNAHsmR2oYqdXs5bgWJk7cLI
   qiNVbXqLiwNNAVpB85eoqjG+sbH3Wzoo5JnndHAiPD3Or/4PUEMf4T8ZB
   0=;
X-IPAS-Result: =?us-ascii?q?A0AsAABG6whf/4wNJK1gGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE5AgEBAQELAYFRUQdvWC8shDODRgONT5hdglMDVQsBAQEMA?=
 =?us-ascii?q?QElCAIEAQGETQIXgX8CJDcGDgIDAQEBAwIDAQEBAQUBAQECAQYEbYVbAQuFc?=
 =?us-ascii?q?AEBAQMSEREMAQE3AQ8CAQgYAgImAgICMBUQAgQOBSKDBYJLAy4BDp5gAoE5i?=
 =?us-ascii?q?GF2gTKDAQEBBYUrGIIOAwYUeioBgmmDVIRwgUMagUE/hCE+glwCAoF0gn+CY?=
 =?us-ascii?q?I8igmE9iVmZAgqCXYhPhjCKViCfJpFkih+UUAIEAgQFAg4BAQWBaSSBQg4Hc?=
 =?us-ascii?q?BU7gmlQFwINjh6DcYpWdDcCBggBAQMJfI56AQE?=
IronPort-PHdr: =?us-ascii?q?9a23=3Aeg3fHhONEY0jRLAzAUYl6mtXPHoupqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOG58o//OFDEvKwx3lDMVITfrflDjrmev6PhXDkG5pCM+DAHfYdXXh?=
 =?us-ascii?q?AIwcMRg0Q7AcGDBEG6SZyibyEzEMlYElMw+Xa9PBtaHc//YxvZpXjhpTIXEw?=
 =?us-ascii?q?/0YAxyIOm9E4XOjsOxgua1/ZCbYwhBiDenJ71oKxDjpgTKvc5Qioxneas=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.75,336,1589241600"; 
   d="scan'208";a="502187940"
Received: from alln-core-7.cisco.com ([173.36.13.140])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Jul 2020 22:29:09 +0000
Received: from XCH-RCD-001.cisco.com (xch-rcd-001.cisco.com [173.37.102.11])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 06AMT9sV009083
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 10 Jul 2020 22:29:09 GMT
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by XCH-RCD-001.cisco.com
 (173.37.102.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 17:29:08 -0500
Received: from xhs-aln-002.cisco.com (173.37.135.119) by xhs-rtp-002.cisco.com
 (64.101.210.229) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 18:29:08 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-002.cisco.com (173.37.135.119) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 10 Jul 2020 17:29:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URX8MY79tUAMWnPo+Cl2LiLNkKOZRgQD2HMpDsnsZXX+qeAew09XU4m45ouvdWlhrYS5vSkl4hH/Wqr84FTfdfFNa53rJfUaBoJLUUxdHRMmPOZ6kN67NfWfoCRBu/v1q47hQaE38juVJaj317Dkuh932RngZDFOeFm9e6rpRpcVqSx5+++6ilSzVVlL/SXGIB3IsX31fzW9nm6FQooZmEg/D0y3QZ6P8+LvG/9C/8mIaSz83nGHQOCqC7mw/6/AVhe7BIefFgmn28QBDJNRgEoSjjyVAbHNKu4afsumuGW9DB4MrRD6b29UNFUOVLm+YHgJtMlasM8jWUvEEW/cFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkfKnJJC3nVAHgNzNc/jwS/gWrZ3wLfA9MgZo2TM2LE=;
 b=U1lOfrPyQszG6jO3tgX7ZFpyB18ucIZ1JlI9EgqHW/TRHMjMDLHIYs0x+tIwzbOOPsewCdv54W7338ZT/MGK3X6005GJZOrIgHK7yrRaPA3YqPtqIiTyvpP8NhEEA20VPdx0u79mhYUwuaIpE0gCautjMyz2QwLQvmQsp2fTwpKKMOYgs9rqxSwbpaIXLYSIQC/gaCSxMi8Ki9TL18G7zNVTjnMH4GZNabMWbmIC8GyiqaxMlHikbBb8oCgOQsgHSHdbGdZsrFtrPrOzxxpyO2qwL+CI3tfpMlLaCPDr62erZDbhvhUuAbT6OFL9Kp2ei8nsulEr81gtus3j3dK7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkfKnJJC3nVAHgNzNc/jwS/gWrZ3wLfA9MgZo2TM2LE=;
 b=imRSq3IIrMlb/Sh9LSLUYwCHba8MWCzAt/64mS0e+itSL96JOBbAQxtqIgIguBLUF8CgAkflz7KAA8v9aMn5d/v0vMHMC4bmddo2f9RtMG9mmxu5Ms6Xk7sMnCLaNrLRlakGAGURS4T8ici6dU95SJGxh8qottFn8aNLGmFfmjc=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BY5PR11MB4244.namprd11.prod.outlook.com (2603:10b6:a03:1bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 10 Jul
 2020 22:29:06 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.021; Fri, 10 Jul 2020
 22:29:06 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [PATCH] openssl: add rdcpu to rand-seed
Thread-Topic: [PATCH] openssl: add rdcpu to rand-seed
Thread-Index: AQHWVvH06STArC7Cs0m8dQKHDTkxtqkBO9+AgAApRoA=
Date: Fri, 10 Jul 2020 22:29:06 +0000
Message-ID: <2017c0a657d59dbafe942941d52c11cd00147057.camel@cisco.com>
References: <20200710193957.1969769-1-takondra@cisco.com>
	 <CAMKF1sqpr6mf_GcPOf-saR8x8HtZ-CVxh8ZnNLV4km=wdTyjYw@mail.gmail.com>
In-Reply-To: <CAMKF1sqpr6mf_GcPOf-saR8x8HtZ-CVxh8ZnNLV4km=wdTyjYw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e84e987-cf42-44c1-30e0-08d82520a84d
x-ms-traffictypediagnostic: BY5PR11MB4244:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4244CE1C57B19BFDB0C48528C8650@BY5PR11MB4244.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ct2QhjB4W5y6INX8WH//bGcRcEv3bA3IJZABsaT0dHI/jBOPooRDfEgXK8kdTZ8g9AKjKsB3bGsxi2WiyaDZaivirzE3K3S7XJlo0oXbciEaly396IAewFkyfZO/pjXB0Q6c2B4pPTOThtt8qvpAsjTRRsNHJGI6lbrmhufeAC6sTiOf1I3D8gNysP5VWgyInpATyEGKGQfrXJp0u58ST5MZuPyndwDkFZXHDor5aW7hVgD2Sy+C+PINm18snTDyveIpqlHTdKw/84l+NOYD9JV9Y9R8cyGc8cP0nD2GqkpSmPxelDLM0HZMtzxLJ2Nf7MY2AzUWjot3iWmBrEIYjZC0c1ClbihKQ06KQS7u3e4cv4jYHbEqf32vFbAGBrnmm1c0AzOqLdhTYNVYsdDG/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(54906003)(2616005)(71200400001)(6506007)(4326008)(5660300002)(2906002)(36756003)(8676002)(53546011)(316002)(66476007)(6512007)(86362001)(186003)(966005)(478600001)(83380400001)(107886003)(6916009)(66946007)(8936002)(66556008)(64756008)(76116006)(66446008)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: qijFWvKWb+k3v71LzlrHOxX4fuUF3D/4543h0cVUEKq7uji0eXepoXNa8+E7oOyO0LPDPF0orDff5D6BlhO6SLzGm71Z2MYeVuKIRTz9WSp0CCIWTkPJJZHP2mkNaTmvHJkRtfDMilrd3XD7v+Pmo84s1Lbe42b5KsflwN5GmfCspa0VKPhSVOJrLkRGFkp2TIdcowyXwxw7ZL4RCrvjPNmjIt0Cj3wx9wFXup+OEkkhVPyNFAioRBqtR/Mkg0d9f3QxHGAcT8sn2s9T3ap0WtQ7fGWJrqKBr9mOPV9Zb4wRiOMPSXpPIhgWUJ6DzE5+BrAEn0HgcqUrzQKjQp2Z1eG8kHKo8s0yswFcgRiwBbVkWyNSi8PIJI9Yvh0qP2MaW0HrOiVWU/lwu43mDokLGSPkAf+R5EsZ4DkcqvIJtBeTVGTWtH5FQkBNqtU8CwW2MGtK2+hljIwOeFcPJNDFAxPnkFW3OYnPpdD8murPu8WMz6ZTJgDF/AVbGk6VFm64uMU8CthNieaX8LBrmrT4AQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e84e987-cf42-44c1-30e0-08d82520a84d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 22:29:06.3668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VJTqZxVtneqzabwZFp7NZ4xsR5wnyQ0Q8QdZv8eOL3PglQzxnW3rpIAFAsr5TKXVyOsYGTEveb63W+m9ek7iQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4244
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.11, xch-rcd-001.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF34B2D1D56D3C47A666E4505AB4B72B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDEzOjAxIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
RnJpLCBKdWwgMTAsIDIwMjAgYXQgMTI6NDAgUE0gVGFyYXMgS29uZHJhdGl1ayA8dGFrb25kcmFA
Y2lzY28uY29tPiB3cm90ZToNCj4gPiBOYXRpdmVbc2RrXSBvcGVuc3NsIGZhaWxzIHRvIGluaXRp
YWxpemUgUk5HIG9uIHN5c3RlbXMgd2hlcmUgbmF0aXZlW3Nka10NCj4gPiBnbGliYyBpcyBidWls
dCBhZ2FpbnN0IHByZS0zLjE3IGxpbnV4LWxpYmMtaGVhZGVycywgYnV0IHJ1bnMgb24gNC44Kw0K
PiA+IGtlcm5lbDoNCj4gPiAxNDA3MzczNDgzMzMxODQ6ZXJyb3I6MjQwNkMwNkU6cmFuZG9tIG51
bWJlciBnZW5lcmF0b3I6UkFORF9EUkJHX2luc3RhbnRpYXRlOmVycm9yIHJldHJpZXZpbmcgZW50
cm9weTouLi9vcGVuc3NsLTEuMS4xZy9jcnlwdG8vcmFuZC9kcmJnX2xpYi5jOjM0Mg0KPiA+IA0K
PiA+IENvbW1pdCAzZmY5OGY1NTgxNTcgKCJTdGFydCB1cCBERVZSQU5ET00gZW50cm9weSBpbXBy
b3ZlbWVudCBmb3Igb2xkZXINCj4gPiBMaW51eCBkZXZpY2VzLiIpIGluIE9wZW5TU0wgMS4xLjFk
IGhhcyBlZmZlY3RpdmVseSBkaXNhYmxlZCBkZXZyYW5kb20NCj4gPiBzZWVkIHNvdXJjZSBmb3Ig
a2VybmVscyA+PTQuOC4gVGhlIGFzc3VtcHRpb24gaXMgdGhhdCBnZXRyYW5kb20oMikgd2lsbA0K
PiA+IGJlIHVzZWQgaW5zdGVhZC4gR2V0cmFuZG9tIHN5c2NhbGwgd2FzIGFkZGVkIGluIGtlcm5l
bCAzLjE3IGJ5IGNvbW1pdA0KPiA+IGM2ZTlkNmYzODg5NCAoInJhbmRvbTogaW50cm9kdWNlIGdl
dHJhbmRvbSgyKSBzeXN0ZW0gY2FsbCIpLiBTbyBvbiBhDQo+ID4gc3lzdGVtIHdpdGggNC44KyBr
ZXJuZWwgYW5kIHByZS0zLjE3IGxpYmMgaGVhZGVycyBib3RoIGdldHJhbmRvbSBhbmQNCj4gPiBk
ZXZyYW5kb20gY2FuJ3QgYmUgdXNlZC4NCj4gPiANCj4gPiBUbyB3b3JrYXJvdW5kIHRoaXMgaXNz
dWUgYWRkICdyZGNwdScgYXMgYWRkaXRpb25hbCBzb3VyY2Ugb2YgZW50cm9weSBmb3INCj4gPiB0
aGUgcmFuZCBzZWVkLiBBbHNvIGRldnJhbmRvbSBpbiB0aGUgbGlzdCBpcyBuby1vcCBzaW5jZSBv
cyA9IGdldHJhbmRvbQ0KPiA+ICsgZGV2cmFuZG9tIG9uIExpbnV4LCBzbyByZW1vdmUgaXQuIFRo
ZSBjb21tZW50IGlzIGFsc28gbm90IHJlbGV2YW50DQo+ID4gYW55bW9yZS4NCj4gPiANCj4gDQo+
IEkgdGhpbmsgcmRjcHUgd2lsbCB3b3JrIG9uIHg4NiBob3N0cyBidXQgbm90IG9uIHNheSBhYXJj
aDY0IGJ1aWxkDQo+IGhvc3RzLiBDYW4gd2Ugc3RpbGwNCj4gaGF2ZSBkZXZyYW5kb20gYXMgYW4g
b3B0aW9uIGlmIHJkY3B1IGZhaWxzID8NCg0KRGV2cmFuZG9tIGlzIHBhcnQgb2YgJ29zJyBhbHJl
YWR5LCBzbyBkZXZyYW5kb20gd2lsbCBiZSBzdGlsbCB1c2VkLg0KUmRjcHUgd2lsbCBiZSB0cmll
ZCBhcyBhIGZhbGxiYWNrIG9ubHkgKmFmdGVyKiBnZXRyYW5kb20gYW5kIGRldnJhbmRvbQ0KZmFp
bGVkLg0KDQpIZXJlIGluIHJhbmRfcG9vbF9hY3F1aXJlX2VudHJvcHkoKSB0aGUgb3JkZXIgb2Yg
c291cmNlcyBpcyBnZXRyYW5kb20sDQpkZXZyYW5kb20gYW5kIHRoZW4gcmRjcHU6DQpodHRwczov
L2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVuc3NsL2Jsb2IvT3BlblNTTF8xXzFfMWcvY3J5cHRvL3Jh
bmQvcmFuZF91bml4LmMjTDYxOA0K
