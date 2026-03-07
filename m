Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF105F55121
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19043.1772923983490477848
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:53:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VS3n8sCv;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852ff06541so6738675e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923982; x=1773528782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NH6mxgGf9EEHqAN0rBySdwQBtUgRzUaJ6bJfwrt6Cg=;
        b=VS3n8sCvrGtS6lI3q0JaVUE8Z/vdou27TDL4a8B5N/BNmn+8mUDCcrCDiGviXuatEl
         urOeavertph/csC9RkEcq+VU+sL5GovwkpwBn7R04ouzcBQ2ZYiG7/xYXLBL0uGu9KkF
         cnSrmvblDJaLUyWoCx/gGvVuPlm+iyqzBI1PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923982; x=1773528782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4NH6mxgGf9EEHqAN0rBySdwQBtUgRzUaJ6bJfwrt6Cg=;
        b=eInCfMCpG1MwbRwm7Q5JtyfkqwHIFciJ3vELMrLKp0Z+SL7Fay+HhZ9rrVCU5ju/rU
         h2xebQ9G9Ou6RSdvrDtDplrbuFH/FqqICw8sFwE/uvcL7FTn9n2TEJmPdXCTg61OJpBD
         0BtAplN36Hda4i6/wACO6bpwp9JYe7bNZow4R5I+w6BaTT/0001BJh3jOS7JQd8m+nfh
         MoEx6sEuw2HLRCTTDiz2F0t0Nux5BWuwwdjLp7Nd4MuVY+LjbU3gvqMIEGA0F2g22tAF
         CaUeHl/l356faUMA0pgP3mJTT8/LInZTRtAYmla718sx6vJxq8tJLXMoDNPL4p7wgnE6
         OmnQ==
X-Gm-Message-State: AOJu0YxdSaUiFd75r4HAIoU+OcR865gzXpx8i0/AvsZFiFQTw39jxolj
	4A7qXrbuPws4Yp0lL69DlGrSpkIBeiIDqiP4HOdOsN3gME9AeAVPJ5EGpsXn8tLDUdVQCEtglTD
	IXLV5
X-Gm-Gg: ATEYQzxgaHybp3ORIB4p1Z7Zm0yRJ+rARMsXqZL880KkBpJGl52NcpZN1R90SUGIkxv
	HrRg0hIp63+uVvD/nfmfB/f964/9BH2b6X9t2lLskgZNQuqcZc8nhb5Tt/OIXG6JK21Uq8rlmRj
	ejLr8RWQhB6FFxrJYePCF79mJwmikqHiHhO5xbyqXTh99fGT15O9h+pe9Ld2KNSxnX+8q5BSiVG
	jvOJDlvfaVaV2I0y8h+xv9FFKH1RolAEN+3PuC2M4bVsYO0YuzQhNmPMmuEfOyx2CtDTOiEFcll
	EdF9CC8XzlCkHOW8i57qHQwCq4PYntP8KiPik9khISKPaVWwLxCqR3oMTDxB2kKoHRQA2vWoXbl
	RSPobgdGj1R+gYhcl6jp5uWEuQdeEOKh4daPykOpHmGXl+qhW6WuJnJK8qD/+lZStisB/vXlZl9
	cACI23dHn382NlDw1MkwYkvZDRTL5LjVRUhaXnEcw1qRcIdsiWYVBr179KkUkI3uJEoRDt6Ga3h
	Ph77sW0PRd1+PbqS+hQAKCqbCap7+jGHWrb5g==
X-Received: by 2002:a05:600c:45d1:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4852697844emr110689295e9.32.1772923981696;
        Sat, 07 Mar 2026 14:53:01 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.53.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:53:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/11] harfbuzz: Fix CVE-2026-22693
Date: Sat,  7 Mar 2026 23:52:22 +0100
Message-ID: <568094a54f7a0aa6ad059d3085b1fecf5875871a.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232630

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch mentioned in NVD report [1]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-22693

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../harfbuzz/files/CVE-2026-22693.patch       | 33 +++++++++++++++++++
 .../harfbuzz/harfbuzz_8.3.0.bb                |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch

diff --git a/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
new file mode 100644
index 00000000000..c57859a7b35
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
@@ -0,0 +1,33 @@
+From 95d38abd1293cae1f2aa700a3949288fd2c9a4c4 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Fri, 9 Jan 2026 04:54:42 -0700
+Subject: [PATCH] [cmap] malloc fail test (#5710)
+
+Fixes https://github.com/harfbuzz/harfbuzz/security/advisories/GHSA-xvjr-f2r9-c7ww
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae]
+CVE: CVE-2026-22693
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ src/hb-ot-cmap-table.hh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/hb-ot-cmap-table.hh b/src/hb-ot-cmap-table.hh
+index e2e258185..2f7d72700 100644
+--- a/src/hb-ot-cmap-table.hh
++++ b/src/hb-ot-cmap-table.hh
+@@ -1534,6 +1534,10 @@ struct SubtableUnicodesCache {
+   {
+     SubtableUnicodesCache* cache =
+         (SubtableUnicodesCache*) hb_malloc (sizeof(SubtableUnicodesCache));
++
++    if (unlikely (!cache))
++      return nullptr;
++
+     new (cache) SubtableUnicodesCache (source_table);
+     return cache;
+   }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
index d733342682b..440ca1043d1 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://CVE-2026-22693.patch \
+           "
 SRC_URI[sha256sum] = "109501eaeb8bde3eadb25fab4164e993fbace29c3d775bcaa1c1e58e2f15f847"
 
 DEPENDS += "glib-2.0-native"

