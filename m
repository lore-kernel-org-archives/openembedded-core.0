Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 9E76677106
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 3EE77608F9D
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:23 +0100
Message-Id: <ae8dcdc3c8e090fe392de86dc59135a38f06e9ca.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 02/52] build-compare: drop PATCHTOOL setting
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:19 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

We don't need PATCHTOOL to be set to git in this recipe, and setting it
that way requires that the running user has git user & email configured,
which on a build server it might well not be.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/build-compare/build-compare_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 7ac3784..676f11d 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git \
            file://Ignore-DWARF-sections.patch;striplevel=1 \
            file://0001-Add-support-for-deb-and-ipk-packaging.patch \
            "
-PATCHTOOL = "git"
 
 SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
 
-- 
2.1.4


