Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.20857.1621847648202102349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N3BE0iMS;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id k14so37230819eji.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxbZtmKESvPadC+B/t8wLPmQ2Y0yB0XdkO2W3eRRc/4=;
        b=N3BE0iMS4PU9x7oP4KUoqeKsQx3WZ4l4RBbV4oMxDO/tm5wFzxEZkrNXXvEqHQXEC/
         83rCsREegSo+ftPE4kdzfcinooqWJUz0LDRpB78DmL5Z7zotGJADqTu+B/4nM4PnVxzT
         e5TtQ3eP5R/W7N88msiQUs4xK+B5a7d6En4b34YZgf7FI4pdZPFXDy1bKR1Gc6gdwA1u
         UWbX0D3d3wj5vVbh3/mR5Y6mvAKh4SqiNiEOUT28fXY5NogsDEsNb6XjeJ8H+YLq5Ssh
         U9jONWw9DtVkwpOkJCwoTAJfxgRc+aR+Cgx6TEia3Q+stAEhdrwRW2KRQZlBuISKlN6R
         YX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxbZtmKESvPadC+B/t8wLPmQ2Y0yB0XdkO2W3eRRc/4=;
        b=g+nWvg2yEM8dGUrktZOLYoCim65h2HX+CqIAUacClakZGms58cUrvz7UO/L0cQkeVK
         WtO12m9Hpze4mEg788nQbq92NaheZ6GdcI6SC2iw8FwYTqtp7O3I20TELzScKQVR0Lu3
         APDpyaXkULKPXB5w73uLXNoy6fv4jxzCNBzTwzHhwwjWoF4G0VkS1IsywD3rfr4Tzvlh
         lxirkIaIX+S32TEnXKwCUpE9CMTKO5nrmvafk37wIEKdp8nccXaSZDdRyftiTiTl7vJV
         x/B/K8PX9USep2cEnTTTSn8hGt/4zlhnazkFwSSWWc89mQZyxH0KzDRmdZeO1cNYj4OP
         8zuw==
X-Gm-Message-State: AOAM532TLq4L0fhcqQxEVJxLf2GrtCXLrH9s3i89OpDjVAwpOcaPwbSs
	l0zBWs/ifJFRXoWY+8fpLfIWjHD91XA=
X-Google-Smtp-Source: ABdhPJx+esqkH2qaCXV3xFw0u5VGVG2S4DtVDwp3f36YQxWX9gRrnnsWdy6A2mZb49bLFxyraofQAA==
X-Received: by 2002:a17:906:1299:: with SMTP id k25mr22461511ejb.139.1621847646817;
        Mon, 24 May 2021 02:14:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/21] mmc-utils: update to latest revision
Date: Mon, 24 May 2021 11:13:31 +0200
Message-Id: <20210524091347.419253-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patch as upstream has fixed the issue.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...tra-braces-when-initializing-subobje.patch | 32 -------------------
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |  6 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch

diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch
deleted file mode 100644
index 12707357b2..0000000000
--- a/meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 04fbe6ddb5f1e02efbcae3cdf5beb16757a98948 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 10 May 2019 12:58:01 -0700
-Subject: [PATCH] mmc_cmd.c: Use extra braces when initializing subobjects
-
-clang warns with -Werror,-Wmissing-braces, as following error
-| mmc_cmds.c:1886:36: error: suggest braces around initialization of subobject [-Werror,-W
-missing-braces]
-|         struct rpmb_frame frame_status = {0};
-|                                           ^
-|                                           {}
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- mmc_cmds.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mmc_cmds.c b/mmc_cmds.c
-index 19a9da1..838e8c3 100644
---- a/mmc_cmds.c
-+++ b/mmc_cmds.c
-@@ -1883,7 +1883,7 @@ static int do_rpmb_op(int fd,
- 	u_int16_t rpmb_type;
- 	struct mmc_ioc_multi_cmd *mioc;
- 	struct mmc_ioc_cmd *ioc;
--	struct rpmb_frame frame_status = {0};
-+	struct rpmb_frame frame_status = {{0}};
- 
- 	if (!frame_in || !frame_out || !out_cnt)
- 		return -EINVAL;
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 8fe606915e..bdd0bf7f1b 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,13 +5,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "73d6c59af8d1bcedf5de4aa1f5d5b7f765f545f5"
+SRCREV = "43282e80e174cc73b09b81a4d17cb3a7b4dc5cfc"
 
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
-           file://0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch \
-           "
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

