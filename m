Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SB80m-0000Sb-W0
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:10:49 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Mar 2012 10:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122504659"
Received: from orsmsx605.amr.corp.intel.com ([10.22.226.10])
	by azsmga001.ch.intel.com with ESMTP; 23 Mar 2012 10:01:51 -0700
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx605.amr.corp.intel.com (10.22.226.10) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 23 Mar 2012 10:01:44 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.160]) with mapi id
	14.01.0355.002; Fri, 23 Mar 2012 10:01:43 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build gdb
	with python support"
Thread-Index: AQHNCRMjG6/xwLeUgEWTysDmkk+IHpZ4GLEw
Date: Fri, 23 Mar 2012 17:01:43 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137C776@ORSMSX106.amr.corp.intel.com>
References: <xna3ujdvoyvh9m51g7hfhmvu.1332520606617@email.android.com>
In-Reply-To: <xna3ujdvoyvh9m51g7hfhmvu.1332520606617@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Fri, 23 Mar 2012 17:10:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogW21haWx0
bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjMsIDIwMTIgOToz
NyBBTQ0KPiBUbzogS2FtYmxlLCBOaXRpbiBBDQo+IENjOiBlcmljOyBQYXRjaGVzIGFuZCBkaXNj
dXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcjsgTWFydGluIEphbnNhDQo+IFN1YmplY3Q6
IFJFOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gUmV2ZXJ0ICJnZGItY3Jvc3MtY2FuYWRpYW46IGJ1
aWxkDQo+IGdkYiB3aXRoIHB5dGhvbiBzdXBwb3J0Ig0KPiANCj4gTXkgcGF0Y2ggdG9vayBjYXJl
IG9mIGV2ZXJ5dGhpbmcgaW5jbHVkaW5nIHBhdGhzDQo+IC1raGVtDQo+IA0KDQoNCktoZW0sIA0K
ICBJIGFtIHRlc3RpbmcgeW91ciBjb21taXQgaGVyZS4gRnJvbSB0aGUgcGF0Y2ggbG9va3MgbGlr
ZSBpdCBpcyB0YWtpbmcgY2FyZSBvZiBycGF0aCBpc3N1ZSBmb3IgZ2RiLiBUaGUgcnBhdGggaXNz
dWUgYWxzbyBuZWVkcyB0byBiZSBjb3JyZWN0ZWQgZm9yIGFsbCB0aGUgc2RrIGV4ZWN1dGFibGVz
Lg0KQW5kIEkgaGF2ZSB0aGlzIGZpeCBmb3IgZ2VuZXJhbCBzZGsgcnBhdGggZml4Lg0KDQpodHRw
Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5LWNvbnRyaWIvY29tbWl0
Lz9oPW5pdGluL3Nkay1ycGF0aA0KDQpUaGFua3MsDQpOaXRpbg0KDQoNCg==


