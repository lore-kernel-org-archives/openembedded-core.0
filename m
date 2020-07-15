Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web12.2457.1594840027880835964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 12:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=i85ZCCkN;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2332; q=dns/txt; s=iport;
  t=1594840027; x=1596049627;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=niNPF21p18Xglwhmwl2U2nHsBKBoKvWHMeyjZjgUMxU=;
  b=i85ZCCkNZNrOBv8Q8FlEkaukthsFHKyngxdZTjW/IPrSkd7g3/dJj8r7
   Y5S5iId9SM8RziQHRofdBkXodw2ROBxfy7L+HNDFgejoM2ImbfjkpiDMu
   EPDxVkUrecmOVClloBCbTWB5MwhXJIiL1EgygUmicv83VW1xfPsvhoNaf
   c=;
IronPort-PHdr: =?us-ascii?q?9a23=3ALrLdlRWEcJ+lgs8Q+X8Nd2NHa4PV8LGuZFwc94?=
 =?us-ascii?q?YnhrRSc6+q45XlOgnF6O5wiEPSBNyHuf1BguvS9avnXD9I7ZWAtSUEd5pBH1?=
 =?us-ascii?q?8AhN4NlgMtSMiCFQXgLfHsYiB7eaYKVFJs83yhd0QAHsH4ag7dp3Sz6XgZHR?=
 =?us-ascii?q?CsfQZwL/7+T4jVicn/3uuu+prVNgNPgjf1Yb57IBis6wvLscxDiop5IaF3wR?=
 =?us-ascii?q?zM8XY=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C2AABsUw9f/4YNJK1gGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIFKgVJRB4FHLyyEM4NGA41KlF6EAIJTA1U?=
 =?us-ascii?q?LAQEBDAEBLQIEAQGETAIXgXICJDgTAgMBAQsBAQUBAQECAQYEbYUuCCUBC4V?=
 =?us-ascii?q?vAQEBAQIBEhERDAEBNwEPAgEIGAICJgICAjAVEAIEDgUihVADDiABnzICgTm?=
 =?us-ascii?q?IYXaBMoMBAQEFhUIYgg4JFHoqAYJpg1WGMxqBQT+DbDU+hD2DFoJgkg4BPKJ?=
 =?us-ascii?q?oCoJdmVshnzotkUmeegIEAgQFAg4BAQWBaiOBV3AVgyRQFwINgTSMajeDOop?=
 =?us-ascii?q?WdDcCBggBAQMJfI8tAQE?=
