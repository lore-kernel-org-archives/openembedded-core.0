Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.6728.1612341797199019190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 00:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=lyJxB9mD;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from anbelski-lsg-linux-yocto-1.irsgb21fvobu5fvmalxug44hib.xx.internal.cloudapp.net (unknown [52.247.218.173])
	by linux.microsoft.com (Postfix) with ESMTPSA id 63A8520B7192
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Feb 2021 00:43:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 63A8520B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1612341796;
	bh=bKsSV4Y64itKpA2woXNSy4LhrvSN7VXbLz3w+cU4SPw=;
	h=From:To:Subject:Date:From;
	b=lyJxB9mDmrLGmzUpnJgRCSUwnkrcAVoHtbkkkuDlAWZe1EamLUIalS6gKlPqg/SpY
	 MT1QcIpQQPnx1QnJjkPoFIEGTBYUXql72IpTNYMfg1vi1IUhEDKQnOUCB6fVusz34O
	 /qoRgihEdi/5F5xLzJjwXv8AHDys+yOB0/RBfutE=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] glib-2.0: Rename patch file for CVE-2020-35457
Date: Wed,  3 Feb 2021 08:42:57 +0000
Message-Id: <20210203084257.26778-1-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

The naming convention needs to be help so the CVE is recognized as
fixed by the tooling.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 ...ion-to-avoid-GOptionEntry-lis.patch => CVE-2020-35457.patch} | 0
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb                   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/glib-2.0/{0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch => CVE-2020-35457.patch} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch
rename to meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
index 0ad14a0878..1a006b9f38 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://tzdata-update.patch \
-           file://0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch \
+           file://CVE-2020-35457.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.17.1

