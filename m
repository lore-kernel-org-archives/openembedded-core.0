Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.278.1589472557987720333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 09:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=AUmdWnPr;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3966; q=dns/txt; s=axis-central1;
  t=1589472558; x=1621008558;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oIt0feJClXVkg7dS9efH2aHtVLAC7y4L+UINlcpD7Vg=;
  b=AUmdWnPrhfslcPrQ7x51DUVO9LEiDRBmhsRsNTkm7Lh8RW3UhnnWPgRS
   xvYhrrVBIboq8ljwkxuKnzp5DqfCEoXDKDyqamFTsAVYsUsqcoKKPxY50
   7NAjnN5P6WfcoAhm0cuS3qITOLhtSGE/Df0XqGKhNfawPy1GfPTRuVoE8
   YceU03yRNgmw/cA4H/NbGi+6AqElaqvQdGuxdpIIsOQGN5Z4E8WWMEh1A
   TpD7Hj+oAwyKd7TLsiGPFZAxOBjH8sX8udtiEmPu/GHdHRU/UPcFZNOLa
   +KupepSNxt4PJz78s+t/6D1AC4oPc/gx7U/tW2slvMBAxoBWV0P3LYzzM
   g==;
IronPort-SDR: qnx66i6nLe5ghb8cgckD8HGW55UZSW6AsLjQBl5uiB3eZGX0RYhFZ4zL3yhEMdAYf2dlHOEm2g
 wmGfPMZgyRstXMWhXbf0Kgs7mG7tJmOXVdlEZsLRh2UH4Z3Z3S2ezoZZ34TBVPalBdz2gCXhM0
 A73MGk1ghU8OwUg3MbNxUABotvF6nvtljG5YTfV0pTZz+sqtq7Aj+rCNhum3wR9cAxoz2bu781
 t+zrJhfE4WxypJULvpU7+pDzjA7ruFcVnPXR9gRZ8cmRZjYLZOutZRP8sAau58dtFj9dkVeesm
 G7s=
X-IronPort-AV: E=Sophos;i="5.73,391,1583190000"; 
   d="scan'208";a="8493350"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] file: Remove unneccessary override of PACKAGECONFIG for native
Thread-Topic: [OE-core] [PATCH] file: Remove unneccessary override of
 PACKAGECONFIG for native
Thread-Index: AQHWKKtxTrrfi65m7k6lINv3+4+rbaimOU5wgAAN4ICAACG/AIAAFX0AgAFBqWA=
Date: Thu, 14 May 2020 16:09:14 +0000
Message-ID: <9cb273ff020547c782b8dd42a4c85470@XBOX03.axis.com>
References: <20200512214255.20678-1-pkj@axis.com>
 <CAJ86T=U-0v06iC5wm8opzJSO5a7k8a_a_NncF4N5ep6BwnBGTw@mail.gmail.com>
 <12d3b34c48784a218feef04fbc1463e4@XBOX03.axis.com>
 <CAJ86T=Wf5n_PqiB9X8fYjdyYMwh=WakmVHjMfCVETKec4peZbA@mail.gmail.com>
 <764c9a365a510d22a5df20e4e510c4e9e4ab633b.camel@linuxfoundation.org>
 <CAJ86T=X5=DGSw30e3os8bm=T5V6UXHMhLGPjB=xykyqjY-ijog@mail.gmail.com>
