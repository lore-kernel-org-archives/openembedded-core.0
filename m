Return-Path: <sanakazi720@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00979C28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 09:28:24 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.9940.1741944500165397094
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 02:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QUzG+qGq;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: sanakazi720@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2232aead377so41224745ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741944499; x=1742549299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF+UxCE8V3JafOWZgPyMgbe/FHA3N3w4YJSyg1Kj9no=;
        b=QUzG+qGqIK7DQdYL06TU3Vlaj2Kd0knd69yBtgxT9Yb5swM9PPO6kd9oPmHLJzNMY0
         7juep/Ew7mnJJi20gJv20npweQfl+HXRnEubZJzlBYzolGgJIqg9exYVRLulQLN9mkib
         syL6RhoFSUAXgAlC9dq8Nmbk95w9kEAbqsJk5Wkh7NFsHBv003omYlvBTvxeTkgZfpfj
         R2DwvmPQOSOECkjuTv47cr05XrVEpvDI85nDVO6URtQW5kCFCC4wjswjO8/Ldzyh9d/6
         ORZ07KTy0YmcdK27SGJlRaY9LpIHq8qcP7ZOdPWp6Eww3vedKnBYQcMK05wOl0c7kyqT
         /lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944499; x=1742549299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YF+UxCE8V3JafOWZgPyMgbe/FHA3N3w4YJSyg1Kj9no=;
        b=IO0i72sCAnMaJqo6K4+T4dG1pY1ScRNVqmCxqEop0M9bQ80ZxeWwuLaD0LA9UwPlcm
         +gG4xjcFYWT1sQeeNSuPEeNUOaKkW3iK9dUWoMZ2HbZRufpCbnJ2fec6JinqaTr1wgv2
         cLAiOujO3W0xK7oa1UCwaYLdDm8UM2fPXtXt13qGwQwOIKTAmXPUs9pIWr2sBFCBmMam
         uQ5IjRyMvChpzCk17Nj08hb60eVAUnH8D75ivp999jsLsnyzMyagl9Jb63O5VjAEhtLw
         VNyZwDBHhB7GB5argFsz0UIwmSqr/uOsYYEY10p+4ZA6YsyX1IPd7y9qBj/ZaJrRyosk
         9bYw==
X-Gm-Message-State: AOJu0YwvFW15Gbz9WfxDKD6muXZhPttvce1UezlmQ+kfsb++JAk9eaDw
	k3CPX7TgB37/H+hCRM7lBzuThPN9iNun+XuFE9m4LiDAbLQ2oFHZ3En25g==
X-Gm-Gg: ASbGncv6V9NXxvqNvKXkdF/J6qSC7ThC1MO/6gzD3WW6e8ZY2Nzr7xgpRYLbmw24yKb
	NQDJLH3BLokkD0TTy6HvBCn9pcuRaqbEaqUzKJ8W+SR+GW+AGtWhtiffyV1G/fvk5zM9X9lAmyv
	Zcy94bBhp6LJrzJAdxeezpuyhyyYDA/C7+eyblw3QbBxLYHrJfzNw3O0SyQitSMTRMv+cAK8p/F
	vsBmMlDCQkMzyQ1+Ka04S3CSwfL6Lcg5otseAI6d9Bl4J6u6fOqkx9rUermkbIPQ+OyBiNjR7WN
	nVUY9dFusNiPoqE26CRHxCrtLmnYW+XEzvE0I4fox5uLp4BDYcexlT+I/xxp6ZNy
X-Google-Smtp-Source: AGHT+IFfRDs2tnzj0T6VYKIraNGmPd9KPPdFgFnqeS9nOBRSVgGmkLOxs0b+spCVHGJaNVUk7F60Iw==
X-Received: by 2002:a17:902:f54a:b0:224:23be:c569 with SMTP id d9443c01a7336-225e0a623f1mr25348945ad.22.1741944499104;
        Fri, 14 Mar 2025 02:28:19 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c16:2c8d:afef:6fd8:d5a3:eab2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68885acsm25442145ad.32.2025.03.14.02.28.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:28:18 -0700 (PDT)
From: Sana Kazi <sanakazi720@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 2/2] gcc-cross-canadian.inc: Fix buildpaths error for pthread.h
Date: Fri, 14 Mar 2025 14:57:55 +0530
Message-Id: <20250314092755.22607-2-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250314092755.22607-1-sanakazi720@gmail.com>
References: <20250314092755.22607-1-sanakazi720@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 09:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212826

Replace the hardcoded path with /not/exist as used for other
options[--with-sysroot] to ensure pthread.h does not contain
hardocded references to TMPDIR:

ERROR: gcc-cross-canadian-x86-64-13.3.0-r0 do_package_qa: QA Issue:
File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/
usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.3.0/include-fixed/
pthread.h in package gcc-cross-canadian-x86-64 contains reference to
TMPDIR [buildpaths]

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index adcaef2b0f..06f0cef864 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -118,6 +118,11 @@ do_install () {
 	# We don't care about the gcc-<version> copies
 	rm -f ${D}${bindir}/*gcc-${BINV}*
 
+        # Remove buildpaths from pthread.h
+        sed -i -e "s|${RECIPE_SYSROOT_NATIVE}|/not/exist|g" \
+        -e "s|${RECIPE_SYSROOT}|/not/exist|g" \
+        ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed/pthread.h
+
 	# Cleanup empty directories which are not shipped
 	# we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
 	# ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
-- 
2.25.1


