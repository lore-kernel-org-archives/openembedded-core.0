Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 164A460959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 10:53:09 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id a12so1085221wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=mKDs5NNjsuQp9yrPzOC+ylJIE3v2uZRWZ9/QskdSWLg=;
	b=VnRy7cfLBVD2NkbE+uWZfCpOl8x1Lg0z5C49fy9dnSpqDT/EBD14okA8sq6i7VUcld
	04jX1bqqbuafXmYSEo0poeBiAoBAUHePMjZLEWZ9jWvHeaFnCIg69I59kWhbZ7BydwMV
	vH5mBjuPnhcRgUOr/NM0SvXWacoi4HI7qMw3WZ3sRlt/pDCcVmKpvqbV2HL+IiWZzXdg
	3Ur+lyeZKKGRoxyEGD5Jw4sR/RFUA34JJb7RC/JQW7S3fAOIvN1pW+JbQ8SUx7XXICl9
	qK0Bn+2+zsZmLHxO01wQQmHHLGHm2yqFLyE77cqTpB8vM2HfXCAgSChEvq3sw2ZQCNOA
	AFrQ==
X-Received: by 10.194.77.66 with SMTP id q2mr8819621wjw.34.1369997590524;
	Fri, 31 May 2013 03:53:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id cw8sm3068766wib.7.2013.05.31.03.53.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 03:53:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 11:49:51 +0100
Message-Id: <1369997391-28957-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369997391-28957-1-git-send-email-ross.burton@intel.com>
References: <1369997391-28957-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmgRIMFmkAd/h2s/PhlChroZon367lw05sDNqn63V0FiwofGLJ6mf+Bt2N62omdqTqvEguu
Subject: [PATCH 2/2] mesa: update git recipe to 9.1.3 release
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
X-List-Received-Date: Fri, 31 May 2013 10:53:10 -0000

It's not bleeding edge but it's better than the previous pre-9.1 commit.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-git.inc |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index ee9a552..aa2f2c3 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -1,11 +1,12 @@
-# Current pre-9.1 commit
-SRCREV = "1665af3066f3d58c42e9d5b13098f13615a7672c"
-PV = "9.1~git${SRCPV}"
+# 9.1.3 commit
+SRCREV = "f32ec82a8cfcabc5b7596796f36afe7986651f02"
+PV = "9.1.3~git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555d"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://0002-cross-compile.patch \
+           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
+           file://fix-glsl-cross.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


