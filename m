Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web11.11343.1594691279239663071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 18:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=cO6Onu+8;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4512; q=dns/txt; s=iport;
  t=1594691279; x=1595900879;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4RjDcgrgEdRCqolqfKx49JqiVeFwLNrkOChZ2R9H/o8=;
  b=cO6Onu+8NflQoVvRYvkiGiVAkGlK4DaWxhoMcde5W49A8E8xxnossduk
   t9jp7TnvpSPsUq3Sh6UsKAdeQTLV+xOOUwqirdA55ICILzBgEqsb/1u5c
   Rdub4tkoBi0amd+RHYeMOFqMcGC+tTag8PxHCMsqVu3uyThxRGeuIkvrr
   A=;
IronPort-PHdr: =?us-ascii?q?9a23=3AacI/ARZ8+ctwGN+aZjSLEZX/LSx94ef9IxIV55?=
 =?us-ascii?q?w7irlHbqWk+dH4MVfC4el21QaVD4re4vNAzeHRtvOoVW8B5MOHt3YPONxJWg?=
 =?us-ascii?q?QegMob1wonHIaeCEL9IfKrCk5yHMlLWFJ/uX3uN09TFZXxYlTTpju56jtBUh?=
 =?us-ascii?q?n6PBB+c+LyHIOahs+r1ue0rpvUZQgAhDe0bb5oahusqgCEvcgNiowkIaE0mR?=
 =?us-ascii?q?Y=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C2AAAeDg1f/5xdJa1gGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIFKgVJRB29YLyyEM4NGA41SgQGTXYQAglM?=
 =?us-ascii?q?DVQsBAQEMAQEeDwIEAQGETAIXggMCJDgTAgMBAQsBAQUBAQECAQYEbYUuCCU?=
 =?us-ascii?q?BC4VvAQEBAQIBEhERDAEBNwEECwIBCBgCAiYCAgIwFRACBA4FIoMFgksDDiA?=
 =?us-ascii?q?BDp4yAoE5iGF2gTKDAQEBBYEyAYN8GIIOCRR6KgGCaYNVhjMagUE/gRGCEkk?=
 =?us-ascii?q?1PoJcAgIXgTcPgxaCYJIIATyiXQqCXYhRkQchnyotkT+KIpRSAgQCBAUCDgE?=
 =?us-ascii?q?BBYFqI4FXcBWDJAlHFwINgTSMajeDOoUUhUJ0AgEILAIGCAEBAwl8jHiCRAE?=
 =?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.75,349,1589241600"; 
   d="scan'208";a="799386739"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 14 Jul 2020 01:47:57 +0000
