Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2677F968
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:01 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id k197so10029387pga.10
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vJ3KI5owfoytkqmKX67UY4nCre6aMgwDwNa23PxemM4=;
	b=qsyJVzWAtleBulrijSnGS25MqCfM6remJmeXkbFODBG7FOp0R++s329h3ILZzxu+VS
	DliwGCOYtpj9jEuT2nSkJVmGttu/cbBDrxwMf8/4dbLQ6Bq45HwqfpDDycqlRHN75I02
	JdUJF6CSAWmfEBznqJ2rRPoI27On7uyUrO6LVs2/2BPYbh6R/DQFKfvMElkG5FN3pwRa
	AKMXsug0cOTaoJcAF/4fKwIH/MvFQdTCNVX81MkxjhAZjiB/gPq8pG2JXgLWdOJviYPG
	MQS6dqeu7rmoues8RtEqzt7pxBbz3m9q9omuTzwIe8Crw24euF66po7vf8g7LJAdGsK9
	Bd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vJ3KI5owfoytkqmKX67UY4nCre6aMgwDwNa23PxemM4=;
	b=EoP4t7XoM0GOQqda9oLfEbVpyREjHUz5zEZt+9/w0ipbdP1/9/Hfey/H/Up8ZaZvjq
	K9IKuUJV4JwISKjwt1Ne5GcnDcEaB7qauyhCps+aQmaYx5iRBq67U0i8M9EVrkoaxCN8
	OxMTNmQ1li3pEWe21bRjSDg/dhARJtPsrEXv09XI+XYz9MZM5VRdH8H5+zcVvyb52KIV
	elAet98mRXs9Pzc4gLGdJllITiSom7nLTSzsf+xS+5S/LwUD4xW5UircN35bzfijmzPI
	XAdaxCTNczdni0cKkZJxHRQB21Fc6xK/0GOXhZSjedtkUaeuRlT3G3yoCvMYY3Evj0L2
	2spg==
X-Gm-Message-State: APjAAAX88Y8nCoSa+0NyeHagOGTJMWGlO6+Tj/WOXTVockPLEZVUzJvF
	2N6VqaR9OCacn/4ooUAIiGi70wRG
X-Google-Smtp-Source: APXvYqzC1EeyFyGxHO4rf+sLS04x6H5raB6G6lzVvU/8NusyFW14mDrRpDLMrr/piz9/mTvfBOGx3w==
X-Received: by 2002:a62:3086:: with SMTP id w128mr36555084pfw.58.1579188062337;
	Thu, 16 Jan 2020 07:21:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.01
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:27 -0800
Message-Id: <430e95cd819577d4d71fe6d579a175b8776aa467.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 18/32] cve-check: ensure all known CVEs are in the report
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:01 -0000

From: Ross Burton <ross.burton@intel.com>

CVEs that are whitelisted or were not vulnerable when there are version
comparisons were not included in the report, so alter the logic to ensure that
all relevant CVEs are in the report for completeness.

(From OE-Core rev: 98256ff05fcfe9d5ccad360582c36eafb577c264)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c00d2910be..f87bcc9dc6 100644
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
2.17.1


