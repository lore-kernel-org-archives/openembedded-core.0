Return-Path: <yahiafarghaly@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E778478227
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 22:17:46 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id b9so1782302wra.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wp+yuzUfrMnGitIxoWj6CvwuAitGhEN7aLYPfVuLZug=;
	b=euSUp0uyppLagrtBLBikQyRsar32N8eUXOoP0kgLNYRjAlB1JnIX0uSvwwciKhx6CN
	UNpBVptusAjYFXqNvYZ9o3roKfGIK5ky87ewn2rBF8LRRgi0o3h4Sk8WIG1H9vIHlw2C
	TF6xt0QDh4tHiglrAPDZq4oDQ0FM2dsGfBJSCmW+idHpe5XKylIgOJRExSnBu2kN1vcg
	Rv7ZHf8/WFXnXu1WOps9TntCEPE9/ighTzTFDItxV3MrJcHbx7V2VGyhlAYnY/+VB5Ed
	hPaYjauW0buvLaTgPxygBjqAYtePFunCW1NmvjSBvzusZvAOMM169t0gUJKl3XZHypbH
	VdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wp+yuzUfrMnGitIxoWj6CvwuAitGhEN7aLYPfVuLZug=;
	b=j/Dyr3urjECCQBHvYIDiNQwR33ks17IA0B8Ga2UwvmSGEJPkUygZ8bbUdmWxsTeLyy
	37+bOoI4CiTI/xR2swCYBFo1WyStRcpYJqaFUTwas3YvexcpuSju3Qa2ZmJ+DrWC4Tci
	jtgDynj0Yg8ZYy41T5IyDGIZAyMvQ+UoyI6AOYaGfBaP6OsmG/TnqzlP889Uhrlk/lWU
	10NFkBONExmbn/EEm/ZE1/Xz2vLYMOORDQVGSBgHepv/mWfxDiDyjabXvTxsnAJcxMPd
	jPG5ZrIqkFYiIrVczab6aIq70mqvW9tW81kRs1/JcFcPAy8WXWw25r8m0BQvEziZmX9R
	a8hg==
X-Gm-Message-State: AHPjjUjvTuRlvZeTyDN6Grf+lOnQSLyQFuY4y+P9Yb9omWnuAsriwhfq
	ptUiDZenmIA98LSdKv4=
X-Google-Smtp-Source: ADKCNb4b8lgBfy1SJ+VMq7qpGxTd4+/U5wBqFUNyvEL8XxPyLo0mttO8FG6BElJp9RREZyPKVMb+xQ==
X-Received: by 10.223.176.84 with SMTP id g20mr2927135wra.117.1504909067516;
	Fri, 08 Sep 2017 15:17:47 -0700 (PDT)
Received: from localhost.localdomain ([156.223.101.162])
	by smtp.gmail.com with ESMTPSA id e8sm5145178wmf.12.2017.09.08.15.17.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 15:17:46 -0700 (PDT)
From: Yahia Farghaly <yahiafarghaly@gmail.com>
X-Google-Original-From: Yahia Farghaly <yahiacommunication@yahoo.com>
To: hongxu.jia@windriver.com
Date: Sat,  9 Sep 2017 00:17:35 +0200
Message-Id: <1504909055-29659-1-git-send-email-yahiacommunication@yahoo.com>
X-Mailer: git-send-email 1.9.1
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH] gnupg: added a coreutils runtime dependancy to gnupg recipe
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
X-List-Received-Date: Fri, 08 Sep 2017 22:17:47 -0000

From: yahiafarghaly <yahiafarghaly@gmail.com>

When using 'apt-key add' on the target image, the gnupg is required
but for gnupg to be fully functional, the coreutils is required to be exist with the gnupg.
Otherwise, it may throw an error in runtime as one of components of coreutils is missing.
For 'apt-key add', i faced the error of 'comm: command not found' so as proper solution, i submit this change.

Signed-off-by: yahiafarghaly <yahiafarghaly@gmail.com>
---
 meta/recipes-support/gnupg/gnupg_2.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.0.bb b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
index 0176ddd..8aa0951 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.0.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.0.bb
@@ -44,3 +44,5 @@ do_install_append() {
 PACKAGECONFIG ??= "gnutls"
 PACKAGECONFIG[gnutls] = "--enable-gnutls, --disable-gnutls, gnutls"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
+
+RDEPENDS_${PN} = "coreutils"
-- 
2.7.4


