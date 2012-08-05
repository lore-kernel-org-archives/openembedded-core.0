Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Ln-0007eD-3p
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:43 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373227wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=M6uTkbkLGBQ/DysIJitfntS0aUDcnx/QFIoSIw0pFmE=;
	b=JuH/OAbmb8DII7V1zIAc/Q3DOI51YEeN71ToKrdebpUDOuo6eklQvm/OxhZI5i50DZ
	nT1qK4iOEEW81v4O/5pYrhk7yAW+2KtKFkmG4T8CAOx9LtrBeXRO9R63GGoyHaghgXbZ
	kwrxYD+s9igiUIfZ2NAnrr0P+LhTBDjS0g7Y6MV5qHrf9ahUvsdFiHGc7soiljDDgvKy
	vq2BqJBHuna3LYz9ANYQXgHsMTv6eWBjbB3nzua9g9OJCy7QHjHvDHcYUuDKMaQieG4B
	gUwd7yK4nXcLZFAMHr13gkiVp/EvYfzwQSooyEfGFmyiow34uGWvLwiylU2XOmGNTwPE
	MeXw==
Received: by 10.180.76.36 with SMTP id h4mr11473309wiw.13.1344182101860;
	Sun, 05 Aug 2012 08:55:01 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:01 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:57 +0200
Message-Id: <1344182057-15981-11-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQkNbGY2qhMMz+HEVOZoOyzV75ZJaNKxJ1jJeIo7RK9rPnxoaRRLLxZbs36SZ9TfRwbsUlUn
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/30] systemtap: use ${datadir} instead of /usr/share for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:44 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../systemtap/systemtap-uprobes_git.bb             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index b328e6b..8544841 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -36,7 +36,7 @@ do_compile() {
 do_install() {
 	if [ -e "${S}/runtime/uprobes/uprobes.ko" ]
 	then
-		install -d ${D}/usr/share/systemtap/runtime/uprobes/
-		install -m 0644 ${S}/runtime/uprobes/uprobes.ko ${D}/usr/share/systemtap/runtime/uprobes/
+		install -d ${D}${datadir}/systemtap/runtime/uprobes/
+		install -m 0644 ${S}/runtime/uprobes/uprobes.ko ${D}${datadir}/systemtap/runtime/uprobes/
 	fi
 }
-- 
1.7.7.6



