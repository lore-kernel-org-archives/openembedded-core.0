Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.24866.1611512815157708930
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 10:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qvlIrQvl;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id p15so3414677wrq.8
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 10:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CbtK+tY+P/gRWTI7oNHXaIJdcMHYpt54fI+etZm9PyA=;
        b=qvlIrQvlRBhhSWCMY65kYudXvUdNZCixht0dUrS6A2WMr9jngtNoVpfODJMeyOOyXw
         lvaf7xfiYFkCAgHz/bKXmnJ3MyaaX4zu7o2robjYMY+OCk+5/GMkOQHOMgmQDlxcsEsl
         IJmYDbINqMQLLE2oNnWN2l29zcVWUZF6jcxQEHQKe/+kyVxc2dSqdVgOtkpNMUFecZ1+
         w6z3VeYzr4CxTYgvXoa6ybA1+NNIs/5ul6zwLv+eNAh9eXpTRw6Nze4lMTP+ksv/WlQV
         j6+LX5uZfrqRbDGltSuSC4VqPWqOL0FqxHzJIjGHttBJbGkP0sqH0kmPWF547UvB0cXO
         Unmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CbtK+tY+P/gRWTI7oNHXaIJdcMHYpt54fI+etZm9PyA=;
        b=gdhSzCss8YhPyzrSQpjLJp5CJHc8/GyEdQEvKGRU2oLOkzCSflF2whR+7EQOdXPu2v
         tBdCr1AD6qGJYCTKo1/wlczNw6mYFLb9yhiOlnkoA1rlJSzhhD+f1eGilpeMhsciRdyu
         AT6h8iHpKf2jfoSJUlF9qIXWUysCIkxgKyQbQmodkKlX222wcup0gLEcpq3nkNVkqNWP
         lMQchNT5KAKBwXVVf2rLLC4rQk9IzTZ3PvMe45l/k376fARKfRw8LuyRljNAtihIgczh
         IRstfWMZ70sxkhOG1sRfyasF38NPkEjDJDp+xB8mGvJ2z2pdyxwZYQebN7u4nRbjHBvI
         agnA==
X-Gm-Message-State: AOAM533uMIGwegctY2JSID3Ix8ON3XZs502nSzG1L02NTMdYWvBUcMmS
	S+kQZQwAl8axgRs5+c+alBM/8IoxyCG9yw==
X-Google-Smtp-Source: ABdhPJzuCo7l+ppI6PUojU510ikv+An/jhps6jr2YWsHPr+U5u/wLSDhYgATrsGuhfcDuz+Cfmmv1g==
X-Received: by 2002:adf:f8c9:: with SMTP id f9mr185328wrq.104.1611512813671;
        Sun, 24 Jan 2021 10:26:53 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id p18sm18365509wmc.31.2021.01.24.10.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 10:26:53 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/4] spirv-headers: Add receipe
Date: Sun, 24 Jan 2021 18:26:44 +0000
Message-Id: <20210124182647.1613511-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/conf/distro/include/maintainers.inc        |  1 +
 .../spir/spirv-headers_1.5.4.bb                 | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-graphics/spir/spirv-headers_1.5.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b0ddfb89a8..baad4a351f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -668,6 +668,7 @@ RECIPE_MAINTAINER_pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-speex = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-speexdsp = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-spirv-headers = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER_pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER_pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
new file mode 100644
index 0000000000..14723f951b
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Machine-readable files for the SPIR-V Registry"
+DESCRIPTION = "Headers are provided in the include directory, with up-to-date \
+headers in the unified1 subdirectory. Older headers are provided according to \
+their version."
+SECTION = "graphics"
+HOMEPAGE = "https://www.khronos.org/registry/spir-v"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
+
+SRCREV = "f027d53ded7e230e008d37c8b47ede7cd308e19d"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

