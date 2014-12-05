Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 83CB172341
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 12:06:10 +0000 (UTC)
Received: from SESTOEX09.enea.se ([fe80::94d8:372f:210c:b4da]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Fri, 5 Dec 2014 13:06:04 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "'Burton, Ross'" <ross.burton@intel.com>, Saul Wold <sgw@linux.intel.com>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [daisy][PATCH] python: Building without SSLv3 support
Thread-Index: AQHQDtCGHMHlJ+hOHk6/zocS2IGhbpx+Fp6AgAGinhCAAOjDQA==
Date: Fri, 5 Dec 2014 12:06:03 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48257C774E@sestoex09.enea.se>
References: <1417594165-25317-1-git-send-email-sona.sarmadi@enea.com>
	<CAJTo0LY4Y6eWLUMvBLjwnKNy=KLoxh3Knien+HgOB5ZqXrmkRg@mail.gmail.com>
	<3230301C09DEF9499B442BBE162C5E48257C4F6E@sestoex09.enea.se>
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48257C4F6E@sestoex09.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: Maxin John <Maxin.John@enea.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: FW: [daisy][PATCH] python: Building without SSLv3 support
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
X-List-Received-Date: Fri, 05 Dec 2014 12:06:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

IEhpIGd1eXMsDQoNCj4gVGhpcyBzaG91bGQgYmUgYXBwbGllZCB0byBtYXN0ZXIgZmlyc3QsIGFu
ZCB0aGVuIGJhY2twb3J0ZWQgdG8gYW55IHN0YWJsZQ0KPiBicmFuY2hlcy7CoCBDYW4geW91IHJl
LXNlbmQgaW4gYSBmb3JtIHRoYXQgYXBwbGllcyB0byBtYXN0ZXI/DQo+IA0KPiBSb3NzDQoNClB5
dGhvbiBoYXMgZml4ZWQgdGhpcyBpc3N1ZSBpbiB2ZXJzaW9uIDMuNS4gIGFuZCBiYWNrcG9ydGVk
IHRvICAyLjc6DQpTZWUgdGhlIHBhdGNoIGhlcmU6DQogaHR0cHM6Ly9oZy5weXRob24ub3JnL2Nw
eXRob24vcmV2L2Y3NjJjYmI3MTJkZQ0KDQpCdXQgdGhpcyBwYXRjaCBkb2VzbuKAmXQgYXBwbHks
IEkgaGF2ZSBkb3dubG9hZGVkIHRoZSBsYXRlc3QgMi43LjgsIGl0IGlzIHRoZSANClNhbWUgcHJv
YmxlbSB0aGVyZS4gSSBoYXZlIHNlbnQgZW1haWwgdG8gdGhlIGd1eSByZXNwb25zaWJsZSB0byB0
aGlzIHBhdGNoIA0KYnV0IGhhdmVuJ3QgaGVhcmQgZnJvbSBoaW0geWV0LiAgVGhlIGNvbW1pdCBt
ZXNzYWdlIGFsc28gc2F5IHRoYXQgIiBUaGUgDQpiYWNrcG9ydCBjdXJyZW50bHkgZG9lc24ndCBh
Y2hpZXZlIGFueXRoaW5nIHNpbmNlIHRoZSBmdW5jdGlvbiBpc24ndCB1c2VkICh5ZXQpIjogDQoN
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0N
CmNoYW5nZXNldCA5MzU0OTpmNzYyY2JiNzEyZGUgMi43DQoNCkJhY2twb3J0IGRpc2FibGluZyBv
ZiBTU0x2MyBpbiBzc2wuX2NyZWF0ZV9zdGRsaWJfY29udGV4dCgpIChpc3N1ZSAjMjI2MzgpLiAN
ClRoZSBiYWNrcG9ydCBjdXJyZW50bHkgZG9lc24ndCBhY2hpZXZlIGFueXRoaW5nIHNpbmNlIHRo
ZSBmdW5jdGlvbiBpc24ndCB1c2VkDQogKHlldCkuIFsjMjI2MzhdDQo9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQoNClNvIHRoaXMgaXMgdGhl
IHJlYXNvbiB3aHkgSSBoYXZlIGFwcGxpZWQgdGhlIERlYmlhbiBwYXRjaC4gIFRoZXkgZGlzYWJs
ZSBTU0x2MyANCmluIHB5dGhvbiAgdGhpcyB3YXkgYmVjYXVzZSB0aGV5IGhhdmUgZGlzYWJsZWQg
U1NMdjMgaW4gT3BlblNTTCBpbiB0aGVpciBKZXNzaWUuIA0KU28gaWYgd2UgdGFrZSBEZWJpYW4n
cyBwYXRjaCB3ZSBuZWVkIHRvIGRlZmluZSAiT1BFTlNTTF9OT19TU0wz4oCdIGluIHRoZSANCk9w
ZW5TU0wgYXMgd2VsbC4gQXJlIHlvdSBvayB3aXRoIHRoaXM/ICh0aGUgc2FtZSB3YXkgdGhhdCAi
T1BFTlNTTF9OT19TU0wyIg0KaXMgZGVmaW5lZCBpbiBPcGVuU1NMKS4NCg0Kc3NsL3NzbC5oDQoj
aWYgKGRlZmluZWQoT1BFTlNTTF9OT19SU0EpIHx8IGRlZmluZWQoT1BFTlNTTF9OT19NRDUpKSAm
JiAhZGVmaW5lZChPUEVOU1NMX05PX1NTTDIpDQojZGVmaW5lIE9QRU5TU0xfTk9fU1NMMg0KI2Vu
ZGlmDQoNCkNoZWVycw0KU29uYQ0K

