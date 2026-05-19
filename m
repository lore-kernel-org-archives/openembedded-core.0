Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB153CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 10:33:09 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18091.1779186786172409830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 03:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XbGgZJ7p;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: saisneha196@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1518360a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 03:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779186785; x=1779791585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvwlaTr4p6ozsGQZ8zsf6sqGRNy7JILdG8F28Pa8pGk=;
        b=XbGgZJ7pXQbfq4vuf/2BZm7MrKA39rEHAvqCYjyezkEPIsDlgmbc9hdwvCBVUgy8Kp
         EB1ZStIO1gTuLMVsE2Ho0hB+GlvP0ORjIX3sxV9rDUivDsPVoH6isnXfICK7XsSvTnfW
         eNG5RdbWUrdfn3fAQcyQNjjLyMe7qNT0BQejyz6S9I6k6uK2VJyqIzA9zFm2yLr65HrY
         /EddnVyRjfM0k6HWSsq6uiGwCvU61PwDTxTC+tz8G50gJ3OY36h+pUOoSxDM+NJv/iq3
         4RgL4LeaMOr8weopdVk5GQz7hiQPe7UsN2C++DF2zsPLE1D88qvMjfL6r4g0/eqDHGCr
         5rOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186785; x=1779791585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GvwlaTr4p6ozsGQZ8zsf6sqGRNy7JILdG8F28Pa8pGk=;
        b=Or+hN20ReJ6ImPuU/ywg4wkpRPPWQNvLou7KYvpSwnKNNnjOpfmfq0ND2gVPcR7J2M
         sV45fxS2qhbCF9WuKhszSvemf6cduWhmqY3W4qzsqD+kdP0tw/4KsMiTilx82Xq+Sl4P
         twdpIj+FNMS3nIFDQN6QQIx+UrWAloPjH+aKLiLhlLSJCaMQKWbroIp+gd4GjoVR4Y2x
         h58xYMOmk26H3ujiJ0cZz/aoYqQip9iSwJ/wZk0YjPUGHqWJR3iyiwH6kGspit7T1gNt
         ezBUvojipOgWhCdGyVdILurvJPItcGiPuzTMfUFMvZRDiRZRcJpoYlcqQveCrM8S74/X
         Bd/g==
X-Gm-Message-State: AOJu0Yxkh4GnHePGtyqWEm3A+Dy2UZApkKJ41Fqz1YhL3gzEwzjTNaXd
	yYxpEXmzhwdvUBzImfJyn0ygDbepEqdZPV/ZMLSNDRghaKkwuHv+uBUv6th29Q==
X-Gm-Gg: Acq92OGRaCpfspc7usj+uSCZDhsw8aGD7/IqZ2Zw8tSq8B90IW6JbUOqAX1Y/BLHqsK
	f9NCm+XSgHnBUUzJVVqV3F1LxeceRlURt7RAm46H3EEqcb+oc4PkrY+8uAAfvA4UXO8jJ/+M7PZ
	HV9LE6VYE7MeFSiUJXRxNhwAgBDzcg3IMC+OVLwEMHWUWPIfM229YapPP47+zj8udlT5uais1eh
	4Smt85arpJ0hy007KaIi/QlHbbyQ2cMXpRUiNN5Mwmvb/kwNJqaAFWVLlXANFVTQE+gm6Wyjoni
	tN71CJHVHGJCqWD63TtFWs4xKF5GyGQgnHH41NQsIP7G9n+eeaGn+3QUdIB/RSfGKg8aXmCJEFJ
	Fpv6+BfJvrHicpApHpayRY0VnKPxr74aIpMoFLgKylXH7yd6SImBPLHB5pqzQdzjVpwJNgvvi2X
	Jd/KgyySI3f1SxZNhUCjThVq+TN3o3hMEK6mbPHghjr7JfVdvveqI2Xdb9
X-Received: by 2002:a05:6a21:6d89:b0:3a2:cc5f:2187 with SMTP id adf61e73a8af0-3b22ebc87a3mr21841838637.28.1779186785451;
        Tue, 19 May 2026 03:33:05 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb06268asm15383709a12.1.2026.05.19.03.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:33:04 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH v3 3/3] yocto-check-layer.bbclass: enforce missing SRCREV check during layer validation
Date: Tue, 19 May 2026 16:02:49 +0530
Message-Id: <20260519103249.236132-4-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519103249.236132-1-saisneha196@gmail.com>
References: <20260519103249.236132-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237309

Add check_missing_srcrev() to yocto-check-layer.bbclass to enforce
the missing-srcrev check as an error during yocto-check-layer runs.

This ensures layer maintainers submitting layers to the Yocto
ecosystem must fix all missing SRCREVs before their layer passes
validation, even if their layer only gets WARN_QA during normal builds.

This satisfies the requirement from Bug 16051 Comment 2:
'add a QA check outside of checklayer then add it to checklayer'

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
Reported-by: Yoann Congal <yoann.congal@smile.fr>
AI-Generated: Developed with assistance from Anthropic Claude
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---
 meta/classes-global/yocto-check-layer.bbclass | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes-global/yocto-check-layer.bbclass b/meta/classes-global/yocto-check-layer.bbclass
index ba93085325..1ef5424083 100644
--- a/meta/classes-global/yocto-check-layer.bbclass
+++ b/meta/classes-global/yocto-check-layer.bbclass
@@ -56,7 +56,39 @@ def check_network_flag(d):
         if network and not is_allowed(bpn, task):
             bb.error(f"QA Issue: task {task} has network enabled")
 
+def check_missing_srcrev(d):
+    import bb.fetch2
+    src_uri = (d.getVar('SRC_URI', False) or '').split()
+    pn = d.getVar('PN')
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
+            bb.error("QA Issue: %s: %s not set for SCM URI %s [missing-srcrev]" % (
+                d.getVar('PN'), candidates[-1], uri))
+            d.setVar("QA_ERRORS_FOUND", "True")
+
+
 python () {
     check_insane_skip(d)
     check_network_flag(d)
+    check_missing_srcrev(d)
 }
-- 
2.34.1


