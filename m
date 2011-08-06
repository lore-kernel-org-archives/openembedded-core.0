Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18RExPoRc76N95aWW/qZhPqmczS9jqq6qw=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QpnzZ-0001xn-Ag
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 23:01:09 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p76KudAe031833;
	Sat, 6 Aug 2011 15:56:40 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Sat, 6 Aug 2011 15:56:39 -0500
Message-Id: <F5D4B029-50F1-47E1-934C-8918DF2624F5@kernel.crashing.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: multilib theory & practice
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
X-List-Received-Date: Sat, 06 Aug 2011 21:01:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I'm looking at trying to get multilib working for powerpc.  However I'm =
a bit lost in how this is suppose to work from a few different =
perspectives:

1. from user perspective (I'm starting with a 64-bit build in /lib64 and =
adding 32-bit that would be in /lib):

(i've added in local/conf):
require conf/multilib.conf
MULTILIBS =3D "multilib:lib"
DEFAULTTUNE_virtclass-multilib-lib =3D "powerpc"

What should this end up producing?  Do I get a 32-bit set of libs built =
automatically?  What else do I need to do?

2. =46rom a infrastructure point of view:

* Do have a single compiler that is multi-arch or 2 compilers? (not sure =
how the x86_64 toolchain works today)
* what areas should I investigate that might need tweaking that are arch =
specific?
* should I see different task names for the new multilib builds? (or the =
32-bit specific builds?)

- k=


