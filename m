Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71e-0005Ex-PQ
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:02:10 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so974714wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=LLg8WWhS5gote99rIvdW6Ml23EbDJhVtjwLZAL+K5yw=;
	b=Z1bE4LmwfA3KwQJaqZeSGZekMjvHE0PwYPZa6+2a157Xr6YtAeF/hAlbUivkzBTKZ2
	ahBLmlVQgUqOGRiQ6+rt942tb8W1ub7r893nlzBWI+0rD9xmwIvJYoOUfhYFm/WiU8Pb
	NeoYzSJ+SkZb4O8UbBdo5NLneuvsV7yGKppxx3yv5FtziFuSw3foqxE/tEmoIRBOeQQm
	Fx6cqe1HifOPV0qBlKAUa/yJ2cUySWPGKPpNfp6Pm4KApdLFQ9bxZNHuHuPMwdkjL9j5
	Ao7bQbBVqyM4YkFZHEWYJ/lfdcNhpY3reEtDm2Z7u19lK7Tt5h7BOsk/gQqLlWd0sZBn
	vFdA==
Received: by 10.216.138.13 with SMTP id z13mr4214306wei.65.1344196228986;
	Sun, 05 Aug 2012 12:50:28 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:28 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:51 +0200
Message-Id: <1344196136-7643-24-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlVpJr89MAvWUeT37d1rulK66buSkTl1aQQotlpOYAAFfwN98+tBjj/EkVZuDMY2HmxwTwb
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 23/28] lsbinitscripts: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:02:11 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
index 8071916..eac4ebb 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SysV init scripts which only is used in an LSB image"
 SECTION = "base"
 LICENSE = "GPLv2"
 DEPENDS = "popt glib-2.0"
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
@@ -22,6 +22,6 @@ ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
 do_configure[noexec] = "1" 
 
 do_install(){
-	install -d ${D}/etc/init.d/
-	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0755 ${S}/rc.d/init.d/functions ${D}${sysconfdir}/init.d/functions
 }
-- 
1.7.7.6



