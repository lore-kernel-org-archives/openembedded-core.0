Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SZa9z-0000KR-BZ
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 06:05:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 May 2012 20:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105686291"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by AZSMGA002.ch.intel.com with ESMTP; 29 May 2012 20:53:59 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 30 May 2012 04:53:59 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.198]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.71]) with mapi id
	14.01.0355.002; Wed, 30 May 2012 04:53:58 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/4] Upgrade connman to 1.0
Thread-Index: AQHNPdwCcViN2E1/TU2O7uxWRHBDz5bhLoEAgAACpICAAAQggIAADosAgABpSnA=
Date: Wed, 30 May 2012 03:53:58 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1614CE73@IRSMSX102.ger.corp.intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<41C46607-08A4-46F1-8572-3320B7FD2615@dominion.thruhere.net>
	<CAJTo0LaFHe1jGQLoNkS6MkHwsM58iLJiRXpSSEKo-UqNQwjJCA@mail.gmail.com>
	<002D9B74-3B1E-42A8-A355-BC33847EB54F@dominion.thruhere.net>
	<CAJTo0LazLoue3YJndWA3Jd+QyS2HBiQqWUm+o8kaZcvWQK7w7w@mail.gmail.com>
In-Reply-To: <CAJTo0LazLoue3YJndWA3Jd+QyS2HBiQqWUm+o8kaZcvWQK7w7w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Upgrade connman to 1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2012 04:05:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KQXMgZmFyIGFzIEkgaGF2ZSBzZWVuIGZyb20gdGhlIGNvZGUsIGJldHdlZW4g
dGhlIHByZXZpb3VzIHZlcnNpb24gb2YgY29ubm1hbiBhbmQgdmVyc2lvbiAxLjAsIHRoZSB3YXkg
dGhlIGRlZmF1bHQgY29ubmVjdGlvbiBpcyBzZXQgaGFzIGNoYW5nZWQuDQoNClJpZ2h0IG5vdywg
dGhlIGRlZmF1bHQgY29ubmVjdGlvbiBpcyBlc3RhYmxpc2hlZCB0aHJvdWdoIGFuIGV4dGVybmFs
IGZpbGUuDQpCZWZvcmUgMS4wLCB0aGUgZGVmYXVsdCBjb25uZWN0aW9uIHdhcyBlc3RhYmxpc2hl
ZCB2aWEgdGhlIGNvZGUgKGFuZCBhIHBhdGNoIHdhcyBhZGRlZCBpbiB0aGUgcmVjaXBlIGFnYWlu
c3QgdGhpcywgYW5kIGl0IG5lZWRzIHRvIGJlIGFkYXB0ZWQpLg0KDQpTZWUgYnVnIHJlZ2FyZGlu
ZyB0aGlzOg0KQnVnICMyNDkxDQpodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hv
d19idWcuY2dpP2lkPTI0OTENCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIFttYWlsdG86
b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhh
bGYgT2YgQnVydG9uLCBSb3NzDQpTZW50OiBXZWRuZXNkYXksIE1heSAzMCwgMjAxMiA2OjEzIEFN
DQpUbzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINClN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDAvNF0gVXBncmFkZSBjb25ubWFuIHRvIDEuMA0K
DQpPbiAyOSBNYXkgMjAxMiAyMjoyMCwgS29lbiBLb29pIDxrb2VuQGRvbWluaW9uLnRocnVoZXJl
Lm5ldD4gd3JvdGU6DQo+PiBPdXQgb2YgdGhlIGJveCwgcm9vdCBjYW4gYWNjZXNzIHRoZSBzZXJ2
aWNlLiDCoFRoZXJlIGlzIGFub3RoZXIgcGF0Y2ggDQo+PiB0byBhZGQgInh1c2VyIiBmb3Igc3lz
dGVtcyB3aGljaCBydW4gYSByYXcgWCBzZXNzaW9uIGFzIHRoYXQgdXNlci4gwqANCj4+IElmIHlv
dSdyZSBsb2dnaW5nIGluIHdpdGggZ2RtIHRvIGFuIGFyYml0cmFyeSB1c2VyLCB0aGVuIHRoZSAN
Cj4+IGF0X2NvbnNvbGUgdGVzdCBzaG91bGQgd29yaywgcmlnaHQ/DQo+DQo+IE5vLCBvdXIgUEFN
IG1hZ2ljIGlzIHN0aWxsIG5vdCBzdHJvbmcgZW5vdWdoIDooIEFuZCB3b3JzZSwgc2VyaWFsIGNv
bnNvbGUgZG9lc24ndCB3b3JrIHdpdGggYXRfY29uc29sZSBlaXRoZXIuDQoNCkRhbW4gc2hhbWUg
LSB0b3RhbGx5IGJ1c3QgYWNjZXNzIGNvbnRyb2wgaXMgcXVpdGUgZGVwcmVzc2luZy4gIEknbGwg
cmV2ZXJ0IHRoYXQgY2h1bmsgYW5kIHRocm93IGEgbGFyZ2UgY29tbWVudCBhcm91bmQgaXQgLSBj
YW4ndCBoYXZlIHNvbWV0aGluZyBzb21lIHN1c3BpY2lvdXMgd2l0aG91dCBhbnkgZG9jdW1lbnRh
dGlvbi4NCg0KSG9wZWZ1bGx5IHdpdGhvdXQgc291bmRpbmcgbGlrZSBhbiBleC1NZWVHbyBmYW5i
b3ksIHV4bGF1bmNoIGlzIGFjdHVhbGx5IHByZXR0eSB1c2VmdWwgZm9yIHRoaXMuICBJdCBzZXRz
IHVwIGEgcHJvcGVyIFBBTSBsb2dpbiwgYnJpbmdzIHVwIFgsIGFuZCBoYW5kbGVzIFhERyBhdXRv
c3RhcnQuICBNaWdodCBiZSB3b3J0aCBsb29raW5nIGF0IGZvciBzaW5nbGUtdXNlciBlbnZpcm9u
bWVudHMuDQoNClJvc3MNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCk9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcvY2dp
LWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=


