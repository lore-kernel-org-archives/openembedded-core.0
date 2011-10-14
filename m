Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1REitj-00075l-VH
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 16:38:08 +0200
Received: by vwe42 with SMTP id 42so89051vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=lO2qzR1nxDblNeduGds2vXzF7PJrmi31bUp5YwLhGsY=;
	b=xesSMB2q9qyUqExKduYszxeWMYmPD8KrCFCgRPYGjRC1TGVBoWMCfXxVDd9ZQkM0i+
	cS6rhAffa33Dlr59xEpMYAqUPQoCPwJF8b1cPcxS5wec7zvEVc8ATR2N2/BFlrZvExOI
	VzYuWSFY7aandN1PfwG2zgRQ0H8a7+GiWbhrk=
Received: by 10.52.35.69 with SMTP id f5mr8826386vdj.74.1318602726225;
	Fri, 14 Oct 2011 07:32:06 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-183-10.ronkva.east.verizon.net. [96.240.183.10])
	by mx.google.com with ESMTPS id c20sm7844410vdt.6.2011.10.14.07.32.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 07:32:05 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2011 10:31:38 -0400
Message-Id: <1318602698-13435-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 1/1] cmake : Disable building ccmake.
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
X-List-Received-Date: Fri, 14 Oct 2011 14:38:08 -0000

ccmake fails to build due to an as-needed type error with -ltinfo. Disable
it for now since the build fails and cmake is what we need for target
sdk.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-devtools/cmake/cmake_2.8.5.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
index 4fa9562..c0c5cad 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
@@ -30,6 +30,7 @@ EXTRA_OECMAKE=" \
     -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DKWSYS_CHAR_IS_SIGNED=1 \
+    -DBUILD_CursesDialog=0 \
     ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
 "
 
-- 
1.7.3.4



