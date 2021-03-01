Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.5804.1614557850269163300
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 16:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aT6AwvhI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id f12so10468171wrx.8
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 16:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M9u/aUdRyZRoc+4NRZE1yve1EYFc+5xyiivd5UmA8QE=;
        b=aT6AwvhIlbql8Y4+97ZhKh/tnecrDbz6LLMZAnaACH+PA+6FiEgIqY4U92pG0OhYTm
         avuwSFIg1pTZoT0yVMhJItsUVxKXddr2sb8ZJmwZQYG/mNDZ3o1haVPmaMLFZIzNyE7f
         szU7MYStSStIEgpO7tf7x4QQLNTrf9vZ7yJiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M9u/aUdRyZRoc+4NRZE1yve1EYFc+5xyiivd5UmA8QE=;
        b=efIPWnXoIE5L8v9aGTFCoqFok+pewADyqsMu1jMwiWKJlj5Jpwhv0Q2Py1itb5Ix5T
         dbtx8UP2G9NHwhNrXjZ/buSsm+5dfVnPuPlJbzt5nh7XMbq0UGioa0W54dOJ+0Uur6i/
         DdiOfDwJKUiF0/VfnwkAH+4Eth9yzxgkMctNWP84kLRQYa9oV0xfMfllOnOOrJHVkPZz
         3DdRb3tyoQdZhvqy09S++SzW5hYAYZW5BbS91fvzXqTu9MLRS+M5nYrhpnB3xvDOveC6
         eV78oM3gVVVLcL9Bs6o4tvvF4fMss3OwnWXsV/SQw022bzeEfczK5e7J6IHgORHsz5M6
         NBPw==
X-Gm-Message-State: AOAM531nnLp/4hq0pBSMBwC3wGOwm8iIaEqtnVWic/ps3NOI7lmqTcXi
	CxxoGdVsYBLYip8odsvYeuiguTmJvXU9Kw==
X-Google-Smtp-Source: ABdhPJyz9nR9SQEKgXq1KykF62E6N6vej9HWahpuyczDZIMey0s1kL5dkG8mOIrHjFV5oCRWhBTH6g==
X-Received: by 2002:a5d:6048:: with SMTP id j8mr14497557wrt.115.1614557848696;
        Sun, 28 Feb 2021 16:17:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id c11sm22653836wrs.28.2021.02.28.16.17.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 16:17:28 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] diffoscope: Upgrade 167 -> 168
Date: Mon,  1 Mar 2021 00:17:27 +0000
Message-Id: <20210301001727.2163322-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301001727.2163322-1-richard.purdie@linuxfoundation.org>
References: <20210301001727.2163322-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This includes a fix for the 'hang' on larger diffs with html output
as seen on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_167.bb => diffoscope_168.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_167.bb => diffoscope_168.bb} (88%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_167.bb b/meta/recipes-support/diffoscope/diffoscope_168.bb
similarity index 88%
rename from meta/recipes-support/diffoscope/diffoscope_167.bb
rename to meta/recipes-support/diffoscope/diffoscope_168.bb
index 74cd8090719..9d112d2ce88 100644
--- a/meta/recipes-support/diffoscope/diffoscope_167.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_168.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d95cef5b3eef49fa1c811c1ac103f7f7cca4a0ebabc674e4283b51f28309d242"
+SRC_URI[sha256sum] = "c6f1dc3e75b7e2e5ceac4f857fbd2ee0ddb3f0169c2b39ea9187af34208e98de"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.27.0

