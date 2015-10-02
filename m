Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9B29577088
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 14:28:36 +0000 (UTC)
Received: by pablk4 with SMTP id lk4so107434601pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Oct 2015 07:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3a60RvKuppL98RSTCCeOxLWkK2/9CHdDYX7XepR8RQ8=;
	b=0KaBh252NaH1vk0TtkQOm2Vmcr9r8cgRjjP57iKsQVhOvKRwSKEmqsbiNHlMNXerpU
	icLU9UGmmUyzeJhh7/zYYNmcLNDz0qaCBU7ae3hULne2VZgwV8f1M6BHuAtd0OjvUk41
	uRjCed4naXsJ+X3dMb9PsvabznKRWAcdeA8UtvGpFwcHKaWwsNwgu+9ZSu+vzv2gxIyU
	XYl2ypxxM9KurjtSErKxOYcle+Hi3xE3NQzP3mOKSoBekN6eQz1KSUY79eSWHxGqT72i
	q8P1NxUcPbPmhKOu0Wpu/05zs4t9fxP/MrGPw5hsMDAyYOwZUgQ8jUtaookSk1xnzEdN
	TFxg==
X-Received: by 10.66.230.137 with SMTP id sy9mr20918885pac.154.1443796117459; 
	Fri, 02 Oct 2015 07:28:37 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	sj6sm12368768pbc.7.2015.10.02.07.28.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Oct 2015 07:28:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Oct 2015 07:28:33 -0700
Message-Id: <1443796113-29227-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2] ThunderX: Add initial tune file
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
X-List-Received-Date: Fri, 02 Oct 2015 14:28:39 -0000

From: Armin Kuster <akuster@mvista.com>

changed upper case "X" to lower case "x"

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/conf/machine/include/tune-thunderx.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-thunderx.inc

diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
new file mode 100644
index 0000000..40de61d
--- /dev/null
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -0,0 +1,19 @@
+require conf/machine/include/arm/arch-armv8.inc
+
+DEFAULTTUNE ?= "thunderx"
+AVAILTUNES += "thunderx thunderx_be"
+
+TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "thunderx", " -mcpu=thunderx ", "",d)}"
+
+ARMPKGARCH_tune-thunderx ?= "thunderx"
+ARMPKGARCH_tune-thunderx_be ?= "thunderx_be"
+
+TUNE_FEATURES_tune-thunderx ?= "${TUNE_FEATURES_tune-aarch64} thunderx"
+TUNE_FEATURES_tune-thunderx_be ?= "${TUNE_FEATURES_tune-thunderx} bigendian"
+BASE_LIB_tune-thunderx = "lib64"
+BASE_LIB_tune-thunderx_be = "lib64"
+
+PACKAGE_EXTRA_ARCHS_tune-thunderx = "aarch64 thunderx"
+PACKAGE_EXTRA_ARCHS_tune-thunderx_be = "aarch64_be thunderx_be"
-- 
2.3.5


