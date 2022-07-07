Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE30C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 13:45:14 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.5645.1657201509698069843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=f8aJ6qAt;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1657201510;
  x=1688737510;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g3Z+0KgW3MWvS0Ua5uoAySCxDLxYeQS+Pjlhkr3zLes=;
  b=f8aJ6qAt6DAv8v63RgZm8NEOz056d6lw/CuXvYVQWkNKPdQa7ij5GcSy
   ogncir4PAwIw7hwCRFiIJTM/sozeNyigddvndS7Zm933UIs6+Gm4RAVPi
   bfHh4s6Vz7/n1WmtsC0V+wnj7bv7UCQBsMwEGs5mk2ZN9yNzr6xuGqHhL
   joRR5E7sfgyh6/5VNSlH6aMILl5po8fuAEwLTzIqtPcZRo6zdA1mJW0+U
   Y2iWZT7i3RU8NK0MXKyA2UhjFw1SaDrwuKHGGLuwhipHkahcu33/6Gvql
   bZP9cC5A67vPS6T6hMK/wIeSMdncHJ10uTSBA1obUGj+PPZwYwFYOz8Xe
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
Thread-Topic: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
Thread-Index: AQHYkWWsuIJ0GxnyT0ak+urHDmj9Y61y5WKA///jYACAACJjAA==
Date: Thu, 7 Jul 2022 13:45:07 +0000
Message-ID: <4573c371d989428899b884116c47fff3@axis.com>
References: <20220706182329.3085564-1-alex@linutronix.de>
 <d04fa3ca7398489a99f8356b17f1174a@axis.com>
 <CANNYZj-Dtx6ETvTTgtJUE6Eizn-S=vm=Oug=cB3zRsQCC7AM=g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-Dtx6ETvTTgtJUE6Eizn-S=vm=Oug=cB3zRsQCC7AM=g@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 13:45:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167780

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDcganVsaSAyMDIyIDE1OjM2DQo+
IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4g
Q2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IEFsZXhhbmRlciBL
YW5hdmluDQo+IDxhbGV4QGxpbnV0cm9uaXguZGU+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W1BBVENIIDEvMl0gc2NyaXB0cy9vZS1zZXR1cC1idWlsZGRpcjogY29weQ0KPiBzaXRlLmNvbmYu
c2FtcGxlIG91dCBvZiB0ZW1wbGF0ZSBkaXJlY3RvcmllcyAoaWYgaXQgZXhpc3RzKQ0KPiANCj4g
T24gVGh1LCA3IEp1bCAyMDIyIGF0IDE1OjI2LCBQZXRlciBLamVsbGVyc3RlZHQNCj4gPHBldGVy
LmtqZWxsZXJzdGVkdEBheGlzLmNvbT4gd3JvdGU6DQo+IA0KPiA+IFdoaWxlIEkgY2FuJ3Qgc3Bl
YWsgZm9yIG90aGVycywgdGhpcyBjaGFuZ2Ugd2lsbCBicmVhayBvdXIgYnVpbGQgZW52aXJvbm1l
bnQuDQo+ID4gV2UgaGF2ZSBhIGdsb2JhbCBzaXRlLmNvbmYgZmlsZSBpbiBhbiBORlMgZGlyZWN0
b3J5IHRoYXQgZXZlcnlvbmUgdXNlLiBJdA0KPiA+IGNvbnRhaW5zIGFsbCBwcm94eSBzZXR0aW5n
cyBhbmQgc2ltaWxhciB0aGF0IGFyZSByZXF1aXJlZCB0byBidWlsZCBpbnNpZGUgdGhlDQo+ID4g
Y29ycG9yYXRlIGVudmlyb25tZW50LiBDb3B5aW5nIGEgZHVtbXkgc2l0ZS5jb25mIGZpbGUgaW50
byB0aGUgbG9jYWwgYnVpbGQNCj4gPiBkaXJlY3Rvcnkgd2lsbCBwcmV2ZW50IHRoZSBnbG9iYWwg
ZmlsZSBmcm9tIGJlaW5nIHVzZWQuDQo+IA0KPiBUaGVuIHlvdSBuZWVkIHRvIGNyZWF0ZSBhIGNv
bmZpZ3VyYXRpb24gdGVtcGxhdGUgdGhhdCBpcyBzcGVjaWZpYyB0bw0KPiB5b3VyIGNvbXBhbnkg
Zmlyc3QsIGFuZCB0aGVyZSdzIGEgY29udmVuaWVudCBjb21tYW5kIHRvIGRvIHRoYXQNCj4gcHJv
dmlkZWQgaW4gcGF0Y2ggMi8yLg0KDQpXaGlsZSBJIGhhdmVuJ3QgYWN0dWFsbHkgdHJpZWQgeW91
ciBuZXcgY29tbWFuZCwgYmFzZWQgb24gd2hhdCB5b3UgYW5kIA0Kb3RoZXJzIGhhdmUgd3JpdHRl
biwgaXQgZG9lcyBub3QgYXQgYWxsIHNlZW0gY29tcGF0aWJsZSB3aXRoIGhvdyBvdXIgDQplbnZp
cm9ubWVudCBpcyBzZXR1cCBhbmQgd2hhdCBpdCBleHBlY3RzIGZyb20gcG9reS4gOigNCg0KPiBT
ZXR0aW5nIHVwIGEgYnVpbGQgZGlyZWN0b3J5IGZyb20gc3RhbmRhcmQgcG9reQ0KPiBvciBvZS1j
b3JlIHRlbXBsYXRlcyAod2hpY2ggSSBwcmVzdW1lIGlzIGhvdyB5b3Ugc2V0IHVwIGJ1aWxkcykg
ZG9lcw0KPiBub3QgaG9sZCBhIHByb21pc2UgdGhhdCB3aGF0IGlzIGJlaW5nIGNvcGllZCB3aWxs
IG5vdCBjaGFuZ2UgaW4NCj4gcG90ZW50aWFsbHkgYnJlYWtpbmcgd2F5cy4NCg0KV2hpbGUgSSBt
YXkgYmUgYWJsZSB0byBmaXggdGhlIGVudmlyb25tZW50IGZvciBidWlsZHMgdGhhdCB1c2Ugc29t
ZSBvZiANCm91ciBsYXllcnMsIHNldHRpbmcgdXAgcHVyZSBwb2t5IGJ1aWxkcyB3aWxsIG5vIGxv
bmdlciB3b3JrIHdpdGhvdXQgDQptYW51YWwgaW50ZXJ2ZW50aW9uLg0KDQo+IEFsZXgNCg0KLy9Q
ZXRlcg0KDQo=

