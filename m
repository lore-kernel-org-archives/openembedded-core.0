Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RCHf6-0003JK-Q8
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 23:08:56 +0200
Received: by ggnq1 with SMTP id q1so3214984ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=McbZGTmeuOh+RPTroDsrpnymxEjmS6pkBj43/8jfPu0=;
	b=t7zRyKCQbOiJc7xS0KGwolBwCPzCKjr7aRgf3WCp8s+++wNNAxF/O4yo3FC1j2t0k3
	eni5DGTheBfW8MW3JWQjrbShV3PJ8rtxsecbadcZmdEyAE9wFnHwplyO8q+B6AqpU+/w
	E5DG0hQ6qG8iW05IXUxSTUm6XVTxC2YUiOE24=
Received: by 10.236.190.130 with SMTP id e2mr12587872yhn.107.1318021398669;
	Fri, 07 Oct 2011 14:03:18 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-167-38.ph.ph.cox.net.
	[24.251.167.38])
	by mx.google.com with ESMTPS id x65sm14662621yhg.18.2011.10.07.14.03.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 14:03:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 14:03:00 -0700
Message-Id: <06446e789cc2af1e24edb12c0a9778a40bf86889.1318021323.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1318021323.git.kergoth@gmail.com>
References: <cover.1318021323.git.kergoth@gmail.com>
In-Reply-To: <cover.1318021323.git.kergoth@gmail.com>
References: <cover.1318021323.git.kergoth@gmail.com>
Subject: [PATCH 2/3] autoconf: no need to hardcode the full path to m4
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
X-List-Received-Date: Fri, 07 Oct 2011 21:08:57 -0000

This way autom4te uses m4 as it finds it in the PATH, rather than
hardcoding any particular path.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index c6209a3..21b5fb3 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r2"
+PR = "r3"
 
 PARALLEL_MAKE = ""
 
@@ -27,4 +27,6 @@ RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
 
 SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
 
+EXTRA_OECONF += "ac_cv_path_M4=m4"
+
 BBCLASSEXTEND = "native"
-- 
1.7.4.1



