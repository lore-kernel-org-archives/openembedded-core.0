Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066CECD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 06:29:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19005.1780381796854998445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 23:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jvrzrdK3;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0b944f6edso23088785ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 23:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780381796; x=1780986596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpB+/g/h3dSEsFb/quEZyqc0525Neb1HiJJbSUh39ro=;
        b=jvrzrdK3coWnyWfW3Ykafx9JFis0WfYvH43h/Mn1dO8REUTadE70jY4djsE8SU+9MH
         tP/TkuHG82EBpV9sJtPQP0hBnxZlGrSVGVOKS821wxEMWxUcyFpVVJn9oIrlNyXylthj
         +8hZoxPgyQQXy86SCK3quRNFWDt7ky/4hhe0pphSoabqcleFCz0Dt3JTgt9+MTgb3/X6
         IjVSrGn1RZGIB8i8sk2uLLz5nvEkU7gkiMF71vWdUHHmkqQxLwmN12PdPcnDXrhavqS9
         ftWYNHoQN+yAzREo5A5rqVGrcMYcj5vgei1DXeB9jqnByE+De2DdlQI0GSaRtDkj3npr
         PAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780381796; x=1780986596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jpB+/g/h3dSEsFb/quEZyqc0525Neb1HiJJbSUh39ro=;
        b=O7hXPPyVb648iUifkhNwh24UK8GSB5aT4Cx+uRzMb+0dK/78yJF+lU4YpvzLIU9j8Q
         UfpQrkvT60XryjTbo+lPQQS+Ykeagda9+iKUfhAssI9av08b9soa9H2gP8342Uugv6nI
         XYjhQ0hyQuGZc3dDu7dF8jnCJEsukhcyNxMm+29S9tAy0c0e1T/aUgWhe5nzg/5IysLF
         NqgiZc5j3OPvX2LcMJuumBEBxsFwA6uJkM2BEI3xgvYrR2Uy90f0SOT36jeQnZ58jH1s
         yd3b+URpcHkZbubTRf2Cip4E67gvX04Mn4LbAPiELchF8o5Gcoos22wBX1h4GhZyStVq
         Btfw==
X-Gm-Message-State: AOJu0YygYeyr1QlyiASnJ6HFqf8Gn4iy0RysLoY6xn63MxNRiD8rewFN
	edNm0qCtUxlRL2hTJU6khyUpOukPKkphThLPlAU7yHEJ79RPJ5BLsAQIkEjHqhsT
X-Gm-Gg: Acq92OGbpRF+867/97flvpDe4RpB99VO/zghSJUhoiwXQboWWO1GdwkjxyInyTf6fIy
	mZNk/MMovMFHnW6Poav/+Dnpy+xZmJOxkE+mcnJWauMPDhU/h4ijGC7w1RTqEDW32NubZVLwWpe
	B2Cnwbql6Kg0BYJVf3Pvum+Nv1XtmmRDTJ0QLx3RzVxRb9o9w5XAIk4jN0N8RNPc6HnRuLgSm+J
	QZMNr5FYIjA4zZxsBKUqWw6Ah8BitLRQtInahD70eFE5Z/4/H3wxJol2SND0UeAN5YJv5XGjpeK
	5EETyyJaMLnoPuZVR+s9D1UWmNIAo/cYvntnkvTVRZvAZLp0Wy9alUu88CGAC27b94kXaH0M3wH
	pK/gAYqYH+ePRV16cDewIbGWKAGIBEQ3U0zuwjEO54bHaeV8CKVBdpW20/T12WtNsAM66ova57C
	cdyMxT976DifjDqSwjac9G55AqmHFScgHqzhR6ESUCb2OBhyDMUR8g/oBg
X-Received: by 2002:a17:902:e54c:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2bf36876f36mr152915135ad.39.1780381796186;
        Mon, 01 Jun 2026 23:29:56 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.118.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm128280255ad.76.2026.06.01.23.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 23:29:55 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v5 2/4] base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
Date: Tue,  2 Jun 2026 11:59:38 +0530
Message-Id: <20260602062940.3107241-3-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602062940.3107241-1-saisneha196@gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 06:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238002

A recipe with a git:// (or other SCM) URI in SRC_URI must have a
corresponding SRCREV set. Without it, BitBake performs a live query
on the remote repository at every parse, breaking reproducibility
and causing parse failures under BB_NO_NETWORK=1.

The trivial fix of checking SRCREV in insane.bbclass do_recipe_qa
fails because fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV
at parse time before QA checks run, causing a FetchError that halts
parsing entirely. This was identified in Corentin Guillevic's RFC
series and confirmed by Mathieu Dubois-Briand's autobuilder testing.

The fix intercepts at the vardepvalue expansion point by introducing
check_srcrev_set() which uses the shared oe.qa.check_uri_srcrev()
helper. The function is called conditionally:

  fetcher_hashes_dummyfunc[vardepvalue] =
    "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"

Note on design choice: we intentionally use d.getVar(candidate, False)
in oe.qa.check_uri_srcrev() rather than srcrev_internal_helper()
because the latter expands SRCREV, triggering get_autorev() and live
network fetches -- the exact problem this patch fixes.

Note: parse-time warnings intentionally complement the QA-time warnings
added in insane.bbclass. This is necessary because CI pipelines running
'bitbake --parse-only' with BB_NO_NETWORK=1 (the original motivation
from Ross Burton) would miss the issue entirely if only QA-time
warnings existed. This pattern is already established in the codebase
(e.g. src-uri-bad fires at both parse and QA time).

Reported-by: Yoann Congal <yoann.congal@smile.fr>
Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
AI-Generated: Developed with assistance from Anthropic Claude
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---

Changes in v5:
- No changes to this patch

Changes in v4:
- Refactored to use shared oe.qa.check_uri_srcrev() helper
- Eliminates duplicated URI parsing logic
- Added docstring explaining True/False return values

Changes in v3:
- Added AI-Generated disclosure and Reported-by tag

Changes in v2:
- Initial public submission
 meta/classes-global/base.bbclass | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 62f2814bb7..7de896ca7d 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -164,14 +164,40 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
 
     if notfound and fatal:
         bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
+    
+def check_srcrev_set(d):
+    """
+    Inspect SRC_URI for SCM URIs missing a valid SRCREV.
+
+    Returns True if all SCM URIs have a valid SRCREV or AUTOREV set,
+    allowing get_hashvalue(d) to proceed normally.
+
+    Returns False if any SCM URI is missing SRCREV, suppressing
+    get_hashvalue(d) to prevent a FetchError parse crash.
+    """
+    import oe.qa
+    src_uri = (d.getVar('SRC_URI', False) or '').split()
+    pn = d.getVar('PN')
+    for uri in src_uri:
+        rev = oe.qa.check_uri_srcrev(pn, uri, d)
+        if rev is None:
+            # SRCREV missing — warn and suppress hash expansion
+            if bb.utils.contains('ERROR_QA', 'missing-srcrev', True, False, d):
+                bb.error("%s: SRCREV not set for %s" % (pn, uri))
+            elif bb.utils.contains('WARN_QA', 'missing-srcrev', True, False, d):
+                bb.warn("%s: SRCREV not set for %s" % (pn, uri))
+            return False
+        if rev and '${AUTOREV}' in rev:
+            return True
+    return True
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


