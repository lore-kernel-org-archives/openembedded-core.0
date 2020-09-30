Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.6589.1601504129917647215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TJ5EgYzm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id t14so2108403pgl.10
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jFZ2CTq4MBnHrpZ3SXtCSu4eIJD7hgx5N3Jy9DnvMf0=;
        b=TJ5EgYzm7rfyCAYCNBHJsDVX/20EJC4PDXn9pURojJ+Z+i7AroEDwvz9wAAI9wj1BB
         F8P+a4znaEnxs9XHbmlC+02wNSTFO+/HVj7mDYSlSSJw/8CXc9YRaeThXEDdkL+0515u
         bPggpFY9d36YJSi9wwDxPna2Q0AISUteZ1f2PHgw/edJNmQKwY/4ED7G4Y/kQZI6/lVH
         W7TaXpiVJ8K36i6WfnEhY5FbpeJPL+JwliyfpCgI4BvZ6nV4Jrq5AZAoJnfioBiwAFJ3
         7fMIfdFyLrvITN4/S9f+VKr26F5ViNsIEr6XzrbyBG0/RkUxHugbxIqNWdh53UMtTVRB
         6dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jFZ2CTq4MBnHrpZ3SXtCSu4eIJD7hgx5N3Jy9DnvMf0=;
        b=pWiE9MMSOgYfoU7d2CLKh2vNVfaY+97w05eIe2hDDYKcJyEdiqPOkCPTVFNijMXjQu
         x869dmCeueL5BZxOdQfgLs5B6CQcU8AnOyowzsBLPh+68Zt3BCYk8LYMLczuJtOgbAr7
         QR04OlLz2s/0k4DIYaZHtNr+ybT3w05IuVy2gtG0NMI1nBIaVAunWRL7mcyWM0irc1gi
         anANH7G5s5fpxPJzjJqR9gpKokw0YTCDQ2Xmi7Fg9z90QNStgscfklE59XSWHD9dufRb
         wgwfYCN1jg2Yz//mzzcplG5OUxaJ9QcRd5EJQwqJi+VvD4+6Yaf+ZKUub5jRMjR/jEvU
         YRLA==
X-Gm-Message-State: AOAM530c8keUd9J0J72QVnoBz1458XlGrIic4BXw6sJ+mB+kmIQL6X9K
	W5g3TffFqchzNDNmBkoXUBSgj/W8+uYgVewcT/U=
X-Google-Smtp-Source: ABdhPJwkIc01qM1qyJ2uJz/bpRxxrAYapJoIaPacsbiE5pwKDx57Pz/V174legMXRVdqLIWlPXnN3g==
X-Received: by 2002:a17:902:b215:b029:d2:56b4:65e9 with SMTP id t21-20020a170902b215b02900d256b465e9mr4268713plr.53.1601504129000;
        Wed, 30 Sep 2020 15:15:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 34/41] linux-yocto/config: netfilter: Enable nat for ipv4 and ipv6
Date: Wed, 30 Sep 2020 12:11:36 -1000
Message-Id: <271ed4e1c3528310518b1729759c92959ac41e8c.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    80452c7c245 netfilter: Enable nat for ipv4 and ipv6

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 788623ab2913e760da9405de1c3a2633140122eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a0324f0304..12c3daab0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e65e9ff22c5c42c9ae57a4cce45fbf91a7e7ae3b"
-SRCREV_meta ?= "7ed307f65171d331a784ceecb6f56b9f8ecadb10"
+SRCREV_meta ?= "647f4fd91cc47567a7d88f21a6ad7d230d354469"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f835a45870..bc3a1e50e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "f30ce7653a038eb05ef0503d0d15c7c6ec33cdc5"
 SRCREV_machine ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
-SRCREV_meta ?= "7ed307f65171d331a784ceecb6f56b9f8ecadb10"
+SRCREV_meta ?= "647f4fd91cc47567a7d88f21a6ad7d230d354469"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 070486c8aa..f20aa6c618 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
 SRCREV_machine_qemux86-64 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
 SRCREV_machine_qemumips64 ?= "4fe8438e9dea8d0a00f82003277f36785aac9e3d"
 SRCREV_machine ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
-SRCREV_meta ?= "7ed307f65171d331a784ceecb6f56b9f8ecadb10"
+SRCREV_meta ?= "647f4fd91cc47567a7d88f21a6ad7d230d354469"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.17.1

