Return-Path: <steffen.pankratz@elektrobit.com>
Received: from smtpgw1fi.elektrobit.com (smtpgw1fi.elektrobit.com
	[194.136.18.128])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB8B73EF0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 07:27:11 +0000 (UTC)
Received: from smtpgw1fi.ebgroup.elektrobit.com (localhost [127.0.0.1])
	by smtpgw1fi.elektrobit.com (8.14.4/8.14.4) with ESMTP id
	t477RBPe028589
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Thu, 7 May 2015 10:27:12 +0300
Received: (from defang@localhost)
	by smtpgw1fi.ebgroup.elektrobit.com (8.14.4/8.14.4/Submit) id
	t477RAav028586 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 May 2015 10:27:10 +0300
X-Authentication-Warning: smtpgw1fi.ebgroup.elektrobit.com: defang set sender
	to <steffen.pankratz@elektrobit.com> using -f
Received: from encgw2fi.ebgroup.elektrobit.com ([172.16.0.99])
	by smtpgw1fi.ebgroup.elektrobit.com (envelope-sender
	<steffen.pankratz@elektrobit.com>) (MIMEDefang) with ESMTP id
	t477RAsL028582; Thu, 07 May 2015 10:27:10 +0300
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by encgw2fi.ebgroup.elektrobit.com (Postfix) with ESMTPS;
	Thu,  7 May 2015 10:27:09 +0300 (EEST)
Received: from DEERES07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001]) by
	deeres07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001%11]) with
	mapi id 14.03.0181.006; Thu, 7 May 2015 09:27:09 +0200
From: <Steffen.Pankratz@elektrobit.com>
To: <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] KBUILD_DEFCONFIG issue
Thread-Index: AdCHy8mNwemc7nqvT9WbRYFX+Nr+pgAHi+KAAASVqCD//+lLgP//2fSwgAAscYD//r0JQA==
Date: Thu, 7 May 2015 07:27:08 +0000
Message-ID: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FF09@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
	<CADkTA4PBkRTKFN7UFqZrpHTaZY2ANWqEQodu317XJer02p4mqw@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FCED@deeres07.ebgroup.elektrobit.com>
	<CADkTA4Ob1CLekk=Y+u+AfBZq_E4_9xHJbFc548Po0Utsx-tdRA@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FD16@deeres07.ebgroup.elektrobit.com>
	<CADkTA4NuJG11-9O6EJoEE0QE85Ng4WCWiuqo4dxnnkonAVSphA@mail.gmail.com>
In-Reply-To: <CADkTA4NuJG11-9O6EJoEE0QE85Ng4WCWiuqo4dxnnkonAVSphA@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.26.198]
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [127.0.0.1]);
	Thu, 07 May 2015 10:27:12 +0300 (EEST)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [172.16.0.202]);
	Thu, 07 May 2015 10:27:10 +0300 (EEST)
