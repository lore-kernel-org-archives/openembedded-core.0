Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id AC2356BD5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:08 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so348068eaj.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=7uimjRKMPK+c43ZeljVuHw8XayVv1/kKN49G9KOrypI=;
	b=f5U8FV9NkRd3HwubE3gsftV1wNZZYiMou1F4xdCC+vWL0BxBMB//2BeauVV/SAtR3/
	UFbUqub4vWny8VpgNqMP+ME+CKWIsnRluCz7grfivl+qTqwFdARR9M75P4KdSeM1HR8e
	JvtvlUu9Ed8r5AbfXVR3XGTNr3PDLhl+5YUJhsE/ZYoC8so7006v8JrF6o/w90Z2Z9Kv
	R7GY4LIlX1YPukxOeX9yFo2vJ/P6MCCBI5nBJCmFFQ1xrbDcmx1Rbm3Kub0Hn30Ovq5d
	XzKn8LZYuouoAh5HuIyZE1O9sEqvDkVodA4Qq0E8h2zB9pDwYqW5cZ63j9Jaod4SRLhs
	v8Jw==
X-Received: by 10.15.101.195 with SMTP id bp43mr4313110eeb.70.1377792129167;
	Thu, 29 Aug 2013 09:02:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm47235442eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:58 +0200
Message-Id: <086c32308bdd8d212afe0c8fa4e614a2617fc4ba.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 11/20] wget: Add dependency on libpcre
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/wget/wget.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index de9b620..7af55c4 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "openssl zlib"
+DEPENDS = "openssl zlib libpcre"
 
 INC_PR = "r16"
 
-- 
1.8.3.2


