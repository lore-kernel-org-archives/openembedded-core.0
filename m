Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7ACC677F1
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 09:39:08 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.14102.1677231545537961426
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 01:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aTmUY9ga;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id cy6so46982369edb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 01:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HU26cImovhyzYtIYrecYzLdF/pXsXa43YRw3wziuP/4=;
        b=aTmUY9gaR534r5ChuC9cGNDRpsxOVB84v/BcsBxWROhm7W5XM8mv0fyrSUBUf8Enld
         4VfMAG/iGTo3w2yn9ZC9M30tO5LhbeDNsDpQho/Gxzz+UKvvcEu/Bfo/DK4kCAWCJD3T
         OrMaLgB4BEHAmyB0T7QogDNUzmAvE5teMFhVStTBVN2yn3J7pVUcK9UvDYP2SH4X9HrK
         80WO/vv2WsCzxuU6lDGAQ6fd8MrHXWMvC8C1LqObk9TIXbeoHheMqHhanBo0rOVerKZ+
         MNt9IOFDzVDTrAJgPEtAF44P/pzsOIwV6bUIrbA1WmLm9pMsTnOsdOW/vWzGoynZqPFg
         r4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HU26cImovhyzYtIYrecYzLdF/pXsXa43YRw3wziuP/4=;
        b=vZoTBIYI7ExpkeRIjc2A/wfZ29nHeWjX2p4Mn6Q9iBqTJFDwdHHB4PQdLvx2nBPlbo
         BUzujH7UnRKIZp5OzSczm3q5384OSU+H2dPN6HaLU6AQnQBbIN5nmF0Z28P6S1iXzz8b
         vBDoHSP5gnCRm2G5Rmnn9hidR6UVld2Gekd2/i4wkmKOG7NssgxnoiSa6x1fCxCTR7k8
         ZD3HBBZgBTOaM830ThmJNtJkZoFjAu/HfQ9W8cSsMJQrjOip4H2JhLQ6B07glWWqApjE
         3zVTksk1LGmIXcPtBVk6l2bzS55hQje6S//Y48DP86/xvmAzKkQDscPdTCwmdKujJX3Y
         4SaQ==
X-Gm-Message-State: AO0yUKUJcPNC4130M0F35rc3fYAmYjtlesejjQejSuzM23RULCeCGz5S
	cTXpjJOwd7kvCF3bdxzpBeDiEtPyI3A=
X-Google-Smtp-Source: AK7set+3Wh6ANBSUESm+UfTrh3LrGGc1rZN8QnFSTSpWYl1RaDBxczoxATkH5tOzCnF1WSbYOWhCAg==
X-Received: by 2002:a17:906:95ce:b0:87b:3d29:2990 with SMTP id n14-20020a17090695ce00b0087b3d292990mr22794711ejy.9.1677231543705;
        Fri, 24 Feb 2023 01:39:03 -0800 (PST)
Received: from localhost.lan (BC24452B.dsl.pool.telekom.hu. [188.36.69.43])
        by smtp.gmail.com with ESMTPSA id n27-20020a17090673db00b008d173604d72sm6478498ejl.174.2023.02.24.01.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 01:39:03 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 3/4] mesa: Rename PACKAGECONFIG "opencl" to "clover"
Date: Fri, 24 Feb 2023 10:38:49 +0100
Message-Id: <20230224093850.3393567-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224093850.3393567-1-zboszor@gmail.com>
References: <20230224093850.3393567-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 09:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177666

There is another OpenCL frontend called "rusticl" now.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 70f9b6fc17..9ec10c49ca 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -115,9 +115,9 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
+# "clover" requires libclc from meta-clang and spirv-tools from OE-Core
 OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
+PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
@@ -196,7 +196,7 @@ DEV_PKG_DEPENDENCY = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
-RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'clover', 'libclc spirv-tools', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -242,7 +242,7 @@ python __anonymous() {
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",),
-              ("opencl", "libopencl",)):
+              ("clover", "libopencl",)):
         if not p[0] in pkgconfig:
             continue
         mlprefix = d.getVar("MLPREFIX")
-- 
2.39.2


