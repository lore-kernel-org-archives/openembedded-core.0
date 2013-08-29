Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1686BEFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:18 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so354239eaj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=49Flv/FtbB6cDsq8cHgb39e1qdRxZBEvLEPd5jjJ1Po=;
	b=vO5zwrPwD/mXcLz3ncnR/Hax+BP6SCUw8LuPQiAG1eGxusMOYcddJI/fDeYL3jtY4u
	c6gfsDQESmXxt9WhDEiCYZrVyLYy2sG0YZ2KCJtcln7PhcOzhMm9UoeQUoxkyqKOyJJx
	g+UXJunTK1kX3KNXfS/3OUoUVTjMl7uA5iNjdWljUNKpvJUWhXLoWJRP6P9FVXH6/1y5
	AXC7P62nWWiH8Utz2fx2f+2c7+f1yiy1CPL+9b/7YoSuECxjvEs1c3xFItGP7dTAeGQw
	pFflveBF/MPSSQUp5g+31CcWZ1ft/8vg9FLJMlyVcsnnh1Yqd2lv88gue+yAquQM7XtU
	s3gQ==
X-Received: by 10.14.178.66 with SMTP id e42mr4658838eem.67.1377792138701;
	Thu, 29 Aug 2013 09:02:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm47240825eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:03:05 +0200
Message-Id: <9546fb89b434a43ee317e5c26065ef4578778019.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 18/20] subversion: Add dependency on file for libmagic
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/subversion/subversion_1.7.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index f77656b..4acd70b 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "The Subversion (svn) client"
 SECTION = "console/network"
-DEPENDS = "apr-util neon sqlite3"
+DEPENDS = "apr-util neon sqlite3 file"
 RDEPENDS_${PN} = "neon"
 LICENSE = "Apache-2"
 HOMEPAGE = "http://subversion.tigris.org"
-- 
1.8.3.2


