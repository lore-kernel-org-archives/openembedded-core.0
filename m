Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0CAFA611EF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 08:34:43 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j16so1260370wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 00:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+jaiuBl85U+1RFxmGSrnVmWxPSW5ex/cqDoXb4ws11s=;
	b=GhtB/7EncC3pcYD+6/WJ1Uejx/FbxyiSndxdqv+4XSQebp6tbLGe4Xea1BCToLRioA
	Xx3Jd+rrdBh+mRCYgUZL4QO7iE4Rhvo5UdwlJacxTdKmt7x2Ff+AR5SklfyaJCQT1OEt
	U4+ve3bUlmK+5atNN2U+Xmc8EIWHHsH8k823ILwodNBPG6mNNZzyOj4ZW4SqnWS91L6z
	AvAP65akbuxxQlgTfXvZYlf1qYb7aF/M39lXwROquG5eRpVLat9XKJb6S+7Dfq28XG0j
	EYrKW19dDAIZtyl/76mel4UHxSVDeNFup/36m5l5D+TJNOx02ODhvT/G5b9kLsKNMD1M
	SWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+jaiuBl85U+1RFxmGSrnVmWxPSW5ex/cqDoXb4ws11s=;
	b=b2fkTUx/RJQA/05m22tmPIM2y1DyDmik0LzhMmZKlgOyUdtEnw5y21bW1pxHwgnOyb
	tV6UZU1uW5v1M02fdYsnSsL6CVEfaLVBIvaTFRoAR5rnelpQJ7SNT+TSK+OajjO0nvEo
	Nmxazsm/fXveHiP0iy/PQyA0lgArjyvxOfKFqc3PgNNcJURqqB7mq90PCjuBrMhPYU/R
	VrHJG30HcxL0YzRtG0jvbHXRdMdEuvZVPRMBEgC/D99cSYV8o0w2UCRf6zoeScO+HApT
	mqFQGedPLd9EKVsrV/p8or+NV3ySsmb76Aq1g8Zqr8kjpiXLF/bMotlpll4ACY1AncX2
	aZeg==
X-Gm-Message-State: ANhLgQ2c0+Bsg0gOh3ae2xFppIlqGss4/OL422+hUIy0U90V5FrACdBd
	OLb8CPlLDFegF24NNgZ+c4IpWdmOzuk=
X-Google-Smtp-Source: ADFU+vto75BAbHwiAZBNXCtl1mC5s6B4YnT9+VHss47F19/R1KOTQ/3CB8Vr0zoOrl1c+62pk6E6bQ==
X-Received: by 2002:adf:f18e:: with SMTP id h14mr2837613wro.51.1583310884208; 
	Wed, 04 Mar 2020 00:34:44 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z10sm2962821wmk.31.2020.03.04.00.34.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 00:34:43 -0800 (PST)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 09:34:38 +0100
Message-Id: <20200304083438.1022216-2-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304083438.1022216-1-ricardo@ribalda.com>
References: <20200304083438.1022216-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH 2/2] wic: Add --embed-rootfs argument
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
X-List-Received-Date: Wed, 04 Mar 2020 08:34:44 -0000
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

part / --source rootfs --embed-rootfs=target-image:/export

on the .wks file.

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 scripts/lib/wic/help.py                  |  7 +++++++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             |  1 +
 scripts/lib/wic/plugins/source/rootfs.py | 20 +++++++++++++++++++-
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 4d342fcf05..67a33e6a65 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -979,6 +979,13 @@ DESCRIPTION
                          copies. This option only has an effect with the rootfs
                          source plugin.
 
+         --embed-rootfs: This option is specific to wic. It embeds a rootfs into
+                         the given path to the resulting image. The option
+                         contains two fields, the roofs and the path, separated
+                         by a colon. The rootfs follows the same logic as the
+                         rootfs-dir argument. This option only has an effect
+                         with the rootfs source plugin.
+
          --extra-space: This option is specific to wic. It adds extra
                         space after the space filled by the content
                         of the partition. The final size can go
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 650b976223..d422e2a6bb 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -138,6 +138,7 @@ class KickStart():
         part.add_argument('--align', type=int)
         part.add_argument('--exclude-path', nargs='+')
         part.add_argument('--include-path', nargs='+')
+        part.add_argument('--embed-rootfs', nargs='+')
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
index 40419a64b3..16359601dc 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -80,7 +80,7 @@ class RootfsPlugin(SourcePlugin):
 
         new_rootfs = None
         # Handle excluded paths.
-        if part.exclude_path or part.include_path:
+        if part.exclude_path or part.include_path or part.embed_rootfs:
             # We need a new rootfs directory we can delete files from. Copy to
             # workdir.
             new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
@@ -100,6 +100,24 @@ class RootfsPlugin(SourcePlugin):
             for path in part.include_path or []:
                 copyhardlinktree(path, new_rootfs)
 
+            for embed in part.embed_rootfs or []:
+                [embed_rootfs, path] = embed.split(":")
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
+                exec_native_cmd(untar_cmd, native_sysroot,
+                                cls.__get_pseudo(native_sysroot, new_rootfs))
+                os.remove(tar_file)
+
             for orig_path in part.exclude_path or []:
                 path = orig_path
                 if os.path.isabs(path):
-- 
2.25.1


