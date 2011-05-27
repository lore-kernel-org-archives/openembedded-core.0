Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QPpy6-0002lp-Ka
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 07:52:18 +0200
Received: by pvc30 with SMTP id 30so662953pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 22:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=4O3TNh6pqjGVAREPoWUmJUtK3DE1lw4WyVR0eMowwbw=;
	b=bLRApQrmxDxkyXmje9mRuYaGboH5mkiMP30lC0Y4DpoTx3bKCCwkCqM2OB/9sRf52U
	eyzGVMiqSqXdekVr/+M9HElLkFA0FfjcHX91tbS7XmP4Hl7ndrrLmWFmFX5qiXINImUy
	sFCtEeZkl02zEYkCgrfAaq9eDMzPfzGJZ01X0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=f6xPOSs4aGDy5PPubJFK7x77cay6ualI2EXHAJPp7HJzYAvCBSskWGfvYPUpUx57vF
	LUq7zcHp6cJT9ub2wS4xuorShiUean4Pq5rcfr+Y0FrGmGNXKEDTlmPPa7RR7LguYSbo
	Gn7NCbiEhGlIAFTGVnq9eWe1QqQMuQYeuz4hA=
Received: by 10.68.35.70 with SMTP id f6mr736950pbj.172.1306475352857;
	Thu, 26 May 2011 22:49:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm237613pbd.92.2011.05.26.22.49.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 22:49:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2011 22:48:59 -0700
Message-Id: <cover.1306475241.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Khem Raj <kraj@juniper.net>
Subject: [PATCH 0/3] Fix uclibc build in thumb mode
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
X-List-Received-Date: Fri, 27 May 2011 05:52:18 -0000

slugos uses uclibc in thumb mode. These patches fix the build of uclibc in thumb mode
and additionally fixes shared-mime-info which failed to build with -j4

The following changes since commit 31b3d1f9aa6fa1640874f7da9cce37f4aa13eab1:

  uclibc_git.bb: Fix compilation on arm when using thumb instruction set (2011-05-26 22:44:50 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-thumb
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-thumb

Khem Raj (3):
  uclibc_git.bb: Fix compilation on arm when using thumb instruction
    set
  uclibc.inc: Set COMPILE_IN_THUMB_MODE in .config if
    ARM_INSTRUCTION_SET != arm
  shared-mime-info_0.90.bb: Fix more parallel build issues

 .../uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch    |   33 ++++++++++++++++++++
 .../uclibc-git/compile-arm-fork-with-O2.patch      |   21 ++++++++++++
 meta/recipes-core/uclibc/uclibc.inc                |    1 +
 meta/recipes-core/uclibc/uclibc_git.bb             |    4 ++-
 .../files/fix-parallel-build-backport.patch        |   26 +++++++++++++++
 .../shared-mime-info/shared-mime-info_0.90.bb      |    5 ++-
 6 files changed, 87 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
 create mode 100644 meta/recipes-support/shared-mime-info/files/fix-parallel-build-backport.patch

-- 
1.7.4.1



