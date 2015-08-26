Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8B77734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 05:55:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7Q5tcsu008581
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 22:55:38 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 25 Aug 2015 22:55:37 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Aug 2015 13:51:18 +0800
Message-ID: <1440568278-25662-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] autotools.bbclass: Allow dependency tracking option to be overridden
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
X-List-Received-Date: Wed, 26 Aug 2015 05:55:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

CONFIGUREOPT_DEPTRACK can not be overridden since it is set by =

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 6f51429..9ccd7d2 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -75,7 +75,7 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --disable-silent-rules \
 		  ${CONFIGUREOPT_DEPTRACK} \
 		  ${@append_libtool_sysroot(d)}"
-CONFIGUREOPT_DEPTRACK = "--disable-dependency-tracking"
+CONFIGUREOPT_DEPTRACK ?= "--disable-dependency-tracking"
 
 
 oe_runconf () {
-- 
1.9.1


