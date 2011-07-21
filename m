Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/s7199cTFnhTf01bIv0Xkq4A0TVa5gmsk=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjsFw-0007qO-CY
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 14:21:33 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6LCHMjB014336
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 07:17:22 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Thu, 21 Jul 2011 07:17:22 -0500
Message-Id: <BBB3C9E0-A02C-4375-8075-5DD2C6588AB4@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: siteinfo split between powerpc-common & powerpc-linux
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
X-List-Received-Date: Thu, 21 Jul 2011 12:21:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Why do we have a split between powerpc-common & powerpc-linux?

I assume powerpc-linux is used and picked up for powerpc-linux-uclibc in =
addition to normal powerpc-linux.

I'm looking at adding powerpc64 support and powerpc-common is all kinda =
of broken for it.  I'd like to just merge powerpc-common & powerpc-linux =
(as powerpc-linux 32-bit) for now and start a new powerpc-common that =
refactors 32/64 commonalities.

Unless someone says otherwise about the meaning of these files.

- k=


