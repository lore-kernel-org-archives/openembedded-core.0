Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id E868379704
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 16:35:42 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
	by smtprelay.synopsys.com (Postfix) with ESMTP id EEEA310C1B59;
	Wed, 12 Sep 2018 09:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1536770144; bh=YcsyTz/p24GbHp7Ps3Y+lkpaOb0Ez1HEEjnd7SfqejU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XXZucCyjMl5546L5n/kd8QH/dEXsz7Xiop5pr8Hq/ZyXLjuKaH3dsbK/BI50iy9zl
	BwEkemh/sCZfJM5vCt39xjXg+Tc0kdFxIro3/gYgWzqWhg5RD2zxpGYaN0f7QCc4yN
	sIK1wyubcsJQbwkSld5wcIK5gsLgZSBZD045FhWdTx5juqZKaMA++DlCm7EoE/mxdk
	mvh3UNNY3uGgiOlw1hQE6tJJB3q8/mwU7PckBrNBbQqLjh2PdNKkEozaBLmryFykxC
	FdGyjQmn9Zg4KIznd5saMwYi57IKU18ZhfbVH9GC0NZe/V4+BkoJ3RUlAN/OSRXvup
	gxtI0sM66YCag==
Received: from US01WEHTC3.internal.synopsys.com
	(us01wehtc3.internal.synopsys.com [10.15.84.232])
	by mailhost.synopsys.com (Postfix) with ESMTP id DBE303EE1;
	Wed, 12 Sep 2018 09:35:43 -0700 (PDT)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
	US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 12 Sep 2018 09:35:43 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
	14.03.0361.001; Wed, 12 Sep 2018 18:35:43 +0200
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] linux-libc-headers: Don't do useless
	configuration
Thread-Index: AQHUSrEH6casaJzNLEe3JlDNc0JshKTstL4AgAABooA=
Date: Wed, 12 Sep 2018 16:35:42 +0000
Message-ID: <55a9c23a7768c79e94f676ca7665f6c6571358bd.camel@synopsys.com>
References: <20180912155519.7513-1-abrodkin@synopsys.com>
	<CAMKF1spaqXM5Yr8u4j2ppQXAUdLS2QvOqasy+tdju3VceAvVhQ@mail.gmail.com>
In-Reply-To: <CAMKF1spaqXM5Yr8u4j2ppQXAUdLS2QvOqasy+tdju3VceAvVhQ@mail.gmail.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.121.8.87]
MIME-Version: 1.0
Cc: "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Don't do useless configuration
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
X-List-Received-Date: Wed, 12 Sep 2018 16:35:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <82CFF914193502408C3072867AC61192@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KT24gV2VkLCAyMDE4LTA5LTEyIGF0IDA5OjI5IC0wNzAwLCBLaGVtIFJhaiB3
cm90ZToNCj4gT24gV2VkLCBTZXAgMTIsIDIwMTggYXQgOTowMyBBTSBBbGV4ZXkgQnJvZGtpbg0K
PiA8QWxleGV5LkJyb2RraW5Ac3lub3BzeXMuY29tPiB3cm90ZToNCj4gPiANCj4gPiBUaGVyZSdz
IG5vIHBvaW50IGluIGNvbmZpZ3VyaW5nIExpbnV4IGtlcm5lbCBiZWZvcmUNCj4gPiBoZWFkZXJz
IGluc3RhbGxhdGlvbi4NCj4gPiANCj4gDQo+IEF0IG9uZSBwb2ludCB0aGUgaGVhZGVycyBpbnN0
YWxsIGRpZCBub3Qgd29yayB3aXRoIG91dCBhIC5jb25maWcgZmlsZSwNCj4gaGFzIHRoYXQgY2hh
bmdlZCA/DQoNCldlbGwgdGhhdCdzIGhhcmQgdG8gdGVsbCBhcyBJIGhhdmUgbm8gaWRlYSB3aGVu
IGFuZCB3aGF0IGtpbmQgb2YgYnJlYWthZ2UNCndhcyBzZWVuIDopDQoNCkknZCBzYXkgd2l0aCB1
cC10by1kYXRlIGtlcm5lbHMgaXQgc2hvdWxkbid0IGhhcHBlbiBhbmQgdGhhdCdzIHRoZQ0KcG9p
bnQgTWFzYWhpcm8tc2FuIG1hZGUgaGVyZTogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvOS8x
Mi82NzgNCg0KDQo+IGlmIHNvIHRoZW4gdGhpcyBpcyBmaW5lIHRvIHJlbW92ZSBpdCBidXQgdGhp
cyBjaGFuZ2UgbmVlZHMgdG8gYmUgZG9uZQ0KPiBhIGJpdCBkaWZmZXJlbnRseSBpZiB0aGF0cyB3
aGF0IGl0IGRpZCBpbiB0aGlzIHRhc2sNCj4gDQo+IHJlbW92ZSBkb19jb25maWd1cmUgYW5kIHRo
ZW4gYWRkDQo+IA0KPiBkb19jb25maWd1cmVbbm9leGVjXSA9ICIxIg0KDQpPayB3aWxsIGRvIHRo
YXQuIEJ1dCB3aHkgZG8gd2UgaGF2ZSAyIGxpbmVzIGJlbG93Og0KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tPjgtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KZG9fY29tcGlsZSAoKQ0K
eyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQp9DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0+OC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCi1BbGV4ZXkNCg==

