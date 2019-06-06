Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0897C326
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 02:39:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,557,1549900800"; d="scan'208";a="66162867"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jun 2019 10:38:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id AE9934CDCEBD;
	Thu,  6 Jun 2019 10:38:56 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0439.000; Thu, 6 Jun 2019 10:39:00 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] toolchain-scripts: make rpm work in toolchain
Thread-Index: AQHU8btdwcW6mVdAkUK2QKbtt/xhNaZCTQiAgAu3nCCAErXeEIAJnYbggBXq34CACzc9gP//nDqAgAMi8ZA=
Date: Thu, 6 Jun 2019 02:39:02 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF129787@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF0FB0C1@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1002A6@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF1026BA@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF123A0E@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01BF128DDD@G08CNEXMBPEKD01.g08.fujitsu.local>
	<cedd7e708edfab28ec9db8046476313ea44a6022.camel@linuxfoundation.org>
In-Reply-To: <cedd7e708edfab28ec9db8046476313ea44a6022.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: AE9934CDCEBD.A2230
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts: make rpm work in toolchain
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
X-List-Received-Date: Thu, 06 Jun 2019 02:39:06 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFJpY2hhcmQNCg0KPiBXaGlsc3QgSSBjYW4gZ3Vlc3Mgd2h5LCBpdHMg
bm90IG9idmlvdXMgYXQgYWxsIHRoZSBkbmYgbmVlZHMNCj4gTUFDSElORV9B
UkNILiBJJ2QgcHJvYmFibHkgYmUgaGFwcGllciB3aXRoIGEgYmV0dGVyIHZh
cmlhYmxlIG5hbWUuDQo+IFdoaWNoIGNvZGUgZXhhY3RseSBpcyB1c2luZyBp
dD8NCg0KQXJjaCBpbmZvcm1hdGlvbiBpcyBuZWNlc3NhcnkgZm9yIHJwbS4g
QXMgd2hhdCBkbyBmb3IgZG5mLW5hdGl2ZSBpbiBfY29uZmlndXJlX3JwbSBm
dW5jdGlvbiwgbmF0aXZlc2RrLWRuZiBoYXMgdG8gZG8gdGhlIHNhbWUgd29y
ay4NCkJ1dCB0aGUgZW52aXJvbm1lbnQgZm9yIG5hdGl2ZXNkayBkb2Vzbid0
IHN1cHBseSBhcmNoIGluZm9ybWF0aW9uLiBJIHRoaW5rIE1BQ0hJTkVfQVJD
SCBpcyBzdWl0YWJsZSB0byBzdXBwbHkgYXJjaCBpbmZvcm1hdGlvbiBmb3Ig
bmF0aXZlc2RrLg0KSG93IGFib3V0IHlvdXIgT3Bpbmlvbj8NCg0KQmVzdCBy
ZWdhcmRzDQpMZWkNCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zw0KPiBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmddDQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMDQsIDIwMTkgNjoyNiBQTQ0K
PiBUbzogTGVpLCBNYW9odWkNCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0hdIHRvb2xjaGFpbi1zY3JpcHRzOiBtYWtlIHJwbSB3b3JrIGlu
IHRvb2xjaGFpbg0KPiANCj4gT24gVHVlLCAyMDE5LTA2LTA0IGF0IDA4OjI5
ICswMDAwLCBMZWksIE1hb2h1aSB3cm90ZToNCj4gPiBIaSBSaWNoYXJkDQo+
ID4NCj4gPiBUaGlzIHBhdGNoIGlzIG5lY2Vzc2FyeSBmb3IgZG5mLW5hdGl2
ZXNkayB3aGljaCBoYXMgYmVlbiBtZXJnZWQuIEJ1dA0KPiA+IHRoaXMgcGF0
Y2ggaXMgc3RpbGwgaWdub3JlZC4NCj4gPiBEbyB5b3UgaGF2ZSBhbnkgY29t
bWVudCBhYm91dCB0aGlzIHBhdGNoPw0KPiANCj4gQmFzaWNhbGx5IEkgcmVh
bGx5IGRvbid0IGxpa2UgZXhwb3J0aW5nICJyYW5kb20iIHZhcmlhYmxlcyBp
biB0aGUgU0RLLA0KPiBwYXJ0aWN1bGFybHkgd2hlbiB0aGUgbWVhbmluZy91
c2Ugb2YgdGhlbSBpc24ndCBjbGVhci4NCj4gDQo+IFdoaWxzdCBJIGNhbiBn
dWVzcyB3aHksIGl0cyBub3Qgb2J2aW91cyBhdCBhbGwgdGhlIGRuZiBuZWVk
cw0KPiBNQUNISU5FX0FSQ0guIEknZCBwcm9iYWJseSBiZSBoYXBwaWVyIHdp
dGggYSBiZXR0ZXIgdmFyaWFibGUgbmFtZS4NCj4gV2hpY2ggY29kZSBleGFj
dGx5IGlzIHVzaW5nIGl0Pw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFy
ZA0KPiANCj4gDQoNCgoK

