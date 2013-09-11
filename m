Return-Path: <peter.kjellerstedt@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBF2D61013
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 14:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 8562E349636;
	Wed, 11 Sep 2013 16:50:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5K9XCl208946; Wed, 11 Sep 2013 16:50:01 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id C5FEC349602;
	Wed, 11 Sep 2013 16:50:00 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 7A2567C9;
	Wed, 11 Sep 2013 16:50:00 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 6A74B559;
	Wed, 11 Sep 2013 16:50:00 +0200 (CEST)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by thoth.se.axis.com (Postfix) with ESMTP id 686CE3404E;
	Wed, 11 Sep 2013 16:50:00 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Wed, 11 Sep 2013 16:50:00 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Darren Hart
	<dvhart@linux.intel.com>
Date: Wed, 11 Sep 2013 16:49:59 +0200
Thread-Topic: [OE-core] [PATCH 2/2] bb-matrix: Make sure local.conf does not
	interfere
Thread-Index: Ac6uPSehkp4bRbjWRAuG68KxILOLjQAvX48Q
Message-ID: <A612847CFE53224C91B23E3A5B48BAC798CD24DEE3@xmail3.se.axis.com>
References: <cover.1378483732.git.pkj@axis.com>
	<398be88b2b4779bc227d9f716ebcc360958e02dd.1378483732.git.pkj@axis.com>
	<1378827198.19978.106.camel@dvhart-mobl4.amr.corp.intel.com>
	<1378827477.3484.166.camel@ted>
	<1378827721.19978.112.camel@dvhart-mobl4.amr.corp.intel.com>
	<1378828074.3484.167.camel@ted>
