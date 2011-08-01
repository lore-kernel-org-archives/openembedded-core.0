Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18K+SgMZCpccHTs7J9n9fUzt3TRQ/m5a+w=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QnvDK-0007HB-Ah
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 18:19:34 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p71GFD3l015881
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 11:15:14 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Mon, 1 Aug 2011 11:15:15 -0500
Message-Id: <55CEBFCA-8098-4A58-BC84-0C88D2484ED3@kernel.crashing.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: lib64 not getting picked up
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
X-List-Received-Date: Mon, 01 Aug 2011 16:19:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I'm trying to build a powerpc 64-bit system and for some reason =
everything is still in /lib instead of /lib64.

I'd expect things in /lib64 based on how arch-powerpc64.inc has:

BASE_LIB_tune-powerpc64 =3D "lib64"

any ideas on what to look at for why this isn't happening?

- k=


