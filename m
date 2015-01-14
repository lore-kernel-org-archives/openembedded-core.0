Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2EE7728D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lfeC022111
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:41 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:21 -0800
Message-ID: <114cd5d423b3fc6ffc399ef60f25a7cb4f57ac9c.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/27] bash: separate B and S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:48 -0000
Content-Type: text/plain

It works well now, and bump the PR to avoid:
x86_64-poky-linux-ar: shmatch.o: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/bash/bash.inc    |    2 +-
 meta/recipes-extended/bash/bash_4.3.bb |    2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index a00db5c..0fd5af9 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -4,7 +4,7 @@ SECTION = "base/shell"
 
 DEPENDS = "ncurses bison-native"
 
-inherit autotools-brokensep gettext texinfo update-alternatives ptest
+inherit autotools gettext texinfo update-alternatives ptest
 
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index 54f2101..23d3197 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -1,5 +1,7 @@
 require bash.inc
 
+PR = "r1"
+
 # GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-- 
1.7.9.5


