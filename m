Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-02.prod.phx3.secureserver.net
	(p3plsmtpa08-02.prod.phx3.secureserver.net [173.201.193.103])
	by mail.openembedded.org (Postfix) with ESMTP id E379E70BCA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 21:04:13 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-02.prod.phx3.secureserver.net with 
	id eM4C1o00W1mTNtu01M4D9r; Wed, 13 Aug 2014 14:04:14 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 16:03:40 -0500
Message-Id: <1407963825-20257-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [PATCH 0/5] recipes-devtools/gcc cleanup patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Aug 2014 21:04:20 -0000

Attached are a set of proposed patches to how gcc is built.  These fix
some minor consistency issues in formatting and content.  They are
preliminary to any attempt to fix the bug where the runtime builds are
not ABI compatible with the default mode used by the compiler for C++11
code, as described in the thread at:
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095659.html

Peter

Peter A. Bigot (5):
  gcc: recipe whitespace changes
  gcc-4.8,gcc-4.9: remove inappropriate patch
  gcc-4.9: Ensure c++ includes are in /usr/include/c++/${BINV}
  gcc: remove outdated configuration option
  gcc-target: make --enable-clocale consistent with gcc-runtime

 meta/recipes-devtools/gcc/gcc-4.8.inc              | 185 +++++++++++----------
 .../gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch         |  66 --------
 meta/recipes-devtools/gcc/gcc-4.9.inc              | 179 ++++++++++----------
 .../gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch         |  66 --------
 meta/recipes-devtools/gcc/gcc-configure-common.inc |  46 ++---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |  23 +--
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |  32 ++--
 meta/recipes-devtools/gcc/gcc-cross.inc            |  27 +--
 meta/recipes-devtools/gcc/gcc-runtime.inc          | 154 ++++++++---------
 meta/recipes-devtools/gcc/gcc-target.inc           | 108 ++++++------
 meta/recipes-devtools/gcc/libgcc.inc               |  35 ++--
 meta/recipes-devtools/gcc/libgfortran.inc          |  29 ++--
 12 files changed, 427 insertions(+), 523 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch

-- 
1.8.5.5


