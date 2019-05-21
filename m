Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 24C647E078
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:34 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id x15so7573302pln.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iUm8pk+D9srK9v5+9Cft1Qt4GvcZFAyb24s18sugLv4=;
	b=HOUyKqsZ6MLjvmXBxlyWwpuXh6fGWlZsrmtHXkpinqGmDGWdhYwnXOSBVtaUuG2D1w
	N2Va/J/9knAMZX2YFWMsmfohVFlIRQuTIMKYA9u6e2XSLafiLHPdcElqsl3I9O4zSDoh
	DzeH/Cht1OE23Rh7r/hN7lGH8lQvgkzKPT0EXkglVWmzsR8l9SIdo8Az4UuIaj7e4C8d
	OTD9qEgvxvV38sxOdevREVG5Yh/bo3gucuATpJ3Sws3BiieSi7OnJLsl8bjBj1s+QhqB
	7QA3VWhwFP4cEy4xoUEiTA7xS1A09uYaFUNCy89Pwticgnu2f6oFZYGLZWKB9M6B1sc9
	Zybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iUm8pk+D9srK9v5+9Cft1Qt4GvcZFAyb24s18sugLv4=;
	b=KOnS0pJXlnBsiF3V4zocHrDXSoLA/NAu/Eb0/zJOAqOCc5LXZ2/SvjyIYhjXQ2LwlC
	MmbVMySEFQu6EpOGvDPO75eT0e2HmWhdl9RmV58cfTidlxXaFaPS3h43x2vwJD4qN5O+
	sz6itxeIHvDgUPD34ZbFLizCeB/AOdG8EJIb1zWO3x6l9duiGkTWpVxrogEVta/eM4Zm
	pzuzgQ8zCMLvZ9le3yOfJM5D7g0RUZa7xrZMoNenhiiVhJdkia8mPP9ZEo5gvai5VFCF
	sOtRa9STh+D0noI/JREgfjEKQc+7I4UJIjpA8LBZVWvHdfQOEVcDw+yb1xOfbgqSs57s
	rh1w==
X-Gm-Message-State: APjAAAUI1Xt6ZQ6Wz2VKZzVogW9B+sQtr0BHf9zZgWJMtK2vQ549bRH1
	TtNM9ErIQEJBVHYdYaCMVpPFKbBe
X-Google-Smtp-Source: APXvYqz6PwGmFp1+053pHkmhGLKgQiwaDsdsvZuobSf1cDXUGlLfwYgF3THytWf8Xs0A3t5ijSe77w==
X-Received: by 2002:a17:902:694b:: with SMTP id
	k11mr5927496plt.307.1558403015173; 
	Mon, 20 May 2019 18:43:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:17 -0700
Message-Id: <58bfdca84606b1f4967298980ce4a5a8ad4fa2bb.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 15/15] kernel.bbclass: adjust a condition checking
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
X-List-Received-Date: Tue, 21 May 2019 01:43:34 -0000

From: Ming Liu <liu.ming50@gmail.com>

do_bundle_initramfs does not have to depend on
${INITRAMFS_IMAGE}:do_image_complete if INITRAMFS_IMAGE_BUNDLE is not
set.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b346a60..437b8c7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -95,7 +95,8 @@ python __anonymous () {
         d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
 
     image = d.getVar('INITRAMFS_IMAGE')
-    if image:
+    image_bundle = d.getVar('INITRAMFS_IMAGE_BUNDLE')
+    if image and bb.utils.to_boolean(image_bundle, False):
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
-- 
2.7.4