X-IronPort-AV: E=Sophos;i="5.75,356,1589241600"; 
   d="scan'208";a="513011101"
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jul 2020 19:07:06 +0000
Received: from XCH-RCD-001.cisco.com (xch-rcd-001.cisco.com [173.37.102.11])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 06FJ76uF026846
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 15 Jul 2020 19:07:06 GMT
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by XCH-RCD-001.cisco.com
 (173.37.102.11) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 15 Jul
 2020 14:07:06 -0500
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by xhs-rtp-003.cisco.com
 (64.101.210.230) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 15 Jul
 2020 15:07:05 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-002.cisco.com (173.37.227.247) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Wed, 15 Jul 2020 14:07:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFmNwCSntiFu3+LrgAL4hcbvMtFJNffAifvJ48a8qMlz1fvMZob+Q4DXf8+12ip59SrI90QE+rUdSUYlAWDRl/2/crebT/nk7RjegnlB0QqBPJVkbSW7D27jmav5frwfzOVIQfqs4RtJTOCAYglYkrTr78Mh87lJvWBcAzE5SPMjbmo+LMle0qknYxFGQoePP9IXSKb2fei1XHPPDn5CAzeoDCgD86bVMQ7RJqW0X/V6kl2HPSgsN/sUUacSqUeHaQvgtIFdCMmkASYSSzm+QpJGAEWR/d8NYqn3OFOQqJF2KOgPWAU5Bj3tyU+KV7S7ZX7I6sXpDXP7bnQq+17obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niNPF21p18Xglwhmwl2U2nHsBKBoKvWHMeyjZjgUMxU=;
 b=boc9g2ODeZJUVa464+3RN9ZvByUKCHEUQpGB8lHlvPt9ftD+kBCgdrRyosBz+WL9UC37gcjlCsyZ/CLAQKUSIpy/Vvx2b0znv8tF2RFYuVgJjSZZKA0qzlEtirxLwKihSURp4iQQ0cE1K86rGlsRajbMfRPhtOguwQhMq5wUIf2qGIqaASL3j587nDU3xqZCqAE2l4zvLVxCtWPC7iS31G1xYBcocd3QEDoCc0c4ntiHuFwmesedbBdAAjuaUZtq5ktuwrGKE5HUt5d00ZptKPrOvsBWtEHYCOfX56Z/XeBEQALD++C2x1g8anesbX6+uZ8y/h57DhGkenu09T93+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niNPF21p18Xglwhmwl2U2nHsBKBoKvWHMeyjZjgUMxU=;
 b=IPw/abQzScms3F0/JmTWfqp/nmn/RuJ6dSMKTMQz2iGxRkK9lz3aifu/q9upWAvmwVeohRuR/99J2hSpe0qC+tRcHX3Zlgx8oOycY0pG9YEoZTRoA62I5XGeodRt668H5uY8i3nT/bhzmtMfxSl2CsO4R0r9XZ6MAQKXa0vmjd0=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BYAPR11MB3832.namprd11.prod.outlook.com (2603:10b6:a03:ff::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 15 Jul
 2020 19:07:03 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 19:07:03 +0000
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
Thread-Index: AQHWVu13NisF4l9iV0Wj84HWd9Lzk6kBRyiAgAAWtICAAArnAIAAJjqAgABw6oCABFPRgIAAcc+AgAJC3AA=
Date: Wed, 15 Jul 2020 19:07:03 +0000
Message-ID: <c0ac84b3d0a784b3a2c13bb9ebb38d396b800f56.camel@cisco.com>
References: <20200710190810.1967868-1-takondra@cisco.com>
	 <CANNYZj9sJAaPdPQ2yPkN5iPBiUA9jNQ4qLSvbhxGGXja2oTR-A@mail.gmail.com>
	 <328b3757b8071e7c08776c0d6dd3a6ef8d52b089.camel@cisco.com>
	 <CANNYZj9XjuiYJH_259nxkQRupbVpMeOO81yLkkH=ugF+Bu--SQ@mail.gmail.com>
	 <ebe4c112aa8fcd03e5b6a5bea8b33b0e6c5dc5c8.camel@cisco.com>
	 <CANNYZj-7w-JCgXmtmPVc0RhO6vcfGDHAY=qV6sQv1dkU3dpB5w@mail.gmail.com>
	 <b22431239872ad61559edd53514b9be488fbfce5.camel@cisco.com>
	 <CANNYZj_gBwUh0E1YerW+RRUptFi+-TPn=jzFEfyMOPxA=dxKpA@mail.gmail.com>
In-Reply-To: <CANNYZj_gBwUh0E1YerW+RRUptFi+-TPn=jzFEfyMOPxA=dxKpA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a096340-e795-4211-c883-08d828f24285
x-ms-traffictypediagnostic: BYAPR11MB3832:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB38328F4414103E8865121C6AC87E0@BYAPR11MB3832.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JRvvEstXbkQKz8hHW6/7mIrm1yKhIZazy9RMSvrxsjUGJFJySITLIA61Y+kSzGp5I2Rak7deaWqBsyj4I0B87xP8fYGCvL6FO1flMaV39iQRuWBH4vmQYz+uW6jaTTlw3xrY3FuzGpxI1PGqWvHJvOVG0OZxGjodxhjOKEBWNih3Ls+QW4iH5yhCMrOOaOoOmaiSrGTbtXlqL6o8TBAuNtfo2W8isFVPTXnQShbMaUO2TLRlPMhb2dcWmjmVcAZHJNJWRK8sdVU6ZKOTs46ZIDwt53/sOa5qf/qIBzrTmclKRRkWP+xL/cCQiygSYauwnRe4F/QsEVlIut+aka6MMg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(66446008)(36756003)(5660300002)(66476007)(76116006)(6486002)(71200400001)(478600001)(8676002)(54906003)(6512007)(66946007)(64756008)(66556008)(2616005)(6916009)(107886003)(6506007)(86362001)(4326008)(316002)(8936002)(2906002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7CeWLseVOTvC2rFbuo+YQoFpD3fpwM4QgSDcsjViVywvcC4DEU2AFXAqzIXzI4RCwp1i7sniInhc3JxpZo7Y/hiQ+USJtZDPV9u/Lt26VjVDiuYvLndm6LgdQfziPxyxu2gMKQCwaH6x2fhMUMZJEkEaxKNs0wnvYV42qJTMMJnS94JhTDeeudn09OdmZZ6ftY1kSV/tW7u42en4eVhQgFXhRIrzUE7fLs2wY92UM6j37RCJZDJ9dlEAJZuvGFpIzHdNostP4Rx4vpcbaGw6N5wk1ezZ5TRavPp7hpqoSCkcKy2a/88+wYl05ZSziGCgwb952sJ+vftloCAStheMzX9Jw61N2XNNcPz/5jCcilm3YwueBOkMgTVShEvAJ4tmjSUjuIaG8EZd998cr3TZuA2cuf/11ljHcxHOQnJqOhr0ja4SWSIGrqqaul+BsiRm3rWWUTDaCwCcPWchZdpr5bDYWskpRU+XfqrgMVMIoETvj8KIb2JJtBTscuHZPnuVk5P9xFGzlF57FyR2tY7phg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a096340-e795-4211-c883-08d828f24285
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 19:07:03.4516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vABMFPchH8QckmOpViUt9gw4tc5rnAk5YWZY6lHz7gdPt6qlSpJSXFU6p7arxqW9d2Rpp8Xm9tvjVr70mfnJ4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3832
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.11, xch-rcd-001.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C2A0C489E23A04BA208AC69BA540B3D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTA3LTE0IGF0IDEwOjM1ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gVHVlLCAxNCBKdWwgMjAyMCBhdCAwMzo0NywgVGFyYXMgS29uZHJhdGl1ayAodGFr
b25kcmEpIDwNCj4gdGFrb25kcmFAY2lzY28uY29tPiB3cm90ZToNCj4gPiAyLiBJZiBhIHJlY2lw
ZSBuZWVkcyBweXRob24zLW5hdGl2ZSBvbmx5LCB0aGVuIGl0IGluaGVyaXRzDQo+ID4gcHl0aG9u
M25hdGl2ZSB3aGljaCBleHBvcnRzDQo+ID4gX1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU9X3N5
c2NvbmZpZ2RhdGEuDQo+ID4gVGhpcyBkb2Vzbid0IHdvcmssIGJlY2F1c2UgcHl0aG9uMy1uYXRp
dmUgd2lsbCBmYWlsIHRvDQo+ID4gZmluZCBfc3lzY29uZmlnZGF0YS5weSBpbiByZWNpcGUtc3lz
cm9vdCAoYmVjYXVzZSB0aGVyZSBpcyBubw0KPiA+IHB5dGhvbjMNCj4gPiBpbiBERVBFTkRTKS4g
QXMgYSB3b3JrYXJvdW5kIHNldmVyYWwgcmVjaXBlcyBzdGFydGVkIHRvIHVuc2V0DQo+ID4gX1BZ
VEhPTl9TWVNDT05GSUdEQVRBX05BTUUgKGdsaWIgWzFdLCBtZXNhIFsyXSwgc2NvbnMgY2xhc3Mg
WzNdKS4NCj4gDQo+IFRoaXMgaXMgbm90IHRoZSBjYXNlLiBUaGVyZSBhcmUgcGxlbnR5IG9mIHJl
Y2lwZXMgd2hpY2ggaW5oZXJpdA0KPiBweXRob24zbmF0aXZlLCBhbmQgZG8gbm90IG5lZWQgdG8g
dW5zZXQgYW55dGhpbmcuDQo+IFRoZSByZWFzb24gZ2xpYiBvciBtZXNhIGhhdmUgdG8gZG8gaXQg
aXMgdGhhdCB0aGV5IHVzZSBtZXNvbiBidWlsZA0KPiBzeXN0ZW0gdG8gZmluZCB0aGUgcHl0aG9u
MyBiaW5hcnkgKG9ubHkgdG8gcnVuDQo+IHNvbWUgc2NyaXB0czsgdGFyZ2V0IGNvbmZpZ3VyYXRp
b24gaXMgbm90IHVzZWQpLCBhbmQgbWVzb24gYWx3YXlzDQo+IHByb2JlcyBpbnRvIHRhcmdldCBj
b25maWcsIGV2ZW4gd2hlbiB0aGF0IGNvbmZpZyBpcw0KPiBzaW1wbHkgdGhyb3duIGF3YXkuIEFk
ZGluZyB0YXJnZXQgcHl0aG9uMyB0byBERVBFTkRTIGlzIHVuZGVzaXJhYmxlDQo+IGFzIHRoYXQg
d2lsbCBsZW5ndGhlbiB0aGUgYnVpbGQgZGVwZW5kZW5jeSBjaGFpbg0KPiB3aXRob3V0IGFueSBh
Y3R1YWwgbmVlZCBmb3IgdGhlIHRhcmdldCBweXRob24zLg0KDQpSaWdodC4uLiwgbXkgdGVzdGNh
c2UgaGFkIHN5c2NvbmZpZyBpbnZvY2F0aW9uLiBTbyB0aGUgY29ycmVjdA0Kc3RhdGVtZW50IHdv
dWxkIGJlOiBzeXNjb25maWcgaW4gcHl0aG9uM25hdGl2ZSBkb2Vzbid0IHdvcmsgdW5sZXNzDQpw
eXRob24zIGlzIGluIERFUEVORFMuDQoNCj4gDQo+ID4gQ2hyaXMnIGFwcHJvYWNoIFs2XSB3b3Vs
ZCBhZGRyZXNzIGNhc2UgIzMsIGJ1dCBub3QgIzIuIEknbSBub3Qgc3VyZQ0KPiA+IHlldA0KPiA+
IHdoYXQgaXMgdGhlIGJlc3Qgd2F5IHRvIGFkZHJlc3MgIzIuIE1heWJlIGV4cG9ydA0KPiA+IF9Q
WVRIT05fU1lTQ09ORklHREFUQV9OQU1FIG9ubHkgaWYgREVQRU5EUyBoYXMgcHl0aG9uMz8NCj4g
DQo+IEkgYW0gbm90IHN1cmUgZWl0aGVyLiBJIGRvIG5vdCBoYXZlIGEgY2xlYXIgaWRlYSBob3cg
dG8gc29ydCB0aGlzDQo+IG1lc3MuIE1heWJlIHdlIHNob3VsZCB0YWxrIHRvIHB5dGhvbiB1cHN0
cmVhbSBhbmQgYXNrDQo+IGhvdyBjcm9zcy1jb21waWxhdGlvbiBpcyBzdXBwb3NlZCB0byB3b3Jr
Lg0KDQpUaGFua3MsIEknbGwgdHJ5IHRvIGxvb2sgaW50byB0aGlzIGRlZXBlci4NCg==
