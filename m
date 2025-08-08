Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DFCCA0EC0
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:37 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.17952.1754643035670431370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VDIwFJx8;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76bd041c431so1837037b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643035; x=1755247835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw+E5rg6VQSrLCUOHoi5NkEzNglUKjgkX55lA8tYBHU=;
        b=VDIwFJx8EFH9JPflyPTFLIjXsWo2aN5XxQ+TZlqvazqncJ6gygprcyrdfhoSRuUVLH
         BfflEs86gUuA9FiHrlQqU0jBndmW3TiLKk042dTMa7APvI82htCNVRePhrkGuPGs6OB0
         FhULdFEmA/Z60uNSnxeMoy3juaqBD+Kb8/ZujxPOEahMxp72OYS88ChU6yOS5NKQYXWi
         6nEjhTviVooRWcWJ8S8gsAx7UCpVyovAnkJ7ck9GhkZ/WXaFbRFjja/F1zxBsA98T1CH
         EkLAwMxcO2LerMeD1wFvGM3VLpCo9+AI4nCuifVD6qdrS4scSv5eXTDoGaiZymVyja+m
         t1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643035; x=1755247835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cw+E5rg6VQSrLCUOHoi5NkEzNglUKjgkX55lA8tYBHU=;
        b=HBnFe052E/TuN3ouWx4BVqB00IVXiVBiyDpDiqSvT7hS5MtZghwJRNlybSqFCy/cVR
         MAjhUXtOt/HuOV/+EpTJBq/HLOoFRhII+QCGCY/wOEJPNyOz+GtjoPLejSB1srVDgMwQ
         k1UHpwqk+15CrVdbBTM3/ac3nSqz5ZzzE5WW1ouo9RiwwEQtBXH3pWdglSzSWdE2oqnz
         +SUz5C2Uq48i1I6Id/1y5ePH8ih+35K967rJaF1JDx0lFIexMPYeNSeOwGh89eCI4M91
         uEtCZh0MyJ8oV6XOPhiX/ekvtpflut9kES+9v+lgxgIPEe5OLyO7/HX61z3JCSIzu3wZ
         Nj8Q==
X-Gm-Message-State: AOJu0YyDzZrcNgISNsifB46njY9zaAfGpfl+QSvNZ6NjAtsMihuDLHoG
	iV9fB2Mh2LqUAP6/li2UiEQqvNBQbfjOXKKRX3QOSIaftanzERrHZCbyAQBcWg==
X-Gm-Gg: ASbGncthAyqZO4En9WsPT44HbngEHQaWbFRYFPUGK2kFUkZNBaiYYBtEnV9ToOm9rNX
	8sWqzFZK1a0AYoenxMF1VZBjEAD1G0WfOkEWNmJnm2wyWgLNUrhj0w8lI5kKkL0H0YmVLMvEsPX
	ycjo4b+YKNXEpPhY8n65aaZ5IBtj4DLlRusKCySlWWgyFICC21vOR4uJlBk4s7Yiq0xf1vZ+NHp
	aBXvqZR+giS3gNOoFxJ9KPwmrPv1dJoonG+P3RAnf/K90Q5oTISjwYrgbvNvVRFwXkMtcIONVbg
	JbAZpsnjlcC0+v110bp8d+7ZdRFQGFXuQ4yBuIlBl1jC1RlXT1s/g6pi8FrSplcP8dYlUUaARpk
	X3ALZNwhrNRw2EU0WsUiOezez/pA2Q3/4E2oCFwqfHx8Lbqrb
X-Google-Smtp-Source: AGHT+IG4oCkz3XTtdWgQwyQf+H5un9WGTxRvXmLGOfoxbwI3zfc6HBqYLGNbly2/ilJgS/Gg+Ie8Hg==
X-Received: by 2002:a17:902:f544:b0:240:c9b6:f8ee with SMTP id d9443c01a7336-242c225f966mr31040815ad.50.1754643034754;
        Fri, 08 Aug 2025 01:50:34 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:34 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Koch <stefan-koch@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 21/23] bitbake: fetch2: Move the `ensure_symlink()` function into the `FetchMethod` class
Date: Fri,  8 Aug 2025 14:19:29 +0530
Message-Id: <20250808084931.2156763-21-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221618

From: Stefan Koch <stefan-koch@siemens.com>

(Bitbake rev: d934763f91b9bda85f273a44f12a04a3ca19fc28)

Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0e9ce41a1cc0e1158f84d5c5c08cf23b5c161155)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/__init__.py | 36 +++++++++++++++----------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 1a6ff25d4d..49dca75025 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -1127,25 +1127,6 @@ def try_mirror_url(fetch, origud, ud, ld, check = False):
         if ud.lockfile and ud.lockfile != origud.lockfile:
             bb.utils.unlockfile(lf)
 
-
-def ensure_symlink(target, link_name):
-    if not os.path.exists(link_name):
-        dirname = os.path.dirname(link_name)
-        bb.utils.mkdirhier(dirname)
-        if os.path.islink(link_name):
-            # Broken symbolic link
-            os.unlink(link_name)
-
-        # In case this is executing without any file locks held (as is
-        # the case for file:// URLs), two tasks may end up here at the
-        # same time, in which case we do not want the second task to
-        # fail when the link has already been created by the first task.
-        try:
-            os.symlink(target, link_name)
-        except FileExistsError:
-            pass
-
-
 def try_mirrors(fetch, d, origud, mirrors, check = False):
     """
     Try to use a mirrored version of the sources.
@@ -1635,6 +1616,23 @@ class FetchMethod(object):
         """
         bb.utils.remove(urldata.localpath)
 
+    def ensure_symlink(self, target, link_name):
+        if not os.path.exists(link_name):
+            dirname = os.path.dirname(link_name)
+            bb.utils.mkdirhier(dirname)
+            if os.path.islink(link_name):
+                # Broken symbolic link
+                os.unlink(link_name)
+
+            # In case this is executing without any file locks held (as is
+            # the case for file:// URLs), two tasks may end up here at the
+            # same time, in which case we do not want the second task to
+            # fail when the link has already been created by the first task.
+            try:
+                os.symlink(target, link_name)
+            except FileExistsError:
+                pass
+
     def try_premirror(self, urldata, d):
         """
         Should premirrors be used?
-- 
2.25.1


