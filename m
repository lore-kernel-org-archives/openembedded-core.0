Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2F22761F16
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:59:02 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so6124663wes.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 08:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HP9eYkvGmM3IsrxtMBirbX0cMRtJ4k1gTc38o9ovH8Y=;
	b=dD/g2wamaU9WvMHQ6IgpW0JcoTqD5ukttnnGUuM90WxyOlT1j7+tv0TUrzlYL0yhrC
	aLwh4+VOFJkqk+Kna+BdV+mXWapK/diIQo69D+vUGXeg5f6IjV0RfbAXSz+1sepfyaRw
	HUN0uIs60hAHG+4mImVePQBcd51EG4FloYkl4eOAJyF7W2piMSFzY6RdI/kttfvUB6oL
	Iyo9ZR6IbGHc8w43kPsiswmIIe7KO5Wao21l3dx6+otoEvJy4tL1o8I4WM36sf9dYgPq
	bjjn2Qk3JmJ/Er9BarJHQs67UTk7i7vC0BVX46ChUnbiQ4zCUDgJuN9jYl+LDG+kf514
	NZFQ==
X-Gm-Message-State: ALoCoQnwcHBvDrIy8Ha9ao6XlMNna2g+ACwR72Sobfd+vbD6pIJ5pZIkxM37ouD97qOxr7SSCJp9
X-Received: by 10.180.99.40 with SMTP id en8mr30040857wib.24.1402329543618;
	Mon, 09 Jun 2014 08:59:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id wv9sm9131812wjc.28.2014.06.09.08.59.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jun 2014 08:59:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:58:58 +0100
Message-Id: <1402329538-7650-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] Revert "fontconfig: enable 64 bit file support"
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
X-List-Received-Date: Mon, 09 Jun 2014 15:59:05 -0000

Fontconfig doesn't need to be passed large file flags through CPPFLAGS because
it's configure script uses AC_SYS_LARGEFILE.

This reverts commit 5a49a24d35794fcf9e3895469a67db992a52305e.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
index 4fa58ab..797b321 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
@@ -38,7 +38,5 @@ DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts"
-TARGET_CPPFLAGS += "-D_FILE_OFFSET_BITS=64"
-
 
 BBCLASSEXTEND = "native"
-- 
1.7.10.4


