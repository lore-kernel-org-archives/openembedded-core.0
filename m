Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 620F761EB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:11:58 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so5497827wes.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=PzHecZk3TKHY3DL/poArKmd6qRwfSX/uD9ZNNy6Par4=;
	b=nexzrBAQUOkTDNMXQcJPSbWJFh2HD3ZKFUTREb+G98FGYeCx++np3/mDHOc0dWDW/X
	i3H6yxPYRJ2Nh8CM25ccnk7KudTbDfSq4shSYtUXw+uGnxXh0nyr3vWaDfdNqU4O00tY
	X95W7bsj+bxbsBGacKaMcLISQX8/JrK8DS0pNdNAVQwosFYPscHdgMnbZbL39FWEamNJ
	bD9viPD/BDTK7zs6C5OcV4CopjoiH5yg49t5/QIvwdyzbNMx73ScLPRDHmE5sjcu/sHr
	F14+wQ1fzODnYWxoCI9f/l7gJRYqctT3rl70NslJbUyYsVxN9Q+9eWZTv4Ol2m5S2VKU
	lhhg==
X-Received: by 10.180.189.102 with SMTP id gh6mr87166wic.19.1371744719102;
	Thu, 20 Jun 2013 09:11:59 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm1508166wia.4.2013.06.20.09.11.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:11:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:08:23 +0100
Message-Id: <40070a36a1f20f295085095dee9b4a45ebe7055d.1371744428.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQndlHPKgolNVGMBAvCQcevdaW8UKykpwkiNSE80sr+oZ/zt1Hag14ouLfTWFLwhkB//NUrt
Subject: [PATCH 1/7] weston-init: fix a typo in a user-visible message
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jun 2013 16:11:58 -0000

This is the weston init script, not X.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/weston-init/init |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index 3c73e7c..daa7f23 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -38,7 +38,7 @@ case "$1" in
   ;;
 
   stop)
-        echo "Stopping XServer"
+        echo "Stopping Weston"
         killproc weston
   ;;
 
-- 
1.7.10.4