Received: from XCH-ALN-004.cisco.com (xch-aln-004.cisco.com [173.36.7.14])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 06E1lv6a027867
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 14 Jul 2020 01:47:57 GMT
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by XCH-ALN-004.cisco.com
 (173.36.7.14) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 13 Jul
 2020 20:47:56 -0500
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by xhs-rtp-002.cisco.com
 (64.101.210.229) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 13 Jul
 2020 21:47:55 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-002.cisco.com (64.101.210.229) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 13 Jul 2020 21:47:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miwbYZDRjwsA1bFZIazeHb+VqQbAXWJJHIS+gyYM5FY9hqGfcbKKba7Mzu+T8a9BJUDEKg5xYPhcntCJRY3h6y5m3xkY64OGK+5YZ+IE6fPk95kHTZBYJV/hoYFa9x/QA0YJFHSpAktVSsvHkQipNX+Sorh+ByMmoPTfeaQmK/x38xllsmmPXSdi3Pf+/Chhn8S4BenUOZddDQd0VZI6Jrkl8OKn4T+yg5dSye9X9m1uoyT03ZUXxIIdst88DPWm8+TY9jdFUBkI4GqyE52n/RvgbdbFkezKWarmYSOx12sxUYWLtSJx55j0aOxCW8Vm2t+cqm2OjpjbKtO1SZuvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RjDcgrgEdRCqolqfKx49JqiVeFwLNrkOChZ2R9H/o8=;
 b=YmsBVOywqv/mkquiINiRTg7s9COJXrfDFw28v+aBo+/tmlje7Lsd+bHsX6HJSl3nR2s5c/G7W4XwKU61xI618Xiz2qG1mDAcbxvV5irV86LYTut4dNppLieuGD636oVNHfPobeKcQlev82Ra7nw7kY+25c5BDckkskYRpftoHBh7kcv/op00MofahAXHUNjxk6LaWKnDJq7SF1PEHXpKq1tZCc6s4nVpK6noNcBInSW/tE9rMCkiAwMscY7dJmbI+2VsYP9ZXRjh4bFLqKuE2x9Gpi0NCCSkdZTrJC/SvHf/8mBZRO5GVcVJp/K6jlPPCn8kmbDsCVmtyubUGhZRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RjDcgrgEdRCqolqfKx49JqiVeFwLNrkOChZ2R9H/o8=;
 b=O+fkVAlemE+8HmLBjTnz3LRvYP0i5wQmaBj6Koqr0fRBoa1xN2gPh6ypbIasQFRpA+66uQUtAQEHizKfXVdJzZyJCNNlPhxTZO2YTXBCKIeA0qrA4Ca//QkZ7ksGHK8GDHvPn2UDigW7A3s2vrWVcDvuWiLo3Yd/kVJwfRIvMpM=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BY5PR11MB4452.namprd11.prod.outlook.com (2603:10b6:a03:1bf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Tue, 14 Jul
 2020 01:47:54 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.025; Tue, 14 Jul 2020
 01:47:54 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "chris_larson@mentor.com" <chris_larson@mentor.com>,
        "Martin.Jansa@gmail.com"
	<Martin.Jansa@gmail.com>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
Thread-Topic: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME
 to fix do_unpack
Thread-Index: AQHWVu13NisF4l9iV0Wj84HWd9Lzk6kBRyiAgAAWtICAAArnAIAAJjqAgABw6oCABFPRgA==
Date: Tue, 14 Jul 2020 01:47:54 +0000
Message-ID: <b22431239872ad61559edd53514b9be488fbfce5.camel@cisco.com>
References: <20200710190810.1967868-1-takondra@cisco.com>
	 <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
	 <328b3757b8071e7c08776c0d6dd3a6ef8d52b089.camel@cisco.com>
	 <CANNYZj9XjuiYJH_259nxkQRupbVpMeOO81yLkkH=ugF+Bu--SQ@mail.gmail.com>
	 <ebe4c112aa8fcd03e5b6a5bea8b33b0e6c5dc5c8.camel@cisco.com>
	 <CANNYZj-7w-JCgXmtmPVc0RhO6vcfGDHAY=qV6sQv1dkU3dpB5w@mail.gmail.com>
