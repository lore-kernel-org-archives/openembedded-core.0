Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF676A4B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:32 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x50so271239wes.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=HpoDQ2KsRhDvrxFDwo+RhUPOcrUKSmI+bmDTeSJkqpo=;
	b=d6DRaDzcUfzaMXgBX6nl55YNcbK8dOtB2VPQPzGC4CeAx95Lx7Rir+ULvXefIP/g8g
	exWpvGVcVuz/K4OBOfiDA265HCYi6KYqZgKwOvTYBuFJXb/jaQXWxYQJLBwNw9U6XLm0
	70QqfvtflgE6UUbHpUpmXrDHrHRuKjXxZ84Lfinx7ZpKC78oYCfV60v/Q8mCGKhbgycV
	njo4N7QE6iwbrstZvOLwgZaspU5jusJGn7fFiMewvJzJ2DslikA3QyrXV7R+QlT953Cb
	+05zMQdequkqqU5xxM8ZpGmj4a0dtfbzuahfXpWKuHFwh62SO+4yjsRlYZTzTGBi0s3F
	IA6A==
X-Received: by 10.180.160.167 with SMTP id xl7mr18614446wib.62.1369922193169; 
	Thu, 30 May 2013 06:56:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:48 +0100
Message-Id: <7f6817c212b8cb777b9117990c238f2a75ae8750.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnrwsjeyHfBE0ZbS+iMtseA6JZk46lwukwc8Ec6VOL2qdI/z35/nIzmku5yVVuPZMHv2LMH
Subject: [PATCH 14/14] gtk+3: clean up libtool link creation to avoid errors in configure log
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
X-List-Received-Date: Thu, 30 May 2013 13:56:32 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 4742eb9..f4d5254 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -18,7 +18,8 @@ export PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
 
 do_configure_prepend() {
     # Do this because the configure script is running ./libtool directly
-    ln -s ${TARGET_PREFIX}libtool libtool || true
+    rm -f libtool
+    ln -s ${TARGET_PREFIX}libtool libtool
 }
 
 # Forcibly disable the GTK+ 2 dependency as we don't want to natively build the
-- 
1.7.10.4


