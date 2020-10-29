Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web09.2992.1604001818699419079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 13:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tLOOAark;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id k125so1152080wmf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 13:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FuoAs4Mh59Mn5Pmn8O43smisWydb/Z0bD18AuBDKbdQ=;
        b=tLOOAarkaKGCy1ZCwLu1eFCDfzuyq7+OnPM4gxW3S/YlScLFn/6uq15iY3Bw10VgH/
         wWq89MCFt6x4vz8nfkqfPUHuT6S5/swMF61Dbmu2DdiPlpJencanWpB0MwT87xdQA1AM
         FU/C9l5jE23me/PzTcbsOMhJjmEIqPQ0ezi97g+BhOX24zi1ihqlpIRt5uGkhny59kCz
         F+6UjEXYEt8xMTZ6DeTxYaamggRfEwfuA+k6GZqcccplPJyVw5LL0Df0veBg4jWIekS6
         qX0/f8U7AKda78KAJIcbrrWOfd57U2EXsZGD28u0z7yQSVsZdXXJ6EVxvhus2KBlJeh3
         DdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FuoAs4Mh59Mn5Pmn8O43smisWydb/Z0bD18AuBDKbdQ=;
        b=qnCOzMlHFycN/BseOTK0ExPfpZ4O1fVzCZ+hHLSrqsM3CAHx3sIvPlOMIzxXJPb7x0
         Da5TsgO299TmaAx0/zbS5GhL1ga5md4Z4pzjDSZtuSywhgxjRto39no/EtSOlH1ugMRK
         +H+qr2qLmXxVp8AWgybeh3V94fQpC87YxEoV9n7Ascbv7ct/UDnle06bTKFNf6uQicnO
         GHhWIMRIVgzdRa1/DBrqwoGi/NO8wuXSuLWPSi71q3brMQoTYbbGilAcE1WpIAC4zt76
         gOi0NkjEX7XtS0C76Z0kgKmOlTrZYEPwetRsggJKfr70y2FDTZKASzvgk8dtXBXbUpnn
         cf/A==
X-Gm-Message-State: AOAM530FN2YVWePjfiSHfk9bgHkr/PK1wktNBc3BqRu7Jd/I/ood9fun
	Jf/S/w5ihbswdYcErosnqfiC+2V5tjgxwQ==
X-Google-Smtp-Source: ABdhPJy5b51U0MqiHIEXdERVSpzqZZ6cflFZdC1ZTne/ciOI9s7vbh7+5CpfQZX7DFB1XT24mv4dog==
X-Received: by 2002:a1c:5f46:: with SMTP id t67mr870853wmb.173.1604001817122;
        Thu, 29 Oct 2020 13:03:37 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b63sm1519422wme.9.2020.10.29.13.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 13:03:36 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 6/6] maintainers.inc: Add Jose Quaresma
Date: Thu, 29 Oct 2020 20:03:21 +0000
Message-Id: <20201029200321.1886511-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029200321.1886511-1-quaresma.jose@gmail.com>
References: <20201029200321.1886511-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jose Quaresma is responsible for the maintenance as follows:

shaderc
glslang
spirv-tools

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7935f968c7..158835c024 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -213,6 +213,7 @@ RECIPE_MAINTAINER_pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-gmp = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-glslang = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER_pn-gnome-desktop-testing = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gnu-config = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-gnu-efi = "Yi Zhao <yi.zhao@windriver.com>"
@@ -641,6 +642,7 @@ RECIPE_MAINTAINER_pn-settings-daemon = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-shadow = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-shadow-securetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-shadow-sysroot = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER_pn-shaderc = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER_pn-shared-mime-info = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-shutdown-desktop = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -648,6 +650,7 @@ RECIPE_MAINTAINER_pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-speex = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-speexdsp = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER_pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ssh-pregen-hostkeys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.29.1