In-Reply-To: <CAJ86T=X5=DGSw30e3os8bm=T5V6UXHMhLGPjB=xykyqjY-ijog@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZSBNY0N1cmR5IDxhcm1j
Y3VyZHlAZ21haWwuY29tPg0KPiBTZW50OiBkZW4gMTQgbWFqIDIwMjAgMDA6NDkNCj4gVG86IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBDYzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBPRSBDb3Jl
IG1haWxpbmcNCj4gbGlzdCA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGZpbGU6IFJlbW92ZSB1bm5lY2Nl
c3Nhcnkgb3ZlcnJpZGUgb2YNCj4gUEFDS0FHRUNPTkZJRyBmb3IgbmF0aXZlDQo+IA0KPiBPbiBX
ZWQsIE1heSAxMywgMjAyMCBhdCAyOjMxIFBNIFJpY2hhcmQgUHVyZGllDQo+IDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjAtMDUtMTMg
YXQgMTI6MzAgLTA3MDAsIEFuZHJlIE1jQ3VyZHkgd3JvdGU6DQo+ID4gPiBZZXMuIFVuZm9ydHVu
YXRlbHkgbWFraW5nIHJlY2lwZXMgcm9idXN0IGZvciB1c2VycyB3aG8gd2FudCB0byBjaGFuZ2UN
Cj4gPiA+IFBBQ0tBR0VDT05GSUcgdmFsdWVzIGRvZXNuJ3Qgc2VlbSB0byBiZSBhIGhpZ2ggcHJp
b3JpdHkgZm9yIG9lLWNvcmUuDQo+ID4gPiBXaHkgZWxzZSB3b3VsZCBkZWZhdWx0IFBBQ0tBR0VD
T05GSUcgdmFsdWVzIGJlIGFzc2lnbmVkIHdpdGggPz89DQo+ID4gPiBpbnN0ZWFkIG9mID89IG90
aGVyIHRoYW4gYXMgYSB0cmFwIGZvciBuZXcgdXNlcnM/DQo+ID4NCj4gPiBJJ20gbm90IHN1cmUg
SSB1bmRlcnN0YW5kIHRoYXQsIGVxdWFsbHkgSSdtIHRpcmVkIHNvIEknbGwgYXNzdW1lIEknbQ0K
PiA+IGp1c3QgbWlzc2luZyBzb21ldGhpbmcuDQo+ID4NCj4gPiBJIHdpbGwgc2F5IHRoYXQgdGhl
cmUgaXMgbm8gaW50ZW50aW9uIHRvIG1ha2UgT0UtQ29yZSBoYXJkIHRvIHVzZSBvcg0KPiA+IG5v
dCByb2J1c3QsIGl0cyBvbmx5IGFzIGdvb2QgYSB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyBtYWtl
IGl0LiBJbiB0aGlzDQo+ID4gY2FzZSBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kL3NlZSB0aGUg
cHJvYmxlbS4NCj4gPg0KPiA+IElmIHdlIHNob3VsZCBiZSB1c2luZyA/PSBpbnN0ZWFkIG9mID8/
PSB0aGVuIEknbSBvcGVuIHRvIGFuIGV4cGxhbmF0aW9uDQo+ID4gd2h5IGFuZCBwYXRjaGVzIHRv
IGltcHJvdmUgdGhpbmdzLg0KPiANCj4gSWYgdGhlIGRlZmF1bHQgaXMgYXNzaWduZWQgd2l0aCA/
Pz0gdGhlbiB0cnlpbmcgdG8gYWRkIHRvIGl0IHdpdGggKz0NCj4gcmVzdWx0cyBpbiB0aGUgZGVm
YXVsdCB2YWx1ZSBiZWluZyBsb3N0LiBJZiB0aGUgZGVmYXVsdCBpcyBhc3NpZ25lZA0KPiB3aXRo
ID89IHRoZW4gYWRkaW5nIHRvIGl0IHdpdGggKz0gd29ya3MgYXMgZXhwZWN0ZWQuDQo+IA0KPiBU
byByb2J1c3RseSBlbmFibGUgYSBuZXcgUEFDS0FHRUNPTkZJRyBvcHRpb24sIHVzZXJzIG5lZWQg
dG8gbGVhcm4gdG8NCj4gdXNlIFBBQ0tBR0VDT05GSUdfYXBwZW5kIChhbmQgb2J2aW91c2x5IGxl
YXJuIGFib3V0IHRoZSBsZWFkaW5nIHNwYWNlDQo+IHJlcXVpcmVtZW50IHRoZXJlIHRvbykgYW5k
IG5vdCB0byB0cnkgUEFDS0FHRUNPTkZJRyArPS4NCj4gDQo+IFRoZSByZWZlcmVuY2UgbWFudWFs
IGRvZXMgYXQgbGVhc3QgaGF2ZSBhbiBleGFtcGxlIHdoaWNoIHVzZXMgX2FwcGVuZC4NCj4gSG93
ZXZlciBpdCBkb2Vzbid0IG1lbnRpb24gdGhhdCArPSBpc24ndCBzYWZlIG9yIHRoYXQgX2FwcGVu
ZCB3aWxsDQo+IGFmZmVjdCBuYXRpdmUoc2RrKSBhbmQgdGhlcmVmb3JlIF9hcHBlbmRfY2xhc3Mt
dGFyZ2V0IGlzIHRoZSBzYWZlc3QNCj4gYXBwcm9hY2guDQo+IA0KPiA+IFVuZm9ydHVuYXRlbHkg
d2UgZG8gaGF2ZSBxdWl0ZSBzb21lIGxlZ2FjeSBhbmQgPz89IHZzID89IGhhcyBiZWVuDQo+ID4g
dHJvdWJsZXNvbWUgaW4gdGhlIG1hbnkgZGlmZmVyZW50IGNvbnRleHRzIHdlIGhhdmUgKHJlY2lw
ZSwgY2xhc3MsDQo+ID4gY29uZiwgaW5jIGFuZCBzbyBvbikuDQoNCkFjdHVhbGx5LCBJIGhhdmUg
YWx3YXlzIHdvbmRlcmVkIHdoeSB0aGUgcmVjaXBlcyBpbiBPRS1Db3JlIHR5cGljYWxseSANCnVz
ZSBQQUNLQUdFQ09ORklHID8/PSAiLi4uIiB3aGVuIG5vIG90aGVyIHZhcmlhYmxlcyAoaW4gdGhl
IHJlY2lwZXMpIA0KYXJlIGRlZmluZWQgdGhhdCB3YXkuIEFmdGVyIGFsbCwgaWYgSSB3YW50IHRv
IG92ZXJyaWRlIHRoZSBkZWZhdWx0IA0KdmFsdWUgaW4gYSBiYmFwcGVuZCBhcyBQQUNLQUdFQ09O
RklHID0gIi4uLiIsIHRoYXQgd29ya3MganVzdCBhcyB3ZWxsIA0KaWYgdGhlIHZhcmlhYmxlIGlz
IGRlZmluZWQgdXNpbmcgPSByYXRoZXIgdGhhbiA/PSBvciA/Pz0uIEFuZCBpZiBJIGRvIA0KaXQg
aW4gbG9jYWwuY29uZiwgSSB3b3VsZCB0eXBpY2FsbHkgZG8gaXQgdXNpbmcgUEFDS0FHRUNPTkZJ
R19wbi1mb28gDQphbmQgdGhlbiBpdCBhbHNvIGRvZXNuJ3QgbWF0dGVyIHdoZXRoZXIgPSBvciA/
Pz0gd2FzIHVzZWQgdG8gZGVmaW5lIA0KdGhlIGRlZmF1bHQgaW4gdGhlIHJlY2lwZS4gQWRkIHRv
IHRoYXQgdGhlIGNvbXBsaWNhdGlvbnMgd2l0aCBub3QgDQpiZWluZyBhYmxlIHRvIHVzZSArPSB0
b2dldGhlciB3aXRoID8/PSBpbiBhIHNlbnNpYmxlIHdheSwgaXQgZXZlbiANCm1ha2VzIGxlc3Mg
c2Vuc2UuDQoNCkZvciB0aGUgcmVjb3JkLCBpbiBvdXIgb3duIHJlY2lwZXMgd2UgdXNlIFBBQ0tB
R0VDT05GSUcgPSAiLi4uIiBpbiB0aGUgDQpyZWNpcGVzIGFuZCB0aGF0IHdvdWxkIGJlIG15IHJl
Y29tbWVuZGF0aW9uIGZvciBPRS1Db3JlIGFzIHdlbGwuDQoNCi8vUGV0ZXINCg0K
