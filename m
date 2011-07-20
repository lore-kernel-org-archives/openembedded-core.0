Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE008.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B11780@freescale.com>) id 1QjW00-0000Uq-QV
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 14:35:36 +0200
Received: from mail44-tx2-R.bigfish.com (10.9.14.247) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.22; Wed, 20 Jul 2011 12:16:23 +0000
Received: from mail44-tx2 (localhost.localdomain [127.0.0.1])	by
	mail44-tx2-R.bigfish.com (Postfix) with ESMTP id 7FF6213E019E	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 12:16:23 +0000 (UTC)
X-SpamScore: 4
X-BigFish: VS4(z33fclzzz1202hzz8275bhz2dh2a8h668h839h944h66h)
X-Spam-TCS-SCL: 5:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail44-tx2 (localhost.localdomain [127.0.0.1]) by mail44-tx2
	(MessageSwitch) id 1311164183465753_24757;
	Wed, 20 Jul 2011 12:16:23 +0000 (UTC)
Received: from TX2EHSMHS037.bigfish.com (unknown [10.9.14.240])	by
	mail44-tx2.bigfish.com (Postfix) with ESMTP id 63EBD5D804B	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 12:16:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS037.bigfish.com
	(10.9.99.137) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 20 Jul 2011 12:16:23 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.289.8; Wed, 20 Jul 2011 07:16:22 -0500
Received: from mvp-10-214-72-166.am.freescale.net
	(mvp-10-214-72-166.am.freescale.net [10.214.72.166])	by
	az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p6KCGLwk005189	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 07:16:21 -0500 (CDT)
From: Kumar Gala <kumar.gala@freescale.com>
Date: Wed, 20 Jul 2011 07:16:21 -0500
Message-ID: <5A3CA715-DE17-48DC-A7DC-8063B44942E9@freescale.com>
To: <openembedded-core@lists.openembedded.org>
MIME-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Wed, 20 Jul 2011 14:37:54 +0200
Subject: sudo build failure
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
X-List-Received-Date: Wed, 20 Jul 2011 12:35:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Trying to build a powerpc64 target rootfs and I'm getting the following =
build failures on sudo.  Wondering if anyone has seen anything similar:

http://pastebin.com/MeqPn46Q

- k=



