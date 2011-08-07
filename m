Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX189UKozk3cCQ84z0dJnst1MB2an8TOho2Y=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qq6uP-0006OU-SM
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Aug 2011 19:13:06 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p77H8dS4025849
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Aug 2011 12:08:39 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Sun, 7 Aug 2011 12:08:41 -0500
Message-Id: <F410F4D8-44AB-45D2-9DB5-1122C8F47077@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: how to pass or set specific gcc flags?
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
X-List-Received-Date: Sun, 07 Aug 2011 17:13:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

We'd like to pass:

--enable-targets=3Dall

on ppc when we target a 64-bit platform but happen to build a 32-bit =
toolchain & rootfs, its useful to still have 64-bit support in the =
compiler to build a 64-bit kernel if desired in this scenario.  Also, =
this seems useful for the multilib situation.

Wondering what the best way of doing this.  Adding something into the =
tune-ppcFOOBAR file but not sure how to do that so it gets picked up by =
the right toolchain pass.  And what do we even override?  I suggested =
adding a GCC_EXTRA_OECONF.

- k=


