Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 73E9377054
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 02:08:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5728b5B017801
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Jun 2018 19:08:37 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 6 Jun 2018 19:08:36 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 6 Jun 2018 22:07:27 -0400
Message-ID: <011d80e69797f381547088ebcc5a28a5089232d3.1528336755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1528336755.git.bruce.ashfield@windriver.com>
References: <cover.1528336755.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] kern-tools: avoid merge_config concatenation issues
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
X-List-Received-Date: Thu, 07 Jun 2018 02:08:36 -0000
Content-Type: text/plain

Integrating the following kern-tools commit:

    tools/merge_config.sh: add CR after each fragment

    If a fragment file doesn't contain a CR at the end, two config
    options may be merged on the same line in the result file, leading to
    misconfiguration.

    This patch adds a CR after each fragment to ensure that config
    options are well separated in the result file.

    Bug-AGL: SPEC-1475

    Signed-off-by: Stephane Desneux <stephane.desneux@iot.bzh>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Stephane Desneux <stephane.desneux@iot.bzh>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 8ccd8cee146f..4ccf9b07f306 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "b46b1c4f0973bf1eb09cf1191f5f4e69bcd0475d"
+SRCREV = "8cd13500a27c0a6a911cc83c0349dec01ef66e27"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


