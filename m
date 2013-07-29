Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 163486B437
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 14:40:10 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id j13so4892490wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 07:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=3q/yV5xC4d88Sd7dYVWgQSuH3f8QWEkFCLA3Fq+D6FY=;
	b=aPwqCrf7rd2YC7h9n4yQO6az2p/kN0hn4xqcHWpiOY83JvhEYhNhEFRxMv1hYF+iho
	kGZBGCc0218Knlz7my2OGbZGdUnnuQUYi6Vqd2OHrXclNgc6Ag8Vr9G/Zf4ZXkZgi5SE
	JYu2IKsWr3XgCtyL5Lqpd5lejVMKeZz2Zi9cHGkT7clxaCZsdwVGjMFxHpoofHmjd12r
	pILhwJmA4eOOb1zlIWqPpNXB/0JVxI0gVWySTG5mC+fknsfSr4xM5CDGCVqHnI/gNBFB
	n+CRjxirj7T2yKnK5Jsvvc6kNBC4yf7FO6epsakCLSsoYSBapL/PCtmIdMSCSVEwCrAi
	zNrg==
X-Received: by 10.180.11.146 with SMTP id q18mr7393825wib.50.1375108810925;
	Mon, 29 Jul 2013 07:40:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	nb12sm22971093wic.3.2013.07.29.07.40.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 07:40:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 15:40:06 +0100
Message-Id: <1375108806-9377-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmXtYZiJudCbPqCQNmYi4LB9lg5Ft0DzvFcwBme/6zSOU/Gp2Zum+2As+IbOS39wt3FBl2p
Subject: [PATCH] v86d: mark as compatible with all x86, not just qemux86
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
X-List-Received-Date: Mon, 29 Jul 2013 14:40:11 -0000

This package isn't specific to qemux86 but all x86 machines that are using the
userspace VESA framebuffer kernel driver.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 2dbfbb5..bce4f4e 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -17,7 +17,7 @@ SRC_URI[md5sum] = "51c792ba7b874ad8c43f0d3da4cfabe0"
 SRC_URI[sha256sum] = "634964ae18ef68c8493add2ce150e3b4502badeb0d9194b4bd81241d25e6735c"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "(qemux86)"
+COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 INITSCRIPT_NAME = "fbsetup"
 INITSCRIPT_PARAMS = "start 0 S ."
-- 
1.7.10.4


