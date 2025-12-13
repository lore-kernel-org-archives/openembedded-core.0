Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76275D5AE6F
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:39 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3000.1765620093105561455
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GUTpG+XP;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29808a9a96aso27493085ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620092; x=1766224892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAygeo++V7FYv8PTS0GSaHjT3yTSKlqRJ2FF7JbbXN0=;
        b=GUTpG+XPCUkcP/t1FwebmA/r9qC8ARlrepSXd2QjiVWn/9zha1WxInWVVnl9/PANZu
         F9nwu9I659INrBJIOmHo+Nuw4SjgYgFkJ1cuix1RsNmY3rLeDx80EzvLzqdnV1j3fhGf
         cqaJ616WGiBAgPajxQr0mzeBwphardnUV9YWf0zIQr44vmAE4v0LICmAW+p+Vnq+mBcq
         Sw1/FKMjog22odWmWWnCF6CCkcMSRxY8/8OO2FgRWRlIHj9npa5UUaoehLRn+GAmTM2W
         1e0Lp62kamTH6thXVZz/ksWsDV8Yuro3tpqc7TUl2F27yVIBSPHEx22JYPokSo1u7DOV
         FELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620092; x=1766224892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAygeo++V7FYv8PTS0GSaHjT3yTSKlqRJ2FF7JbbXN0=;
        b=oAcQhxF1mqQ+lPAwnhlD+7qxziPjSR/lhG/B06HIw+IorOCXWHA711tahQ1efA9EhW
         orDY5X/1Ga+KWTdu6+0nHnSbwvfrc9r6N1BY51ltUaz9IWd+c8FT65RUj2Q/oyfaMkIL
         jAYVHsv3fwMjon5fAuaKv9Ld0u//dU243dakmR4JMmsM+UFDy0lmdnB5zO5kkJtDFMaZ
         RyfEHu3fLLIKtwkidR4mVNS+jmtHYTQMI10LFfW1ACZ8vX7/Vkp5NWQpJrRF2PdhR/zy
         USvcxlmQxKkjYN5jVL1pjLwZrrJRUVVpRN4gvHrZWM+TqooLU6STzxs9xgg02z0BZk/8
         wu4Q==
X-Gm-Message-State: AOJu0YyAhCkH5CCg53qbS4mynaf8FBTB1lgsXXxL8GV7x9XEBK41Tzp7
	XXD8EwFCp7/APWzaVpasIbkc2mllsdx1gLVi5qBwyJ4khIYeCP+XAzpr5l3Torb0
X-Gm-Gg: AY/fxX4ZW1oR4/SYp2fAdPpRI++FiQInPphJLgXWYX2n73KzXQP/soe39HWs4cQHwMb
	bFb0ErDykFjQA0+NTETvxC1o7fQQLkYtbi0VC4FBja6dkQyAeGng+xg3ERKKnu+1ZFqYxuGq+zV
	WhEdhoFUtgdAVfZEV8xNY//qAtm7D7bKG1deDj1CJ4joe4iL7oLzEfe4+wgtzlQ8OM2VPD1hkgh
	VvoGuPd6v4+AdqsVAUw56qwBZ5W8Ki4g05JZMCSoPe1HoMRqsn0hXQaXZWjhvHf3Qn9nUAckNd2
	bKy5bhxCRa7r8VD0wH7u9hgF4jziqmnhrLCldeui/eN8sDnMlQnlUL+3OL0QRCCv7RNX+YmhfHT
	IESsbGhkU/+/xkLqRUX4ETrtM3POo+K0s8JDI7FhaQt22bb8VeTY+9IX/dHYEbqUD5+b1JyeX5Y
	nvu7tGA8wRhW9pMWn6UgRg3vdt/CoRvckhIa0=
X-Google-Smtp-Source: AGHT+IENm8lXpvX1PslaFEm+ebugRZOnnzkvdvof3A2668eei0bKcxvF0HSGYFY9uzeW6TY5wBSfaA==
X-Received: by 2002:a17:902:f709:b0:29d:ecbb:44d9 with SMTP id d9443c01a7336-29f241514eamr54997525ad.31.1765620092253;
        Sat, 13 Dec 2025 02:01:32 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [OE-core][whinlatter][PATCH 41/67] python3-markupsafe: upgrade 3.0.2 -> 3.0.3
Date: Sat, 13 Dec 2025 15:29:05 +0530
Message-ID: <20251213095931.2571498-41-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227659

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pallets/markupsafe/releases/tag/3.0.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 5bc11d32aeb79773b33ce54989e9dab4e03815b8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-markupsafe_3.0.2.bb => python3-markupsafe_3.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_3.0.2.bb => python3-markupsafe_3.0.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
rename to meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
index b90dd84f48..dace235bb8 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
+SRC_URI[sha256sum] = "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
 
 PYPI_PACKAGE = "markupsafe"
 inherit pypi python_setuptools_build_meta ptest-python-pytest

