Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6CB6BE4F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 15:53:02 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id n12so3084924wgh.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 08:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=67V2p12wXw6bdBLwNAUE/VSqMX7Mm2UKX20lGOMkIco=;
	b=gszgbBYKVjtgV5dS5R6YjvEjSjNMccGJzrOqzJBtjE6JV92Wh5zxiPZmIRAJvjmIAh
	GiToCqHS1ysFjWAxWy48mRz/jtOSXbL2IpluoIu0ME1pKx4S1yOURxsxnv81oRXBeNey
	yF1vf9D/DvPYRWiOAViRv8kcQJoQmzvlskEWtGVf8swQHtRJOsfcw2vTJkL880opBXz7
	w7K5nNPeauYynr8puIuArzccni3BLkTDT7fTWa051honNcGZcflaBn+Xc2p9nkX/LZrx
	tI3bRFIlKC7tCHcj0KSxoQROthQP5c3VT/ur9OAAY476Oi6//YJMep8pvfOUWAOyKjRY
	58vw==
X-Gm-Message-State: ALoCoQm1tifpR/VyI+SB0srBi2cuwxBcc9/qd1KseT+TJ0448jG9UErjK+GWSPxP1DghE2hSL9vo
X-Received: by 10.194.193.4 with SMTP id hk4mr5590859wjc.29.1378741983758;
	Mon, 09 Sep 2013 08:53:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id li9sm6236479wic.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 08:53:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2013 16:52:54 +0100
Message-Id: <1378741974-21426-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: update patch header and comments
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
X-List-Received-Date: Mon, 09 Sep 2013 15:53:03 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd/binfmt-install.patch |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/binfmt-install.patch b/meta/recipes-core/systemd/systemd/binfmt-install.patch
index 891c712..c2d5099 100644
--- a/meta/recipes-core/systemd/systemd/binfmt-install.patch
+++ b/meta/recipes-core/systemd/systemd/binfmt-install.patch
@@ -1,7 +1,12 @@
 Don't install dependency links at install time for the binfmt services, use
-[Install] blocks so that they get created when the service is enabled.
+[Install] blocks so that they get created when the service is enabled like a
+traditional service.
 
-Upstream-Status: Inappropriate(Makefile.am) / Submitted(units/)
+The [Install] blocks were rejected upstream as they don't have a way to "enable"
+it on install without static symlinks which can't be disabled, only masked.  We
+however can do that in a postinst.
+
+Upstream-Status: Denied
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 diff --git a/Makefile.am b/Makefile.am
-- 
1.7.10.4