In-Reply-To: <1378828074.3484.167.camel@ted>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bb-matrix: Make sure local.conf does not interfere
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
X-List-Received-Date: Wed, 11 Sep 2013 14:50:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IGRlbiAxMCBz
ZXB0ZW1iZXIgMjAxMyAxNzo0OA0KPiBUbzogRGFycmVuIEhhcnQNCj4gQ2M6IFBldGVyIEtqZWxs
ZXJzdGVkdDsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzJdIGJiLW1hdHJpeDogTWFrZSBzdXJlIGxvY2Fs
LmNvbmYgZG9lcw0KPiBub3QgaW50ZXJmZXJlDQo+IA0KPiBPbiBUdWUsIDIwMTMtMDktMTAgYXQg
MDg6NDIgLTA3MDAsIERhcnJlbiBIYXJ0IHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAxMy0wOS0xMCBh
dCAxNjozNyArMDEwMCwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4gPiBPbiBUdWUsIDIwMTMt
MDktMTAgYXQgMDg6MzMgLTA3MDAsIERhcnJlbiBIYXJ0IHdyb3RlOg0KPiA+ID4gPiBPbiBGcmks
IDIwMTMtMDktMDYgYXQgMTg6MTIgKzAyMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4g
PiA+ID4gPiBJZiBhbnkgb2YgQkJfTlVNQkVSX1RIUkVBRFMsIFBBUkFMTEVMX01BS0Ugb3IgU1NU
QVRFX0RJUg0KPiBoYXBwZW5lZCB0byBiZQ0KPiA+ID4gPiA+IHNldCBpbiBsb2NhbC5jb25mIHRo
ZW4gdGhlIGJiLW1hdHJpeCBzY3JpcHQgd291bGQgbm90IHBlcmZvcm0NCj4gYXMNCj4gPiA+ID4g
PiBpbnRlbmRlZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtq
ZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+ID4gPiA+IC0tLQ0K
PiA+ID4gPiA+ICBzY3JpcHRzL2NvbnRyaWIvYmItcGVyZi9iYi1tYXRyaXguc2ggfCA0ICsrKysN
Cj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvY29udHJpYi9iYi1wZXJmL2JiLW1hdHJpeC5z
aA0KPiBiL3NjcmlwdHMvY29udHJpYi9iYi1wZXJmL2JiLW1hdHJpeC5zaA0KPiA+ID4gPiA+IGlu
ZGV4IDEwNjQ1NjUuLmQ1MTI3ZTcgMTAwNzU1DQo+ID4gPiA+ID4gLS0tIGEvc2NyaXB0cy9jb250
cmliL2JiLXBlcmYvYmItbWF0cml4LnNoDQo+ID4gPiA+ID4gKysrIGIvc2NyaXB0cy9jb250cmli
L2JiLXBlcmYvYmItbWF0cml4LnNoDQo+ID4gPiA+ID4gQEAgLTUzLDYgKzUzLDEwIEBAIGlmIFsg
JD8gLW5lIDAgXTsgdGhlbg0KPiA+ID4gPiA+ICAJZXhpdCAxDQo+ID4gPiA+ID4gIGZpDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiArIyBNYWtlIHN1cmUgbmVpdGhlciBvZiBCQl9OVU1CRVJfVEhSRUFE
UywgUEFSQUxMRUxfTUFLRSBhbmQNCj4gU1NUQVRFX0RJUiBhcmUgc2V0DQo+ID4gPiA+ID4gKyMg
aW4gbG9jYWwuY29uZg0KPiA+ID4gPiA+ICtzZWQgLXJpDQo+ICdzL14oW1s6c3BhY2U6XV0qKEJC
X05VTUJFUl9USFJFQURTfFBBUkFMTEVMX01BS0V8U1NUQVRFX0RJUilbWzpzcGFjZTpdDQo+IF0q
XD8/PS4qKS8jXDEvJyBjb25mL2xvY2FsLmNvbmYNCj4gPiA+ID4gPiArDQo+ID4gPiA+DQo+ID4g
PiA+IFVubGVzcyBJJ20gbWlzdGFrZW4sIHlvdSBhcmUgbW9kaWZ5aW5nIHRoZSB1c2VycyBsb2Nh
bC5jb25mPw0KPiA+ID4gPg0KPiA+ID4gPiBXZSBkZWZpbml0ZWx5IHNob3VsZCAqbm90KiBiZSBk
b2luZyB0aGF0LiBJIHdvdWxkIHN1cHBvcnQNCj4gZG9jdW1lbnRpbmcNCj4gPiA+ID4gdGhpcyBh
cyBhIHJlcXVpcmVtZW50IGFuZCBldmVuIHByaW50aW5nIGEgd2FybmluZyBpZiBhbnkgb2YgYSBz
ZXQNCj4gb2YNCj4gPiA+ID4gdmFyaWFibGVzIGFyZSBmb3VuZCBpbiB0aGUgYml0YmFrZSBlbnZp
cm9ubWVudC4NCj4gPiA+ID4NCj4gPiA+ID4gTm90ZSB0aGF0IGxvY2FsLmNvbmYgaXMgbm90IHRo
ZSBvbmx5IHBsYWNlIHdoZXJlIHRoZXNlIGNvdWxkIGJlDQo+IHNldC4NCj4gPiA+ID4NCj4gPiA+
ID4gUmljaGFyZCwgc2hvdWxkbid0IHRoZSBlbnYgc2V0dGluZyBvdmVycmlkZSBhbnl0aGluZyBp
bg0KPiBsb2NhbC5jb25mPw0KPiA+ID4NCj4gPiA+IE5vLCBpdCB3aWxsIG92ZXJyaWRlIGEgPz0g
b3IgPz89IGJ1dCBub3QgYSA9Lg0KPiA+DQo+ID4gT0ssIHdlbGwsIGEgd2FybmluZyBpZiBmb3Vu
ZCBpbiBsb2NhbC5jb25mIChvciBzaXRlLmNvbmY/KSBpcw0KPiBwcm9iYWJseQ0KPiA+IHRoZSBi
ZXN0IHdlIGNhbiBkbyBmb3Igbm93LiBXZSBjYW4ndCBjaGVjayBiaXRiYWtlIC1lIHNpbmNlIHRo
YXQgd2lsbA0KPiA+IHJlcG9ydCB0aGUgZGVmYXVsdCB3aGljaCB3ZSB3b3VsZG4ndCBiZSBhYmxl
IHRvIGRpc3Rpbmd1aXNoIGZyb20gYW4NCj4gPiBleHBsaWNpdCBzZXR0aW5nLi4uLiB1bmxlc3Mg
d2UgY2hlY2tlZCBmb3IgYW4gZXhwbGljaXQgYXNzaWdubWVudD8NCj4gTWlnaHQNCj4gPiBiZSBk
b2FibGUuLi4uIGJ1dCBhIHdhcm5pbmcgc2hvdWxkIGJlIHN1ZmZpY2llbnQgZm9yIGEgc2NyaXB0
IGluDQo+ID4gY29udHJpYiwgeWVzPw0KPiANCj4gWWVzLCBhbHRob3VnaCBJIHRoaW5rIGluIHRo
ZSBjb21tZW50cywgYml0YmFrZSAtZSB3aWxsIHRlbGwgeW91IHdoaWNoDQo+IGtpbmQgb2Ygb3Bl
cmF0aW9uIHdhcyB1c2VkIDopDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCk15IHN1
Z2dlc3Rpb24gaXMgdG8gdGVzdCB0aGF0IHRoZSB2YWx1ZXMgY2FuIGJlIHNldCBieSB0aGUgc2Ny
aXB0IA0KYmVmb3JlIHN0YXJ0aW5nIHRoZSB0ZXN0IHJ1bi4gU29tZXRoaW5nIGxpa2UgDQonQkJf
TlVNQkVSX1RIUkVBRFM9MTIzNCBQQVJBTExFTF9NQUtFPSItaiAxMjM0IiBiaXRiYWtlIC1lIGNv
cmUtaW1hZ2UtbWluaW1hbCcNCmFuZCB0aGVuIGdyZXAgZm9yIHRoZSBleHBlY3RlZCB2YWx1ZXMu
IElmIHRoZSBjb3JyZWN0IHZhbHVlcyBhcmUgDQpub3QgZm91bmQgdGhlbiBqdXN0IGFib3J0IHdp
dGggYW4gZXJyb3IgbWVzc2FnZSBhcyB0aGUgc2NyaXB0IHdpbGwgDQpub3QgYmUgYWJsZSB0byBk
byB3aGF0IGl0IGlzIHN1cHBvc2VkIHRvIGRvLg0KDQpJIHdvdWxkIGFsc28gc3VnZ2VzdCBhYm9y
dGluZyBpZiBTU1RBVEVfRElSIGRvZXMgbm90IG1hdGNoIA0KIiQocHdkKS9zc3RhdGUtY2FjaGUi
IHNpbmNlIHRoZSBzY3JpcHQgd291bGQgY2xlYXIgYSBkaXJlY3RvcnkgDQpvdGhlciB0aGFuIHRo
ZSBvbmUgdGhhdCBpcyBhY3R1YWxseSB1c2VkLg0KDQpGaW5hbGx5LCBpZiBTU1RBVEVfTUlSUk9S
UyBpcyBub24tZW1wdHkgSSB3b3VsZCBnZW5lcmF0ZSBhIHdhcm5pbmcuIA0KSSB3b3VsZCBub3Qg
YWJvcnQgaW4gdGhpcyBjYXNlIGFzIGl0IGNhbiBiZSBhIHVzZWZ1bCBzZXR1cCAoZS5nLiwgDQpJ
IHVzZWQgdGhpcyB0byBidWlsZCB3aXRoIGEgc3N0YXRlIGNhY2hlIG1pcnJvciB0aGF0IGNvbnRh
aW5lZCB0aGUgDQpuYXRpdmUgcGFja2FnZXMgYXMgdGhpcyBoYWx2ZWQgdGhlIGJ1aWxkIHRpbWUg
YW5kIEkgdGh1cyBjb3VsZCB0ZXN0IA0KbW9yZSBjb21iaW5hdGlvbnMgb3ZlciBhIHdlZWtlbmQp
Lg0KDQpJJ2xsIHVwZGF0ZSBteSBwYXRjaCBhcyBwZXIgYWJvdmUgdW5sZXNzIHlvdSBoYXZlIG90
aGVyIHN1Z2dlc3Rpb25zLg0KDQovL1BldGVyDQoNCg==

