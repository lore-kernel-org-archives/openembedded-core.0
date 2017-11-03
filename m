Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF367832A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:45:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA32jfpx024999
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 2 Nov 2017 19:45:41 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 2 Nov 2017 19:45:40 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 2 Nov 2017 22:45:31 -0400
Message-ID: <cbfb502306d681820e9851b60ae4227d8caa235d.1509676901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1509676901.git.bruce.ashfield@windriver.com>
References: <cover.1509676901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] kern-tools: make fuzzy matching optional
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
X-List-Received-Date: Fri, 03 Nov 2017 02:45:40 -0000
Content-Type: text/plain

It was reported that BSPs that only matched the machine were
being returned as the configuration entry point. This could lead
to warnings, or unexpected runtime results.

Integrating the following commit to ensure that only strict matches
are returned by default, with a flag to do fuzzy matching

    spp: make fuzzy matching optional

    Add a flag that can be used to toggle wether or not a partial
    match is an error.

      --fuzz

    When passed, partial patching will be used. If not passed the
    default is to return nothing (which can be interpreted as an
    error by the calling routines) if both the kernel type and
    machine do not match.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 4a78b897d34f..3a3992a29270 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "0571411cc033c11df7827508dd786876ce2f8c83"
+SRCREV = "b46b1c4f0973bf1eb09cf1191f5f4e69bcd0475d"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


