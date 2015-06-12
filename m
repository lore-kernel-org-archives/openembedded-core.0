Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA217599C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 22:17:40 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so19120790igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 15:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pmJf2mLRV+vkDNNfvs09QiYVm/JOv25TlPZWYEL80Pk=;
	b=or6ZEaqlFOmTeDMkdVK1RfxdylObDL+fSuinFN8atVWfAAmZTufGCz3XiGCIyXOiuB
	J9Gn8sSQ65i6kJgmC+i6+bbEMaAtPbrDvDN9XnOqb1lZa8K9KCfvvLBrJjj/wUZh7j56
	GBzpVdzGaUQlVeYCaUO+fXC1cIfRCiJWqBfhhMspPvosirAOuHqedTWQboeN38fjIb97
	qW9aLB3PFgh4uDAzQOALfON/2rUci9ihQs/Yj7onfig5ciKXKcfRVsrd8fLw91XVBR4p
	Y/KsiMJId0FF8GjvTUOK28KPTD/bm6+DKuFQupD8ZQBeFWptG1fbpFThxMGtXC2GNdBX
	ZqLA==
X-Received: by 10.42.204.4 with SMTP id fk4mr18535713icb.72.1434147461337;
	Fri, 12 Jun 2015 15:17:41 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id qt1sm2052914igb.5.2015.06.12.15.17.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Jun 2015 15:17:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jun 2015 15:17:34 -0700
Message-Id: <1434147454-6643-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] security_flags.inc: remove duplicated over-rides
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
X-List-Received-Date: Fri, 12 Jun 2015 22:17:42 -0000

The following over-rides were both defined twice:

  SECURITY_CFLAGS_pn-grub-efi-x86-64-native
  SECURITY_CFLAGS_pn-ltp

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 9608c7f..104a6cb 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -47,7 +47,6 @@ SECURITY_CFLAGS_pn-grub = ""
 SECURITY_CFLAGS_pn-grub-efi = ""
 SECURITY_CFLAGS_pn-grub-efi-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-native = ""
-SECURITY_CFLAGS_pn-grub-efi-x86-64-native = ""
 SECURITY_CFLAGS_pn-grub-efi-i586-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-64-native = ""
 SECURITY_CFLAGS_pn-gst-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
@@ -65,7 +64,6 @@ SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libpcap = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libproxy = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-lttng-ust = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.9.1


