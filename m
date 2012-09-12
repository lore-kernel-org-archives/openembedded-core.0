Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBkK7-0000L5-0y
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 12:37:35 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 12 Sep 2012 03:24:46 -0700
Received: by wgbdr1 with SMTP id dr1so1071967wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 03:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Z2SOU07JzYh5xYaY46Q4fx3QvpPE5fkWtJoQ5vSiY1E=;
	b=Jy1dRVu6OLNOdyE0o16IgoTls/ynhrKSNbIUACsTWMs5twWHmJsb8Ho2It2oBMg5FC
	QL9vF4287WQZ+lg+iKpW/g3rMVcsmFVnxedcdUoGBcG2I4Nbmdn2fBUB8pcA2KQAzJGe
	9yD2NJUPP0khKewHNYg7l8TK1skzAB/oKXGs6rw6aeuCC+rx5UR/VOhrzueIshQBvrUL
	U3sSN6JlKKCoQxml2ZC1ltBoyOEFO9qaBEoGPiVqUjHc7jjU4o3sCedLAjuOpYtbRw2G
	57oTMcGCbxEtn1QqG+UC3rII/aLdvzQ1GO+vzFJJl6iSTOFh8NYXF9Ld4KD7bH7uPdZA
	ekVQ==
Received: by 10.180.81.38 with SMTP id w6mr31743092wix.10.1347445485074;
	Wed, 12 Sep 2012 03:24:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hv8sm7773438wib.0.2012.09.12.03.24.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 03:24:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2012 11:23:48 +0100
Message-Id: <1347445428-15753-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347445428-15753-1-git-send-email-ross.burton@intel.com>
References: <1347445428-15753-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk5KkmTqEaSFILqtTi8GumbVg5utLHG+t2Xe5hbv4rKi6qflaql2riYglQzSTW/Av7qcHs0
Subject: [PATCH 2/2] mesa-dri: remove DEFAULT_PREFERENCE, this is the preferred now
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
X-List-Received-Date: Wed, 12 Sep 2012 10:37:35 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 7a1164b..2d5aa44 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -1,9 +1,6 @@
 DEPENDS += "libdrm expat udev"
 X11_DEPS += "dri2proto"
 
-# most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
-
 DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",i915,i965"
 DRIDRIVERS_append_x86-64 = ",i915,i965"
-- 
1.7.10



