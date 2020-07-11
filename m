Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web10.1150.1594429128907682123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 17:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=Unf2ozfn;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1180; q=dns/txt; s=iport;
  t=1594429129; x=1595638729;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Vjf6subL6BLURIvLx+cQPWS6QAg07ZEDL2MNnK/ERNQ=;
  b=Unf2ozfnNDnAOWhJbIhkQkKSdywYfCvInB4oPDdq9FEJ7cqnNE6SzLi/
   m7CP+t+8wDDw9eBpKv0svVyQ5j/u3ODBjvuuLkKUcYT0wV8iiZEOi/UiT
   OlmWhYZmC+5G2KQskN0a9GbqrLqV/oh7s0vqUbEfyJphimSpNYi+Wi3uf
   Q=;
X-IPAS-Result: =?us-ascii?q?A0C2AABlDglf/51dJa1gGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIFKgVJRB4FHLyyEM4NGA41QlF6Df4JTA1ULAQEBDAEBLQIEA?=
 =?us-ascii?q?QGETQIXgX8CJDgTAgMBAQEDAgMBAQEBBQEBAQIBBgRthVsBC4VwAQEEEhERD?=
 =?us-ascii?q?AEBNwEPAgEIGAICJgICAjAVEAIEDgUihVADLgGeQgKBOYhhdoEygwEBAQWFO?=
 =?us-ascii?q?hiCDgkUeioBgmmDVIYzGoFBP4NsNT6HU4JgkgM9olsKgl2ZVSCfJi2RN55vA?=
 =?us-ascii?q?gQCBAUCDgEBBYFqI4FXcBWDJFAXAg2OHjeDOopWdDcCBggBAQMJfI57AQE?=
IronPort-PHdr: =?us-ascii?q?9a23=3AKkh4QRXG/ZKSCDIuavc8foj2yMTV8LGuZFwc94?=
 =?us-ascii?q?YnhrRSc6+q45XlOgnF6O5wiEPSBNyHuf1BguvS9avnXD9I7ZWAtSUEd5pBH1?=
 =?us-ascii?q?8AhN4NlgMtSMiCFQXgLfHsYiB7eaYKVFJs83yhd0QAHsH4ag7dp3Sz6XgZHR?=
 =?us-ascii?q?CsfQZwL/7+T4jVicn/3uuu+prVNgNPgjf1Yb57IBis6wvLscxDiop5IaF3wR?=
 =?us-ascii?q?zM8XY=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.75,337,1589241600"; 
   d="scan'208";a="502237072"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Jul 2020 00:58:48 +0000
