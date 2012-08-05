Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3ML-00084s-6X
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:17 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1751997wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=h7H0aUlycurSXLFE7OC2BMyvO/5xWEcjIT0+kRmegN4=;
	b=pslNQkg36f9AR2bSQ8xMVPaPzB4L1YnLzG7GNO8oCd7cURUUQ7m+1jJffJOwOY9EiX
	AWRGK8cJFrV8o1NflQo9SRMCNCBp8k2cVEqCh6BPaZZ9iYxb290IZiEglCzCwXDOlatJ
	w0rQ4S5Oa8R0oAS0+44ES/3s3kX1qOaKoUJIimiv2bWngN1d9B+X5Hc5poDAtUqVowrb
	FXY75JmC/sZimk4WsmNi/AfzqKceFuaRoc/YXWds5PkAAgvzgaefgW0EUD1IwZD1IBme
	1/1CJYUHuvI2DIeUDue6UQKzi0d0mv5XUeBsi/uPoPSbY0vexg5g6vutnbuweKOigT9v
	TPoQ==
Received: by 10.217.1.195 with SMTP id n45mr3696881wes.179.1344182135986;
	Sun, 05 Aug 2012 08:55:35 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:35 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:16 +0200
Message-Id: <1344182057-15981-30-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlB/tchVvuI7QmEQmEnmj4KFlPPoLKsJcm+L2hjI43SGpRTkEZHHv/FWPXZjxRDVvpa20Vz
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 29/30] chkconfig: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:19 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 17987a6..ae55e36 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -24,6 +24,6 @@ inherit autotools gettext
 EXTRA_OEMAKE += 'MANDIR="${mandir}" BINDIR="${base_sbindir}" SBINDIR="${sbindir}"'
 
 do_install_append() {
-    mkdir -p ${D}/etc/chkconfig.d
+    mkdir -p ${D}${sysconfdir}/chkconfig.d
     rm -f ${D}${sbindir}/update-alternatives
 }
-- 
1.7.7.6



