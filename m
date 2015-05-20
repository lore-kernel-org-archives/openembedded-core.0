Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id BD898737FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 20:28:57 +0000 (UTC)
Received: by wizk4 with SMTP id k4so168190062wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gxzW7TIMaR9cSQkgPcZ08i86ZZMqxXwDhF7sTQNLKGk=;
	b=hqQ7M0kpoe5xQYCZEBakkcu8mrOZhzjQ5peol/VwBA5cqdxk2IA1OX6c2VSCw7grU9
	MhiFHbM/sVB+s2ydRSBY5p9JHM7/xB8WyjhO8pQqoz8SFf1gVKB8dsLShbSxs7/Warkj
	jQlCOqUn6TscC1M+j3CJpZn20uQRasb5EifLC61lcUnr+4TzzKXL/+d3s7i3en7BUuEY
	gIVeIu5xI2vbfJEu20QY981JPLB6CvThQCeQRqIR8En/9sxAUYbJBmTEVo7LLAI33FEJ
	ySLbXfBf3Yv3kN02tsew95EpiChFNSMvmnxJMO+xfcd7GjMtwYplA46LwBqX8ZlBI9L2
	PQYw==
X-Gm-Message-State: ALoCoQk5lqODtd2lxS/lBZw40t4y56BzWnjzH8ZmK8yj7wusuVsucmrmz85/uc87r9lowwLMIzfX
X-Received: by 10.194.47.165 with SMTP id e5mr66427507wjn.128.1432153738548;
	Wed, 20 May 2015 13:28:58 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id b10sm5208846wiz.9.2015.05.20.13.28.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 May 2015 13:28:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 21:24:37 +0100
Message-Id: <1432153478-5784-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1432153478-5784-1-git-send-email-ross.burton@intel.com>
References: <1432153478-5784-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] xkeyboard-config: upgrade to 2.14
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
X-List-Received-Date: Wed, 20 May 2015 20:28:59 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{xkeyboard-config_2.13.bb => xkeyboard-config_2.14.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.13.bb => xkeyboard-config_2.14.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.13.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.14.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.13.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.14.bb
index 668a37a..a960744 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.13.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.14.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2 \
            file://0001-Remove-GPLv3-content.patch \
            "
-SRC_URI[md5sum] = "a415775ca8ecf4dfafc9488b8cbd7114"
-SRC_URI[sha256sum] = "7b5be9f2b9a30102512b15308aec55f7f54289df24ac21de82ebb4bf145f9fce"
+SRC_URI[md5sum] = "2869c03d85b606f929aab054ef6e1b60"
+SRC_URI[sha256sum] = "dc91458a214c56a35727f9e523fc647615de64137057ca6ee4d4d4474a4bb2ae"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
-- 
2.1.4


