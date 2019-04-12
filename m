Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 62B3B7D20F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 08:57:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,340,1549900800"; d="scan'208";a="59118526"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Apr 2019 16:57:12 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CB3114CD8462;
	Fri, 12 Apr 2019 16:57:16 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0439.000; Fri, 12 Apr 2019 16:57:20 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH] dnf: Enable nativesdk
Thread-Index: AQHU8FhvlfI0HEQjukyuuT4DqezazqY4OmLQ
Date: Fri, 12 Apr 2019 08:57:12 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C131E8@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1554995545-20943-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj_rYwg3Y5uDxKiwzJZrzMsmjLCNXOU2TMpgmB5Ydgt2sw@mail.gmail.com>
In-Reply-To: <CANNYZj_rYwg3Y5uDxKiwzJZrzMsmjLCNXOU2TMpgmB5Ydgt2sw@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: CB3114CD8462.AA096
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf: Enable nativesdk
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
X-List-Received-Date: Fri, 12 Apr 2019 08:57:13 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleDoNCg0KPiA+ICAgICAgICAgZWNobyAnZXhwb3J0IE9FQ09SRV9E
SVNUUk9fVkVSU0lPTj0iJHtESVNUUk9fVkVSU0lPTn0iJyA+PiANCj4gPiAk
c2NyaXB0DQo+ID4gKyAgICAgICBlY2hvICdleHBvcnQgTUFDSElORV9BUkNI
PSR7TUFDSElORV9BUkNIfScgPj4gJHNjcmlwdA0KPiA+IFBsZWFzZSBleHBs
YWluIHdoeSB0aGlzIGNoYW5nZSBpbiB0aGUgY29tbWl0Lg0KDQpEbmYgaXMg
YmFzZWQgb24gcnBtIGFuZCBycG0gbmVlZCB0byByZWFkIHRoZSBhcmNoIGlu
Zm8sIGJ1dCAkc2NyaXB0IGRpZCBub3QgcHJvdmlkZSBpdC4gU28gSSBhZGRl
ZCBpdC4NCg0KPiA+IERvIG5vdCBjb3B5LXBhc3RlIGxhcmdlIGNodW5rcyBs
aWtlIHRoaXMgcGxlYXNlLiBBc3NpZ24gdGhlIA0KPiA+IGRlcGVuZGVuY2ll
cyB0byBhIHZhcmlhYmxlLCBhbmQgdXNlIGl0IHdoZXJlIG5lZWRlZC4NCg0K
SWYgc28sIGhvdyBhYm91dCB0aGlzIHdheT8NCgkNCkJCQ0xBU1NFWFRFTkQg
PSAibmF0aXZlIG5hdGl2ZXNkayINCg0KUkRFUEVORFNfJHtQTn0gKz0gIiBc
DQogICBweXRob24zLWNvcmUgXA0KICAgLi4uLi4uDQogICAiDQoNClJERVBF
TkRTXyR7UE59X2NsYXNzLW5hdGl2ZSA9ICIiDQoNCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpaaGVuZyBS
dW9xaW4NCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBD
by4sIEx0ZC4oRk5TVCkNCkFERFIuOiBOby42IFdlbnpodSBSb2FkLCBTb2Z0
d2FyZSBBdmVudWUsDQogICAgICAgTmFuamluZywgMjEwMDEyLCBDaGluYQ0K
TUFJTCA6IHpoZW5ncnEuZm5zdEBjbi5mdWppc3R1LmNvbQ0KDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gW21haWx0bzphbGV4LmthbmF2aW5AZ21haWwuY29tXQ0KPiBTZW50
OiBUaHVyc2RheSwgQXByaWwgMTEsIDIwMTkgNzoxOSBQTQ0KPiBUbzogWmhl
bmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRz
dS5jb20+DQo+IENjOiBPRS1jb3JlIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSF0gZG5mOiBFbmFibGUgbmF0aXZlc2RrDQo+IA0KPiBPbiBUaHUs
IDExIEFwciAyMDE5IGF0IDA4OjEzLCBaaGVuZyBSdW9xaW4gPHpoZW5ncnEu
Zm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IC0tLSBh
L21ldGEvY2xhc3Nlcy90b29sY2hhaW4tc2NyaXB0cy5iYmNsYXNzDQo+ID4g
KysrIGIvbWV0YS9jbGFzc2VzL3Rvb2xjaGFpbi1zY3JpcHRzLmJiY2xhc3MN
Cj4gPiBAQCAtMTAxLDYgKzEwMSw3IEBAIHRvb2xjaGFpbl9zaGFyZWRfZW52
X3NjcmlwdCAoKSB7DQo+ID4gICAgICAgICBlY2hvICdleHBvcnQgQ1BQRkxB
R1M9IiR7VEFSR0VUX0NQUEZMQUdTfSInID4+ICRzY3JpcHQNCj4gPiAgICAg
ICAgIGVjaG8gJ2V4cG9ydCBLQ0ZMQUdTPSItLXN5c3Jvb3Q9JFNES1RBUkdF
VFNZU1JPT1QiJyA+PiAkc2NyaXB0DQo+ID4gICAgICAgICBlY2hvICdleHBv
cnQgT0VDT1JFX0RJU1RST19WRVJTSU9OPSIke0RJU1RST19WRVJTSU9OfSIn
ID4+DQo+ID4gJHNjcmlwdA0KPiA+ICsgICAgICAgZWNobyAnZXhwb3J0IE1B
Q0hJTkVfQVJDSD0ke01BQ0hJTkVfQVJDSH0nID4+ICRzY3JpcHQNCj4gDQo+
IFBsZWFzZSBleHBsYWluIHdoeSB0aGlzIGNoYW5nZSBpbiB0aGUgY29tbWl0
Lg0KPiANCj4gPiArUkRFUEVORFNfJHtQTn1fY2xhc3MtbmF0aXZlc2RrICs9
ICIgXA0KPiA+ICsgIHB5dGhvbjMtY29yZSBcDQo+ID4gKyAgcHl0aG9uMy1j
b2RlY3MgXA0KPiA+ICsgIHB5dGhvbjMtbmV0Y2xpZW50IFwNCj4gPiArICBw
eXRob24zLWVtYWlsIFwNCj4gPiArICBweXRob24zLXRocmVhZGluZyBcDQo+
ID4gKyAgcHl0aG9uMy1kaXN0dXRpbHMgXA0KPiA+ICsgIHB5dGhvbjMtbG9n
Z2luZyBcDQo+ID4gKyAgcHl0aG9uMy1mY250bCBcDQo+ID4gKyAgbGlicmVw
byBcDQo+ID4gKyAgcHl0aG9uMy1zaGVsbCBcDQo+ID4gKyAgbGliY29tcHMg
XA0KPiA+ICsgIGxpYmRuZiBcDQo+ID4gKyAgcHl0aG9uMy1zcWxpdGUzIFwN
Cj4gPiArICBweXRob24zLWNvbXByZXNzaW9uIFwNCj4gPiArICBweXRob24z
LXJwbSBcDQo+ID4gKyAgcHl0aG9uMy1pbmlwYXJzZSBcDQo+ID4gKyAgcHl0
aG9uMy1qc29uIFwNCj4gPiArICBweXRob24zLWN1cnNlcyBcDQo+ID4gKyAg
cHl0aG9uMy1taXNjIFwNCj4gPiArICBweXRob24zLWdwZyBcDQo+ID4gKyAg
Ig0KPiA+ICsNCj4gPiAgUlJFQ09NTUVORFNfJHtQTn1fY2xhc3MtdGFyZ2V0
ICs9ICJnbnVwZyINCj4gDQo+IERvIG5vdCBjb3B5LXBhc3RlIGxhcmdlIGNo
dW5rcyBsaWtlIHRoaXMgcGxlYXNlLiBBc3NpZ24gdGhlIGRlcGVuZGVuY2ll
cyB0byBhDQo+IHZhcmlhYmxlLCBhbmQgdXNlIGl0IHdoZXJlIG5lZWRlZC4N
Cj4gDQo+IEFsZXgNCj4gDQoNCgoK

