Return-Path: <clemens.lang@bmw-carit.de>
Received: from cit-hm8-gw01.bmw-carit.de (cit-hm8-mail01.bmw-carit.de
	[212.118.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 1133B60119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 12:07:49 +0000 (UTC)
Received: from [172.20.0.50] (port=8437 helo=cit-hm8-mail01.bmw-carit.de)
	by cit-hm8-gw01.bmw-carit.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1bcWy6-0002NT-1h for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2016 14:07:42 +0200
Received: from ULM-DC01.bmw-carit.intra ([fe80::41cf:62be:aacc:1aad]) by
	ULM-DC01.bmw-carit.intra ([fe80::41cf:62be:aacc:1aad%11]) with mapi id
	14.03.0123.003; Wed, 24 Aug 2016 14:07:42 +0200
X-CTCH-RefID: str=0001.0A0C0206.57BD8E0E.0126, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <Clemens.Lang@bmw-carit.de>
To: OE-core <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gitpkgv: Fix $GITPKV for a single named git
	source
Thread-Index: AQHR87fSPG0v/SVK+km4Sp05/KsMuqBEsX4AgBMyywCAABL5AA==
Date: Wed, 24 Aug 2016 12:07:41 +0000
Message-ID: <DD9635D8-AD46-4D40-8742-DFD14B845D37@bmw-carit.de>
References: <1470909853-22262-1-git-send-email-clemens.lang@bmw-carit.de>
	<1470909853-22262-2-git-send-email-clemens.lang@bmw-carit.de>
	<C48DE607-9EB8-48E1-9421-EBB46F94AFAA@gmail.com>
	<27C6E91D-E9A6-404D-AEE4-C41018631C33@bmw-carit.de>
In-Reply-To: <27C6E91D-E9A6-404D-AEE4-C41018631C33@bmw-carit.de>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.20.86]
MIME-Version: 1.0
Subject: Re: [PATCH] gitpkgv: Fix $GITPKV for a single named git source
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
X-List-Received-Date: Wed, 24 Aug 2016 12:07:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D27BC0D986C844CACFD6F950B98A3C4@bmw-carit.de>
Content-Transfer-Encoding: base64

SGksDQoNCkNsZW1lbnMgTGFuZyA8Q2xlbWVucy5MYW5nQGJtdy1jYXJpdC5kZT4gd3JvdGU6DQoN
Cj4gU2hhbWVsZXNzIGJ1bXAuIEkgaGF2ZW7igJl0IGhlYXJkIGFueSBmZWVkYmFjayBvbiB0aGlz
IG90aGVyIHRoYW4gdGhpcyDigJxsb29rcw0KPiBnb29k4oCdIGNvbW1lbnQsIGJ1dCBpdCBpc27i
gJl0IG1lcmdlZC4gSXMgdGhlcmUgYSBwcm9ibGVtIHdpdGggdGhlIHBhdGNoPw0KDQpNeSBhcG9s
b2dpZXMsIGl0IHNlZW1zIHRoaXMgcGF0Y2ggc2hvdWxkIGhhdmUgZ29uZSB0byBvcGVuZW1iZWRk
ZWQtZGV2ZWwgIA0KcmF0aGVyIHRoYW4gdGhpcyBsaXN0LiBJ4oCZbGwgcmVwb3N0IGl0IG92ZXIg
dGhlcmUuDQoNCi0tIA0KQ2xlbWVucyBMYW5nIOKAoiBEZXZlbG9wbWVudCBTcGVjaWFsaXN0DQpC
TVcgQ2FyIElUIEdtYkgg4oCiIExpc2UtTWVpdG5lci1TdHIuIDE0IOKAoiA4OTA4MSBVbG0g4oCi
IGh0dHA6Ly9ibXctY2FyaXQuY29tDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpCTVcgQ2FyIElUIEdtYkgN
Ckdlc2Now6RmdHNmw7xocmVyOiBNaWNoYWVsIFfDvHJ0ZW5iZXJnZXIgdW5kIEFsZXhpcyBUcm9s
aW4NClNpdHogdW5kIFJlZ2lzdGVyZ2VyaWNodDogTcO8bmNoZW4gSFJCIDEzNDgxMA0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0K

