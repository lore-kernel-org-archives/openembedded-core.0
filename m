Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7E4C44501
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 03:20:40 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2381.1783999231414865864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 20:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rhF5mUgK;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84a2dcede83so678452b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 20:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783999231; x=1784604031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S948W/HRbiiOXvUk0TvYs03GN9wryOjztMO6Rm/3ylc=;
        b=rhF5mUgK+Njby0lVB4C0s4UVaxk4o76QNCWnVtF5AxkRFs4HSO2c4pz27syjqp11NV
         wQaJH7KlXJDGqDel9jM5H0wwXIUJH1iQ8BVLPqn24IR5KBrHrhDcQaElRgqTFUTtXFHX
         BU+9MFunj7BW3z9nc3lqe+2+m3SGI+OcFybLn1ubQlUOPfCNvKabZnwTvPkxIhY829mh
         w5GrySM7kNugxYkkuwFGZ0JMiYwgHhgSzVzcgYaSGGqfBGpdL1lZLYiqqV9TvAlGoQ+l
         PUz5Qohk0rSdOw3yi7KpKvq61EEV6oY6FivdC9CS2tiGLPgNteLP81eicZR94HE7+mtF
         Vwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783999231; x=1784604031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S948W/HRbiiOXvUk0TvYs03GN9wryOjztMO6Rm/3ylc=;
        b=YXaA2rl830WTnx2VTeHxlklgs7YXh6n6AE/F1jzeR/bktoou6y99DMo4ID5zj/qGIG
         BdmTaOcdyCKjkXSn37AWGifNij2QwTiNQnS7Pfg6t1J3kJskSK9hzeW6WlEG6PRY0R4S
         +C8k9zQFuc8w1vutHIJaKgP2q4/ROLouzvcgpMo2Et4H4gCw214sWoa+LQtr0TxqzhaL
         W5HY3TqsgEAk55A8flo0mGil+pmgVLFp++qrdHboUVG2lj3tPniMqF4bfKqpSIYmAy3Q
         q5ymTW5RqAqKBIi/jBuM2aJESzt8oYwg7njaV0g5biT3eVb3nC9/kKPrJcVkINBWU3T2
         SMFw==
X-Gm-Message-State: AOJu0Yzdgy2JMVhyM0wh536cu3oOezvb4sd3+0PFGw5CwWLGgNYxUlFx
	INPJM+37FYX7iZmrH4VXD/NgSZPd1KnPAz5cyxVNkR9WusaYLSAHTUVw3GbabNjRpjM=
X-Gm-Gg: AfdE7cnyoBk3LUwA+tdVlM+o9zbbFR9K/7PxRs9wZWy2gjJM4AZXipAF7TLXGmkVc8+
	SgaFao/isNf4Di6XT1CXDbTXBVevZm21gJBPm4l/f9dGI/c2sFJ1JWEkNYOa1I5rdXyWZVUjc9K
	NyMDg6vyESZrmif2niGlCO/aoLTlPHAuBMaL9rdF/LKjZ591H8q7gJLxzVXobrbu7u+wbfZC60j
	d4H91feeaKjAKSeTsQdcZcKux5r3GG+ewX8ectI3RV+0ki3sY+PQMU/ig8xYLVRQotKIWKPHKzs
	mySf1PZzmIM757DQ/XsIJFGQigH55pCYWGJgfEmJ0tk6f4YPclR2DuimgXaQqPlZmFU49yefE8u
	Iu0dBIv2NHz5M0PKRXcu8dBzfnZ/7ksjbRsPcujR/MSpXsR3r4hH17BY1t+ruBfDYQVbIQRM3Bz
	qJkCcC4JHfqMEQ
X-Received: by 2002:a05:6a00:4298:b0:845:c5d5:3745 with SMTP id d2e1a72fcca58-8488967051fmr10806692b3a.34.1783999230629;
        Mon, 13 Jul 2026 20:20:30 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2389f8sm699858b3a.4.2026.07.13.20.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 20:20:30 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH v2 1/2] devtool: standard: fix finish/update-recipe for recipes using AUTOREV
Date: Tue, 14 Jul 2026 03:20:28 +0000
Message-ID: <20260714032029.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713060444.7-1-bbnpreetsingh@gmail.com>
References: <20260713060444.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 03:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240860

For a recipe with SRCREV = "${AUTOREV}" (e.g. created by devtool add
--autorev), devtool finish and devtool update-recipe in srcrev mode
crash:

    INFO: Updating SRCREV in recipe minit_git.bb
    ...
    oe.patch.CmdError: Command Error: 'git format-patch --no-signature
    --no-numbered AUTOINC -o /tmp/oepatchxu0ig0v0 -- .' exited with 128
    Output: stderr: fatal: bad revision 'AUTOINC'

_update_recipe_srcrev() uses the recipe's SRCREV as the base revision
for exporting patches from the source tree, but for AUTOREV recipes
getVar('SRCREV') expands to the literal placeholder "AUTOINC", which is
not a valid git revision. Use the initial revision(s) recorded in the
workspace bbappend instead, as patch mode already does via
_get_patchset_revs().

Do not replace SRCREV with the current source tree HEAD for such
recipes either: pinning the revision on finish would silently drop the
floating revision the user explicitly asked for.

This is not a recent regression: the same crash reproduces at least as
far back as kirkstone, so it most likely dates back to the introduction
of devtool add --autorev.

[YOCTO #16354]

Reported-by: Gyorgy Sarvari <skandigraun@gmail.com>
AI-Generated: Uses Claude (claude-sonnet-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
changes in v2:
- unchanged, rebased onto current master
 scripts/lib/devtool/standard.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 2a3a62d081..386e628d88 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1530,7 +1530,18 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
     old_srcrev = rd.getVar('SRCREV') or ''
     if old_srcrev == "INVALID":
             raise DevtoolError('Update mode srcrev is only valid for recipe fetched from an SCM repository')
-    old_srcrev = {'.': old_srcrev}
+    autorev = old_srcrev == 'AUTOINC'
+    if autorev:
+        # SRCREV is set to "${AUTOREV}" so there is no fixed revision to
+        # use as the base for exporting patches; use the initial revision(s)
+        # recorded when the source tree was set up, as patch mode does
+        append = workspace[recipename]['bbappend']
+        old_srcrev, _, _, _ = _get_patchset_revs(srctree, append)
+        if not old_srcrev:
+            raise DevtoolError('Unable to find the initial revision of the '
+                               'source tree for %s in the workspace' % recipename)
+    else:
+        old_srcrev = {'.': old_srcrev}
 
     # Get HEAD revision
     try:
@@ -1545,7 +1556,8 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
     destpath = None
     remove_files = []
     patchfields = {}
-    patchfields['SRCREV'] = srcrev
+    if not autorev:
+        patchfields['SRCREV'] = srcrev
     orig_src_uri = rd.getVar('SRC_URI', False) or ''
     srcuri = orig_src_uri.split()
     tempdir = tempfile.mkdtemp(prefix='devtool')
-- 
2.43.0


