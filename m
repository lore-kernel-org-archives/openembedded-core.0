Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.368.1611586398716072848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0fJ2RE9u;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id i63so8505942pfg.7
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JnbVOgu7wt17ZUL1U6YSa+Tl6g0tWH7W8oaf3jZ3P9s=;
        b=0fJ2RE9uckIxhKaS84lq5hGQ6va0mciAHbg/B+uuBloNg7q3KqvgX6/+ciUZ4w8kQJ
         h0sqVIiip4AM8ikZLYYv9rukkBDYCORlOF/UG78Q/Mut7SKJoUjO2wX+E9k7RRVGkmWd
         jGFBTghRwk58wZJnM6xxy/nAwvCz+4Fl/D7hBZORPPtquK++Cx6iFRCCVp1JEBXGkAM9
         0xWL6VF6qf6NEmxpombKUdVkRUQ0qvrlKOZ/4xDbrhVpVQB5TbjQxHgTeWYdfTdT0DI/
         z970EIhrZqF0Fr7Xutxpd8tSV/HBWlBTVNI/+C5M2Te+WPK8lpSBSfiExJutQxEdKr3Q
         lwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JnbVOgu7wt17ZUL1U6YSa+Tl6g0tWH7W8oaf3jZ3P9s=;
        b=aSb2R6xnICzIN4Kcb8cBB3xCz5qJRtmVBLdLAa0tiXEa8AvJjdDGb2JaEE/YsI79o4
         icYLhxEhYwmrcXwb8pQgwy1sIhXa8nIapgdJFrYC9ucioB8Qg1aoADKFgGVq4sVrcAfp
         9qoYComn4EISf1YJRfUuV+N3RhNHTquHIg/N8g6msa8H8BpBAmbaCX+hql/RDqvQL3Xy
         bOMCnyQATJof3mkZPC2GLckmhfz2Vc/OKtJhPP0+8ldusq+QMn7lIFo3qlAk3lW9Kbww
         2VP6THtcx1hDTNNuWaTxe6kM7nbrsPCIY7yp2KiYDQat/12fSO/WcQs+pIyGgM5k5N99
         dFUA==
X-Gm-Message-State: AOAM533H+fHUNJt620PHEDvN4dDrxO6T8FyfLHuwecYNBXi4SFLZmQH/
	WxJo4lXOB+T83lkskDxhUUlnyTb6gIIoc6anH2s=
X-Google-Smtp-Source: ABdhPJxOhDZ5i6B7UaIkUA1f3PGS1Tl33MNmWQDD06rO+zOetZu3+/F3J6MWEkpS7M9vbG57e8NaCA==
X-Received: by 2002:a63:1456:: with SMTP id 22mr974758pgu.386.1611586397866;
        Mon, 25 Jan 2021 06:53:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 34/47] wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS
Date: Mon, 25 Jan 2021 04:51:06 -1000
Message-Id: <9c4a05acb15f781d2ac90cad4cb71a61dbcfa51f.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55618cbd58d6784a82e773f323723be6f722232f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 4ec0608fe4..cc0382ce54 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -206,11 +206,21 @@ class Partition():
 
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         if (pseudo_dir):
+            # Canonicalize the ignore paths. This corresponds to
+            # calling oe.path.canonicalize(), which is used in bitbake.conf.
+            ignore_paths = [rootfs] + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or "").split(",")
+            canonical_paths = []
+            for path in ignore_paths:
+                if "$" not in path:
+                    trailing_slash = path.endswith("/") and "/" or ""
+                    canonical_paths.append(os.path.realpath(path) + trailing_slash)
+            ignore_paths = ",".join(canonical_paths)
+
             pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
             pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
             pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
             pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
-            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % (rootfs + "," + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or ""))
+            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % ignore_paths
             pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
         else:
             pseudo = None
-- 
2.25.1

