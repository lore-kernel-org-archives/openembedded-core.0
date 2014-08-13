Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A28160196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 15:07:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7DF7ac5025882
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 08:07:36 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 13 Aug 2014 08:07:35 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Aug 2014 10:07:34 -0500
Message-ID: <1407942454-1624-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] tcmode-default.inc: Add eglibc-scripts and eglibc-mtrace
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
X-List-Received-Date: Wed, 13 Aug 2014 15:07:37 -0000
Content-Type: text/plain

Add the specific scripts and mtrace versions to the preferred version list.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index f84fd98..41a0147 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -49,6 +49,8 @@ PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-locale            ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-mtrace            ?= "${EGLIBCVERSION}"
+PREFERRED_VERSION_eglibc-scripts           ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-eglibc         ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-initial           ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${EGLIBCVERSION}"
-- 
1.9.3


