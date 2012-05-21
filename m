Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWWJO-0006kD-L0
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 19:22:26 +0200
Received: by dalh21 with SMTP id h21so6181608dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Cz4dR+gOPzgdnEoPZc+sxdK0Hm/1aMj4I2atrNP2m0w=;
	b=K67f24aFAKnSOdGHBrv24ciHEioEq9EzrDSCe/pWR+xt7dHRsjmEk4yFv/TaI6rbYZ
	tSh7PAnvagWC0LMpIq7sKrhCPzMsIl2Teb/LUeOKDOd883sou93k1hW9lAtabq3+anwe
	PzPHKnHa6PkBeheKw0mtXCnTPTqS9XAujtutP0oF+tt3pY9ppc/Bu60Nc20wks6t8+2Z
	TQJbhCEBbTlcep3kK/oVMj4tM+OViid3EwHzKTBCYwCaNMsjHBOUGHnuA1+cxwtPcnx1
	7fcJv+uu4qgX3RF1+cpES1SueFrlO5D3qXhg5H9iD3501IsD3odG+ZYV8UHG2w5ZhZA6
	wgaw==
Received: by 10.68.221.39 with SMTP id qb7mr70650997pbc.120.1337620337986;
	Mon, 21 May 2012 10:12:17 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tj4sm9694206pbc.33.2012.05.21.10.12.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 10:12:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2012 10:11:44 -0700
Message-Id: <cover.1337620159.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] ARM hf support
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
X-List-Received-Date: Mon, 21 May 2012 17:22:27 -0000

This patchset adds the newly added hard float convention for naming the 
dynamic linker. We have a tune feature to denote hf calling convention
already therefore this patch uses that feature to decide on configuring
the toolchain to be soft float or hard-float call conventions by default.


The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:

  tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/armhf
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/armhf

Khem Raj (3):
  gcc-4.7: Add knowledge about arm hf dynamic loader
  eglibc: Add ARM hf dynamic linker support
  gcc: Grok for callconvention-hard to enable hard float

 .../eglibc/eglibc-2.15/add_HAVE_ARM_PCS_VFP.patch  |   28 ++
 .../eglibc/eglibc-2.15/ldso_arm_hf_support.patch   |  338 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    4 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/arm-hard-float-loader.patch        |   48 +++
 meta/recipes-devtools/gcc/gcc-common.inc           |    2 +
 6 files changed, 420 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/add_HAVE_ARM_PCS_VFP.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ldso_arm_hf_support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch

-- 
1.7.5.4



