Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835EDC77B7C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 16:43:48 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.1011.1751474622575959845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 09:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GOcZZrSn;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3df2f20f4bbso22691275ab.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 09:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751474621; x=1752079421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38FoJRwTdLE+l4xcry5EH9xJ4fO9h3ZAZ/rQ5hL9Cgc=;
        b=GOcZZrSnwTcBXRzNp4NkC/RWntx7y89BVoszEi0EmzBA2BSGOCvfXzZIaP4buKjla2
         63krbxBld/gq0H6wEXmxv/H63q6sENvY8yFrX6KKVYKOUhTawxBV6hCVRbYggn4B0kVx
         HKUGO84UHPiYGvmkf24Fi/YeCOH08rGiYpzPsvcHbKZzSqFXZ1VJWkiaACc1qgeD924j
         sHKsJpLatLWrWmy0B+8s0z+CbxKz1W7bXdQAwa5C77zPMF8gqgSjAIcijZsaItRWHqQ6
         9vAEompGYxJPVvIs04fLo/nHLCnI0CHwcrW1aVSfYnlPQvIahlmrjvQ3HofubcRl8fp2
         A1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751474621; x=1752079421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38FoJRwTdLE+l4xcry5EH9xJ4fO9h3ZAZ/rQ5hL9Cgc=;
        b=rFBDZt3eMOvfMNtcIfaTpuZQ6sdNLNTOir1NZQCEyzK7xrhcRNJHeW3VYsC5wr5RVu
         6zF+gccYB7yJab/A1NIlkGJVBGqVYJtwMSNnqUmBCUih3U0LLNK7gvoZusCX87MeMChw
         ydxm1BBXCDwnlb3fIHCf5vklJzt2PX/l6z4WG99EDPrD4kLTYwzU6ktxYFPsTvnED0O1
         +68gS88Eihgw8dG5zmN8PUeLUW74aDi/Ph0VoR1Zmi1z1VVOh3WE7szLUsa7YWFNf+r+
         /n1Pdad2OcTNUt3CYyZps9At7Cp5YIOS8CC8OyNyNwLYqSv4SdknMtql3tKvnM+IQnsg
         ADuA==
X-Gm-Message-State: AOJu0YyQ+BnXGau3ZAvWG4D2mJvs9CqhW77l1zBEq9APgfPJQ5skusGq
	wke95UtFsnnRFqSJOy/+R4oZ5qWCx0WtmLNkEo65ACxYsC0AG0F8I6MMCr8BPQ==
X-Gm-Gg: ASbGncuA7N4/5vFejTGyObRKQw86NuYc+2GF8uRs4tz1+F9nqLCdoW35Ot06De2QKh2
	9T+uosXlXgLYV14Pz84TJ0mciv97ivoFOa5XRX+GEb8KGj7hqKMFkPpEeU6pRstZTL/eaF9XZ7v
	6Ip365lTJC/BsZfeUfS66n2pH20yPpLwb1cU0F3Kn8ZYml+Aa42UUrPMqTyGpiIEwXrbkkZwnoU
	y+6lpmgYz28oqZ2g8INgbFhNmEBnuJnlNlATWWODZ0Iz5kUM4u3nWvGjHHsn4UURB1rxxBY6tc2
	vAIZ+Fvcd5LClnhIi1pjGCoXMAWDCwIUa3majOlTZKapSu+VfsIFtth9evaE
X-Google-Smtp-Source: AGHT+IGGWAgkAvBPmjrq6+0GtlFTn3uqDgkTS0neOvCLusb+a2p9NfpoLBhUPYGoPul7GxuSW24PdQ==
X-Received: by 2002:a05:6e02:339a:b0:3dd:d995:30ec with SMTP id e9e14a558f8ab-3e05c314492mr3396995ab.12.1751474621125;
        Wed, 02 Jul 2025 09:43:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::6df4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204860059sm3091056173.12.2025.07.02.09.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:43:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] spdx30: Allow VEX Justification to be configurable
Date: Wed,  2 Jul 2025 10:43:28 -0600
Message-ID: <20250702164328.472426-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701180410.33055-1-JPEWhacker@gmail.com>
References: <20250701180410.33055-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 16:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219851

Instead of hard coding the VEX justifications for "Ignored" CVE status,
add a map that configures what justification should be used for each
status.

This allows other justifications to be easily added, and also ensures
that status fields added externally (by downstream) can set an
appropriate justification if necessary.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/cve-check-map.conf |  4 ++++
 meta/lib/oe/spdx30_tasks.py  | 33 ++++++++++++++++-----------------
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index ac956379d19..fc49fe0a500 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -28,8 +28,12 @@ CVE_CHECK_STATUSMAP[cpe-incorrect] = "Ignored"
 CVE_CHECK_STATUSMAP[disputed] = "Ignored"
 # use when vulnerability depends on build or runtime configuration which is not used
 CVE_CHECK_STATUSMAP[not-applicable-config] = "Ignored"
+CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] = "vulnerableCodeNotPresent"
+
 # use when vulnerability affects other platform (e.g. Windows or Debian)
 CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
+CVE_CHECK_VEX_JUSTIFICATION[not-applicable-platform] = "vulnerableCodeNotPresent"
+
 # use when upstream acknowledged the vulnerability but does not plan to fix it
 CVE_CHECK_STATUSMAP[upstream-wontfix] = "Ignored"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 5d9f3168d97..c352dab1520 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -724,24 +724,23 @@ def create_spdx(d):
                             impact_statement=description,
                         )
 
-                        if detail in (
-                            "ignored",
-                            "cpe-incorrect",
-                            "disputed",
-                            "upstream-wontfix",
-                        ):
-                            # VEX doesn't have justifications for this
-                            pass
-                        elif detail in (
-                            "not-applicable-config",
-                            "not-applicable-platform",
-                        ):
-                            for v in spdx_vex:
-                                v.security_justificationType = (
-                                    oe.spdx30.security_VexJustificationType.vulnerableCodeNotPresent
+                        vex_just_type = d.getVarFlag(
+                            "CVE_CHECK_VEX_JUSTIFICATION", detail
+                        )
+                        if vex_just_type:
+                            if (
+                                vex_just_type
+                                not in oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
+                            ):
+                                bb.fatal(
+                                    f"Unknown vex justification '{vex_just_type}', detail '{detail}', for ignored {cve}"
                                 )
-                        else:
-                            bb.fatal(f"Unknown detail '{detail}' for ignored {cve}")
+
+                            for v in spdx_vex:
+                                v.security_justificationType = oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
+                                    vex_just_type
+                                ]
+
                     elif status == "Unknown":
                         bb.note(f"Skipping {cve} with status 'Unknown'")
                     else:
-- 
2.49.0


