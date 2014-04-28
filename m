Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id BD28F65EC0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 06:26:34 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id pn19so4699237lab.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 23:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2KgVn8tyrYADAB0KVfmQv8yoCXBconeLLvYRft7WKxo=;
	b=M3juwmJxR3LWWF9/YsyPfQSO52DxLJWcTqX/yoJ2TMv+JJ+Q7tMtR0kxd4jKWF3dlK
	xw2hNwpOSa9vigh8H/RS7T9Q7OKiHYLC3+W8OV7vrz1r8tfpEI0treE9xYZcAnCDORg5
	24mNmmWm6D4UD88yjZwcw29lfWV5yzR7+M6PIj+pfQqnNklyq5UqVO2NkCwpHJ5yPY9F
	ZoKt5Gk2XL7ETMUaa9nOu8JHdUsFB53ayQG60ZOiD9fMS0JSBNrY/vaHtmyGvmNXJTAf
	lcha/HbreGnH4on119vPfwTN7agiXXQA1oCcaO/8VTNuo1kpHRxQHrbcoPf467dqIIwO
	NXwQ==
X-Gm-Message-State: ALoCoQkChsHFFQM0rMF9IrgLvZTJR6sXssIy+PFezx9nSe5yAy113fW+8dDVJ3pXRsPi32VjsYZf
X-Received: by 10.152.42.230 with SMTP id r6mr806904lal.32.1398666394860;
	Sun, 27 Apr 2014 23:26:34 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id r5sm17826699lbb.7.2014.04.27.23.26.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 27 Apr 2014 23:26:34 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Apr 2014 09:26:31 +0300
Message-Id: <1398666391-9262-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH 1/1] grub git: update to latest git (grub-2.02-beta2-81-g4b8b913)
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
X-List-Received-Date: Mon, 28 Apr 2014 06:26:38 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-bsp/grub/grub_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 114cf77..fed05b6 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -17,7 +17,7 @@ DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_arm = "1"
 
 PV = "2.00+${SRCPV}"
-SRCREV = "0776112c5311196889a15058a3b1be4c81ba5e05"
+SRCREV = "4b8b9135f1676924a8458da528d264bbc7bbb301"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
            file://40_custom \
            file://autogen.sh-exclude-pc.patch \
-- 
1.9.2


