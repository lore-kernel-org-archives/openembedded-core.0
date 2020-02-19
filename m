Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 2D791613BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 21:08:30 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 6A6B560057;
	Wed, 19 Feb 2020 22:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1582146508;
	bh=eciXse3L5ocmJg6K3BymepH0LWYvYqPq2brxYfv+jUA=;
	h=From:To:Cc:Subject:Date:From;
	b=qbKsZdyu7fquqneD5tb955/IyUh4Z20dR6d+iJNbyRTD4vSX5wZk4vl1YtFl0oXCj
	9EK8Dgkd3t0oMJKFpUGX0mUrhs3T7GFDGG23ylndruXzS1tT4nMiqAFm4UsRsNPmUz
	TcFIZBsRKaQ1brun7JySai2+hWSb39YkWms0Ch2fnZsiDJXYCcXu7BQTjcQfCIhM92
	NSetyFxi0YX7YYwdvj8rwyPYEP9X6I8CDJLQI6kswBBPrhstmF0+vPY6sYRur7BZ3j
	LPzXgIjjq5z2N86gzsZ5jUgSdmEYyRNOJL9x3bsxNVVtx3h91a4cQUvNBmgy9dzlc5
	HdC3jNYTaeD9A==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 22:08:11 +0100
Message-Id: <1582146491-20965-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libubootenv: bump to revision ba952d0
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
X-List-Received-Date: Wed, 19 Feb 2020 21:08:31 -0000

This includes following changes:

ba952d0 BUG: variable lists not released in close()
690f868 Variables are not removed when loading from file
9e3586a Make sure there's no file descriptor leakage in case of error
03647c4 Check config file defines a non-zero Sector size
3b2d4f1 Check environment size from fw_env.config

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index f5b6059..ac49b68 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b36
 SECTION = "libs"
 
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "879c0731fa0725785b9fa4499bbf6aacd04ee4c2"
+SRCREV = "ba952d05ec9ab16029816a06d956bac7fb4e9832"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


