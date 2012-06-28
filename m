Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sk3Pg-0005qn-D5
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 03:20:52 +0200
Received: by pbbrq2 with SMTP id rq2so2239064pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0Dl/x4BBqgN5avjTAon1CCgpel7jX7DYNWz86dztKoI=;
	b=lfh+ATdL8rnwcRs54YthHoe8FTo2Ho9O+YOBN7WfVfMNqImf9Yr0Snn8en/94HJ5DE
	1cCSltpWVi2velIp5gLQ4e1lO6AEQvlb2P5zVzYQeivdTtM9ym5TI5XrXfm2Ym7WEPhs
	LGfTyjBUgV8v5UDpsOG7oqe3ASe9U6XVjiryeasXBwctH/R7lDHt+NOQilpndAYKGfqP
	aVOzUwdk2Iha7kKEukxrGE0X7P+on7vg+X2myWwpNINFqoSFQo6sp3OYj3cvObLK9bkc
	pIexqbKYsb9ZNoSCIW9rHjdeNSWVigqB5P4s/82ohcVOdHSmlRbCyz3fnGMawGFrWxIp
	igug==
Received: by 10.68.238.232 with SMTP id vn8mr555798pbc.78.1340845796846;
	Wed, 27 Jun 2012 18:09:56 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv9sm365381pbc.43.2012.06.27.18.09.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 18:09:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 18:09:39 -0700
Message-Id: <cover.1340845612.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] gcc fixes and eglibc update
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
X-List-Received-Date: Thu, 28 Jun 2012 01:20:52 -0000

This patchset updates eglibc 2.15 to latest (all qemu boot into sato image)
fix unpackaged file warning in libgcc
Remove USE_NLS from gcc configure ( depends on a patch from my previous pull )

All uclibc/eglibc images and meta-toolchains build ok and boot ok too.

The following changes since commit f4b5afe46ff018570c1949653eb6995428827f6f:

  sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2012-06-25 17:20:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/toolchain
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/toolchain

Dennis Lan (1):
  eglibc: support mipsel little endian, filter out -march=mips32

Khem Raj (3):
  libgcc: Remove unpackage unwind.h
  gcc-configure-sdk,gcc-configure-cross: Dont recompute USE_NLS
  eglibc-2.15: Update to latest on 2.15 branch

 meta/recipes-core/eglibc/eglibc_2.15.bb           |    3 ++-
 meta/recipes-devtools/gcc/gcc-configure-cross.inc |    2 --
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc   |    4 ----
 meta/recipes-devtools/gcc/libgcc_4.7.bb           |    4 ++++
 4 files changed, 6 insertions(+), 7 deletions(-)

-- 
1.7.9.5



