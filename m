Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77042C64ED8
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.1866.1649981286931621837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 17:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=S+MUPjtG;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649981287;
  x=1681517287;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=W/8RsQsGYq6jn6ioLBwEsVYHerXTUJIgjyGMyGXYPCA=;
  b=S+MUPjtGCeGyPlVm6ly0wN+1nEKZ7pQCr2NIY0Fw0xCh2ltRp24ZRNMv
   lWS5kLjd5T38fCz+7XuGjA6O4TMIcbbc8LlLbOQ4wrSQqJOZNgFzaPji0
   tLh+qWFWiT5ayyc9Qlxvw0jYhdTIa4ug6I1GD5KQPT40n9ioJMlWefJNI
   rswkCUVNbJm7xhzhU9jQ8l3KcJf6da4hJOoBOdqVt1fi9LL1VUdkv3Hkc
   HeFvjtEj9y5iRREPLxoyUJKgY3ToAfRq0RIT66gx7wzJptO+L0FfBGuzQ
   9o2KXxp1Oz9+4/A5FY5sngX3F9OWRyA0WnUvntotcGLVpMygAubNz+MWz
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] bitbake.conf: reason for assignment of deprecated
 variable
Thread-Topic: [OE-core] bitbake.conf: reason for assignment of deprecated
 variable
Thread-Index: AQHYTbXAzHDs5wD+fEW0SoDDZ5CCuqzwHSCg
Date: Fri, 15 Apr 2022 00:08:04 +0000
Message-ID: <5b5b2b45fe494472abcfc8e06c6480c2@axis.com>
References: <2d083c9ebada9a9ee8eaf9c97f3ef3171bdb2356.camel@ew.tq-group.com>
In-Reply-To: <2d083c9ebada9a9ee8eaf9c97f3ef3171bdb2356.camel@ew.tq-group.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164416

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIE1hcmt1cyBOaWViZWwNCj4gU2VudDogZGVuIDExIGFw
cmlsIDIwMjIgMTc6MDcNCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU3ViamVjdDogW09FLWNvcmVdIGJpdGJha2UuY29uZjogcmVhc29uIGZvciBhc3Np
Z25tZW50IG9mIGRlcHJlY2F0ZWQNCj4gdmFyaWFibGUNCj4gDQo+IEhlbGxvLA0KPiANCj4gd2l0
aCB0aGUgZGVwcmVjYXRpb24gb2YgU0VSSUFMX0NPTlNPTEUgdGhlIGZvbGxvd2luZyB3YXMgaW50
cm9kdWNlZCBpbg0KPiBiaXRiYWtlLmNvbmY6DQo+IA0KPiAzZjBkNjY1Mzg0ZTZkMWI3YWEyODU0
YTljYzRmMTNlMDk2MWJhY2I3IChiaXRiYWtlLmNvbmY6IHNldA0KPiBTRVJJQUxfQ09OU09MRVMg
ZnJvbSBTRVJJQUxfQ09OU09MRSBieSBkZWZhdWx0KQ0KPiANCj4gU2luY2UgdGhpcyBpcyBkb25l
IGFmdGVyIGluY2x1c2lvbiBvZiBsb2NhbC5jb25mIGFuZCA8bWFjaGluZT4uY29uZiBhbnkNCj4g
d2VhayBkZWZhdWx0IGRvbmUgZm9yIGEgU3lzdGVtLW9uLU1vZHVsZSAvIENQVSB3aWxsIGJlIG92
ZXJ3cml0dGVuLiBJcyANCj4gdGhpcyBqdXN0IGJ5IGZvcmdldHRpbmcgdG8gcmVtb3ZlIHRoZXNl
IGxpbmVzIGFmdGVyIHRoZSBkZXByZWNhdGlvbiBvciANCj4gaXMgdGhlcmUgc3RpbGwgYSByZWFz
b24gdG8ga2VlcCB0aGlzIGFzIGlzPw0KPiANCj4gVGhhbmsgeW91DQo+IA0KPiBNYXJrdXMgTmll
YmVsDQoNCkdpdmVuIHRoYXQgaXQgaXMgYWxtb3N0IHRlbiB5ZWFycyBzaW5jZSBTRVJJQUxfQ09O
U09MRSB3YXMgZGVwcmVjYXRlZCwgDQppdCBtaWdodCBiZSB0aW1lIHRvIGFjdHVhbGx5IHJlbW92
ZSBpdCBzb29uLi4uDQoNCi8vUGV0ZXINCg0K

