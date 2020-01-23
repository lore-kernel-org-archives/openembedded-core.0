Return-Path: <chee.yang.lee@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id AD11C915D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:51:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2020 21:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,352,1574150400"; d="scan'208";a="400237085"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by orsmga005.jf.intel.com with ESMTP; 22 Jan 2020 21:51:22 -0800
Received: from orsmsx113.amr.corp.intel.com (10.22.240.9) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 22 Jan 2020 21:51:22 -0800
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
	ORSMSX113.amr.corp.intel.com (10.22.240.9) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 22 Jan 2020 21:51:21 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
	by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 22 Jan 2020 21:51:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=I6KiYU4J7YNxR9DDvMzp75Hn1IvSQt+ojaivbHDlANBNblyxvHekuhCinTd+7VK/u7wxwGb96OpxK765tAUSI6NdGnOI5W9AT8sQQLS/Dd1wms3iRASE2GDZ3Dv0HifU28pXKY8CWEC2++S8J4JZ/KT0Jn0miqvjv4TF4GzQEQWSu37YdrskaInYTtCkdFnmygXWWONz6vMrnPvTNCcTZqppNs+08p1/yplo2m7Z26uvVuf378FWLmr31I/LmT1jmWA5PCBkWRD82QYC2//Q/jEabNoN8RgHKM8jSftQ0ExeJ0hDvkPdCVREUqXStmBElv6Ms/U+IUgIoGoR3UpakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3bqoJAjeSkiY8mwbhtJCzO6mjCvUz9EBzfLmdoHsvoY=;
	b=dFEMbiwymhkAJ9sUysWubr7Ob/9vmRLWIsT/7IjF3ibJGT+Ci9Z4VbpjQ8jkan5ujw4XSU2S+CB+GE2u0/pgt2mFxyK8I5h1O+z/qnyLIglPjP7WqZbACc6Z3+2lWimr0jqNxvBnhVaYiJdNQqI4awDPJcC0xph7PXo36f0F+yKjzTuf+vr3ijXFOsaO4XiJXyyMu0M9/wM75RNs7YGDGgi4dYn0yZYfxsOXgUzlp2gdD0NSu19fsVhEyUY82126LJnx8sj9sFnXc4I5aGaFyhDKpe+Wik2k5DM/b6s5k3MG04K0AhZbApEMDG6AgZp7B8SFFUvnRSIbp3zMr+k+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com; 
	dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector2-intel-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3bqoJAjeSkiY8mwbhtJCzO6mjCvUz9EBzfLmdoHsvoY=;
	b=Be7o+M2vBdavld01Q69NQabbu1mNJHTOtYKw2Nud0FtbOlaQbaUiQUwGM6bP2f2Wp9jS7FAcVkK2zbVyFJus5Pey54iAh32NQ18+izzQoRKNyunoF8zQ1DTiGVMww3B31r9a8Ouhkdal5KLDv57cc//ydRPYTDqEDVtNoxf4F8k=
Received: from BN6PR11MB3985.namprd11.prod.outlook.com (10.255.129.78) by
	BN6PR11MB4097.namprd11.prod.outlook.com (10.255.130.33) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.20; Thu, 23 Jan 2020 05:51:19 +0000
Received: from BN6PR11MB3985.namprd11.prod.outlook.com
	([fe80::584d:cea5:1dfc:7e61]) by
	BN6PR11MB3985.namprd11.prod.outlook.com
	([fe80::584d:cea5:1dfc:7e61%3]) with mapi id 15.20.2644.028;
	Thu, 23 Jan 2020 05:51:19 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH][zeus] libxml2: Fix CVE-2019-19956
Thread-Index: AQHV0ZNYjIdTTaCTqE6fEgoY2Eantaf3vYqAgAAAnJA=
Date: Thu, 23 Jan 2020 05:51:18 +0000
Message-ID: <BN6PR11MB3985206C00F0351BEEDC291AB90F0@BN6PR11MB3985.namprd11.prod.outlook.com>
References: <1579745387-74550-1-git-send-email-chee.yang.lee@intel.com>
	<0455c3fb-6dd0-ec89-0c33-57bd54aedf61@gmail.com>
