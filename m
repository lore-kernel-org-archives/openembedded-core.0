Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5305C7F81C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:41 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b19so1902980pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MTPlbdV2kzNVJ0uYniwmPagNs43B4KG0ZEqQNd7r3mQ=;
	b=W4nYpoKW/b+rHk46UINELz0+uCRTRew7ig4DmeegN9jHunpffQYbp6BzHvQ+mtNvv6
	oFXMdmjwDJTPQtAns0Cr7vHubPi0JYglm3u1K6kmTPinsPUbus08C6tPrjyBLYwWePa9
	EyNaP6FV8l0cachX8Pc4AJM2Ckp84ZHcIp+I2NZpr9RCv7/S3epD3gfuJNftGTnab8Lv
	wCV4qOLYKKRk4ywGw6IWBafU6PMh31SWdubd70Kff308ImzwXgxR3FhbxLt+lWBcv1aT
	oHSC1oeiwh9QiJjn7U+Fnatl4+OJm22/ZNP34+g3TIhz6VqFjGu11RPTQXqBF7Tw+ML+
	pggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MTPlbdV2kzNVJ0uYniwmPagNs43B4KG0ZEqQNd7r3mQ=;
	b=QX7sD5UXAE1WAnA7Fp0mSCqQdoDx2ns4+84ebmxtvhHuEP1mvwAA4/MwzlGD4sJm3T
	fKwvdDHNrkwqWVLNscvBE9hqBsObejItHlas3IFEZpRhV+vZ690yQtdoyDHxe12rFjaH
	zqjS5fnbR/Ck0AkEXqWRh+pEF7dnaBOdLxShOGuctcnTYb62tqs0wZmc0Lx/yWg0A5bu
	GLY4fwCBEXQ3MEGvRkDokwrvpspjrfzxKkdUJNL0yosbKiDdN+OVbIu3VMh/Fc8gh+yU
	w4AQ8+8zTlwuwWIu4Mnlgr0AnlmDj4qE6X28Tt5Qz642I9EFrGG1cGxE/SQb3bZ/e7ij
	aliQ==
X-Gm-Message-State: APjAAAXnAanrY4yG4JQUi8FrSlw815+FBsn9dhTbzHymfOuKWum9RcCz
	UxOWyLlATLo9yIi+CqvrB0hIgqWx
X-Google-Smtp-Source: APXvYqyc65066Iaf4xWyzzIIJWGba5UUfUnWCYrq3kwnvAj4qCoAe7TYW80K54XtnNaSlmbX32c+gg==
X-Received: by 2002:a17:90b:24c:: with SMTP id
	fz12mr5678241pjb.51.1573659162039; 
	Wed, 13 Nov 2019 07:32:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:59 -0800
Message-Id: <29d926802e7f8b4614a2dafa0af4c923912e1811.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 17/31] cve-check: ensure all known CVEs are in the report
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Nov 2019 15:32:41 -0000

From: Ross Burton <ross.burton@intel.com>

CVEs that are whitelisted or were not vulnerable when there are version
comparisons were not included in the report, so alter the logic to ensure that
all relevant CVEs are in the report for completeness.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c00d291..f87bcc9 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -208,12 +208,14 @@ def check_cves(d, patched_cves):
 
             if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
+                # TODO: this should be in the report as 'whitelisted'
+                patched_cves.add(cve)
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
             else:
                 to_append = False
                 if (operator_start == '=' and pv == version_start):
-                    cves_unpatched.append(cve)
+                    to_append = True
                 else:
                     if operator_start:
                         try:
@@ -243,8 +245,11 @@ def check_cves(d, patched_cves):
                         to_append = to_append_start or to_append_end
 
                 if to_append:
+                    bb.note("%s-%s is vulnerable to %s" % (product, pv, cve))
                     cves_unpatched.append(cve)
-                bb.debug(2, "%s-%s is not patched for %s" % (product, pv, cve))
+                else:
+                    bb.note("%s-%s is not vulnerable to %s" % (product, pv, cve))
+                    patched_cves.add(cve)
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
2.7.4


