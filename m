Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53F8860043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 03:33:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7R3XfHL005996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Aug 2015 20:33:41 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.3.206]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0235.001;
	Wed, 26 Aug 2015 20:33:41 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "OHLY, PATRICK" <patrick.ohly@intel.com>, "Hatle, Mark"
	<mark.hatle@windriver.com>
Thread-Topic: [OE-core] [PATCH v2] mtd-utils: disable xattr if
	DISTRO_FEATURES	doesn't contain acl
Thread-Index: AQHQ3SXT8CoGNSMM0k6kHWkTAgg2c54eC3fggADhNICAAEri4A==
Date: Thu, 27 Aug 2015 03:33:40 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAFC717B01@ALA-MBB.corp.ad.wrs.com>
References: <1440280746-11401-1-git-send-email-andrea.adami@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAFC716948@ALA-MBB.corp.ad.wrs.com>
	<1440605035.20082.20.camel@intel.com>
In-Reply-To: <1440605035.20082.20.camel@intel.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.153]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mtd-utils: disable xattr if DISTRO_FEATURES	doesn't contain acl
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
X-List-Received-Date: Thu, 27 Aug 2015 03:33:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF0cmljayBPaGx5IFtt
YWlsdG86cGF0cmljay5vaGx5QGludGVsLmNvbV0NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAy
NywgMjAxNSAxMjowNCBBTQ0KPiBUbzogSHVhbmcsIEppZSAoSmFja2llKTsgSGF0bGUsIE1hcmsN
Cj4gQ2M6IEFuZHJlYSBBZGFtaTsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2Ml0gbXRkLXV0aWxzOiBkaXNh
YmxlIHhhdHRyIGlmIERJU1RST19GRUFUVVJFUyBkb2Vzbid0IGNvbnRhaW4gYWNsDQo+IA0KPiBP
biBXZWQsIDIwMTUtMDgtMjYgYXQgMDk6NTAgKzAwMDAsIEh1YW5nLCBKaWUgKEphY2tpZSkgd3Jv
dGU6DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBv
cGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IFtt
YWlsdG86b3BlbmVtYmVkZGVkLWNvcmUtIGJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10g
T24gQmVoYWxmDQo+ID4gPiBPZiBBbmRyZWEgQWRhbWkNCj4gPiA+IFNlbnQ6IFN1bmRheSwgQXVn
dXN0IDIzLCAyMDE1IDU6NTkgQU0NCj4gPiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIIHYyXSBtdGQt
dXRpbHM6IGRpc2FibGUgeGF0dHIgaWYNCj4gPiA+IERJU1RST19GRUFUVVJFUyBkb2Vzbid0IGNv
bnRhaW4gYWNsDQo+ID4gPg0KPiA+ID4gQWZ0ZXIgY29tbWl0IDI0ZmRlNGQgZG9fY29tcGlsZSBm
YWlsczoNCj4gPiA+DQo+ID4gPiB8IG1rZnMuamZmczIuYzo3MDoyMTogZmF0YWwgZXJyb3I6IHN5
cy9hY2wuaDogTm8gc3VjaCBmaWxlIG9yDQo+ID4gPiB8IGRpcmVjdG9yeSAjaW5jbHVkZSA8c3lz
L2FjbC5oPg0KPiA+ID4NCj4gPiA+IFRoaXMgaXMgYSBtaXNzaW5nIGRlcGVuZGVuY3kgb24gYWNs
Lg0KPiA+ID4gVG8gZml4IHRoaXMgd2UgYWRkIGEgY2hlY2sgdG8gZGlzYWJsZSB4YXR0ciB3aGVu
IGFjbCBpcyBub3QgaW4gRElTVFJPX0ZFQVRVUkVTLg0KPiA+DQo+ID4gSSB0aGluayB5b3Ugc2hv
dWxkIGNoZWNrIHRoZSB4YXR0ciBkaXN0cm8gZmVhdHVyZSwgYnV0IG9ubHkgY2hlY2tpbmcNCj4g
PiB0aGUgRElTVFJPX0ZFQVRVUkVTIGNhbid0IGVuc3VyZSB0aGUgZGVwZW5kZW5jeSBzYXRpc2Zp
ZWQsIHdoeSBub3QgdXNlIHRoZSBQQUNLQUdFQ09ORklHLA0KPiBzb21ldGhpbmcgbGlrZToNCj4g
Pg0KPiA+IFBBQ0tBR0VDT05GSUcgPz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVB
VFVSRVMnLCAneGF0dHInLCAneGF0dHInLCAnJywgZCl9Ig0KPiA+IFBBQ0tBR0VDT05GSUdbeGF0
dHJdID0gIiwgLURXSVRIT1VUX1hBVFRSLGF0dHIgYWNsLCINCj4gDQo+IEkgYWdyZWUgdGhhdCB3
ZSBzaG91bGQgY2hlY2sgdGhlIHhhdHRyIGRpc3RybyBmZWF0dXJlLiBUaGUgYWN0dWFsIHBhdGNo
IGlzIGEgYml0IG1vcmUgY29tcGxleCwgdGhvdWdoLA0KPiBiZWNhdXNlIFBBQ0tBR0VDT05GSUcg
Y2Fubm90IGluZmx1ZW5jZSBFWFRSQV9PRU1BS0UsIGNhbiBpdD8NCg0KT2gsIEkgZGlkbid0IG5v
dGljZSBpdCB3YXMgZm9yIEVYVFJBX09FTUFLRS4NCg0KPiANCj4gSSdsbCByZXBseSB3aXRoIGEg
cGF0Y2ggdGhhdCB3b3JrZWQgZm9yIG1lLg0KDQpJIHNlZSB5b3VyIHBhdGNoLCBpdCBsb29rcyBm
aW5lIHRvIG1lLg0KDQpUaGFua3MsDQpKYWNraWUNCg0KPiANCj4gLS0NCj4gQmVzdCBSZWdhcmRz
LCBQYXRyaWNrIE9obHkNCj4gDQo+IFRoZSBjb250ZW50IG9mIHRoaXMgbWVzc2FnZSBpcyBteSBw
ZXJzb25hbCBvcGluaW9uIG9ubHkgYW5kIGFsdGhvdWdoIEkgYW0gYW4gZW1wbG95ZWUgb2YgSW50
ZWwsIHRoZQ0KPiBzdGF0ZW1lbnRzIEkgbWFrZSBoZXJlIGluIG5vIHdheSByZXByZXNlbnQgSW50
ZWwncyBwb3NpdGlvbiBvbiB0aGUgaXNzdWUsIG5vciBhbSBJIGF1dGhvcml6ZWQgdG8gc3BlYWsN
Cj4gb24gYmVoYWxmIG9mIEludGVsIG9uIHRoaXMgbWF0dGVyLg0KPiANCj4gDQoNCg==

