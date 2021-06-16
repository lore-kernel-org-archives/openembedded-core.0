Received: from mail.irisgmbh.de (mail.irisgmbh.de [81.169.172.79])
 by mx.groups.io with SMTP id smtpd.web12.344.1623878058982626133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 14:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: iris-sensing.com, ip: 81.169.172.79, mailfrom: jasper.orschulko@iris-sensing.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.irisgmbh.de (Postfix) with ESMTP id 01E7731E032F;
	Wed, 16 Jun 2021 23:14:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at irisgmbh.de
Received: from mail.irisgmbh.de ([127.0.0.1])
	by localhost (s15324379.rootmaster.info [127.0.0.1]) (amavisd-new, port 10027)
	with ESMTP; Wed, 16 Jun 2021 23:14:15 +0200 (CEST)
Received: from ERDE.irisgmbh.local (unknown [213.61.209.158])
	by mail.irisgmbh.de (Postfix) with ESMTPS id DAD0A31E032D;
	Wed, 16 Jun 2021 23:14:15 +0200 (CEST)
Received: from ERDE.irisgmbh.local ([172.30.10.11]) by ERDE.irisgmbh.local
 ([172.30.10.11]) with mapi id 14.03.0513.000; Wed, 16 Jun 2021 23:14:15 +0200
From: "Jasper Orschulko" <Jasper.Orschulko@iris-sensing.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core][dunfell][PATCH] expat: fix CVE-2013-0340
Thread-Topic: [OE-core][dunfell][PATCH] expat: fix CVE-2013-0340
Thread-Index: AQHXYr4X6VpgCZmqTk+AGKWQhl9RtasW0QmAgAAAjYCAADBHgA==
Date: Wed, 16 Jun 2021 21:14:14 +0000
Message-ID: <41ae8b6bc10f76a7162e4fd3112d80b66bc3ccc6.camel@iris-sensing.com>
References: <168917379DAE252D.8130@lists.openembedded.org>
	 <168922F3778E5D40.4659@lists.openembedded.org>
	 <7fe93e7ea9a4c0e770f90897d4af8e0a2c0bc816.camel@iris-sensing.com>
In-Reply-To: <7fe93e7ea9a4c0e770f90897d4af8e0a2c0bc816.camel@iris-sensing.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.10.1]
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AF7BB38C288884C93A4E60FEA83CA02@irisgmbh.local>
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQ0KSGFzaDogU0hBMjU2DQoNCkkganVz
dCBub3RpY2VkIChhZGRpdGlvbmFsbHkgdG8gdGhlIGZhY3QgdGhhdCBJIG1lc3NlZCB1cCB0aGUg
cGF0aCBpbg0KbXkgcGF0Y2gpLCB0aGF0IHRoZSBvcmlnaW5hbCBkb19jb25maWd1cmVfcHJlcGVu
ZCB0YXNrIGFjdHVhbGx5IGlzIG5vdA0KbmVjZXNzYXJ5LCBhcyB0aGVyZSBpcyBubyAke1N9L2Nv
bmZ0b29scy9saWJ0b29sLm00IGluIHRoZSAyLjkuOQ0KcmVsZWFzZSAobmVpdGhlciBnaXQsIG5v
ciBzb3VyY2Vmb3JnZSkuIFdoaWxlIHJlbW92aW5nIGEgbm9uLWV4aXN0aW5nDQpmaWxlIGRvZXMg
bm8gaGFybSwgSSB3aWxsIHByb3ZpZGUgYSBuZXcgcGF0Y2ggdG9tb3Jyb3cgd2l0aG91dCB0aGlz
DQp0YXNrLCBmb3IgdGlkaW5lc3MnIHNha2UuIDspIA0KDQotIC0tIA0KV2l0aCBiZXN0IHJlZ2Fy
ZHMNCg0KSmFzcGVyIE9yc2NodWxrbw0KRGV2T3BzIEVuZ2luZWVyDQoNClRlbC4gKzQ5IDMwIDU4
IDU4IDE0IDI2NQ0KRmF4ICs0OSAzMCA1OCA1OCAxNCA5OTkNCkphc3Blci5PcnNjaHVsa29AaXJp
cy1zZW5zaW5nLmNvbQ0KDQrigKIg4oCiIOKAoiDigKIg4oCiIOKAoiDigKIg4oCiIOKAoiDigKIg
4oCiIOKAoiDigKIg4oCiIOKAoiDigKIg4oCiIOKAoiDigKIg4oCiIOKAoiDigKIg4oCiIOKAoiDi
gKIg4oCiDQoNCmlyaXMtR21iSA0KaW5mcmFyZWQgJiBpbnRlbGxpZ2VudCBzZW5zb3JzDQpPc3Rl
bmRzdHJhw59lIDEtMTQgfCAxMjQ1OSBCZXJsaW4NCg0KaHR0cHM6Ly9pcmlzLXNlbnNpbmcuY29t
Lw0KDQoNCg0KDQpPbiBXZWQsIDIwMjEtMDYtMTYgYXQgMjA6MjAgKzAyMDAsIEphc3BlciBPcnNj
aHVsa28gd3JvdGU6DQo+IFJldmlzaW9uIG9mIHRoZSB0aGUgcGF0Y2ggZmlsZS4gUGxlYXNlIHZl
cmlmeS4gOikNCj4gDQotLS0tLUJFR0lOIFBHUCBTSUdOQVRVUkUtLS0tLQ0KDQppUUV6QkFFQkNB
QWRGaUVFNFd5UE1JQzVBcDQrT29vMVlncWV3MDdWTU5VRkFtREthWE1BQ2drUVlncWV3MDdWDQpN
TlhmRlFmOEM1TGgyT0c3dERzUDZ1UWNMRVYvSitpZUNXTjJ5bEtINWxBUlZ6RVBRQjVUcFZHZmdj
YmRycVByDQo2NklhM05TL2dLREh0cEtEaWdCT3BZYXU0akZDNzEyNTJIcGZhcDEzL09pSDUzLysx
ZXMzaHdYbTVrNHh0WVlMDQpXVThpQUc3d2xLd3JqOHpTbGplRWxPdk93MEVpRExhWC9kbmh0Tkti
b3F1S3hBZ0pyUWtHRzJhM0c0S2xGUTUwDQpXNHhSMEpyeDY3L1VrV0pMaWMxaDUxdmMxUkd3N3pl
RGJPd0oreGwrMnVYREdDalJ0UUhtWENocEJTSW5BTWpQDQpyMHV6YTQ3T2kvK1hRR3VWWUFkWVIx
MmxwODlWbDdFR0F2b3k2c2VLYWJsa1ZTdTd6Qk14Qmk3MEd5clFkS0Z3DQplTTdpeE1kcVNTMU1a
NnpkSS82NEFhcTlYQjF3Z2c9PQ0KPUVZNSsNCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0K
