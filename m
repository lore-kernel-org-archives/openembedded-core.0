Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ue0HD-0004wt-HA
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 11:51:40 +0200
Received: by mail-ea0-f180.google.com with SMTP id g10so3093009eak.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 02:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=aYGpqV5cKcBY7Tt3bbnBqIrMvOfuBwCAcPyiaaZa6wc=;
	b=Xz+eRW6Xo4OlUeltU6Tkt0TOBYkvkWdUWolFOJw3hyR7diSB2xgsV37ku0a3JzNxiQ
	WgmYuPeQWunzXpzal6eA+KO1XrPkQi70BPTGB76ZeGKfeFkxtVcQ33+GYjyai4hR3emT
	kY/IcsH6snbMZV6UbBQqOm/ykM+ncPHLNw2D6Dll1bcnneKjftDBKULagQTFdFX3gsV6
	zk2x9yI+9g6WEkC2eE/9YvLV97JIswTLprPFmhenMbNwIAjSS4wRLkrshP7V5ZYIrmef
	6VGaKBoFIpRum2fhlh9ieq7bxQaI3fnuy+OkLZHE7X8uYlpe+FII0PTpCHO1cpo5GuUR
	YpQA==
X-Received: by 10.14.107.200 with SMTP id o48mr73640716eeg.35.1368956001260;
	Sun, 19 May 2013 02:33:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y10sm30529340eev.3.2013.05.19.02.33.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 19 May 2013 02:33:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 May 2013 11:33:17 +0200
Message-Id: <1368955997-22347-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1368952056-26629-1-git-send-email-Martin.Jansa@gmail.com>
References: <1368952056-26629-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] pixman: temporary disable thumb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 May 2013 09:51:42 -0000

* building with thumb triggers ICE with gcc-4.8
  http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57329

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
index b1bd557..7cc5a74 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
@@ -23,6 +23,8 @@ NEON = " --disable-arm-neon "
 NEON_armv7a = " "
 NEON_armv7a-vfp-neon = " "
 
+ARM_INSTRUCTION_SET = "arm"
+
 EXTRA_OECONF = "--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
 EXTRA_OECONF_class-native = "--disable-gtk"
 
-- 
1.8.2.1



