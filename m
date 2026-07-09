Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4550EC44511
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5892.1783591634006286168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3r4Xa8Re;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so13372975e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591632; x=1784196432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+5ixoMjfre4AlUzquQZGaN5hdzW8fXUrjOnsZnTgh2s=;
        b=3r4Xa8Re9IbVI0NLJ0ZNiiuWzDhVWnMf1aF9TWI0rN3UFZpeOwNim71HDn28RcpEYc
         oduxEJFYmCN8nsTxu2wci/V+XJa0arrHSVN1t3Ub2FRdO4Txy7nIU/QLG5euTePdF66b
         xjTdSy/CIyPDYs0FJv+5Azy9KDKatZ1LTjsbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591632; x=1784196432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+5ixoMjfre4AlUzquQZGaN5hdzW8fXUrjOnsZnTgh2s=;
        b=QqGAWO0nSPPtapjThUhRrOcPMFATaCsUlHx1mahNZeNlIxAWPjMjEXnjBwfCFOk+Ow
         4hkDBF8V9D4FcbNYYlxeRKPVL+4QYlEY8HpvNEadz3c6CZOH5J8F7/20utpmkVA2i3DU
         vJi4eO0MuhXhmWszDGciS4gNx7csI8+ZTAj4+PLQyTv+zn/H2fZo4MHOejmEdan0q5PC
         nXHjq/m+DBaHYwSvad3zHVT+FbWtRECQ0RWGCtC0mMqiwt8KnMPsp5iHRupH/ClZCfgV
         xT9Cy/m1z+7oZUlPLn8BMbJgomKpjG0V/GIUEls45V4B/PD3cGSbGkM1yhyUvMUKp7GJ
         tTgw==
X-Gm-Message-State: AOJu0Yzn4wZoHeqC0waOXXYr+zBw+y9BBSK0JMyVrQqLlONnkBm3X0rl
	I7U3HhmQJzanS2Xuu16Rvrx9f4V1++xUP1k5ZurzvylzMtcV5LEZKJLek8XPR1uJYWlrlgbdABd
	Yzd+RC2w=
X-Gm-Gg: AfdE7cnqb7p9xapaO5Cyl1igwoh2AfXSFqQjCzAHp2f5zmvH4BoqVd1PGaszeHSz/O+
	+A2rcfvwBsySStJYZdPvOJiSdVcNcNeEy3QcjFR2MDYm7a/zRkza/A89F6xuJ2mc4BC4ZHlKrW5
	SIBTbs+IZHGbcDkk4qdJJpLXNkTKJ2rfPRBm4pQA99qPXfeWAjVG3dHGZbJWZoEFO4Xux5hoJsi
	QA++HhCc+l3rL6E/mHfpDOmn58PuaQMYFiQfEovhnu0Zokzq3KLNFN2zrO5iMYJw1CDbYvO0LZ7
	kWfJflEFBK1kUj3y0niPEWY0qiCQMGLyVirj/dxrWMJ2CJKeGglQ9oic8rbL+6opqYYYXqQtUUg
	8FtuDg0myobQz3e+VjeQI4In1zLSLJIDS8z5v0DRnODzGC0rioX0ZyzKVh8NfwWe+zYsNYZDaw4
	OLhM9PDPN9gw/vZ7jj1ciOzYLW+a3eqA1gsG0o+jKC/ziJBsbMTswy3mqgzVK8b/RN3VovJ3Ro/
	0lMPPgdSXbQ5AePyQ==
X-Received: by 2002:a05:600c:a55:b0:490:469c:556b with SMTP id 5b1f17b1804b1-493e68bef13mr64258305e9.12.1783591632206;
        Thu, 09 Jul 2026 03:07:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/25] qemu: Fix CVE-2026-0665
Date: Thu,  9 Jul 2026 12:06:35 +0200
Message-ID: <a34f992a27addb9cdbf9f490b65b1944b674d562.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240566

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v10.0.8 stable backport for
CVE-2026-0665. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers
when the fix expands to multiple commits.

[1] https://gitlab.com/qemu-project/qemu/-/commit/4ba877461e6b1a8637b15ff1a8c77ba97639c927
[2] https://access.redhat.com/security/cve/CVE-2026-0665

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-0665.patch             | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f973c0a8d1e..73b2f3e6074 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -50,6 +50,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-6519.patch \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
+           file://CVE-2026-0665.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
new file mode 100644
index 00000000000..9264ba38cc6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
@@ -0,0 +1,38 @@
+From 91e98ce0a879010ef5b5ab5778cc71c0e9e92a57 Mon Sep 17 00:00:00 2001
+From: Vulnerability Report <vr@darknavy.com>
+Date: Fri, 9 Jan 2026 10:35:48 +0800
+Subject: [PATCH] hw/i386/kvm: fix PIRQ bounds check in xen_physdev_map_pirq()
+
+Reject pirq == s->nr_pirqs in xen_physdev_map_pirq().
+
+CVE: CVE-2026-0665
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/4ba877461e6b1a8637b15ff1a8c77ba97639c927]
+
+Fixes: aa98ee38a5 ("hw/xen: Implement emulated PIRQ hypercall support")
+Fixes: CVE-2026-0665
+Reported-by: DARKNAVY (@DarkNavyOrg) <vr@darknavy.com>
+Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
+Signed-off-by: Vulnerability Report <vr@darknavy.com>
+Link: https://lore.kernel.org/r/13FE03BE60EA78D6+20260109023548.4047-1-vr@darknavy.com
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit c7504ba2a560fd884557f6e5142f03b491aad0c7)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+(cherry picked from commit 4ba877461e6b1a8637b15ff1a8c77ba97639c927)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ hw/i386/kvm/xen_evtchn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
+index 02b8cbf8d..5a1ad3782 100644
+--- a/hw/i386/kvm/xen_evtchn.c
++++ b/hw/i386/kvm/xen_evtchn.c
+@@ -1843,7 +1843,7 @@ int xen_physdev_map_pirq(struct physdev_map_pirq *map)
+             return pirq;
+         }
+         map->pirq = pirq;
+-    } else if (pirq > s->nr_pirqs) {
++    } else if (pirq >= s->nr_pirqs) {
+         return -EINVAL;
+     } else {
+         /*

