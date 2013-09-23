Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 811546102E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 21:51:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8NLpnc6012141
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Sep 2013 14:51:49 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.103]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0342.003;
	Mon, 23 Sep 2013 14:51:49 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] webkit-gtk: limit ld memory requirement
Thread-Index: AQHOsNj6EAOGWh0ofEWKImJjnxJA9pnFG10AgAD0g4CAAFvAAIADcOIAgAAFaQCAAFOXgIAABmcAgAmv32A=
Date: Mon, 23 Sep 2013 21:51:49 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF843C5198BB@ALA-MBB.corp.ad.wrs.com>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
	<CAJTo0LazMZXn9bajiMwNhAPiQiry4onu3iZfHws8XKb=sb1BJQ@mail.gmail.com>
	<523501AC.4010208@linux.intel.com> <5237E49C.7090608@windriver.com>
	<CAMKF1sqDxGyVnrap0=Jsq=iMFGnXkupjuWnTSwxzBv8K4tqzPg@mail.gmail.com>
	<20130917103029.GA7313@jama>
	<CAJTo0LY0yOaFyn0+DiTgag2bJ4qJ5XM0-=Vz7EMN8ajXsseiiw@mail.gmail.com>
In-Reply-To: <CAJTo0LY0yOaFyn0+DiTgag2bJ4qJ5XM0-=Vz7EMN8ajXsseiiw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Mon, 23 Sep 2013 21:51:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIg
MTcsIDIwMTMgMzo1MyBBTQ0KPiBUbzogTWFydGluIEphbnNhDQo+IENjOiBLaGVtIFJhajsgU2xh
dGVyLCBKb3NlcGg7IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxh
eWVyDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gd2Via2l0LWd0azogbGlt
aXQgbGQgbWVtb3J5IHJlcXVpcmVtZW50DQo+IA0KPiBPbiAxNyBTZXB0ZW1iZXIgMjAxMyAxMToz
MCwgTWFydGluIEphbnNhIDxtYXJ0aW4uamFuc2FAZ21haWwuY29tPiB3cm90ZToNCj4gPiBJIHRo
aW5rIHNvbWVvbmUgc2hvdWxkIG1lYXN1cmUgaXQgb24gbWFjaGluZSB3aXRoIGEgbG90IG9mIHJh
bS4gSWYgdGhlDQo+ID4gdGVzdCB3YXMgZXhlY3V0ZWQgb24gbWFjaGluZSB3aGVyZSBpdCB3YXMg
bGlua2luZyBtb3N0bHkgZnJvbSBzd2FwLA0KPiA+IHRoZW4gaXQncyBub3Qgc28gc3VycHJpc2lu
ZyBpdCB3YXMgZmFzdGVyIHdpdGggdGhlIG9wdGlvbiBlbmFibGVkLg0KPiANCj4gTXkgdmVyeSBy
b3VnaCB0ZXN0IHNheXMgbm8gc2lnbmlmaWNhbnQgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvcHRp
b24NCj4gYmVpbmcgZW5hYmxlZCBvciBkaXNhYmxlZCAofjIzbSArLSAzMHMgZWFjaCB3YXkpLiAg
aTcgd2l0aCAxNkdCIFJBTS4NCj4gDQo+IEFueW9uZSBlbHNlIHdhbnQgdG8gYWRkIGEgZGF0YSBw
b2ludD8NCg0KSSBhbSB0aGUgb25seSB1c2VyIG9uIHRoZSBtYWNoaW5lIGJlbG93LiAgSSBjb21w
aWxlZCB0d2ljZSwgZWFjaCB3YXkgLS0NCg0KbW9kZWwgbmFtZQk6IEludGVsKFIpIFhlb24oUikg
Q1BVICAgICAgICAgICBYNTU2MCAgQCAyLjgwR0h6DQptb2RlbCBuYW1lCTogSW50ZWwoUikgWGVv
bihSKSBDUFUgICAgICAgICAgIFg1NTYwICBAIDIuODBHSHoNCm1vZGVsIG5hbWUJOiBJbnRlbChS
KSBYZW9uKFIpIENQVSAgICAgICAgICAgWDU1NjAgIEAgMi44MEdIeg0KbW9kZWwgbmFtZQk6IElu
dGVsKFIpIFhlb24oUikgQ1BVICAgICAgICAgICBYNTU2MCAgQCAyLjgwR0h6DQptb2RlbCBuYW1l
CTogSW50ZWwoUikgWGVvbihSKSBDUFUgICAgICAgICAgIFg1NTYwICBAIDIuODBHSHoNCm1vZGVs
IG5hbWUJOiBJbnRlbChSKSBYZW9uKFIpIENQVSAgICAgICAgICAgWDU1NjAgIEAgMi44MEdIeg0K
bW9kZWwgbmFtZQk6IEludGVsKFIpIFhlb24oUikgQ1BVICAgICAgICAgICBYNTU2MCAgQCAyLjgw
R0h6DQptb2RlbCBuYW1lCTogSW50ZWwoUikgWGVvbihSKSBDUFUgICAgICAgICAgIFg1NTYwICBA
IDIuODBHSHoNCg0KTWVtVG90YWw6ICAgICAgIDEyMzI2NDkyIGtCDQoNCg0KYnVpbGQgLSBwcmVz
ZW50IHJlY2lwZQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KcmVhbAk0OG0yNi42MjBzDQp1c2Vy
CTk2bTE1LjkzOXMNCnN5cwkxN200My42MzlzDQoNCmNvbXBpbGUgLSBwcmVzZW50IHJlY2lwZQ0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpyZWFsCTI1bTM5Ljg0NXMNCnVzZXIJODVtMzEuMTAy
cw0Kc3lzCTEwbTE3LjAxNnMNCg0KcmVhbAkyNW0zMS4zNDRzDQp1c2VyCTg1bTM1LjIxMHMNCnN5
cwk5bTQ2LjMwOXMNCg0KY29tcGlsZSAtIG5ldyByZWNpcGUNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KcmVhbAkyNW0yOC4zMzhzDQp1c2VyCTg1bTI3LjA4OHMNCnN5cwkxMG0xOS42OTZzDQoN
CnJlYWwJMjVtMjIuMzU1cw0KdXNlcgk4NW0yNC4xMzNzDQpzeXMJMTBtMTMuMTUxcw0KDQoNCg0K
DQoNCj4gDQo+IFJvc3MNCg==

