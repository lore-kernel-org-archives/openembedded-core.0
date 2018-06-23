Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 42F12747EC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 10:50:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41424574"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jun 2018 18:50:29 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 8C5F64B41ECF;
	Sat, 23 Jun 2018 18:50:25 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0399.000; Sat, 23 Jun 2018 18:50:29 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH] meta-toolchain: Added dnf-nativesdk into
	cross-development toolchain.
Thread-Index: AQHUAWqD1lbikEZYK0W1x1wfHaU3kaRfHv6w//+zbACAAb0l0P//qc+AgA2DPMA=
Date: Sat, 23 Jun 2018 10:50:27 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363AEB0BC@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527502858-81691-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZVcc+_ocfuYEUBKK0Hbr0SaZEH7CUYKK17gMk+CXwxwg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9A7F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-ege3VdhZ_AR=CpTmOZc3yyO55BOpt0YZNMk+Ww2BpJA@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9E2F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-xJa=pQwc3ORfzjOXqvOyKWHbOFVFPh=oH1J-urrZmKg@mail.gmail.com>
In-Reply-To: <CANNYZj-xJa=pQwc3ORfzjOXqvOyKWHbOFVFPh=oH1J-urrZmKg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 8C5F64B41ECF.AC31F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Sat, 23 Jun 2018 10:50:31 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleO+8mg0KWWVzLCBtb2RpZnlpbmcgdGhlIGltYWdlIHJlY2lwZSBj
YW4gYWN0dWFsbHkgY3VzdG9taXplIHlvdXIgcm9vdCBmaWxlIHN5c3RlbSwg
YXMgbGludXggdmVuZG9ycywgdGhleSBhcmUgZmFtaWxpYXIgd2l0aCBiaXRi
YWtlIGFuZCBpdCdzIHZlcnkgZWFzeSB0byB0aGVtLg0KQnV0LCBhcyBJIGtu
b3csIHRoZXJlIGFyZSBtYW55IHVzZXJzIHdobyBhcmUgbm90IHZlcnkgZmFt
aWxpYXIgd2l0aCBiaXRiYWtlIGJ1dCBhbHNvIHdhbnQgdG8gY3VzdG9taXpl
IHRoZWlyIHJvb3QgZmlsZSBzeXN0ZW0uIEFuZCBpdCdzIGhhcmQgdG8gbWFr
ZSB0aGVtIGxlYXJuIGhvdyB0byB1c2UgYml0YmFrZS4gDQoNClNvIGlmIGRu
Zi1uYXRpdmVzZGsgY2FuIGJlIHVzZWQgaW4gc2RrLCBhcyBsaW51eCB2ZW5k
b3JzLCB0aGV5IG9ubHkgbmVlZCB0byBwcm92aWRlIHJwbSBwYWNrYWdlcyBh
bmQgc2RrIHRvIHVzZXJzIGluc3RlYWQgb2YgdGVhY2hpbmcgdGhlbSBob3cg
dG8gdXNlIGJpdGJha2UuIEF0IGxhc3QsIHVzZXJzIGNhbiB1c2UgZG5mLW5h
dGl2ZXNkayB0byBtYW5hZ2UgdGhlaXIgcGFja2FnZXMgYXMgd2hhdCB0aGV5
IGRvIGluIHRoZWlyIGhvc3QuDQoNClNvIEkgaG9wZSB0byBhZGQgZG5mLW5h
dGl2ZXNkayBpbiB0b29sY2hhaW4uDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpaaGVuZyBSdW9xaW4N
Ck5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0
ZC4oRk5TVCkNCkFERFIuOiBOby42IFdlbnpodSBSb2FkLCBTb2Z0d2FyZSBB
dmVudWUsDQogICAgICAgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KTUFJTCA6
IHpoZW5ncnEuZm5zdEBjbi5mdWppc3R1LmNvbQ0KDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiBbbWFp
bHRvOmFsZXgua2FuYXZpbkBnbWFpbC5jb21dIA0KU2VudDogRnJpZGF5LCBK
dW5lIDE1LCAyMDE4IDEyOjI3IFBNDQpUbzogWmhlbmcsIFJ1b3Fpbi/pg5Eg
6Iul6ZKmIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+DQpDYzogQnVy
dG9uLCBSb3NzIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+OyBPRS1jb3JlIDxv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG1ldGEtdG9vbGNoYWluOiBB
ZGRlZCBkbmYtbmF0aXZlc2RrIGludG8gY3Jvc3MtZGV2ZWxvcG1lbnQgdG9v
bGNoYWluLg0KDQpXaGF0IHlvdSBkZXNjcmliZSBpcyBleGFjdGx5IHdoYXQg
aW1hZ2UgY3JlYXRpb24gZG9lcyAoZWl0aGVyIGRpcmVjdGx5IHRocm91Z2gg
Yml0YmFrZSwgb3IgdmlhICdkZXZ0b29sIGJ1aWxkLWltYWdlJykuIFdoYXQg
YmVuZWZpdHMgYXJlIGluIHJ1bm5pbmcgZG5mIGJ5IGhhbmQgZnJvbSBjb21t
YW5kIGxpbmU/IElmIHRoZSBpZGVhIGlzIHRvIGhhbmQgcGljayBwYWNrYWdl
cyB0byBhZGQgdG8gYW4gaW1hZ2UsIHRoZW4gaXQncyBiZXR0ZXIgdG8ganVz
dCBtb2RpZnkgdGhlIGltYWdlIHJlY2lwZSBvciB1c2UgJ2RldnRvb2wgYnVp
bGQtaW1hZ2UnIGlmIHlvdSBhcmUgZGV2ZWxvcGluZyBhcHBzIGluIGEgd29y
a3NwYWNlLg0KDQpBbGV4DQoNCjIwMTgtMDYtMTUgNDozOSBHTVQrMDM6MDAg
WmhlbmcsIFJ1b3FpbiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPjoN
Cj4gSGkgQWxleDoNCj4NCj4gVGhlc2UgcGFja2FnZXMgYXJlIHRha2VuIGZy
b20geW9jdG8gYnVpbGQgc3lzdGVtLCBhbmQgdGhleSB3aWxsIGJlIGluc3Rh
bGxlZCBpbiB5b3VyIGhvc3QgYXMgcm9vdCBmaWxlIHN5c3RlbSwgdGhlbiB5
b3UgY2FuIGRlcGxveSB0aGUgcm9vdCBmaWxlIHN5c3RlbSB0byB5b3VyIGVt
YmVkZGVkIGRldmljZS4NCj4NCj4gLS0NCj4gWmhlbmcgUnVvcWluDQo+IE5h
bmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4o
Rk5TVCkNCj4gQUREUi46IE5vLjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2
ZW51ZSwNCj4gICAgICAgIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCj4gTUFJ
TCA6IHpoZW5ncnEuZm5zdEBjbi5mdWppc3R1LmNvbQ0KPg0KPg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiBbbWFpbHRvOmFsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+IFNlbnQ6
IFRodXJzZGF5LCBKdW5lIDE0LCAyMDE4IDM6MDMgUE0NCj4gVG86IFpoZW5n
LCBSdW9xaW4v6YORIOiLpemSpiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3Uu
Y29tPg0KPiBDYzogQnVydG9uLCBSb3NzIDxyb3NzLmJ1cnRvbkBpbnRlbC5j
b20+OyBPRS1jb3JlIA0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFU
Q0hdIG1ldGEtdG9vbGNoYWluOiBBZGRlZCBkbmYtbmF0aXZlc2RrIGludG8g
Y3Jvc3MtZGV2ZWxvcG1lbnQgdG9vbGNoYWluLg0KPg0KPiAyMDE4LTA2LTE0
IDY6MzggR01UKzAzOjAwIFpoZW5nLCBSdW9xaW4gPHpoZW5ncnEuZm5zdEBj
bi5mdWppdHN1LmNvbT46DQo+PiBJIHN1Ym1pdHRlZCB0aGlzIHBhdGNoIGFp
bSB0byB1c2UgZG5mIG91dCBvZiBZb2N0byBidWlsZCBzeXN0ZW0gdG8gbWFu
YWdlIHBhY2thZ2VzLg0KPg0KPiBQbGVhc2UgZXhwbGFpbiB0aGlzIGluIGRl
dGFpbC4gV2hlcmUgYXJlIHRoZSBwYWNrYWdlcyB0YWtlbiBmcm9tLCBhbmQg
d2hlcmUgYXJlIHRoZXkgaW5zdGFsbGVkPw0KPg0KPiBBbGV4DQo+DQo+DQo+
DQo+DQoNCg0KCgo=

