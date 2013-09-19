Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0B50460135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:46:12 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id ep20so7074934lab.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=npDutnkr9B69niYdKh8COY8jNi8hKzCPNt0Dq1CbAi0=;
	b=HqjlodaUlADpBxJ6zk/emBXHleswvtRGeS1mKgDYa11QzVgpci6FYZCPhCdniz86Ee
	t/c4nasHjFfWIQJv/MH0eNmXT4xSwAUTFyj/8uXmJXHu7TGns0NharcdVy1Cp/j3jo+u
	Q23ardXgkzGLC6MnVVDz78OVjYmc85MvFxhbRKdUGsILRwVTTXV0iGcALKgxw18SojXX
	ZdAG7QYhzu6xPKEc7mePGhv8lQX4kkBIE6TyqMObz7zIoES+OauTJBdnXSfFH3kj0/Q7
	uF7BsMHK2/TFdA0xzKKXNpYZxgJ390Avcup9fgG80+qALT7f3ThkOl1akmgrao6CDATW
	eNHA==
X-Received: by 10.112.72.229 with SMTP id g5mr1929194lbv.10.1379598373650;
	Thu, 19 Sep 2013 06:46:13 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id ao4sm3608279lac.1.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 06:46:10 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id BEC344014A3; Thu, 19 Sep 2013 15:46:03 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 15:45:25 +0200
Message-Id: <1379598325-23165-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] Add makedevs to nativesdk, which can later allow creation of a small script which allows users of the toolchain tarball to create a custom rootfs from a package feed, using pseudo & makedevs.
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
X-List-Received-Date: Thu, 19 Sep 2013 13:46:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/makedevs/makedevs_1.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
index 2b9fd37..e6860f0 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
@@ -19,4 +19,4 @@ do_install() {
 	install -m 0755 ${S}/makedevs ${D}${base_sbindir}/makedevs
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


