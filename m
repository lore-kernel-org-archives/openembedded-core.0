Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy70r-0004kU-4O
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:21 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1834570wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=sam3134YE6ZXQEhoR4sh20/+uWBg1swhA8itowvXRNQ=;
	b=dfdpzYQn4m3ia89OmdbuxwdwhGBx4ImJtGEhPGyyy0qP1RHPh9Wq1WHrSQgF3SA7Wy
	rUYisHNVwlu47aK+pm0ZapOORSv9p+49GlFa9iuiBm23WExY9QGyq6CZ0ZxK5h6QIfRa
	I19jD++k9k3D7WCag0ZXjQKXmZU0zf0fCdTr8egUBbXFxsw+FH21t7E9qCxsGUj8DMT3
	AQlBrMpC1JLtIvYHRbT2234ueAwGhFREuRmvcwTPS4NiO3t3Jg4Env9AoIu3tPZTUVCz
	XsNcXr8Ubkh+lMpHGUo4BC3kwO3sGK32yps00F1pYVK50aoh/0Two8nHdkZnnI0tHLSJ
	qgbg==
Received: by 10.180.79.229 with SMTP id m5mr12366938wix.13.1344196179459;
	Sun, 05 Aug 2012 12:49:39 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:38 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:32 +0200
Message-Id: <1344196136-7643-5-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlZyfkelTKSmuG1ZhJcAwf6bS7OqkPDhIXhY6JsbpEa08B5YS84F7zGUs5BWWj32Ns4BwU3
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 04/28] sudo: use ${bindir} and ${sysconfdir} instead of /usr/bin and /etc
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:21 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/sudo/sudo_1.8.5p2.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.5p2.bb b/meta/recipes-extended/sudo/sudo_1.8.5p2.bb
index dfba7e0..4e4a443 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.5p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.5p2.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
@@ -24,6 +24,6 @@ do_install_append () {
 		fi
 	done
 
-	chmod 4111 ${D}/usr/bin/sudo
-	chmod 0440 ${D}/etc/sudoers
+	chmod 4111 ${D}${bindir}/sudo
+	chmod 0440 ${D}${sysconfdir}/sudoers
 }
-- 
1.7.7.6



