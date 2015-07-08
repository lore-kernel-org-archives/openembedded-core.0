Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2E47391D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 09:18:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98217010"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jul 2015 17:22:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t689Gkup011254;
	Wed, 8 Jul 2015 17:16:46 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Wed, 8 Jul 2015 17:18:28 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] FW: [oe] [meta-oe][PATCH] parted_1.8.6.bb: add
	parted that not GPLv3
Thread-Index: AQHQuDpjNDtvI4kxr0SLhdqthD/ZI53PXd9Q///GqACAAFcsAIAAAgoAgAAE6QCAAAEzAIABxZlg
Date: Wed, 8 Jul 2015 09:18:27 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDB299A4@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJ86T=XJeo31ntBEw16vCPuTyAwYvsij_Aoq=EKgRyhCnYyzOw@mail.gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FDB29591@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LZx5mPc+2_wmO8WfYs-s5smFuZYyAmYfZS4Bv+BoW7SEA@mail.gmail.com>
	<559BD488.8090306@linux.intel.com>
	<CAJTo0LY5fEmX8Of5d2prJ01fHvf7LV170qTz+r1kd0vtkGgesQ@mail.gmail.com>
	<559BDA5C.6060905@linux.intel.com>
	<CAP9ODKr6RVW9h8-92UQbbRyJ4jseUAC2qHGExkUNcfu==pEyUg@mail.gmail.com>
