Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0133E7EAC3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:29:44 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c2so87584839wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JGW46qANc0tq85JAWb8WEeHJ8rj1eD/29expWeFaAtI=;
	b=V54bl2dfoJR6/4NqYya225ES7CgB3YllGg4fk6hAsu5rvNd3IgZTDbRV4NW8XlopKg
	qbpaafeKx6V4VE7ivqbLO0e8clGsPJykxRldd6W3LAQDNA0j9F4RA3dJP+U578yxyn8G
	Gw1+qr3TrxJGVyQcyAaT4faClBCpq27UhNC/pqQ8ZGZ70k3qd8GhgY7xl0MvhXAlXstY
	8lAsqe8qE4oWI3a01ydTUzs02YMg593bqvnnAnoyIxOuxQkv6CfV65dlT9W+tKymeWzV
	OQn3KN7q6k/djzEpJbZDuV8hDJ4giPBEJbfD2yyy5zTxrnB1ulTZhGK3948NMyikY9DO
	YQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JGW46qANc0tq85JAWb8WEeHJ8rj1eD/29expWeFaAtI=;
	b=B8h68D40poYsukXwKpLTb/+3sf40IJcP0k/jGZTDrEyBqE2O1RJ48prx9cmcQ4GoTk
	h6ui5gjXTSMEvqDYuuzZEhyJTSGpdHiO5nu2FZ6Dk0Hvo8yExeVQdlsaA31U30uXIzso
	dPzsivAEepJy+P1Z5rB/MlPXHbjKGzpyw1Pw8ByM1ecQt7MeovOqLruac1vZsKHDqmcD
	tPIX+iokAdc4IN1ZY8bOFcUEVnyOTW+nILR0nUcNxfvygVo2ZOFk/LNgPAjd8+WsOFND
	vmyKtTU1svzboCh75D71liJema8t6s0BDy8tzl1PvVeGyKcSQOYBT6/d9obVzG87sUsh
	JZ6A==
X-Gm-Message-State: APjAAAWX4s325MQaLeA5nvmcd/tDhJvknFIeAjwjm32H8E+ia9bgi8Ya
	DZuSZaUKEXCWfT3ljhcgynjd+WhJDYj1Jg==
X-Google-Smtp-Source: APXvYqzfIFX8whKa6wGEH8QmST941VDj77KTolpr77Ep13thgALigWRD8+ptWc84CWY4vMKuFiOutg==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr9365775wrn.111.1565173785433; 
	Wed, 07 Aug 2019 03:29:45 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o3sm79705336wrs.59.2019.08.07.03.29.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 03:29:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 12:29:34 +0200
Message-Id: <20190807102939.12760-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807102939.12760-1-alex.kanavin@gmail.com>
References: <20190807102939.12760-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/7] stress-ng: add a patch to remove unneeded bash dependency
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
X-List-Received-Date: Wed, 07 Aug 2019 10:29:45 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...tion-remove-the-shebang-at-the-start.patch | 23 +++++++++++++++++++
 .../stress-ng/stress-ng_0.10.00.bb            |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-bash-completion-remove-the-shebang-at-the-start.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-bash-completion-remove-the-shebang-at-the-start.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-bash-completion-remove-the-shebang-at-the-start.patch
new file mode 100644
index 00000000000..66d99dd885f
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-bash-completion-remove-the-shebang-at-the-start.patch
@@ -0,0 +1,23 @@
+From 042147675c7c2ea7dd65b2597f2e350376a710aa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 6 Aug 2019 17:28:56 +0200
+Subject: [PATCH] bash-completion: remove the shebang at the start
+
+bash completion files do not need to specify that.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ bash-completion/stress-ng | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/bash-completion/stress-ng b/bash-completion/stress-ng
+index 8b1421c..7f195be 100755
+--- a/bash-completion/stress-ng
++++ b/bash-completion/stress-ng
+@@ -1,5 +1,3 @@
+-#!/bin/bash
+-#
+ # stress-ng tab completion for bash.
+ #
+ # Copyright (C) 2019 Canonical
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
index f7faf97e681..e800040c371 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
+           file://0001-bash-completion-remove-the-shebang-at-the-start.patch \
            "
 SRC_URI[md5sum] = "46aa41d37690324ceab4febfcc549018"
 SRC_URI[sha256sum] = "d09dd2a1aea549e478995bf9be90b38906a4cdf33ea7b245ef9d46aa5213c074"
-- 
2.17.1


