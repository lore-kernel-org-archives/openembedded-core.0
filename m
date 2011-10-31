Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKvyS-00026x-Ln
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:48:40 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6404690faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xdmglzVi0DktKU+2zuZBNjWDV9vyhorm/g9sfeR1XOk=;
	b=lAlILSVmS6QudTETLRW/etTwIGiGOqJBfHcgJga+GYaRWgX7xTe48bdt3DxbFt+J9I
	ztVrD9nYvDhQTpPPwgp8Ix60mVOvR5LMDV4cVXB3CMp9OUrOFeKdA/Q0bm6jMlkY61WI
	uQPCySTJ/QJfMHJ6MEGhrH4ldtZk3eGyb+HYo=
Received: by 10.223.91.143 with SMTP id n15mr30699166fam.23.1320082957704;
	Mon, 31 Oct 2011 10:42:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d22sm23306023fad.19.2011.10.31.10.42.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:42:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 18:41:49 +0100
Message-Id: <4bde680a97e954bb53df63090dcc2a0a9d488292.1320082621.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
References: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320082621.git.Martin.Jansa@gmail.com>
References: <cover.1320082621.git.Martin.Jansa@gmail.com>
Subject: [oe-core 6/7] python-dir: change PYTHON_BASEVERSION to 2.7
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
X-List-Received-Date: Mon, 31 Oct 2011 17:48:40 -0000

* it's also defined here conf/distro/include/default-versions.inc, so maybe it could be dropped
* and similar variable is
  recipes-devtools/python/python.inc:PYTHON_MAJMIN = "2.7"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/python-dir.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bbclass
index 1ceb929..0b6a33c 100644
--- a/meta/classes/python-dir.bbclass
+++ b/meta/classes/python-dir.bbclass
@@ -1,3 +1,3 @@
-PYTHON_BASEVERSION ?= "2.6"
+PYTHON_BASEVERSION ?= "2.7"
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
-- 
1.7.7.1



