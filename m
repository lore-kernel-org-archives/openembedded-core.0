Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5D46365F2F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 11:26:23 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x12so1232793wgg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 May 2014 04:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pQo2O5pflFW2F4BwWOnzmtk/5W4XUqhQrVSdtKT73x0=;
	b=Oh/KNNeUWpWlqbZ5dphfwwFCA0cQoLriYC/ClGYf+cgjMAjsuFt8uPU2S18fz53yGS
	xIiCdfBnOyxB5AicWF0QORAoxq6HjB5HXC4pQvGd7iPEbVG7pVlCPBujqofYQmS3lCIv
	rrWgpktIXG6E8xQh19EJG4sMXzEAUVvZWU49w9AWMOLwZ1/XhcVo86C2byWEsWWhmx81
	uS4bbL0S7R4Qk+Hkk1T7ZC6RzfmKb3wAFv6wL9cgB3MUcj8ffn2uXf+wnJHnvOU+bSX/
	m2O1mQLtPhccRoPLfgGRxx98qKZJ1XtqjvFVvaZ+PlLdml+bRZzh2folbU20CAURLlAw
	Dxvg==
X-Gm-Message-State: ALoCoQmgIDPag8Bg7iysS8uNkMp77NlhFs7Mxfx3y6XD6ULMCyaJLbMYj6b6xzigsWXzgafBfBzO
X-Received: by 10.194.84.101 with SMTP id x5mr1719235wjy.52.1399289184126;
	Mon, 05 May 2014 04:26:24 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	fi2sm17160695wic.15.2014.05.05.04.26.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 04:26:23 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 May 2014 13:26:19 +0200
Message-Id: <1399289179-5662-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] libarchive: add missing e2fsprogs dependency
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
X-List-Received-Date: Mon, 05 May 2014 11:26:26 -0000

This fixes the following build error:
	| libarchive/archive_entry.c:59:55: fatal error: ext2fs/ext2_fs.h: No such file or directory

There is no configure options to avoid this dependency.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index eedbaa7..277d8c8 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -5,6 +5,8 @@ SECTION = "devel"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
 
+DEPENDS = "e2fsprogs"
+
 PACKAGECONFIG ?= "libxml2 zlib bz2"
 
 PACKAGECONFIG_append_class-target = "\
-- 
1.9.0


