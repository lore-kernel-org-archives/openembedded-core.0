Received: from mail-qa0-f48.google.com ([209.85.216.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1STyXB-00045c-If
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 18:54:09 +0200
Received: by qady23 with SMTP id y23so4219756qad.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 09:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=N/cpXe0MWWn1bBS2H8uFt+Z5d7lS8lUqpqjwi0ICZhw=;
	b=hm22TqQmksRfgUO6xA6HKXdCdGTaTTWywGW3+EL9SB5DRV+114kzNG8n4laO2XojtO
	aUGyXZuj8/9fnXGJM7Rsxu0pPIt3yK1NNyT7Ic7vjNJr+hvKeILb3ZlSUYXzfEXVgv5t
	u4Ml1FGyaOoSA4zcCSstAWfr+uy/1Y8391NfyLHmSvKEGR9QRs3O9AGgffupQZjuhNfH
	BOLEXSTBUKl0oymb10w5t56LEWmXRQtmVvTntRE1pSQajzP+2F3FpAMVOB680wOtbe4j
	+QOaQynNH1yxzv5RZYP8k/xrGc5k7k0skrk3oQY1UEpLVY+Yqnj706oW43Da249yuehv
	SO5Q==
Received: by 10.60.24.164 with SMTP id v4mr12488127oef.51.1337013850145;
	Mon, 14 May 2012 09:44:10 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs8sm8863380obb.14.2012.05.14.09.44.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 09:44:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2012 11:45:02 -0500
Message-Id: <a4098ec999cef8c4e68427dbd3419f1983a4fc39.1337013858.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1337013858.git.chris_larson@mentor.com>
References: <cover.1337013858.git.chris_larson@mentor.com>
In-Reply-To: <cover.1337013858.git.chris_larson@mentor.com>
References: <cover.1337013858.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] tcmode-external-csl: drop unnecessary cppflags/ldflags
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
X-List-Received-Date: Mon, 14 May 2012 16:54:09 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 3b54e35..0a48658 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -39,9 +39,6 @@ PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
 GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
 ENABLE_BINARY_LOCALE_GENERATION = ""
 
-TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include "
-TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib "
-
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
 
 # Translate to CodeSourcery's names for their optimized files in the toolchain
-- 
1.7.7