In-Reply-To: <CANNYZj-7w-JCgXmtmPVc0RhO6vcfGDHAY=qV6sQv1dkU3dpB5w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bc36ad4-932f-4c96-d599-08d82797ed07
x-ms-traffictypediagnostic: BY5PR11MB4452:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4452C3C9089E2E9235C75D6AC8610@BY5PR11MB4452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bt01EL6UmhklFELuSYuKwEvuoP0vfKaCA/KuzE83clIQzb99n9X1kRD/oFocTFObpKUhpPi/VEY9yvWu4e6YbDOKOBYbbJLUfWD/A9OQcs/zs/aVNNztKT4BwQ/qEtazCWetHXPMyK+gBQ1Aua2aLCMYpyyrxVRDXwqqlCdWeCcTx8rzaMF9W7fPVOeY+Xwo+DIcip3/ZSXsm97QRv5rLv9W6L2extjdjKovF6VvsiIxnjqw4bwKThnKCTIESbKIdqne4m01R1gFbsJVQ6+exHyaeX9AZSEZFzVr3cHcawG3nIe0sSutZT8OD1Eh3gSfYd9K/kXcOVAPoUoCjDVQAVkF391xBdEf6Gk+PXxV9pcuJwTjYCVVwWKbt+XCc3CsvnqSP4yL2St7ahPY4vQYVg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(86362001)(6916009)(8676002)(186003)(316002)(2616005)(8936002)(478600001)(966005)(4326008)(6486002)(83380400001)(107886003)(71200400001)(64756008)(66446008)(66946007)(66556008)(66476007)(6506007)(5660300002)(54906003)(76116006)(6512007)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HO2JVnzlXFiOhB3yGPJLLIhRoHxTOQRaIPnCLpd34H/O9IxqzuusqpTmBCkttF+IT/eHJB0qkVXUxOrN5m9Z2qsd835mfOo+cS0ZgtoUbgGbfucSC3pXZKY2SCaau/50RlV7Ph5Gybe14eegU6baGpyQdOEpdNrAr7wYT+5NJIe8ZgC+gqucuiV61GK1zIJtQ/hi6CIYsKP+6tnt/3/+zxFJPuTwmNGwzNe9EIBMmrmHLsntF1Ubs4T+jSJvxdBBsCD8tKzPysmBi52Pk7cn85txkT3CNVaeqcOzO8VpAB24xCLcoE/cwPj+ethr0U36YSujgZbyJv7/qj582OuF43BApipmA0T93CKGDsJ/TGuOb41ypGPJBTUv9QhmnWi40gEBrsvnoWUUU5ycAcCwxPuUlHputvWNgiS9elz+J2dCpIfVqJpbsyIcWRBMeyKALqJxd++/QGgxB996aUbhinCmPfeSsiA7lNUf/8kOwuRJidIVcNK7yXxZA7u2AWdm6dk4G4Gp81dyKhfMer/AgQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc36ad4-932f-4c96-d599-08d82797ed07
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2020 01:47:54.2084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ffd5yNZPv3humYo2wxYJGo3A2++wI8YCvZgMop4o859FqteNstjz3rPM/sr6b08Zp/eonEW73+k9HHcBxUbww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4452
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.14, xch-aln-004.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <61EF9F3442875649B32B735C414DB5CA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDIwLTA3LTExIGF0IDA5OjQyICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gU2F0LCAxMSBKdWwgMjAyMCBhdCAwMjo1OCwgVGFyYXMgS29uZHJhdGl1ayAodGFr
b25kcmEpIDwNCj4gdGFrb25kcmFAY2lzY28uY29tPiB3cm90ZToNCj4gPiBPaCwgdGhhbmtzLiBO
b3cgaXQgbWFrZXMgYSBiaXQgbW9yZSBzZW5zZS4gSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0DQo+ID4g
cHl0aG9uM25hdGl2ZSBjbGFzcyB1c2VzIHRhcmdldC1zcGVjaWZpYyBjb25maWd1cmF0aW9uIGFu
ZCB0YXJnZXQNCj4gPiBzeXNyb290LiBTaG91bGRuJ3QgaXQgYmUgY2FsbGVkIHNvbWV0aGluZyBs
aWtlIHB5dGhvbjNjcm9zcyB0aGVuPw0KPiANCj4gTm9wZSAtIHRoZSBwdXJwb3NlIG9mIHB5dGhv
bjNuYXRpdmUgaXRzZWxmIGlzIHRvIHByb3ZpZGUgbmF0aXZlDQo+IHB5dGhvbiB0byByZWNpcGVz
IGZvciB3aGljaCBob3N0IHB5dGhvbiBtYXkgbm90IGJlIGdvb2QgZW5vdWdoIChmb3INCj4gZXhh
bXBsZSB3aGVuIHRoZXkgbmVlZCAzcmQgcGFydHkgbW9kdWxlcywgb3IgZXhhY3QgdmVyc2lvbiBz
dXBwbGllZA0KPiBieSBvZS1jb3JlKS4NCg0KSUlVQyBweXRob24zbmF0aXZlIGJ5IGl0c2VsZiBp
cyBjdXJyZW50bHkgYnJva2VuLiBTZWUgY2FzZSAjMiBiZWxvdy4NCg0KPiBJZiB0aGV5IGFsc28g
cG9rZSBpbnRvIHRhcmdldCBjb25maWd1cmF0aW9uLCB0aGVuIHRoYXQgaXMgcHJvdmlkZWQgYnkN
Cj4gYWRkaW5nIGEgREVQRU5EUyBvbiAqdGFyZ2V0KiBweXRob24zLCBhbmQgaGF2aW5nIHRoaXMg
cGF0Y2ggdGhhdA0KPiBtYWtlcyBuYXRpdmUgcHl0aG9uIGxvYWQgdGhlIHRhcmdldCBzeXNjb25m
aWdkYXRhOg0KPiBodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5
L3RyZWUvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtZGlzdHV0aWxz
LXN5c2NvbmZpZy1hcHBlbmQtU1RBR0lOR19MSUJESVItcHl0aG9uLXN5cy5wYXRjaA0KPiANCj4g
SSB1bmRlcnN0YW5kIGl0IGlzIG5vdCBpbnR1aXRpdmUsIGJ1dCB0aGlzIGlzIG9uZSBvZiB0aG9z
ZSBsZWdhY3kgb2UtDQo+IGNvcmUgdGhpbmdzIHRoYXQgbm9ib2R5IGhhcyB0aW1lIHRvIGNsZWFu
IHVwLiBZb3UgYXJlIHdlbGNvbWUgdG8gZG8NCj4gc28uIEkgZGlkbid0IGludmVudCB0aGlzIGFw
cHJvYWNoLCBJIGp1c3QgcmVwbGljYXRlZCBpdCB3aGVuIEkNCj4gcmV3cm90ZSB0aGUgcHl0aG9u
MyByZWNpcGUgZnJvbSBzY3JhdGNoLCB0aHJvd2luZyBhd2F5IGFsbCB0aGUgb3RoZXINCj4gYmFn
Z2FnZSB0aGF0IG5vYm9keSByZW1lbWJlcmVkIHRoZSBwdXJwb3NlIG9mLCBzbyB0aGF0IHB5dGhv
bjMgY291bGQNCj4gYmUgdXBncmFkZWQgYWdhaW4gd2l0aG91dCBnb2luZyBpbnNhbmUgOikNCg0K
VGhlcmUgc2VlbXMgdG8gYmUgYXQgbGVhc3QgdGhyZWUgZGlzdGluY3QgdXNlLWNhc2VzIGFuZCBl
eHBvcnRpbmcNCl9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FPV9zeXNjb25maWdkYXRhIGJyZWFr
cyB0d28gb2YgdGhlbToNCg0KMS4gSWYgYSByZWNpcGUgbmVlZHMgcHl0aG9uMy1uYXRpdmUgYW5k
IG5lZWRzIHRvIHdvcmsgd2l0aCBweXRob24NCnRhcmdldCBjb25maWd1cmF0aW9uIGl0IERFUEVO
RFMgb24gcHl0aG9uMyAodG8gZ2V0IHB5dGhvbjMgYW5kDQpfc3lzY29uZmlnZGF0YS5weSBpbiBy
ZWNpcGUtc3lzcm9vdCkgYW5kIGluaGVyaXRzIHB5dGhvbjNuYXRpdmUuIFRoaXMNCndvcmtzIGFz
IGludGVuZGVkLg0KDQoyLiBJZiBhIHJlY2lwZSBuZWVkcyBweXRob24zLW5hdGl2ZSBvbmx5LCB0
aGVuIGl0IGluaGVyaXRzDQpweXRob24zbmF0aXZlIHdoaWNoIGV4cG9ydHMgX1BZVEhPTl9TWVND
T05GSUdEQVRBX05BTUU9X3N5c2NvbmZpZ2RhdGEuDQpUaGlzIGRvZXNuJ3Qgd29yaywgYmVjYXVz
ZSBweXRob24zLW5hdGl2ZSB3aWxsIGZhaWwgdG8NCmZpbmQgX3N5c2NvbmZpZ2RhdGEucHkgaW4g
cmVjaXBlLXN5c3Jvb3QgKGJlY2F1c2UgdGhlcmUgaXMgbm8gcHl0aG9uMw0KaW4gREVQRU5EUyku
IEFzIGEgd29ya2Fyb3VuZCBzZXZlcmFsIHJlY2lwZXMgc3RhcnRlZCB0byB1bnNldA0KX1BZVEhP
Tl9TWVNDT05GSUdEQVRBX05BTUUgKGdsaWIgWzFdLCBtZXNhIFsyXSwgc2NvbnMgY2xhc3MgWzNd
KS4NCg0KMy4gU29tZSB0b29scyB1c2UgaG9zdCBweXRob24gdW5kZXIgcmVjaXBlJ3MgZW52aXJv
bm1lbnQuIEhvc3QgcHl0aG9uDQpmYWlscyB3aGVuIHRob3NlIHJlY2lwZXMgaW5oZXJpdCBweXRo
b24zbmF0aXZlIHdpdGggZXhwb3J0ZWQNCl9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FLiBTb21l
IHRvb2xzIHN0YXJ0ZWQgdG8gd29ya2Fyb3VuZCBpdCBhbHNvIGJ5DQp1bnNldHRpbmcgX1BZVEhP
Tl9TWVNDT05GSUdEQVRBX05BTUUgKGdpdC1tYWtlLXNoYWxsb3cgWzRdLCBwcnNlcnZpY2UNCls1
XSkuDQoNCkNocmlzJyBhcHByb2FjaCBbNl0gd291bGQgYWRkcmVzcyBjYXNlICMzLCBidXQgbm90
ICMyLiBJJ20gbm90IHN1cmUgeWV0DQp3aGF0IGlzIHRoZSBiZXN0IHdheSB0byBhZGRyZXNzICMy
LiBNYXliZSBleHBvcnQNCl9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FIG9ubHkgaWYgREVQRU5E
UyBoYXMgcHl0aG9uMz8NCg0KWzFdIA0KaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVu
ZW1iZWRkZWQtY29yZS90cmVlL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jP2lk
PWUxODUyMzVkZDk3NTEwYmZkYzYyMWNlZjljMThkOGQxM2IxNjAwNmQjbjQwDQpbMl0gDQpodHRw
czovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC8/aWQ9OGZj
MjU1ZjdkNjNjNTMxNjdjNzcxY2Q2Yjc4ODk1Nzg0ZjM3ZDMzZg0KWzNdIA0KaHR0cHM6Ly9naXQu
b3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS9jb21taXQvP2lkPTQ0ZjMwM2JhOWZi
MTkzYTk4NWU4ZTRiN2M2OTYyODgzYWUzOTcwZDENCls0XSANCmh0dHBzOi8vZ2l0Lm9wZW5lbWJl
ZGRlZC5vcmcvYml0YmFrZS9jb21taXQvP2lkPWQ5NGNjZDUwNmQwNGFmZjE4MmFiNDhmNTAxZjZm
MzY2ZDVkZDE0ZjUNCls1XSANCmh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVk
ZGVkLWNvcmUvY29tbWl0Lz9pZD00YjI2ZWFmNzE1MmZiNzEyYWJhNDdhMGM3NDYzMzM1NzhmNThl
ZThkDQpbNl0gDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL29wZW5lbWJlZGRlZC1j
b3JlL2NvbXBhcmUvbWFzdGVyLi4ua2VyZ290aDpweXRob24tc3lzY29uZmlnDQo=
