Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDaJk-0003Kq-EM
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:20:48 +0200
Received: by weyr6 with SMTP id r6so3927268wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 05:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=b1c8iey7KP/wbr6IHsWoujDt20mUG/vJcQnWRnL1fdQ=;
	b=UborkBp4hEsxTFA/E9nflEzAgQZYjj7FMz+zAhB73J9hDDuS+EW3gAQthl5ytxK+LJ
	XndoWpq69ETLbaAASkBBfKCbl2EfujU+1Cyq+0dmYujmwf7BNRRp7ef1cQbuptdjnbSB
	ltye+a6qEbNZbOSlYfCY23/TFb85AxmgT9ljkiEoLS0NzY2ghRoDLNRjTAN0bb6LXt7h
	vWqT8ArC/Ur6IthgeHfh+bR6i4tntaQlbsQOGdnnevAA/PKlumxy0hvHlwwaeNGxakcs
	V3smzHsWXm3xkv2t1Jol1XZHysoLgKuKfYzwoP0qKReMwFhBoz998hqqNP0oVMiuJpuM
	LG2w==
Received: by 10.217.1.79 with SMTP id m57mr5781829wes.121.1347883689976;
	Mon, 17 Sep 2012 05:08:09 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k20sm17570403wiv.11.2012.09.17.05.08.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 05:08:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:07:36 +0200
Message-Id: <1347883657-17529-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk1QeG7Al7FKWL1EX9T6Bff7cdu2Gtg14UQF0V+4PYIFSu9AXT8MbzzXfUzPEe5oSF5aw7x
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][pulseaudio-updates 09/10] pulseaudio: fix pulseaudio-server RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 12:20:48 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* module-cork-music-on-phone was renamed to module-role-cork
  http://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=3c5cc345472302b9511c19244b3eceb4a3674d8c

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index de653fe..4a1d66c 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -139,5 +139,5 @@ RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-suspend-on-idle \
     pulseaudio-module-console-kit \
     pulseaudio-module-position-event-sounds \
-    pulseaudio-module-cork-music-on-phone "
+    pulseaudio-module-role-cork "
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 5359146..97bd4d3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.7.6