In-Reply-To: <CAP9ODKr6RVW9h8-92UQbbRyJ4jseUAC2qHGExkUNcfu==pEyUg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: FW: [oe] [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Wed, 08 Jul 2015 09:18:31 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgT3RhdmlvDQoNCg0KPiA+IFdobydzIGdvaW5nIHRvIHByb3ZpZGUgb25nb2luZyBtYWludGVu
YW5jZSBmb3IgYWxsIHRoYXQ/IEkgd291bGQgbGlrZQ0KPiA+IExlaSB0byBlc3RhYmxpc2ggaGlt
c2VsZiBhcyB0aGUgbWFpbnRhaW5lciAodGhyb3VnaCB0aGUgbWFpbnRhaW5lcnMuaW5jIGZpbGUp
Lg0KPiANCj4gQWdyZWVkOyAyMDA3IEkgd2FzIHN0aWxsIG9uZSBvZiBkZXZlbG9wZXJzIG9mIGl0
IElJUkMgYW5kIHNpbmNlIHRoZW4sIEppbSBoYXMgaW1wcm92ZWQgaXQNCj4gcXVpdGUgYSBsb3Qu
DQoNClRoYW5rIHlvdS4NCg0KPiANCj4gVG8gYmUgaG9uZXN0LCBwYXJ0ZWQgYXQgdGhhdCB0aW1l
IGhhcyBzZXZlcmFsIGlzc3VlcyB3aXRoIGJpZ2dlciBkaXNrIHNlY3RvcnMgYW5kIG90aGVyDQo+
IHN0dWZmLiAgSSB3b3VsZG4ndCBsaWtlIHRvIHNlZSBwcm9qZWN0cyByZWx5aW5nIG9uIHN1Y2gg
b2xkIGFuZCBidWdneSB2ZXJzaW9uLg0KPg0KDQpPbGQgdmVyc2lvbiBkb2VzIGhhdmUgc29tZSBp
c3N1ZXMuIEJ1dCBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBwcm92aWRlIGEgbm9uLXYzIHZlcnNp
b24gdG8gdXNlciB3aG8gZG9lcyBub3QgbWluZCBvZiB0aGVzZSBpc3N1ZXMuDQoNCkNoZWVycyAN
CkxlaQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRl
ZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBbbWFpbHRvOm9wZW5lbWJl
ZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mIE90
YXZpbw0KPiBTYWx2YWRvcg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDA3LCAyMDE1IDEwOjAwIFBN
DQo+IFRvOiBBbGV4YW5kZXIgS2FuYXZpbg0KPiBDYzogT0UtY29yZQ0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIEZXOiBbb2VdIFttZXRhLW9lXVtQQVRDSF0gcGFydGVkXzEuOC42LmJiOiBhZGQg
cGFydGVkIHRoYXQgbm90DQo+IEdQTHYzDQo+IA0KPiBPbiBUdWUsIEp1bCA3LCAyMDE1IGF0IDEw
OjU1IEFNLCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleGFuZGVyLmthbmF2aW5AbGludXguaW50ZWwu
Y29tPg0KPiB3cm90ZToNCj4gPiBPbiAwNy8wNy8yMDE1IDA0OjM4IFBNLCBCdXJ0b24sIFJvc3Mg
d3JvdGU6DQo+ID4NCj4gPj4gICAgIEhvdyBhYm91dCByZW5hbWluZyB0aGUgcmVjaXBlLCBzbyB0
aGF0IGl0IGRvZXNuJ3QgY2xhc2ggd2l0aCB0aGUNCj4gPj4gICAgIEdQTHYzIHZlcnNpb24/IEZv
ciBleGFtcGxlLCBwYXJ0ZWQxXzEuOC42LmJiDQo+ID4+ICAgICA8aHR0cDovL3BhcnRlZDFfMS44
LjYuYmI+LiBUaGVuIGl0IGNhbiBiZSBrZXB0IG91dHNpZGUgb2Ygb2UtY29yZS4NCj4gPj4NCj4g
Pj4NCj4gPj4gQXMgdGhleSdyZSBqdXN0IHZlcnNpb24gdmFyaWF0aW9ucyB0aGF0IHdvdWxkIGJl
IG92ZXJseSBjb21wbGV4Lg0KPiA+PiBEcm9wcGluZyBpdCBpbiBvZS1jb3JlIGFzIGl0J3MgYSBu
b24tdjMgYWx0ZXJuYXRpdmUgZG9lc24ndCBzZWVtIHRvDQo+ID4+IGJlIGEgcHJvYmxlbSB0byBt
ZSAoYXMgdGhlcmUncyBwbGVudHkgb2YgcHJlY2VkZW50IGZvciB0aGF0IGFscmVhZHkpLg0KPiA+
DQo+ID4NCj4gPiBNeSBwcm9ibGVtIGlzIHRoYXQgcGFydGVkIDEuOC42IHdhcyByZWxlYXNlZCBp
biAyMDA3LCBhbmQgdGhlIHJlY2lwZQ0KPiA+IGFscmVhZHkgY2FycmllcyBlaWdodCBwYXRjaGVz
IHdpdGggaXQgKGFuZCBub25lIG9mIHRoZW0gaGFzIGFueQ0KPiA+IGluZm9ybWF0aW9uIGFib3V0
IHRoZWlyIG9yaWdpbikuDQo+ID4NCj4gPiBXaG8ncyBnb2luZyB0byBwcm92aWRlIG9uZ29pbmcg
bWFpbnRlbmFuY2UgZm9yIGFsbCB0aGF0PyBJIHdvdWxkIGxpa2UNCj4gPiBMZWkgdG8gZXN0YWJs
aXNoIGhpbXNlbGYgYXMgdGhlIG1haW50YWluZXIgKHRocm91Z2ggdGhlIG1haW50YWluZXJzLmlu
YyBmaWxlKS4NCj4gDQo+IEFncmVlZDsgMjAwNyBJIHdhcyBzdGlsbCBvbmUgb2YgZGV2ZWxvcGVy
cyBvZiBpdCBJSVJDIGFuZCBzaW5jZSB0aGVuLCBKaW0gaGFzIGltcHJvdmVkIGl0DQo+IHF1aXRl
IGEgbG90Lg0KPiANCj4gVG8gYmUgaG9uZXN0LCBwYXJ0ZWQgYXQgdGhhdCB0aW1lIGhhcyBzZXZl
cmFsIGlzc3VlcyB3aXRoIGJpZ2dlciBkaXNrIHNlY3RvcnMgYW5kIG90aGVyDQo+IHN0dWZmLiAg
SSB3b3VsZG4ndCBsaWtlIHRvIHNlZSBwcm9qZWN0cyByZWx5aW5nIG9uIHN1Y2ggb2xkIGFuZCBi
dWdneSB2ZXJzaW9uLg0KPiANCj4gLS0NCj4gT3RhdmlvIFNhbHZhZG9yICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBPLlMuIFN5c3RlbXMNCj4gaHR0cDovL3d3dy5vc3N5c3RlbXMuY29tLmJy
ICAgICAgICBodHRwOi8vY29kZS5vc3N5c3RlbXMuY29tLmJyDQo+IE1vYmlsZTogKzU1ICg1Mykg
OTk4MS03ODU0ICAgICAgICAgICAgTW9iaWxlOiArMSAoMzQ3KSA5MDMtOTc1MA0KPiAtLQ0KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1i
ZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=

