Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D3AC433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 19:46:56 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.9833.1667677606092971849
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 12:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ZiJgC561;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667677606;
  x=1699213606;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qn7kUP9xh6zgDudqxJhE7vFCJR9EZreK9CzkL59TUm4=;
  b=ZiJgC561KtZvFGYZSKlV7NdyEM+tkfUm4PY4mlmbTJslRriSfTW3BILK
   moBRb7uClXQHdji8kQW+g860avYNr03oM2WHjZWNW+AyGy3Amh431P2AX
   M+3T/SXUr486lr4XA/uYx9p/PqJoRebimblVPQrLnau9GMqdTF5IZU35b
   zfh3l3whrq0o1Rycm5A+4/2U4g2J9OlxpgxKQ1mBmF95UYNdvDSyE9U/4
   uHeJS9Tf1fnqiSoq6l5Wf1A0MAQCx2aS5Fn3ByMWep4JGjwCYytxfOlTL
   pWFad2xq9MHmvp83ycMwSnlbnQP4SbuDiZ4tVUsEjKXWsU6rcUmK5MzwT
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [langdale][PATCH 2/2] externalsrc.bbclass: Remove a
 trailing slash from ${B}
Thread-Topic: [OE-core] [langdale][PATCH 2/2] externalsrc.bbclass: Remove a
 trailing slash from ${B}
Thread-Index: AQHY8UBSz3fLndEIaUKpGtptFYaKwK4wlYmAgAAjU/D///DegIAAEQVw
Date: Sat, 5 Nov 2022 19:46:43 +0000
Message-ID: <b9edf078b81a42d9b64ad375a29d3018@axis.com>
References: <20221105154203.273684-1-pkj@axis.com>
 <20221105154203.273684-2-pkj@axis.com>
 <CAOSpxdZzGOPfcesAm0ykhcatZCMUwLUBjLudauD1J1Kod1UFFw@mail.gmail.com>
 <CA+chaQcY4iku9jwfsTQqe95E_Gge6X5GC=ZHLBDVwr7_poa86A@mail.gmail.com>
 <1e435dd091324e19aa0231e86ef5da8d@axis.com>
 <CAOSpxdbOxC-Vgzbw-dtj_TpiEGXo1kL6jeN-8L9TjCgrJy_4xQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbOxC-Vgzbw-dtj_TpiEGXo1kL6jeN-8L9TjCgrJy_4xQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 19:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172758

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV2ZSBTYWtvbWFuIDxzdGV2
ZUBzYWtvbWFuLmNvbT4NCj4gU2VudDogZGVuIDUgbm92ZW1iZXIgMjAyMiAyMDo0MQ0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENjOiBN
YXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFpbC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW2xhbmdkYWxl
XVtQQVRDSCAyLzJdIGV4dGVybmFsc3JjLmJiY2xhc3M6IFJlbW92ZSBhIHRyYWlsaW5nIHNsYXNo
IGZyb20gJHtCfQ0KPiANCj4gT24gU2F0LCBOb3YgNSwgMjAyMiBhdCA5OjM2IEFNIFBldGVyIEtq
ZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPg0KPiA+
IEFyZ2gsIHRoZSBzZWNvbmQgc2VyaWVzICh3aXRoIHRocmVlIHBhdGNoZXMpIGlzIGludGVuZGVk
IGZvciBLaXJrc3RvbmUsDQo+ID4gbm90IExhbmdkYWxlLg0KPiANCj4gTm8gd29ycmllcyEgIEkg
dGhpbmsgd2UgYXJlIGdvb2QgaW4ga2lya3N0b25lIHRvbzoNCj4gDQo+IGh0dHBzOi8vZ2l0Lm9w
ZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUtY29udHJpYi9sb2cvP2g9c3RhYmxlL2tp
cmtzdG9uZS1udXQNCj4gDQo+IFBhdGNoIHNlcmllcyBmb3IgYm90aCB3aWxsIGdvIG91dCBmb3Ig
cmV2aWV3IGluIHRoZSBuZXh0IGRheSBvciBzbw0KPiBvbmNlIGF1dG9idWlsZGVyIHRlc3Rpbmcg
aXMgZG9uZS4NCj4gDQo+IFN0ZXZlDQoNCk9rLCBnb29kLiBTaW5jZSBJIHR5cGljYWxseSB3b3Jr
IHdpdGggdGhlIHBva3kgcmVwb3NpdG9yeSwgSSBkbyBub3QgDQpub3JtYWxseSBzZWUgdGhlICot
bnV0IGJyYW5jaGVzLCBhbmQgdGVuZCB0byBmb3JnZXQgdGhleSBleGlzdCBpbiANCmFub3RoZXIg
cmVwb3NpdG9yeS4NCg0KLy9QZXRlcg0KDQo=

