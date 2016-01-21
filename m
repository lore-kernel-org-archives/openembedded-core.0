Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id CE1886FF6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:21:08 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b14so65342799wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 23:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=pH75/16+Kak+zjeP0Swjfgl2DUALKCPAtf5hMM+TEqI=;
	b=SQjH1JuxhVWA8DHNGQEB+XzC7+r0sDDXujMXl2SKKoecPawGWBrc5bCtXsLR13oMXV
	wbeLYMQjfACGoGTArsqWuN+zMDuyBblZhDpdhq2zoeCXPNfHOpbjOPx9KzLyoF5bZZFE
	bYGOxPcJ/Po28EkrI7kbACrb+LN+bzz5eQTgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pH75/16+Kak+zjeP0Swjfgl2DUALKCPAtf5hMM+TEqI=;
	b=DnSoqK0hiiWB0d0kAp38t2MvALD0KMibfug1dsZsiAsTc501IaVM9BmoeCECXQLJt6
	0rIlmNEzZy20yhLe/LJOdfQ101+fJa27qNWZbyDMDzgkNI2XYq2loVILk/FN8U73ngt4
	qvpCXQm0039RrK0dBjXyb0CNpzz1A2Ca4QFKbQONgJfuU+XidtMD2lA+z2IzcLTaLolZ
	v4lQL1ZtkNzvOl4rOFKGQsi+6JzC8begt9+ALTiubU1MHsC5DICuMMkGhcDKebFq1BMc
	eT7wKCXWidEIfkR3yoVL5sm6eTbChiiVTYLViAbdUrZiL8/Zx6pLTqmbqireBH+AEIiD
	s5tQ==
X-Gm-Message-State: AG10YORBtZJEJFokmwFPGLAUrMD7o/E0+WP0QSCBv2jaZBwS6eayZJYHzwjqMJf5J9FAVnzO
X-Received: by 10.28.90.133 with SMTP id o127mr8839178wmb.101.1453360868644;
	Wed, 20 Jan 2016 23:21:08 -0800 (PST)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by smtp.gmail.com with ESMTPSA id
	df10sm36522484wjb.44.2016.01.20.23.21.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jan 2016 23:21:07 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 08:20:59 +0100
Message-Id: <1453360859-16992-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] e2fsprogs: disable libblkid again
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
X-List-Received-Date: Thu, 21 Jan 2016 07:21:10 -0000

We use the util-linux one and do_install deletes it anyway.

See OE-core commit fb8e776ea91c39d586b46400ad30aeea8dead1c4 for more info.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
index c82e99a..f244473 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
@@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
                 --enable-elf-shlibs --disable-libuuid --disable-uuidd \
-                --enable-libblkid --enable-verbose-makecmds"
+                --disable-libblkid --enable-verbose-makecmds"
 
 EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir} --enable-bsd-shlibs"
 
-- 
2.4.3


