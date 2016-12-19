Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id F362E731AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:21:30 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id c13so51759515lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Vy+7jZpLy6lS/5qQ4bKmqU/J+PY+s8eNH8HBnNqatB8=;
	b=qVvFt72sKZmrjI1VZyFMvnTv+8GkOT3llT0Gju5Wmftdlhf3Nc+m9eyKB1c0Z/6azx
	HgvTloegX/sQ0f3j+jDiHKKFWBnbz/Ne8P+dW02k20J24KD1l6HB4ppsa7Q+Bs3Or4R/
	S7ZkI9ZxZNi6EvKje6tMzLp4pmAFDvJz0ZG5G6C/c9zivWlqZZ5mnXbAjVgyGypbfTNi
	dKEsN3rpRH5tb90TZCSCNf1IENmhvSzO34CCX5Emmuby4vXxN+KTjUXo3rfEYMqDVmuf
	dX+HQKWHph4HzWfWsJoyU5nD0gVJ+YJl34lkOylZw20XPNyaxqni+7PFrjoalzwkCEX3
	Agsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Vy+7jZpLy6lS/5qQ4bKmqU/J+PY+s8eNH8HBnNqatB8=;
	b=iZdU2OLkjNCfiiR0YEYP6rE9HPJmadtZS3Y6Kko+bZm4I83bqefFAW8pU/BjreA27v
	/xX4Lg9QxAQ6SIVkOBXS8apUoljj5Snv8X9Ir2dpmf9JMi9eDTnEhvLj2MXMpYPByrG5
	KW2HbHgvYdLEfFmYX2BnQsbm3FwSi4qYv6a9VXArErugDUu1QjMhp78UGWwWb5rrRR6f
	c4NZuFAhCghLXMd8d6cbh+Qpfu0ZSLT+D3sUEFr6MAoBk1ZQZXXb8SJ/2Z9tN5XLWsn0
	hnfSQ5EazPmQlDR/RmjGm4BLl0BGG44hwdTSXRTlabrwGXL8g9QgZJnxI4/JPE86bVu6
	Cfdg==
X-Gm-Message-State: AKaTC01s3Iiujyu5oZa1TDHOC1adTSAewU3mVIP6d2Q3VpoqKTobVV2Mgol/90RjhO/agA==
X-Received: by 10.25.206.13 with SMTP id e13mr5487584lfg.38.1482146491447;
	Mon, 19 Dec 2016 03:21:31 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id c2sm3681892ljb.8.2016.12.19.03.21.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 03:21:30 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 12:20:58 +0100
Message-Id: <91c9c9688486d36e5f1cae91079be6e197441f31.1482145354.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <20161213185317.GA6550@linux.intel.com>
	<cover.1482145354.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
References: <cover.1482145354.git.maciej.borzecki@rndity.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v6 2/5] wic: add --fixed-size wks option
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
X-List-Received-Date: Mon, 19 Dec 2016 11:21:32 -0000

Added new option --fixed-size to wks. The option can be used to indicate
the exact size of a partition. The option cannot be added together with
--size, in which case an error will be raised. Other options that
influence automatic partition size (--extra-space, --overhead-factor),
if specifiec along with --fixed-size, will raise an error.

If it partition data is larger than the amount of space specified with
--fixed-size option wic will raise an error.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/help.py                | 14 ++++--
 scripts/lib/wic/imager/direct.py       |  2 +-
 scripts/lib/wic/ksparser.py            | 41 ++++++++++++++--
 scripts/lib/wic/partition.py           | 88 +++++++++++++++++++++-------------
 scripts/lib/wic/utils/partitionedfs.py |  2 +-
 5 files changed, 105 insertions(+), 42 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index e5347ec4b7c900c68fc64351a5293e75de0672b3..daa11bf489c135627ddfe4cef968e48f8e3ad1d8 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -646,6 +646,12 @@ DESCRIPTION
                  not specified, the size is in MB.
                  You do not need this option if you use --source.
 
+         --fixed-size: Exact partition size. Value format is the same
+                       as for --size option. This option cannot be
+                       specified along with --size. If partition data
+                       is larger than --fixed-size and error will be
+                       raised when assembling disk image.
+
          --source: This option is a wic-specific option that names the
                    source of the data that will populate the
                    partition.  The most common value for this option
@@ -719,13 +725,15 @@ DESCRIPTION
                         space after the space filled by the content
                         of the partition. The final size can go
                         beyond the size specified by --size.
-                        By default, 10MB.
+                        By default, 10MB. This option cannot be used
+                        with --fixed-size option.
 
          --overhead-factor: This option is specific to wic. The
                             size of the partition is multiplied by
                             this factor. It has to be greater than or
-                            equal to 1.
-                            The default value is 1.3.
+                            equal to 1. The default value is 1.3.
+                            This option cannot be used with --fixed-size
+                            option.
 
          --part-type: This option is specific to wic. It specifies partition
                       type GUID for GPT partitions.
diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 2bedef08d6450096c786def6f75a9ee53fcd4b3b..11ec15e33f65885618c7adc83e55c6a39fedbe99 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -290,7 +290,7 @@ class DirectImageCreator(BaseImageCreator):
                          self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
 
-            self.__image.add_partition(int(part.size),
+            self.__image.add_partition(part.disk_size,
                                        part.disk,
                                        part.mountpoint,
                                        part.source_file,
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 0894e2b199a299fbbed272f2e1c95e9d692e3ab1..62c490274aa92bf82aac304d9323250e3b728d0c 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -113,6 +113,9 @@ def systemidtype(arg):
 class KickStart():
     """"Kickstart parser implementation."""
 
+    DEFAULT_EXTRA_SPACE = 10*1024
+    DEFAULT_OVERHEAD_FACTOR = 1.3
+
     def __init__(self, confpath):
 
         self.partitions = []
@@ -127,16 +130,24 @@ class KickStart():
         part.add_argument('mountpoint', nargs='?')
         part.add_argument('--active', action='store_true')
         part.add_argument('--align', type=int)
-        part.add_argument("--extra-space", type=sizetype, default=10*1024)
+        part.add_argument("--extra-space", type=sizetype)
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype')
         part.add_argument('--label')
         part.add_argument('--no-table', action='store_true')
         part.add_argument('--ondisk', '--ondrive', dest='disk')
-        part.add_argument("--overhead-factor", type=overheadtype, default=1.3)
+        part.add_argument("--overhead-factor", type=overheadtype)
         part.add_argument('--part-type')
         part.add_argument('--rootfs-dir')
-        part.add_argument('--size', type=sizetype, default=0)
+
+        # --size and --fixed-size cannot be specified together; options
+        # ----extra-space and --overhead-factor should also raise a parser
+        # --error, but since nesting mutually exclusive groups does not work,
+        # ----extra-space/--overhead-factor are handled later
+        sizeexcl = part.add_mutually_exclusive_group()
+        sizeexcl.add_argument('--size', type=sizetype, default=0)
+        sizeexcl.add_argument('--fixed-size', type=sizetype, default=0)
+
         part.add_argument('--source')
         part.add_argument('--sourceparams')
         part.add_argument('--system-id', type=systemidtype)
@@ -170,11 +181,33 @@ class KickStart():
                 lineno += 1
                 if line and line[0] != '#':
                     try:
-                        parsed = parser.parse_args(shlex.split(line))
+                        line_args = shlex.split(line)
+                        parsed = parser.parse_args(line_args)
                     except ArgumentError as err:
                         raise KickStartError('%s:%d: %s' % \
                                              (confpath, lineno, err))
                     if line.startswith('part'):
+                        # using ArgumentParser one cannot easily tell if option
+                        # was passed as argument, if said option has a default
+                        # value; --overhead-factor/--extra-space cannot be used
+                        # with --fixed-size, so at least detect when these were
+                        # passed with non-0 values ...
+                        if parsed.fixed_size:
+                            if parsed.overhead_factor or parsed.extra_space:
+                                err = "%s:%d: arguments --overhead-factor and --extra-space not "\
+                                      "allowed with argument --fixed-size" \
+                                      % (confpath, lineno)
+                                raise KickStartError(err)
+                        else:
+                            # ... and provide defaults if not using
+                            # --fixed-size iff given option was not used
+                            # (again, one cannot tell if option was passed but
+                            # with value equal to 0)
+                            if '--overhead-factor' not in line_args:
+                                parsed.overhead_factor = self.DEFAULT_OVERHEAD_FACTOR
+                            if '--extra-space' not in line_args:
+                                parsed.extra_space = self.DEFAULT_EXTRA_SPACE
+
                         self.partnum += 1
                         self.partitions.append(Partition(parsed, self.partnum))
                     elif line.startswith('include'):
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b191cdee542054956262d6c49f3ccc7cf812ee8a..aa8f8a79486b00b99fc43153fda93e654adfd1d9 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -54,6 +54,7 @@ class Partition():
         self.part_type = args.part_type
         self.rootfs_dir = args.rootfs_dir
         self.size = args.size
+        self.fixed_size = args.fixed_size
         self.source = args.source
         self.sourceparams = args.sourceparams
         self.system_id = args.system_id
@@ -87,6 +88,41 @@ class Partition():
         else:
             return 0
 
+    def get_rootfs_size(self, actual_rootfs_size=0):
+        """
+        Calculate the required size of rootfs taking into consideration
+        --size/--fixed-size flags as well as overhead and extra space, as
+        specified in kickstart file. Raises an error if the
+        `actual_rootfs_size` is larger than fixed-size rootfs.
+
+        """
+        if self.fixed_size:
+            rootfs_size = self.fixed_size
+            if actual_rootfs_size > rootfs_size:
+                msger.error("Actual rootfs size (%d kB) is larger than allowed size %d kB" \
+                            %(actual_rootfs_size, rootfs_size))
+        else:
+            extra_blocks = self.get_extra_block_count(actual_rootfs_size)
+            if extra_blocks < self.extra_space:
+                extra_blocks = self.extra_space
+
+            rootfs_size = actual_rootfs_size + extra_blocks
+            rootfs_size *= self.overhead_factor
+
+            msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
+                        (extra_blocks, self.mountpoint, rootfs_size))
+
+        return rootfs_size
+
+    @property
+    def disk_size(self):
+        """
+        Obtain on-disk size of partition taking into consideration
+        --size/--fixed-size options.
+
+        """
+        return self.fixed_size if self.fixed_size else self.size
+
     def prepare(self, creator, cr_workdir, oe_builddir, rootfs_dir,
                 bootimg_dir, kernel_dir, native_sysroot):
         """
@@ -97,9 +133,9 @@ class Partition():
             self.sourceparams_dict = parse_sourceparams(self.sourceparams)
 
         if not self.source:
-            if not self.size:
-                msger.error("The %s partition has a size of zero.  Please "
-                            "specify a non-zero --size for that partition." % \
+            if not self.size and not self.fixed_size:
+                msger.error("The %s partition has a size of zero. Please "
+                            "specify a non-zero --size/--fixed-size for that partition." % \
                             self.mountpoint)
             if self.fstype and self.fstype == "swap":
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
@@ -146,6 +182,7 @@ class Partition():
                                                      oe_builddir,
                                                      bootimg_dir, kernel_dir, rootfs_dir,
                                                      native_sysroot)
+
         # further processing required Partition.size to be an integer, make
         # sure that it is one
         if type(self.size) is not int:
@@ -153,6 +190,12 @@ class Partition():
                           "This a bug in source plugin %s and needs to be fixed." \
                           % (self.mountpoint, self.source))
 
+        if self.fixed_size and self.size > self.fixed_size:
+            msger.error("File system image of partition %s is larger (%d kB) than its"\
+                        "allowed size %d kB" % (self.mountpoint,
+                                                self.size, self.fixed_size))
+
+
     def prepare_rootfs_from_fs_image(self, cr_workdir, oe_builddir,
                                      rootfs_dir):
         """
@@ -228,15 +271,7 @@ class Partition():
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
 
-        extra_blocks = self.get_extra_block_count(actual_rootfs_size)
-        if extra_blocks < self.extra_space:
-            extra_blocks = self.extra_space
-
-        rootfs_size = actual_rootfs_size + extra_blocks
-        rootfs_size *= self.overhead_factor
-
-        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
-                    (extra_blocks, self.mountpoint, rootfs_size))
+        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
 
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), rootfs_size * 1024)
@@ -262,15 +297,7 @@ class Partition():
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
 
