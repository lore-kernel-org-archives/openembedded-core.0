Return-Path: <raj.khem@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 52D0A77EAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 23:47:59 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id n198so6102408yba.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 16:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Oy6XiG7SnA67Sn/BZNVtxNhKy+CXUH4UCKANQ+c9/g8=;
	b=dqrlV+E9qArX32ayQIdrxoszDbTftvrRcryLFBy5PTPevSrNUtQNBTn2P/DpY9rYPf
	4o/mVDEx2FIFvvQyf6MZpwrZ22b2X+rVA3+WvAqtYU6EC3566tqs1Vpp44bsLJj1rRoU
	qwTWvDxfRrzwuKqt4J6miglvWkPDvzziV2Yga3VRxiLW8BGQOFUhM74G2I68djoKYo5t
	AlBIJvgCen2e3UwHOUPUgmjNkiPQpXWlW+y7ugTzNE8jcOA9C6lZTpOudYhM7HA0sbWv
	ajIefNMsZM5Wyxtrx1TNQZYIXfiskgdueIYTytGbRfvXIk9z8C311IJUUjyUcq1vlztZ
	jiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Oy6XiG7SnA67Sn/BZNVtxNhKy+CXUH4UCKANQ+c9/g8=;
	b=jnUENhRCxb4PmjQtgMCLbzGbeZVBF4p6YLpYu3q5ejJ/HlL/TBKHZekcre31JKm+fB
	zg0GwGoC37IYGagpKUMB9sXIkta71mHcGfW09vL9dl1FReFNAZSUGppnumUIYy04mlAY
	etqKap5GB6ItqcFTcuHPBK4T1tJW/ENZyrxc+V1ZiIf5cCn7Q6YrYcVxtRA6079mgK7x
	vdk7xi/6Hgv4teBclvnLNLbQu4vUuYCBa1BdEp2znUYPLOXzHCM4n4WCS//aLd77NXBB
	IsNgRia3Pf7dX6t9we3XP2Ol1dgUN9+n0teDr3rntP69Qx7yEZQ5fwBpyTadG1QlPS3s
	6iNw==
X-Gm-Message-State: AODbwcDhxRl2ViYc10kM/T6F0XlhXPqwMOFYrzC6Z/sCFuIlazsH35e4
	/0rKoBBBN1z8ng==
X-Received: by 10.37.45.76 with SMTP id s12mr14879525ybe.108.1495583281251;
	Tue, 23 May 2017 16:48:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id v19sm975325ywg.46.2017.05.23.16.48.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 May 2017 16:48:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 May 2017 16:47:44 -0700
Message-Id: <20170523234744.34487-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170523234744.34487-1-raj.khem@gmail.com>
References: <20170523234744.34487-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] apt-native: Remove USE_NLS = "yes"
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
X-List-Received-Date: Tue, 23 May 2017 23:48:00 -0000

USE_NLS is target specific, its redundant for native packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/apt/apt-native.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 68f1b3ce2c..be806826e4 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -3,7 +3,6 @@ inherit native
 
 DEPENDS += "dpkg-native gettext-native db-native curl-native xz-native"
 PACKAGES = ""
-USE_NLS = "yes"
 
 SRC_URI += "file://db_linking_hack.patch \
             file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
-- 
2.13.0


