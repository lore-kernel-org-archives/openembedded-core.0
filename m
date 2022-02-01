Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D2FC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 07:28:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.45856.1643700530539460125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U2pUOjgA;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so1121410wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iZabZf6JLMhQIJxCTczmz8hc1JzjERgl71CHFUhBqSg=;
        b=U2pUOjgA30U27T9eK/PWNwwdOdmjAA+0QUVKn1BV/BURikowP/Qt8qbIvSIgJGsc0N
         je5MWApscNl74oiuAni8m+gRxbolzrE03bSKNisHygqQr1tP2IwN/FuqnZX0u87LcaB9
         1tDdDCiOFwMUfF/YDwfzue0dluZ4Va0E+/+ltURrEEdyc3OOiP/35ZQ84d65EVj1o6Je
         PHPUreH7z1pPkvjASg2sF+zK7hhGEB4tabfVFDt06wrj+wrfzpw2JBfWivHh+aMNjq5U
         g2D6sAsjVGk0ExTwxyghBCkBQ21J/jGJLXoa3MVybctEqEvCoTJQJ6X/EgrtOo6Yy0BJ
         Fc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iZabZf6JLMhQIJxCTczmz8hc1JzjERgl71CHFUhBqSg=;
        b=wbJHfxD/Ns9g6Ot/sTbgKKUF8uiT/U6hXFnZZyOQqi73E2omkxQP3Lxm9UqAbImLpy
         Neah2fJAEtIr7/eoTIjyI4FUiiylifVPfPtBaYbnm2ise89ttqxlTiQHN4Wj5N9rQCUd
         bZ0WwUTF9hXs9WCODy5D40aj8y83LKz7MF9fYHkhTkwKHezigd0ROlxM/TfilUSZc/Dx
         v2ZnJNrGCBkgkKOk1Isp9FELBjELGXGC1TpUSmZ3zGMpNuSjmKMpjnTy68ggsy64vF/i
         qTuTxjY22CEjI+/6rWXuE0gPOAmYL2NNUFftpN7OixJ8/vYyy4tE8L7aFVELb0N1K9M4
         tYjA==
X-Gm-Message-State: AOAM5301bwl0mUd2TjagnX/PLoKzdkDnX77rOiizVRZSDFQuFf3LcR9F
	ndBW6yKrtKnJ6bsLaTSQQqEX2mNy7R4=
X-Google-Smtp-Source: 
 ABdhPJyvKFLkPyZnNvNcK8weq2FzFcYLAY4SDMEBs2fIkUmWE9fqPAqwoXRMyDnV0HIQm4y5WIDycg==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr573400wmi.154.1643700529209;
        Mon, 31 Jan 2022 23:28:49 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 n18sm13667370wrm.47.2022.01.31.23.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 23:28:48 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nisha Parrakat <nisha.m.parrakat@bmw.de>
Subject: [poky][dunfell][PATCH 5/8] glib-2.0: Use specific BSD license variant
Date: Tue,  1 Feb 2022 08:28:28 +0100
Message-Id: <20220201072831.34695-5-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201072831.34695-1-nishaparrakat@gmail.com>
References: <20220201072831.34695-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 07:28:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161149

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 91cd1ef01a3f3883c04bac67af2672ec60e20fb8)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c3ddf18387..1849a6e05c 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domain'-like license!
-LICENSE = "LGPLv2.1+ & BSD & PD"
+LICENSE = "LGPLv2.1+ & BSD-3-Clause & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
                     file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
-- 
2.17.1


