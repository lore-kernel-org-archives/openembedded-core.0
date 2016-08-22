Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADA070016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:18:37 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id q128so120621858wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=R3DFFZdfiz5E36Uv2SBFLRqvGHJDaV3lsRfeDTpDQec=;
	b=ii+NPr2rKKLC2nw4tRdee4aKHdPRcoVhklUenpVDm2ZHTwTY4GNFOUVYLvkurEg+Oo
	aw8yA1T/5cqW+vpzxvi03FS5+g+VbASO9TKqx5W1E4W2wifzcq/2Kp1ZwCmxS1OtmskR
	HnEShUtxkJ/gFntnIelWz40vxKE75s3wy8eznyVUz7/ZWuspDkZ7JBljJk9K+x0MhEr8
	eWZ0J5hd3kaugRSk7o7y15L3GAf562rQI2Mqzawt1XfC8PgyDe+Q8/zc4lAcF5QlAbx6
	PRnw4muG1R6cMWL42CXgKaK7RaLzxEHaFNVYjeWoR8BnUzbdwkoQh7kS7AJcHxIOikrR
	G/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=R3DFFZdfiz5E36Uv2SBFLRqvGHJDaV3lsRfeDTpDQec=;
	b=YHZD2ko5Vdd0eQzgGncRJcF35L+v7By7aPA3Jy0wwNiktlGerMndx63bJI+Ni/lFzY
	TZ1dVBIN9rBbv/x6bXlj6IiNLrvmcWGOZsZB3TW8V2UGtZFJUVT+IjONvS4KUTCng3tM
	NUGNJAM7YblRRCRPxhogikTYs8BxhsnSRzHb/1sbr8rcmjrOQFUSCdVsSeGk0mZR3nS1
	tECGsrGLFYYCiTte8GjX5LgC//qH//0LM3+tv6Q4okfaccgviTquAYcXS2nNbPpgdvFd
	3SG5eFTS+vlMgVeJxy7p9kjcpE7uZ1nH8bowSkN57APRYUkIsqO1ZtTVYhLM2Liqq0H/
	PAeA==
X-Gm-Message-State: AEkoout4OAEHi9zL34c0L+9zVHajSt6DYlnCcCukmZ5fl7ivKYp9Z9eXCx1k+11WZ5vYwnSD
X-Received: by 10.28.56.3 with SMTP id f3mr14576283wma.59.1471871917747;
	Mon, 22 Aug 2016 06:18:37 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm21383601wmk.13.2016.08.22.06.18.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 06:18:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 14:18:33 +0100
Message-Id: <1471871913-24095-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1471871913-24095-1-git-send-email-ross.burton@intel.com>
References: <1471871913-24095-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] xorg-proto: remove stale git recipes
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
X-List-Received-Date: Mon, 22 Aug 2016 13:18:38 -0000

These two recipes are old and unmaintained, so remove them to avoid confusion
with the tarball recipes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-proto/dri2proto_git.bb  | 18 ------------------
 meta/recipes-graphics/xorg-proto/inputproto_git.bb | 19 -------------------
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-proto/dri2proto_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/inputproto_git.bb

diff --git a/meta/recipes-graphics/xorg-proto/dri2proto_git.bb b/meta/recipes-graphics/xorg-proto/dri2proto_git.bb
deleted file mode 100644
index 9074f48..0000000
--- a/meta/recipes-graphics/xorg-proto/dri2proto_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "DRI2: Direct Rendering Infrastructure 2 headers"
-
-DESCRIPTION = "This package provides the wire protocol for the Direct \
-Rendering Ifnrastructure 2.  DIR is required for may hardware \
-accelerated OpenGL drivers."
-
-SRCREV = "66c56ab10d917e3f47f93178d7eac6430970d3c4"
-PV = "1.99.3+git${SRCPV}"
-PR = "r2"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/dri2proto"
-
-LIC_FILES_CHKSUM="file://COPYING;md5=2e396fa91834f8786032cad2da5638f3"
-
-S = "${WORKDIR}/git"
-
diff --git a/meta/recipes-graphics/xorg-proto/inputproto_git.bb b/meta/recipes-graphics/xorg-proto/inputproto_git.bb
deleted file mode 100644
index 6520f3b..0000000
--- a/meta/recipes-graphics/xorg-proto/inputproto_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XI: X Input extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X Input \
-extension.  The extension supports input devices other then the core X \
-keyboard and pointer."
-
-PR = "r1"
-PE = "1"
-SRCREV = "7203036522ba9d4b224d282d6afc2d0b947711ee"
-PV = "1.9.99.12+git${SRCPV}"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/inputproto"
-S = "${WORKDIR}/git"
-
-inherit gettext
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.8.1


