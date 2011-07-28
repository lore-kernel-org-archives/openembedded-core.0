Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/plmNFhdIiFRLZRSgcKzdHICyDIXsET1I=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmGi1-0008Dd-Gn
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 04:52:25 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6S2m7nc013866;
	Wed, 27 Jul 2011 21:48:08 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 27 Jul 2011 21:48:07 -0500
Message-Id: <9D7C46F9-A7B2-4C47-8508-731065196E5D@kernel.crashing.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: some multilib questions
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
X-List-Received-Date: Thu, 28 Jul 2011 02:52:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Richard,

Now that it looks the multilib changes are in poky.git had a few =
questions as I'd like to try them out for powerpc.  In this case 32 vs =
64-bit.

1. Does some aspect of the TUNE_PKGARCH get modified automatically for =
32 vs 64-bit ?
2. What is TUNENAME_virtclass-multilib-lib32 ?  (trying to figure out =
how to set it for ppc)
3. is eglibc build multiple times? once for 32-bit and once for 64-bit
4. is gcc build multiple times -- or is there some different configure =
flags passed to it?

any other hints on areas to look at w/regards to trying and getting the =
ppc going would be appreciated.

thanks

- k=


