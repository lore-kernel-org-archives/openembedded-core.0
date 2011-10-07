Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDzQ-00064l-RY
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:13:40 +0200
Received: by bke11 with SMTP id 11so5228139bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5kuAK5f/cf16ToV+GoXPvDMCzmq/xxyUNZWscrdhBZM=;
	b=ILG4NBacjdScaBxNHj5eFCcla8vheMSGXChlsU6A2hBNGKb7lOpwKU9R4UTGNAqEJV
	4LRAj+4u3oodAiK/l/Y41CZFlt5xgRUbPPR6j4vVu0tu8uXVcdS3iizi7EdrrOq/XU/P
	b24Op2zqgCxLAYIIhyb3Tu6TB4ZrhKn0K7VJE=
Received: by 10.204.7.195 with SMTP id e3mr1559975bke.103.1318007283896;
	Fri, 07 Oct 2011 10:08:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x4sm1837368fad.1.2011.10.07.10.08.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:08:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:07:55 +0200
Message-Id: <1318007275-30266-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] python-argparse: import from meta-oe, needed for newer glib
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
X-List-Received-Date: Fri, 07 Oct 2011 17:13:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-argparse_1.2.1.bb                |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-argparse_1.2.1.bb

diff --git a/meta/recipes-devtools/python/python-argparse_1.2.1.bb b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
new file mode 100644
index 0000000..a74c533
--- /dev/null
+++ b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Python command-line parsing library"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=09d08bb5b7047e2688ea3faad6408aa8"
+SRCNAME = argparse
+
+SRC_URI = "http://argparse.googlecode.com/files/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "2fbef8cb61e506c706957ab6e135840c"
+SRC_URI[sha256sum] = "ddaf4b0a618335a32b6664d4ae038a1de8fbada3b25033f9021510ed2b3941a4"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+BBCLASSEXTEND = "native"
-- 
1.7.7



