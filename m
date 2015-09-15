Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id DC0A56E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 05:23:00 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so11465376wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 22:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=0QN3ArGcVbG/NS6Fi943iHErU1j9sOiIlsbkJ0kuejU=;
	b=VEtmwAG1VGonXsxI9t8CG9S2k/FcwhnK48UQEAt3GfMNl+/EpawC6jV5FBJaNQ0m7D
	m6xf1uRencE9j1GYX5Ans5E/xyVVgLqjFvnfFaFSGLHCDZqWPKiCvI/Aac9Ov/OAFWqN
	lbhWr+Fb5g9PB++T6baRF0SU6ydWfgxJg1L4wOeOq5wDOS216sj69aJtRlNfgnYJ/qet
	bwlitYt1uvQJsCY/5tMfWZs0jS3nlw6qN/cGVzKRDdlT0crXzmni9Qk+MEAkH6h2hfzy
	7NbVDPLtJTe9eU6gBKNcr2aAxTiPynib675Hllbr2C9MBorqIJHl223tCmKOGYZABPKL
	Xrqg==
X-Received: by 10.194.23.167 with SMTP id n7mr34368991wjf.112.1442294579906;
	Mon, 14 Sep 2015 22:22:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ft3sm17762626wib.17.2015.09.14.22.22.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Sep 2015 22:22:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 07:23:03 +0200
Message-Id: <1442294583-6169-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <20150915051727.GC2380@jama>
References: <20150915051727.GC2380@jama>
MIME-Version: 1.0
Subject: [PATCH] systemd: fix missing space in SRC_URI append
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
X-List-Received-Date: Tue, 15 Sep 2015 05:23:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it was introduced in:
  commit 5196d7bacaef1076c361adaa2867be31759c1b52
  Author: AnÃ­bal LimÃ³n <anibal.limon@linux.intel.com>
  Date:   Fri Aug 28 11:15:01 2015 -0500
  Subject: systemd: Increase devices timeout in QEMU machines to avoid failures on serial-getty

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 6ac99cd..f7d4c7d 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -46,7 +46,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://init \
            file://run-ptest \
           "
-SRC_URI_append_qemuall = "file://qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch"
+SRC_URI_append_qemuall = " file://qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.5.1


