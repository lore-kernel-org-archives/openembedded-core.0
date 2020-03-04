Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6F2612E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 14:49:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t11so2739043wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 06:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NpJgBRHniK1aI4KXw6lRyaraaO3cRP01aaTXInMVlEk=;
	b=HCUtgFTIIG3pJ1LNUKRN5tEs2IoYW7yOyd5Cc1q2TkbmoiD+TVTM5FOKXuVVvF19B7
	oUrQuCulW1AphQe7po9y7Rr1+53jx2NevV/M4qKEcchRtGWtMnNaquDVJ4MEA8TWXwp7
	y2+8fZhz1QmZEWKy8ngDqbOVbjMvI+GcPpQJB3Ik4wzOoOaPDPVo1sZTOYPzsTz8QzMB
	Kpow1GFYsZjLdMeEyTH5ZPUFeHT0/PQw9VIa755lfSCNBWMiD7yPOyV52tmjETg6FDCB
	9RmYC/ZTSthM3QwZ2/7gjfgEoRV9cLB90b4TkXmGRJjJw7P3/klUGAXV1ecHQiNie8xa
	eU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NpJgBRHniK1aI4KXw6lRyaraaO3cRP01aaTXInMVlEk=;
	b=XLObB96YgGomlGXyc7kJs9yUIPLw5yh6hvmO1psWdo/0Y2KKDujYX7X00WxjXygbcZ
	G63q7XfXl/uRMivmAe2aSmuClDTvFtfmkKarqX0JGEKGqjMLm+GuZXHQ2PNekL7w9pAS
	NXYiDHMftJboMEYtslgygeS1b/L205Y2+SAK6SqQN8kijr85w7SOLqZQbuNETv01iJ+I
	sy03qB0yJYtid/N4g9mLa8nK5r2yI5dNE6UCtLKBrrdvjf3LFkWvXR9Ka872ARRxTrkS
	OYtEhqsUZDiMzfUJezu/Hahkbedq4Uen1Dy5h4h73O7Sy2NVc4GY7Bs96RbcLQ4vOKSv
	9RQA==
X-Gm-Message-State: ANhLgQ2rd0nk53+jIlXMalg/uJ4FFfSqipBjzi2swzGXHgw0DVxQPT7v
	aHA6uGQmNbr5v3Xi6aVrtVO5KajTAhA=
X-Google-Smtp-Source: ADFU+vtP77GEVTw9nTYAQXwo5m7RIXTJuZhMxM50GH9sKa7jCGGy1FpXx4ailCt7UX0w4RRONiSHkA==
X-Received: by 2002:a5d:568f:: with SMTP id f15mr4519441wrv.202.1583333383867; 
	Wed, 04 Mar 2020 06:49:43 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	a26sm4723600wmm.18.2020.03.04.06.49.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 06:49:42 -0800 (PST)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com,
	pbarker@konsulko.com
Date: Wed,  4 Mar 2020 15:49:36 +0100
Message-Id: <20200304144936.2559106-2-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304144936.2559106-1-ricardo@ribalda.com>
References: <20200304144936.2559106-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v2 2/2] wic: Add --embed-rootfs argument
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
X-List-Received-Date: Wed, 04 Mar 2020 14:49:44 -0000
Content-Transfer-Encoding: 8bit

This option adds the content of a rootfs on a specific location on the
rootfs.

It is very useful for making a partition that contains the rootfs for a
host and a target Eg:

/ -> Roofs for the host
/export/ -> Rootfs for the target (which will netboot)

Although today we support making a partition for "/export" this might
not be compatible with some upgrade systems, or we might be limited by
the number of partitions.

With this patch we can use something like:

part / --source rootfs --embed-rootfs target-image /export --embed-rootfs target-image2 /export2

on the .wks file.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/help.py                  |  8 ++++++++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++++-
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 4d342fcf05..140dc504cd 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -979,6 +979,14 @@ DESCRIPTION
                          copies. This option only has an effect with the rootfs
                          source plugin.
 
+         --embed-rootfs: This option is specific to wic. It embeds a rootfs into
+                         the given path to the resulting image. The option
+                         contains two fields, the roofs and the path, separated
+                         by a space. The rootfs follows the same logic as the
+                         rootfs-dir argument. Multiple options can be provided
+                         in order to embed multiple rootfs. This option only has
+                         an effect with the rootfs source plugin.
+
          --extra-space: This option is specific to wic. It adds extra
                         space after the space filled by the content
                         of the partition. The final size can go
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 650b976223..64c8c1175e 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -138,6 +138,7 @@ class KickStart():
         part.add_argument('--align', type=int)
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+')
+        part.add_argument('--embed-rootfs', nargs=2, action='append')
         part.add_argument("--extra-space", type=sizetype)
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype', default='vfat',
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 2d95f78439..13857df82f 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -31,6 +31,7 @@ class Partition():
         self.extra_space = args.extra_space
         self.exclude_path = args.exclude_path
         self.include_path = args.include_path
+        self.embed_rootfs = args.embed_rootfs
         self.fsopts = args.fsopts
         self.fstype = args.fstype
         self.label = args.label
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 40419a64b3..089aaea477 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -17,6 +17,7 @@ import shutil
 import sys
 
 from oe.path import copyhardlinktree, copytree
+from pathlib import Path
 
 from wic import WicError
 from wic.pluginbase import SourcePlugin
@@ -80,7 +81,7 @@ class RootfsPlugin(SourcePlugin):
 
         new_rootfs = None
         # Handle excluded paths.
-        if part.exclude_path or part.include_path:
+        if part.exclude_path or part.include_path or part.embed_rootfs:
             # We need a new rootfs directory we can delete files from. Copy to
             # workdir.
             new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
@@ -100,6 +101,25 @@ class RootfsPlugin(SourcePlugin):
             for path in part.include_path or []:
                 copyhardlinktree(path, new_rootfs)
 
+            for embed in part.embed_rootfs or []:
+                [embed_rootfs, path] = embed
+                #we need to remove the initial / for os.path.join to work
+                if os.path.isabs(path):
+                    path = path[1:]
+                if embed_rootfs in krootfs_dir:
+                    embed_rootfs = krootfs_dir[embed_rootfs]
+                embed_rootfs = cls.__get_rootfs_dir(embed_rootfs)
+                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))
+                tar_cmd = "%s tar cpf %s -C %s ." % (cls.__get_pseudo(native_sysroot,
+                                                     embed_rootfs), tar_file, embed_rootfs)
+                exec_native_cmd(tar_cmd, native_sysroot)
+                untar_cmd = "%s tar xf %s -C %s ." % (cls.__get_pseudo(native_sysroot, new_rootfs),
+                                                      tar_file, os.path.join(new_rootfs, path))
+                Path(os.path.join(new_rootfs, path)).mkdir(parents=True, exist_ok=True)
+                exec_native_cmd(untar_cmd, native_sysroot,
+                                cls.__get_pseudo(native_sysroot, new_rootfs))
+                os.remove(tar_file)
+
             for orig_path in part.exclude_path or []:
                 path = orig_path
                 if os.path.isabs(path):
-- 
2.25.1


