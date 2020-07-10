Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web10.1747.1594423543954887269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 16:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=YgbPmFSm;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2674; q=dns/txt; s=iport;
  t=1594423544; x=1595633144;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ftAi8tTgOIzXnO8lpSk/kUZ10IZXPBZw7wJBFvTHBro=;
  b=YgbPmFSm2nsMEaafzVunKiyfVpy9N4+V8mlgYJb0lCN6YXMlrnNRCqWC
   caHNBJbUNQVFDY3ROPKKWN6LgpolhxzAdFFwjy6zIWnU6qHekmlmWLGBg
   S3eoolBISMLMNcCMsftSqrYz7f9RhdmDzZoFc7AWs4B9JGtqvH1SobNRQ
   4=;
IronPort-PHdr: =?us-ascii?q?9a23=3AcV8J2xc44zIXMQ+cAkbBWyTqlGMj4e+mNxMJ6p?=
 =?us-ascii?q?chl7NFe7ii+JKnJkHE+PFxlwaSA9ff6vRZm+TRrqbsUHAB5pDHt2oNI9RAVB?=
 =?us-ascii?q?4A3MMRmQFoQMuIElbyI/OiaSsmVN9DW1lo8zDeUwBVFc/yakeUrii06jgfSR?=
 =?us-ascii?q?H+MxdlKOPoHILbk8Ww0aa14ZKAKwlNjSC2NLV1Khj+pA7Nt84Q1I1lLKtUqF?=
 =?us-ascii?q?PJr3JEdv4Qy3lvIAeYng334YG7+5sw/g=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C1AAC29whf/5xdJa1gGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIFKgVIpKAdvWC8shDODRgONT5hdglMDVQs?=
 =?us-ascii?q?BAQEMAQEYDQgCBAEBhE0CF4F/AiQ4EwIDAQELAQEFAQEBAgEGBG2FWwyFcAE?=
 =?us-ascii?q?BAQMBERERDAEBNwEPAgEIGAICJgICAiYKFRACBAENJ4MFgksDLgEOnl8CgTm?=
 =?us-ascii?q?IYXaBMoMBAQEFhToYgg4JFHoqAYJpg1SEcIFDGoFBP4QhPoJRCwQBFoFdgn+?=
 =?us-ascii?q?CYI8Jgno9olsKgl2IT4pQhjYghA2bGZFkih+UUAIEAgQFAg4BAQWBaiOBV3A?=
 =?us-ascii?q?VgyQJRxcCDY4egSUBDII/hRSFQnQCCSwCBggBAQMJfI56AQE?=
X-IronPort-AV: E=Sophos;i="5.75,336,1589241600"; 
   d="scan'208";a="541516388"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Jul 2020 23:25:42 +0000
