Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrRI-0003gX-LD
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 10:35:52 +0100
Received: by eeav2 with SMTP id v2so882269eea.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=A3CSxKVMnRZaGQ8LpLSGePHi6XZTjtj2mlfEF+1sTRk=;
	b=Qmhyy7c0cCe+IrznzaAqVSz82J9MmW15QHj9yWY6xh+9XnEqcL9SzaN6AxAQznFlKH
	dLqkCzhrFT9Lihq+x66AJm1W8UqSXiW5K1l9Ed4HOXLUx/GozqymFhAyzk/YHV3+0NXJ
	yopnUfRK50M99bIMpIoNahvCo+bZFLHKHOA0Y=
Received: by 10.14.14.80 with SMTP id c56mr2119462eec.197.1323163745715;
	Tue, 06 Dec 2011 01:29:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 65sm44793319eeg.8.2011.12.06.01.29.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:29:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:28:56 +0100
Message-Id: <1323163736-18065-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCH] bitbake.conf: change APACHE_MIRROR to use archive site
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
X-List-Received-Date: Tue, 06 Dec 2011 09:35:52 -0000

* there are newest as well as older releases, so the SRC_URIs are valid longer
* someone with fast line should try to redownload world to see if the
  structure is the same for all projects (checked for subversion)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4e2f924..68eecb7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -528,7 +528,7 @@ export palmqtdir = "${palmtopdir}"
 ##################################################################
 
 ADOBE_MIRROR = "http://fpdownload.macromedia.com/get/flashplayer/current/"
-APACHE_MIRROR = "http://www.apache.org/dist"
+APACHE_MIRROR = "http://archive.apache.org/dist"
 DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
 E_MIRROR = "http://download.enlightenment.org/releases"
 E_SVN = "svn://svn.enlightenment.org/svn/e"
-- 
1.7.8



