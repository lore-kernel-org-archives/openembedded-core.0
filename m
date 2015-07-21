Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2856013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 17:39:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6LHdBDY011948
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 10:39:11 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 21 Jul 2015 10:39:04 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jul 2015 10:39:10 -0700
Message-ID: <1437500350-549-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] common-glibc: define bash_cv_getcwd_malloc
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
X-List-Received-Date: Tue, 21 Jul 2015 17:39:13 -0000
Content-Type: text/plain

We do not want bash to use internal code for getcwd() because
it can fail in certain filesystem types.  Trust that the function
in glibc is not "broken".

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/site/common-glibc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 8329bb3..1443f8e 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -18,6 +18,7 @@ ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 # bash
 bash_cv_under_sys_siglist=${bash_cv_under_sys_siglist=yes}
 bash_cv_sys_siglist=${bash_cv_sys_siglist=yes}
+bash_cv_getcwd_malloc=${bash_cv_getcwd_malloc=yes}
 
 # clamav
 clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
-- 
1.7.9.5


