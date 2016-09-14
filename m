Return-Path: <sona.sarmadi@enea.com>
X-Greylist: delayed 486 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Sep 2016 08:57:40 UTC
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.42])
	by mail.openembedded.org (Postfix) with ESMTP id 80A6977252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 08:57:40 +0000 (UTC)
Received: from 1bk5sr-0007mu-U4 by out10c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1bk5sr-0007o8-Ur; Wed, 14 Sep 2016 01:49:33 -0700
Received: by emcmailer; Wed, 14 Sep 2016 01:49:33 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10c.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1bk5sr-0007mu-U4; Wed, 14 Sep 2016 01:49:33 -0700
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0294.000; Wed, 14 Sep 2016 10:49:32 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, akuster
	<akuster@mvista.com>, "Purdie, Richard (richard.purdie@intel.com)"
	<richard.purdie@intel.com>, "'Maxin B. John'" <maxin.john@intel.com>
Thread-Topic: CVE-2016-3116: dropbear: X11 forwarding input not validated
	properly
Thread-Index: AdIOYyPZHhBXSrHHRzyIt14w/L4j7A==
Date: Wed, 14 Sep 2016 08:49:31 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48ABE3BA3B@SESTOEX04.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: CVE-2016-3116: dropbear: X11 forwarding input not validated properly
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
X-List-Received-Date: Wed, 14 Sep 2016 08:57:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgZ3V5cywNCg0KSSBuZWVkIHlvdXIgYWR2aWNlIGhvdyB0byBhZGRyZXNzIHRoaXMgQ1ZFIGlu
IGtyb2dvdGggKG1hc3RlciBpcyBub3QgYWZmZWN0ZWQpDQpodHRwczovL2N2ZS5taXRyZS5vcmcv
Y2dpLWJpbi9jdmVuYW1lLmNnaT9uYW1lPUNWRS0yMDE2LTMxMTYNCg0KSSBjb3VsZG4ndCBmaW5k
IGEgcGF0Y2ggZm9yIHRoaXMgc3BlY2lmaWMgQ1ZFIGluIGRyb3BiZWFyIGdpdCBvciBzb21ld2hl
cmUgZWxzZSwgaWYgd2Ugd2FudCB0byBhZGRyZXNzIHRoaXMgaXNzdWUgaXQgc2VlbXMgdGhhdCB3
ZSBuZWVkIHRvIHVwZGF0ZSB0aGUgZHJvcGJlYXIgdmVyc2lvbiBpbiBrcm9nb3RoIHRvICIyMDE2
LjcyIi4gSXMgdGhpcyBvaz8NCg0KRHJvcGJlYXIgdmVyc2lvbiBpbiBrcm9nb3RoIGlzIDIwMTUu
NzE6DQpodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5L3RyZWUv
bWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXI/aD1rcm9nb3RoDQpkcm9wYmVhcl8yMDE1LjcxLmJi
DQoNCg0KaHR0cHM6Ly9tYXR0LnVjYy5hc24uYXUvZHJvcGJlYXIvQ0hBTkdFUw0KLi4uLi4NCjIw
MTYuNzIgLSA5IE1hcmNoIDIwMTYgICAgPDw8PDw8PCBkcm9wYmVhciB2ZXJzaW9uIHRoaXMgQ1ZF
IGhhcyBiZWVuIGZpeGVkDQotIFZhbGlkYXRlIFgxMSBmb3J3YXJkaW5nIGlucHV0LiBDb3VsZCBh
bGxvdyBieXBhc3Mgb2YgYXV0aG9yaXplZF9rZXlzIGNvbW1hbmQ9IHJlc3RyaWN0aW9ucywNCiAg
Zm91bmQgYnkgZ2l0aHViLmNvbS90aW50aW53ZWIuIFRoYW5rcyBmb3IgRGFtaWVuIE1pbGxlciBm
b3IgYSBwYXRjaC4gQ1ZFLTIwMTYtMzExNg0KDQoyMDE1LjcxIC0gMyBEZWNlbWJlciAyMDE1ICA8
PDw8IGRyb3BiZWFyIHZlcnNpb24gaW4ga3JvZ290aA0KLi4uLi4NCg0KTG9va2luZyBhdCBkcm9w
YmVhciBnaXQgcmVwbyBJIHNlZSBzb21lIG1vcmUgY29tbWl0cyBiZXR3ZWVuIHRoZXNlIHZlcnNp
b25zIGJ1dCBDSEFOR0VTIGZpbGUgZG9lc24ndCBtZW50aW9uIHRoaXMgc28gcHJvYmFibHkgdGhl
c2UgYXJlIG1pbm9yIGNoYW5nZXMuDQoNClRoYW5rcw0KLy9Tb25hDQo=

