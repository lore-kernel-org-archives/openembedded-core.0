Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UbkJR-0002IX-UJ
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 06:24:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4D46NJJ011101
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2013 21:06:23 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 12 May 2013 21:06:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 12 May 2013 21:06:14 -0700
Message-ID: <c8edba2ed1e10bfd80475321f3571aa30d12d1ac.1368417050.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1368417050.git.bruce.ashfield@windriver.com>
References: <cover.1368417050.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, otavio@ossystems.com.br,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] kern-tools: refresh and make dash compliant
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
X-List-Received-Date: Mon, 13 May 2013 04:25:04 -0000
X-List-Received-Date: Mon, 13 May 2013 04:25:04 -0000
X-List-Received-Date: Mon, 13 May 2013 04:25:04 -0000
Content-Type: text/plain

The separately packaged merge_config.sh in the kern-tools package was
missing upstream fixes, and in particular a change that ensures it is
dash compatible.

By grabbing that upstream commit and rebasing the existing patches on
top of the new baseline, we are up to date and working on systems
where /bin/sh is dash.

[YOCTO #4473]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 6620c4b..a86dda3 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "9713c9ef7f6e178a0a2a5f2a9c74e3c123ae48dd"
+SRCREV = "1a3c59526d6abe95662820b9493c8a62dab52d79"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.10.4



