Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL1Pl-0003sk-Q0
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 00:37:13 +0100
Received: by faas16 with SMTP id s16so6705943faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 16:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZkRmpPwz/gS3u34bVlfJoWEOP4qvQhnt+c8nFVXz8yw=;
	b=vqv0pKkp1OSbS7VlsFyTPTsqunUJkrK1e0674fkx++3I0ZmEZswU2+Q42vqxCCfyHM
	0AF6JQ/p1LZWpX1WXfClMta2UpG3+7D5ATrdbBY6wgeQgQKwHmiDTmQHc2pCQPaUinMk
	24X+rHWlOOP3Rh+rq02fmQBeldLTcDfYGW4fw=
Received: by 10.223.39.20 with SMTP id d20mr32306637fae.37.1320103868486;
	Mon, 31 Oct 2011 16:31:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm40924149fad.7.2011.10.31.16.31.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 16:31:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 00:31:00 +0100
Message-Id: <1320103860-20847-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
Subject: [PATCH] bitbake.conf: drop STAGING_PYDIR
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
X-List-Received-Date: Mon, 31 Oct 2011 23:37:13 -0000

* seems unused in oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e2c1b6f..d0235ba 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -345,7 +345,6 @@ STAGING_DATADIR = "${STAGING_DIR_HOST}${datadir}"
 STAGING_EXECPREFIXDIR = "${STAGING_DIR_HOST}${exec_prefix}"
 STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
 STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
-STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
 
 STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}"
 STAGING_DIR_TCBOOTSTRAP = "${STAGING_DIR_TARGET}-tcbootstrap"
-- 
1.7.7.1



