Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E91C7733F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 08:07:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1387ijg024238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 3 Feb 2016 00:07:44 -0800
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.97]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Wed, 3 Feb 2016 00:07:43 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Phil Blundell <pb@pbcl.net>, "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>, Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH 2/3] glib-2.0: drop
	add-march-i486-into-CFLAGS-automatically.patch
Thread-Index: AQHRXUIuHEVOTz6WokuqUKAmNRgCiZ8Z9Xdg
Date: Wed, 3 Feb 2016 08:07:43 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C7C0BCC@ALA-MBB.corp.ad.wrs.com>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
	<1453937316-1311-3-git-send-email-armccurdy@gmail.com>
	<56AFDAC5.9000008@windriver.com> <1454366681.7421.37.camel@pbcl.net>
In-Reply-To: <1454366681.7421.37.camel@pbcl.net>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.140]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] glib-2.0: drop add-march-i486-into-CFLAGS-automatically.patch
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
X-List-Received-Date: Wed, 03 Feb 2016 08:07:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbCBCbHVuZGVsbCBb
bWFpbHRvOnBiQHBiY2wubmV0XQ0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAwMiwgMjAxNiA2
OjQ1IEFNDQo+IFRvOiBNYWNMZW9kLCBSYW5keQ0KPiBDYzogQW5kcmUgTWNDdXJkeTsgb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgSHVhbmcsIEppZSAoSmFja2llKQ0K
PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzNdIGdsaWItMi4wOiBkcm9wIGFkZC1t
YXJjaC1pNDg2LWludG8tQ0ZMQUdTLWF1dG9tYXRpY2FsbHkucGF0Y2gNCj4gDQo+IE9uIE1vbiwg
MjAxNi0wMi0wMSBhdCAxNzoyMyAtMDUwMCwgUmFuZHkgTWFjTGVvZCB3cm90ZToNCj4gPiBEbyB5
b3UgcmVtZW1iZXIgd2h5IHRoaXMgcGF0Y2ggd2FzIG5lZWRlZD8NCj4gDQo+IFRoZSBjb21tZW50
cyBpbiB0aGUgcGF0Y2ggcHJvdmlkZSBhIGZhaXJseSBjbGVhciBleHBsYW5hdGlvbiBvZiB3aGF0
DQo+IHByb2JsZW0gaXQgd2FzIHRyeWluZyB0byBzb2x2ZS4gIEJ1dCBJIGFncmVlIHdpdGggQW5k
cmUgdGhhdCB0aGlzIGN1cmUNCj4gaXMgaW4gZmFjdCB3b3JzZSB0aGFuIHRoZSBvcmlnaW5hbCBk
aXNlYXNlLg0KPiANCj4gSW4gYW55IGNhc2UsIHRoZSBpc3N1ZSBpcyBwcm9iYWJseSBtb290IGJl
Y2F1c2UgbmVpdGhlciBnbGliYyBub3IgbXVzbA0KPiBzdXBwb3J0IGNwdXMgd2l0aG91dCBjbXB4
Y2hnIGFueSBtb3JlLg0KDQpJJ20gbm90IHRoZSBhdXRob3Igb2YgdGhhdCBwYXRjaCwganVzdCBo
ZWxwZWQgZm9yd2FyZGluZyBpdC4NCkl0IHNlZW1zIHJlYXNvbmFibGUgdG8gZHJvcCBpdCBhbmQg
d2UgbWF5IGdldCBiYWNrIHRvIHRoZSBpc3N1ZQ0KYW5kIHNvbHZlIGl0IHdpdGggYSBtb3JlIHBy
b3BlciB3YXkuDQoNClRoYW5rcywNCkphY2tpZQ0KDQo+IA0KPiBwLg0KPiANCg0K

