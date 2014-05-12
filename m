Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f177.google.com (unknown [209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF8D66055
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:34:46 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id s7so7266620lbd.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=yJ2Y2kE9rS0nqhgpJ/ec5TBae+Hf1GTxRv40qO6J0hY=;
	b=qWjW9mz1mXg36Dz8gfXJw+e81aBaPyg6wvpFvBS5O0lHY4Ab6Ca0y4ftFrBPs7onko
	FF+iPtenXjExOo78uA5eI4lPTfOLZofA5Bkvt6R+GejrEW9cVhPeDNBcMNpxBpqi0rDt
	x5Pwm1xSLtQbpY9tP/foE695a9mvsQlIeGCBFUP7d4QvPlqZkjVsVChfL8X8SrFprNNc
	vbqUIdW9NIKGE/tvJPStgAMb8VyQHKnP16dJnbeqzNbOCejWQs2f9e/cANXJdCWjBtCB
	P3VAGBCc3xMCbvRmXVbV7Ri2nWtln+f09zpHIpAaaYbVInEsZXVDhm2v3m5qbFsl5Ce2
	LMfg==
X-Received: by 10.112.35.202 with SMTP id k10mr23960763lbj.14.1399894486828;
	Mon, 12 May 2014 04:34:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r9sm11478222lal.0.2014.05.12.04.34.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:34:46 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:34:53 +0200
Message-Id: <1f69c34ef65176317c482a5910f7ad9f06e54d9a.1399894447.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1399894447.git.Martin.Jansa@gmail.com>
References: <cover.1399894447.git.Martin.Jansa@gmail.com>
Subject: [daisy][PATCH 04/10] defaultsetup: enable blacklist by default
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
X-List-Received-Date: Mon, 12 May 2014 11:34:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/defaultsetup.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 6fc522c..9ba8651 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -18,6 +18,7 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
+INHERIT_BLACKLIST = "blacklist"
 INHERIT_DISTRO ?= "debian devshell sstate license"
-INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
+INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
 
-- 
1.9.2


