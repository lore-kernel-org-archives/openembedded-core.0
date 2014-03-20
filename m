Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AFF856F8FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:05:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2014 12:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,696,1389772800"; d="scan'208";a="476613496"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2014 12:05:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 19:04:55 +0000
Message-Id: <d94f606f8a3b6bb4d7150c5bd9efe19131f5883e.1395342113.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395342113.git.paul.eggleton@linux.intel.com>
References: <cover.1395342113.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395342113.git.paul.eggleton@linux.intel.com>
References: <cover.1395342113.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 1/1] packagegroup-self-hosted: Add missing python code
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
X-List-Received-Date: Thu, 20 Mar 2014 19:05:07 -0000

From: Saul Wold <sgw@linux.intel.com>

These are in the Toolchain list, so they should also be installed on the build appliance

[YOCTO #5061]

Fixes [YOCTO #5941].

(Partial backport of OE-Core master rev: 82374feece5c576f9950bad6861b1e00c6b30d84)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index ed73617..6a1d698 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -130,6 +130,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     minicom \
     mtools \
     ncurses \
+    ncurses-terminfo-base \
     neon \
     nfs-utils \
     nfs-utils-client \
@@ -150,17 +151,21 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     python-core \
     python-curses \
     python-datetime \
+    python-difflib \
     python-distutils \
     python-elementtree \
     python-email \
     python-fcntl \
+    python-json \
     python-logging \
     python-misc \
+    python-mmap \
     python-multiprocessing \
     python-netclient \
     python-netserver \
     python-pickle \
     python-pkgutil \
+    python-pprint \
     python-re \
     python-rpm \
     python-shell \
-- 
1.8.5.3


