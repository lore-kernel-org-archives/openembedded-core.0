Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AD5C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 19:39:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.942.1651779545512294726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 12:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q+dP/sT+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v12so7363536wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NPjcljQYPs61IZADgp5+gdZW/3Uo5j7rNEoNjnGs2c8=;
        b=Q+dP/sT+uYb3Llpze7CkFfoZU0BeRsP8vVh3UyMkTSKv2o/dujQHLxt6JQO6qE5Jax
         HhQlaeA3xK3wUpZ60bh2qUvWOBRTzTMz0Ozisn/VliAcOQR0CDlNtqYkQJwT9reawRlY
         2UZD/sI7DJZxQXtX/TPrXT2fjYRaODyECo/X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NPjcljQYPs61IZADgp5+gdZW/3Uo5j7rNEoNjnGs2c8=;
        b=K1sIlGJ5CoLWvkuwksTvoGttpJP2ikiUtdZ18XcPd7pADSYSVytvJBoiYbhJ16ZVK1
         DUAsfvNXnPweSODUQOu1TXa9ho9t5lXnqoR/24Rpf4J/KhFGrKEi2rwiHgt51RdQxdlg
         8v9eKBNHpf8NvW3zc3Rg9BJpyvZOYuXwuMRCJrfNXQEcrb6fsgGBX7Myv5bLoqLNqLVA
         hYcaaVvq4TwfW4o9z06pDxw/N5bd9aC1z/fcbbCnFBgfbcILYGAdBJ4CoI6hk3KycQkK
         TAnbBYIcVTdX31/q/sm4pt7FshTX+Ef2W6TOW037d+P7Vfam2SLSvigm4B3iSOeC1DVa
         C1mg==
X-Gm-Message-State: AOAM530koeDTiRr0Ryvej5NdPq+sqrwDug6hezzgH6TR/w9g2UWhfeqA
	2cyFvV6dsBJNpsyemskXtdUjlRBDx6I4FQ==
X-Google-Smtp-Source: 
 ABdhPJxCG5XnVOYv4eOM8tGiNE4eKTtHXKRCCCY6zMy3A4BtuQQnVRbZoU36R173BbbHjY/Dhb1qJQ==
X-Received: by 2002:a5d:43ca:0:b0:20c:52ba:6a67 with SMTP id
 v10-20020a5d43ca000000b0020c52ba6a67mr22039843wrr.312.1651779543380;
        Thu, 05 May 2022 12:39:03 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:28a1:bf56:60b5:b14c])
        by smtp.gmail.com with ESMTPSA id
 g6-20020a1c4e06000000b00394708a3d7dsm1268755wmh.15.2022.05.05.12.39.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 12:39:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cairo: Add missing GPLv3 license checksum entry
Date: Thu,  5 May 2022 20:39:02 +0100
Message-Id: <20220505193902.3111857-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 19:39:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165309

The trace tools are licensed under GPL-3.0-or-later but this wasn't
listed in LIC_FILES_CHKSUM. Fix that.

Ultimately we could disable that license if the trace PACKAGECONFIG is
disabled but I'll leave that to someone else if they're keen.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index 0b5d1d548f6..67081bb8cb4 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -18,7 +18,9 @@ LICENSE:${PN}-gobject = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-script-interpreter = "MPL-1.1 | LGPL-2.1-only"
 LICENSE:${PN}-perf-utils = "GPL-3.0-or-later"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77 \
+                    file://util/cairo-trace/COPYING-GPL-3;md5=d32239bcb673463ab874e80d47fae504"
+
 
 DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 
@@ -53,6 +55,7 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
 PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
 PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
 PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
+# trace is under GPLv3
 PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
 
 EXTRA_OECONF += " \
-- 
2.32.0


