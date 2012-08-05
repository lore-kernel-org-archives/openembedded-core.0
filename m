Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SxyBo-0001zV-8S
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 12:36:04 +0200
Received: by weyr6 with SMTP id r6so1270929wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 03:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JHpHDhBvZESIahCC5GH2GRzPRQdE1rZRy4SeMRDtk1U=;
	b=Zpt78fMBypFf3+bMGLROF139vpuA4UrW593jZXoGNHhtKykhCwoAHBVbl44ftkc6lY
	rKxX0duE9zjO4ev9CQ59dsIgUgpURraALOwMb7YyA9J4HFPBvvvAElQ65OvCXx02c5Yl
	3PdAUBc0KM6AEVv3g8H/e2w9zv1u7V91XV0Y7wFyL4tl/8tkMKPQEr8U/BLlHM4nzdk9
	V5KpR5/sLMrjUJg2138OOBoiOcoLyRCmUUV+CD6vC2sEQU1awj+FsAMV6oLVCYJjcGJF
	P4oBD4HZaKmZ7eUa9iD4Qaxzb1lvlQoLQ1BLZhi1rI58q3n00jxMy/aX5KiVIGlHQJa6
	7kgA==
Received: by 10.216.30.83 with SMTP id j61mr3828953wea.168.1344162261265;
	Sun, 05 Aug 2012 03:24:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm8693762wib.5.2012.08.05.03.24.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 03:24:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2012 12:24:12 +0200
Message-Id: <1344162252-22403-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120723113712.GE3271@jama.jama.net>
References: <20120723113712.GE3271@jama.jama.net>
Subject: [PATCH] opkg-utils: inherit pythonnative
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
X-List-Received-Date: Sun, 05 Aug 2012 10:36:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 92e6624..caa66f7 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -8,7 +8,9 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "49cc783d8e0415059d126ae22c892988717ffda7"
 PV = "0.1.8+git${SRCPV}"
-PR = "r0"
+PR = "r1"
+
+inherit pythonnative
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
            "
-- 
1.7.8.6



