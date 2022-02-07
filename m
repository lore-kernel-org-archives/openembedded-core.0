Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24423C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.16256.1644196131835539384
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cHKwlFPG;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so2749194wme.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xv9C/cbwn3/IsSPTxdVJVvaOw0WiohttaSPaj6+17pg=;
        b=cHKwlFPG6IR/03LcDb/3ZVshl+GfADo7ZHODGY5gke+uzagkhKzExQJHH9M9jXDnL4
         fEJPFxOKe9MIZYHV6txcwBJi+pu/fhIII8R5zAJmkQqZI80ohJzfHJY7yoCzEgsxdc5f
         GoqhwG6/+pn1KuFfTrGZGgw4OFPV3mduwtnwgYPeqfsKYTHUa7Pnk2rtBn4iHpvocuE0
         0T7lfNmDZPUuP9IWZbr0Gt5oIcIEpK6f2rkTi2rKr6El2lhtdtc4pseCi6sX+O8lfrrD
         9Q+s+7W37xV6hmsHR31RP8uswrKU00twInFUloMBEPDrkqjnf0ctE8q2HKQ6YYpt2rdv
         YxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xv9C/cbwn3/IsSPTxdVJVvaOw0WiohttaSPaj6+17pg=;
        b=YnyBznGDloksMGpkcwlUSLNYyfqFVv4xZLVFjYCtc51zh9FL/RN7nJOXLfCwncm6fK
         9/xmg2iH5VY5lJK6S4Oq7cftX6dSbgGrqFfIpHmvpFArPuOx5zQmKyU0xPmxZyS0VxE/
         uIA/xYxIjbEicxDvADUYWa3DxG/QV5LljbbEfZXi5KG2h1BvCwWzvBwA05E2unSwsrwh
         pC1302apC8tpda2/IaBMM9yU7iytHHX1uMj9lW0EEiwFXGrqyr06RJZSGQQ/o89x6+Op
         dyFdit84DQ2PJinXxTVrSU9AaDuJDnGltU5jKQ4HUK8m4XDTVsyiiwv9YAmBv23fjxcG
         rc8g==
X-Gm-Message-State: AOAM530EgtIn/ATBclSCUex6laRt2hHlxRInE0uNYcPpBSrdbC4Ik/Bf
	dAqA8NnvcnDBLj3d/dVY6h/elmL0nOg=
X-Google-Smtp-Source: 
 ABdhPJxncvTuC5CxI8kk4NW+jqELw3mPm/9E5ATlMtdVjkvIrEj6DtIJqcGllYXyZNDyXNZiiodCSg==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr9073195wmh.84.1644196130189;
        Sun, 06 Feb 2022 17:08:50 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:49 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 12/17] gstreamer1.0-rtsp-server: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:18 +0000
Message-Id: <20220207010823.143664-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161432

- License update:
  The code actually is LGPLv2.1 but the COPYING file is wrong.
  https://gitlab.freedesktop.org/gstreamer/gst-rtsp-server/-/commit/cc5cdab0165e3bdf5f4f748b3ba2a3493d304e70

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...sp-server_1.18.5.bb => gstreamer1.0-rtsp-server_1.20.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.5.bb => gstreamer1.0-rtsp-server_1.20.0.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
index 50426ad46d..66764f0880 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A library on top of GStreamer for building an RTSP server"
 HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
 LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f"
+SRC_URI[sha256sum] = "c209f5ed906da713fdd44a8844e909aa6c8af3dfb630259b092cfb77a7755843"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.35.1


