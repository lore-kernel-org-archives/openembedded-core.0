Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24CAC71AEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 01:58:53 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id o123so1689156pga.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fxVn292PtrNgzC0F4Gq7Q2eqiqj8yV+pxElk6tMwUJg=;
	b=izRzcdwvzExGEtedl3kruyjt0OwLVwC4ODdJuSrrTm1TyRSs6cuBSi74SAU+uLSkB5
	G3nwkBKodr4m3ZcLeuPdAxlcvxMyh55vurYpsFqGskjyCRCpBioFQOocN3nOYB42XlBw
	VO034eMJGuC2vJyZoIhqATgrtxlgWYyd0xF1A7AUfkXQ/mfhVp1Gh/NVj/8WQaopLnuv
	+bqt0yuuIcp23Lq1V9mQrpeiiuca08bgTwvGhYbZqUyw/tEwuy7H5c+kjf+V2YORIjOQ
	tGT/YjpoF6mN7xzQcEpXFFBPu+9NoennQ+m7yGgoMe3phdYoHkHjqR8Y00zZHMrfKvzL
	jpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fxVn292PtrNgzC0F4Gq7Q2eqiqj8yV+pxElk6tMwUJg=;
	b=mg3JCEP2FBsGYwqcmzPa5raF6MJQdq8M2p1aM6JSRIKPKAg4a0RqzI07HXQo3qOlgT
	zh8HHwmRKlc9jCiT2DYAfPL4ysQUFQVLEwjGKXzibhhJCv3xBzCSPi5zNzcJUWRrs9Y4
	tJzYiczZdzsDgTYI6MPaw4CAhxsJukOWXkl1cxEdgbZ+o54pDDOtY+aVa+C83DPzDFM8
	KjK0nHmbnQr4PyIjgTjkI3J0jVEpvHO+NMPe0yHEnUMS9Cv6X4f7HdbpV0czUnJ67s8i
	Hv/QWBMG2Oq843/Jmo7/nsvUpMqBjQ6Hj1N1eQa5mtswhdfbo5lrONc8+CAbb5r+ugKg
	v8jw==
X-Gm-Message-State: AN3rC/7U1horV/h6RlZ13+08JHaOCPXs9ELltYI2GYlZOmGxKrEbgWXW
	1vcIq2ni2Q9+VpnJ
X-Received: by 10.84.135.3 with SMTP id 3mr618884pli.65.1492567134765;
	Tue, 18 Apr 2017 18:58:54 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a190sm787128pgc.60.2017.04.18.18.58.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 18:58:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 18:58:36 -0700
Message-Id: <20170419015839.1294-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170419015839.1294-1-raj.khem@gmail.com>
References: <20170419015839.1294-1-raj.khem@gmail.com>
Subject: [PATCH 2/5] libtirpc: Expose key_secretkey_is_set API
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
X-List-Received-Date: Wed, 19 Apr 2017 01:58:55 -0000

libnsl needs this API

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtirpc/export_key_secretkey_is_set.patch        | 19 +++++++++++++++++++
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb      |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch b/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
new file mode 100644
index 00000000000..bde7951ec1a
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
@@ -0,0 +1,19 @@
+Add key_secretkey_is_set to exported symbols map
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libtirpc-1.0.1/src/libtirpc.map
+===================================================================
+--- libtirpc-1.0.1.orig/src/libtirpc.map
++++ libtirpc-1.0.1/src/libtirpc.map
+@@ -298,7 +298,7 @@ TIRPC_0.3.2 {
+     key_gendes;
+     key_get_conv;
+     key_setsecret;
+-    key_secret_is_set;
++    key_secretkey_is_set;
+     key_setnet;
+     netname2host;
+     netname2user;
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index 8ba547506bf..b96abc4d57e 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
            file://libtirpc-1.0.2-rc3.patch \
            file://libtirpc-0.2.1-fortify.patch \
+           file://export_key_secretkey_is_set.patch \
           "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \
-- 
2.12.2