In-Reply-To: <0455c3fb-6dd0-ec89-0c33-57bd54aedf61@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chee.yang.lee@intel.com; 
x-originating-ip: [192.198.147.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e8376f7-0d0c-4f7b-edce-08d79fc844ac
x-ms-traffictypediagnostic: BN6PR11MB4097:
x-microsoft-antispam-prvs: <BN6PR11MB409747192C03A74BBDFB91E7B90F0@BN6PR11MB4097.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:576;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(71200400001)(8936002)(8676002)(19627235002)(81166006)(81156014)(186003)(966005)(86362001)(26005)(110136005)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007)(316002)(6506007)(53546011)(2906002)(5660300002)(52536014)(55016002)(7696005)(9686003)(33656002)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR11MB4097;
	H:BN6PR11MB3985.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PqvjPZqh/A8TfbyO5OZEm7T2nPlW8iC1KjOd2MrLuUqYC4FimoiRC2fg+Dvh5TaOIVDgxRN7hQdr78n/2F3ldw7HO6IaaybaeSID16H7LhwhR7Wq3a8IwSs0/EtCa1IscM25T6VIV757ZWjKQnhO/F/tAieTsCprrFHGKKFuRLoXSfLidY2KjvBMgxTkmVVPYsCrZXv+irj5LQ54iIAM2d5ijiLlsho8PTN1I7V6YDvamobS9wd2iN+hzHek8GN9fMrlbRrkeojrb1xOP6EcrErGGYW4qmby9d56lSVEnPtje6uWJEizfCCGYEpl0izmdVCjdvZAEHuG9McTS5CL64KP406dbfqtDhFeX6JBVuWn8uqXajCeJEfC3GbDSYy0gnUhm8aPDpVXqbxsVy6S4LRWbH5zYqhLwyHqqwRmZ801WvRYr992rhRbhoS1cPwXlGhCj4JRc7oTsBTbaipEELhr9GYf/NBi9umxTQ/cKXFzD7zhYI4pAqQ6eAjbMI/GQsQPQnymAOdadTIQ69x9cw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8376f7-0d0c-4f7b-edce-08d79fc844ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 05:51:18.9834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N3u52rEl2cp9m33xed6ocHD5kegLy8bM89iGWaooDgmf1xXQnt+1onYVIIoBrlwTK9rzqtCvcNfyS5K+3Y1j2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4097
