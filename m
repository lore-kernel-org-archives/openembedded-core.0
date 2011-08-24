Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/0HLVA64ea0Z8fCh8f7h3YSMw8O2ba3M8=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qw5jg-0001zp-Op
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 07:10:45 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7O55v4O031710;
	Wed, 24 Aug 2011 00:05:58 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 24 Aug 2011 00:05:57 -0500
Message-Id: <A09A21A1-D31F-4D21-92BD-6F521FD3012C@kernel.crashing.org>
To: Darren Hart <dvhart@linux.intel.com>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: u-boot.inc issue with -Os
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
X-List-Received-Date: Wed, 24 Aug 2011 05:10:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Darren,

in meta/recipes-bsp/uboot/u-boot.inc:

# GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
EXTRA_OEMAKE =3D "CROSS_COMPILE=3D${TARGET_PREFIX} OPTFLAGS=3D''"

Was this for all u-boot builds, regardless of architecture, or just ppc. =
 Was the build failing or resulting binaries?

- k=


