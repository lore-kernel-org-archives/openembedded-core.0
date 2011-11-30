Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVpdd-0000yq-KG
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 20:16:13 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so1115144eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 11:09:35 -0800 (PST)
Received: by 10.213.35.68 with SMTP id o4mr65915ebd.30.1322680171271;
	Wed, 30 Nov 2011 11:09:31 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id c9sm7198864eeb.0.2011.11.30.11.09.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 11:09:30 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 20:09:21 +0100
Message-Id: <1322680162-24126-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322680162-24126-1-git-send-email-koen@dominion.thruhere.net>
References: <1322680162-24126-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/3] pulseaudio: bump PR for gdbm SOVERSION change
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
X-List-Received-Date: Wed, 30 Nov 2011 19:16:13 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

This applies on top of the earlier pulseaudio patch set

 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index 4c8b46f..f3a813e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.2.5