X-OriginatorOrg: intel.com
Subject: Re: [PATCH][zeus] libxml2: Fix CVE-2019-19956
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
X-List-Received-Date: Thu, 23 Jan 2020 05:51:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBwYXRjaCBhbHJlYWR5IGluIDIuOS4xMA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFpbC5jb20+IA0KU2VudDogVGh1cnNk
YXksIEphbnVhcnkgMjMsIDIwMjAgMTo0NiBQTQ0KVG86IExlZSwgQ2hlZSBZYW5nIDxjaGVlLnlh
bmcubGVlQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXVt6ZXVzXSBsaWJ4bWwyOiBGaXggQ1ZF
LTIwMTktMTk5NTYNCg0KDQoNCk9uIDEvMjIvMjAgNjowOSBQTSwgY2hlZS55YW5nLmxlZUBpbnRl
bC5jb20gd3JvdGU6DQo+IEZyb206IExlZSBDaGVlIFlhbmcgPGNoZWUueWFuZy5sZWVAaW50ZWwu
Y29tPg0KPg0KPiBzZWU6DQo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJ4bWwy
L2NvbW1pdC81YTAyNTgzYzdlNjgzODk2ZDg0ODc4YmQNCj4gOTA2NDFkOGQ5YjBkMDU0OQ0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBMZWUgQ2hlZSBZYW5nIDxjaGVlLnlhbmcubGVlQGludGVsLmNvbT4N
Cg0KU28gTWFzdGVyIGlzIG5vdCBhZmZlY3RlZD8gMi45LjEwDQoNCi0gYXJtaW4NCj4gLS0tDQo+
ICAuLi4vbGlieG1sL2xpYnhtbDIvRml4LUNWRS0yMDE5LTE5OTU2LnBhdGNoICAgICAgICB8IDQw
ICsrKysrKysrKysrKysrKysrKysrKysNCj4gIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4
bWwyXzIuOS45LmJiICAgICAgICAgIHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNl
cnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+IG1ldGEvcmVjaXBlcy1jb3JlL2xp
YnhtbC9saWJ4bWwyL0ZpeC1DVkUtMjAxOS0xOTk1Ni5wYXRjaA0KPg0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvRml4LUNWRS0yMDE5LTE5OTU2LnBhdGNo
IA0KPiBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyL0ZpeC1DVkUtMjAxOS0xOTk1
Ni5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi4xYzJkZmY5
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnht
bDIvRml4LUNWRS0yMDE5LTE5OTU2LnBhdGNoDQo+IEBAIC0wLDAgKzEsNDAgQEANCj4gK0Zyb20g
NWEwMjU4M2M3ZTY4Mzg5NmQ4NDg3OGJkOTA2NDFkOGQ5YjBkMDU0OSBNb24gU2VwIDE3IDAwOjAw
OjAwIA0KPiArMjAwMQ0KPiArRnJvbTogWmhpcGVuZyBYaWUgPHhpZXpoaXBlbmcxQGh1YXdlaS5j
b20+DQo+ICtEYXRlOiBXZWQsIDcgQXVnIDIwMTkgMTc6Mzk6MTcgKzA4MDANCj4gK1N1YmplY3Q6
IFtQQVRDSF0gRml4IG1lbW9yeSBsZWFrIGluIA0KPiAreG1sUGFyc2VCYWxhbmNlZENodW5rTWVt
b3J5UmVjb3Zlcg0KPiArDQo+ICtXaGVuIGRvYyBpcyBOVUxMLCBuYW1lc3BhY2UgY3JlYXRlZCBp
biB4bWxUcmVlRW5zdXJlWE1MRGVjbCBpcyBiaW5kIA0KPiArdG8gbmV3RG9jLT5vbGROcywgaW4g
dGhpcyBjYXNlLCBzZXQgbmV3RG9jLT5vbGROcyB0byBOVUxMIGFuZCBmcmVlIA0KPiArbmV3RG9j
IHdpbGwgY2F1c2UgYSBtZW1vcnkgbGVhay4NCj4gKw0KPiArRm91bmQgd2l0aCBsaWJGdXp6ZXIu
DQo+ICsNCj4gK0Nsb3NlcyAjODIuDQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQg
DQo+ICtbaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2xpYnhtbDIvY29tbWl0LzVhMDI1
ODNjN2U2ODM4OTZkODQ4NzgNCj4gK2JkOTA2NDFkOGQ5YjBkMDU0OV0NCj4gK0NWRTogQ1ZFLTIw
MTktMTk5NTYNCj4gKw0KPiArU2lnbmVkLW9mZi1ieTogQ2hlZSBZYW5nIExlZSA8Y2hlZS55YW5n
LmxlZUBpbnRlbC5jb20+DQo+ICsNCj4gKy0tLQ0KPiArIHBhcnNlci5jIHwgMyArKy0NCj4gKyAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICsNCj4gK2Rp
ZmYgLS1naXQgYS9wYXJzZXIuYyBiL3BhcnNlci5jDQo+ICtpbmRleCAxY2UxY2NmMS4uMjZkOWY0
ZTMgMTAwNjQ0DQo+ICstLS0gYS9wYXJzZXIuYw0KPiArKysrIGIvcGFyc2VyLmMNCj4gK0BAIC0x
Mzg5NCw3ICsxMzg5NCw4IEBAIHhtbFBhcnNlQmFsYW5jZWRDaHVua01lbW9yeVJlY292ZXIoeG1s
RG9jUHRyIGRvYywgeG1sU0FYSGFuZGxlclB0ciBzYXgsDQo+ICsgICAgIHhtbEZyZWVQYXJzZXJD
dHh0KGN0eHQpOw0KPiArICAgICBuZXdEb2MtPmludFN1YnNldCA9IE5VTEw7DQo+ICsgICAgIG5l
d0RvYy0+ZXh0U3Vic2V0ID0gTlVMTDsNCj4gKy0gICAgbmV3RG9jLT5vbGROcyA9IE5VTEw7DQo+
ICsrICAgIGlmKGRvYyAhPSBOVUxMKQ0KPiArKwluZXdEb2MtPm9sZE5zID0gTlVMTDsNCj4gKyAg
ICAgeG1sRnJlZURvYyhuZXdEb2MpOw0KPiArIA0KPiArICAgICByZXR1cm4ocmV0KTsNCj4gKy0t
DQo+ICsyLjI0LjENCj4gKw0KPiArDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9s
aWJ4bWwvbGlieG1sMl8yLjkuOS5iYiANCj4gYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGli
eG1sMl8yLjkuOS5iYg0KPiBpbmRleCBjMzhmODgzLi5jNDRhOTBiIDEwMDY0NA0KPiAtLS0gYS9t
ZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjkuOS5iYg0KPiArKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjkuOS5iYg0KPiBAQCAtMjAsNiArMjAsNyBAQCBT
UkNfVVJJID0gImh0dHA6Ly93d3cueG1sc29mdC5vcmcvc291cmNlcy9saWJ4bWwyLSR7UFZ9LnRh
ci5nejtuYW1lPWxpYnRhciBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly9saWJ4bWwtbTQtdXNlLXBr
Z2NvbmZpZy5wYXRjaCBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtcHRlc3QtcnVu
LXRoZS1weXRob24tdGVzdHMtaWYtcHl0aG9uLWlzLWVuYWJsZWQucGF0Y2ggXA0KPiAgICAgICAg
ICAgICBmaWxlOi8vZml4LWV4ZWN1dGlvbi1vZi1wdGVzdHMucGF0Y2ggXA0KPiArICAgICAgICAg
ICBmaWxlOi8vRml4LUNWRS0yMDE5LTE5OTU2LnBhdGNoIFwNCj4gICAgICAgICAgICAgIg0KPiAg
DQo+ICBTUkNfVVJJW2xpYnRhci5tZDVzdW1dID0gImMwNGE1YTBhMDQyZWFhMTU3ZThlOGM5ZWFi
ZTc2YmQ2Ig0KDQo=

