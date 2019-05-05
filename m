Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 84C887D434
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 20:18:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44xxyG4MFlz4x
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 22:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557087494;
	bh=V7XxWkGCwN1Hl01QytV2YGq/8Rz7WC6rTuQ/9nOTj68=;
	h=From:To:Subject:Date:From;
	b=E5gH7HeEZDpPwpP8lJH7H6i2t4GC1z9Vg7rgIwsNnRXrSWTeo3QkMkz9XEPl9C5P8
	xdTATzbvp9erd0XljjhbnKBmkr0wDBIgFM2Fp0DEG7HrXegtjC32UWOiRw9jSy8VZ1
	17RSIxZpYp/NdJird5hDz9H3yeqJdLxTIvdVuKN/7wdg0NUQ8SNBOeedRwq7qalgXd
	NiTxAE5cw0LxubOJivFHyhQ2KL/bNDc+Oc8iBVsbFsGtuC6RmhW83MYQyFO18dH/Az
	718y5u9R5T1Xe+yWOLoggSIzOvUDcp8JkM0X6F5dmqp3gwFY50y1Tjr8aH0/tdLWE3
	cBSgc5Zz0csvU6yMJ1mLureLjdwPAiOJ7ZyljwjtKt72bVOH1bqacGxKHkEEeZCWSz
	bOmHgHP5q8Tns/aP08rKad3o+ulzjXUvZQyjj1XSraG6yGQli4jf3DbqSJXY4tNwHu
	JgCfEmWmWm7gJ2WMIf0sryv9ai7llfzGwSwNVOSpuxlztjQRymaz9Nn2XusoijA35R
	qCc0XzWsi9vWzLC7WQ7wNpoPUvXNYs/n5qHmaqSoZRcnnU5alebwA8t2tjA0tP8RVO
	mwq2RqX2At6ModHotf0Ri0Spnhy91PKt/a2cgtEfmDEv4GR6majV9jixcvQC+vBz/2
	kMOzF5ka1+S5OQhLPHUecsiw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 23:18:12 +0300
Message-Id: <20190505201813.28881-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libxcrypt: Stop adding -std=gnu99 to CPPFLAGS
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
X-List-Received-Date: Sun, 05 May 2019 20:18:14 -0000

Upstream now adds this automatically when required.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
index e3c87b3e02..b44c07b4d0 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
@@ -25,7 +25,7 @@ FILES_${PN} = "${libdir}/libcrypt*.so.* \
 
 S = "${WORKDIR}/git"
 
-BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
+BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error=missing-attributes"
 CPPFLAGS_append_class-nativesdk = " -Wno-error=missing-attributes"
 
-- 
2.17.1


