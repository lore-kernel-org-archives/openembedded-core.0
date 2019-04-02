Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED7CE7D2D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 22:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B8ED21858A;
	Wed,  3 Apr 2019 00:29:04 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id H_-dlGHwgH3T; Wed,  3 Apr 2019 00:29:01 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 77B9918587;
	Wed,  3 Apr 2019 00:29:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66C031E07A;
	Wed,  3 Apr 2019 00:29:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B5231E079;
	Wed,  3 Apr 2019 00:29:01 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed,  3 Apr 2019 00:29:01 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 4F9162760;
	Wed,  3 Apr 2019 00:29:01 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 3 Apr 2019 00:29:01 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 3 Apr 2019 00:29:01 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/6] Revert "arch-armv5-dsp.inc: Check for dsp
	only to enable 'e' in package arches"
Thread-Index: AQHU6ZYC9xNFA8vdpEmFtd+guIpZeqYpc3eg
Date: Tue, 2 Apr 2019 22:29:01 +0000
Message-ID: <2b7c93c787aa4f7e9450b4b3615be70c@XBOX04.axis.com>
References: <cover.1554233389.git.pkj@axis.com>
	<65cd513a44ef0345fbdc94874aec631fde32b87e.1554233389.git.pkj@axis.com>
	<2c93c78a-2c1d-7d81-af48-63e7f14fa850@gmail.com>
In-Reply-To: <2c93c78a-2c1d-7d81-af48-63e7f14fa850@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 2/6] Revert "arch-armv5-dsp.inc: Check for dsp only to enable 'e' in package arches"
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
X-List-Received-Date: Tue, 02 Apr 2019 22:29:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyByZXZlcnQgKGFuZCB0aGUgZm9sbG93aW5nKSBhcmUgdGhlcmUgdG8gYWxsb3cgbXkgYWx0
ZXJuYXRpdmUgDQpzb2x1dGlvbiB0byBiZSBhcHBsaWVkLg0KDQovL1BldGVyDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFp
bC5jb20+DQo+IFNlbnQ6IGRlbiAyIGFwcmlsIDIwMTkgMjI6NTMNCj4gVG86IFBldGVyIEtqZWxs
ZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBj
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFU
Q0ggMi82XSBSZXZlcnQgImFyY2gtYXJtdjUtZHNwLmluYzogQ2hlY2sNCj4gZm9yIGRzcCBvbmx5
IHRvIGVuYWJsZSAnZScgaW4gcGFja2FnZSBhcmNoZXMiDQo+IA0KPiBQZXRlcg0KPiANCj4gT24g
NC8yLzE5IDEyOjMxIFBNLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gVGhpcyByZXZl
cnRzIGNvbW1pdCAxZDZkNWJiMzBhODNmOTEzNmI3YzMzZTI5N2Q0ODU2NGFlNjFiNTBlLg0KPiAN
Cj4gV2hhdCBwcm9ibGVtIGFyZSB5b3Ugc2VlaW5nIHRoYXQgaXMgYmVpbmcgZml4ZWQgYnkgdGhp
cyByZXZlcnQ/DQo+IGl0IG1heSBoZWxwIGRlY2lkZSBpZiBpdCBuZWVkIHRvIGJlIGluIHdhcnJp
b3IuDQo+IA0KPiAtIGFybWluDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVy
c3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9j
b25mL21hY2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm12NS1kc3AuaW5jIHwgMiArLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL2FybS9hcmNoLWFybXY1LWRzcC5p
bmMNCj4gYi9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL2FybS9hcmNoLWFybXY1LWRzcC5pbmMN
Cj4gPiBpbmRleCBkMTE3YWYxNTIwLi4xZjE2MDg1ZmNkIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEv
Y29uZi9tYWNoaW5lL2luY2x1ZGUvYXJtL2FyY2gtYXJtdjUtZHNwLmluYw0KPiA+ICsrKyBiL21l
dGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvYXJtL2FyY2gtYXJtdjUtZHNwLmluYw0KPiA+IEBAIC0x
LDQgKzEsNCBAQA0KPiA+IC1BUk1QS0dTRlhfRFNQID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdU
VU5FX0ZFQVRVUkVTJywgWyAnZHNwJyBdLA0KPiAnZScsICcnLCBkKX0iDQo+ID4gK0FSTVBLR1NG
WF9EU1AgPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1RVTkVfRkVBVFVSRVMnLCBbICdhcm12NScs
DQo+ICdkc3AnIF0sICdlJywgJycsIGQpfSINCj4gPiAgVFVORVZBTElEW2RzcF0gPSAiQVJNIERT
UCBmdW5jdGlvbmFsaXR5Ig0KPiA+DQo+ID4gIHJlcXVpcmUgY29uZi9tYWNoaW5lL2luY2x1ZGUv
YXJtL2FyY2gtYXJtdjUuaW5jDQoNCg==

