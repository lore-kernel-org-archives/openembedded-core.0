Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7266114E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 04:26:59 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id u3so592861plr.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 20:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=tTRkdWok7lLZ+UCyZPISqQqLQG9tkbT169CC4aHywp4=;
	b=dHujN0mbIXOKDymCFA9FvQ+i/GmbE1Tf0J+VKSUuUqhPS9yMDtpSgzsmjF640mLb36
	sajVCo9w3t+FW5gDWP3WG3al4uTX7rainVPGEf8BiMA31rd9DbgMFk/HMNNjza4f9eBH
	o+IzDclkwaoCByCaA+fB0W7Eana6UvbQzYLrupZHWd//MfDpdtVwngyUDXnRdoMsql4o
	0pcHZVGi0sh4NZmTXDTOYJP37QPeGZtQkNvVcrhFxq/mfmmQpvt0F2dGmi8wTLKooz9a
	7s4flLyUNsfej9XrSHRiF/lFD/xO5WZBk2m2HDc1PgGITpp9grUKQZ6Dp1OxMtFZN0fo
	9oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tTRkdWok7lLZ+UCyZPISqQqLQG9tkbT169CC4aHywp4=;
	b=h6qnbhrvaN4srwDLaA8UMsNNsEt6CPqcSY2Ia0F2x2nsYXqfnnnDvXAxMHCRdgXhuw
	atKgNEwS6hG7TZxQM/jVDMEbyL5SjZ+ND6Dn5yWZE3gUXtY7QK12m6xzQGPo9Tic9O16
	5YGgWogAxwFekxtzKfqC6nLAh/oxt6EerFs+P9fO/neUHQfUZGXpCT+vSbV6L9XfDD6f
	Y61RxsDZA2Hb+x0HchgwdPdbywQRVBggFurDKcNcwLGkPWQYKqhO9/KkGqFahHZh8DfT
	mp8hhD1BPp3ZIx22AI0WgIAnGKNrRioGGBZjimsqp6dcr1FhAOude/+ddHF2uV4EAFhl
	4OlA==
X-Gm-Message-State: APjAAAVjhCYsqf4heL4ebwkpRiJN8r2PxEYo0RnI9O5D07G3eOdWEpGQ
	evj9+dsHOoX8JmkHuXOYNPNPCp7W
X-Google-Smtp-Source: APXvYqweiMfsNUynSvO98Fh3N0NiwusOajVhWA4xn06x2JwSqDG1plf6y+UB1/suMC6D7s4GD9IGMA==
X-Received: by 2002:a17:90a:f88:: with SMTP id 8mr2892900pjz.72.1582777620730; 
	Wed, 26 Feb 2020 20:27:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d4d7:dcae:4398:bb3c])
	by smtp.gmail.com with ESMTPSA id
	z27sm4985754pfj.107.2020.02.26.20.26.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 26 Feb 2020 20:27:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 20:26:58 -0800
Message-Id: <20200227042658.19619-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] wic: Add include-dir option
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
X-List-Received-Date: Thu, 27 Feb 2020 04:27:00 -0000

This option allows for the inclusion of a single directory
for a partition.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/help.py                  |  3 +++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/source/rootfs.py | 10 ++++++++--
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 4d342fcf05..517f68e11e 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -979,6 +979,9 @@ DESCRIPTION
                          copies. This option only has an effect with the rootfs
                          source plugin.
 
+         --include-dir: This option is specific to wic. It adds the contents
+                        of the given directory to the resulting partition. 
+
          --extra-space: This option is specific to wic. It adds extra
                         space after the space filled by the content
                         of the partition. The final size can go
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 650b976223..b8abc33c87 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -138,6 +138,7 @@ class KickStart():
         part.add_argument('--align', type=int)
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+')
+        part.add_argument('--include-dir')
         part.add_argument("--extra-space", type=sizetype)
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype', default='vfat',
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 2d95f78439..0b735fffd9 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -31,6 +31,7 @@ class Partition():
         self.extra_space = args.extra_space
         self.exclude_path = args.exclude_path
         self.include_path = args.include_path
+        self.include_dir = args.include_dir
         self.fsopts = args.fsopts
         self.fstype = args.fstype
         self.label = args.label
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 705aeb5563..d1c59cab8a 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -71,7 +71,7 @@ class RootfsPlugin(SourcePlugin):
 
         new_rootfs = None
         # Handle excluded paths.
-        if part.exclude_path or part.include_path:
+        if part.exclude_path or part.include_path or part.include_dir:
             # We need a new rootfs directory we can delete files from. Copy to
             # workdir.
             new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
@@ -79,7 +79,13 @@ class RootfsPlugin(SourcePlugin):
             if os.path.lexists(new_rootfs):
                 shutil.rmtree(os.path.join(new_rootfs))
 
-            copyhardlinktree(part.rootfs_dir, new_rootfs)
+            if part.include_dir:
+                src = os.path.realpath(os.path.join(part.rootfs_dir, part.include_dir))
+                dst = os.path.realpath(os.path.join(new_rootfs, part.include_dir))
+                copyhardlinktree(src, dst)
+
+            else:
+                copyhardlinktree(part.rootfs_dir, new_rootfs)
 
             for path in part.include_path or []:
                 copyhardlinktree(path, new_rootfs)
-- 
2.17.1


