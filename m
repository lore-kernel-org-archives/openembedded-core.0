Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fc-00008Q-3x
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:42:33 +0100
Received: by mail-da0-f41.google.com with SMTP id j17so938653dan.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=mQ2bLdHhGTYzE9JjdYhVAbAuShgdeXNdE+NXf+9QQ8w=;
	b=G1u1s95rCbmVJu0pbusei9g6MSBHut1BLlpRZSoEeJpsMrJ3DqIxtN1kWtNa/IQR8z
	K3G2jvwkPqdMAWn6CwLkx/E/e1+g0rzyOkomtNAxeUsHS430vLbykqydCaE+PavH/0Oa
	bAjPJ+6esfKbhdnzImTZCN+pFg6lgUWNdm5KDdVbl6nxTLBc6uheD65vGU40PxMf93l5
	rohgtgG+DvtSu8VVxJ3RQdZwveLePvs6Mbv7a+7db4xXRi+xCnmtXrk2ZgeuqVEdiN9P
	xz8UW7arTfekCfD+ixkNKArSt4VPnsLsGd6KjBnjq6zchrihBHWUZZtXGszOlESRfjFM
	MRSw==
X-Received: by 10.68.83.38 with SMTP id n6mr30225405pby.28.1363026320609;
	Mon, 11 Mar 2013 11:25:20 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:50 -0700
Message-Id: <127ee91c3c12db8d2d3930efb1a5ed1515f5fe20.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmeXM2zJUTSUwKdJ/GgsD+jZI+6mjcGy50UT4SkDC2fJ9YNOSuyriLT1fLG92ZYTKbfPHu3
Subject: [PATCH 07/12] busybox: enable swapon -p (91 byte increase)
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
X-List-Received-Date: Mon, 11 Mar 2013 18:42:43 -0000

systemd needs "swapon -p", so as the impact is minimal enable it unversally.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/busybox/busybox-1.20.2/defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/defconfig b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
index b39234f..bdfdadf 100644
--- a/meta/recipes-core/busybox/busybox-1.20.2/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
@@ -596,7 +596,7 @@ CONFIG_RDATE=y
 # CONFIG_SCRIPTREPLAY is not set
 # CONFIG_SETARCH is not set
 CONFIG_SWAPONOFF=y
-# CONFIG_FEATURE_SWAPON_PRI is not set
+CONFIG_FEATURE_SWAPON_PRI=y
 CONFIG_SWITCH_ROOT=y
 CONFIG_UMOUNT=y
 CONFIG_FEATURE_UMOUNT_ALL=y
-- 
1.7.10.4



