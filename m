Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.225.1616596819770595350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=D136UuYx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id m7so14776464pgj.8
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oPvq/qpgmHKi89ZOguf9fHa2YpYD6qTDSFiKIyM2HkI=;
        b=D136UuYxzfFA361T780vpWaxZT3cnNWIoACrcqN4JVIt+Qpi+kUxw13TeH6VnC+HNZ
         Y9FoI6B3JZOX4ea36BsFyChlrEIzcsuDlmoOd9QoKD265ukSKXiMOE0+DdwkAoVl+RBQ
         0yJT+vSvg8JugUUJZfFm5Dk1uwO2xTejQnMqdtRiKYZpqoimsB6NT9JiJwSTplc+5UnK
         vMXE6B6dR3IhbEF0houlcwNF20aJh89N1Nn8MGGamS2+PWXc1qFMnH/gRchsOP6Z8p9G
         RJljrMAeR5pJcc8/jYaWqDmTNYl0BkxCG4jkRmff96Z0oZ0pYR5yPrNO+XwSVqEXMBSU
         VJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oPvq/qpgmHKi89ZOguf9fHa2YpYD6qTDSFiKIyM2HkI=;
        b=X3TfUBzFBuMW1G9Q3maYfc6v3iAC+qO40mELkIT8UtyWs2er+zCdQ4OIkDWm4MiYBN
         eb0OsK+efcxtTu0O2uFakv/Drua28sTwdeOHGWLVpH8+HzHlcvtoS5l9yLpw5fagnFBc
         5OiZhGqgb08DZSi7mE9G8RgzXMSSVU+3tBiyUEk6SF7ygAS925ENp4ywt6gfxp+/dmU2
         +rb51eXyTRRWoCbDMbnPP5OrZLfSAmLfqT12un4cwPPgn/7qQNgsXT0QnsOXAcJKah09
         zwbL2LsVlxTxv6ZYDn9KUNMPuBNBHKQ814vwEOuMoYHvqldUNOMwtixCKwZHkBs1GK+F
         f4Tg==
X-Gm-Message-State: AOAM531ZrZAOh0Sq7F8y6SBXsROLuuMuMmeLcUqbobOkROmgVEEHuAbA
	xgtL/zh4nruchas4sWuo1PRuvK5yaoEYOGp/
X-Google-Smtp-Source: ABdhPJyVgCJp24Ck8eeQZ1n8biqEJKqITCBPiasZzV1VxOuh8usH2YGrjIfILw+laOVnTP/yBSxjnQ==
X-Received: by 2002:aa7:808b:0:b029:1ce:8a32:f5e8 with SMTP id v11-20020aa7808b0000b02901ce8a32f5e8mr3443332pff.34.1616596818725;
        Wed, 24 Mar 2021 07:40:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/21] linux-dummy: add empty dependent packages
Date: Wed, 24 Mar 2021 04:39:14 -1000
Message-Id: <9d166adde55ce8f0ba60c37c0679a99c947b2779.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Wang <li.wang@windriver.com>

some kernel includes kernel-image-image and kernel-devicetree packages.
these patckages are defined in kernel.bbclass
but, when use linux-dummy, these packages are not defined.
so, define them as empty packages for avoiding compile error:

ERROR: Nothing RPROVIDES 'kernel-devicetree'

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8dbae2dd5ac3de629957ca699f823f5438e80163)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/linux-dummy.bbclass         | 26 ++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-dummy.bb |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/linux-dummy.bbclass

diff --git a/meta/classes/linux-dummy.bbclass b/meta/classes/linux-dummy.bbclass
new file mode 100644
index 0000000000..cd8791557d
--- /dev/null
+++ b/meta/classes/linux-dummy.bbclass
@@ -0,0 +1,26 @@
+
+python __anonymous () {
+    if d.getVar('PREFERRED_PROVIDER_virtual/kernel') == 'linux-dummy':
+        # copy part codes from kernel.bbclass
+        kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
+
+        # set an empty package of kernel-devicetree
+        d.appendVar('PACKAGES', ' %s-devicetree' % kname)
+        d.setVar('ALLOW_EMPTY_%s-devicetree' % kname, '1')
+
+        # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
+        type = d.getVar('KERNEL_IMAGETYPE') or ""
+        alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
+        types = d.getVar('KERNEL_IMAGETYPES') or ""
+        if type not in types.split():
+            types = (type + ' ' + types).strip()
+        if alttype not in types.split():
+            types = (alttype + ' ' + types).strip()
+
+        # set empty packages of kernel-image-*
+        for type in types.split():
+            typelower = type.lower()
+            d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
+            d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
+}
+
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 95dc85ff2f..c56f8990de 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 PROVIDES += "virtual/kernel"
 
-inherit deploy
+inherit deploy linux-dummy
 
 PACKAGES_DYNAMIC += "^kernel-module-.*"
 PACKAGES_DYNAMIC += "^kernel-image-.*"
-- 
2.25.1

