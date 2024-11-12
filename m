Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F63D41D7C
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 13:40:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.86617.1731418836867631370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 05:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tAr8E-0006WP-BC; Tue, 12 Nov 2024 14:40:34 +0100
Message-ID: <2ff2f153f3d383ffa0fb240b6af32f7a3a3c8994.camel@pengutronix.de>
Subject: Re: [OE-core] bitbake.conf: require lz4 instead of lz4c
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: jsbronder@cold-front.org, Richard Purdie
	 <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2024 14:40:33 +0100
In-Reply-To: <CANNYZj9Ld6xe2F_0J5i0fasbEAf6c1B3Od7qY3+hjq7NrmSrFA@mail.gmail.com>
References: <20241105153752.3610957-1-jsbronder@cold-front.org>
	 <3ac4b13ff08fc83cb2e37fc7caadeb89115e7814.camel@linuxfoundation.org>
	 <ZyuQwnMFmfIXDIaa@ravine.members.linode.com>
	 <CANNYZj9Rmrpucd1mtj7jCkPa1b-GS+r5ZJtjS6-A82XjxYw0Kg@mail.gmail.com>
	 <60716348d2a4c699ec70bfb4358b3e0d9f4b2fc9.camel@pengutronix.de>
	 <CANNYZj9Ld6xe2F_0J5i0fasbEAf6c1B3Od7qY3+hjq7NrmSrFA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 13:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207052

QW0gRGllbnN0YWcsIGRlbSAxMi4xMS4yMDI0IHVtIDE0OjM0ICswMTAwIHNjaHJpZWIgQWxleGFu
ZGVyIEthbmF2aW46Cj4gT24gVHVlLCAxMiBOb3YgMjAyNCBhdCAxNDoyMCwgRW5yaWNvIErDtnJu
cyA8ZWpvQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiA+IFRoYW5rZnVsbHksIEp1c3RpbiBhbHJl
YWR5IGNvbnRyaWJ1dGVkIHRoZSBmaXggdG8gYmFyZWJveCB1cHN0cmVhbSBpbiB0aGUgbWVhbnRp
bWUgYW5kIGFzIGZhciBhcwo+ID4gSQo+ID4gY2FuIHNlZSwgaXQgd2FzIHF1aWNrbHkgbWVyZ2Vk
IGFuZCBzaG91bGQgdGh1cyBiZSBwYXJ0IG9mIHRoZSBOb3ZlbWJlciByZWxlYXNlLgo+IAo+IEkn
ZCBzYXkgeW91IGNvdWxkIHJlc2VuZCB0aGUgYWJvdmUgcGF0Y2ggd2l0aCBhIGJhcmVib3ggYmFj
a3BvcnQuCgpUbyBjbGFyaWZ5OiBKdXN0aW4gYWxyZWFkeSBkaWQgdGhpcyBpbiBhIHYyIGFuZCB0
aGUgcGF0Y2ggaXMgaW4gb2UtY29yZSB1cHN0cmVhbS4KCkkgcmVhZCB0aGlzIGFzIG1lYW5pbmcg
dGhhdCB5b3Ugbm8gbG9uZ2VyIGNvbnNpZGVyIGEgbmF0aXZlIGx6NCBkZXBlbmRlbmN5IG5lY2Vz
c2FyeS4KClRoYW5rcyBhbmQgcmVnYXJkcywgRW5yaWNvCgo+IEFsZXgKPiAKCi0tIApQZW5ndXRy
b25peCBlLksuwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgfCBFbnJpY28gSsO2cm5zwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB8CkVt
YmVkZGVkIExpbnV4IENvbnN1bHRpbmcgJiBTdXBwb3J0wqDCoMKgwqDCoMKgwqDCoHwgaHR0cHM6
Ly93d3cucGVuZ3V0cm9uaXguZGUvIHwKU3RldWVyd2FsZGVyIFN0ci4gMjHCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3
LTE4MMKgwqB8CjMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB8IEZheDrCoMKgwqArNDktNTEyMS0yMDY5MTctOcKgwqDCoMKgfAo=


