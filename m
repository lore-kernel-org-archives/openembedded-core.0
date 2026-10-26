Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5896.1793051191597547841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 14:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LpkpNyN3;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-499f20c7054so1787871fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051190; x=1793655990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIS2bnYzcbQkMxQgoekph5CH8vdF5nI/voXUkG5onsE=;
        b=LpkpNyN3/Uim1gyA68s0KFyBPLn6CCTrYgpR1FlC/oh+Su97EekipYFsD2FHx872pf
         C+ZSCKtA19zQYTsVgl+FA6+p/mr1kjEgS28RpdrkNASR4oInnqgzntF359wzgierZoub
         lq/Mw8DZA43vzZ/F9qdW/0KUqDLr6chNyu7IYcCuUIMbGZtKW5G4pSq3YVpmYIG7dRN7
         I8Fp2lXbYRjxa4qynRxDsMc6yVy7uIRh1okDO/5yTOrmVjetgPK9FDNU2HjSKDL9f26h
         di8N9cLu8W2BM8v6IR0aPeh9NmuYByBTU48tZ85ltXse0tSEJmL9Bzoy3v5GC0kjXEg9
         rj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051190; x=1793655990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIS2bnYzcbQkMxQgoekph5CH8vdF5nI/voXUkG5onsE=;
        b=jvx1WhBTa6DMptsJvXqn67DjtsfNa47CtF2mwVIu0kv9Hf+pVtuDsh/p0GQHE+Ows7
         2EiD+bqfMDELz0d2RO2vcXIY2P4DdJ4XkP5hieUFYGQExdK0T0Nbhtf++UPsMbZBzD8m
         gmfm8VS2Gyi1GiGhbt49zlwBJw1EYUTtVjftT38LI/YjpBtQiuE2VbLxaiKvsmMauGPI
         2qgO9NxNV6y5O95CwAceCPHxaXLkLcvCtDdKwVw2T1VR78NuzmSn+rigwZSqAhUJ6L5+
         Rnz+xmWfPwhe+ySW39GHOzKzN5zmch4BC6fVvA+XIn64dyTE/B2HsvyA348m3NWx/Tou
         aqrg==
X-Gm-Message-State: AFq9FYIyAasZQQUwXS+U/Z9dYg1KwIo4WsPX4KRLQ5cY3bN0DK2QE8Wl
	docrCHkdWXOABcZtlr3lCBwvJ8sO7kPa98jc0x03WPUOzoQDMo4FrLqA5pl42w==
X-Gm-Gg: AYBFou3SjlB4dUaSEwIPJdW65jdOvCX89rreQCkyiHhb0khVX8g1xwQGn24nQELpKSv
	CG144uW5cBmEhwekkPk+MEaz03t6922+18DvseKUolJWVOEEmGlEmF5/ghv6qce41xdzFROzpnx
	SDez3vnwsHT674CuuVFtxA4f7USdArYl1QFm/uQXeEQnTUMuTs5B7AlncPBf+BBKfCMrOm+iWda
	IGNwdoCvPDq55LcYhaMTmVKOEX+IaW/KGu2d/IsfTPjl7YBIGcOnz8HwZ2VF+XjzbUwa8LAcJ8d
	u7xXoAmBla/C7uWTh536EtM48d7yaTmOgs3pJogiIfYPsBItWPZZWJ8GvYFiKXxeyQYS3e1uqCU
	kMqbIc3QK3gxgdiGbyJLosNVbDUq0C/C32gfOcWlBUPrnavWYHX5B5FlNhnGzCRCOsmrIa97SOC
	IDM7dBlXJyKG0+9Od8dxGqQ2+8QBfqEYMtvG6qEO5Tmu4vRT9r9qY3pW0kP2iw567c4tv04aqrh
	k5NKuRy7/wwUQ4QHTuIukUxOUrX5d9kMdYUrUdiekxLw+P+jrlGRQ==
X-Received: by 2002:a05:6808:251a:b0:4b9:a829:f00e with SMTP id 5614622812f47-55c0027cbe5mr5448431b6e.26.1793051190528;
        Mon, 26 Oct 2026 14:46:30 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424a05dsm6304219b6e.4.2026.10.26.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:46:30 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 1/6] spdx: Skip dependencies that are not in the taskhash
Date: Mon, 26 Oct 2026 15:45:21 -0600
Message-ID: <20261026214627.2388650-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026214627.2388650-1-JPEWhacker@gmail.com>
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 21:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248694
Content-Type: text/plain; charset="utf-8"

If a dependency is not in the taskhash, it cannot be included in the
SPDX data because the dependency may not trigger the recipe to rebuild
if it changes (although aliases help with this), but more importantly
bitbake may not restore the sstate object associated with the dependency
which causes errors when constructing the final SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1d11d8d1d2..3dd87c2a75 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -306,13 +306,14 @@ def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filt
         dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
             d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
         )
-        # If the dependency is part of the taskhash, return it to be linked
-        # against. Otherwise, it cannot be linked against because this recipe
-        # will not rebuilt if dependency changes
-        if dep.in_taskhash:
-            dep_objsets.append(dep_objset)
+        # If the dependency is not part of the task hash, do not include it
+        # since the dependency may not be present in subsequent runs, and may
+        # not rebuild if it changes
+        if not dep.in_taskhash:
+            bb.debug(1, f"Skipping dependency {dep.pn} (not in taskhash)")
+            continue
 
-        # The object _can_ be linked against (by alias)
+        dep_objsets.append(dep_objset)
         dep_objs.add(dep_obj)
 
     return dep_objsets, dep_objs
-- 
2.56.0

