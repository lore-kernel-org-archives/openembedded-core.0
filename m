Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C3A3073178
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:30:03 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id t190so4344423pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LhF6WwoB+BCLjYBmP0MLEKqHcK7yWJFSnv3TB02E/PM=;
	b=iHx9cWUSSNU4Z9goWCDYRwQJuhomb8k+/ENYoDzbLn99uQv9W4bGb4PunRuwpvj4kP
	ljvhEx58iuYGF5rPu8TtDIYSr4bHOE05CRdUtACWhE2bSCmCubjGCELrglEih758YUEb
	/aLaVGCf4roW6USxBTgy9UJM8U0/oVpmxwVkPtSoBKwiiRXrp0N15Y562h9tJWFH9rrh
	Xp/LA235VBQ2PzHpCHmXR/6t9YPvXogi2JPzw689Bxn5VwUTtnpqYHyKibPxwYiP6tmk
	6nsLaMb23vFxRfBg11EKfp579QzXxcl24+paplroOpiKiMYIiofE/yzblQhR0IYcLuBG
	exWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LhF6WwoB+BCLjYBmP0MLEKqHcK7yWJFSnv3TB02E/PM=;
	b=b9Hk1Qnw2G/BEp17Xs9Ly3N3CO3wbPU8Osa6kzzNoEx+JKDprbo3Ohn8RSk9wj6mS1
	K8MY+2lWrpN2hQbLUf7CvLuZYS7U6ZR8syXAjMbvEyzP/ABodhCAwQcmJOdLArIaF91D
	Hz3A09EFyEgtSaw/1g4SGkEtpvOKAplcSZ3/XmN1MXTDOD0/QfMi3dQ0dMXFu3P0yKaO
	waghDFIZsSrI69gVwcLAhNb633PlwDDUpKE0tiqM/z58Fz3O4IUo31WKl3YRPfCTLuqX
	BE5qw124u0rPBfhX4V+eznSFrQ46eFtOmcXW6R6NUtIZvrGkvBnAsaHKh8zHZVGXND9v
	osgQ==
X-Gm-Message-State: ALyK8tLMSKu54hPTCiwx/fjYJs9aFdsvJvu4TrlSOyznUnrwYC12v+s7twsP6ckE4h3zWA==
X-Received: by 10.98.15.68 with SMTP id x65mr35458634pfi.66.1466609404078;
	Wed, 22 Jun 2016 08:30:04 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id qc16sm811450pab.1.2016.06.22.08.30.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Jun 2016 08:30:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Wed, 22 Jun 2016 08:29:57 -0700
Message-Id: <1466609398-17634-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
References: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 1/2] build summary: add gcc version being used.
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
X-List-Received-Date: Wed, 22 Jun 2016 15:30:03 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/classes/base.bbclass | 2 ++
 meta/conf/bitbake.conf    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5d8e8d6..b90e9ce 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -195,6 +195,8 @@ def buildcfg_vars(d):
         if value is not None:
             yield '%-17s = "%s"' % (var, value)
 
+    yield '%-17s = "%s"' % ("GCC_VERSION", d.getVar("GCCVERSION", True).strip('%'))
+
 def buildcfg_neededvars(d):
     needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
     pesteruser = []
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 942b8b1..7132922 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -650,7 +650,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 # Pre-build configuration output
 BUILDCFG_HEADER = "Build Configuration:"
-BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
+BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU GCC_VERSION"
 BUILDCFG_VARS[type] = "list"
 BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
 BUILDCFG_NEEDEDVARS[type] = "list"
-- 
2.3.5


