Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 352AC774FD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 05:06:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2256XDE016839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Mar 2017 21:06:34 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 1 Mar 2017 21:06:33 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Mar 2017 00:06:30 -0500
Message-ID: <ce3bcc0175841c2ffeb80211d6f13f05812f83c7.1488431032.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1488431032.git.dengke.du@windriver.com>
References: <cover.1488431032.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] delete the extra varflag set for autotools_copy_aclocals
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
X-List-Received-Date: Thu, 02 Mar 2017 05:06:36 -0000
Content-Type: text/plain

The autotools_copy_aclocals has been droped, so the varflag set for that should
be removed.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/classes/autotools.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index da5ec27..d494734 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -143,7 +143,6 @@ python autotools_aclocals () {
     # Refresh variable with cache files
     d.setVar("CONFIG_SITE", siteinfo_get_files(d, aclocalcache=True))
 }
-autotools_copy_aclocals[vardepsexclude] += "MACHINE SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
 
 CONFIGURE_FILES = "${S}/configure.in ${S}/configure.ac ${S}/config.h.in ${S}/acinclude.m4 Makefile.am"
 
-- 
2.8.1


