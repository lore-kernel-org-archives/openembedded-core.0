Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.1704.1616180323724477955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H1QfBLhB;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id t16so5544166qvr.12
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 11:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UNqmIo1UiStfxGD6aTL0BO9RyrXgMrXWOLJzbYqqhGM=;
        b=H1QfBLhBUQXyU1Y26mQWU2H0u+1BOpo/TWyofn474nrTnZHpDugMgpzTqXZZxJQpYY
         zZNybiCzNGZxzxQJmP4CQQZL+6C4w+zFljTaEmt1rbKb117TQZiZNUDrUD+vFCBvU2CY
         t7kAu2vzmSacP42ykqkz1xT42Ak6lmgO73ph1qhb5Q/VDwcT/PWf4pyQnauUzMpRFnJH
         cQbJcsFM2L870Xhjju5qUocaau0Trr1iFINv+iyiNXnNMmDENVA+9pzsFjZxE+ehHMvV
         xZseJ/fzTPEILOQ1mYF5xMh6JLcIkar78A45VFDdkQhekNIhb9Q5RxIc0XxiGr4Cp0yx
         cYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UNqmIo1UiStfxGD6aTL0BO9RyrXgMrXWOLJzbYqqhGM=;
        b=CJYC1wdJC42WZh42q5LfkFiVlWuRPUPz0nhQUyB5MRvN+UIac8krQjVOrlcch8geIt
         ZrT375P8NF9T2dyXxSVxs162OqexDxM9bMsvKBdCSzZhrszzjakfeFJHPZgWHlC+whGe
         IkK1QNKMKO+v71X7dqMF5Ft94MndyeH29ebr5vdJQEIIm/kWV5Ilha2eKGhOANHOEvKy
         8SQKYxpWiIIGlDRfhSaOUWbVPjc/YMIXUtKJKE9JutNAUX+0blQXTLJKsnDdS1WbQ8so
         072kqLLHoCVGBt9Rfjffi0xs2wABB5miBPL25evAmvznxN4QICxknlStWrdMwsOWsEoE
         88NA==
X-Gm-Message-State: AOAM530lQra5LdIz3jn0/3WO29Xmw/R0nZvYq5YYF4mSsL0XCyo8+7Sp
	TbWp94hXgbYvK1nL4pMOO08=
X-Google-Smtp-Source: ABdhPJzq7N44lLB5s1MSwJ9+0O5ouLeZ0svF2sBsxq8qyvu4yIPN9ThAFdXB/v1HhIC9jWFCK6prtQ==
X-Received: by 2002:ad4:50d0:: with SMTP id e16mr10802003qvq.37.1616180322903;
        Fri, 19 Mar 2021 11:58:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j1sm4402191qti.55.2021.03.19.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:58:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/5.10: cfg: features/numa: Remove NODES_SPAN_OTHER_NODES option
Date: Fri, 19 Mar 2021 14:58:33 -0400
Message-Id: <3253d96a79a21903616fcc49fa13695b0456f2e2.1616180065.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1616180065.git.bruce.ashfield@gmail.com>
References: <cover.1616180065.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to:

    f5babefa399 features/numa: Remove NODES_SPAN_OTHER_NODES option

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 60c3c59613..7b5d69843b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "09e60e61f3a0716c1d715024db69ed493b374352"
-SRCREV_meta ?= "581687c525f24f8e82582e789d39a508dfa083ed"
+SRCREV_meta ?= "f5babefa399359d7a5f880342c03ced78dbd48d2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 852951789a..a903a7ad45 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "828298476280f149282db7209dd18c8bd0f46657"
 SRCREV_machine ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_meta ?= "581687c525f24f8e82582e789d39a508dfa083ed"
+SRCREV_meta ?= "f5babefa399359d7a5f880342c03ced78dbd48d2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 20be08af42..9c122832f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
 SRCREV_machine ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
-SRCREV_meta ?= "581687c525f24f8e82582e789d39a508dfa083ed"
+SRCREV_meta ?= "f5babefa399359d7a5f880342c03ced78dbd48d2"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