-        extra_blocks = self.get_extra_block_count(actual_rootfs_size)
-        if extra_blocks < self.extra_space:
-            extra_blocks = self.extra_space
-
-        rootfs_size = actual_rootfs_size + extra_blocks
-        rootfs_size *= self.overhead_factor
-
-        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
-                    (extra_blocks, self.mountpoint, rootfs_size))
+        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
 
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), rootfs_size * 1024)
@@ -292,20 +319,13 @@ class Partition():
         out = exec_cmd(du_cmd)
         blocks = int(out.split()[0])
 
-        extra_blocks = self.get_extra_block_count(blocks)
-        if extra_blocks < self.extra_space:
-            extra_blocks = self.extra_space
-
-        blocks += extra_blocks
-
-        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
-                    (extra_blocks, self.mountpoint, blocks))
+        rootfs_size = self.get_rootfs_size(blocks)
 
         label_str = "-n boot"
         if self.label:
             label_str = "-n %s" % self.label
 
-        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, blocks)
+        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, rootfs_size)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
@@ -328,8 +348,9 @@ class Partition():
         """
         Prepare an empty ext2/3/4 partition.
         """
+        size = self.disk_size
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), self.size * 1024)
+            os.ftruncate(sparse.fileno(), size * 1024)
 
         extra_imagecmd = "-i 8192"
 
@@ -346,8 +367,9 @@ class Partition():
         """
         Prepare an empty btrfs partition.
         """
+        size = self.disk_size
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), self.size * 1024)
+            os.ftruncate(sparse.fileno(), size * 1024)
 
         label_str = ""
         if self.label:
@@ -362,7 +384,7 @@ class Partition():
         """
         Prepare an empty vfat partition.
         """
-        blocks = self.size
+        blocks = self.disk_size
 
         label_str = "-n boot"
         if self.label:
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 9ea4a30cbb1cc66be66651653814c60b17bad2f9..68301f0b476ed48edfcb4dcad0df903474d13b50 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -210,7 +210,7 @@ class Image():
             msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
                         "sectors (%d bytes)." \
                             % (part['mountpoint'], part['disk_name'], part['num'],
-                               part['start'], part['start'] + part['size'] - 1,
+                               part['start'], disk['offset'] - 1,
                                part['size'], part['size'] * self.sector_size))
 
         # Once all the partitions have been layed out, we can calculate the
-- 
2.5.5


