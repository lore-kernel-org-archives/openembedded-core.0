Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 149F77E5F1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2019 12:39:05 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e3so76304717edr.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Aug 2019 05:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q5K24Br3JDB9k98Wnfq0mdm4h74G2g2eGIFmd2glN1A=;
	b=mMil7qkY7tZ6XuRb999lSI6rWumXCK7RKWNMQ14uJk0RcFK5YAcnA4DM1lFauL8J9o
	V9b/lRfCh2Py5dov21NoJtoIlSMz5hn9+H98G59JnupzUxKmggUk69RZmETI9CALUigV
	1PGwcXP6+fbjeAYDkdzA8mQ/mtFwK3+vRWqR1MTt2OIC1iKo3kCRzAiXWysuPJdremqj
	e0g2FumlIr68sKxyAIhH4p5VrAm/3F+/lyieneM0ZhR6HhFsiL2vT3unhX6ajPe5HuWk
	GrbFuUktbMtO6wd+6+rBRso70Ns3DZtD4RnsPNe0JNXZRMhjEPl9fOJbDWnILDJECz+q
	NS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q5K24Br3JDB9k98Wnfq0mdm4h74G2g2eGIFmd2glN1A=;
	b=ZNc3OR+BHiiPV8AuQ/rs1EPxokQ1//Vv1QhElYW/FV1gBK8WWedd2SWx/tTTH/idsy
	Qb9CVtnpy0F3eMbMQLN8+Gho9qDkHTqWS3f7I0IoBEOQ/rdrh7bzw1eTFdM7+rjcbhEw
	RCOavL9wXVvUk22PLFDGNkwlS7MLm5GQZtVFCw+YREIBkTfjdnyv+pUawPDFkTlLcK4/
	pFNscBS28MtzgMqTMOR5db6E9wEh8NsVRzic48fi8AMU7A6ytkYOqGSo45DTGU2QFsRx
	VOp9YX+WYqJ4W/Es+WC0HD4+nPNSoz3Ff/F+97f7RGOX+xrPKSHT/gZsNzdqhY3wwGTn
	Y3lg==
X-Gm-Message-State: APjAAAWSv2w/hosMGGdPWjjaLWwTF9LExzbI3or8fzYcEcpob4QE2yUF
	TcZeUi+V+FgdCmjs7phbQvHW2ngOXIc=
X-Google-Smtp-Source: APXvYqzuAn8oRPx5yP6Jj4kLLFLQ4NuzeLu+77t/QH7SHbvFk+zy/IjOdC8uLqMyrpocZn8rAv1RLQ==
X-Received: by 2002:a50:886a:: with SMTP id c39mr61251498edc.214.1564922346423;
	Sun, 04 Aug 2019 05:39:06 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.200.33])
	by smtp.gmail.com with ESMTPSA id
	d44sm19504266eda.75.2019.08.04.05.39.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 04 Aug 2019 05:39:05 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Aug 2019 20:37:55 +0800
Message-Id: <1564922275-12877-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] license_image.bbclass: drop invalid comments
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
X-List-Received-Date: Sun, 04 Aug 2019 12:39:06 -0000

From: Ming Liu <liu.ming50@gmail.com>

These comments are not valid any more, drop them.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/license_image.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 2cfda81..3f102d0 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -198,10 +198,6 @@ def get_deployed_dependencies(d):
 
     deploy = {}
     # Get all the dependencies for the current task (rootfs).
-    # Also get EXTRA_IMAGEDEPENDS because the bootloader is
-    # usually in this var and not listed in rootfs.
-    # At last, get the dependencies from boot classes because
-    # it might contain the bootloader.
     taskdata = d.getVar("BB_TASKDEPDATA", False)
     depends = list(set([dep[0] for dep
                     in list(taskdata.values())
-- 
2.7.4


