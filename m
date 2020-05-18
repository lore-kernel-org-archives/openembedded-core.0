Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.802.1589820556800757189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lxuCLe0D;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id x2so5210693pfx.7
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=k5p7gx3C3P2dExqJiI0nmgqqEJ2zhJtTUgFd9P2eGvs=;
        b=lxuCLe0DfFTwh3qNqcducSfdaqr9N/ZfDVAxol9U//+/saq70JYANToIqY7wI9pXOv
         nR84N+kFuFCZR5odtFt0IWuJKsJVKCKZYAGk4ACA6oCsrHpy0HbhT/mDV5IoiClum2Jf
         4xgNnfQRS102kn9UldtgOl95W9589dNdTNo4u6XrIFkcRrdg34YL3rPYLits3/r9Y7m3
         ocnZRnZOsO5n18EK1djJvWKb7B6FtESXWrfilXuExBMolVSBZUPnI0WpSPvzt2tGk/bn
         9S9+RDecdzfFEB+wPhrPXPaNiEbuZw7Za8CQHS+bg858w6k0AtDW4qeiFVjPb/O14QGs
         Rrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=k5p7gx3C3P2dExqJiI0nmgqqEJ2zhJtTUgFd9P2eGvs=;
        b=nBV7vMQQrSUTNLVHvwOhHEY0g/8lLhQJJyQPNgBIDu+uId2J133w8WtF35n7r1tQrG
         6AB0eS+m1HKYLk+yoXbb+TxD5qh4fSeDg8526wpZskCNplGPwfOWj4GHJxo9/My+Pfis
         pV2Gv+bev0nCrTaHsZY8By7S5wLcM8FBrnWfJpCVZM905JS2rXKkOEvQ/icRR10WawsF
         a4agTyXoU5CKnsywF+0aFu+lgUYF30XYMpqO7eCju/O9sHmk9tU64rfZA4dw3FroepDZ
         SkCAjK39BOWQ0zU/Ydz2lTbBDR2nQtERYhH8HGuYssmyBN2uaUkJRBHd8y2YNdD3OPU0
         ptqw==
X-Gm-Message-State: AOAM532zBppWq2ar2DGI+I9Vjv8oPpAXa8gtZ88d5t95ft7A+JVPCnZV
	nQ93PdIjohw8unKX4Z5mx0lSsiw7I8BVPg==
X-Google-Smtp-Source: ABdhPJwBIaoON0KrI3Q8TISbFkCmO5LQ/0X0ug2o72M/itvoJIZlgfGlsPCpet17RUCCrjTSYv3KSA==
X-Received: by 2002:a62:62c4:: with SMTP id w187mr18166073pfb.286.1589820555921;
        Mon, 18 May 2020 09:49:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/19] connman: Include vpn-script in FILES
Date: Mon, 18 May 2020 06:48:25 -1000
Message-Id: <8587149c49dd8d1e1a0a0b5cf81e458bfa88547e.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Alejandro Hernandez <alejandro@enedino.org>

When vpnc support is included through PACKAGECONFIG, there
is now an extra vpn-script coming after the atest upgrade,
include that script into FILES so it gets packaged.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/connman/connman.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index d3eeb3be1c..55e5bf97c7 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -194,7 +194,8 @@ SUMMARY_${PN}-plugin-vpn-vpnc = "A vpnc plugin for ConnMan VPN"
 DESCRIPTION_${PN}-plugin-vpn-vpnc = "The ConnMan vpnc plugin uses vpnc client \
 to create a VPN connection to Cisco3000 VPN Concentrator."
 FILES_${PN}-plugin-vpn-vpnc += "${libdir}/connman/scripts/openconnect-script \
-                                ${libdir}/connman/plugins-vpn/vpnc.so"
+                                ${libdir}/connman/plugins-vpn/vpnc.so \
+                                ${libdir}/connman/scripts/vpn-script"
 RDEPENDS_${PN}-plugin-vpn-vpnc += "${PN}-vpn"
 RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG','vpnc','${PN}-plugin-vpn-vpnc', '', d)}"
 
-- 
2.17.1

