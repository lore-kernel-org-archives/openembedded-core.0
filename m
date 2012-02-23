Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0WHc-0006HI-ML
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:52:20 +0100
Received: by eekd41 with SMTP id d41so459774eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:43:59 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.101.141 as permitted sender) client-ip=10.14.101.141; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.101.141 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.101.141])
	by 10.14.101.141 with SMTP id b13mr506944eeg.92.1329993839706 (num_hops
	= 1); Thu, 23 Feb 2012 02:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JbNf+Bd39cNl8uy8mZBd4xg7ewoFQcCDtJCxnLn+2kk=;
	b=hVxELz6Ou9Wa6bcd2mh53OHVujPi1+GqCfuFUKcjJBeblqGZlaVlhojCDqWABN0HX2
	Dd2w3u2bal/w/IOpl3p6DlxBlHTBx0/azRsWIYWovKGb1EXaZ8Bfxg8gXYbc+jjahila
	idtTAJaTCqzX+OmsIiWzrm98trZi1NOdrc9bI=
Received: by 10.14.101.141 with SMTP id b13mr399887eeg.92.1329993839627;
	Thu, 23 Feb 2012 02:43:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n56sm3978354eeh.6.2012.02.23.02.43.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 02:43:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:43:38 +0100
Message-Id: <9ea9d5b7ab46d2c4ea8c0b18d24a341b54248011.1329993620.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
References: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329993620.git.Martin.Jansa@gmail.com>
References: <cover.1329993620.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/7] bitbake.conf: use weak assignment for BB_CONSOLELOG
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
X-List-Received-Date: Thu, 23 Feb 2012 10:52:21 -0000

* some people prefer subdirectory like /cooker/.log

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 90e5f7a..869b409 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -723,7 +723,8 @@ DISTRO[unexport] = "1"
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
 
-BB_CONSOLELOG = "${TMPDIR}/cooker.log.${DATETIME}"
+# Complete output from bitbake, if you're changing it, make sure to use existing directory
+BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasic"
-- 
1.7.8.4



