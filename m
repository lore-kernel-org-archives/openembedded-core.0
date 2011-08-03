Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18LYgzW/I/Cbx7y/VusIBG4rK3CJ76g0Dg=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qoczt-0007it-Id
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:04:37 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p73F0FBM009708
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 10:00:16 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 3 Aug 2011 10:00:18 -0500
Message-Id: <1D9491FE-2F9E-4AE5-B176-117DDD21BAE0@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: redundant RPATH warning?
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
X-List-Received-Date: Wed, 03 Aug 2011 15:04:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

What causes warnings like the following:

WARNING: QA Issue: gthumb: =
/work/ppce5500-poky-linux/gthumb-2.12.3-r1/packages-split/gthumb/usr/lib64=
/gthumb/extensions/libexport_tools.so contains probably-redundant RPATH =
/usr/lib64

Is this something we should by trying to clean up?

- k=


