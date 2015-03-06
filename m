Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 604A2738F9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 09:32:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t269Wdto000477
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2015 01:32:39 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Mar 2015 01:32:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 01:32:36 -0800
Message-ID: <20872591b3fade728dbbe3b655045417450b3021.1425634271.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425634271.git.liezhi.yang@windriver.com>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] net-tools: 1.60-25 -> 1.60-26
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
X-List-Received-Date: Fri, 06 Mar 2015 09:32:38 -0000
Content-Type: text/plain

The old net-tools_1.60-25.diff.gz is not available any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{net-tools_1.60-25.bb => net-tools_1.60-26.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/net-tools/{net-tools_1.60-25.bb => net-tools_1.60-26.bb} (95%)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
similarity index 95%
rename from meta/recipes-extended/net-tools/net-tools_1.60-25.bb
rename to meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 0e4ee75..a837dc7 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-25.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -18,8 +18,8 @@ S = "${WORKDIR}/net-tools-1.60"
 SRC_URI[tarball.md5sum] = "ecaf37acb5b5daff4bdda77785fd916d"
 SRC_URI[tarball.sha256sum] = "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc9aa3095d5c591f302c2de0f5"
 
-SRC_URI[patch.md5sum] = "5ab1e2184d0fa6518031291138f2fc51"
-SRC_URI[patch.sha256sum] = "1bddcd96ac60e794978cb20fb7ea4c2e77258c56c042c9ac8b6ec2b2033bc56f"
+SRC_URI[patch.md5sum] = "ea3592f49ac8380962bc4d9b66c7e7e9"
+SRC_URI[patch.sha256sum] = "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e46585022fc76c"
 
 inherit gettext
 
-- 
1.7.9.5


