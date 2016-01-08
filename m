Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A89A0731F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 12:35:44 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f206so133429875wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+Et1c9NE7Er7JMUa0p6GF+m1CzXKGkgSESP7YwGT7Yg=;
	b=U02dRUG/tMXo9/AtBFkCmSuuK+LYWP16H9/6MA1Uuf32apyIOBqYeBU1QVFQs9vxof
	3XXvOIlM9Y87L6hkaT2dAXbjOOm8eJVg3AIX7MrXyNiN2+YARv97G2EXAiMSZabgvH3L
	9RT8B+3o2vNTCr+64TcsaQxZSQqicpNJnhnR9Ia0+z43Kt0bZhB1H6VVuyuo11G0e/JD
	cCno+vJmsDnMDjaUfz/Eztdunpj5m9B77nwe2KXTthaAzME3h9OepnSiW4qJkFvpyy2Q
	qDPFeS5JJiV8uW3qN9Jze5xM89zovbjR8NAmk1SNRlfbIA/VyLjy/MZ8XKfap4rlMMHI
	wwkQ==
X-Received: by 10.194.6.196 with SMTP id d4mr119295247wja.120.1452256544524;
	Fri, 08 Jan 2016 04:35:44 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c15sm18352605wmd.19.2016.01.08.04.35.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jan 2016 04:35:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 13:36:14 +0100
Message-Id: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][RFC] arch-armv7ve.inc: respcet armv7a override as well
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
X-List-Received-Date: Fri, 08 Jan 2016 12:35:45 -0000

* in all cases we currently have we consider armv7ve to be compatible with armv7a

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7ve.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index 79e1ef6..d0fdff7 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -3,7 +3,8 @@ DEFAULTTUNE ?= "armv7ve"
 TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
 TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
+# In all cases we currently have we consider armv7ve to be compatible with armv7a
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:armv7a:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
-- 
2.7.0


