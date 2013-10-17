Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7C7596CFE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:06 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id ec20so1850270lab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=+/MMJhKdwagRw14RMzwBm3Bqj8Q4ZkTLJhtcuVGdSQM=;
	b=pXch5+G8uJOr1J7M15SB7i9elD16nxcfb6VaxU1lsYWsvOvPVI7SR8QPUMIPczGrW7
	RZWdtlQaBvNOBlap5VIjM3rC33vi+sB/pwQqFPzbq1nVqyB51DSg8K1K+FSMRJ61qE2w
	dM1pPgoeigAJrs72FuEJAPZlRl3+cNkTLZx+U5hA9O2fdSLM/+vPLzjC+yf8p1vLibF2
	mvvMtPTFi1R/gWAhMmhClZH+HLC6luvatmXYA1BFUdjFWuszHBKJongAD34fuKOaBKA/
	BA3tfes+dvIUXuBSg5SketKFX+FA0QINfJRWbhrGVrJ26Aqby45l1AlI4Z9lZSOh2jcR
	HHwQ==
X-Received: by 10.112.14.3 with SMTP id l3mr7345134lbc.27.1382018407533;
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id b6sm74847616lae.0.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:06 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 05606400F31; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:37 +0200
Message-Id: <1382018386-25389-3-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] icu: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-support/icu/icu.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index e3944cd..c592f85 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -19,6 +19,7 @@ inherit autotools pkgconfig binconfig
 # into consideration, the native build directory needs to be staged.
 EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_class-native = ""
+EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 
 # ICU puts custom m4 autoconf functions in aclocal.m4.
 # However, this file is deleted in our build system. 
@@ -51,5 +52,5 @@ FILES_libiculx = "${libdir}/libiculx.so.*"
 FILES_libicutu = "${libdir}/libicutu.so.*"
 FILES_libicuio = "${libdir}/libicuio.so.*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
-- 
1.8.3.2


