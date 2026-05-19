Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A35CD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:33:00 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18087.1779186779614088854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OrXNi9VB;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: saisneha196@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-369002b26f4so1698004a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779186779; x=1779791579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tsg7ZO808gfYevecoKttFuhcIaNpK1qik9nkBXrZJiE=;
        b=OrXNi9VB6pl9qZd8q54TIWRXzu8isAlx3WPvNAoMwQsOykQaYjWoOxOJ6Xn/JN1tNR
         jn1KstRgDz+Nh802o6wTn1qtl3RDvz3DMaAn+rbMBs+khZUByp74U/XS1CWn83mqYmef
         w8k4+8syq5CBHpQI6gMg8Rd0V4SwtrZOVtECb9LZveqvgSsA2SgzBDAvBrwrFWSOuzWV
         3lmAw7EKhmGuRih9vTJe+M2yqQP+n15DLrpXv4Qtr2fNdZsv5ZuQpyBiTlwPClcxDjbj
         /jjscKiyPXjMiPW5rAi+2EYYp0825PS4+XSpENT9RikS//dURC2zPnUJ/VsfR3roYuGB
         TutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186779; x=1779791579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tsg7ZO808gfYevecoKttFuhcIaNpK1qik9nkBXrZJiE=;
        b=FAbhqNzQs70zULMdQdFLHb4AJ+oJzdj/u2G3lYeewkQpPSsgaEEU/oGC49cf428X1b
         indsxA4DVHMEfqlRJq7ksAVOfuiVF+v1g8F3pxdgXBmE1sOrKCxVflIobLPgEbIGvOEv
         RZaCmZ9uxv76VWDgErDcyqCKDjv0vSWCrUOSG8tE8QI1o/XN9mZvXJxsOB4r+RNtYzcF
         87/4MnuE58m84MkcirXFNfUH63yI9PgsBd2pVQxtZkyKYhGkQs2WJ+kMV9hlJ0eWCcVE
         oZJkDGPrMojIMLu7RNeIAMcfX6unbxY7yKf6d/xC+zZslIhSR03ewZyighwHpxahfuek
         3wrQ==
X-Gm-Message-State: AOJu0Yz3GR3SvgH4X/KcwpaJfN3i/CAtkKiTbw/xe2/2O1+08T8yg7pk
	n6JcL3DBQrcCn4ip3oL9oLNKkuiBI4UY9cfbpToxusj6mCesZqI0EBrqcDsEyA==
X-Gm-Gg: Acq92OEFF7+UFAv6f2bT1DOZBm07OVGv5XRyDdZR9I9sp9HBe8KIAFL/av88H1uGzr0
	3FauZIQsNM28tRm6RcYCG2OxZB/nFI97+ews2r2L+Jxv6Uz1BMV23XVODg0GidzHpqbCdjuQqPc
	joB8d/FQjJNDX+P1r+ufupi+b/ZHCkLLqRAGa2bnSSYkOZQ6gQTFJCUB+j77OYuC8qazV0affpC
	DtuH0DPOgM1kDcFkiTRDB4J+QoTxmI0AzIhMu+K9LJhYqfp1e+a0t0qkhy437Xtgjr9rvGCQt4I
	7D8NsgBlCVi6G7EjkdgVabdNAkS2914TkXb5HbrC/VvKOlcATa7m6JRhmgSkqrlEOzGDRAigGOO
	z6aGiuCltVQFREh33wLUJx5baQNz/+4NsmCIANVDyaHZs7wUK8zzUwc7gaanDeYzWbGGkk6Y+xV
	iezbLPP5n/Ubpci33iO8kOopGe0WeearlB71WlMXR1NIwVSA==
X-Received: by 2002:a17:90b:1c0f:b0:366:4782:139a with SMTP id 98e67ed59e1d1-36951a6c339mr17924070a91.17.1779186778908;
        Tue, 19 May 2026 03:32:58 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb06268asm15383709a12.1.2026.05.19.03.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:32:58 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v3 1/3] base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
Date: Tue, 19 May 2026 16:02:47 +0530
Message-Id: <20260519103249.236132-2-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519103249.236132-1-saisneha196@gmail.com>
References: <20260519103249.236132-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237307

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
Reported-by: Yoann Congal <yoann.congal@smile.fr>
AI-Generated: Developed with assistance from Anthropic Claude
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


