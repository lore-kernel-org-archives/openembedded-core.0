Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.14678.1629896253771913423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 05:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=AqM19yKM;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629896254;
  x=1661432254;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GD4Kf1imnJfpHSPhk+JVW1LyhkOEnEufzLLlhbv0eaA=;
  b=AqM19yKMl/rZnB4s6mFBU3p2X/MOsOgaNUMAuLCThIa+SbGYEMTwrgiu
   yG/2eNw/15C3FGRzTP26J6OVvomXC+cf3EQ/olYdHwtjgvhWQ/jbbhUm2
   YLS9rq8UFkpMh5GyIFdIMiCeCeW4vyaoi+QlcUPFqrgWXaBVkQL6QRddG
   m9S/mkyjlop82pcMnJddHodcQwZDbCE2vnhqdnQ2QcDmPMXfs+gBs+P6H
   0NZ60N43sirvyRhl14Df1kUOvrksPACYdmdJVS6o+8VG9mP9hmRgoo58B
   XNhV/xXqvAJihxBn3TtnZ1+ZJH3L5vYN2u8lXRV2tI011933/5EyOOR0d
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lttng-modules: Make it build when CONFIG_TRACEPOINTS is not enabled again
Thread-Topic: [OE-core] [PATCH] lttng-modules: Make it build when
 CONFIG_TRACEPOINTS is not enabled again
Thread-Index: AQHXmZq3+yt/k+/2fEqDeD2KW0+KaauELanw
Date: Wed, 25 Aug 2021 12:57:31 +0000
Message-ID: <d6c1a107cf6e4a018443f985d554bf1f@axis.com>
References: <20210825094106.11829-1-pkj@axis.com>
 <CAHtQpK7dzG3RPMbPH_5z6-o3p5e0AuLTO+xBW_UX91jSNH7YfA@mail.gmail.com>
In-Reply-To: <CAHtQpK7dzG3RPMbPH_5z6-o3p5e0AuLTO+xBW_UX91jSNH7YfA@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXkgWmhpemhpa2luIDxh
bmRyZXkuekBnbWFpbC5jb20+DQo+IFNlbnQ6IGRlbiAyNSBhdWd1c3RpIDIwMjEgMTI6MjANCj4g
VG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBD
YzogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT47IE9FIENvcmUgbWFp
bGluZyBsaXN0DQo+IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K
PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gbHR0bmctbW9kdWxlczogTWFrZSBpdCBi
dWlsZCB3aGVuDQo+IENPTkZJR19UUkFDRVBPSU5UUyBpcyBub3QgZW5hYmxlZCBhZ2Fpbg0KPiAN
Cj4gSGVsbG8gUGV0ZXIsDQo+IA0KPiBPbiBXZWQsIEF1ZyAyNSwgMjAyMSBhdCAxMTo0MSBBTSBQ
ZXRlciBLamVsbGVyc3RlZHQNCj4gPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4gd3JvdGU6
DQo+ID4NCj4gPiBNYWtlZmlsZS1Eby1ub3QtZmFpbC1pZi1DT05GSUdfVFJBQ0VQT0lOVFMtaXMt
bm90LWVuLnBhdGNoIHdhcyB1cGRhdGVkDQo+ID4gd2l0aCB0aGUgMi4xMy4wIHVwZGF0ZSAoY29t
bWl0IDVkYWQxNWFmKSwgYnV0IHVuZm9ydHVuYXRlbHkgaXQgbm8gbG9uZ2VyDQo+ID4gZGlkIHdo
YXQgaXQgd2FzIGludGVuZGVkIHRvIGRvLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
S2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4gLS0tDQo+ID4g
IC4uLmZhaWwtaWYtQ09ORklHX1RSQUNFUE9JTlRTLWlzLW5vdC1lbi5wYXRjaCB8IDQyICsrKysr
KysrKysrLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
bHR0bmcvbHR0bmctbW9kdWxlcy9NYWtlZmlsZS1Eby1ub3QtDQo+IGZhaWwtaWYtQ09ORklHX1RS
QUNFUE9JTlRTLWlzLW5vdC1lbi5wYXRjaCBiL21ldGEvcmVjaXBlcy0NCj4ga2VybmVsL2x0dG5n
L2x0dG5nLW1vZHVsZXMvTWFrZWZpbGUtRG8tbm90LWZhaWwtaWYtQ09ORklHX1RSQUNFUE9JTlRT
LWlzLQ0KPiBub3QtZW4ucGF0Y2gNCj4gDQo+IEkgZ3Vlc3MgdGhlIHBhdGNoIHlvdSd2ZSByZWZy
ZXNoZWQgaXMgbm90IGEgY29ycmVjdCBvbmUuLi4NCj4gDQo+IFRoZXJlIGlzIGFub3RoZXIgcGF0
Y2ggaW50cm9kdWNlZCBieSBCcnVjZSBpbiB0aGUgY29tbWl0IDE4YmY3YjANCj4gKCJsdHRuZy1t
b2R1bGVzOiB1cGRhdGUgZGV2dXBzdHJlYW0gdG8gdjIuMTMtcmMgIiksIG5hbWVseQ0KPiAwMDAx
LXNyYy1LYnVpbGQtY2hhbmdlLW1pc3NpbmctQ09ORklHX1RSQUNFUE9JTlRTLXRvLXdhcm4ucGF0
Y2gNCj4gDQo+IEl0IG1ha2Ugc2Vuc2UgdG8gcmVmcmVzaCByYXRoZXIgdGhhdCBvbmUgaW5zdGVh
ZCBvZiB0aGUgTWFrZWZpbGUgb25lLA0KPiBhbmQgaGF2ZSBpdCBpbmNsdWRlZCBpbiB0aGUgU1JD
X1VSSSAoc2VlIGRpc2N1c3Npb24gaW4NCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvdG9waWMvODQ5NTAzMDMjMTU0ODg4KS4NCj4gDQo+IC0tDQo+
IFJlZ2FyZHMsDQo+IEFuZHJleS4NCg0KUmlnaHQsIEkgaGFkIG1pc3NlZCB0aGF0IHRoZXJlIHdl
cmUgdHdvIHBhdGNoZXMgZG9pbmcgdGhlIHNhbWUgdGhpbmcgDQoodGhvdWdoIG5laXRoZXIgYWN0
dWFsbHkgc29sdmVkIHRoZSBwcm9ibGVtIGFmdGVyIHRoZSB1cGRhdGUgdG8gMi4xMy4wKS4NCkkg
d2lsbCBzZW5kIGFuIHVwZGF0ZWQgcmV2aWV3IHVuaWZ5aW5nIHRoZSBwYXRjaGVzIGFuZCBhZGRp
bmcgbXkgc29sdXRpb24gDQp0byBkaXNhYmxlIGJ1aWxkaW5nIHRoZSBtb2R1bGUgd2hlbiBDT05G
SUdfVFJBQ0VQT0lOVFMgaXMgbm90IGVuYWJsZWQuDQoNCi8vUGV0ZXINCg0K
