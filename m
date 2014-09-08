Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id EC768713C1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:16 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id y10so1003264wgg.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=w1v3TQwAaZ7jat2FBjCkwREd8RIDf/aWWMO+MHnMCSg=;
	b=B2AdbbhY1evr/TSSfCQv8Bi6/W0lvWOX1CWhusNfVsQSQjns/BmPe2u8Tn4fDFLDwb
	QwNNA9+GIZCqNoa7GUrWkQ4PBdTRuxkCqb7wSUKMGev5Cin+iQxb5sobTJRSVJpq7GE0
	H1Dj1KjgPlF4LXe8xu+mXUHn9ifmbQ+zLuNCBM5Apyh9O5Pef8oemXZMsYb9indZRLnQ
	bOfc/baoFI2W5M4cIBfuW9mlxGQdC0679SArw7uz+9Os8HwA2gLFA8Fm23rmbZ5W9YWl
	GgPFBFk8EIXwYWo17VVG9YudPOjT0wmQxzlOEsGwMUj20+YAgQk6QwTRQLu4SUdtEt06
	uucQ==
X-Gm-Message-State: ALoCoQk5MrDj11VflXB60nnlWbk7cgx29ThUhGZCKu26F5A8W2NGUr98eJ/fAn0nye1ZvIThUxiM
X-Received: by 10.194.203.8 with SMTP id km8mr34390268wjc.51.1410177557537;
	Mon, 08 Sep 2014 04:59:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:37 +0100
Message-Id: <3f18f6af112e92bc67e342dd1c649e9693ae5943.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 19/27] systemd: Adding RRECOMMENDS for os-release
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:20 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

Systemd depends on the os-release hence adding
RRECOMMENDS for the systemd package.

[ RB - updated for 216 ]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_216.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index a7fd71e..b941853 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -270,7 +270,7 @@ RDEPENDS_${PN} += "volatile-binds"
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
                       util-linux-agetty \
                       util-linux-fsck e2fsprogs-e2fsck \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 os-release \
 "
 
 PACKAGES =+ "udev-dbg udev udev-hwdb"
-- 
1.7.10.4


