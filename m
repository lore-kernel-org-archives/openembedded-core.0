Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E8ACD5BC9
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 11:18:25 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18207.1779880696022171531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 04:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SG8kHsYs;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so120413775ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779880695; x=1780485495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKw4duNbVMOBya/K3geGSAwJYTxnEOs1P8UhruKJBMg=;
        b=SG8kHsYsSxxbQmJjbpazoWMVY5JCRLo4D/d7yBLL2/jQiWpNGhwEQhemnSAGTQSF9T
         QX7jSLoDY4qjjcB+YgPwfhwQFtr9HL96hsp1GLf2exyqYezNh00nf7FCtma66hbMHyEl
         tcxdPHSOEqmvXKivmzg40Kf38TBgX+QkfOtiptboJeNh4oHQBsZA3SENvaRUmmVCQFor
         Xfnwqq1Zr2fRGHFk6DCzFoV5CEqxl6IcqF56VxWJ7XH9IFL0FNkpoAxYpM1OdkYnlRUu
         ijIA/58AsjcJ2qG93L0wL80y4wzskfy3/NF2t0QzsuKX5hoUF/v2CCUtJwXLHqiG7pQe
         rhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779880695; x=1780485495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKw4duNbVMOBya/K3geGSAwJYTxnEOs1P8UhruKJBMg=;
        b=ftY8xucymsHCs3fpRGeK0f25fg82VxxA0VvdbtG5MWyVDvFRsfuS57yqrTy7xur9d+
         8KWnc18i9RLXZ/ZL6UKmvhc0vhcZWLjPKrNruKtpWeRlelSyUefraKe0LaOTa92QpXd+
         M8sZ12vN4KwW7WZga9yBxfl1l9m5LeU5RCqhNHPemGXvorbWQW4OmPUCwWQ0dTjhrmGR
         218Ju5Y6EEuK8hbjfdNA/5AIWjvJcIvgXjN2ZZCyU/qDSZAPd/k/Brucqtb+DqVlSG7N
         J2mt3IqYG52rpvDLxR1NRAhAIit1ahsZKN229PTymTV1ZWgQjDWcEWV48cbP1eCFG/6T
         NY1Q==
X-Gm-Message-State: AOJu0Yw0TUBmirxK9IjTztMAgqMnjw79fVBlQ5Cv5KJVgn2sAFwyIdBb
	1iGT5oHkhdGqRBkKRumdal/9Vicg+RyRn9iMhqoGd34KQOp1UPugCTkVuYQOv2yF
X-Gm-Gg: Acq92OFa4s6skJMjxL07K2Z1OACHCR4+J+pPs8N4Tc7R3m8MqkdbpK3vkett6cjnNrU
	kEIr9F2rwZqhQK3vrDDN4vDe4jA7UwLIBMPjpdSsH6ECRwSKZ+GSTvY+ubmEujaLAprlgvCfdS5
	r06pryUrviz4f+9pG4uNGiKcUH05Rj9dKS8zfW/8wZlGI0cUMXKIPaK+JC2be3FkHDZD+W1YL5w
	yA+LCerpYmXe1bMA9a1ikYTUC1InnY1ycscSgNJIIpK3bmMP23454Bi986otIoUUjOvVvhQhKZw
	qBTcmuAiKnLFW81BiBzFM4ehYRTXDNvqBxsUJ19ghnPU3R/h6OWppWIKJ8TC6ow3Y6peKYxCBlK
	09XU3d5I/m3yeVYHZTPFcScI2QREn5m4XNf7lOn/+MEIoEeZdrH1Vifxihn30O1Lah4hnVgghBW
	D6P8B2rAHo12aXa/VJ+mfXSWSzC9RMfqythwyGuyhsFoqBfvu6e5YTeaHZfs+9XkjrXbg=
X-Received: by 2002:a17:903:350d:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2beb065aa18mr253545615ad.34.1779880695126;
        Wed, 27 May 2026 04:18:15 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.21.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b9fabsm192079475ad.23.2026.05.27.04.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:18:14 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	martin@geanix.com,
	paul@pbarker.dev,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v4 2/4] base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
Date: Wed, 27 May 2026 16:47:54 +0530
Message-Id: <20260527111756.1306022-3-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527111756.1306022-1-saisneha196@gmail.com>
References: <20260527111756.1306022-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 11:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237643

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

Changes in v4:
- Refactored to use shared oe.qa.check_uri_srcrev() helper
- Eliminates duplicated URI parsing logic
- Added docstring explaining True/False return values

Changes in v3:
- Added AI-Generated disclosure and Reported-by tag
- Added design decision notes to commit message

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


