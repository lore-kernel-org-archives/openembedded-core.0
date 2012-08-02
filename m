Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwyNv-0005S8-Aq
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:36:27 +0200
Received: by wgbdr1 with SMTP id dr1so7294443wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4g4c2qKogTbJXkziUhy6DA3Nos+yIgJ56QmeMPyMZEo=;
	b=wAqx40+xUq6JbSCiwZIb8kX0cOzHf7avdZvqtckp586qPdKqD3tDLjujL9spVv7obJ
	kcn80v41scg/1J/c15/J3NJXdZ+BO2QIXcqNCBOQcG81e55Xm84vnNecKvwgw+4Wkyyg
	XbBLmo8mDCNaZGp8CLZsIpGaiEg3AknTJzIe4qEalsRqSul0fsJgMbVG2nyOZRFvuFwh
	vX84qa9MVv7/zv6G6CCyjk+nfBEw7BQiUxGPAbZQ/sslACP2VfuYFnyik2MWfabm7tRR
	2R6p++OBcZuLY72ZSvw8Kz3IlDgy1QR8oQRxc5UzkZPsHXLavHr8tZadtJhUxshNOOki
	ykRw==
Received: by 10.216.240.8 with SMTP id d8mr11403994wer.157.1343924687656;
	Thu, 02 Aug 2012 09:24:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm18310748wib.2.2012.08.02.09.24.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:24:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 18:24:43 +0200
Message-Id: <1343924683-21970-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [RFC] bitbake.conf: store cooker logs in TMPDIR subdirectory
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
X-List-Received-Date: Thu, 02 Aug 2012 16:36:27 -0000

* we should probably wait until
  http://git.openembedded.org/bitbake/commit/?id=1e06d8012868ba5a31503dc99cbf18570be629d9
  is in next required bitbake version, but error message if the directory doesn't exist is quite clear
* people with new enough bitbake could just change this in their local.conf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d5a43e9..ff1cbd6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -754,7 +754,7 @@ DISTRO[unexport] = "1"
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 
 # Complete output from bitbake, if you're changing it, make sure to use existing directory
-BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
+BB_CONSOLELOG ?= "${TMPDIR}/cooker/${MACHINE}/${DATETIME}"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
-- 
1.7.8.6



