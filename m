Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5919475685
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 20:17:34 +0000 (UTC)
Received: by qcej9 with SMTP id j9so9102560qce.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jun 2015 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=fRCsHFyhj0Z0/IdnblCqtRkF4VIIuJLKz/Hu4+/UAFY=;
	b=txiv8Z+NUB8BcOSWSxVmceIzlJRcB/Qt4DzVpCMv/2hGfACSfL67btuMKRYjGfKZ0m
	HYt5/cQDbqhKoBdkFR2+VmnxeUMKY+TU86IZAu+sdtblLOUi89nt8H07WEKSJBO9lvES
	wYXzNLW2acalxtZzTqxJfyJCsizZm2XxdgPw3DPCcNvcwZ0losLkzZ+0EnH82R1Sios3
	1pnt6KifO+6BqBQTg3VtvtmzCmKvZKKhYRf0E3MU9GKXj+IFlnfrKci1zfVE+wzj1zRD
	L8jOUVeqD9ClsvlsORKY2iX33i5vwenIuZxNnqDqQM36az4r4J/Tq/BWP651xlqB741t
	pVXw==
X-Received: by 10.140.34.162 with SMTP id l31mr25535292qgl.14.1433189854956;
	Mon, 01 Jun 2015 13:17:34 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-14-73.ronkva.east.verizon.net.
	[71.171.14.73])
	by mx.google.com with ESMTPSA id 80sm5728122qhr.26.2015.06.01.13.17.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jun 2015 13:17:33 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jun 2015 16:17:21 -0400
Message-Id: <1433189842-17654-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/2] packagegroup-core-sdk.bb: Drop distcc from the core-sdk.
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
X-List-Received-Date: Mon, 01 Jun 2015 20:17:36 -0000

distcc has been used in the past to speed up native compile across
several machines. This is less an issue on modern embedded systems.

Also, improvements in sdk generation have reduced the need for on target
compile of large projects.

Since the distcc packages start a daemon at boot, drop it from the
packagegroup to avoid having some slight runtime impact on systems
installing an sdk.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index a41eada..9b26387 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -23,7 +23,6 @@ RDEPENDS_packagegroup-core-sdk = "\
     findutils \
     quilt \
     less \
-    distcc \
     ldd \
     file \
     tcl"
-- 
2.1.0


