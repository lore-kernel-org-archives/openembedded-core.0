Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6kmq-0002Bm-8O
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 18:06:36 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 08:54:20 -0700
Received: by weyr6 with SMTP id r6so410981wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 08:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=kzcWltTURiuuys93X8W0ZLSwCHLknLL4OlfUViFdsZo=;
	b=Qx5KzDXfm/QCqkmyHvM5uNRdiO59vDjbKvBWwxRQM1w06a0aDngay4kwVQYW7m7946
	D9RZddyThcJTIK2lt+n5oYxgkVtr+v6d/22fHsl+9KbEUj9JJ4d3uMj+JZVYV1MLvF7f
	6R5j1T+u4LsdNlwpsIbYvQ3KDA46dAaL3uKhAbfyCqSWB7zZ7D8nzE+Il9L7iM+g+Ic2
	+zBWxkcD0ygwkznAZLSvSRy8er6JhMLKjokSwjMTloMJXuxT3HK6BF/6rSYyaLyjCwn3
	21Tqyw8j/wAyKEsh3Z948YjDTcie6+icvOklc6MHcqm8sOvv/OLfcwbRNV1zn6XuLzl7
	ekKg==
Received: by 10.217.1.7 with SMTP id m7mr1184668wes.158.1346255658601;
	Wed, 29 Aug 2012 08:54:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id do5sm4617880wib.10.2012.08.29.08.54.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 08:54:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 16:53:33 +0100
Message-Id: <1346255613-13401-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlLLBCiXkf7fmso8Ev9zMLPzHXxRNVAInso83np3amGTpBinJhEn6BFrfgNEsUt5m1th2Ln
Subject: [PATCH 2/2] task-core-x11: default to xserver-xorg instead of kdrive
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
X-List-Received-Date: Wed, 29 Aug 2012 16:06:36 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/tasks/task-core-x11-mini.bb |    2 +-
 meta/recipes-sato/tasks/task-core-x11.bb      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/tasks/task-core-x11-mini.bb b/meta/recipes-sato/tasks/task-core-x11-mini.bb
index 98189fe..ad736b9 100644
--- a/meta/recipes-sato/tasks/task-core-x11-mini.bb
+++ b/meta/recipes-sato/tasks/task-core-x11-mini.bb
@@ -16,7 +16,7 @@ PACKAGES = "\
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-XSERVER ?= "xserver-kdrive-fbdev"
+XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 
 ALLOW_EMPTY = "1"
 
diff --git a/meta/recipes-sato/tasks/task-core-x11.bb b/meta/recipes-sato/tasks/task-core-x11.bb
index f1b06f9..00e3c0c 100644
--- a/meta/recipes-sato/tasks/task-core-x11.bb
+++ b/meta/recipes-sato/tasks/task-core-x11.bb
@@ -22,7 +22,7 @@ PACKAGES = "\
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-XSERVER ?= "xserver-kdrive-fbdev"
+XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 
 ALLOW_EMPTY = "1"
 
-- 
1.7.10



