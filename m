Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 788847CE27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 03:25:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,374,1559491200"; d="scan'208";a="73459607"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Aug 2019 11:25:58 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id B137A4CE030F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 11:25:59 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Mon, 12 Aug 2019 11:26:03 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2] toolchain-scripts: make rpm work in toolchain
Thread-Index: AQHVULwpaIUHr6QMkkKQis/0QVe8R6b22Uvw
Date: Mon, 12 Aug 2019 03:26:01 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B617C3@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1565579703-78351-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1565579703-78351-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: B137A4CE030F.AAC68
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH v2] toolchain-scripts: make rpm work in toolchain
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
X-List-Received-Date: Mon, 12 Aug 2019 03:26:01 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkNCg0KU29ycnksIEkgaGF2ZSBtaXNzZWQgdGhlIHByZXZpb3VzIG1haWwu
IFNvIHBsZWFzZSBpZ25vcmUgdGhpcyBtYWlsLiBJIHdpbGwgdGhpbmsgYWJv
dXQgYSBuZXcgd2F5IHRvIGZpeCB0aGlzIHByb2JsZW0uDQoNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpa
aGVuZyBSdW9xaW4NCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBU
ZWNoLiBDby4sIEx0ZC4oRk5TVCkNCkFERFIuOiBOby42IFdlbnpodSBSb2Fk
LCBTb2Z0d2FyZSBBdmVudWUsDQogICAgICAgTmFuamluZywgMjEwMDEyLCBD
aGluYQ0KTUFJTCA6IHpoZW5ncnEuZm5zdEBjbi5mdWppc3R1LmNvbQ0KDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhlbmcs
IFJ1b3Fpbi/WoyDI9MfVDQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDEyLCAy
MDE5IDExOjE1IEFNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IENjOiBaaGVuZywgUnVvcWluL9ajIMj0x9Ug
PHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gU3ViamVjdDogW09F
LWNvcmVdW1BBVENIIHYyXSB0b29sY2hhaW4tc2NyaXB0czogbWFrZSBycG0g
d29yayBpbiB0b29sY2hhaW4NCj4gDQo+IFJwbSBuZWVkIHRvIHJlYWQgdGhl
IGFyY2ggaW5mbywgYnV0ICRzY3JpcHQgZGlkIG5vdCBwcm92aWRlIGl0LCBz
byBhZGQgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9xaW4g
PHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICBtZXRh
L2NsYXNzZXMvdG9vbGNoYWluLXNjcmlwdHMuYmJjbGFzcyB8IDEgKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS9jbGFzc2VzL3Rvb2xjaGFpbi1zY3JpcHRzLmJiY2xhc3Mg
Yi9tZXRhL2NsYXNzZXMvdG9vbGNoYWluLQ0KPiBzY3JpcHRzLmJiY2xhc3MN
Cj4gaW5kZXggMWEyZWM0ZjNiMi4uZGU1MGI3ZWM2OSAxMDA2NDQNCj4gLS0t
IGEvbWV0YS9jbGFzc2VzL3Rvb2xjaGFpbi1zY3JpcHRzLmJiY2xhc3MNCj4g
KysrIGIvbWV0YS9jbGFzc2VzL3Rvb2xjaGFpbi1zY3JpcHRzLmJiY2xhc3MN
Cj4gQEAgLTEwMSw2ICsxMDEsNyBAQCB0b29sY2hhaW5fc2hhcmVkX2Vudl9z
Y3JpcHQgKCkgew0KPiAgCWVjaG8gJ2V4cG9ydCBDUFBGTEFHUz0iJHtUQVJH
RVRfQ1BQRkxBR1N9IicgPj4gJHNjcmlwdA0KPiAgCWVjaG8gJ2V4cG9ydCBL
Q0ZMQUdTPSItLXN5c3Jvb3Q9JFNES1RBUkdFVFNZU1JPT1QiJyA+PiAkc2Ny
aXB0DQo+ICAJZWNobyAnZXhwb3J0IE9FQ09SRV9ESVNUUk9fVkVSU0lPTj0i
JHtESVNUUk9fVkVSU0lPTn0iJyA+Pg0KPiAkc2NyaXB0DQo+ICsJZWNobyAn
ZXhwb3J0IE1BQ0hJTkVfQVJDSD0ke01BQ0hJTkVfQVJDSH0nID4+ICRzY3Jp
cHQNCj4gIAllY2hvICdleHBvcnQgT0VDT1JFX1NES19WRVJTSU9OPSIke1NE
S19WRVJTSU9OfSInID4+ICRzY3JpcHQNCj4gIAllY2hvICdleHBvcnQgQVJD
SD0ke0FSQ0h9JyA+PiAkc2NyaXB0DQo+ICAJZWNobyAnZXhwb3J0IENST1NT
X0NPTVBJTEU9JHtUQVJHRVRfUFJFRklYfScgPj4gJHNjcmlwdA0KPiAtLQ0K
PiAyLjE3LjENCg0KCgo=

