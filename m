Return-Path: <andrei@gherzan.ro>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3806065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:21:13 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so330456eek.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hm4gFdCtb3T3nkFNylc2M70Z5ae5sQtTNNprQTCeQaA=;
	b=GKRVKFFDM8pu7O5W4HkaMhzgLRm7ZazqOereHbMifdzkrRXTkHZY++X/gfrO/LYfaO
	gy6oQhqlrICsxhqKHDg/YEHk7v+J8YUadgCaLsjBwF72Nkb+/9pNYilu3xns2iJhDLKO
	PiLP8N3MTWLYWz6lxp9RnZRp60F9zQPsJwDMc5rC8Qe2ObJWM4T1kiZBU1adObthnQ4d
	DWhzt5keJuTyPGQUgjYgBB+79pSf4Xmc5lzpxyyzjRdi/qB3McuvU4Mmw9p9ioLyr+Ng
	H3hpJ4dQm09l7Uew5eDofmj/726Zny3VnREEcPwRFvB1kTsgEHjAH98BPJSaK4Q58HFB
	tCzQ==
X-Gm-Message-State: ALoCoQkUn+ZO09MvRDcUQ/w5zsHX4bDRYj8ZEVI9GXvhgZnFOXdAA+uIuvap7vKtF504UUxvResF
X-Received: by 10.14.183.130 with SMTP id q2mr70161eem.5.1377267673300;
	Fri, 23 Aug 2013 07:21:13 -0700 (PDT)
Received: from otp-mmes-build2.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPSA id z12sm77206eev.6.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 07:21:12 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 17:20:57 +0300
Message-Id: <1377267658-14590-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 1/2] eglibc-options.inc: Fix string options
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
X-List-Received-Date: Fri, 23 Aug 2013 14:21:13 -0000

Add quotation marks for OPTION_EGLIBC_NSSWITCH_FIXED* options. If not, Kconfig
will ignore the value and will use the default one which is "".

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 meta/recipes-core/eglibc/eglibc-options.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-options.inc b/meta/recipes-core/eglibc/eglibc-options.inc
index 74412e8..c55d05d 100644
--- a/meta/recipes-core/eglibc/eglibc-options.inc
+++ b/meta/recipes-core/eglibc/eglibc-options.inc
@@ -7,8 +7,8 @@ def eglibc_cfg(feature, features, tokens, cnf):
         for token in tokens:
             cnf.extend([token + '=n'])
             if token == 'OPTION_EGLIBC_NSSWITCH':
-                cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG = ${S}/nss/nsswitch.conf"])
-                cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS = ${S}/nss/fixed-nsswitch.functions"])
+                cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG=\"${S}/nss/nsswitch.conf\""])
+                cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS=\"${S}/nss/fixed-nsswitch.functions\""])
 
 # arrange the dependencies among eglibc configuable options according to file option-groups.def from eglibc source code
 def distro_features_check_deps(distro_features):
-- 
1.7.9.5


