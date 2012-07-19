Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1Sruz7-0004Do-05
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 19:57:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6JHkXE1010926
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 10:46:33 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 19 Jul 2012 10:46:34 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 13:46:21 -0400
Message-ID: <1342719981-1324-17-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
References: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 16/16] trace-cmd: Update for python-native changes
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
X-List-Received-Date: Thu, 19 Jul 2012 17:58:01 -0000
Content-Type: text/plain

Add pythonnative to the inherits list
---
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index 7f6f6cf..214d0f0 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-input.c;beginline=5;endine=8;md5=c9c405aaf5cfc09582ec83cf6e83a020"
 
 SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
-PR = "r2"
+PR = "r3"
 PV = "1.2+git${SRCPV}"
 
-inherit pkgconfig
+inherit pkgconfig pythonnative
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
            file://addldflags.patch \
-- 
1.7.0.4



