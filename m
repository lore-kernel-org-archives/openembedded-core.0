Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE82C43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:19:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.2242.1667359135724434779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YHJSK/4O;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id j12so15359408plj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U02+38X4mpWzsJVql31/ytiILZwOmFRJCvHrtc4ooZs=;
        b=YHJSK/4OaznAU2HXWO5UGDshZSdhLQ+NFnG3tDplj6tz/aDftLnZwyizSwfUFdfCpv
         tS8PjmWUXzjVYjyzADds2a0+Hoc/yvMlc4KxG6L4CH+amCceoxGHQs40mQbMltZQIF6l
         8lbRdNOTZP2LnpBbUiBiUF9nsRrXKDHaGdRdagfdNoow7s7At4X7MdVNtaMocbeeSDVC
         zNgs0KkjNhSchMlUZjyWg7jTC9iBgbzZrGYxPQo27J9ZL+6Vll3n8HXrLVXnzCow/krz
         HSAluFBkXD+TbPzAGQgj+94vQbIFWfjAr1c3qgXCyH7vhI7YuL8NSPULkL6es+sRq31G
         Vpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U02+38X4mpWzsJVql31/ytiILZwOmFRJCvHrtc4ooZs=;
        b=4rrrNyR8BBUmmMcAhsImzOgshmmGoSBWSFdadnSnrcJ37HJhAXkBwp7mIPtf1IK3x6
         IwenR0b3tbwdRHTyT6plCWQGV5CH8OqtUkUW8C731zeH91+rD59iy0XmYzpuJ41yfDB0
         NJITvSPthgLL8uuJ9YxYTGBsD8oMnr2eoieEHGuiyt/+Pn0plyHKv+ipLSyh4fsLfojB
         77aSV1FwXdOEQwhttbDhLQNRrEVJtyWCGQpP+JXxstVa8/CWsW5cJiMClAnCuHy03pKf
         /a0dyI32ZitLwO6FcOKTgblWnitwW2Jeq/bOFysl+GnOAUNtLHvuCn6nwGinA7Wy4Cdu
         DZhQ==
X-Gm-Message-State: ACrzQf358qPVUm80wnWC2ketyKy5S2M+euu6zFjeNx/CEA9QxjI/GIZf
	wt4hlRgZ+6hxfL+0RnuxqUjc4Amy2nm34w==
X-Google-Smtp-Source: AMsMyM5RlxR6lfIGvcW5eTdXUOodIazXDv5W8vN1nc4SdMNQp5WDS0uW8uq3z2NjULsOABb2a1ZxbA==
X-Received: by 2002:a17:902:c1c6:b0:186:994f:6e57 with SMTP id c6-20020a170902c1c600b00186994f6e57mr22411995plc.17.1667359134734;
        Tue, 01 Nov 2022 20:18:54 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:18:54 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 07/11] python3-more-itertools: upgrade 8.14.0 -> 9.0.0
Date: Tue,  1 Nov 2022 20:18:26 -0700
Message-Id: <20221102031830.3606777-7-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172569

https://github.com/more-itertools/more-itertools/blob/master/docs/versions.rst#900

9.0.0

* Potentially breaking changes
  - `grouper` no longer accepts an integer as its first
    argument. Previously this raised a DeprecationWarning.
  - `collate` has been removed. Use the built-in
    `heapq.merge` instead.
  - `windowed` now yields nothing when its iterable is
     empty.

* This library now advertises support for Python 3.7+.

* New functions
  - `constrained_batches`
  - `batched` (from the Python itertools docs)
  - `polynomial_from_roots` (from the Python itertools
     docs)
  -`sieve` (from the Python itertools docs)

* Other changes
  - Some documentation issues were fixed (thanks to nanouasyn)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...more-itertools_8.14.0.bb => python3-more-itertools_9.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.14.0.bb => python3-more-itertools_9.0.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb b/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb
index c955f93d9b2..fce3aea8977 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "c09443cd3d5438b8dafccd867a6bc1cb0894389e90cb53d227456b0b0bccb750"
+SRC_URI[sha256sum] = "5a6257e40878ef0520b1803990e3e22303a41b5714006c32a3fd8304b26ea1ab"
 
 inherit pypi python_flit_core ptest
 
-- 
2.34.1


