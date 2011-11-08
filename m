Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNmfQ-0006RZ-6z
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 15:28:48 +0100
Received: by eyd9 with SMTP id 9so367214eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 06:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/eBzWjK+CNKzPSssIj27KpKJV1fBwuRXa6HSfcDoomY=;
	b=n78YJ2gZH6uOEAOebT/leeNJEOHicw2Q+lUizDvr9sR5DTwMVVsCleIFEG7mJm33Qi
	6rJPQHLwe1jZznZf03UG+3gHcmKjfY5zx6fMw6sNeij33I0Q1eeRvayUiGUKqWloIp3A
	K+WUR1qztdQ8isO6BgxbSrDzcGrQNNSo/pUrY=
Received: by 10.213.17.137 with SMTP id s9mr2832058eba.59.1320762153630;
	Tue, 08 Nov 2011 06:22:33 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f41sm4681438eec.5.2011.11.08.06.22.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 06:22:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 15:22:24 +0100
Message-Id: <1320762144-9237-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
Subject: [PATCH] libxml2: use Copyright in LIC_FILES_CHKSUM instead of COPYING
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
X-List-Received-Date: Tue, 08 Nov 2011 14:28:48 -0000

* COPYING is replaced by symlink to Copyright during do_configure
  (see configure.in), then we end with link to nonexistent file
* same issue as libxslt had http://patchwork.openembedded.org/patch/14195/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/libxml/libxml2.inc      |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 6f79333..68c088c 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.xmlsoft.org/"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bb90c48926316d9af6e2d70ca7013ade \
+LIC_FILES_CHKSUM = "file://Copyright;md5=bb90c48926316d9af6e2d70ca7013ade \
                     file://hash.c;beginline=6;endline=15;md5=ce702952bfddd7aee22639a2d6b54136 \
                     file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
                     file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 71001a0..2fa246e 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,6 +1,6 @@
 require libxml2.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
 SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
-- 
1.7.8.rc1



