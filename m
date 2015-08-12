Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 037FE76538
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 14:00:28 +0000 (UTC)
Received: by labd1 with SMTP id d1so9623410lab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=kWq9dRrnKHaw0ONtUgFZqZtvrn9/BsiMW7WxeS6PTcE=;
	b=ZMwXiqHVdvROlnLXPkYz7dBLAgoOeIRGzYLNTpWqj5mPhU4rUXiKqr2ndVI09GmDoP
	afD7peXATt3acpeqWdMo6mLGpfPo0n1083BguJJGGdzYyMKZHRrJwYIxuuYBQH2Exm9+
	++Ee5WJP8GLa3oI4JiMG2/XiP+sYALH7Ti2YdDkPmHiHNLT2D+bJJ0QehduwuYAqthIb
	UHySjBcBy3Ej0s1sglCXqrhInmpkHx9WFAsGyfrRyNodzNQkbyeNjcC2zKZxgSZTawqN
	dBG4ySQE9010JR/KpIusFEfANPKDnMpGYDwkPOdCtpWnkHnFVL8QbzqjJMzuUFI/dOUT
	Pozw==
X-Received: by 10.112.163.226 with SMTP id yl2mr32214898lbb.100.1439388027569; 
	Wed, 12 Aug 2015 07:00:27 -0700 (PDT)
Received: from umbar.auriga.ru (cl-1614.mbx-01.si.sixxs.net.
	[2001:15c0:65ff:64d::2])
	by smtp.gmail.com with ESMTPSA id r4sm1243490lag.46.2015.08.12.07.00.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Aug 2015 07:00:26 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 17:00:23 +0300
Message-Id: <1439388023-18125-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH][RESEND] adt-installer: use DEPLOY_DIR in ANT_DEPLOY expansion
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
X-List-Received-Date: Wed, 12 Aug 2015 14:00:31 -0000

Currently adt-installer uses "${TMPDIR}/deploy/sdk/" as a deployment dir.
This doesn't interact well with DEPLOY_DIR reassignment. So let's use
"${DEPLOY_DIR}/sdk/" instead.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-devtools/installer/adt-installer_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index c871e42..346fd9e 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -33,7 +33,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 PR = "r11"
 
-ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
+ADT_DEPLOY = "${DEPLOY_DIR}/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
 S = "${WORKDIR}/opkg-${PV}"
 
-- 
2.5.0


