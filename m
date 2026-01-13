Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F14AD2D115
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:43:23 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60631.1768315401379821779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 06:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=PH4rir8E;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.48, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b5b22f723so1063057a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 06:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768315400; x=1768920200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipED3fNgHaVDGE8D18j6ZhsWqER2VovFS/DiYGRdJic=;
        b=PH4rir8ELtGoJfPxPUq2RHNyG36yIwbX32BhH5+4p3G6YkOOzTqucCsvo5aB3tdsOX
         X9vrM3MV3gSZth0QUN2ZBU5yRA6wqSTfXg/oaJtiFKHClE2P/bJEiF4R2vmfBEumVh2P
         r26paUb0VVTVsJ3mEGwxFy9nwPq10Mwi5xgjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315400; x=1768920200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ipED3fNgHaVDGE8D18j6ZhsWqER2VovFS/DiYGRdJic=;
        b=EJ/L1tP+L4bZ/xcrVBTHx603cEBlR+HucKLzorSJrpHDcMZTOXDsyoq7Jf808jaWpQ
         0aEqHd5o5Rw7wavJZ7XdkCebpamrhA37ROp/hZQhACO3qup1nUI9IMiO1fms1Iq8wcId
         fQ9T5z/R923Ux2EfBFfi5ZdGccZC42C0wGpCcqAvltoxV4HAxh4QnRvvAybi5JRf9EoL
         ktz0A9K/U86hKFjyyLlBN31hoAJM4WXufWjlwRBNpGLbXbFPWx5X4ORm8se5PmJAimNo
         2iM/md1IArLxBFrGsji5aADWdNIUUykssiWPMksxUJ4p07kCtq+0h6MOpfxZFD6bpeCf
         hD2w==
X-Gm-Message-State: AOJu0YwzEYz1qfLagxu25ArizlIQiFBIl0Uma8syoropfYYaxWN1Kth8
	VmatnrjYrCCs/wEfPCev9SNWc94WG1iafa0mmKjST+6PXuP6mCq5rblBlBeEfbA8M4PeVJMGnQ0
	/7RBy
X-Gm-Gg: AY/fxX6BB0ebUqowV0TNRHQGepASBPgjl6iKN8hDb8vDvNN1LVfCoViYnVz53WQDMMx
	QZIENZ9x4PsHmUtlOvnL3et6cXr9PetaBZJQvSWxrvqkmUIJVKfgyy2OzG60rZ95y8ln/g2ZMy3
	KxC3v30aGDB7+hwOKS+OdPk5r4CofSdGzscXTnS4rmP1GWLStwbDa8x4fuWiiOrnppvbwJ2gHir
	0JVpZCzhXwsr3XcgpmkXgvWKo604s3mac1xy1WwuFkWtoIbyr+kD30MBnIng6UGevHfNlLVbhNO
	5Ohh4O/7l+2+9j3gJO8JCg/O1bD0fgmEqZU7Y9md++eE+SNfCdJCAOkyInVYnsbKcfmetqteB6/
	WuEPMsgathEuu2o/ql+G2xRr084tlDPxBhGofGsWIf0AOgngujnbpzWMguHZFQsnB5cMrbLJI1i
	aDFt5VtQHCRYbOfjY4r72Ie6epFll0JnqviJlxiOwbOF4IDRdom95b6nh4nueD7u3dsfLnYIFI7
	NLQkCLD4eYNTdoG4t4aJntauJqadGmTOFO5GllsHN/szq9PTJZ0
X-Google-Smtp-Source: AGHT+IExzcU4KxYAKo+6QzEegusFqheeXUgfV4mzfHXcZ3exPQAS4Gc5HA+7qc+qrhbcSe6M0i9vCw==
X-Received: by 2002:a17:907:d92:b0:b87:3c3a:cb7e with SMTP id a640c23a62f3a-b873c3ae932mr113137266b.6.1768315399726;
        Tue, 13 Jan 2026 06:43:19 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a23433asm2244955266b.3.2026.01.13.06.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:43:19 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 4/6] wic: extra-partition: Rename install_task to extra_files_task
Date: Tue, 13 Jan 2026 15:43:11 +0100
Message-ID: <20260113144314.3563680-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 14:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229270

Rename install_task to extra_files_task for clarity

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 scripts/lib/wic/plugins/source/extra_partition.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index d41743ec40..efe15a4d15 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -74,7 +74,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.install_task = []
+        cls.extra_files_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
@@ -93,9 +93,9 @@ class ExtraPartitionPlugin(SourcePlugin):
                 for entry in srcs:
                     src = os.path.relpath(entry, kernel_dir)
                     entry_dst_name = entry_name_fn(entry)
-                    cls.install_task.append((src, entry_dst_name))
+                    cls.extra_files_task.append((src, entry_dst_name))
             else:
-                cls.install_task.append((src, dst))
+                cls.extra_files_task.append((src, dst))
 
     @classmethod
     def do_configure_partition(cls, part, source_params, cr, cr_workdir,
@@ -131,7 +131,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-        for task in cls.install_task:
+        for task in cls.extra_files_task:
             src_path, dst_path = task
             logger.debug('Install %s as %s', src_path, dst_path)
             install_cmd = "install -m 0644 -D %s %s" \
-- 
2.52.0


