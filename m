Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0129.outbound.protection.outlook.com [207.46.100.129])
	by mail.openembedded.org (Postfix) with ESMTP id 6983273231
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:00:29 +0000 (UTC)
Received: from BN3PR0301MB1172.namprd03.prod.outlook.com (10.160.156.146) by
	BN3PR0301MB1172.namprd03.prod.outlook.com (10.160.156.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:00:28 +0000
Received: from BN3PR0301MB1172.namprd03.prod.outlook.com ([10.160.156.146]) by
	BN3PR0301MB1172.namprd03.prod.outlook.com ([10.160.156.146]) with
	mapi id 15.01.0225.018; Fri, 7 Aug 2015 06:00:28 +0000
From: Zhu Carol <B54851@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [poky][PATCH v6 0/3] Add patches for Gstreamer 1.4.5
	base
Thread-Index: AQHQ0DLAEgH0fvO7UU2hxM/sEwRFmZ3/4RQAgAAorNA=
Date: Fri, 7 Aug 2015 06:00:27 +0000
Message-ID: <BN3PR0301MB117273F5C1C1A434D2FDF9BB86730@BN3PR0301MB1172.namprd03.prod.outlook.com>
References: <1438856968-9564-1-git-send-email-b54851@freescale.com>
	<1438917942.30467.25.camel@linuxfoundation.org>
In-Reply-To: <1438917942.30467.25.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=B54851@freescale.com; 
x-originating-ip: [192.158.241.86]
x-microsoft-exchange-diagnostics: 1; BN3PR0301MB1172;
	5:kimIZiOcTdvX1+HLOY4lmP9ratsuzBq4tT93sirrGiK7Is4tLo1Jkx3Dhv2sfBjvxT0qXwqkPCsNuKVoW/Q8fz5Llysqzn+2N8O5R8AYsiY/KCNOcSnTV0m5B5/N0o6pejCkVHZx97CqYy4RlQS6fw==;
	24:SmhOxzHephEGRdJm/+OanRi2Dijzed61HmEwUikGiJL+16Z+rY96ns1qMpKcoez4og2dEew99k+EOQ8GdB0HA0U3cxx1YvlDjFVDKXgWcLU=;
	20:v9iCadT6G9joDThwhBvB4BBIhMVWyextR9kyaX5VH1/Tsa15Pvwo+hsME+Imakv9Le17SGA38IfnnECUQ1M7Ww==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1172;
x-microsoft-antispam-prvs: <BN3PR0301MB1172C8AACC5475DBFB4FC81286730@BN3PR0301MB1172.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1172; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1172; 
x-forefront-prvs: 066153096A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(377454003)(13464003)(377424004)(199003)(189002)(86362001)(87936001)(2656002)(19580405001)(19580395003)(92566002)(5003600100002)(10400500002)(77096005)(2900100001)(102836002)(2950100001)(46102003)(68736005)(5002640100001)(106116001)(62966003)(106356001)(105586002)(99286002)(54356999)(122556002)(64706001)(101416001)(66066001)(76176999)(77156002)(50986999)(81156007)(40100003)(5001860100001)(97736004)(4001540100001)(110136002)(189998001)(5001960100002)(33656002)(76576001)(5001830100001)(74316001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1172;
	H:BN3PR0301MB1172.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2015 06:00:27.9397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1172
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v6 0/3] Add patches for Gstreamer 1.4.5 base
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
X-List-Received-Date: Fri, 07 Aug 2015 06:00:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCiAgICBTb3JyeSBmb3IgY2F1c2luZyB5b3VyIGNvbmZ1c2lvbi4gRmlyc3Rs
eSwgSSBzZW50IGZpdmUgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSByZWxhdGVkIHBhdGNoZXMg
YW5kIHdhaXRpbmcgZm9yIHlvdXIgZmVlZGJhY2suIFRoZW4sIEkgc2VudCB0aHJlZSBtb3JlIHBh
dGNoZXMsIHRoZSBzdGF0dXMgb2YgdGhlbSBpcyB1bmtub3duLCBJIGFtIHN0aWxsIHdhaXRpbmcg
Zm9yIGZlZWRiYWNrLiBBbmQgdGhpcyB0aW1lLCBJIHNlbnQgdGhlIGZvbGxvd2luZyB0aHJlZSBt
b3JlIHBhdGhlcy4gVG90YWxseSBlbGV2ZW4gcGF0Y2hlcyBvZiBnc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlIGluIGFsbC4gSSB3aWxsIHJlc2VuZCB0aGUgY29tcGxldGUgcGF0Y2ggc2VyaWVzLCB3
aGljaCB3aWxsIGJlIG11Y2ggbW9yZSBjbGVhci4NCg0KQi5SLg0KWXVxaW5nIFpodQ0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNo
YXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXSANClNlbnQ6IEZyaWRheSwgQXVndXN0IDA3
LCAyMDE1IDExOjI2IEFNDQpUbzogWmh1IFl1cWluZy1CNTQ4NTENCkNjOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtwb2t5
XVtQQVRDSCB2NiAwLzNdIEFkZCBwYXRjaGVzIGZvciBHc3RyZWFtZXIgMS40LjUgYmFzZQ0KDQpP
biBUaHUsIDIwMTUtMDgtMDYgYXQgMTg6MjkgKzA4MDAsIFl1cWluZyBaaHUgd3JvdGU6DQo+IEZp
eCBpc3N1ZSBhYm91dCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlDQo+IA0KPiAtc3NhcGFyc2U6
IEVuaGFuY2UgU1NBIHRleHQgbGluZXMgcGFyc2luZy4NCj4gDQo+IC1zdWJwYXJzZTogU2V0IG5l
ZWRfc2VnbWVudCBhZnRlciBzaW5rIHBhZCByZWNlaXZlIEdTVF9FVkVOVF9TRUdNRU5ULg0KPiAN
Cj4gLWVuY29kZWJpbjogTmVlZCBtb3JlIGJ1ZmZlcnMgaW4gb3V0cHV0IHF1ZXVlIGZvciBiZXR0
ZXIgcGVyZm9ybWFuY2UuDQo+IA0KPiANCj4gWXVxaW5nIFpodSAoMyk6DQo+ICAgZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFzZTogQWRkIHNzYXBhcnNlIHJlbGF0ZWQgcGF0Y2gNCj4gICBnc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYXNlOiBBZGQgc3VicGFyc2UgcmVsYXRlZCBwYXRjaA0KPiAgIGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2U6IEFkZCBlbmNvZGViaW4gcmVsYXRlZCBwYXRjaA0KDQpJJ20g
YWZyYWlkIEknbSBjb21wbGV0ZWx5IGNvbmZ1c2VkIHdpdGggdGhpcyBwYXRjaCBzZXJpZXMuIEl0
IHN0YXJ0ZWQgYXMNCjYgcGF0Y2hlcywgaXRzIG5vdyAzIGFuZCB0aGVzZSBwYXRjaGVzIGRvbid0
IGFwcGx5IGFnYWluc3QgbWFzdGVyLg0KDQpDb3VsZCBzb21lb25lIHNlbmQgdGhlIGNvbXBsZXRl
IHBhdGNoIHNlcmllcyB0aGF0IHlvdSdyZSBhc2tpbmcgdG8gbWVyZ2UgdGhhdCBhcHBsaWVzIGFn
YWluc3QgbWFzdGVyIHBsZWFzZT8NCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg==

