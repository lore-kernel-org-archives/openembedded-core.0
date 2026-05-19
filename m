Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955D7CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:09:29 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17800.1779185360159385623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b9h1wr6k;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bc7b311e77so13507965ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779185359; x=1779790159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwF/RxOps7mGQwximLao371G7FVWTdIb4cbkMzV1oJY=;
        b=b9h1wr6kycgUH6GBzr1WzeF2ZZRVo7vvwYHFq0rhgmvfL2A9dQAwjZK2WBd32BdXZL
         GIPsn77Ab4VtJDwqUH6zYnYLO6tMmk+6Vz0SNwN+Hnl7bCwzVjH36v9U2MzItjeJ+96K
         FBwZ+SgS4kKP/1IiKGgzKw39q05wr+sexxZRbDN2wUgYxdLfV1do1WvfQw4UQefvm9q7
         T9cAUGas62nPGgSRPiX1+/nukrE96TW9sybU+UTRxLXQt79iRI6j2p7AQ8F0ooBCB/m/
         32Krf0n+4/FYLkjU+a7PFDxpMgS7vOzWsSxrj6Iv39o9rTAs88yDIi5hbUyeSa7yR7Xy
         aeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185359; x=1779790159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EwF/RxOps7mGQwximLao371G7FVWTdIb4cbkMzV1oJY=;
        b=V3BO6wXw+ed9Om1TpdMNrm8nYr6bNKuRZ0D0ItWaUbFxc753mXTjqZyNh0qf3TMDWb
         atxYav2ghUrP6wR6uhG5QN/4z/d5K8EILMZAOvMCobpL2yTiZmxmUPbCg0LhrTWqlHhJ
         GMrTR2qJGGFH/vzIraS4is9HmqpbxTNYpeEdZkaELvkwohxh+Ubw2ISjk4/9nmXlSKEz
         yYx7AyMQjEV5ZlXUVesPh5iNjnIngUPAcBOx87H/yRa1ukIu2p7HUS0S0cD6y7uGtW4h
         pSuVo0fewqGHKcFqqdDwDOnifMHS7/g8m7Dsya+x4CGUKCbyZtN1ctVcXeVpi87/f7rj
         NF2g==
X-Gm-Message-State: AOJu0Yz+sKB4qWwXHBrFnE9JRj1lw/J1Ft0uSGV5gjEs3B8uqNlB2OL8
	9aoyGK/zJaXczdMW/WK400yf9viyYZoteBApE8yLbt4ZX7gxq/X8/X3fV2AlN1FZ
X-Gm-Gg: Acq92OHzWuYJ+kzmcW1DfHRyPd6JbXze6a3TUUs5Ylu+0QHMpEaqYbpPc0TODDTw2Tp
	ktMOT7D3Cs7k9CL7o4IN5+vf7uTLw1V4jwXzbnVWCH69KOpfnnI+JSKZ0aqduA29ECJLQsB/zhw
	mUiyrBMoUwMsZYz1vzYVjXBxF3gyzdW2P+1s+JDEhKCJNupoOp/lZb4MJbCeNAS+KU/SVdNyGc8
	7gfBhdNURQl4zEECm3+0SxrQdsnaTrKUCMncDvDvnATZ+ywpomuzeBeE6YsIoF00k2BTTzrSXlV
	fQ7eIJPCXzEdCnogSF+80Sp90lpYSJRzAxGnznWpWF7atPzppCLaNFbsXsoV5oJcutcWFnQz1qf
	2slk8CVeD2mBV8kuikm4KT0K6qOnsey1qid4MaaLh/tqkwez7U3OQzSU9dlg4SndJ3q4czdpJfH
	ZzYMGtd35QJmNoC4ZprIj41pnjs+p0KaCuoaXgTCmuWjOOVw==
X-Received: by 2002:a17:903:1a83:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2bd5ae4294cmr191888375ad.17.1779185359003;
        Tue, 19 May 2026 03:09:19 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc2bdsm231081355ad.63.2026.05.19.03.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:09:18 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v2 1/3] base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
