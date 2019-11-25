Return-Path: <kergoth@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2CB7FCB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 22:12:21 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id o14so7266657pjr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 14:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OvnY4itonGGoPoazzoqqeH6SXoTGEnPzwRTcpW+nQw8=;
	b=BTLP38CxF9fCr1ANe3YXHYfl+HxUjjrvbPNa3emrKUMA7womHXX+QxBQMBPaOuA0Nn
	gEuVKJpOAe16TPkGiAETZ/D+AIkc4RppEZQZr82d0dC5xOPz1Ex03x9uNq35shnYLR/D
	kwoD63xlm8ZvxsdwIxHs3HRPrvHBhO8RhwTyOVAzv3CsT0IKcMUNqTgjmg9j1y5HY41r
	5f+558C/2ZYqNQUyagFdPWKIAtZ/C46Aiq8tmU1P5rWop+4DLq9jKq+A9fQPo/DA0xBE
	gPPeL6x4ILymKPEi992UZqdI9Fi7RipjSjuN9EkeghwEvCYZgkPMr253m5AeMYQ2p34h
	Z0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OvnY4itonGGoPoazzoqqeH6SXoTGEnPzwRTcpW+nQw8=;
	b=U0hJLMhB8VeXaBXD0MhfrpYQ7mvCzgwiA50/qGjMWdBWVktTz7Cv2ThpQ95vEOsUvn
	/+etmi+sQUEGLr6BlK6GC96RfbsiAttpNBcFiH/jskkek/RVKBPob+BogDe8PCTtljMM
	2olsLnJTMtzE0g8LQzK8pEOo+14ZLAXasAJKH6J/thWOqbin2JY8y/CHpZpskiTGtJzV
	LH5K/SZGAoyViAIxwaihsY/OpT6s0qKFFJ3/PvFao833FiVuvCeyGebR8LbD5A2W299G
	THXza94TXg/5OufdAeD8atZMNLbWoLATWBOFeFEan6HMpreXbyDvlVLA6gqA5/F8jhd/
	Ejpw==
X-Gm-Message-State: APjAAAW6tYKea+juttxjpvuu2Iv3W6gjG1hBqPntMAqOO8PSxHhUdz9p
	4sStQflE1+z1LImNT9ajCwodhkSVlzw=
X-Google-Smtp-Source: APXvYqzjr1bC+N62IhVK1fdI9f3GiTz5ir/FsEm4JU7K1i06JJky0AENAuikB+503PTl5awnYWn0TQ==
X-Received: by 2002:a17:902:6b01:: with SMTP id
	o1mr30247801plk.24.1574719942132; 
	Mon, 25 Nov 2019 14:12:22 -0800 (PST)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id h3sm352996pji.16.2019.11.25.14.12.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Nov 2019 14:12:21 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 03:13:55 +0500
Message-Id: <20191125221357.6560-1-kergoth@gmail.com>
X-Mailer: git-send-email 2.11.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] acpica: correct flex/bison deps, add explicit m4-native dep
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
X-List-Received-Date: Mon, 25 Nov 2019 22:12:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

This project doesn't require target flex or bison, just the natives,
and it uses m4 explicitly in its configuration.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-extended/acpica/acpica_20191018.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20191018.bb b/meta/recipes-extended/acpica/acpica_20191018.bb
index 4692275762..04732bbfe3 100644
--- a/meta/recipes-extended/acpica/acpica_20191018.bb
+++ b/meta/recipes-extended/acpica/acpica_20191018.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-DEPENDS = "bison flex bison-native"
+DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
 SRC_URI[md5sum] = "539a0252bcb42c383ceeaeb12ae9a60d"
-- 
2.11.1


