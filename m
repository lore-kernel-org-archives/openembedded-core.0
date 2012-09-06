Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9U1O-000681-DY
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 06:48:54 +0200
Received: by iaky10 with SMTP id y10so1659673iak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 21:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2brBRQq6dMs1sDatV2HJfq6mYyUVQUBzv75R5k5BccU=;
	b=F/G5HW/d/VCIAc4D4UaQpS029tM8FtXLB/p8xki9Pp12aglK+Pi9KonWPwVy0WIDcl
	oxcKh9H3L6zIt5tcLqzHx0cIOBqRuYfV3FfflmLlyfxZUbr+YgE8LFWSycDndoSLn76P
	e+ct3zgiVpGPC0bckaKwO9Z1krEba1j/4zsdSc4YOD4Sw2/kVWD1Nu3gJi32jIlBJ17K
	RlfUPRxly9gMGECZTe3PdxTaaWDGFRssJQosElJ/MBe16DxlljbNYASRZq2fVS50XlBc
	JvU00b96RHoCrutZBChUpWal1Tird0svgkYTRz8+CF7aeZDArJgv2PBsjSvplhMnK7qs
	tupQ==
Received: by 10.50.0.166 with SMTP id 6mr20197068igf.17.1346906189880;
	Wed, 05 Sep 2012 21:36:29 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id bp8sm2627852igb.12.2012.09.05.21.36.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 21:36:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 21:35:35 -0700
Message-Id: <cover.1346905978.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] GCC fixes and updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 04:48:54 -0000

This patchset switches us back to using svn for SRC_URI
and fixes building for armv4 and ppc soft float targets
Finally fixes for libgcc to build with new build sequence
such that its same with gcc-cross and gcc-cross-initial

The following changes since commit 610f8c0c0cab8e258919689fd641faec28b58caf:

  adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:27:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-updates

Khem Raj (4):
  gcc: Switch SRC_URI to use svn
  gcc-4.7: Fix build for armv4/EABI and ppc/Os
  arch-armv4.inc: On armv4 add --fix-v4bx to linker flags for kernel
  gcc-4.7: Backport libgcc fixes to appease the new build sequence

 meta/conf/machine/include/arm/arch-armv4.inc       |    1 +
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   14 +--
 ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 ++++++++++++++++++++
 ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 +++++++++++
 .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   29 ++++++
 .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   21 +++++
 6 files changed, 202 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch

-- 
1.7.9.5



