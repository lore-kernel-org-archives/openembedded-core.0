Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QYZA7-0004a4-1x
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 09:44:47 +0200
Received: by wyb34 with SMTP id 34so1205370wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 00:41:15 -0700 (PDT)
Received: by 10.216.240.135 with SMTP id e7mr4122386wer.59.1308555675263;
	Mon, 20 Jun 2011 00:41:15 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o75sm2727588weq.40.2011.06.20.00.41.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2011 00:41:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 20 Jun 2011 09:41:08 +0200
Message-Id: <AE69955E-732E-4002-90F9-FF833BC78D8A@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: Architecture mismatch QA check not fatal?
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
X-List-Received-Date: Mon, 20 Jun 2011 07:44:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I was building qt this weekend and I noticed this one:

WARNING: QA Issue: Architecture did not match (40 to 62) on =
/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r26.1/packages-spli=
t/qt4-embedded-tools/usr/bin/moc
WARNING: QA Issue: Architecture did not match (40 to 62) on =
/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r26.1/packages-spli=
t/qt4-embedded-tools/usr/bin/uic
WARNING: QA Issue: Architecture did not match (40 to 62) on =
/work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r26.1/packages-spli=
t/qt4-embedded-tools/usr/bin/rcc

Shouldn't that be a fatal error, shipping x86 binaries in arm packages?

regards,

Koen=


