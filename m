Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3008.1793734895111209018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 11:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kniNG/j0;
 spf=pass (domain: konsulko.com, ip: 209.85.214.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5fb79ce82so30046375ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 11:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793734894; x=1794339694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGTKxrJEsRZbipkFUQNinbeimXk1wgpC/E4jhY61fTw=;
        b=kniNG/j06gWPjDZgdYq4qN2WRWcXhxunaX1srmOizbwi8SSfXHaVw3sMzjxMyjogxT
         +KJTdR45r9gVBRmAHkI8q+vK2fqXCQunr3+xY1kOsD4CL5GbwL5qxHqu3jFHJy7G4XGx
         AVVFJO2gkEEveWNJBj4CeOriBTPx1qXMclj2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734894; x=1794339694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGTKxrJEsRZbipkFUQNinbeimXk1wgpC/E4jhY61fTw=;
        b=dtG8kjuxx6Kw8wUVoeWIOrh03WZtv0VUsHlGn4F+98t2FeIQGE6Y3Zsycq+pVp35+e
         CcUMR1Digk9KEgfqg1ohpeVJ7T7ekmC+IY+n1STsIzVSHIq58qyYSYf3DZnfsL3XRK5w
         54vcjRWiP1ah2DkrcpDoawWBXDO1IYnT2CkR+CM5AbqcCWe1EqW4FvLspi8Gfl6+7jxm
         naIX99u3U0i8Te/HIRDRKsxzi4wFYxz2mJKJJnzrfC8ASZYkNc5EUwpoK7j8whWnQNI1
         Npl1qEu2OaSBcN+6k/BHe3rW30cxEPw0S9XX+cwYD6flE3R1D2/M1WdZJd6REgmkxpZK
         wlEA==
X-Gm-Message-State: APuU4Z+wzMN/NjwspCEwfncev3GFajm7Eu+gbKJyaZAdpxa/VuXk38DS
	E9fjYyzFQcrcAVaz3GRyU0RudGI2nvA59CSP0VN8zof5pRMcMX99NCPvFLdxXqm/lSu+Mu/6Kpb
	n/laN
X-Gm-Gg: AYBFou3iBYbjvgLrt3uC6MilFNmDIN8aFi/GKpvqiE6332LWYaEDw1QbGA/YJUoe3p/
	vqLAWRoGU4y0FZ01Pah14+40LOR9yjSNV21VUwe01dhFJ9Sa9mOeghMwRNC+3yLfTplpXFa2ii1
	UKjivQSwiIHpEVwUbmYnrjlLBaCirTi0MGbNacdbppLNiPe9avGRqofKBREciVANV72wpUra42r
	I5m+g7f8yG9N6sR47ZsUCzwlZQCIeE3mrDuENoikY5zgCBfk7yEu/4Zk3zX5sZV4FggiOUyzwk4
	CwzWLN9CB7a3rYrM23exom/kwF2NxazOeQIq2dgKr8thHHnz4rWlT8GxdYEYZFMQeGwhIaSG6F2
	kq/fcD0UxavGEvFK++Ba12Rs7e65BI+IIlxaQsLyD1FN9UQOHm+t+dp/l1PfWIjXckiUiaF+huR
	BlDum6fyJrXIVQ3UtTVIz+MJrt1J4AxLPLTB/Jxw2ApxnHkymorFEZGA5bzZztHKRbKDOt+aXkn
	wwD+aioj9u7e97eNBsLgvmc3xyXVxBI9mmRWMwfjOA0FH/SXHCqdWdl+ul+Vt4Yk49z/9wk1i9x
	P7x42+fo7+myuPUm3tfcsemALvhjsTuUFryUy7FDZHeRKA7auqgcg3H3ioajxSjd7cR3pwD4E2f
	jFcjZQBiYJI5tVORyUbTBxDj0nh8=
X-Received: by 2002:a17:902:d60e:b0:2e9:56a4:8571 with SMTP id d9443c01a7336-2eb364b8ca1mr136922935ad.25.1793734894267;
        Tue, 03 Nov 2026 11:41:34 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm44562375ad.6.2026.11.03.11.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:41:33 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 4/5] python3-websockets: enable ptest; use git fetcher
Date: Tue,  3 Nov 2026 11:38:32 -0800
Message-ID: <20261103193829.1806542-8-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102011816.3710992-1-tim.orling@konsulko.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 19:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249295
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

The PyPI sdist prunes tests/, so fetch the 17.1 tag from git. This
re-enables ptest, reverted in a0488f2e1d when the sdist dropped the tests.

Upstream advises packagers against running the suite because timeout
tests can flake on slow build farms; under ptest it runs on the target,
and it passed repeatedly on qemux86-64.

tests/trio is ignored because python3-trio is not in oe-core.
python3-misc provides tracemalloc for the test utilities. Set
CVE_PRODUCT to the NVD websockets_project:websockets, since the pypi
default no longer applies and never matched.

Tested with core-image-ptest-python3-websockets on qemux86-64. It takes
over 30 seconds, so add it to PTESTS_SLOW.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
- Drop the test counts from the commit message

 meta/conf/distro/include/ptest-packagelists.inc   |  1 +
 .../python/python3-websockets/run-ptest           |  3 +++
 .../python/python3-websockets_17.1.bb             | 15 +++++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-devtools/python/python3-websockets/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 50b971bace..7ec75757bc 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -155,6 +155,7 @@ PTESTS_SLOW = "\
     python3-cryptography \
     python3-numpy \
     python3-uvloop \
+    python3-websockets \
     python3-xmltodict \
     strace \
     tar \
diff --git a/meta/recipes-devtools/python/python3-websockets/run-ptest b/meta/recipes-devtools/python/python3-websockets/run-ptest
new file mode 100755
index 0000000000..a71ba0b951
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-websockets/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+# tests/trio requires python3-trio, which is not in oe-core
+pytest --automake --ignore=tests/trio
diff --git a/meta/recipes-devtools/python/python3-websockets_17.1.bb b/meta/recipes-devtools/python/python3-websockets_17.1.bb
index b5ee3ec661..d1bec373e0 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.1.bb
@@ -4,12 +4,23 @@ HOMEPAGE = "https://github.com/aaugustin/websockets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
-inherit pypi python_setuptools_build_meta
+# The PyPI sdist prunes tests, so fetch from git for ptest
+SRC_URI = "\
+    git://github.com/python-websockets/websockets;branch=main;protocol=https;tag=${PV} \
+    file://run-ptest \
+"
+SRCREV = "e87ea9be0373edd5065b5e94dfa714cfde23023b"
+
+CVE_PRODUCT = "websockets_project:websockets"
 
-SRC_URI[sha256sum] = "acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a"
+inherit python_setuptools_build_meta ptest-python-pytest
 
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} = " \
     python3-asyncio \
 "
+
+RDEPENDS:${PN}-ptest += "\
+    python3-misc \
+"
-- 
2.47.3

