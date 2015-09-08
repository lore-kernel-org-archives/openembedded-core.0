Return-Path: <umut.tezduyar@axis.com>
X-Greylist: delayed 526 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Sep 2015 11:53:20 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B488360053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 11:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CDCAF1818B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:44:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9LX7wJfi6UP2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:44:32 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 28A331815E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:44:32 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 05A5112B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:44:32 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id EE41612B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:44:31 +0200 (CEST)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by seth.se.axis.com (Postfix) with ESMTP id ECDCC3E049
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:44:31 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Tue, 8 Sep 2015 13:44:31 +0200
From: Umut Tezduyar Lindskog <umut.tezduyar@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 8 Sep 2015 13:44:31 +0200
Thread-Topic: 32 bit time_t in openembedded
Thread-Index: AdDqK7nb77Ma5JfNTb6Xs3yNO1KC0A==
Message-ID: <D2E79685-E16A-4941-BB7B-E7F21E250DD2@axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: 32 bit time_t in openembedded
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
X-List-Received-Date: Tue, 08 Sep 2015 11:53:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkNhbiAzMiBiaXRzIElTQSBoYW5kbGUgeWVhciAyMDM4IHByb2JsZW0gaW4gb3BlbmVt
YmVkZGVkPw0KDQpPdXIgSVNBIGlzIDMyIGJpdHMgYW5kIHdlIGFyZSB1c2luZyByZWxhdGl2ZWx5
IG5ldyBrZXJuZWwgd2l0aCByZWxhdGl2ZWx5IG9sZCBnbGliYyAoMi4xNSkuIFdlIGFyZSB1c2lu
ZyBSVEMgY2hpcHMgd2hpY2ggY29tZSB3aXRoIGEgcmFuZG9tIGRhdGUvdGltZSBpbml0aWFsaXpl
ZC4gV2Ugc3RhcnRlZCBzZWVpbmcgYm9vdCBwcm9ibGVtcyBpbiBzeXN0ZW1kIGlmIHRoZSByYW5k
b20gdmFsdWUgb2YgUlRDIGlzIG5ld2VyIHRoYW4gMjAzOC4NCg0KaHR0cHM6Ly9naXRodWIuY29t
L3N5c3RlbWQvc3lzdGVtZC9pc3N1ZXMvMTE0Mw0KDQpVcHN0cmVhbSBzeXN0ZW1k4oCZcyBhbnN3
ZXIgaXMgcHJldHR5IG11Y2ggdXNpbmcgNjQgYml0cyB0aW1lX3Qgc3RydWN0dXJlIGJ1dCB0aGlz
IGlzIHJlbGF0aXZlbHkgZXhwZW5zaXZlIG9uIDMyIGJpdHMgSVNBLg0KDQpJIGFtIHdvbmRlcmlu
ZyB3aGF0IHRoZSBiaXQgbGVuZ3RoIG9mIHRpbWVfdCBzdHJ1Y3R1cmUgaW4gb3BlbmVtYmVkZGVk
IGZvciAzMiBiaXRzIElTQXMuDQoNCkluIG90aGVyIHdvcmRzLCBjYW4geW91ciBwcm9kdWN0IGhh
bmRsZSBmb2xsb3dpbmc6DQoNCiQ+IGRhdGUgJzIwMzgtMDEtMTkgMDM6MTTigJkgJiYgaHdjbG9j
ayAtdyAoI1dhaXQgNyBzZWNvbmRzIHRvIHNlZSBpZiBzeXN0ZW1kIGdldHMgc3R1Y2spDQoNCk5P
VEU6IERvbuKAmXQgZm9yZ2V0IHRvIHJldmVydCB5b3VyIGRhdGUgYmFjay4gT3RoZXJ3aXNlLCB5
b3VyIHByb2R1Y3Qgd29u4oCZdCBib290IHdpdGggc3lzdGVtZC4NCg0KVW11dA==

