Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FA4C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 06:04:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4847.1783922686746232514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 23:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jSVWN4sk;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce98cb8165so22556605ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 23:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783922686; x=1784527486; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s71LkJpnDcsW0bm+RXnJ7P0wAV0YBhtBxjmNom4U1cs=;
        b=jSVWN4sk0IOVA3JBh+fCXBne8W6r7S7I22Q8a5wDFbfuJ2HCxpPiHEe0mLrYSnHMKd
         u0ySfNnSqAnb3upo9cXA3TSIu3efFfcoMa2lFe5gJh0kydXZnYpIrGjgJx1sM4mTvLeK
         e30UU8h2klnET9rxP3Pz1TO4Bo+btU4UJc9mYSZMihQvm+5+lJ3rtCiulr+Do+0kGRpL
         vixIMten7/zb4hz+NrPXGMxrZXUW8SzA8XjXFiaJ6HoGtrGhXPy9o8JjS+dW/T61zfIe
         mAUO9lM0CYqFnWr/uinN0O3zTNdRaRbsxPKHOhistFa71ezaqDQO5N7R3mlcmTRfTL59
         kc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922686; x=1784527486;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s71LkJpnDcsW0bm+RXnJ7P0wAV0YBhtBxjmNom4U1cs=;
        b=QbYlNoo5FY0R2v7G8YoVxF/7AKli1FY2vEIDjXPfbuzNAFHLpW0/+AzLHu80A84iZZ
         PmfWZ+JY7DCcFnszUVIowk22LIY11Ibf7fe8cMnLvYZgTnyBm+reid85B3Fpa9wFBkPU
         Z+B2CkdXNqU6mpv+CjTjiANc08s4rT2W5xe0QpXRLyaDkQhAo7kO3NFx2K61VwQyTp1+
         AOu8VXEmbLHt/sMzUhS9Z9bV/sRDE1KU7Z3aS1l/SgSTtYj27eEla5hELUgL85j4tIoi
         AQY68OzAZMLJ6uNsc/QeQTS8PrrgTiwEqO8q7X++0/9OJXFud7sikFil+p6eDpR6Sf5l
         2JqA==
X-Gm-Message-State: AOJu0YxK4YFdCKFdMx9gpmzfnkN7TWuInSspxqCYRDiOAYjSfrBDNmJI
	tx1T3dukmejh4f4NRv+Kri5IbpyKaTvNYwqbuYKV+j+MingY6sWSLg/GqOJSkm5g
X-Gm-Gg: AfdE7clrCXyVQWHj3WXTdmkfJeICGztF5YZ//rt93V7Iyt2bYkTi9MDFPSl6IKvSa1W
	ItUIm3AtzNrO2Umrz1ocXvPDwHVcEHk9QA88SGa2vOPOlyolxHzIRXkhEN07bq6P3zgfVE3hTbP
	H1kUfUcUrND1U/9Snsg6/Xe9Mfz1jnowFKnfmgvK6Rot9Fh275IJv6tk0u5Z3qkoAYW6L1JMNSl
	s/lNzCuUyCqrVsswl1xMGS1Cea2DYDyDkMYbxOceX0W86hByjNgjsN4RHPMnLaCPquJNOCA0VLp
	TUPJZmblk3CoFl/D+391JSZGyiN8q7AZ7r8YfpTXxd7XXPBuxygEV3HnV/1S72ez+lZ3XwEjiv2
	L2KicvLwxdNaCV4yCH4RC/CBypVER+7vgndajUUqywJwPjzb06c6Al+aw3rdMSwQV/tCzIohyMy
	VfYGlmnl++Fszq
X-Received: by 2002:a17:903:3903:b0:2ce:a6a4:451b with SMTP id d9443c01a7336-2cea6a467a4mr60019545ad.11.1783922686049;
        Sun, 12 Jul 2026 23:04:46 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm93228515ad.18.2026.07.12.23.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:04:45 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 1/2] devtool: standard: fix finish/update-recipe for recipes using AUTOREV
Date: Mon, 13 Jul 2026 06:04:43 +0000
Message-ID: <20260713060444.7-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713060444.7-1-bbnpreetsingh@gmail.com>
References: <20260713060444.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 06:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240826

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


