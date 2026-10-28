Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8308.1793225174265101163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TeIubgy4;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451a49abd8aso1433401fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225173; x=1793829973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIS2bnYzcbQkMxQgoekph5CH8vdF5nI/voXUkG5onsE=;
        b=TeIubgy4U/fsXmZyAiC9rvSewvU7lSzm90noPDPMIFReTzRv7UmkIBsxbPJsRT4Y9d
         EMI8S4ZKh2yxVLeUoUMjHF+z0sfYfP5kik2X1iSh1pWK7RlYc3qoYKRAKUhUFk384jDY
         w1Eq/QKTLJIE+MPw8bp0FXXhkjyry/pxrK9b0GAsmgJl0gDAOP0PlSNyqcBDCNbE9HxE
         CueDIWdouSe/UABnBpscld1agG2nyjn2VpG5qtj+xjO2c78iKTp0+aJDbhqDh4N+1xT9
         nvx4dsLEXbp7YLRyHvs1hMJAZdE69Kny1fcwIBwkIN5GiNYUAW9PmKZd8dHgziLrIAcN
         Kdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225173; x=1793829973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIS2bnYzcbQkMxQgoekph5CH8vdF5nI/voXUkG5onsE=;
        b=i3xpO4TcEb5zNWU51KiaEZMbp36XF/46jlBzyhbR1wjKywuD0CSrcxZIy4LINLhf78
         8tMzMawsii7HOPukVCcw/wVb5iXKhC+pjULY5/3Fc9wcgRKCcOqCCQNjehp4Bjo7nZeh
         JxY9BGIRDMwyuuQWLS4V36tnjKjuj6DKBTKRY5EYBthqFoj1Un7wUjduYdMjE2pQIwxF
         JN3h9Qf81nTbgFGD98Z1gHJM70KkFTXHGJLFJdPhubOx0bk5+4FFd8eYWN4/8DpYT1QW
         gNdrxKEQpqcG4o5yNQT6e0P6IOicGGNB0GPgVUETsBI3LQrk1RRwug6xPUbvIfEfUj3A
         ECkg==
X-Gm-Message-State: AFq9FYJdYwO+zpJsfM6rvwEBXtLaZQwkmO00B9AIVgH9ZTtwzCYVNha2
	qiafuJpb+nFZwHEjiIYuH5SXeIDPnUMOUNHhzP2UHZ+Sz8oXsMdxm9zY9hc8pA==
X-Gm-Gg: AYBFou1qiK1AxEjrmIsrIHYEd3SFdXyOwYc5cqk0IrEB9OJKuzPdyIrivNtny3pLxSq
	3CQAwGPC1+yEsnU67xZDbbYztpDtNN6xYvo712LprBciTs/7erD+cgHqNOUS+M+RV90DTA8/pPu
	KrBvfwHoASSHYEzRTihMgANIne/H6/AO3vmlR9VX9tnI8ge0TMs86QBxudw4LiDrD4Un+AUytS1
	28k7+csDIJdEDdqYms4IX4o14mOYKPe2ssA4OHf3T7wheZRLiy+rt4GUKxuAQbHhVdiOnpmYDQr
	v6yeKSJclY9WI3veFtti3grJVbIMnzv98ttML4HDFHapzYIJBxtoHSKSWz9di3LRgG4f5eVj2Sk
	c5CPrJegiNZ7my5hWx98/f33VPb25f+ssR7QSQmPYVZI4Rb03oFG2MBX726OctBQx2O9haAuGGK
	o3ZNA/KgFV3EAHMBBC+cdyFZCHx24MAl6JOK2iGZEmUkopS2/O58XzbT0iPauji0lpYj/FeefIx
	DKA9rN6+EnFgcc5o9mzqmbE70vZAuYEAs1Le5p/ezb+94eppX30L/+Xd+v+oYiBIo9Ws9lZLcpl
	ozveLdsEFdMvzvCqwK3LgI4WfU6DSncoti1E+YzBUnFZiLgf
X-Received: by 2002:a05:6871:ce:b0:499:6b20:13df with SMTP id 586e51a60fabf-4a8bb850c15mr2415122fac.30.1793225173321;
        Wed, 28 Oct 2026 15:06:13 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::8aac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77abffcsm3527597fac.4.2026.10.28.15.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:06:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 1/8] spdx: Skip dependencies that are not in the taskhash
Date: Wed, 28 Oct 2026 16:04:32 -0600
Message-ID: <20261028220609.1348489-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028220609.1348489-1-JPEWhacker@gmail.com>
References: <20261027224931.385138-1-JPEWhacker@gmail.com>
 <20261028220609.1348489-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248838
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