Received: from XCH-ALN-001.cisco.com (xch-aln-001.cisco.com [173.36.7.11])
	by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id 06B0wlN6027749
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 11 Jul 2020 00:58:48 GMT
Received: from xhs-rcd-001.cisco.com (173.37.227.246) by XCH-ALN-001.cisco.com
 (173.36.7.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 19:58:47 -0500
Received: from xhs-aln-002.cisco.com (173.37.135.119) by xhs-rcd-001.cisco.com
 (173.37.227.246) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 19:58:47 -0500
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-002.cisco.com (173.37.135.119) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 10 Jul 2020 19:58:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gX1MkylwgmOTFJwERDr+jV42isweMeDhTDFFiz7CbxR/XDdS1l1oql6VsT29ThtcUD8OiANVIihuwBbc945Cg0xdjf/qm5wLUKrzeB90ojfX1rZ5drZQ5Cq1g9QEyTp+JJ6zQP0uTAArwZrM/h9fA08mnB6AqjkSCP7KtfJvdjbZP1qmkqkWtDLcksfoHvh0G9EdQywKZJ4UBSeVxOv+yKFwA9RwI3g59WY48FXjYnrdNo6SLJ5E/E+9h0vLgSHTMqOeMhCAMB+KWN5VP5qLhLLWKf+HpX/GUl8ubuabTubue7bLWKagSNZ3emX+nwUGK80QhnMsti2uroIipAsGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vjf6subL6BLURIvLx+cQPWS6QAg07ZEDL2MNnK/ERNQ=;
 b=LswKoGlURG2yo20Wlf0fA0UN866K5V7EUEj9OM24QT+flKW/aOaMFzYwIZgg+/yhKErbUtgA24wWr623lAS66qYH8yqpoK1ElBCZzSurII7dMN2kKJAExkThiGwZvn5eQRsUqw5ddNGiVKuGkG/9pWnoj+iplK8aUuL2LPnsAxoYjxu0l+SXw3QdZ1OXbxGYiqjo9l9TSHNLQgTUolYa47tKLcfljEKlbxO3fkV03KYMEDwla55eF27jaUiaw1pFiOfSjZlhGXSBsCi4p/Mt7AXk/wJ/IO3lhzv6MGc7e8PVj5MvKbHqvGVwU4c1b1mk2pHm/L9iDfzdnJyiTTcCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vjf6subL6BLURIvLx+cQPWS6QAg07ZEDL2MNnK/ERNQ=;
 b=r6U1d0hxp2N9Tp6nPgwMon8obrO9V7Kbko/6NMVeNFNrUF9HVPSUVgWhEpnmFyWdOudn6GL+wTUExbAB87O4FgFFJ9SQsWlf0ak6PA8LeVXNC4ST6oZ8qjnncULaubN1QUkSfvA3qdC15zWtZqttWwFzrl2Df9gvYwJugaRk6jE=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BY5PR11MB4209.namprd11.prod.outlook.com (2603:10b6:a03:1cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Sat, 11 Jul
 2020 00:58:45 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.021; Sat, 11 Jul 2020
 00:58:45 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Martin.Jansa@gmail.com"
	<Martin.Jansa@gmail.com>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME to fix do_unpack
Thread-Topic: [OE-core] [RFC PATCH] devtool: remove _PYTHON_SYSCONFIGDATA_NAME
 to fix do_unpack
Thread-Index: AQHWVu13NisF4l9iV0Wj84HWd9Lzk6kBRyiAgAAWtICAAArnAIAAJjqA
Date: Sat, 11 Jul 2020 00:58:45 +0000
Message-ID: <ebe4c112aa8fcd03e5b6a5bea8b33b0e6c5dc5c8.camel@cisco.com>
References: <20200710190810.1967868-1-takondra@cisco.com>
	 <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
	 <328b3757b8071e7c08776c0d6dd3a6ef8d52b089.camel@cisco.com>
	 <CANNYZj9XjuiYJH_259nxkQRupbVpMeOO81yLkkH=ugF+Bu--SQ@mail.gmail.com>
In-Reply-To: <CANNYZj9XjuiYJH_259nxkQRupbVpMeOO81yLkkH=ugF+Bu--SQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18c8bdd4-b913-48c2-6121-08d825359008
x-ms-traffictypediagnostic: BY5PR11MB4209:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB420994DDF39A9A51C524A745C8620@BY5PR11MB4209.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:422;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uqG96rHBSX4axEJRJ5hW/o5qz4xFcG7SkwOBG9IXAghpMsSxNmMFtau94KTIltWYzLkD3YKQSGE0vCObgzUFiVr3O8xqAO4LEZE4I237ZkRjSyjGFa46LTQetZVIRfMfitvP30htn2v4GY7DSxm4AVsO99uyVr87RVhWDwRpot65MWgX/uJ24c18zpwZKGwCq3ijiKIbewP44mwvTaKSN62NBdI+yO7fX0kaErg/OMhV9ElFJ/vTDtzdp/3vqmoBxoIaSSpmb1ud0LABJwFo7sm0SG1ZfFZOuOiV5WouksXetrGn9Gy5T2W81FAYKPGKPjWDaNIxIYXl3nVA7QY9xw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(66446008)(64756008)(66476007)(66556008)(107886003)(6916009)(86362001)(2616005)(316002)(8676002)(5660300002)(54906003)(76116006)(4744005)(66946007)(36756003)(6506007)(71200400001)(4326008)(2906002)(8936002)(6512007)(478600001)(186003)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: aMkKOJOt8d+fQg74gWQfNrNF9ujAY80724viWnVn8xhnq3LZVWzEl3kpCvN++WVFPuVFnm9PNkwktTqMfkMn9517O2NM3mMFyzYpn641WOwbLTe3uz/HrwW9Y8jxcgx/vBon7fRRoBE0G7DrNF8igZqXkTPl645Ie+GYxun1T8LuhXAESxriPMLz6fvBP1K3oZCHKA9SO7sisFtQRxnOq+QSKXMoz4Qq8BTWpP2+UvH45XvjXA8TlcHu4LcvhmuCd1/a9r3MNlI3/YQtJx5oH+gwkHsNnq2Cf+24IjdxZuzwVZfPmRQCY5yYJMjNlf0RQ4ZAkjUBR2WjpLVjfsjN246+XAb2pfY0QbsnYazEiuJoOeYS9MyK8IkwF2qMz2mBlXK79Mml1r8JWlHrDNB1oxg2lPai34fWrw3PvyqQ2NhT4G/vrpznnqtwtC63z4MaXK1tyvVwmLNHa5kuyk2itbmQIsUvQiMetOplCWHGNpQoC16t+MxXxfa2v82gdGstTEvbR+bbI2Fhmb2kW++X/w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c8bdd4-b913-48c2-6121-08d825359008
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2020 00:58:45.1858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lkFBlBMLYCwTNHpLDUxtRt3y/3tG2ql3aYUAVyCXvH12+aOsHoOwCjp9DLsutaZlcmzqRwolv+5RthjEWDBaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4209
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.11, xch-aln-001.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FAE813F46B66B40876B021111BECD16@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDIwLTA3LTExIGF0IDAwOjQxICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gU2F0LCAxMSBKdWwgMjAyMCBhdCAwMDowMywgVGFyYXMgS29uZHJhdGl1ayAodGFr
b25kcmEpIDwNCj4gdGFrb25kcmFAY2lzY28uY29tPiB3cm90ZToNCj4gPiBUaGUgb25seSByZXBs
YWNlZCBwYXJhbWV0ZXJzIHNlZW1zIHRvIGJlIHJlcGxhY2VkIHdpdGggd3JvbmcNCj4gPiB2YWx1
ZXMuIEFsc28NCj4gPiBGSVhNRVNUQUdJTkdESVJIT1NUIHdpbGwgcG9pbnQgdG8gcmVjaXBlLXN5
c3Jvb3QtbmF0aXZlIHdoaWNoIGlzDQo+ID4gbm90DQo+ID4gdGFyZ2V0LXNwZWNpZmljLiBXaGF0
IGFtIEkgbWlzc2luZz8NCj4gDQo+IFlvdSBhcmUgY29tcGFyaW5nIHdpdGggX3N5c2NvbmZpZ2Rh
dGEgZnJvbSBuYXRpdmUgc3lzcm9vdC4gWW91IG5lZWQNCj4gdG8gdGFrZSBfc3lzY29uZmlnZGF0
YSBmcm9tIHRhcmdldCBzeXNyb290LCBhbmQgdGhlbiB5b3Ugd2lsbCBzZWUNCj4gcXVpdGUgYSBm
ZXcgYXJjaC1zcGVjaWZpYyBkaWZmZXJlbmNlcy4NCg0KT2gsIHRoYW5rcy4gTm93IGl0IG1ha2Vz
IGEgYml0IG1vcmUgc2Vuc2UuIEkgZGlkbid0IHJlYWxpemUgdGhhdA0KcHl0aG9uM25hdGl2ZSBj
bGFzcyB1c2VzIHRhcmdldC1zcGVjaWZpYyBjb25maWd1cmF0aW9uIGFuZCB0YXJnZXQNCnN5c3Jv
b3QuIFNob3VsZG4ndCBpdCBiZSBjYWxsZWQgc29tZXRoaW5nIGxpa2UgcHl0aG9uM2Nyb3NzIHRo
ZW4/DQoNCk5vdyBuZWVkIHRvIGZpZ3VyZSBvdXQgaG93IHRvIHByZXZlbnQgX1BZVEhPTl9TWVND
T05GSUdEQVRBX05BTUUgZnJvbQ0KcHl0aG9uM25hdGl2ZSBibGVlZGluZyBpbnRvIG90aGVyIHRv
b2xzLg0K
