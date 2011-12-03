Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RWwDg-0006FS-94
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Dec 2011 21:30:00 +0100
Received: from mail55-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.23; Sat, 3 Dec 2011 20:23:13 +0000
Received: from mail55-tx2 (localhost [127.0.0.1])	by mail55-tx2-R.bigfish.com
	(Postfix) with ESMTP id 228405A01CE	for
	<openembedded-core@lists.openembedded.org>;
	Sat,  3 Dec 2011 20:23:12 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzzz2dh2a8h668h839h8e2h8e3h67h)
X-Spam-TCS-SCL: 6:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail55-tx2 (localhost.localdomain [127.0.0.1]) by mail55-tx2
	(MessageSwitch) id 132294379239426_3062; Sat,  3 Dec 2011 20:23:12 +0000
	(UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.237])	by
	mail55-tx2.bigfish.com (Postfix) with ESMTP id DE91D620046	for
	<openembedded-core@lists.openembedded.org>;
	Sat,  3 Dec 2011 20:23:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sat, 3 Dec 2011 20:23:11 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Sat, 3 Dec 2011 14:23:11 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: meta-environment.bb: nostamp?
Thread-Index: AQHMsflfSpSkeW2T10exyT87jqKaNQ==
Date: Sat, 3 Dec 2011 20:23:10 +0000
Message-ID: <CAEsOVNekYJtuSGfjb_gr8qS4veGgQOR1VgWkfHzCqds2Oe-6qg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: meta-environment.bb: nostamp?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 03 Dec 2011 20:30:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0C3F88A5730DDF498BDAA00CCF584C9D@freescale.net>
Content-Transfer-Encoding: quoted-printable

Why do we have no stamps generated here for certain tasks? I'm getting
sstate-cache generated twice for this recipe, but I can't debug past
the step below because the stamps are not generated!

$ bitbake-diffsigs
x86_64-nativesdk-fslsdk-linux/meta-environment-powerpc-1.0-r7.do_package.si=
gdata.*
Hash for dependent task meta-environment.bb.do_install changed from
0cb26d08ac9e0ead20f5dd7865bc43e3 to c2165531ac95edd49188597bae81a70d

-M=



