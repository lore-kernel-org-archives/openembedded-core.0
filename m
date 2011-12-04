Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RXH9r-0007ts-Vn
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Dec 2011 19:51:31 +0100
Received: from mail81-tx2-R.bigfish.com (10.9.14.252) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Sun, 4 Dec 2011 18:44:41 +0000
Received: from mail81-tx2 (localhost [127.0.0.1])	by mail81-tx2-R.bigfish.com
	(Postfix) with ESMTP id B43093C0145	for
	<openembedded-core@lists.openembedded.org>;
	Sun,  4 Dec 2011 18:44:41 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzzz2dh2a8h668h839h8e2h8e3h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail81-tx2 (localhost.localdomain [127.0.0.1]) by mail81-tx2
	(MessageSwitch) id 1323024281590049_30630;
	Sun,  4 Dec 2011 18:44:41 +0000 (UTC)
Received: from TX2EHSMHS042.bigfish.com (unknown [10.9.14.241])	by
	mail81-tx2.bigfish.com (Postfix) with ESMTP id 8937B700019	for
	<openembedded-core@lists.openembedded.org>;
	Sun,  4 Dec 2011 18:44:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS042.bigfish.com
	(10.9.99.142) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 4 Dec 2011 18:44:41 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Sun, 4 Dec 2011 12:44:41 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: do_populate_lic_setscene when building LSB on edison
Thread-Index: AQHMsrTI+sIH3mCgFEC3XmCMc1OGDQ==
Date: Sun, 4 Dec 2011 18:44:41 +0000
Message-ID: <CAEsOVNceh3VcNJ9P=mhFnwOPn_w=QrRMPNTZkdnwf5dsapFfaA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: do_populate_lic_setscene when building LSB on edison
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
X-List-Received-Date: Sun, 04 Dec 2011 18:51:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <9D3B56E283208749B52D669000AB706C@freescale.net>
Content-Transfer-Encoding: quoted-printable

Can anyone comment if this issue has been resolved on master? It's
very random which package it occurs on, it only seems to happen when
building the LSB target, and it also appears to happen on my CentOS 5
box and not my Ubuntu box (at least less often)... sometimes it
happens only on one package in a build, sometimes it's 5-10
packages...

ERROR: Task 3209
(/opt/yocto/cache-test/p2041rdb/meta/recipes-graphics/freetype/freetype_2.4=
.6.bb,
do_populate_lic_setscene) failed with exit code '1'
ERROR: Task 3125
(/opt/yocto/cache-test/p2041rdb/meta/recipes-extended/augeas/augeas_0.8.1.b=
b,
do_populate_sysroot_setscene) failed with exit code '1'
ERROR: Task 3106
(/opt/yocto/cache-test/p2041rdb/meta/recipes-support/icu/icu_3.6.bb,
do_package_setscene) failed with exit code '1'
ERROR: Task 3147
(/opt/yocto/cache-test/p2041rdb/meta/recipes-extended/newt/libnewt_0.52.13.=
bb,
do_populate_sysroot_setscene) failed with exit code '1'
ERROR: Task 3120
(/opt/yocto/cache-test/p2041rdb/meta/recipes-extended/libzypp/libzypp_git.b=
b,
do_populate_lic_setscene) failed with exit code '1'
ERROR: Task 3164
(/opt/yocto/cache-test/p2041rdb/meta/recipes-connectivity/bind/bind_9.7.2-P=
3.bb,
do_populate_lic_setscene) failed with exit code '1'

-M=



