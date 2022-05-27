Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25570C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 16:25:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.5743.1653668707120322742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UEi3Xzvv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 129-20020a1c0287000000b003974edd7c56so1449111wmc.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uu3wRLk4lJHlF40IT+jcsZaBB20xsOlsGBzno/Z2OFo=;
        b=UEi3XzvvwFavkYxJCqyK+4WVXZsXJRzgcZxH3UWexr2bXphCl/A8/ajuNkLQlKXAG2
         n/p+H/49byl7XYioIz8Vi4WYueaiWSY/RUWbxgF/MxyTWfpqBQfICk5mIQ8nMkx6PeQ6
         sfqTR/AHInNxJahUx0fRhG9y1y9vqWe5sRedQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uu3wRLk4lJHlF40IT+jcsZaBB20xsOlsGBzno/Z2OFo=;
        b=wQeduIiJs2plxxSqdjENkMMZRwiragsaoHn9BobxHwQvrT3vhAm3WjWzLNLYzyC6w5
         0iWiXRUA9v+M1IvtV3cR+F2TzmZ+Qgp0wPHbkT5rdza0JIxPpo16eIBdPeG6//zQz3tu
         WWPGHLdcx9mR3RGV75qxfVbmz0IK0j7C3y6ySTZidou5C8xvey98qn5Nj/yEYoZ8L7ez
         AcMVrvmZ6EuEOQSDgsuSWAMXY2OwEgn8Zwvftc2HHao9Wt/Rw5QHAbqdPV98UjSOJM5f
         z9IspZ/0YOGPc37GHvRogsH/SpT9dfhTcTuTsvKX9pWNnTJTHLgYYk4JPYXUeBtG+gda
         /Tig==
X-Gm-Message-State: AOAM533CgJvu2AFcK1b38nwtDiYP/d4VfK08bfI4KZz35E6GcqYNul0Y
	HvVj+T7ylN9qJj/WxP/sK6XD0y2EydZ+Pu85
X-Google-Smtp-Source: 
 ABdhPJwQ4YSzLxuMkeGfmQRl6OXInX8Yx44sJeiKNHtLl/iSca1D6vhTaaZENn7KYNK+X7/ubNsLtQ==
X-Received: by 2002:a1c:4c16:0:b0:397:56cd:c8d5 with SMTP id
 z22-20020a1c4c16000000b0039756cdc8d5mr7842275wmf.4.1653668705503;
        Fri, 27 May 2022 09:25:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6a82:36c1:b105:e682])
        by smtp.gmail.com with ESMTPSA id
 y12-20020adff6cc000000b0020e6470b2a7sm2049715wrp.85.2022.05.27.09.25.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 09:25:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] Revert "meson.bblcass: Remove empty egg-info directories
 before running meson"
Date: Fri, 27 May 2022 17:25:03 +0100
Message-Id: <20220527162503.463372-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527162503.463372-1-richard.purdie@linuxfoundation.org>
References: <20220527162503.463372-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 16:25:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166214

This reverts commit 47d9d90b4ec7d04d6f3f1a9b97c0ab7f1264a88e.

This is no longer needed with a patch to fix importlib in python.
---
 meta/classes/meson.bbclass | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0bfe9458118..b265e6659fe 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -140,16 +140,6 @@ meson_do_configure() {
     # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e59916c18901cde90fa2b3
     unset LD
 
-    # sstate.bbclass no longer removes empty directories to avoid a race (see
-    # commit 4f94d929 "sstate/staging: Handle directory creation race issue").
-    # Unfortunately Python apparently treats an empty egg-info directory as if
-    # the version it previously contained still exists and fails if a newer
-    # version is required, which Meson does. To avoid this, make sure there are
-    # no empty egg-info directories from previous versions left behind. Ignore
-    # all errors from rmdir since the egg-info may be a file rather than a
-    # directory.
-    rmdir ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/*.egg-info 2>/dev/null || :
-
     # Work around "Meson fails if /tmp is mounted with noexec #2972"
     mkdir -p "${B}/meson-private/tmp"
     export TMPDIR="${B}/meson-private/tmp"
-- 
2.34.1


