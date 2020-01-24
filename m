Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BBAB87FC00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 11:07:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c84so425247wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 03:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tOU65J7YYEvNrlghIhPYZlY5FVCnVRWmJRDL3p2NQXc=;
	b=l4NGYClGMd1drY2Pvh5prXp7i0FcMJJNu5HuDBss8Yk5YmzQmwpOOdm3rbQIQrymet
	OiJOe4uOlCJ8McZsvPEj4Stq8ZRfk0ojpvPSo3SjqMhCIUB5OrsFv4gfRRUU/Td70BA+
	rzaopJi5vY4e0uAjiWNEhHWrukcoYkAuDtVMhQBofUrvrl6spozVP+99mkALF1wovTuc
	MtD6WYsYuBaMVX8bS4bDK35igc7nvtEMlQ3+9eLr4dS3rk8TPUYxZapGnIBDlC4uk9x7
	412t8LIzR9h5TaJpR5DzkppzJDnYJm1PzfofXalXJPoHW2Fcbrbo1lTBy+5JERF1oqlx
	IXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tOU65J7YYEvNrlghIhPYZlY5FVCnVRWmJRDL3p2NQXc=;
	b=ajxnHlEd7BqN+//FJQEubChhG0DLFYZevCvfNFTciBtqdz93xdsowYaIW6uDa2RhHy
	ot8R6JisEcGHiA9zfpTkiElOAgBmCe6mNkTTgNTByEFmBdBA2VxwL3nyGlww3othEjIu
	qiXLDSIXoo8NGV89bJ2GKc7CAqXUfzNiYOjR93Uqswmzs9mc+0lIWy2zpN6JVUiXDh82
	GJDy06rfoafngCRqrivkHfEuo3OyPhPWuRpdKb0is4oo56dqJ8RTTRra9cHy4mO+Um0W
	MTMvvclTgOQ489g82n0E6wtlhET8LPL4KnO+6tJUG2r7cAyvGe1wJltzGhcbpGpDghyu
	+W8g==
X-Gm-Message-State: APjAAAXuFPlvmRy8c0G4C+6ntHIw1tTb/fdvsNEESxK36PqfcyQhks3p
	ZOT3LfpfBGy+wik8w5zaNsrBVFsKJ6A=
X-Google-Smtp-Source: APXvYqzYi6XckDAyJ3P4R7yEZAun5wqMjes9yaMNLDOdX084nixEUrS1AZ1hBUMe6Zk6QcUmjCvD+w==
X-Received: by 2002:a1c:7717:: with SMTP id t23mr2992968wmi.17.1579864053118; 
	Fri, 24 Jan 2020 03:07:33 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a14sm7682154wrx.81.2020.01.24.03.07.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 03:07:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 11:07:28 +0000
Message-Id: <20200124110728.3728-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] packagegroup-base: only pull in dosfstools if licensing allows
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
X-List-Received-Date: Fri, 24 Jan 2020 11:07:33 -0000
Content-Transfer-Encoding: 8bit

packagegroup-base-vfat RRECOMMENDS on dosfstools, but this is GPLv3 so
may be blacklisted.  Respect INCOMPATIBLE_LICENSE and don't recommend if
GPL-3.0 has been blacklisted.

(From OE-Core rev: de780ebf76893db43e1a55c54b0c5fbb7537880c)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 1f802da09b7..3910500325d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -168,7 +168,7 @@ RRECOMMENDS_packagegroup-base-vfat = "\
     kernel-module-vfat \
     kernel-module-nls-iso8859-1 \
     kernel-module-nls-cp437 \
-    dosfstools"
+    ${@incompatible_license_contains("GPL-3.0", "", "dosfstools", d)}"
 
 SUMMARY_packagegroup-base-alsa = "ALSA sound support"
 RDEPENDS_packagegroup-base-alsa = "\
-- 
2.20.1


