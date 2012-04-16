Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SJsvY-00055f-Rp
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 22:53:37 +0200
Received: by mail-ob0-f175.google.com with SMTP id eq6so1435981obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 13:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CgcPMoFzZI3QX28JWFK1yE9keg8r9y2gSCDJXO/cv2A=;
	b=nhDm8iqZ3CD3EVviK6+v93KmrUvpbdhog53zF0dyYmAGnb4IFttydxEJSk7845Os36
	XoRejJ1KA+A/qZxT0tzNJS/qQqO3mVJhfb9JD+gAOyq4nu+bwI2VPz2+SL9XHiNt3KGT
	PHlzvC4ZGQ/M3JGkkC9/toN5yHnXo8h9MhNDYKPlw8LlpN/MHr3iq4ojVpEIsH/xIpKy
	jwraEq8ajWAhi8EVhWV3kWiEZQHp0tI9cTdQbMrMvNjQO9Z07Xh8LMgEzSmXBSK3kZRB
	QnYlwyoeBU12xoLdJdSRbP03IdY1e1rOJBDeWZ58MitVjyPxyWspN+kBMZ1D43wICZpS
	bh+Q==
Received: by 10.182.89.39 with SMTP id bl7mr17749645obb.65.1334609053599;
	Mon, 16 Apr 2012 13:44:13 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id hh2sm20659762obb.1.2012.04.16.13.44.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 13:44:13 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 15:44:01 -0500
Message-Id: <c1bfa3bdc3bb5f58a95c11e8c970ac49e1bcf150.1334608810.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
References: <ce2d88eb2d575a0459aa2c7cf725b6f890909515.1334608810.git.kergoth@gmail.com>
In-Reply-To: <cover.1334608810.git.kergoth@gmail.com>
References: <cover.1334608810.git.kergoth@gmail.com>
Subject: [PATCH 4/7] tcmode-external-csl: use the existing precompiled locale files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 20:53:37 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 1fc366c..3b54e35 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -35,6 +35,10 @@ PREFERRED_PROVIDER_virtual/libiconv = "external-csl-toolchain"
 PREFERRED_PROVIDER_glibc-thread-db = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
 
+# No need to re-compile the locale files
+GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
+ENABLE_BINARY_LOCALE_GENERATION = ""
+
 TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include "
 TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib "
 
-- 
1.7.7



