Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C449D6BC44
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 00:27:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,265,1566835200"; d="scan'208";a="76563006"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Oct 2019 08:27:10 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id AEF944CE14F7;
	Mon,  7 Oct 2019 08:27:10 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Mon, 7 Oct 2019 08:27:18 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v4] rpm: make rpm work in toolchain.
Thread-Index: AQHVeP4wAvx9rPyAj0iNX3QEYbZp+KdOVISg
Date: Mon, 7 Oct 2019 00:27:17 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B71B85@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1569368723-80048-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<382403668ee4d701c92a03b7d9142ce5dc034a35.camel@linuxfoundation.org>
In-Reply-To: <382403668ee4d701c92a03b7d9142ce5dc034a35.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: AEF944CE14F7.A9D1C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH v4] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Mon, 07 Oct 2019 00:27:12 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KPiANCj4gVGhpcyBpcyBoZWFkaW5nIGluIHRoZSByaWdo
dCBkaXJlY3Rpb24gYnV0IHRoaXMgcGF0Y2ggc3RpbGwgbWFrZXMgdGhlIG5h
dGl2ZXNkay1ycG0NCj4gcmVjaXBlIG1hY2hpbmUgc3BlY2lmaWMgYW5kIHdl
IGNhbid0IGRvIHRoYXQuDQo+DQoNCkluIHRoaXMgcGF0Y2gsIGNvbmZpZyBm
aWxlIGlzIHNhbWUgYXMgdjMgcGF0Y2gsIGFuZCB2MyBwYXRjaCBoYXMgYmVl
biBhY2NlcHRlZCwgYnV0IHdoeSB0aGlzICB0aW1lIGlzICIgbWFrZXMgdGhl
IG5hdGl2ZXNkay1ycG0gcmVjaXBlIG1hY2hpbmUgc3BlY2lmaWMgIi4NCg0K
VGhlIGNvbmZpZyBmaWxlIGlzIHByb2Nlc3NlZCBieSBzY3JpcHQgaW4gcG9z
dC1yZWxvY2F0ZS1zZXR1cC5kLyB0aGUgc2FtZSBhcyB0aGF0IGluICBuYXRp
dmVzZGstbWVzb24uDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpaaGVuZyBSdW9xaW4NCk5hbmppbmcg
RnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkN
CkFERFIuOiBOby42IFdlbnpodSBSb2FkLCBTb2Z0d2FyZSBBdmVudWUsDQog
ICAgICAgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KTUFJTCA6IHpoZW5ncnEu
Zm5zdEBjbi5mdWppc3R1LmNvbQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNo
YXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBXZWRu
ZXNkYXksIE9jdG9iZXIgMDIsIDIwMTkgNDo0OSBQTQ0KPiBUbzogWmhlbmcs
IFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5j
b20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2NF0gcnBt
OiBtYWtlIHJwbSB3b3JrIGluIHRvb2xjaGFpbi4NCj4gDQo+IE9uIFdlZCwg
MjAxOS0wOS0yNSBhdCAwNzo0NSArMDgwMCwgWmhlbmcgUnVvcWluIHdyb3Rl
Og0KPiA+IFdlIG5lZWQgdG8gY29uZmlndXJlIHJwbSB0byB1c2UgcGFja2Fn
ZSBhcmNoaXRlY3R1cmUgZnJvbSB5b2N0byBidWlsZA0KPiA+IHN5c3RlbS4N
Cj4gPg0KPiA+IEluc3RhbGwgcnBtcmMgYW5kIHJwbS9wbGF0Zm9ybSB0byAk
e1NES1RBUkdFVFNZU1JPT1R9IGJlY2F1c2UgY29uZmlnDQo+ID4gZmlsZSBp
biBob3N0LXN5c3Jvb3QgYXMgL29wdC9wb2t5LzIuNytzbmFwc2hvdC9zeXNy
b290cy94ODZfNjQtDQo+ID4gcG9reXNkay1saW51eCB3aWxsIGJlIGNvdmVy
ZWQgYnkgYW5vdGhlciBBUkNIIHdoaWNoIHJlc3VsdCBpbiBwcmV2aW91cw0K
PiA+IGNvbmZpZyBzZXR0aW5ncyBpbmVmZmljYWN5Lg0KPiA+DQo+ID4gVG8g
cmVzb2x2ZSBpdCwgcHV0IGNvbmZpZyBmaWxlIGluIHRhcmdldC1zeXNyb290
IGxpa2UNCj4gPiAvb3B0L3Bva3kvMi43K3NuYXBzaG90L3N5c3Jvb3RzL2Nv
cmUyLTY0LXBva3ktbGludXguIEFzIGVhY2ggQVJDSCBoYXMNCj4gPiBpdHMg
b3duIHRhcmdldC1zeXNyb290LCBjb25maWcgZmlsZSB3aWxsIG5vdCBiZSBj
b3ZlcmVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVvcWlu
IDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4g
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vZmlsZXMvcnBtLXNldHVwLnB5
IHwgMjcNCj4gPiArKysrKysrKysrKysrKysrKysrKw0KPiA+ICBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnBtL3JwbV80LjE0LjIuMS5iYiAgICB8IDE5ICsr
KysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0
aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JwbS9maWxlcy9ycG0tc2V0dXAucHkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL2ZpbGVzL3Jw
bS1zZXR1cC5weQ0KPiA+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9m
aWxlcy9ycG0tc2V0dXAucHkNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+IGluZGV4IDAwMDAwMDAwMDAuLmIzZThhMTE5OGMNCj4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9m
aWxlcy9ycG0tc2V0dXAucHkNCj4gPiBAQCAtMCwwICsxLDI3IEBADQo+ID4g
KyMhL3Vzci9iaW4vZW52IHB5dGhvbjMNCj4gPiArDQo+ID4gK2ltcG9ydCBv
cw0KPiA+ICtpbXBvcnQgc3lzDQo+ID4gK2ltcG9ydCBzaHV0aWwNCj4gPiAr
DQo+ID4gK3RyeToNCj4gPiArICAgIG5hdGl2ZV9zeXNyb290ID0gb3MuZW52
aXJvblsnT0VDT1JFX05BVElWRV9TWVNST09UJ10NCj4gPiArICAgIHNka3Rh
cmdldF9zeXNyb290ID0gb3MuZW52aXJvblsnU0RLVEFSR0VUU1lTUk9PVCdd
IGV4Y2VwdA0KPiA+ICtLZXlFcnJvcjoNCj4gPiArICAgIHByaW50KCJOb3Qg
aW4gZW52aXJvbm1lbnQgc2V0dXAsIGJhaWxpbmciKQ0KPiA+ICsgICAgc3lz
LmV4aXQoMSkNCj4gPiArDQo+ID4gK3RhcmdldF9ldGNfZGlyID0gb3MucGF0
aC5qb2luKHNka3RhcmdldF9zeXNyb290LCAnZXRjL3JwbScpDQo+ID4gKw0K
PiA+ICtpZiBub3Qgb3MucGF0aC5leGlzdHModGFyZ2V0X2V0Y19kaXIpOg0K
PiA+ICsgICAgb3MubWFrZWRpcnModGFyZ2V0X2V0Y19kaXIpDQo+ID4gKw0K
PiA+ICt0ZW1wbGF0ZV9maWxlID0gb3MucGF0aC5qb2luKG5hdGl2ZV9zeXNy
b290LCAndXNyL3NoYXJlL3JwbS9ycG1yYycpDQo+ID4gK2Nyb3NzX2ZpbGUg
PSBvcy5wYXRoLmpvaW4oc2RrdGFyZ2V0X3N5c3Jvb3QsICdldGMvcnBtcmMn
KQ0KPiA+ICtzaHV0aWwuY29weSh0ZW1wbGF0ZV9maWxlLCBjcm9zc19maWxl
KQ0KPiA+ICsNCj4gPiArdGVtcGxhdGVfZmlsZSA9IG9zLnBhdGguam9pbihu
YXRpdmVfc3lzcm9vdCwNCj4gPiAndXNyL3NoYXJlL3JwbS9wbGF0Zm9ybScp
DQo+ID4gK2Nyb3NzX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2RrdGFyZ2V0X3N5
c3Jvb3QsICdldGMvcnBtL3BsYXRmb3JtJykNCj4gPiArc2h1dGlsLmNvcHko
dGVtcGxhdGVfZmlsZSwgY3Jvc3NfZmlsZSkNCj4gPiArDQo+ID4gKw0KPiA+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV80
LjE0LjIuMS5iYg0KPiA+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9y
cG1fNC4xNC4yLjEuYmINCj4gPiBpbmRleCBjMzczMzBlYjRjLi5lMWQxOTUx
ZDc0IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
cG0vcnBtXzQuMTQuMi4xLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JwbS9ycG1fNC4xNC4yLjEuYmINCj4gPiBAQCAtNDQsNiArNDQs
OSBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJl
LQ0KPiA+IG1hbmFnZW1lbnQvcnBtO2JyYW5jaD1ycG0tNC4xNC54IFwNCj4g
PiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1tb25vLWZpbmQtcHJvdmlkZXMt
cmVxdWlyZXMtZG8tbm90LXVzZS0NCj4gPiBtb25vZGlzLWZyb20tLnBhdGNo
IFwNCj4gPiAgICAgICAgICAgICAiDQo+ID4NCj4gPiArU1JDX1VSSV9hcHBl
bmRfY2xhc3MtbmF0aXZlc2RrID0gImZpbGU6Ly9ycG0tc2V0dXAucHkgXA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiDQo+ID4g
Kw0KPiA+ICBQRSA9ICIxIg0KPiA+ICBTUkNSRVYgPSAiNGE5NDQwMDA2Mzk4
NjQ2NTgzZjBkOWFlMTgzN2RhZDI4NzUwMTNhYSINCj4gPg0KPiA+IEBAIC0x
MTMsNiArMTE2LDIwIEBAIGRvX2luc3RhbGxfYXBwZW5kX2NsYXNzLW5hdGl2
ZXNkaygpIHsNCj4gPiAgICAgICAgICBkb25lDQo+ID4NCj4gPiAgICAgICAg
ICBybSAtcmYgJHtEfS92YXINCj4gPiArICAgICAgICBpbnN0YWxsIC1kICR7
RH0ke2RhdGFkaXJ9L3JwbQ0KPiA+ICsNCj4gPiArICAgICAgICBjYXQgPiR7
RH0vJHtkYXRhZGlyfS9ycG0vcnBtcmMgPDxFT0YNCj4gPiArYXJjaF9jb21w
YXQ6ICR7TUFDSElORV9BUkNIfTogYWxsIGFueSBub2FyY2ggJHtQQUNLQUdF
X0VYVFJBX0FSQ0hTfQ0KPiA+ICtFT0YNCj4gPiArDQo+ID4gKyMgQXJjaCBJ
bmZvIHNob3VsZCBiZSBmaXhlZCBhcyAnLScgaXMgaW5zdGVhZCBvZiAnXycu
DQo+ID4gKyAgICAgICAgc2VkIC1pICdzLy0vXy8nICR7RH0ke2RhdGFkaXJ9
L3JwbS9ycG1yYw0KPiA+ICsgICAgICAgIGNhdCA+JHtEfS8ke2RhdGFkaXJ9
L3JwbS9wbGF0Zm9ybSA8PEVPRg0KPiA+ICske01BQ0hJTkVfQVJDSH0tcGMt
bGludXggRU9GDQo+IA0KPiBUaGlzIGlzIGhlYWRpbmcgaW4gdGhlIHJpZ2h0
IGRpcmVjdGlvbiBidXQgdGhpcyBwYXRjaCBzdGlsbCBtYWtlcyB0aGUgbmF0
aXZlc2RrLXJwbQ0KPiByZWNpcGUgbWFjaGluZSBzcGVjaWZpYyBhbmQgd2Ug
Y2FuJ3QgZG8gdGhhdC4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQN
Cj4gDQo+IA0KPiANCj4gDQoNCgoK