Date: Tue, 19 May 2026 15:39:02 +0530
Message-Id: <20260519100904.235971-2-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519100904.235971-1-saisneha196@gmail.com>
References: <20260519100904.235971-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237301

A recipe with a git:// (or other SCM) URI in SRC_URI must have a
corresponding SRCREV set. Without it, BitBake performs a live query
on the remote repository at every parse, breaking reproducibility
and causing parse failures under BB_NO_NETWORK=1.

The trivial fix of checking SRCREV in insane.bbclass do_recipe_qa
fails because fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV
at parse time before QA checks run, causing a FetchError that halts
parsing entirely. This was identified by Corentin Guillevic's RFC
series and confirmed by Mathieu Dubois-Briand's autobuilder testing.

The fix intercepts at the vardepvalue expansion point by introducing
check_srcrev_set() which inspects SRC_URI and SRCREV using unexpanded
getVar() calls (False flag). This avoids triggering get_autorev() or
any live network fetch. The function is called conditionally:

  fetcher_hashes_dummyfunc[vardepvalue] =     "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"

Note on design choice: we intentionally use d.getVar(candidate, False)
rather than srcrev_internal_helper() because the latter expands SRCREV,
triggering get_autorev() and live network fetches -- the exact problem
this patch fixes. Our fallback chain mirrors BitBake's internal
resolution order exactly, as confirmed by the error messages BitBake
itself produces:
  SRCREV_default:pn-X, SRCREV_default, SRCREV:pn-X, SRCREV

The check handles:
- Full SRCREV resolution fallback chain matching BitBake's behavior
- Multiple SCM URIs in one recipe (all reported, not just the first)
- Inline rev= parameter in URI (skipped, no SRCREV needed)
- AUTOREV passthrough (legitimate devtool usage, let through)
- Parse-time severity respecting WARN_QA/ERROR_QA layer config

Note: parse-time warnings intentionally duplicate the QA-time warnings
added in insane.bbclass. This is necessary because CI pipelines running
'bitbake --parse-only' with BB_NO_NETWORK=1 (the original motivation
from Ross Burton) would miss the issue entirely if only QA-time
warnings existed. This pattern is already established in the codebase
(e.g. src-uri-bad fires at both parse and QA time).

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---
 meta/classes-global/base.bbclass | 40 ++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 62f2814bb7..66b2e25f71 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -165,13 +165,49 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     if notfound and fatal:
         bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
 
+def check_srcrev_set(d):
+    import bb.fetch2
+    src_uri = (d.getVar('SRC_URI', False) or '').split()
+    pn = d.getVar('PN')
+    found_issue = False
+    for uri in src_uri:
+        try:
+            (scheme, _, _, _, _, params) = bb.fetch2.decodeurl(uri)
+        except Exception:
+            continue
+        if scheme not in ('git', 'gitsm', 'hg', 'svn'):
+            continue
+        if params.get('rev', ''):
+            continue
+        name = params.get('name', '') or 'default'
+        candidates = [
+            'SRCREV_%s:pn-%s' % (name, pn),
+            'SRCREV_%s' % name,
+            'SRCREV:pn-%s' % pn,
+            'SRCREV',
+        ]
+        raw = None
+        for candidate in candidates:
+            raw = d.getVar(candidate, False)
+            if raw:
+                break
+        if not raw or raw == 'INVALID':
+            found_issue = True
+            if bb.utils.contains('ERROR_QA', 'missing-srcrev', True, False, d):
+                bb.error("%s: %s not set for %s" % (pn, candidates[-1], uri))
+            elif bb.utils.contains('WARN_QA', 'missing-srcrev', True, False, d):
+                bb.warn("%s: %s not set for %s" % (pn, candidates[-1], uri))
+        elif '${AUTOREV}' in raw:
+            return True
+    return not found_issue
+        
+
 # We can't use vardepvalue against do_fetch directly since that would overwrite
 # the other task dependencies so we use an indirect function.
 python fetcher_hashes_dummyfunc() {
     return
 }
-fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}"
-
+fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
-- 
2.34.1


