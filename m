Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKvyZ-00028P-LJ
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:48:48 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6404872faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YqXiWzAFOnj2kzo58Vpvj8bSseFjHhYMLQYZXmfWHVE=;
	b=qFmT8LGrQ83DBTPgKp0+7mdQzEX9QEFwjmOu+mP/mJf+DNgqrAxLiHPQHJYPD1iGpl
	C7afZUUei2gorOGohPAWdnSBaD+5iibXRkpRzjjTCMGifQiMrlRV/k7+CkjlGj2WeL5H
	xYfYWccySLZpwJNDo/6MBBD2ZJ9OkKqOaEXJ8=
Received: by 10.223.92.135 with SMTP id r7mr31621965fam.35.1320082964657;
	Mon, 31 Oct 2011 10:42:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n25sm39160909fah.15.2011.10.31.10.42.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:42:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 18:41:50 +0100
Message-Id: <1e2bfd8a59cefe4357257ef14f027d08ff7b29dc.1320082621.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
References: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320082621.git.Martin.Jansa@gmail.com>
References: <cover.1320082621.git.Martin.Jansa@gmail.com>
Subject: [oe-core 7/7] bitbake.conf: update STAGING_PYDIR to 2.7 version
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
X-List-Received-Date: Mon, 31 Oct 2011 17:48:49 -0000

* is it still used somewhere?
  seems unused in oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e2c1b6f..e9dec10 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -345,7 +345,7 @@ STAGING_DATADIR = "${STAGING_DIR_HOST}${datadir}"
 STAGING_EXECPREFIXDIR = "${STAGING_DIR_HOST}${exec_prefix}"
 STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
 STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
-STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
+STAGING_PYDIR = "${STAGING_DIR}/lib/python2.7"
 
 STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}"
 STAGING_DIR_TCBOOTSTRAP = "${STAGING_DIR_TARGET}-tcbootstrap"
-- 
1.7.7.1



