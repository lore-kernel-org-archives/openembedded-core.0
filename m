Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.3195.1595273526140638219
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 12:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UARebXkA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id w3so613412wmi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYylmUQrHwla2dcudBx+jJ0h+1nI5G3X46pp81b6LaE=;
        b=UARebXkAtVR1YEM0GuzGIUjMu/Lk/lTEp/YBUick+SA/qcjroXfk8xAxn5+aAjeONd
         rmJtIFrEtl/iQoveh/HndE6CSzOLLVgLgycDgJaRcLOk+GFCTrOvOlQ1vNaXvQAnly+Z
         OGOAjs9iAzWohAH2MUxtLjP4oPP4QOI6ORyfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rYylmUQrHwla2dcudBx+jJ0h+1nI5G3X46pp81b6LaE=;
        b=sBOesvVnbPdKmO+ZNqDzfdtp8XpLt3UhM5q0sqz1z1MLe+mYAfeeSBJskwGridrIX4
         LKDbo8F2ivjN7a5RhvkANIEiy0UDEwajA7OV43yP+/TeMp4HXNiQ0EiulzoMgygQeow8
         9f33M2m9e4z6tAlurZluAVKyifgnkq9hEHEZiZQQXJBx332MZgB6H5MoWVji1xkNqM4z
         Fr3ROasU/l8a0C6MjDQHBnBHDOapeQ/ixDYJBX/4YJGOS7XnWPJBCy0/a+TE2FEQGAw+
         RHEm7ngRE43e3bEHbrWoN9VivlSSXa4rn1he18IZuTEVXm+LPvBgxoGK7EgXzyIFeLlv
         CTIg==
X-Gm-Message-State: AOAM532PT2GQ6wynWldzfQ3BU3iSNL0F1g8fH6MT4UXtsgP7TB6l6eKb
	wi+WXnIaxa9mkiqOGqaVZIF1c3gnB34qig==
X-Google-Smtp-Source: ABdhPJx2G6llf1uZa8RrE/0kOl6AqFTfKH9MNEo9dNxoQHpGOKWH+VUgl7xg4EUWMI7A5qYrmn3cFQ==
X-Received: by 2002:a1c:2dc6:: with SMTP id t189mr811551wmt.26.1595273524461;
        Mon, 20 Jul 2020 12:32:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5.f.a.a.6.6.c.6.8.7.0.3.0.b.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1cb0:3078:6c66:aaf5])
        by smtp.gmail.com with ESMTPSA id p14sm2843589wrg.96.2020.07.20.12.32.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:32:03 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] pseudo: Update to add OFC fcntl lock updates
Date: Mon, 20 Jul 2020 20:32:02 +0100
Message-Id: <20200720193203.100741-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds in support for the OFC fcntl ioctl lock flags, removing
warnings on some more recent linux kernels.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index fcadfd96ac5..9a22304bbaa 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "067950bd9415fafcafb2bf32c0e10df4f2ac936c"
+SRCREV = "8efb082863ff0ceec7b7e46f9a44750e12f48039"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

