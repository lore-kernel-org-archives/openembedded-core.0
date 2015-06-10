Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 09EE9758E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 01:03:53 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so23020013igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 18:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=L6nA+Gh5QTG9h3/0m0lGcH/pEzQCnWqZtPcrAf8/Jzs=;
	b=ln5oMZwqcj1livAmO8298KgWH+7VHiVohro/64ERxZ3htJMfEkjXYWr1l4by7HPeKx
	18s7RZbN9VQISm7aPeKvHt/XQeeytoYxn4d2ErT7C3+cMqCN4LTZD6bAzv6mb+0TIqIx
	S5PAFiXe02Q1HMPNjAywuhMjC3kcvbR5U/biyn5LvwEhH0hD9YR3kegz1FFr2/wRiKUK
	6Q+/6QrNGPp4GAFfG494cKwsuLGmiboOUAK9vurYNo6/v5dlY5MSYAG/6nGtEW6AR/gM
	ZcIUiJn9nxRtsnPb7kZ5SvXevTH60+2xaIfh63xYZO4TTxRZ+bBPXNrjbuz74/ZwphLI
	JrDw==
X-Received: by 10.50.50.130 with SMTP id c2mr2204609igo.19.1433898234437;
	Tue, 09 Jun 2015 18:03:54 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id f82sm5100714iod.44.2015.06.09.18.03.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 18:03:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 18:03:47 -0700
Message-Id: <1433898227-21948-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] tune-core2.inc: add i686 to PACKAGE_EXTRA_ARCHS_tune-core2-32
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
X-List-Received-Date: Wed, 10 Jun 2015 01:03:54 -0000

i686 is a compatible architecture for 32bit core2 x86.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-core2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 078e22d..31928c9 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -20,7 +20,7 @@ AVAILTUNES += "core2-32"
 TUNE_FEATURES_tune-core2-32 = "${TUNE_FEATURES_tune-x86} core2"
 BASE_LIB_tune-core2-32 = "lib"
 TUNE_PKGARCH_tune-core2-32 = "core2-32"
-PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i586} core2-32"
+PACKAGE_EXTRA_ARCHS_tune-core2-32 = "${PACKAGE_EXTRA_ARCHS_tune-i586} i686 core2-32"
 
 AVAILTUNES += "core2-64"
 TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
-- 
1.9.1


