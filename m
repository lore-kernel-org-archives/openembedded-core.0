Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1n6B-0005xv-Eu
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 00:01:47 +0100
Received: by eekc1 with SMTP id c1so226043eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 14:53:22 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.94.134 as permitted sender) client-ip=10.14.94.134; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.94.134 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.94.134])
	by 10.14.94.134 with SMTP id n6mr6583052eef.63.1330296802059 (num_hops
	= 1); Sun, 26 Feb 2012 14:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=X3IhZRHY8HaaPL95PcBiyo8OKKzJ3/WPPyop2xYqJJk=;
	b=qxebfv9jlQLqrTf1cSn1bofUID6fuVyNrKsinOKOKx4UAjiQs6P7xnY+IKJFDP/pxs
	qgCdeU/34gML2vWA4EG9zPvR6d8NEqstGO7eyI1SdivIVcm4HRQMGrQvqy+kCOcHgHAn
	5Ux0eaxiNvssNxwajrOqYTM6MjYTQwfcmKNdQ=
Received: by 10.14.94.134 with SMTP id n6mr4885734eef.63.1330296801952;
	Sun, 26 Feb 2012 14:53:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm50490378eef.10.2012.02.26.14.53.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 14:53:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 23:53:13 +0100
Message-Id: <1330296793-23327-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH] arch-armv7.inc: fix quoting
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
X-List-Received-Date: Sun, 26 Feb 2012 23:01:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv7.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv7.inc b/meta/conf/machine/include/arm/arch-armv7.inc
index 98481aa..33d9f0d 100644
--- a/meta/conf/machine/include/arm/arch-armv7.inc
+++ b/meta/conf/machine/include/arm/arch-armv7.inc
@@ -22,7 +22,7 @@ PACKAGE_EXTRA_ARCHS_tune-armv7-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7-v
 PACKAGE_EXTRA_ARCHS_tune-armv7t-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7-vfp-neon armv7at2-vfp-neon"
 
 # VFP Tunes
-AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon
+AVAILTUNES += "armv7hf armv7thf armv7hf-neon armv7thf-neon"
 TUNE_FEATURES_tune-armv7hf ?= "${TUNE_FEATURES_tune-armv7} callconvention-hard"
 TUNE_FEATURES_tune-armv7thf ?= "${TUNE_FEATURES_tune-armv7t} callconvention-hard"
 TUNE_FEATURES_tune-armv7hf-neon ?= "${TUNE_FEATURES_tune-armv7-neon} callconvention-hard"
-- 
1.7.8.4



