Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A9EC3ABAB
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 21:26:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.60661.1745875583313218138
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 14:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PAgtdUOf;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso4720191a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745875583; x=1746480383; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=PAgtdUOfpqWtgI8O0ak1BKW7qMiGIjMbsJZ3dFEKt649+y5prlED3iB+PnOcfUiAw6
         Im0F21ac13x2ob9K/JYHQ3ciT5niDda3frJ1FzUUf2drRlukZINepsW28ZXNvNVZ9tei
         AWHBTMo3/sMC5Eo8rh9wlRCnB2Fqfoxp5W752PAO5JlKn0jkQPhGZIOhvbKDSLaroQ0j
         obXSIdlcX6S7oatrEI7G+eLrIO9rGesOuDN82OrBaXQ0j9ln1by8qkXP8FXsFRkmDBPO
         bgJyuB8IIhZ1P1vosg/VuoWW5uaozg2D/O7T4CJrQ4fcGVTlJ7HUu8L9gK4kGmPiXgFd
         421Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875583; x=1746480383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wc/JZpb9I01WkScxZifDGeny+GfXjxdfvFxjNwbPxo=;
        b=G2gb1azqKE9V9wPPIRAKyqb2cCUNgYEb4LIm6vny0pOmNElRCM7v5G+l1/C81zy46F
         ZeCbH6GJ8PTxek/N2JgX/LEOnpyPbG/3SqYQRY2fw4gS35nGxHdYJ9AC/Q/7e8/e7nPd
         qQ0XGCGdv7mo+IZlp8ZW25SmZ40Uk8kfYrNTu418gTvock+V3v/PhCUZFuNrsDcU9FMK
         SGllMdwfcKiTWF9FDyTV9Nd/YblTg+j+5soNv+6b3JT8d5U97aeinkJlgcfITnG9mGY8
         pmkM09OGU3YBdN+9SuHWdbOHVymbSK8fCkOYdqmHSXGn1vGRaYI/htiYe4MPePxlhdc3
         pvyw==
X-Gm-Message-State: AOJu0Yx7vCXmopEpbUlFfzi8mFFHo9o/6RKTvY40L+iWNle6d1IcvFqo
	Pqt0qX1+j1KKLTfxqv2b98bXqXIo2xD/jkSmd+8KanMPup/x2J04
X-Gm-Gg: ASbGnctuPe/X1n2OqHK3IG/88OolyD3SbF2TLfjbX7RH5WWnksN73tEzz3ZUGp0HGtk
	QJi3uzLU1uTLDxZxFiZTt3fUd6Twhm4XRWKpsNBYnszKovs62H106XrmTIX4yo4YlI0XZd+CYJ3
	QvLTJD6ndnfeCHuse47DgQUnEOsNaaWZT8bxeo0lfpuUfpXHdsH4xZdNlpZtarSmM6ZfEBXbW7c
	9mPgCIPKlbYZg4OPoTcgzitGJJvV2UumD+B6gYVxjrCVYqSd8XBuqiMa7mb0TZoV5PTCXrHMcd/
	CCrLzntGH0MJNTUZkxoo/An8SrYj1RDYqtnzdZc4u7I=
X-Google-Smtp-Source: AGHT+IHm13kwHn8Q5zEJ50u/wb22bRKnHz6iGvK7pIPUW9oRnkl+W5PdO72rOIqJ4Xv4dIKlIvPNRg==
X-Received: by 2002:a17:90b:1f90:b0:2fe:e0a9:49d4 with SMTP id 98e67ed59e1d1-30a215438e9mr1942112a91.2.1745875582678;
        Mon, 28 Apr 2025 14:26:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::2f75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f61sm87924995ad.3.2025.04.28.14.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:26:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 14:26:18 -0700
Subject: [PATCH v5 03/10] sstatesig: Handle special case of
 llvm-project-source shared-workdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-clang-merge-v5-3-c31e76e643e1@gmail.com>
References: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
In-Reply-To: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215637

bitbake-dumpsig or bitbake-diffsig tools do not work on any of tasks
exposed by llvm-project-source recipe. This is due to it being a
shared-workdir recipe.

Fixes

bitbake-diffsigs -t llvm-project-source-20.1.2 do_preconfigure
NOTE: Starting bitbake server...
ERROR: No sigdata files found matching llvm-project-source-20.1.2 do_preconfigure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/sstatesig.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 1f976067631f80d637ba803f49813323d17e7c70..826549948e24571ef57acbe6bc5a2442d6c49f13 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -418,6 +418,9 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if pn.startswith("gcc-source"):
         # gcc-source shared workdir is a special case :(
         stamp = localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}")
+    elif pn.startswith("llvm-project-source"):
+        # llvm-project-source shared workdir is also a special case :*(
+        stamp = localdata.expand("${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}")
 
     filespec = '%s.%s.sigdata.*' % (stamp, taskname)
     foundall = False

-- 
2.49.0


