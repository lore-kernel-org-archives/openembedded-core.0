Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3755.1794253685566848246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oYV4xDrq;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6f8a519e215so1045365eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253685; x=1794858485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=oYV4xDrqqid7qwsuke4X3QHZ9e++rcYM8l56C2d0yFQofGoJ1V+hSvnxcC/iy2AP2O
         qx7ShuR3R6pLD29uaQ1NQ4xS98LcpEMTW0rh56Odd4oZZmWxa8kw9LPx8+hujH5kuIcs
         Ykd66xl/tY7ruad5PbV837zIuYJDVI0iRRv8FQzZcTzAWaVLt1SVooTrAr+fQGL/z2tE
         snEYY8khcZs9yWdXAcHINqh+EjgjzS7n8AtCS0HOkbL05IrPhT2MIvZ41xNgMhtzG41e
         FoZX+i82ISnf7AVIKSHTvUs8fjLYqY/Kw9M6/VdLKu7hDp00uPQg9kPyd7S4ao3rLHHg
         p8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253685; x=1794858485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=qg8HRcXOj8nZh8YUWbFkkY08QrqilYH0sPvPpeOnOtL39eq8Yc2ACk0iC8PKmW1iwv
         rqToMHYz7l6Z0CrH5byXhD0SjDgpahIDOdCiumKDe5rKYxNwOYow/9d0jeg3LTxgPdmq
         mpKHf3/tf3Inb3pj9BrlhEuwmq4tdh8X6fzyirYh+3MBWgJozzvJWG8RjhXZQ5SxSCpE
         baO6hWbDfhbyrePRO5ReSLJLGk9s8B17SIe7zAyw3FSDA9MomGeqbC8HSJQU7cAAf5cj
         LYiXEvbmW13mchsSX/I4XEdcXGipWceRAiKrqahgVBVmZLC1j+AcayYELSWMeSF57FGf
         r2tA==
X-Gm-Message-State: APuU4Z/Nd6LCrRu9xmLi31h5XZkKoVrEnR2ZT+cOGw7kFL7qjLbdPAok
	Kl1MioG18BVwXZqtC9h9rSEei9Q3Zwvy1Ii0X9HpJ9+sXqyxRYhovK/je0u4ig==
X-Gm-Gg: AYBFou14756yeR8WnHusiZbj3Tp92SQXvaWhuVmFt8nN0U3KdRnrUik2WMCMzXbNvZL
	EyvkO+QvrLd6BeGvTZVl7CKJijFA0SpPxZ9MycL89cKmbOka2zlk38FYgwb/QnttZ4fhSGWwJ2I
	VmpwLQAAT8d1eQgSQMO+NWLVPvbQK0sOsXAdETOKidu+CrRom1O3DXFOTI3wLE8b6MVoVoPaxbc
	HN2FIPx0K5Ztyo9uU0Ld//l1J0AoW4qtw4xqSjw7bS1ckhEbY7dNDWTOOedgai6/YSu15xZFgSB
	RClunVz536cBsT6NgEI+MMzau2sLUGUyrhPAonR8jvumlr8l8miCulCtZ93JXDj+gfNVEymED+s
	8cWqY1FTTh3G12+UMemwoXcJJWZHopX1KY4FOoZwzixCgR4aPtWfP6x6lAtcJTdfpMZesyE7kkn
	0o1SwtdThdBBld9WIdwfxZ1CMjyENnJJ2FDgTXIhUW2XDsuQvXDxwksjdQd57CEHtHMYYKY2FGZ
	S8J2yN43IAlcD+QZb8VHz4kCFmD580iXDxfDGgwaDCJxmZAHAVUXZgTWZi0JQuBoi6dXHtHsfHB
	qvMw+iy3gN48Kiyuj8Zry+F4oNXvf/iIa/hN6o8Os3djFBMb
X-Received: by 2002:a05:6820:55c8:20b0:6f4:fb85:5e42 with SMTP id 006d021491bc7-718a625b59emr46131eaf.21.1794253684765;
        Mon, 09 Nov 2026 11:48:04 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::3232])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa132e65sm70363eaf.14.2026.11.09.11.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:04 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v9 3/9] oeqa: Add SPDX deploy SBoM test
Date: Mon,  9 Nov 2026 12:45:39 -0700
Message-ID: <20261109194759.550935-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194759.550935-1-JPEWhacker@gmail.com>
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249868
Content-Type: text/plain; charset="utf-8"

Adds a test that verifies that the deploy SBoM is created correctly

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index c900558b44..8cc51c1369 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -485,3 +485,14 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
 
         for candidate in objset.foreach_type(oe.spdx30.software_Package):
             self.assertIsNone(candidate.releaseTime)
+
+    def test_deploy_sbom(self):
+        kernel_recipe = get_bb_var("PREFERRED_PROVIDER_virtual/kernel")
+
+        objset = self.check_recipe_spdx(
+            "virtual/kernel",
+            f"{{DEPLOY_DIR_IMAGE}}/{kernel_recipe}-deploy-sbom.spdx.json",
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
-- 
2.56.0

