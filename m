Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19W5NFg0GBK5+oOLLrx5qPNcRa1ocBwNHs=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrDDf-0003p6-Qj
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 20:09:32 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7AI4wIZ018354
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:04:59 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 10 Aug 2011 13:04:58 -0500
Message-Id: <6FBBF7C4-8FB0-4F64-9C6E-47D402D924C8@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: multilib warnings?
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
X-List-Received-Date: Wed, 10 Aug 2011 18:09:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I feel like I have something not configured correctly.  The setup is as =
follows:

base is ppc64 with 'lib64'.

# Uncomment the following lines to enable multilib builds
require conf/multilib.conf
MULTILIBS =3D "multilib:lib"
DEFAULTTUNE_virtclass-multilib-lib =3D "powerpc"

And I get:

NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for libusb (lib-libusb-compat, =
libusb-compat)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libusb
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide =
virtual/libc =
(/local/home/galak/git/poky/meta/recipes-core/eglibc/eglibc_2.13.bb =
virtual:multilib:lib:/local/home/galak/git/poky/meta/recipes-core/eglibc/e=
glibc_2.13.bb).
 This usually means one provides something the other doesn't and should.
ERROR: Multiple .bb files are due to be built which each provide =
virtual/libiconv =
(/local/home/galak/git/poky/meta/recipes-core/eglibc/eglibc_2.13.bb =
virtual:multilib:lib:/local/home/galak/git/poky/meta/recipes-core/eglibc/e=
glibc_2.13.bb).
 This usually means one provides something the other doesn't and should.
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks

- k=


