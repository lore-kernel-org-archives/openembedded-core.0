Return-Path: <Vijaikumar_Kanagarajan@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A8EC433FE
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:21:37 +0000 (UTC)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web11.1157.1652811689820950104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: vijaikumar_kanagarajan@mentor.com)
X-IronPort-AV: E=Sophos;i="5.91,233,1647331200";
   d="scan'208";a="75983710"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 17 May 2022 10:21:29 -0800
IronPort-SDR: 
 RjleWsMFXv2b7SjD6xSwFifpw6N830NAtVKaGN7us9pFaT8D9gEIcSI1D/YGW76gADTto1z5nI
 TqeSmVBIDYdVE2vO9NzRixxE1VIRP4UebD5jQ0gmOoYRAwcR3TblcjqYcvH7g0k0Otpl6AFR5P
 NqM9AkJp8uZokZD+tSHEjo/itMyWCCP74zSfSMRxfQWxxJT1i54zV9d+A8VUNQ7rGL5kUTL24U
 1SA9aMditH9OvMal4h5TymgNj2PqwE97+d1baqrMRQmBdAmZqlRxPGsfbazJ8GD7TXKUH6LKWL
 1Mg=
From: "Kanagarajan, Vijaikumar" <Vijaikumar_Kanagarajan@mentor.com>
To: "Schmidl, Tobias (T CED SES-DE)" <tobiasschmidl@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ch@denx.de" <ch@denx.de>, "Schild, Henning (T CED SES-DE)"
	<henning.schild@siemens.com>
Subject: RE: [PATCH v2] wic: added fspassno parameter to partition
Thread-Topic: [PATCH v2] wic: added fspassno parameter to partition
Thread-Index: AQHYaCYcL1sI8N1/1ku9VI64UkP3H60j2XQA//+K6+A=
Date: Tue, 17 May 2022 18:21:27 +0000
Message-ID: <401b98473f564084a6da6a550cc95236@mentor.com>
References: <20220513164044.4ad41b6b@md1za8fc.ad001.siemens.net>
	 <20220515063600.777146-1-Vijaikumar_Kanagarajan@mentor.com>
 <09076afadfa0c49f65ea4d2d113fb9c6490f49ea.camel@siemens.com>
In-Reply-To: <09076afadfa0c49f65ea4d2d113fb9c6490f49ea.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:21:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165744

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2NobWlkbCwgVG9iaWFz
IChUIENFRCBTRVMtREUpIDx0b2JpYXNzY2htaWRsQHNpZW1lbnMuY29tPg0KPiBTZW50OiAxNyBN
YXkgMjAyMiAyMzo0Ng0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZzsgS2FuYWdhcmFqYW4sDQo+IFZpamFpa3VtYXIgPFZpamFpa3VtYXJfS2FuYWdhcmFqYW5A
bWVudG9yLmNvbT4NCj4gQ2M6IGNoQGRlbnguZGU7IFNjaGlsZCwgSGVubmluZyAoVCBDRUQgU0VT
LURFKQ0KPiA8aGVubmluZy5zY2hpbGRAc2llbWVucy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjJdIHdpYzogYWRkZWQgZnNwYXNzbm8gcGFyYW1ldGVyIHRvIHBhcnRpdGlvbg0KPiANCkhp
IFRvYmlhcywNCg0KPiBIaSBhbGwsDQo+IA0KPiBPbiBTdW4sIE1heSAxNSwgMjAyMiBhdCAwODoz
NiBBTSwgS2FuYWdhcmFqYW4sIFZpamFpa3VtYXIgd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBDbGF1
ZGl1cyBIZWluZSA8Y2hAZGVueC5kZT4NCj4gPg0KPiA+IFRoZSBgZnNwYXNzbm9gIHBhcmFtZXRl
ciBhbGxvd3MgdG8gb3ZlcndyaXRlIHRoZSB2YWx1ZSBvZiB0aGUgbGFzdA0KPiA+IGNvbHVtbiAo
YGZzX3Bhc3Nub2ApIGluIHRoZSAvZXRjL2ZzdGFiIG9mIHRoZSB0YXJnZXQgcm9vdCBmaWxlIHN5
c3RlbS4NCj4gPiBUaGlzIGFsbG93cyB0byBoYXZlIHBlcmlvZGljIGZpbGUgc3lzdGVtIGNoZWNr
cy4NCj4gPg0KPiANCj4gSSd2ZSBmb3VuZCB0aGlzIHRvIGJlIGluZWZmZWN0aXZlIGZvciBgL2As
IGFzIHRoZSBmc3RhYiB1cGRhdGUgaXMgZXhwbGljaXRseQ0KPiBvbWl0dGVkIGluIGBzY3JpcHRz
L2xpYi93aWMvcGx1Z2lucy9pbWFnZXIvZGlyZWN0LnB5OjEyMGA6DQoNCkkgYmVsaWV2ZSB3aWMg
aGFzIGNoYW5nZWQgbXVjaCBzaW5jZSB0aGUgZmlyc3QgYXBwZWFyYW5jZSBvZiB0aGlzIHBhdGNo
Lg0KDQo+IA0KPiBgYGANCj4gZm9yIHBhcnQgaW4gc2VsZi5wYXJ0czoNCj4gICAgIGlmIG5vdCBw
YXJ0LnJlYWxudW0gb3Igbm90IHBhcnQubW91bnRwb2ludCBcDQo+ICAgICAgICBvciBwYXJ0Lm1v
dW50cG9pbnQgPT0gIi8iIG9yIG5vdCBwYXJ0Lm1vdW50cG9pbnQuc3RhcnRzd2l0aCgnLycpOg0K
PiAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiAgICAgICAgIGNvbnRpbnVlDQo+
IGBgYA0KPiANCj4gSSd2ZSBjcmVhdGVkIGEgcGF0Y2gsIG9yaWdpbmFsbHkgZm9yIGRpZmZlcmVu
dCByZWFzb25zLCB0aGF0IHdpbGwgYWxzbyBhZGRyZXNzIHRoaXMNCj4gaXNzdWUuDQoNCklmIHlv
dSBjYW4gc2VuZCB0aGF0LCB3ZSBjYW4gZHJvcCB0aGlzIHBhdGNoIGluIGZhdm91ciBvZiBpdC4N
Cg0KVGhhbmtzLA0KVmlqYWkgS3VtYXIgSw0KDQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IA0KPiBU
b2JpYXMNCg0K

