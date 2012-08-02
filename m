Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwyUZ-0005eo-64
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:43:19 +0200
Received: by wgbdr1 with SMTP id dr1so7301161wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oZstj6OpoqSgafCybkck8PSY/NhvwI0V8A0zpbE2onM=;
	b=LLeHlpowfAfwsQfWIjIQ2a+EYp7Aw7bFSHi+duM8PAv5nQbfatRN/JyHpY0CAwG7Wp
	xAiAIMKgbYa2OJItCV6rEEeWLE+B4PsqLtMk4F0c06vWlbPW57IY3FkiayW8tZrQEfpm
	Re7OzE83avswEq9/dAHByRHt6EIAn+UJOTD90XHB3r/LVVYRycGNuJAkAfFQ8/1tScpa
	V1e9l8hfY2Sy4bMou7W5Yg09fqMscRSRBoTLqRDXgyojUzh1oxtPQUaqLwntxvzZbve6
	TWkd1seOMH1CqYepeDicyXl6Y7bqAJeqxyR9v1CybEBH8H+jfWE2ZR45fhM99ByyDE+b
	J4bA==
Received: by 10.180.81.165 with SMTP id b5mr6023598wiy.17.1343925099656;
	Thu, 02 Aug 2012 09:31:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm18355423wib.0.2012.08.02.09.31.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:31:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 18:31:36 +0200
Message-Id: <1343925096-22020-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120802163001.GW16306@jama.jama.net>
References: <20120802163001.GW16306@jama.jama.net>
Subject: [RFCv2] bitbake.conf: store cooker logs in TMPDIR subdirectory
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
X-List-Received-Date: Thu, 02 Aug 2012 16:43:19 -0000

* we should probably wait until
  http://git.openembedded.org/bitbake/commit/?id=1e06d8012868ba5a31503dc99cbf18570be629d9
  is in next required bitbake version, but error message if the directory doesn't exist is quite clear
* people with new enough bitbake could just change this in their local.conf

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d5a43e9..8074684 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -753,8 +753,8 @@ DISTRO[unexport] = "1"
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 
-# Complete output from bitbake, if you're changing it, make sure to use existing directory
-BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
+# Complete output from bitbake
+BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
-- 
1.7.8.6



