Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZw-0005eM-05
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:40 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so5531122pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Dqf0MGP36AG/yl4txp2asUjGfR6kWhnHoCTNam+VpLw=;
	b=tmWW5MVFIywLyk5F+cLZX2pJITAtuWXYbiWvfpKHrAIxDl1xsYlY9/TtfmGmZpa/lZ
	cDSpwZDvfkHYhpnBgs1sji3Z0waP/VDDUf6YzgSJpUFzeu8F5LW+sI8UnR11Qqo7o1Rr
	eAylTOOFfpkhg18v0C5k2/fhedYb41zD9GxRG78z4vC7BMHGofrA5MyQLHv+s+PJfvW9
	e8To/ShZCCzkBaR7vTNU3MNMmFTjUtQWdPcxp3B5mRdJ5jBNQyGzOQ6DY8YdF9cOIZSo
	scBhsavibCQ8ZLC2FR07dacWFk4C4Rv2e29xdOgtcVBFU+6R8vvXP96FetcCq8nfs0f/
	cyOA==
Received: by 10.68.223.37 with SMTP id qr5mr64877316pbc.159.1337571394955;
	Sun, 20 May 2012 20:36:34 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:42 -0700
Message-Id: <75167eb890d8e4683f1e3852e3b77c67d160bea7.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 07/14] libc-package: Add sh4 and mips64 to arch options
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
X-List-Received-Date: Mon, 21 May 2012 03:46:40 -0000

needed for new architecture support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/libc-package.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 10f5f87..9df3c17 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -266,10 +266,13 @@ python package_do_split_gconvs () {
 			target_arch = d.getVar('TARGET_ARCH', True)
 			locale_arch_options = { \
 				"arm":     " --uint32-align=4 --little-endian ", \
+				"sh4":     " --uint32-align=4 --big-endian ",    \
 				"powerpc": " --uint32-align=4 --big-endian ",    \
 				"powerpc64": " --uint32-align=4 --big-endian ",  \
 				"mips":    " --uint32-align=4 --big-endian ",    \
+				"mips64":  " --uint32-align=4 --big-endian ",    \
 				"mipsel":  " --uint32-align=4 --little-endian ", \
+				"mips64el":" --uint32-align=4 --little-endian ", \
 				"i586":    " --uint32-align=4 --little-endian ", \
 				"i686":    " --uint32-align=4 --little-endian ", \
 				"x86_64":  " --uint32-align=4 --little-endian "  }
-- 
1.7.5.4



