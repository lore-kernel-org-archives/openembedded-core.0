Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 84053731DC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:14 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id cy9so418759738pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FdWm+XsFs8uG5ZHZoCPMwcXuVG4owjuumid0/rpjnOo=;
	b=hj5YRz8ST27qvvi7Q+cwxI3zC1zXvZfyhlcQt6gsEb6oRudmD3BeDFbUHhtlCKMnLk
	A8fmIgoj8o/T+MG4j1zhoZMcM/J350v62dcfivKVxT94PCEx4ToG15Oh8C9TZpXtR75g
	Q3h2VBgXxzt3KPaiYZHenyvr0p3XyzJAUpXHTCZJcG+ZB2grGKNzLkpB4fO65Tewb7mG
	tM/E+HsOikossygv+JtPEF/OEm8kymBP8RUtBiRF57LCeitutqKs7DpDnuCa239S0/Rx
	R7j/PQTz494O8b4bIe6M5XKisBKIvsmqSZNIi+VSLLqJdJqTD4RRog/ZT8r3zn8Nk5er
	IWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FdWm+XsFs8uG5ZHZoCPMwcXuVG4owjuumid0/rpjnOo=;
	b=h4QTtFQzr3OasDCGYbMbY2msD77QIzaevFtsYI+jNei6wssBUIcA1JcdfkHkV6yAnH
	X6jZR9btW9UYVXq5RmwPVWvjQ/7/laOve6ENIOvKHyoQ3GZM4QUmt+8Ufp6z9M5S/7DH
	Jg2aO2CRYxpSeAOKG+yt45/r8IEjLG/4bl/c5z8fb7yOqVJI5OVpkRiQXbpzhM3EDrBi
	ECPnuTG67U1klGf8fTCuFuPMjT7/aCegRE4emmy2kTkl2toCKSiXRfIsS5Eg/Nw+HIzr
	ugV4ciXPZlS0IgpSIyHsUL2SQcB1cSKxnBsi1EGetxvIES71z3wsD4PYSkJIw0hjbMXH
	uxmw==
X-Gm-Message-State: ALoCoQnvgNY/LNZWCOdSkTLhjsG7PszdaMZ+XYxHNYYOFav04gDAKSxfx4Xkw57ebQXekyCmm83taG/MB/N2vP4bEyKNT9bIHg==
X-Received: by 10.66.102.9 with SMTP id fk9mr28287153pab.77.1453030635033;
	Sun, 17 Jan 2016 03:37:15 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:49 -0800
Message-Id: <ae8f42a2139f2accbfbf8d33ad703b4b5cb0ba00.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 16/73] packagegroup-self-hosted.bb: Move glibc-gconv-ibm850 to glibc only case
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:14 -0000

This package is not provided by non-glibc libcs therefore add it only
when libc is glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index d38be26..bb8371e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -67,7 +67,6 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     cpp \
     cpp-symlinks \
     distcc \
-    glibc-gconv-ibm850 \
     file \
     findutils \
     g++ \
@@ -93,6 +92,7 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     "
 # glibc-utils: for rpcgen
 RDEPENDS_packagegroup-self-hosted-sdk_append_libc-glibc = "\
+    glibc-gconv-ibm850 \
     glibc-utils \
     "
 RDEPENDS_packagegroup-self-hosted-debug = " \
-- 
2.7.0


