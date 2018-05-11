Return-Path: <cjp256@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 691DB7780D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 17:25:16 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h2-v6so8021701qtp.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 10:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=duz764rNlbzOK87XMvXbf8HIj1lGe5xLUy6D/j7STZQ=;
	b=nhlOqY/xMl2Jlr0VAvGsk2GSlid5bUwAKx1DAqa6RdSps8NS4T7NWLbP6f64OsD9gY
	zIVe7lasyHBD/WSQDQ60AeN9jJXZU1q6EEt0cy/Ad6sLj8b8k3tQkUrexuUv34ynMtVw
	xlI7NwxEr5Z5WQKfp1ANe/ZlqJGISoabi5PTGwZqj/y7KMC1eDGbzgIQKNY/9z8nWcoe
	KGtJckhQktHBSJjyjK6iRCQeeCgFFYqncYTWzv5sa7/xqNRlMBsEreu1f1WIcUDTqnY4
	7XcKxuguId1ll8LVSAfhjnRhR28POEDdJ8f9cvwjO8B3WEax2L45x+Dh84ZQfA2lSfEJ
	trKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=duz764rNlbzOK87XMvXbf8HIj1lGe5xLUy6D/j7STZQ=;
	b=mTrg9GFINQCXkS1/F5EjT/A7gr7Uc3haQ3OyW7e0WF4IewYPVQC6x0kEEz7sdjz9D0
	VaqdBcDAsA3cDTdeeuPwtCBIAgOTBNdaVKnEmBziaopE+/nKWTVi5224yYEBUVS59TmI
	Azxfa8gq5xxHE9K6K/Ha+IpqY/H1pQPZTntRTBa24mAWdO7T1SOEBryqXAAN6OQBZg3R
	iQeUEb8h8NdTdYvpgdt7xTtKjGFQLTQ+bEkaKoQ6IZ6sCszbdSgQ0Rfz1rS8mHUY1a0X
	tUHm8IA5Gve4rpBcArtDJ/UeUYCFTNx9XiMVO3icimaAehjHGhzAFUtsx6+kGGLlFcaH
	LK1Q==
X-Gm-Message-State: ALKqPwcrpi6LXVntv8calLdhyj1varydxk9oMeidj83+eqjMpBGb46Xr
	W8HXDsD18ivpl9ERM77OEM56pqtP
X-Google-Smtp-Source: AB8JxZq5jg8tvt5jMnuecNMqoedSKC8CJCfFvioNznqGWukW42jDrImO+facd5DRW/TPKVLKEnzVaQ==
X-Received: by 2002:ac8:36ad:: with SMTP id
	a42-v6mr6240368qtc.13.1526059517691; 
	Fri, 11 May 2018 10:25:17 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	s16-v6sm2984747qks.78.2018.05.11.10.25.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 May 2018 10:25:17 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 13:25:14 -0400
Message-Id: <1526059514-31799-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH v2] qemu: add gettext-native to DEPENDS
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
X-List-Received-Date: Fri, 11 May 2018 17:25:17 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Otherwise QEMU build may fail with missing `msgfmt` command.

| make -C po install
|   GEN     bg.mo
|   GEN     tr.mo
|   GEN     de_DE.mo
| /bin/sh: msgfmt: command not found
| /bin/sh: msgfmt: command not found

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dc73df8..78fa30c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "glib-2.0 zlib pixman"
+DEPENDS = "glib-2.0 zlib pixman gettext-native"
 RDEPENDS_${PN}_class-target += "bash"
 
 require qemu-targets.inc
-- 
2.1.4


