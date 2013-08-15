Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id A024C62176
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 06:03:15 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so423594pde.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 23:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xprEhnhUsu91L9EMMJqSMCv7yaFUWb/cTlM0BFAgvnw=;
	b=qy6LNgQe0Lh1AwPh/LwfLEuiFIyq/LYWXjQ+WutEQ7676yDkij69qWzLpZ9Mrh03Vp
	bdC2eL0OskXaeni+gfWps7eoK7HaUgMcMxLsPhOOfX612AASmpcYM1erE8au8odAxzjt
	qS3grDpqTH+Y3sXb3Wkt6Jhgm1VrF8eK6ADZVwNpkprB9dbwqBxYvo6TQM37tt+LcCzK
	Zz+SKxDea1PPactyHXl/G1s5BuvSeDkNBJbtfM/+voIjm5m0feS4axeHc2OKGJ/2SrFa
	Rvaag0VzgnOBOhPvHaOxnzQxKFWaD+JK9at7BUGtfYs9AHK8M83ljdM8XXWMxER5AKiZ
	M5lw==
X-Received: by 10.66.233.37 with SMTP id tt5mr13646393pac.95.1376546596581;
	Wed, 14 Aug 2013 23:03:16 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	qf7sm57823505pac.14.2013.08.14.23.03.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 23:03:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 23:02:29 -0700
Message-Id: <1376546549-2137-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1376546549-2137-1-git-send-email-raj.khem@gmail.com>
References: <1376546549-2137-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] tune-ppc7400.inc: Add tune file
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
X-List-Received-Date: Thu, 15 Aug 2013 06:03:15 -0000

This is appropriate tune for mac99/g4 platform
that we use for emulating qemuppc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-ppc7400.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-ppc7400.inc

diff --git a/meta/conf/machine/include/tune-ppc7400.inc b/meta/conf/machine/include/tune-ppc7400.inc
new file mode 100644
index 0000000..4ac0403
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppc7400.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "ppc7400"
+
+require conf/machine/include/powerpc/arch-powerpc.inc
+
+TUNEVALID[ppc7400] = "Enable ppc7400 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppc7400", " -mcpu=7400", "", d)}"
+
+AVAILTUNES += "ppc7400"
+TUNE_FEATURES_tune-ppc7400 = "m32 fpu-hard ppc7400 altivec"
+TUNE_PKGARCH_tune-ppc7400 = "ppc7400"
+PACKAGE_EXTRA_ARCHS_tune-ppc7400 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc7400"
+
+# glibc configure options to get 7400 specific library (for sqrt)
+#GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc7400", "--with-cpu=power4", "", d)}"
-- 
1.8.3.4


