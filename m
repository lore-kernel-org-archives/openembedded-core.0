Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Feb 2020 06:52:51 UTC
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C581460B74
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 06:52:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Feb 2020 22:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,396,1574150400"; d="scan'208";a="230920892"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by orsmga003.jf.intel.com with ESMTP; 02 Feb 2020 22:45:44 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.131]) by
	PGSMSX105.gar.corp.intel.com ([169.254.4.51]) with mapi id
	14.03.0439.000; Mon, 3 Feb 2020 14:45:43 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"joel@jms.id.au" <joel@jms.id.au>
Thread-Topic: [OE-core] [PATCH] perf: Additional fixes for 5.5+
Thread-Index: AQHV2lw+rMZyuNaKGkeQwrQDctaJaagIgEYA
Date: Mon, 3 Feb 2020 06:45:42 +0000
Message-ID: <d07c374f6602370df038e8440c2c5aedf6faecea.camel@intel.com>
References: <20200203063455.417119-1-joel@jms.id.au>
In-Reply-To: <20200203063455.417119-1-joel@jms.id.au>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.21.206]
MIME-Version: 1.0
Cc: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Subject: Re: [PATCH] perf: Additional fixes for 5.5+
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
X-List-Received-Date: Mon, 03 Feb 2020 06:52:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E42950AE5D64D34EA5F761A178AD1F42@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIwLTAyLTAzIGF0IDE3OjA0ICsxMDMwLCBKb2VsIFN0YW5sZXkgd3JvdGU6DQo+
ICAgICAgIyB1c2UgL3Vzci9iaW4vZW52IGluc3RlYWQgb2YgdmVyc2lvbiBzcGVjaWZpYyBweXRo
b24NCj4gLSAgICBmb3IgcyBpbiBgZmluZCAke1N9L3Rvb2xzL3BlcmYvIC1uYW1lICcqLnB5J2A7
IGRvDQo+IC0gICAgICAgIHNlZCAtaSAncywvdXNyL2Jpbi9weXRob24sL3Vzci9iaW4vZW52IHB5
dGhvbjMsJyAiJHtzfSINCj4gKyAgICBmb3IgcyBpbiBgZmluZCAke1N9L3Rvb2xzL3BlcmYvIC1u
YW1lICcqLnB5J2ANCj4gc2NyaXB0cy9icGZfaGVscGVyc19kb2MucHk7IGRvDQo+ICAgICAgICAg
IHNlZCAtaSAncywvdXNyL2Jpbi9weXRob24yLC91c3IvYmluL2VudiBweXRob24zLCcgIiR7c30i
DQo+ICAgICAgICAgIHNlZCAtaSAncywvdXNyL2Jpbi9lbnYgcHl0aG9uMiwvdXNyL2Jpbi9lbnYg
cHl0aG9uMywnICIke3N9Ig0KPiAgICAgICAgICBzZWQgLWkgJ3MsL3Vzci9iaW4vcHl0aG9uMywv
dXNyL2Jpbi9lbnYgcHl0aG9uMywnICIke3N9Ig0KPiArICAgICAgICBzZWQgLWkgJ3MsL3Vzci9i
aW4vcHl0aG9uLC91c3IvYmluL2VudiBweXRob24zLCcgIiR7c30iDQoNCkNhbiBhbGwgdGhlc2Ug
bGluZXMgYmUgcmVwbGFjZWQgYnk6DQoNCnNlZCAtaSAtZSAiMXMsIyEuKnB5dGhvbi4qLCMhJHtV
U1JCSU5QQVRIfS9lbnYgcHl0aG9uMywiICR7c30NCg0KVGhhbmtzLA0KDQpBbnVqDQo=

