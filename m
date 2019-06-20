Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id 83AE77E8E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 15:43:19 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id j6so2617236ioa.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 08:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=d0D+9NYG8dNn7NylG9X+gELu5dVua3UKqiU5udHoN5w=;
	b=MVVm7S2q7HUCG9He0eSC6Cbu0ydsRvi4zZnYsy1oYZjloY8ZqLKgouuwQ6eAlE2gor
	0kZStP+yDHqjjrfw6OxUVuDU4GGig09OUEg4hkpNjvxsDNjfAkYXBKPJubCtvLO9kihE
	pe2SZtBRTnb0aXFGR21N4HPx//iDYTh5APMdgyvS5AU1gdk2KYPvPVwaODwl2AfkZQyZ
	A0YpYV0xx5AQHhmvfapGCC0u9v/8HpcwujMuUWx3bRzFGRic7Hwuqh8XsogW1veM1+pw
	oR1B+XGAfol+cZzdrHls5w6yNAIfaaIwCraZPvkBMmq2jG1Bcpuz+P368R1FcuaUgQgA
	FE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d0D+9NYG8dNn7NylG9X+gELu5dVua3UKqiU5udHoN5w=;
	b=GymvjM9Z60yD5+dlSY5S/yJ1ilJVOVXsRLsrBjPjISRMFQZadSgzaT+voKL4eNHAeD
	kulk2lIGLNNPblthUs7123kRURQbhDtaI+4sUdVthbWbIMhNPet064c3TMKaoKhzsXeH
	M6a9m7Mz6o+twUXM4wc4If/ZJ7GIcqMicFJY0sXgfaf7SHjomtiMWbIKKuTSpYIEIZAn
	tEJJV/qkQdgG/gpfYwEu8NU6dNnsbkyaiFsN9YBf+qK7ixF3rUIhLVgfaURALg7DBoTM
	Qw+7+UzHt1zuE6UWYYH6p/KIkwU5vbGDAKxS1U6/QikzWckeXBBT7nLgqfpsS5YmqZ2d
	EAmA==
X-Gm-Message-State: APjAAAVmsIdxMxP8W7/YaRD3dOZB9s1wJYTAe2OGah48GOthZp8HXVAY
	5xSCVJAui1DHMRUEuhNS079ITzcz
X-Google-Smtp-Source: APXvYqy/d5E4+GsUOH62+8ZFJJU5/Ehw8iITF4ZoE96KTDyRq1Xcbx2k9EOWD0JOmKfekOT8IXe/3w==
X-Received: by 2002:a5d:8253:: with SMTP id n19mr1010140ioo.80.1561045400316; 
	Thu, 20 Jun 2019 08:43:20 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id p10sm166267iob.54.2019.06.20.08.43.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 08:43:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 10:43:02 -0500
Message-Id: <20190620154302.9251-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620154302.9251-1-JPEWhacker@gmail.com>
References: <20190620154302.9251-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3: Disable PGO for reproducible builds
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
X-List-Received-Date: Thu, 20 Jun 2019 15:43:19 -0000
Content-Transfer-Encoding: 8bit

Enabling PGO for python current causes it to not be reproducible when
building, so disable it for now.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.3.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
index d14c93880fb..40e2229a165 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -79,8 +79,16 @@ CACHED_CONFIGUREVARS = " \
                 ac_cv_file__dev_ptc=no \
                 ac_cv_working_tzset=yes \
 "
+python() {
+    # PGO currently causes builds to not be reproducible, so disable it for
+    # now. See YOCTO #13407
+    if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) and d.getVar('BUILD_REPRODUCIBLE_BINARIES') != '1':
+        d.setVar('PACKAGECONFIG_PGO', 'pgo')
+    else:
+        d.setVar('PACKAGECONFIG_PGO', '')
+}
 
-PACKAGECONFIG_class-target ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'pgo', '', d)}"
+PACKAGECONFIG_class-target ??= "readline ${PACKAGECONFIG_PGO}"
 PACKAGECONFIG_class-native ??= "readline"
 PACKAGECONFIG_class-nativesdk ??= "readline"
 PACKAGECONFIG[readline] = ",,readline"
-- 
2.21.0


