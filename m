Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8E9073179
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:48:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1J8mtJm027412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 00:48:56 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Feb 2016 00:48:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2016 00:48:37 -0800
Message-ID: <0af737b12c7d67ac5149612650bc1dabf2c2598c.1455871674.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1455871674.git.liezhi.yang@windriver.com>
References: <cover.1455871674.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] staging.bbclass: remove trail slash from SYSROOT_DESTDIR
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
X-List-Received-Date: Fri, 19 Feb 2016 08:48:56 -0000
Content-Type: text/plain

Fixed path:
QA Issue: <foo> sysroot-destdir//usr/lib/ <foo>

Note the 2 slashes "//".

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/staging.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 243bcdf..bc5dfa8 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -161,7 +161,7 @@ do_populate_sysroot[umask] = "022"
 addtask populate_sysroot after do_install
 
 SYSROOT_PREPROCESS_FUNCS ?= ""
-SYSROOT_DESTDIR = "${WORKDIR}/sysroot-destdir/"
+SYSROOT_DESTDIR = "${WORKDIR}/sysroot-destdir"
 SYSROOT_LOCK = "${STAGING_DIR}/staging.lock"
 
 # We clean out any existing sstate from the sysroot if we rerun configure
-- 
1.7.9.5