Received: from XCH-ALN-005.cisco.com (xch-aln-005.cisco.com [173.36.7.15])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 06ANPgw4013768
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 10 Jul 2020 23:25:42 GMT
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by XCH-ALN-005.cisco.com
 (173.36.7.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 18:25:42 -0500
Received: from xhs-aln-002.cisco.com (173.37.135.119) by xhs-rtp-001.cisco.com
 (64.101.210.228) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 19:25:41 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-002.cisco.com (173.37.135.119) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 10 Jul 2020 18:25:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmpCMWCaNbCSv7G+RU6CnemdFytlPf54PExX//TWepjr/0FtrYf3nBm80ZwXgBkmWbE3I4HU1VJrnW2e7YqJ3+ct7F4Pc7Rsl/2I+80kJ+YKyISUzCflS+L+jpLgA6uLIo8Y2AbnXuY5UlECpM04lkG2f0X31IBbGJ0ddZMgJ5KIyHTsPY6P3LGD8v3FafjhhXSz9qjMGWYCTJ0k3eXhAeMUmzs1kL1qnCW62x2HzQU0XSpcV+uGQVABhb8SslWidrybd0r/y9FwslnPPQ3scW0MP/8IiNjjEKs+NkaACSH0HheoeAjxjPHiZ1Kx4hsbavezdLT9dGtVsD0GB+BBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftAi8tTgOIzXnO8lpSk/kUZ10IZXPBZw7wJBFvTHBro=;
 b=ad7jI5add8oSujKgqASExUIyqNoUknEaHk+7HqbaQq86XKfjieQ2XkOgDfAIM5jGrh57MhhN5y8QmRiFp74fiYwLMLcTL5WDppTZYw/O7Z1erzBd/xv2i2KhMJI/2fl60LbyTCZwNNs9vjWfEEXjTmeuzlKCahfc1Eh8vDHcTqi8pI7jT82/Zd2Gx9QGY14XCyEFp9l0OiWLRzdSH0fpcJIs4u+CCnVj8JWGw2CV4ma+ifNthpgpmPg4gxiQVfsyzvWVcLAzPfZeGmTQ/oYOOYX6SQcgmeQPuND3ZAEu1v2M83z2e0v7jJsWiu/ieXLLZOdaMBA8wyHx8sfA5kviQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftAi8tTgOIzXnO8lpSk/kUZ10IZXPBZw7wJBFvTHBro=;
 b=Cc3mkPM2L5MSDnfGzdeCVd3u3aPLrRWTR5dtq6ytRIvLfcSukGnWiOhUHc/GBeMYhAM85Ky8AQ9nc3WxJFF4S1+etQUyqHNR6rMcR+1PvaC5wHa6SuMiwKoJm4KNcH6AKUoehzE6DpHxrzZWH6Qxzudtdp9pV14vrxlZ9KyUXh0=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BYAPR11MB3831.namprd11.prod.outlook.com (2603:10b6:a03:b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 10 Jul
 2020 23:25:39 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.021; Fri, 10 Jul 2020
 23:25:39 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "raj.khem@gmail.com"
	<raj.khem@gmail.com>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [PATCH] openssl: add rdcpu to rand-seed
Thread-Topic: [OE-core] [PATCH] openssl: add rdcpu to rand-seed
Thread-Index: AQHWVvH06STArC7Cs0m8dQKHDTkxtqkBQXsAgAAzdwA=
Date: Fri, 10 Jul 2020 23:25:39 +0000
Message-ID: <932637efb520100cebf1ceb36c274c66c6110987.camel@cisco.com>
References: <20200710193957.1969769-1-takondra@cisco.com>
	 <3d63c868f4e94dee8c7ee05a3afa0f0620f98a15.camel@linuxfoundation.org>
In-Reply-To: <3d63c868f4e94dee8c7ee05a3afa0f0620f98a15.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05297413-70a1-4f33-4dce-08d825288e8d
x-ms-traffictypediagnostic: BYAPR11MB3831:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB38314E35E0A6350FF5C139CDC8650@BYAPR11MB3831.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B44K1M5yDri0yyA4n2x6nazquUAWO/LXcRI6BucNHdWOLm42En/1muUmMm63SLhsM+SrtgkGlh5d6Poze3r/hz7rTypBJSdluH7ZQl4kbJScMKyg/QRj4bYwIeA22NM54ewFS86MJ38noSckrBEEWliGnlFJBaLwRFacUhxdd2OW9Hj7zoLp5nPUnwRC3+wp2mDJgBYqg4HtfR6ASCDbN12hPneZIv2ruxBU45/jZySwcguZRoXwjcGUQ7xyPkJcPvN6i36WzL80eD5qZIFy8D+Cyv6Ld0Hms4DliogxPV+Nhig0pj6OakeCQ5gvPhkp9ReIa47S4HYzWSRolIv18qGtpjgzn/5iElB3FFyBsbKcPl935vlbIC5laoy30t7T74petfbAnR2YpLzkTvYSMg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(478600001)(5660300002)(6506007)(6486002)(8936002)(107886003)(66476007)(64756008)(66446008)(66556008)(86362001)(71200400001)(83380400001)(4326008)(76116006)(66946007)(8676002)(186003)(316002)(966005)(2616005)(36756003)(6512007)(110136005)(2906002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 5Q+/AA7ORXBOJ5sRoorGmyiJ10QgoQKC2T2PGc/IFUtUWEdvDb7Be3fYks82gJL9vjutgPng+Nqg3NpJFqwWI3wkcot7hY5Bic29vg8eWcjDtzRe23m8E1xN6Q/e8C7vuWAzomtLzrY30lymBxGfQZPgE6Uj2NORabf+h0bUv74iJbxFbeknJZDQruV4lUOwenFN1CeIRq26uPbDDzalVbo0Ux67SqeB1N1X6N28ORRZ2b2YrbYg71RMYyYcjCVmp1dqnK6MaPY65XEIPvMOInGuJd37gGjLPBZxhSmwyTH9+NrIHNmi3ZjNUEV6ZcW5qdSW/EHMQ7be+NHWDjH03eG7sqlmCUsLIf/rzqAhYnMFCvIcXNA0UpuDjCdT8VQtVQcc29Gza2NW70P4O29auhyL89CpJyiQ1m6pg9jP6IBbScq2j4pENK8YqXp2esj/dY7XMlyRJx3AuJqwyOM0IfDBAj49FSM4nXehFk9XdTjGxNSTdyHZbNVaEn+ttl7MU2RqTSTe36LJXWfMC1GEGQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05297413-70a1-4f33-4dce-08d825288e8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 23:25:39.1810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WjnLSfjlMjIVTR5CZj4EYsfbHwxQ6uh9G2/ozmZAgP31Bb0ZKF2K3fSmkU5GUiMwKkXyseWOtwwULd025L7Aqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3831
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.15, xch-aln-005.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A1369DD0C967B44993C6FF5D70EE51E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDIxOjIxICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gRnJpLCAyMDIwLTA3LTEwIGF0IDEyOjM5IC0wNzAwLCBUYXJhcyBLb25kcmF0aXVrIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IE5hdGl2ZVtzZGtdIG9wZW5zc2wg
ZmFpbHMgdG8gaW5pdGlhbGl6ZSBSTkcgb24gc3lzdGVtcyB3aGVyZSBuYXRpdmVbc2RrXQ0KPiA+
IGdsaWJjIGlzIGJ1aWx0IGFnYWluc3QgcHJlLTMuMTcgbGludXgtbGliYy1oZWFkZXJzLCBidXQg
cnVucyBvbiA0LjgrDQo+ID4ga2VybmVsOg0KPiA+IDE0MDczNzM0ODMzMzE4NDplcnJvcjoyNDA2
QzA2RTpyYW5kb20gbnVtYmVyIGdlbmVyYXRvcjpSQU5EX0RSQkdfaW5zdGFudGlhdGU6ZXJyb3Ig
cmV0cmlldmluZyBlbnRyb3B5Oi4uL29wZW5zc2wtMS4xLjFnL2NyeXB0by9yYW5kL2RyYmdfbGli
LmM6MzQyDQo+ID4gDQo+ID4gQ29tbWl0IDNmZjk4ZjU1ODE1NyAoIlN0YXJ0IHVwIERFVlJBTkRP
TSBlbnRyb3B5IGltcHJvdmVtZW50IGZvciBvbGRlcg0KPiA+IExpbnV4IGRldmljZXMuIikgaW4g
T3BlblNTTCAxLjEuMWQgaGFzIGVmZmVjdGl2ZWx5IGRpc2FibGVkIGRldnJhbmRvbQ0KPiA+IHNl
ZWQgc291cmNlIGZvciBrZXJuZWxzID49NC44LiBUaGUgYXNzdW1wdGlvbiBpcyB0aGF0IGdldHJh
bmRvbSgyKSB3aWxsDQo+ID4gYmUgdXNlZCBpbnN0ZWFkLiBHZXRyYW5kb20gc3lzY2FsbCB3YXMg
YWRkZWQgaW4ga2VybmVsIDMuMTcgYnkgY29tbWl0DQo+ID4gYzZlOWQ2ZjM4ODk0ICgicmFuZG9t
OiBpbnRyb2R1Y2UgZ2V0cmFuZG9tKDIpIHN5c3RlbSBjYWxsIikuIFNvIG9uIGENCj4gPiBzeXN0
ZW0gd2l0aCA0LjgrIGtlcm5lbCBhbmQgcHJlLTMuMTcgbGliYyBoZWFkZXJzIGJvdGggZ2V0cmFu
ZG9tIGFuZA0KPiA+IGRldnJhbmRvbSBjYW4ndCBiZSB1c2VkLg0KPiANCj4gV2hlcmUgd291bGQg
d2UgZmluZCBhIHN5c3RlbSB3aGVyZSB3ZSdyZSBidWlsZGluZyB3aXRoIHByZS0zLjE3IGxpYmMN
Cj4gaGVhZGVycz8NCj4gDQo+IFdlIHVwZGF0ZWQgdG8gMy4xNyBpbiAyMDE0Og0KPiANCj4gaHR0
cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQuY2dpL3Bva3kvY29tbWl0Lz9pZD1iZTUwZDFk
YzFjMDNiNzA5ZTYwZDI0OTNkZjU4OTBmNzU1Njg1MmI3DQo+IA0KPiBJZiBJIHJlbWVtYmVyIGNv
cnJlY3RseSB0aGlzIGNoYW5nZSB3YXMgYWRkZWQgdG8gYXZvaWQgcHJvYmxlbXMgd2l0aA0KPiBk
aWZmZXJlbnQgaG9zdCBPU2VzIGFuZCBJJ20gd29ycmllZCB3ZSdkIHNlZSB0aG9zZSBpc3N1ZXMg
cmV0dXJuIGlmIHdlDQo+IGNoYW5nZSB0aGluZ3MgbGlrZSB0aGlzLiBXaGlsc3QgdGhlIHN5c2Nh
bGwgbWF5IGhhdmUgYmVlbiBhZGRlZCBxdWl0ZQ0KPiBlYXJseSwgdGhlIGdsaWJjIHdyYXBwZXJz
IGZvciBpdCBhcmUgcXVpdGUgcmVjZW50IGFuZCB3aGVyZSBvdXIgc291cmNlDQo+IG9mIHByb2Js
ZW1zIHdhcy4NCg0KV2UgYnVpbGQgT0UgU0RLIHRoYXQgaGFzIHRvIHdvcmsgb24gYnVpbGQgbWFj
aGluZXMgd2l0aCBrZXJuZWxzIGZyb20NCjIuNi4zMiB0byA1LjQuIFNvIGluIG91ciBkaXN0cm8g
bmF0aXZlc2RrLWxpbnV4LWxpYmMtaGVhZGVycyBpcyBzZXQgdG8NCjIuNi4zMi4NCg0KSWYgeW91
IHRoaW5rIHRoaXMgaXMgYSByYXJlIGNhc2UgYW5kIHdvbid0IGJlIHVzZWZ1bCBmb3Igb3RoZXJz
LCB0aGVuDQppZ25vcmUgdGhlIHBhdGNoLiBJJ2xsIG92ZXJyaWRlIC0td2l0aC1yYW5kLXNlZWQg
ZnJvbSBkaXN0cm8gbGF5ZXIuDQoNCkJ1dCB0aGVuIHdlIGNhbiByZW1vdmUgLS13aXRoLXJhbmQt
c2VlZCBjb25maWd1cmF0aW9uIGZyb20gT0UtY29yZQ0KcmVjaXBlIGVudGlyZWx5LiBJdHMgY3Vy
cmVudCB2YWx1ZSAib3MsZGV2cmFuZG9tIiBpcyBlcXVpdmFsZW50IHRvIHRoZQ0KZGVmYXVsdCBj
b25maWd1cmF0aW9uLg0K
