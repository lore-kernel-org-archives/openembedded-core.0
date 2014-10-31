Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id B0B3A6E63E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 10:34:34 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id z11so3783252lbi.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gMxxHGStUGORxZmBH8Mgc68u0sF1f2Ki14BZizORhXc=;
	b=Kb5MqPB3SHMv2tU+0HABc/3q6iW/YUMQIIuFzPhstxi71ZzHB7l/NDQlcA7JgFFHTA
	TT7rp2wGYsRRGMfU/uibOPlZrCmBqDKXX9uyTz02KA8wvSLKjMgRkrN9WAHwIWBmAtTC
	/9I/yLnQOqPKvOiAKXoq0GclR155Mb6tddaqL1OLJijtT6HFNZ8Ldt93iVuSDlE6lCsS
	60nm7GXfANRfzGNESE6bvNyMNqT9JlFuUvDQw61+Od3ty/ea34eqxeWuILOblbecpSlG
	gm4Mzr9p1wPSiXXxrL6Na1v8VXNNP2tV3sSHJX0xauTvW8cZiD5EC0s4ccK8HdcCb/UR
	dWvA==
X-Received: by 10.112.132.34 with SMTP id or2mr25376062lbb.75.1414751675278;
	Fri, 31 Oct 2014 03:34:35 -0700 (PDT)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id v1sm4290642lae.19.2014.10.31.03.34.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Oct 2014 03:34:34 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 10:34:26 +0000
Message-Id: <1414751666-21525-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <1414751666-21525-1-git-send-email-paul@paulbarker.me.uk>
References: <1414751666-21525-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/2] opkg-utils: Update SRCREV
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
X-List-Received-Date: Fri, 31 Oct 2014 10:34:41 -0000

update-alternatives now escapes '[' in expressions passed to sed.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 693c216..72dc98e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 PROVIDES += "virtual/update-alternatives"
 
-SRCREV = "eae0d8fa44e8594aa90eadf06e5f4fbeef314509"
+SRCREV = "762d9dadce548108d4204c2113461a7dd6f57e60"
 PV = "0.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils"
-- 
2.1.2


