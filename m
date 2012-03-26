Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCDsi-0003OQ-T9
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 19:39:00 +0200
Received: by wera1 with SMTP id a1so4341651wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Gf2tMJk0ljFk0l69nU5ByDEUwogB9aJosyGz2Amb+S8=;
	b=vIbaekUzTDuzPoX31BaDJXM5KKcVdfQsHZb/wENUE34B2xuLNlhqQ9IL3Rg7Oj/M5F
	RHfJiCEs2/7dLSIxoPa4AUEOA60mnsQi3Hzs07nNSiAGAxwXgybWz/pkmNQNmJmpgGoK
	VxmaIKdbYq/Rwea+1XDpOPvhT7Aw0a7A4iw9KluBfMDakGnkO7/E79hV23kQoohIXOec
	/xOX+fbpjBXVLEtYIKvHMFBR/42FcO864KAfoNnFf+0yuxG2esj+LaLoE2VP9zib3VP5
	BsjH/twJhhMIIMc99DBiA/bRo6CXEYfeps9YazqKwbtRZQ6XTnp4TvOE/CZIJiATfaFa
	aqYg==
Received: by 10.180.19.196 with SMTP id h4mr20563503wie.12.1332783000732;
	Mon, 26 Mar 2012 10:30:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k7sm69531920wia.5.2012.03.26.10.29.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 10:30:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 19:29:48 +0200
Message-Id: <1332782988-18008-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <4F70988B.4010403@windriver.com>
References: <4F70988B.4010403@windriver.com>
Subject: [PATCH] kernel.bbclass: touch .scmversion also in ${S}
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
X-List-Received-Date: Mon, 26 Mar 2012 17:39:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6633b85..3519e7c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -207,7 +207,7 @@ kernel_do_configure() {
 	# $ scripts/setlocalversion . => +
 	# $ make kernelversion => 2.6.37
 	# $ make kernelrelease => 2.6.37+
-	touch ${B}/.scmversion
+	touch ${B}/.scmversion ${S}/.scmversion
 
 	# Copy defconfig to .config if .config does not exist. This allows
 	# recipes to manage the .config themselves in do_configure_prepend().
-- 
1.7.8.5