X-Virus-Scanned: at elektrobit.com
X-Scanned-By: MIMEDefang 2.76 on 172.16.0.202
Cc: openembedded-core@lists.openembedded.org
Subject: Re: KBUILD_DEFCONFIG issue
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
X-List-Received-Date: Thu, 07 May 2015 07:27:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBB
c2hmaWVsZCBbbWFpbHRvOmJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4g
U2VudDogV2VkbmVzZGF5LCBNYXkgMDYsIDIwMTUgNDowMCBQTQ0KPiBUbzog
UGFua3JhdHosIFN0ZWZmZW4NCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Np
b25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gS0JVSUxEX0RFRkNPTkZJRyBpc3N1ZQ0KDQo+ID4+ID4+ID4g
SSBhbSBpbiB0aGUgcHJvY2VzcyBvZiBjcmVhdGluZyBhIGJvYXJkIHN1cHBv
cnQgcGFja2FnZSAoMSkgZm9yDQo+ID4+ID4+ID4gTlZJRElBcw0KPiA+PiA+
PiBKZXRzb24gVEsxIGJvYXJkICgyKS4NCg0KWy4uLl0NCg0KDQo+ID4+ID4+
ID4gQW5vdGhlciwgcHJvYmFibHkgdW5yZWxhdGVkIHByb2JsZW0gSSBmYWNl
IHJpZ2h0IG5vdyBpcywgdGhhdA0KPiA+PiA+PiA+IGJhc2ljYWxseQ0KPiA+
PiA+PiBtb3N0IG9mIHRoZSBvcHRpb25zIG9mIHRoZSB0ZWdyYV9kZWZjb25m
aWcgZ2V0IHJlbW92ZWQgYnkNCj4ga2NvbmZfY2hlY2suDQo+ID4+ID4+ID4g
VGhlIGtlcm5lbCBnZXRzIGJ1aWxkLCB0aGVyZSBhcmUgbm8gd2FybmluZ3Mg
dGhhdCB0aGluZ3MgZ290DQo+ID4+ID4+ID4gcmVtb3ZlZCBidXQNCj4gPj4g
Pj4gaW4gdGhlIGZpbGVzIGluIC5tZXRhL2NmZy9zdGFuZGFyZC9qZXRzb24t
dGsxICBJIHNlZSBmb3IgZXhhbXBsZToNCj4gPj4gPj4gPg0KPiA+PiA+PiA+
IFZhbHVlIHJlcXVlc3RlZCBmb3IgQ09ORklHX0FSQ0hfVEVHUkFfMTI0X1NP
QyBub3QgaW4gZmluYWwNCj4gPj4gPj4gPiAuY29uZmlnDQo+ID4+ID4+IFJl
cXVlc3RlZCB2YWx1ZTogIENPTkZJR19BUkNIX1RFR1JBXzEyNF9TT0M9eSBB
Y3R1YWwgdmFsdWU6DQo+ID4+ID4+ID4NCj4gPj4gPj4gPiBBbnkgaWRlYXM/
DQo+ID4+ID4+DQo+ID4+ID4+IFRoZSBjaGVja2luZyBvZiB0aGUgZGVmY29u
ZmlnIGlzIGluaGliaXRlZCBvbiBwdXJwb3NlLiBJIG9ubHkNCj4gPj4gPj4g
YWRkZWQgdGhlIGZ1bmN0aW9uYWxpdHkgYXMgYW4gYXNzaXN0L2NydXRjaCBm
b3IgZm9sa3MgdGhhdCBoYXZlbid0DQo+ID4+ID4+IG1pZ3JhdGVkIHRvIGEg
YmFzZSBjb25maWcgKyBmcmFnbWVudHMuDQo+ID4+ID4+DQo+ID4+ID4+IEEg
ZGVmY29uZmlnIGRvZXMgbm90IHNwZWNpZnkgd2hldGhlciBvciBub3Qgb3B0
aW9ucyBhcmUgaW1wb3J0YW50DQo+ID4+ID4+IGZvciB0aGUgYm9hcmQgb3Ig
bm90LCB3aGV0aGVyIG9yIG5vdCBpdCBpcyBhIGZ1bGwgZGVmY29uZmlnIG9y
IGENCj4gPj4gPj4gbWluaW1hbCBjb25maWcsDQo+ID4+IGV0Yy4NCj4gPj4g
Pj4gV2l0aG91dCB0aGF0DQo+ID4+ID4+IGV4dHJhIGluZm9ybWF0aW9uIGdl
bmVyYXRpbmcgc2NyZWVucyBmdWxsIG9mIHdhcm5pbmdzIGlzbid0DQo+ID4+
ID4+IHVzZWZ1bCwgc28gaXQgaXNuJ3QgZ2VuZXJhdGVkIGF0IGFsbC4NCj4g
Pj4gPg0KPiA+PiA+IEkgYW0gbm90IHF1aXRlIHN1cmUgd2hhdCB0aGUgY29y
cmVjdCB3YXkgd291bGQgYmUgdG8gY29udGludWUgYW5kDQo+ID4+ID4gZ2V0
IGENCj4gPj4ga2VybmVsIHdpdGggZXZlcnl0aGluZyBJIG5lZWQgYW5kIHdh
bnQuDQo+ID4+ID4gVGhlIGNvbmZpZyBzcGVjaWZpZWQgaW4gS0JVSUxEX0RF
RkNPTkZJRyBnZXRzIHN0cmlwcGVkIG9mIG1hbnkNCj4gPj4gbmVjZXNzYXJ5
IG9wdGlvbnMgbmVlZCBmb3IgdGhlIGJvYXJkLg0KPiA+PiA+IFNvIHRoaXMg
aXMgb2J2aW91c2x5IG5vdCB0aGUgcmlnaHQgYXBwcm9hY2guDQo+ID4+DQo+
ID4+IEl0IHdvdWxkIGJlIHRoZSBrZXJuZWwgY29uZmlndXJhdGlvbiBzdWJz
eXN0ZW0gdGhhdCBpcyBzdHJpcHBpbmcgdGhlDQo+ID4+IGNoYW5nZXMgd2hl
biBpdCBwcm9jZXNzZXMgdGhlIC5jb25maWcgKGkuZS4gbm90aGluZyBpbiB0
aGUgWW9jdG8NCj4gPj4gcHJvY2Vzc2luZyBvZiB0aG9zZSBzYW1lIGZyYWdt
ZW50cykuDQo+ID4+DQo+ID4+IElmIHlvdSBtYW51YWxseSBjb3B5IHRoZSBk
ZWZjb25maWcgaW50byBwbGFjZSBhbmQgZG8gYSBtYWtlDQo+ID4+IG9sZGNv
bmZpZywgYXJlIHlvdSBzZWVpbmcgbG90cyBvZiBkZWx0YSBhbmQgcXVlc3Rp
b25zIGJlaW5nIGFza2VkID8NCj4gPg0KPiA+IEkgZGlkIG5vdCBzZWUgYW55
IHF1ZXN0aW9ucyBvciBkZWx0YXM6DQo+ID4NCj4gPiBiaXRiYWtlIHZpcnR1
YWwva2VybmVsIC1jIGRldnNoZWxsDQo+ID4NCj4gPiBUaGVuOg0KPiA+DQo+
ID4gY3AgYXJjaC9hcm0vY29uZmlncy90ZWdyYV9kZWZjb25maWcgLmNvbmZp
ZyBtYWtlIG9sZGNvbmZpZw0KPiANCj4gb2RkLiBJcyB0aGlzIHNvbWV0aGlu
ZyBJIGNhbiByZXByb2R1Y2UgbG9jYWxseSA/IElmIHlvdSBlbWFpbCBtZSB0
aGUgZGV0YWlscywNCj4gSSdsbCBwb2tlIGF0IGl0IGFuZCBvZmZlciBzb21l
IHN1Z2dlc3Rpb25zLg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGluIGFkdmFu
Y2UgQnJ1Y2UuDQoNCkkgdGhpbmsgdGhlIGVhc2llc3QgdGhpbmcgd291bGQg
YmUgdG8gZ2V0IHBva3kgKGRpenp5IGJyYW5jaCksIG1ldGEtb3BlbmVtYmVk
ZGVkIChkaXp6eSBicmFuY2gpIGFuZCBtZXRhLWpldHNvbi10azEgKDEpLg0K
QXBwbHkgdGhlIHBhdGNoIEkgc2VuZCAodG8gcGF0Y2gga2VybmVsLXlvY3Rv
LmJiY2xhc3MpIGFuZCBidWlsZCBhbiBpbWFnZSBmb3IgTUFDSElORSBqZXRz
b24tdGsxLg0KSSB3YXMgYnVpbGRpbmcgdGhlIGNvcmUtaW1hZ2Utd2VzdG9u
LCBidXQgSSB0aGluayB0aGUgdHlwZSBvZiBpbWFnZSB1c2VkLCBkb2Vzbid0
IG1hdHRlciBpbiByZWdhcmRzIHRvIG15IGtlcm5lbCBpc3N1ZS4NCg0KKDEp
IGh0dHBzOi8vYml0YnVja2V0Lm9yZy9rcmF0ejAwL21ldGEtamV0c29uLXRr
MQ0KDQoNCi0tIA0KUmVnYXJkcw0KLVN0ZWZmZW4NCgoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpQbGVhc2Ugbm90ZTogVGhpcyBlLW1haWwgbWF5IGNvbnRhaW4g
Y29uZmlkZW50aWFsIGluZm9ybWF0aW9uCmludGVuZGVkIHNvbGVseSBmb3Ig
dGhlIGFkZHJlc3NlZS4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcwplLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBkbyBub3QgZGlzY2xvc2UgaXQgdG8gYW55
b25lLCBub3RpZnkKdGhlIHNlbmRlciBwcm9tcHRseSwgYW5kIGRlbGV0ZSB0
aGUgbWVzc2FnZSBmcm9tIHlvdXIgc3lzdGVtLgpUaGFuayB5b3UuCgo=

