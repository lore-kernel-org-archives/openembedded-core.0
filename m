Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857E3C43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 05:01:10 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3447.1784005269033853199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 22:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l5wEJuHF;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2593155a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 22:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784005268; x=1784610068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QL+UtH0WUu7j/JNDmF+xynCl4MwiM33Q1g6YwcvGB8=;
        b=l5wEJuHFYOflMHuS7+CVM7kX3Drc/SOYt3E8rcNhFARXVhSL/eS2lYIVQ0+rDgGXK2
         bIwdtCG8Sa0YeklhgN2FL6xW1O592cOGElLemUmRFUuFh/rSDEVHH+4JRCUtcr008ZVu
         dM9ikcMVd7iXVsyM65mIx2cMzCGswY/hi9vdfoVh3SX1b/Frb/28t43lOknQ92yiT8dj
         F4q6D9xdX285fn1VRkp47J9YH+afFiWKcTiE8scarxguA1r+SOBvgQ3ZyJ1n9g7e07AE
         I0G9CLwzzvOiEOQ52Z1go0IQ0rd4HkuScNCNmegQKQ9dPb9yJPRTIm17GF3fxjnNkJ/z
         ffgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005268; x=1784610068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QL+UtH0WUu7j/JNDmF+xynCl4MwiM33Q1g6YwcvGB8=;
        b=mLXerMyI/Azeb4RR45m7XIzvc0xNdN4mDBvBzzPX2O4LIYK/8JcU10k+JcNzTXkh6Z
         Hho1pbIrNjl8z+yYSU3mLF4qVknEsCHZmY46G+eCz38ZVklfc2eiDoXB2lu+fDla/176
         R5GJRja4eIYvtxPDOHyXARJ8Msypacs5S+ZcMCIQ4cGVBXbNQXOURntsowtFGuB7S1GV
         8WmeNWINgugx2YjmFKLgOPH/RXNhKXp4O+rEjGKW1eM74S3D+gFQpTYtjHEH9oF1UAVn
         sVQdbNrsUxxJDaMY2TGkhcWJkO/zj3gmLB4iPc/83Kptk1B4KOQHQA3Oqpw123C5pIUv
         E1VQ==
X-Gm-Message-State: AOJu0YwHAWyWKZ435edZhf5WDLPF30S8jNF0r1ENdofSYbGYYqUoYP+5
	ivjl6sQsACzLR/XiheqQ5ASGPF2hqW3j86ouZYNCrK7uwpkHT5BcPv3kT7L+4pPeWgg=
X-Gm-Gg: AfdE7cke83P8w8ZNItX8K9T9q+3wfqk1mkPlTMQ4iNoFs2a5YgRXDI+2AZ2dMH9qlPR
	OCrE3mQV+OGA5H431R+3ojW502ZxsJOBZSgMVX/uUXk3EIolx7RQLYD/wNlAPPWV7j9wOJV6uG2
	VVbAlQIja4XQCFH1bldkqyOsssQFINRxRmMDH6RTmPXbtExMU8+uRNq0lW1lCUd7bh1MWddpir0
	OUhe5nzSayS3q9SZrj0QGaTodCocuJXyNoUts3TKT7u1dYbzAEYEY+piPMfKAMQwBEO72yjSrde
	seycvc0GBic7UXz/344NSNT6i13RGEt52lymUNkgZqjxolq71neerZ5uklQutvOcdM4SSolNxV+
	2UWmcdwoqzwhKa9x6ctNH21CWJUHBTQPF+Wx1EUjp8nQLY1BaucaJgGkcmEwvcKIaW+rT45ELhG
	VqztwjRUgT6s9L
X-Received: by 2002:a17:90b:184b:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38e1ae9fabcmr1204957a91.11.1784005268169;
        Mon, 13 Jul 2026 22:01:08 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm109720255ad.6.2026.07.13.22.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:01:07 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 1/2] devtool: standard: fix update-recipe/finish --initial-rev override
Date: Tue, 14 Jul 2026 05:01:05 +0000
Message-ID: <20260714050107.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 05:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240863

Since 900129cbdf ("devtool: add support for git submodules") the
--initial-rev option of update-recipe and finish has been broken: the
parse loop in _get_patchset_revs() deliberately skips the recorded
"# initial_rev ." entry from the workspace bbappend when an override
is passed, but the override value itself is never inserted into the
initial_revs dict. For a recipe without submodules the dict therefore
ends up empty and update-recipe/finish fails in patch mode with:

  ERROR: Unable to find initial revision - please specify it with
  --initial-rev

i.e. passing --initial-rev produces the very error message that
instructs the user to pass --initial-rev. Before 900129cbdf the passed
value simply took precedence over the one recorded in the bbappend.

Seed initial_revs with the override before parsing so the option
behaves as documented again; recorded values are still used for
submodules and for the main repo when no override is given.

AI-Generated: Uses Claude (claude-fable-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 scripts/lib/devtool/standard.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 2a3a62d081..cae8793307 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1200,6 +1200,10 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None, force_patch_refre
     commits = {}
     patches = []
     initial_revs = {}
+    if initial_rev:
+        # A user-specified override applies to the main repo ("."); the
+        # parse loop below leaves it in place of the recorded value
+        initial_revs["."] = initial_rev
     with open(recipe_path, 'r') as f:
         for line in f:
             pattern = r'^#\s.*\s(.*):\s([0-9a-fA-F]+)$'
-- 
2.43.0


