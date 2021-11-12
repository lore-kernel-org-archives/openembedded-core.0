Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964C7C4332F
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:14:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.20.1636737288799753424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IkI5zKCH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u18so16719908wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2orEh03EZFA4lr6lzywfhEVDWJJpTHEDjaTTiT1kYfg=;
        b=IkI5zKCHGepUf/IaCrZQ/wTC+O6CJW8waZQCgs4FL8hMWCcBwiYQ+EeWKWNNvzTgFy
         5gW14EliWXCWmjRx5VaeqHoQPpcMneV6FPU6YWDrEe2BoYZ0QoW+365DnM7pwPTLVNCb
         ZNwlkDFft96dqfL9HFzzBGon7mCy6JClu1YGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2orEh03EZFA4lr6lzywfhEVDWJJpTHEDjaTTiT1kYfg=;
        b=VEiPIdo5w0LdMcdeN7FdwKZeZHzjRHN1OKC2kj5llgOag2d64wtev3s7MWYiQprfgp
         pteSEk4xEuOU84oST42hTvXPTliGwEzHintcH0FpJAdg/p2kBYzSnvzDtMN3TerSAKeS
         YO8EAkK+tNd1Q/NmFpG3qqe7EA2pa5/2Uu0WoHOlLaGFNuVfY690PNNIAvNHvJ1hQCHc
         99fZEvjgydA5lro80YxZNCeoCgxIVCa/+Wam2PtEM9DuMGjiPL+4vAUOA6yfyEPCCed4
         wUAwKcRLp8BTVQ7w0tQf1xsiKNa3lYzGPY7yNXVKN+KxLkyeMiasMLIXRhrfH6QbigX9
         mjJw==
X-Gm-Message-State: AOAM530n2p07gmoNOL3/dr8L3ZoHC97yzc+BkWGtDXRqofJTkqGpDq4D
	JQzG2nFEQ/rtLBTTFjOOa8rPRYsBLblNeg==
X-Google-Smtp-Source: 
 ABdhPJzd/au8WTVKBCGPq3wpIOFBdc0ZlkH768ixrK1T42OWDhYXI+BV0BIJ9g3jb3WFSNhxST/7fg==
X-Received: by 2002:adf:cd8c:: with SMTP id
 q12mr20443341wrj.144.1636737287034;
        Fri, 12 Nov 2021 09:14:47 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id e3sm6263833wrp.8.2021.11.12.09.14.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 09:14:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] packagegrou-core-full-cmdline: Drop compatibility
 mappings
Date: Fri, 12 Nov 2021 17:14:43 +0000
Message-Id: <20211112171444.3898562-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211112171444.3898562-1-richard.purdie@linuxfoundation.org>
References: <20211112171444.3898562-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 17:14:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158229

The task-core namespace was dropped years ago and we've had the compatibility
mappings for a long time. We should no longer need them as everyone should long
since have adapted.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroup-core-full-cmdline.bb         | 35 -------------------
 1 file changed, 35 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index c0647b21883..b66617fbf61 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -18,41 +18,6 @@ PACKAGES = "\
     packagegroup-core-full-cmdline-sys-services \
     "
 
-python __anonymous () {
-    # For backwards compatibility after rename
-    namemap = {}
-    namemap["packagegroup-core-full-cmdline"] = "packagegroup-core-basic"
-    namemap["packagegroup-core-full-cmdline-utils"] = "packagegroup-core-basic-utils"
-    namemap["packagegroup-core-full-cmdline-extended"] = "packagegroup-core-basic-extended"
-    namemap["packagegroup-core-full-cmdline-dev-utils"] = "packagegroup-core-dev-utils"
-    namemap["packagegroup-core-full-cmdline-multiuser"] = "packagegroup-core-multiuser"
-    namemap["packagegroup-core-full-cmdline-initscripts"] = "packagegroup-core-initscripts"
-    namemap["packagegroup-core-full-cmdline-sys-services"] = "packagegroup-core-sys-services"
-
-    packages = d.getVar("PACKAGES").split()
-    mlprefix = d.getVar("MLPREFIX")
-    for pkg in packages:
-        pkg2 = pkg[len(mlprefix):]
-        if pkg.endswith('-dev'):
-            mapped = namemap.get(pkg2[:-4], None)
-            if mapped:
-                mapped += '-dev'
-        elif pkg.endswith('-dbg'):
-            mapped = namemap.get(pkg2[:-4], None)
-            if mapped:
-                mapped += '-dbg'
-        else:
-            mapped = namemap.get(pkg2, None)
-
-        if mapped:
-            oldtaskname = mapped.replace("packagegroup-core", "task-core")
-            mapstr = " %s%s %s%s" % (mlprefix, mapped, mlprefix, oldtaskname)
-            d.appendVar("RPROVIDES:%s" % pkg, mapstr)
-            d.appendVar("RREPLACES:%s" % pkg, mapstr)
-            d.appendVar("RCONFLICTS:%s" % pkg, mapstr)
-}
-
-
 RDEPENDS:packagegroup-core-full-cmdline = "\
     packagegroup-core-full-cmdline-utils \
     packagegroup-core-full-cmdline-extended \
-- 
2.32.0


