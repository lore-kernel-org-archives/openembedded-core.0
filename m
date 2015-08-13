Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E26C76312
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 07:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7D7bMgd022142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 00:37:22 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 13 Aug 2015 00:37:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Aug 2015 00:37:19 -0700
Message-ID: <67e4fb4b7a8dc0c7e955e5ea5e4fc2048961f61b.1439449078.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1439449078.git.liezhi.yang@windriver.com>
References: <cover.1439449078.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] toolchain-shar-extract.sh: add a space in the end
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
X-List-Received-Date: Thu, 13 Aug 2015 07:37:22 -0000
Content-Type: text/plain

For a clear look when input.

[YOCTO #8089]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/files/toolchain-shar-extract.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 0a33ee8..3a50991 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -92,11 +92,11 @@ fi
 
 if [ -e "$target_sdk_dir/environment-setup-@REAL_MULTIMACH_TARGET_SYS@" ]; then
 	echo "The directory \"$target_sdk_dir\" already contains a SDK for this architecture."
-	printf "If you continue, existing files will be overwritten! Proceed[y/N]?"
+	printf "If you continue, existing files will be overwritten! Proceed[y/N]? "
 
 	default_answer="n"
 else
-	printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
+	printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]? "
 
 	default_answer="y"
 fi
-- 
1.7.9.5


