Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web11.3468.1594852233337759613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 15:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=bohlOP2W;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2702; q=dns/txt; s=iport;
  t=1594852233; x=1596061833;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=giA54NdhIvTX4k79pmNimBoS/ZmbLUBETFR11M+S6lk=;
  b=bohlOP2WpANp5YTFnnC97bX55rDHuhOuk+1TS7HAZUDO/elJwsXA8ZNG
   YUYQJ10S1uxUHW/Mhvx3C3Ubx1W9wKAX+rT8xeFZ5wSjc1H8OBwXbvvef
   gzrpVRQ3AOvkVix+uzJ4qXJ9unbo7OM1WwjOZ9QO7qucZJT2iq3soDImb
   Q=;
IronPort-PHdr: =?us-ascii?q?9a23=3Az8INphTm1WYCxt0DnGJLuDfvMNpsv++ubAcI9p?=
 =?us-ascii?q?oqja5Pea2//pPkeVbS/uhpkESQBtuJ7/NClvrYtL3mVWUc4JGH9ncYf88EWx?=
 =?us-ascii?q?wEjJAQmAotSI6ABFbgJfHnJyo9AIxZVVBj8n36VCodGMv3a1DI5HHn6zkUF0?=
 =?us-ascii?q?b7NAxoNuryB4jehti20Ob0/IfcME1EgTOnauZ0KxO75QzaqsgRh95kLaA8r3?=
 =?us-ascii?q?mBonZBd+lMg21yIlfGlBfn7cD295lmoCk=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ArAABCgw9f/4ENJK1gGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIE5AgEBAQELAYFRUQeBRy8shDODRgONR5h?=
 =?us-ascii?q?eglMDVQsBAQEMAQEtAgQBAYFWgnYCF4FyAiQ3Bg4CAwEBCwEBBQEBAQIBBgR?=
 =?us-ascii?q?thVsMhW8BAQEBAgESEREMAQE3AQ8CAQgYAgImAgICMBUQAgQBDQUihVADDiA?=
 =?us-ascii?q?Bn2YCgTmIYXaBMoMBAQEFhTMYgg4JFHoqAYJpg1WGMxqBQT+DI34+hD2DFoJ?=
 =?us-ascii?q?gkkuiaAqCXZlbIZ86kXaeegIEAgQFAg4BAQWBaSSBV3AVgyRQFwINjh6DcYp?=
 =?us-ascii?q?WdDcCBggBAQMJfI8tAQE?=
X-IronPort-AV: E=Sophos;i="5.75,357,1589241600"; 
   d="scan'208";a="788908808"
