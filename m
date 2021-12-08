Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C8CC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 14:26:55 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.12984.1638973613815893318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 06:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DilJrBdB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id u1so4325843wru.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 06:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hFV7iSEHys9aUhGXuNSLsDo5ZwySZICg1uUisRfNP4w=;
        b=DilJrBdBfLs/ZUh8TRyZWLjXOwGN1B1f3SkTZkJbBRy8AdZdnfOVjW58+3XBSmf7WC
         MOOyDKE4zm1E1sUcvKV3ceTeo9guR7ESUV/zl8YCYY1vHjnAtffEfuo2LPvjFhq8Sg0x
         HsYX52Hqm/8aajKAaBqCFbs3bU9AK+Irs1P+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hFV7iSEHys9aUhGXuNSLsDo5ZwySZICg1uUisRfNP4w=;
        b=sJ7XbJDnTJfxRUxiXtRHo0VMSwoq8iYs2NPiBrRnE37fe4qcB68AA/r09CnP0YtEfv
         MFis0U8WTjO1juorXDPlJN8l0giyJlggyYOVRFZOb6xVCVCgcCHTxAhA2Ln1M/K5+FWL
         BzbOK2CGnwB1MIpKddbDTl+ugpl0SzAuiy6IoqN/AGzuYWmWIaHyC9oQ0UtGZAAAjOtp
         gjf+Hm3GRtb1eP93pCGruPhYcIAzW/lVQBTqJKC8DlKHNaeXwmD59XSM/+g26kszSvlq
         n/pDyqkDcPJu+J+LQ4l7fgs/uS8sjDGFvbQQg+3d3M2dX2ytjm739TJU5Ol2dvxJEku+
         QzTw==
X-Gm-Message-State: AOAM531RVuTEfjs4YwbF4V4ae94i50GKG53WccipcnlsUAmMO0+8mS3c
	o11kbgtJQ3Ut65VZHHaECeWhsnX0vmlReg==
X-Google-Smtp-Source: 
 ABdhPJxlfvuPZA0/hn72Y3H5lkBev2myssG3akNRAt5TZHfUitf+n86JsWkSPOd75g3Un2XnxELmHA==
X-Received: by 2002:a5d:400e:: with SMTP id
 n14mr56896827wrp.368.1638973612172;
        Wed, 08 Dec 2021 06:26:52 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7bcf:b0b3:a8aa:29ed])
        by smtp.gmail.com with ESMTPSA id
 d15sm3846357wri.50.2021.12.08.06.26.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 06:26:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gst-plugins-bad: Bump cache versions to avoid libxkbcommon
 sstate issues
Date: Wed,  8 Dec 2021 14:26:50 +0000
Message-Id: <20211208142650.579712-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 14:26:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159359

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb              | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
index b189eab63d6..1a091025fe7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
@@ -18,6 +18,10 @@ S = "${WORKDIR}/gst-plugins-bad-${PV}"
 LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 DEPENDS += "gstreamer1.0-plugins-base"
 
 inherit gobject-introspection
-- 
2.32.0


