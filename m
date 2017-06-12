Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id F3EA978232
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:26:01 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id e23so19920839wre.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 00:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=k8gvl182BLhVAYPabDxIgvIknKx+rQguOh0fMjOkhqs=;
	b=PpUK6lpFx1SlVDNKwXQGYo3nFrn2+iFl51T+YzPKMfJqnRLE6r5UG8wNic2Uj6mXbp
	LalaX/aY4M9AgpWQ7bC+4uiuOBBui0PxvSDDELvcA1KJ4UctTQi4cOt2gS0fg2pUpOpj
	w/OACdwo4ait9WRCbXjh0vV53JGGCAaIW34ZK3t11WmgBZFOttMnhahql+HgrQ7+M+Pg
	jZMF7h10hbKFGTYtVo3N5BMfMhu9Yo4ZRyjPmsYYfTnHl43ibKIjivnNyVBGppmbGuQN
	lr9ya9vWYoguzGcAk6HtyL+Uvo7kxBd9uITxQnFyp5gng3n4VQj3rRViMHKOYxqyEA8F
	L75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k8gvl182BLhVAYPabDxIgvIknKx+rQguOh0fMjOkhqs=;
	b=OfpdaVBjIwhyITW4iv1VMX9zp3d4tcL5Defn+8GZ3AX1R/ieG5h+cCCtU74BhoZxYl
	GbtaRZtdd3aaZGQvTWj47lhFvAkDTA+KmNwdrmhQnYsG3B3xKSHE+gGoIrD2KFlViZuv
	oD4IQPtV0LCvXg+f3MU/oB4t+jV/mdH4X9GbpxxoehgKq6h3wTVI6nosqnaWPTmUi9dx
	eIl08T3DrUVKx7mrcLcSM4QoVolJiPEitKjsZ9h1U2qPbG+DoBmLfND0anc9twABms64
	zT3NeFQHoftauTAMwDY6TWKm4jRm9WSJwi/StUhdJZgtz9lg1LChN+TCiOFMM4VmGXC/
	zMlg==
X-Gm-Message-State: AODbwcDlPEOiwrE4bvrKRWKUSxoJIAq8ZpZcDA6NRbWXS7Ugpg6A1kku
	sXSRLbm3kgv6B7A8
X-Received: by 10.80.142.219 with SMTP id x27mr33292155edx.3.1497252362174;
	Mon, 12 Jun 2017 00:26:02 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.206.46]) by smtp.gmail.com with ESMTPSA id
	b53sm5688416eda.50.2017.06.12.00.26.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jun 2017 00:26:01 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 09:25:52 +0200
Message-Id: <1497252352-5270-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] rpm: add explicit dependency on bzip2-replacement-native for native builds
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
X-List-Received-Date: Mon, 12 Jun 2017 07:26:02 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This fixes a following error:
| recipe-sysroot-native/usr/lib/rpm/debugedit: error while loading shared libraries: \
| libbz2.so.1: cannot open shared object file: No such file or directory

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 2310ee6..e7cba98 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -43,8 +43,8 @@ SRCREV = "a8e51b3bb05c6acb1d9b2e3d34f859ddda1677be"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "nss libarchive db file popt xz dbus elfutils python3"
-DEPENDS_append_class-native = " file-replacement-native"
+DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
+DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
 
 inherit autotools gettext pkgconfig python3native
 export PYTHON_ABI
-- 
2.7.4


