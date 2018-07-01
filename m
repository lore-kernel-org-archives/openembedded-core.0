Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAB41607E1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jul 2018 10:42:51 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z6-v6so5452460wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jul 2018 03:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0434IU+pb5YK7NWjLcidKKapWazb5Ej0zUfxiD+FfGM=;
	b=dl2cDRhoFZtZcDJ25OhPlDIcVaAZuOam6PdZJZwyZufiq+u2U4AzIjslA1KlQXv23H
	uza48WIDzyMUbVKTxV2XZy8ubbzIFJkIxZ7RoJT80fwNFmP3zNCBAJHpJQMN5BzWWyFQ
	bEt42cxA6c/ZcVZaZ35Dlf3hyP3lcFjQ4seTmQZjw0qs0EhbtltRarTMuAZ95CuwxMNi
	vY34HlXbObL59LZxDnF2QAybfvGB+Ks+oFi6rAtoiq4extys9wEIeyrvwVH6dhfEgh9Y
	JSF6t96HFl+UZ5uCuR0yrxM4N3en+Ux7wRBvFMcyQN2aUAZDNZqELkj3E6wFXCd/D+AP
	JHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0434IU+pb5YK7NWjLcidKKapWazb5Ej0zUfxiD+FfGM=;
	b=ixo83YFD6qi5+zNLGIv/LRi82AawkCeMEdejbUmjbmnYy0Wz1hNozyfYpIWU3UuNG5
	Ss5Ai4F7SRBpVxks6t31H95brGwV8TzZLVgVqIu4OtxlyxNDvxcC+P04f3ebmq6RsWsl
	7KA8QagbZ67JHXrUthnZQeYaYFZ1kmO9iHdsEfRMaWLZrXI7aXX0hggKXDuyC1bICRXi
	stejOm0j+AGLMgxzfn3B6wp73nVrPSzAzJpdi5uI1nxTeJ0vNxKqKnXJWdO2XAL8IWqt
	vHoXGLtwaY9eU8St+OSGkAposzAO0xi8CF2qMCTWS0/ruggA3eFrW7fVgX1axkqyYeAb
	Y/Yg==
X-Gm-Message-State: APt69E0UwDwfb31Klr3baqOGf0LEW6awjl/1pHUwEaYgFdu+awM+QmRt
	CbbJkm5N2kUALTNikj779mBdjpG4
X-Google-Smtp-Source: AAOMgpcF0WaQz2QTzYLA4Z23Yu1zQ1Z+Gqt3DFqu3hfeKYhCMkeK5H7uXzBJYe5zxIfSv8rEWvgdyw==
X-Received: by 2002:a1c:1183:: with SMTP id
	125-v6mr292032wmr.138.1530441772366; 
	Sun, 01 Jul 2018 03:42:52 -0700 (PDT)
Received: from localhost.localdomain ([213.205.242.44])
	by smtp.gmail.com with ESMTPSA id
	i9-v6sm9237345wrs.92.2018.07.01.03.42.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Jul 2018 03:42:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Jul 2018 10:42:46 +0000
Message-Id: <1530441766-31139-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bmap-tools: Add python3-fcntl dependency
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
X-List-Received-Date: Sun, 01 Jul 2018 10:42:52 -0000

Add missing python3-fcntl dependency

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-support/bmap-tools/bmap-tools_3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
index 9d8191f..2aae9a3 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "0064891270c180c190f41925b0f6fb9cecac3056f1168d2592dbe90e5f
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/${BPN}/releases"
 
-RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools"
+RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl"
 
 inherit python3native
 inherit setuptools3
-- 
2.7.4