Received: from alln-core-9.cisco.com ([173.36.13.129])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jul 2020 22:30:11 +0000
Received: from XCH-ALN-003.cisco.com (xch-aln-003.cisco.com [173.36.7.13])
	by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 06FMUBmj007066
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 15 Jul 2020 22:30:11 GMT
Received: from xhs-aln-003.cisco.com (173.37.135.120) by XCH-ALN-003.cisco.com
 (173.36.7.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 15 Jul
 2020 17:30:11 -0500
Received: from xhs-aln-001.cisco.com (173.37.135.118) by xhs-aln-003.cisco.com
 (173.37.135.120) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 15 Jul
 2020 17:30:11 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-001.cisco.com (173.37.135.118) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 15 Jul 2020 17:30:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZL8FVdMEKBLbz25eClofkK55o1zJ2neNUwsrEu6NR73My9fQ4b3oRY4IJah8XsWr6O5dJh9hi7b7jI0Yq1gy6RazJRryal6rrQ2ulrxa7PrDxipy6iJj1b3SMEG1cMbIWW9NnhemTT33EQ+ExgqxpOXn0CW9TgHHKFHG1nTm8cH1l/LATRKhy0afhA8KgXdB1Tl0n+LJ/J//97TvTH4jTIg/gxpnsffg/xqC35WThKlV/yaEPzGwbhb+SsQFATlEiturxiQlhqIvaW7cD3NZ44iJp+jhvye7CQMGaYtVY8a45bJGiIxVEH4Hbl9gy+2afAL/ecwf/c3UP4xhTAk3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giA54NdhIvTX4k79pmNimBoS/ZmbLUBETFR11M+S6lk=;
 b=HaGgn9O9wrp3ug8qseFgDIhNy0Y45Xy5DPbGvqm/556acF1G3OLlt3We+VJD7OX+7YPL0n3oLmqDpuj1tD/GM2QMzRGJx8bj3hJCujh52pKm104L2uXk2mvur+DLa+TIeRUSijvaJlwQyaAeksuK9KGOe0efuob6ky4mGaVZcARATCpOdVn7gCybjA68EjIWhqaSlf41Dsuler2G74/YMajQSir/Q8dRjDLC7Ovz458mM9v2KTO0xtVqClCY8fZ9HHsiMZedgKUDBZMFove4OJgh1OAa5WvXTPuEJWcX4AjfLkpdqpzmTdUXcS1vaxDn27HNzlSxnNmTU4XxqgDACA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giA54NdhIvTX4k79pmNimBoS/ZmbLUBETFR11M+S6lk=;
 b=L/euLkjc1K9ofmIt13XHUZTHT+Pedzd/AURNaX7gwmUi2ggncHyQtZNwrUjrt9eC3RMN1UVLitEyiWYyEd6VHTvVpXqXi7TeAObf2gMYJUjcWmGvcJ4iNKECywzPWzTBTBlsiOndaoLufXXqAj8Q59pAmPgG/U5aO2PzcJfMGH4=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BYAPR11MB3462.namprd11.prod.outlook.com (2603:10b6:a03:76::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Wed, 15 Jul
 2020 22:30:08 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 22:30:08 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [PATCH] qemu: use host pkg-config only when host provides sdl
Thread-Topic: [OE-core] [PATCH] qemu: use host pkg-config only when host
 provides sdl
Thread-Index: AQHWWJRxH/6t7cQ1402drhAd4BrpmakIX86AgACEY4CAAAP+AIAAGVwAgAAXSYCAACT9AA==
Date: Wed, 15 Jul 2020 22:30:08 +0000
Message-ID: <19077afe942992f1fbbe35975c9d6c11f2369e3f.camel@cisco.com>
References: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com>
	 <20200712213551.2206605-1-takondra@cisco.com>
	 <CANNYZj8QBo7X5qoq3yse8rO3qh47_zTWkm6hkRUng2hHmj+c_w@mail.gmail.com>
	 <0cef3914ade47872815423de749d0885759d24e8.camel@cisco.com>
	 <CANNYZj-5OJTK7OZ0MHvdiHuWdEAykbG0SKbkxaQjYQpqkgQzqw@mail.gmail.com>
	 <b2d458f64f65890e3fa30644b4c18f7dcd74dddf.camel@cisco.com>
	 <621447751555a369f45f76a033ff743612d580f5.camel@linuxfoundation.org>
In-Reply-To: <621447751555a369f45f76a033ff743612d580f5.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: 9720bf55-1bd8-4e8d-22c1-08d8290ea176
x-ms-traffictypediagnostic: BYAPR11MB3462:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB34626C179253341EED91FA90C87E0@BYAPR11MB3462.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bNco5zztB1/9e8VMg6SrjjiZRgZhPBFKgp6vODHGIVB+A1KiiWQcufwtXsTzhZzkXcXksmCzZl3/PAn7sXhfUPEzyJagfOkT8Nc9rzjhqeZfs8It3IW/rXEsuLbeQhvCnV30usIKWk7ot5RzTLLMx7GcLBNxf9XisufpRBAPtH9Hvr8M7jCSXkwjbyCf++mVr/b4UkXOTHKy3jibDfoUaBrqOAh64wT8icZW0Flue1sNHzCxYLc5THF0BfGPmd2+DlvdhAqob/tGQWA+b0D8eWhKIFD1WS8kZc98CtY1jxuW0HwtFgZ4tN1uU8zRVUn+EtUfYMV89aYqxdJ4HrulBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(2906002)(316002)(66476007)(66556008)(6512007)(64756008)(2616005)(186003)(66446008)(86362001)(478600001)(5660300002)(66946007)(76116006)(54906003)(71200400001)(8936002)(8676002)(6486002)(36756003)(4326008)(6506007)(110136005)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: eczg5JUy0t8EWnO6can7afDyxmyhhC8H1/hazL/n8AqiHBkC0z5qwELeIXxC7tJkWg1afo/VF0pp44+jAtxoAb2mIdEbgoP8Twl96frp+an/F7SvyYqCnlRP4sCyC3NlGfnvG8yQ2O0G4+NjloBKeHMtCH0Ox0FSLcYU3Zo8go1EtSeHVZnMF7IIlvyP4zoSlwrY4xE0m6hSGxKLUZ2MMas+pbOdyGBXSSf3dSWUGx5SjGrAKaXWGbnn6+Xi4O8RJmZdoNrXa9AlJWLjGdQt01Hqf/ysD2NJTqxfaDLrxA1m5gt8F+7Uv4T7wC85T7ZSJaB13GRPMb3wBuuk+c2YmH32wE1/8N3wl66ttj6RwuVc7IZfwi6lkgopPp2lh7+nd3Qcd0Mnw519tXGRPweUl5GlVhTiuK6Jplt7vRMC3FX1GfCU9Ysd3iZHw9Dc8epksSeJIAk9b4BQAMuHWFJrQp2Kf3rTCtoLHJ5gc1DcSvYmAKLiC0v3mcyocBQwQvsG33LZ2uIAnKMcMVgXbzezdg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9720bf55-1bd8-4e8d-22c1-08d8290ea176
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 22:30:08.6111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhBOMxBe5sfQcZajIxefKk17Zturc4+T/k9p4JxHsAZi4X5aTBLtgOjRcn8Wu3++pioNsw8WmdsG5RuRqhhFqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3462
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.13, xch-aln-003.cisco.com
X-Outbound-Node: alln-core-9.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7746761DBB7C4244935AE8019F3219BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA3LTE1IGF0IDIxOjE3ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gV2VkLCAyMDIwLTA3LTE1IGF0IDE4OjU0ICswMDAwLCBUYXJhcyBLb25kcmF0aXVrICh0
YWtvbmRyYSkgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDIwLTA3LTE1IGF0IDE5OjIzICswMjAwLCBB
bGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgMTUgSnVsIDIwMjAgYXQgMTk6
MDksIFRhcmFzIEtvbmRyYXRpdWsgKHRha29uZHJhKSA8DQo+ID4gPiB0YWtvbmRyYUBjaXNjby5j
b20+IHdyb3RlOg0KPiA+IFBBQ0tBR0VDT05GSUcgaW1wcm92ZXMgZGV0ZXJtaW5pc20sIGJ1dCBp
dCBpcyBub3Qgc3VmZmljaWVudC4gSXQgaXMNCj4gPiBub3QNCj4gPiBmZWFzaWJsZSB0byBtYWtl
IHN1cmUgdGhhdCBQQUNLQUdFQ09ORklHcyBjb3ZlciBhbGwgY29uZmlndXJhdGlvbnMuDQo+ID4g
VGhlcmUgd2lsbCBiZSBhbHdheXMgc29tZXRoaW5nIHRoYXQgc2xpcHMgdGhyb3VnaC4gSSB0aGlu
aw0KPiA+IGFja25vd2xlZGdpbmcgdGhpcyBmYWN0IHdhcyBvbmUgb2YgdGhlIHJlYXNvbnMgZm9y
IHJlY2lwZS1zcGVjaWZpYw0KPiA+IHN5c3Jvb3RzLg0KPiANCj4gV2UgYXJlIHN1cHBvc2VkIHRv
IGhhdmUgUEFDS0FHRUNPTkZJRyBmb3IgYWxsIHRoZSBvcHRpb25zIGEgZ2l2ZW4gYml0DQo+IG9m
IHNvZnR3YXJlIGhhcy4gU2V0dGluZyB0aG9zZSBvcHRpb25zIGlzIG1lYW50IHRvIGJlIGRldGVy
bWluaXN0aWMuDQo+IEkNCj4gYXBwcmVjaWF0ZSB0aGF0IHNvbWUgcmVjaXBlcyBkb24ndCBoYXZl
IGNvbXBsZXRlIGNvdmVyYWdlIGJ1dCB0aGV5DQo+IHNob3VsZCBoYXZlLg0KPiANCj4gUmVjaXBl
IHNwZWNpZmljIHN5c3Jvb3RzIGlzIHRoZXJlIGFzIGFuIGV4dHJhIGxheWVyIG9mIHByb3RlY3Rp
b24gYnV0DQo+IGl0IGRvZXNuJ3QgbWVhbiBQQUNLQUdFQ09ORklHIHNob3VsZG4ndCBiZSBzcGVj
aWZpZWQgb3Igd29ya2luZy4gUlNTDQo+IHdhcyBhZGRlZCBmb3IgbXVsdGlwbGUgcmVhc29ucywg
dGhpcyBpcyBvbmx5IGEgc21hbGwgcGllY2Ugb2YgaXQuDQoNCkkgdGhpbmsgd2UgYXJlIG9uIHRo
ZSBzYW1lIHBhZ2UgaGVyZS4gSWRlYWxseSByZWNpcGVzIHNob3VsZCBoYXZlIGFsbA0KY29uZmln
cyBjb3ZlcmVkIGJ5IFBBQ0tBR0VDT05GSUcsIGJ1dCBpbiBwcmFjdGljZSB0aGUgZXh0cmEgbGF5
ZXIgb2YNCnByb3RlY3Rpb24gaXMgbmVlZGVkLg0KDQo+ID4gV2UgdXNlIGJ1aWxkdG9vbHMgdGFy
YmFsbCB0byBiZXR0ZXIgaXNvbGF0ZSBPRSBidWlsZCBmcm9tIGhvc3QNCj4gPiBlbnZpcm9ubWVu
dCBhbmQgaW1wcm92ZSBkZXRlcm1pbmlzbS4gSG9zdCBwa2ctY29uZmlnIG9wZW5zIGEgYmlnDQo+
ID4gaG9sZQ0KPiA+IGZvciBub24tZGV0ZXJtaW5pc20gYW5kIHBsdWdnaW5nIGl0IHdpdGggUEFD
S0FHRUNPTkZJR3Mgc2VlbXMNCj4gPiBmcmFnaWxlLg0KPiANCj4gWW91IG1ha2UgdGhpcyBzb3Vu
ZCBsaWtlIHdlIGRvIHRoYXQgYSBsb3QsIHdlIGRvbid0LiBUaGVyZSBhcmUgc29tZQ0KPiBpc29s
YXRlZCBhbmQgdmVyeSBzcGVjaWZpYyBjYXNlcy4gRW5zdXJpbmcgdGhlIFBBQ0tBR0VDT05GSUcg
aGFuZGxpbmcNCj4gaW4gdGhvc2UgY2FzZXMgaXMgY29ycmVjdCBzaG91bGQgYmUgbWFuYWdhYmxl
Lg0KPiANCj4gVGhlIHF1ZXN0aW9uIGlzIHRoZXJlZm9yZSB3aGV0aGVyIHRoZXJlIGlzIGEgcHJv
YmxlbSB3aXRoDQo+IFBBQ0tBR0VDT05GSUcNCj4gaW4gbWFzdGVyLiBJIGFwcHJlY2lhdGUgemV1
cyBtYXkgaGF2ZSBhIGJpZ2dlciBpc3N1ZS4NCg0KUmlnaHQgbm93IG1hc3RlciBzaG91bGQgbm90
IGhhdmUgdGhpcyBzcGVjaWZpYyBpc3N1ZSB3aXRoIHhrYmNvbW1vbi4NCkJ1dCBJJ20gbm90IHN1
cmUgSSd2ZSBnb3QgeW91ciBwb2ludC4gRG8geW91IHdhbnQgdG8gcmVseSBvbg0KUEFDS0FHRUNP
TkZJR3MgYmVpbmcgcGVyZmVjdCBpbiB0aGlzIGNhc2U/DQo=
