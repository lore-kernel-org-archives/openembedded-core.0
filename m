Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QZ7bM-0004fd-3n
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 22:31:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Jun 2011 13:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="16391755"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 21 Jun 2011 13:27:32 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 13:27:21 -0700
Message-Id: <c3a70e785af909a60451135bf72663bed052ff7d.1308687821.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <cover.1308687821.git.nitin.a.kamble@intel.com>
References: <cover.1308687821.git.nitin.a.kamble@intel.com>
Subject: [btrfs patch 1/6] btrfs-tools: new recipe for tools to operate on btrfs images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2011 20:31:20 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added these patches to the recipe to get it to work as desired:

Upstream patches from tmp & for-dragonn branches of repository http://git.kernel.org/?p=linux/kernel/git/mason/btrfs-progs-unstable.git

Also included the debian patches.

Nitin's patch to make the makefile cross friendly

And Xin Zhong's patch to improve mkfs.btrfs

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../btrfs-tools/btrfs-tools/debian/01-labels.patch |   29 +
 .../btrfs-tools/btrfs-tools/debian/02-ftbfs.patch  |  125 +++
 .../btrfs-tools/btrfs-tools/debian/03-glibc.patch  |   16 +
 .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   |   84 ++
 .../btrfs-tools/btrfs-tools/mkfs-xin-fixes.patch   |  183 ++++
 ...g-devices-so-degraded-filesystems-can-be-.patch |   64 ++
 ...-Check-for-RAID10-in-set_avail_alloc_bits.patch |   35 +
 ...t-the-root-generation-in-btrfs-debug-tree.patch |   33 +
 ...low-partial-FS-opens-for-btrfsck-scanning.patch |  253 +++++
 .../0005-Temporary-debugging-for-dragonn.patch     |   75 ++
 ...-add-a-btrfs-select-super-command-to-over.patch |  170 +++
 ...gs-use-safe-string-manipulation-functions.patch |  152 +++
 ...0003-Btrfs-progs-utils-Informative-errors.patch |   37 +
 ...-page-to-new-defragment-command-interface.patch |   99 ++
 ...prove-error-handling-in-the-btrfs-command.patch |  510 +++++++++
 ...progs-update-super-fields-for-space-cache.patch |   57 +
 ...-add-support-for-mixed-data-metadata-bloc.patch |  403 +++++++
 .../upstream-tmp/0008-Update-for-lzo-support.patch |  203 ++++
 ...pdate-clean-up-btrfs-help-and-man-page-V2.patch |  272 +++++
 ...0-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch |  152 +++
 ...11-Add-the-btrfs-filesystem-label-command.patch |  390 +++++++
 ...-Update-man-page-for-mixed-data-metadata-.patch |   42 +
 ...-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch | 1108 ++++++++++++++++++++
 ...-fix-wrong-extent-buffer-size-when-readin.patch |   33 +
 ...5-btrfs-progs-add-discard-support-to-mkfs.patch |  110 ++
 .../btrfs-tools/btrfs-tools_git.bb                 |   52 +
 26 files changed, 4687 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/01-labels.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/02-ftbfs.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/03-glibc.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/mkfs-xin-fixes.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0001-Fill-missing-devices-so-degraded-filesystems-can-be-.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0002-Check-for-RAID10-in-set_avail_alloc_bits.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0003-Print-the-root-generation-in-btrfs-debug-tree.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0004-Allow-partial-FS-opens-for-btrfsck-scanning.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0005-Temporary-debugging-for-dragonn.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-command-to-over.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0002-Btrfs-progs-use-safe-string-manipulation-functions.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0003-Btrfs-progs-utils-Informative-errors.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0004-update-man-page-to-new-defragment-command-interface.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0005-Improve-error-handling-in-the-btrfs-command.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0006-Btrfs-progs-update-super-fields-for-space-cache.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0007-Btrfs-progs-add-support-for-mixed-data-metadata-bloc.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0008-Update-for-lzo-support.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0009-Update-clean-up-btrfs-help-and-man-page-V2.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0010-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0011-Add-the-btrfs-filesystem-label-command.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0012-Btrfs-progs-Update-man-page-for-mixed-data-metadata-.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0013-btrfs-progs-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0014-btrfs-progs-fix-wrong-extent-buffer-size-when-readin.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0015-btrfs-progs-add-discard-support-to-mkfs.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/01-labels.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/01-labels.patch
new file mode 100644
index 0000000..b15a1c9
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/01-labels.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Inappropriate [distribution: debian]
+
+Author: Chris Mason <chris.mason@oracle.com>
+Description: Allow /'s in labels.
+
+diff -Naurp btrfs-tools.orig/mkfs.c btrfs-tools/mkfs.c
+--- btrfs-tools.orig/mkfs.c	2009-03-15 13:27:12.000000000 +0100
++++ btrfs-tools/mkfs.c	2009-04-17 20:53:12.000000000 +0200
+@@ -294,7 +294,6 @@ static u64 parse_profile(char *s)
+ 
+ static char *parse_label(char *input)
+ {
+-	int i;
+ 	int len = strlen(input);
+ 
+ 	if (len > BTRFS_LABEL_SIZE) {
+@@ -302,12 +301,6 @@ static char *parse_label(char *input)
+ 			BTRFS_LABEL_SIZE);
+ 		exit(1);
+ 	}
+-	for (i = 0; i < len; i++) {
+-		if (input[i] == '/' || input[i] == '\\') {
+-			fprintf(stderr, "invalid label %s\n", input);
+-			exit(1);
+-		}
+-	}
+ 	return strdup(input);
+ }
+ 
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/02-ftbfs.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/02-ftbfs.patch
new file mode 100644
index 0000000..7b47190
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/02-ftbfs.patch
@@ -0,0 +1,125 @@
+Upstream-Status: Inappropriate [distribution: debian]
+
+Authors:
+ Luca Bruno <lucab@debian.org>
+ Alexander Kurtz <kurtz.alex@googlemail.com>
+ Daniel Baumann <daniel@debian.org>
+Description:
+ Patch to properly cast and avoiding compiler warnings. Fixes FTBFS on alpha
+ and ia64 (Closes: #539433, #583768).
+
+diff -Naurp btrfs-tools.orig/btrfsctl.c btrfs-tools/btrfsctl.c
+--- btrfs-tools.orig/btrfsctl.c	2010-06-01 07:22:33.000000000 +0200
++++ btrfs-tools/btrfsctl.c	2010-06-05 08:44:05.000000000 +0200
+@@ -234,7 +234,7 @@ int main(int ac, char **av)
+ 		args.fd = fd;
+ 		ret = ioctl(snap_fd, command, &args);
+ 	} else if (command == BTRFS_IOC_DEFAULT_SUBVOL) {
+-		printf("objectid is %llu\n", objectid);
++		printf("objectid is %llu\n", (long long unsigned int) objectid);
+ 		ret = ioctl(fd, command, &objectid);
+ 	} else
+ 		ret = ioctl(fd, command, &args);
+diff -Naurp btrfs-tools.orig/btrfs-list.c btrfs-tools/btrfs-list.c
+--- btrfs-tools.orig/btrfs-list.c	2010-06-01 07:22:33.000000000 +0200
++++ btrfs-tools/btrfs-list.c	2010-06-05 08:47:27.000000000 +0200
+@@ -248,8 +248,9 @@ static int resolve_root(struct root_look
+ 			break;
+ 		}
+ 	}
+-	printf("ID %llu top level %llu path %s\n", ri->root_id, top_id,
+-	       full_path);
++	printf("ID %llu top level %llu path %s\n",
++		(long long unsigned int) ri->root_id,
++		(long long unsigned int) top_id, full_path);
+ 	free(full_path);
+ 	return 0;
+ }
+diff -Naurp btrfs-tools.orig/btrfs-map-logical.c btrfs-tools/btrfs-map-logical.c
+--- btrfs-tools.orig/btrfs-map-logical.c	2010-06-01 07:22:33.000000000 +0200
++++ btrfs-tools/btrfs-map-logical.c	2010-06-05 08:48:10.000000000 +0200
+@@ -65,8 +65,9 @@ struct extent_buffer *debug_read_block(s
+ 		eb->dev_bytenr = multi->stripes[0].physical;
+ 
+ 		fprintf(info_file, "mirror %d logical %Lu physical %Lu "
+-			"device %s\n", mirror_num, bytenr, eb->dev_bytenr,
+-			device->name);
++			"device %s\n", mirror_num,
++			(long long unsigned int) bytenr,
++			(long long unsigned int) eb->dev_bytenr, device->name);
+ 		kfree(multi);
+ 
+ 		if (!copy || mirror_num == copy)
+diff -Naurp btrfs-tools.orig/convert.c btrfs-tools/convert.c
+--- btrfs-tools.orig/convert.c	2010-06-01 07:22:33.000000000 +0200
++++ btrfs-tools/convert.c	2010-06-05 08:43:29.000000000 +0200
+@@ -2572,7 +2572,7 @@ int do_rollback(const char *devname, int
+ 	ext2_root = btrfs_read_fs_root(root->fs_info, &key);
+ 	if (!ext2_root || IS_ERR(ext2_root)) {
+ 		fprintf(stderr, "unable to open subvol %llu\n",
+-			key.objectid);
++			(unsigned long long) key.objectid);
+ 		goto fail;
+ 	}
+ 
+diff -Naurp btrfs-tools.orig/debug-tree.c btrfs-tools/debug-tree.c
+--- btrfs-tools.orig/debug-tree.c	2010-06-01 07:22:33.000000000 +0200
++++ btrfs-tools/debug-tree.c	2010-06-05 08:46:17.000000000 +0200
+@@ -162,7 +162,8 @@ int main(int ac, char **av)
+ 					      root->nodesize, 0);
+ 		}
+ 		if (!leaf) {
+-			fprintf(stderr, "failed to read %llu\n", block_only);
++			fprintf(stderr, "failed to read %llu\n",
++			(long long unsigned int) block_only);
+ 			return 0;
+ 		}
+ 		btrfs_print_tree(root, leaf, 0);
+diff -Naurp btrfs-tools.orig/disk-io.c btrfs-tools/disk-io.c
+--- btrfs-tools.orig/disk-io.c	2010-06-01 07:18:01.000000000 +0200
++++ btrfs-tools/disk-io.c	2010-06-05 08:43:29.000000000 +0200
+@@ -678,7 +678,8 @@ struct btrfs_root *open_ctree_fd(int fp,
+ 		   ~BTRFS_FEATURE_INCOMPAT_SUPP;
+ 	if (features) {
+ 		printk("couldn't open because of unsupported "
+-		       "option features (%Lx).\n", features);
++		       "option features (%Lx).\n",
++			(unsigned long long)features);
+ 		BUG_ON(1);
+ 	}
+ 
+@@ -692,7 +693,8 @@ struct btrfs_root *open_ctree_fd(int fp,
+ 		~BTRFS_FEATURE_COMPAT_RO_SUPP;
+ 	if (writes && features) {
+ 		printk("couldn't open RDWR because of unsupported "
+-		       "option features (%Lx).\n", features);
++		       "option features (%Lx).\n",
++			(unsigned long long) features);
+ 		BUG_ON(1);
+ 	}
+ 
+diff -Naurp btrfs-tools.orig/extent-tree.c btrfs-tools/extent-tree.c
+--- btrfs-tools.orig/extent-tree.c	2010-06-01 07:18:01.000000000 +0200
++++ btrfs-tools/extent-tree.c	2010-06-05 08:43:29.000000000 +0200
+@@ -1448,7 +1448,8 @@ int btrfs_lookup_extent_info(struct btrf
+ 		goto out;
+ 	if (ret != 0) {
+ 		btrfs_print_leaf(root, path->nodes[0]);
+-		printk("failed to find block number %Lu\n", bytenr);
++		printk("failed to find block number %Lu\n",
++		(unsigned long long) bytenr);
+ 		BUG();
+ 	}
+ 
+diff -Naurp btrfs-tools.orig/print-tree.c btrfs-tools/print-tree.c
+--- btrfs-tools.orig/print-tree.c	2010-06-01 07:22:33.000000000 +0200
++++ btrfs-tools/print-tree.c	2010-06-05 08:43:29.000000000 +0200
+@@ -494,7 +494,7 @@ void btrfs_print_leaf(struct btrfs_root
+ 		case BTRFS_DIR_LOG_ITEM_KEY:
+ 			dlog = btrfs_item_ptr(l, i, struct btrfs_dir_log_item);
+ 			printf("\t\tdir log end %Lu\n",
+-			       btrfs_dir_log_end(l, dlog));
++			       (unsigned long long) btrfs_dir_log_end(l, dlog));
+ 		       break;
+ 		case BTRFS_ORPHAN_ITEM_KEY:
+ 			printf("\t\torphan item\n");
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/03-glibc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/03-glibc.patch
new file mode 100644
index 0000000..dc26148
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/03-glibc.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Inappropriate [distribution: debian]
+
+Author: Colin Watson <cjwatson@debian.org>
+Description: Fixes FTBFS with glibc 2.12 (Closes; #586111).
+
+diff -Naurp btrfs-tools.orig//btrfsck.c btrfs-tools/btrfsck.c
+--- btrfs-tools.orig//btrfsck.c	2010-06-05 09:06:38.000000000 +0200
++++ btrfs-tools/btrfsck.c	2010-06-16 16:16:10.000000000 +0200
+@@ -21,6 +21,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <fcntl.h>
++#include <sys/stat.h>
+ #include "kerncompat.h"
+ #include "ctree.h"
+ #include "disk-io.h"
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
new file mode 100644
index 0000000..0a5fb34
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
@@ -0,0 +1,84 @@
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/06/09
+UpstreamStatus: Pending
+
+Avoid these kinds of errors while doing cross build:
+
+| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build0/tmp/sysroots/qemux86 -Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c btrfsctl.c
+| gcc -O2 -pipe -g -feliminate-unused-debug-types -o btrfsctl btrfsctl.o ctree.o disk-io.o radix-tree.o extent-tree.o print-tree.o root-tree.o dir-item.o file-item.o inode-item.o inode-map.o crc32c.o rbtree.o extent-cache.o extent_io.o volumes.o utils.o btrfs-list.o -Wl,-O1  -Wl,--as-needed -luuid
+| /usr/bin/ld: i386 architecture of input file `btrfsctl.o' is incompatible with i386:x86-64 output
+| /usr/bin/ld: i386 architecture of input file `ctree.o' is incompatible with i386:x86-64 output
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile
++++ git/Makefile
+@@ -38,53 +38,53 @@ version:
+ 	bash version.sh
+ 
+ btrfs: $(objects) btrfs.o btrfs_cmds.o
+-	gcc $(CFLAGS) -o btrfs btrfs.o btrfs_cmds.o \
++	$(CC) $(CFLAGS) -o btrfs btrfs.o btrfs_cmds.o \
+ 		$(objects) $(LDFLAGS) $(LIBS)
+ 
+ btrfsctl: $(objects) btrfsctl.o
+-	gcc $(CFLAGS) -o btrfsctl btrfsctl.o $(objects) $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfsctl btrfsctl.o $(objects) $(LDFLAGS) $(LIBS)
+ 
+ btrfs-vol: $(objects) btrfs-vol.o
+-	gcc $(CFLAGS) -o btrfs-vol btrfs-vol.o $(objects) $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfs-vol btrfs-vol.o $(objects) $(LDFLAGS) $(LIBS)
+ 
+ btrfs-show: $(objects) btrfs-show.o
+-	gcc $(CFLAGS) -o btrfs-show btrfs-show.o $(objects) $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfs-show btrfs-show.o $(objects) $(LDFLAGS) $(LIBS)
+ 
+ btrfsck: $(objects) btrfsck.o
+-	gcc $(CFLAGS) -o btrfsck btrfsck.o $(objects) $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfsck btrfsck.o $(objects) $(LDFLAGS) $(LIBS)
+ 
+ mkfs.btrfs: $(objects) mkfs.o
+-	gcc $(CFLAGS) -o mkfs.btrfs $(objects) mkfs.o $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o mkfs.btrfs $(objects) mkfs.o $(LDFLAGS) $(LIBS)
+ 
+ btrfs-debug-tree: $(objects) debug-tree.o
+-	gcc $(CFLAGS) -o btrfs-debug-tree $(objects) debug-tree.o $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfs-debug-tree $(objects) debug-tree.o $(LDFLAGS) $(LIBS)
+ 
+ btrfs-zero-log: $(objects) btrfs-zero-log.o
+-	gcc $(CFLAGS) -o btrfs-zero-log $(objects) btrfs-zero-log.o $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfs-zero-log $(objects) btrfs-zero-log.o $(LDFLAGS) $(LIBS)
+ 
+ btrfs-select-super: $(objects) btrfs-select-super.o
+-	gcc $(CFLAGS) -o btrfs-select-super $(objects) btrfs-select-super.o $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfs-select-super $(objects) btrfs-select-super.o $(LDFLAGS) $(LIBS)
+ 
+ btrfstune: $(objects) btrfstune.o
+-	gcc $(CFLAGS) -o btrfstune $(objects) btrfstune.o $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfstune $(objects) btrfstune.o $(LDFLAGS) $(LIBS)
+ 
+ btrfs-map-logical: $(objects) btrfs-map-logical.o
+-	gcc $(CFLAGS) -o btrfs-map-logical $(objects) btrfs-map-logical.o $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfs-map-logical $(objects) btrfs-map-logical.o $(LDFLAGS) $(LIBS)
+ 
+ btrfs-image: $(objects) btrfs-image.o
+-	gcc $(CFLAGS) -o btrfs-image $(objects) btrfs-image.o -lpthread -lz $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfs-image $(objects) btrfs-image.o -lpthread -lz $(LDFLAGS) $(LIBS)
+ 
+ dir-test: $(objects) dir-test.o
+-	gcc $(CFLAGS) -o dir-test $(objects) dir-test.o $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o dir-test $(objects) dir-test.o $(LDFLAGS) $(LIBS)
+ 
+ quick-test: $(objects) quick-test.o
+-	gcc $(CFLAGS) -o quick-test $(objects) quick-test.o $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o quick-test $(objects) quick-test.o $(LDFLAGS) $(LIBS)
+ 
+ convert: $(objects) convert.o
+-	gcc $(CFLAGS) -o btrfs-convert $(objects) convert.o -lext2fs -lcom_err $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o btrfs-convert $(objects) convert.o -lext2fs -lcom_err $(LDFLAGS) $(LIBS)
+ 
+ ioctl-test: $(objects) ioctl-test.o
+-	gcc $(CFLAGS) -o ioctl-test $(objects) ioctl-test.o $(LDFLAGS) $(LIBS)
++	$(CC) $(CFLAGS) -o ioctl-test $(objects) ioctl-test.o $(LDFLAGS) $(LIBS)
+ 
+ manpages:
+ 	cd man; make
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/mkfs-xin-fixes.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/mkfs-xin-fixes.patch
new file mode 100644
index 0000000..847e870
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/mkfs-xin-fixes.patch
@@ -0,0 +1,183 @@
+Upstream-Status: Pending
+
+This patch is made by xin.zhong@intel.com to implement these supported 
+features in mkfs.btrfs:
+  * populate fs image from a directory while creating it
+  * reduce minimum size of the created image from 256MB to around 24MB
+  * while creating image use the specified device name rather than output.img 
+
+Patch tested and incorporated in poky by:
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/06/20
+
+diff --git a/file-item.c b/file-item.c
+index 9732282..aed42c3 100644
+--- a/file-item.c
++++ b/file-item.c
+@@ -193,7 +193,7 @@ int btrfs_csum_file_block(struct btrfs_trans_handle *trans,
+ 			  struct btrfs_root *root, u64 alloc_end,
+ 			  u64 bytenr, char *data, size_t len)
+ {
+-	int ret;
++	int ret = 0;
+ 	struct btrfs_key file_key;
+ 	struct btrfs_key found_key;
+ 	u64 next_offset = (u64)-1;
+diff --git a/mkfs.c b/mkfs.c
+index 57c88f9..e953a33 100644
+--- a/mkfs.c
++++ b/mkfs.c
+@@ -36,7 +36,7 @@
+ #include <uuid/uuid.h>
+ #include <linux/fs.h>
+ #include <ctype.h>
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
+ #include "kerncompat.h"
+ #include "ctree.h"
+ #include "disk-io.h"
+@@ -517,7 +517,6 @@ static int add_inode_items(struct btrfs_trans_handle *trans,
+ fail:
+ 	return ret;
+ }
+-
+ static int add_xattr_item(struct btrfs_trans_handle *trans,
+ 			  struct btrfs_root *root, u64 objectid,
+ 			  const char *file_name)
+@@ -532,8 +531,10 @@ static int add_xattr_item(struct btrfs_trans_handle *trans,
+ 
+ 	ret = llistxattr(file_name, xattr_list, XATTR_LIST_MAX);
+ 	if (ret < 0) {
+-		fprintf(stderr, "get a list of xattr failed for %s\n",
+-			file_name);
++		if(errno == ENOTSUP)
++			return 0;
++		fprintf(stderr, "get a list of xattr failed for %s errno %d\n",
++				file_name, errno);
+ 		return ret;
+ 	}
+ 	if (ret == 0)
+@@ -546,8 +547,11 @@ static int add_xattr_item(struct btrfs_trans_handle *trans,
+ 
+ 		ret = getxattr(file_name, cur_name, cur_value, XATTR_SIZE_MAX);
+ 		if (ret < 0) {
+-			fprintf(stderr, "get a xattr value failed for %s\n",
+-				cur_name);
++			if(errno == ENOTSUP)
++				return 0;
++			fprintf(stderr, "get a xattr value failed for %s attr %s errno %d\n",
++				file_name, cur_name, errno);
++			return ret;
+ 		}
+ 
+ 		ret = btrfs_insert_xattr_item(trans, root, cur_name,
+@@ -563,7 +567,6 @@ static int add_xattr_item(struct btrfs_trans_handle *trans,
+ 
+ 	return ret;
+ }
+-
+ static int custom_alloc_extent(struct btrfs_root *root, u64 num_bytes,
+ 			       u64 hint_byte, struct btrfs_key *ins)
+ {
+@@ -923,27 +926,27 @@ static int traverse_directory(struct btrfs_trans_handle *trans,
+ 				fprintf(stderr, "add_inode_items failed\n");
+ 				goto fail;
+ 			}
+-
+ 			ret = add_xattr_item(trans, root,
+ 					     cur_inum, cur_file->d_name);
+ 			if (ret) {
+ 				fprintf(stderr, "add_xattr_item failed\n");
+-				goto fail;
++				if(ret != -ENOTSUP)
++					goto fail;
+ 			}
+-
+ 			if (S_ISDIR(st.st_mode)) {
+ 				dir_entry = malloc(sizeof(struct directory_name_entry));
+ 				dir_entry->dir_name = cur_file->d_name;
+ 				dir_entry->path = make_path(parent_dir_entry->path,
+ 							    cur_file->d_name);
+ 				dir_entry->inum = cur_inum;
+-				list_add_tail(&dir_entry->list,	&dir_head->list);
++				list_add_tail(&dir_entry->list, &dir_head->list);
+ 			} else if (S_ISREG(st.st_mode)) {
+ 				ret = add_file_items(trans, root, &cur_inode,
+ 						     cur_inum, parent_inum, &st,
+ 						     cur_file->d_name, out_fd);
+ 				if (ret) {
+-					fprintf(stderr, "add_file_items failed\n");
++					fprintf(stderr, "add_file_items failed %s\n",
++						cur_file->d_name);
+ 					goto fail;
+ 				}
+ 			} else if (S_ISLNK(st.st_mode)) {
+@@ -987,7 +990,7 @@ static int create_chunks(struct btrfs_trans_handle *trans,
+ 	u64 chunk_size;
+ 	u64 meta_type = BTRFS_BLOCK_GROUP_METADATA;
+ 	u64 data_type = BTRFS_BLOCK_GROUP_DATA;
+-	u64 minimum_data_chunk_size = 64 * 1024 * 1024;
++	u64 minimum_data_chunk_size = 8 * 1024 * 1024;
+ 	u64 i;
+ 	int ret;
+ 
+@@ -1062,7 +1065,6 @@ static u64 size_sourcedir(char *dir_name, u64 sectorsize,
+ 	char path[512];
+ 	char *file_name = "temp_file";
+ 	FILE *file;
+-	u64 minimum_data_size = 256 * 1024 * 1024;	/* 256MB */
+ 	u64 default_chunk_size = 8 * 1024 * 1024;	/* 8MB */
+ 	u64 allocated_meta_size = 8 * 1024 * 1024;	/* 8MB */
+ 	u64 allocated_total_size = 20 * 1024 * 1024;	/* 20MB */
+@@ -1101,9 +1103,6 @@ static u64 size_sourcedir(char *dir_name, u64 sectorsize,
+ 
+ 	*num_of_meta_chunks_ret = num_of_meta_chunks;
+ 
+-	if (total_size < minimum_data_size)
+-		total_size = minimum_data_size;
+-
+ 	return total_size;
+ }
+ 
+@@ -1158,9 +1157,9 @@ int main(int ac, char **av)
+ 
+ 	char *source_dir = NULL;
+ 	int source_dir_set = 0;
+-	char *output = "output.img";
+ 	u64 num_of_meta_chunks = 0;
+ 	u64 size_of_data = 0;
++	u64 source_dir_size = 0;
+ 
+ 	while(1) {
+ 		int c;
+@@ -1224,8 +1223,6 @@ int main(int ac, char **av)
+ 		fprintf(stderr, "Illegal nodesize %u\n", nodesize);
+ 		exit(1);
+ 	}
+-	if (source_dir_set)
+-		ac++;
+ 	ac = ac - optind;
+ 	if (ac == 0)
+ 		print_usage();
+@@ -1257,17 +1254,19 @@ int main(int ac, char **av)
+ 			block_count = dev_block_count;
+ 	} else {
+ 		ac = 0;
+-		fd = open_target(output);
++		file = av[optind++];
++		fd = open_target(file);
+ 		if (fd < 0) {
+ 			fprintf(stderr, "unable to open the %s\n", file);
+ 			exit(1);
+ 		}
+ 
+-		file = output;
+ 		first_fd = fd;
+ 		first_file = file;
+-		block_count = size_sourcedir(source_dir, sectorsize,
++		source_dir_size = size_sourcedir(source_dir, sectorsize,
+ 					     &num_of_meta_chunks, &size_of_data);
++		if(block_count < source_dir_size)
++			block_count = source_dir_size;
+ 		ret = zero_output_file(fd, block_count, sectorsize);
+ 		if (ret) {
+ 			fprintf(stderr, "unable to zero the output file\n");
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0001-Fill-missing-devices-so-degraded-filesystems-can-be-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0001-Fill-missing-devices-so-degraded-filesystems-can-be-.patch
new file mode 100644
index 0000000..e466533
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0001-Fill-missing-devices-so-degraded-filesystems-can-be-.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Inappropriate [Backport]
+From a6c54702d8973aef081cff81ed8d90427bb21768 Mon Sep 17 00:00:00 2001
+From: Chris Mason <chris.mason@oracle.com>
+Date: Wed, 15 Dec 2010 16:00:23 -0500
+Subject: [PATCH 1/5] Fill missing devices so degraded filesystems can be read
+
+When a device is missing, the btrfs tools need to be able to read alternate
+copies from the remaining devices.  This creates placeholder devices
+that always return -EIO so the tools can limp along.
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ disk-io.c |    1 +
+ volumes.c |   15 +++++++++++++--
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/disk-io.c b/disk-io.c
+index 5bd9cfc..f4368f3 100644
+--- a/disk-io.c
++++ b/disk-io.c
+@@ -204,6 +204,7 @@ struct extent_buffer *read_tree_block(struct btrfs_root *root, u64 bytenr,
+ 		eb->dev_bytenr = multi->stripes[0].physical;
+ 		kfree(multi);
+ 		ret = read_extent_from_disk(eb);
++
+ 		if (ret == 0 && check_tree_block(root, eb) == 0 &&
+ 		    csum_tree_block(root, eb, 1) == 0 &&
+ 		    verify_parent_transid(eb->tree, eb, parent_transid) == 0) {
+diff --git a/volumes.c b/volumes.c
+index 4bb77e2..5773467 100644
+--- a/volumes.c
++++ b/volumes.c
+@@ -1263,6 +1263,16 @@ int btrfs_chunk_readonly(struct btrfs_root *root, u64 chunk_offset)
+ 	return readonly;
+ }
+ 
++static struct btrfs_device *fill_missing_device(u64 devid)
++{
++	struct btrfs_device *device;
++
++	device = kzalloc(sizeof(*device), GFP_NOFS);
++	device->devid = devid;
++	device->fd = -1;
++	return device;
++}
++
+ static int read_one_chunk(struct btrfs_root *root, struct btrfs_key *key,
+ 			  struct extent_buffer *leaf,
+ 			  struct btrfs_chunk *chunk)
+@@ -1313,8 +1323,9 @@ static int read_one_chunk(struct btrfs_root *root, struct btrfs_key *key,
+ 		map->stripes[i].dev = btrfs_find_device(root, devid, uuid,
+ 							NULL);
+ 		if (!map->stripes[i].dev) {
+-			kfree(map);
+-			return -EIO;
++			map->stripes[i].dev = fill_missing_device(devid);
++			printf("warning, device %llu is missing\n",
++			       (unsigned long long)devid);
+ 		}
+ 
+ 	}
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0002-Check-for-RAID10-in-set_avail_alloc_bits.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0002-Check-for-RAID10-in-set_avail_alloc_bits.patch
new file mode 100644
index 0000000..c8557f7
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0002-Check-for-RAID10-in-set_avail_alloc_bits.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Inappropriate [Backport]
+From 454a0538680bc17656cefadef1f167917ea0b856 Mon Sep 17 00:00:00 2001
+From: Chris Mason <chris.mason@oracle.com>
+Date: Wed, 15 Dec 2010 16:02:45 -0500
+Subject: [PATCH 2/5] Check for RAID10 in set_avail_alloc_bits
+
+When raid is setup with mkfs, it is supposed to cow the initial filesystem
+it creates up to the desired raid level.  RAID10 was not in the list
+of RAID levels it checked for, so the initial FS created for RAID10
+actually only lived on the first disk.
+
+This works well enough because all the roots get quickly cowed during the
+first mount.  The exception is the data relocation tree, which only gets
+cowed when we do a balance.
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ extent-tree.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/extent-tree.c b/extent-tree.c
+index b2f9bb2..108933f 100644
+--- a/extent-tree.c
++++ b/extent-tree.c
+@@ -1775,6 +1775,7 @@ static void set_avail_alloc_bits(struct btrfs_fs_info *fs_info, u64 flags)
+ {
+ 	u64 extra_flags = flags & (BTRFS_BLOCK_GROUP_RAID0 |
+ 				   BTRFS_BLOCK_GROUP_RAID1 |
++				   BTRFS_BLOCK_GROUP_RAID10 |
+ 				   BTRFS_BLOCK_GROUP_DUP);
+ 	if (extra_flags) {
+ 		if (flags & BTRFS_BLOCK_GROUP_DATA)
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0003-Print-the-root-generation-in-btrfs-debug-tree.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0003-Print-the-root-generation-in-btrfs-debug-tree.patch
new file mode 100644
index 0000000..ad41620
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0003-Print-the-root-generation-in-btrfs-debug-tree.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [Backport]
+From d5b8b904ac40e4c5dbff4008accd7e588b697085 Mon Sep 17 00:00:00 2001
+From: Chris Mason <chris.mason@oracle.com>
+Date: Wed, 15 Dec 2010 16:03:00 -0500
+Subject: [PATCH 3/5] Print the root generation in btrfs-debug-tree
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ print-tree.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/print-tree.c b/print-tree.c
+index ac575d5..85399aa 100644
+--- a/print-tree.c
++++ b/print-tree.c
+@@ -505,11 +505,12 @@ void btrfs_print_leaf(struct btrfs_root *root, struct extent_buffer *l)
+ 		case BTRFS_ROOT_ITEM_KEY:
+ 			ri = btrfs_item_ptr(l, i, struct btrfs_root_item);
+ 			read_extent_buffer(l, &root_item, (unsigned long)ri, sizeof(root_item));
+-			printf("\t\troot data bytenr %llu level %d dirid %llu refs %u\n",
++			printf("\t\troot data bytenr %llu level %d dirid %llu refs %u gen %llu\n",
+ 				(unsigned long long)btrfs_root_bytenr(&root_item),
+ 				btrfs_root_level(&root_item),
+ 				(unsigned long long)btrfs_root_dirid(&root_item),
+-				btrfs_root_refs(&root_item));
++				btrfs_root_refs(&root_item),
++				(unsigned long long)btrfs_root_generation(&root_item));
+ 			if (btrfs_root_refs(&root_item) == 0) {
+ 				struct btrfs_key drop_key;
+ 				btrfs_disk_key_to_cpu(&drop_key,
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0004-Allow-partial-FS-opens-for-btrfsck-scanning.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0004-Allow-partial-FS-opens-for-btrfsck-scanning.patch
new file mode 100644
index 0000000..cf87007
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0004-Allow-partial-FS-opens-for-btrfsck-scanning.patch
@@ -0,0 +1,253 @@
+Upstream-Status: Inappropriate [Backport]
+From 238f88bb6c4b9ebad727c6bffb57f542e7e412c1 Mon Sep 17 00:00:00 2001
+From: Chris Mason <chris.mason@oracle.com>
+Date: Sun, 19 Dec 2010 16:22:31 -0500
+Subject: [PATCH 4/5] Allow partial FS opens for btrfsck scanning
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ btrfsck.c |   10 ++++++++--
+ convert.c |   20 ++++++++++++++------
+ disk-io.c |   57 +++++++++++++++++++++++++++++++++++++++++----------------
+ disk-io.h |    5 +++--
+ 4 files changed, 66 insertions(+), 26 deletions(-)
+
+diff --git a/btrfsck.c b/btrfsck.c
+index 63e44d1..f760706 100644
+--- a/btrfsck.c
++++ b/btrfsck.c
+@@ -2820,6 +2820,7 @@ int main(int ac, char **av)
+ {
+ 	struct cache_tree root_cache;
+ 	struct btrfs_root *root;
++	struct btrfs_fs_info *info;
+ 	u64 bytenr = 0;
+ 	int ret;
+ 	int num;
+@@ -2856,11 +2857,16 @@ int main(int ac, char **av)
+ 		return -EBUSY;
+ 	}
+ 
+-	root = open_ctree(av[optind], bytenr, 0);
++	info = open_fs_info(av[optind], bytenr, 0, 1);
+ 
+-	if (root == NULL)
++	if (info == NULL)
+ 		return 1;
+ 
++	root = info->fs_root;
++	if (!root) {
++		fprintf(stderr, "failed to read the filesystem\n");
++		exit(1);
++	}
+ 	ret = check_extents(root);
+ 	if (ret)
+ 		goto out;
+diff --git a/convert.c b/convert.c
+index fbcf4a3..72e3cdc 100644
+--- a/convert.c
++++ b/convert.c
+@@ -2342,6 +2342,7 @@ int do_convert(const char *devname, int datacsum, int packing, int noxattr)
+ 	ext2_filsys ext2_fs;
+ 	struct btrfs_root *root;
+ 	struct btrfs_root *ext2_root;
++	struct btrfs_fs_info *fs_info;
+ 
+ 	ret = open_ext2fs(devname, &ext2_fs);
+ 	if (ret) {
+@@ -2386,11 +2387,12 @@ int do_convert(const char *devname, int datacsum, int packing, int noxattr)
+ 		fprintf(stderr, "unable to update system chunk\n");
+ 		goto fail;
+ 	}
+-	root = open_ctree_fd(fd, devname, super_bytenr, O_RDWR);
+-	if (!root) {
++	fs_info = open_ctree_fd(fd, devname, super_bytenr, O_RDWR, 0);
++	if (!fs_info) {
+ 		fprintf(stderr, "unable to open ctree\n");
+ 		goto fail;
+ 	}
++	root = fs_info->fs_root;
+ 	ret = cache_free_extents(root, ext2_fs);
+ 	if (ret) {
+ 		fprintf(stderr, "error during cache_free_extents %d\n", ret);
+@@ -2447,11 +2449,13 @@ int do_convert(const char *devname, int datacsum, int packing, int noxattr)
+ 		goto fail;
+ 	}
+ 
+-	root = open_ctree_fd(fd, devname, 0, O_RDWR);
+-	if (!root) {
++	fs_info = open_ctree_fd(fd, devname, 0, O_RDWR, 0);
++	if (!fs_info) {
+ 		fprintf(stderr, "unable to open ctree\n");
+ 		goto fail;
+ 	}
++	root = fs_info->fs_root;
++
+ 	/* move chunk tree into system chunk. */
+ 	ret = fixup_chunk_mapping(root);
+ 	if (ret) {
+@@ -2525,6 +2529,7 @@ int do_rollback(const char *devname, int force)
+ 	struct btrfs_key key;
+ 	struct btrfs_path path;
+ 	struct extent_io_tree io_tree;
++	struct btrfs_fs_info *fs_info;
+ 	char *buf;
+ 	char *name;
+ 	u64 bytenr;
+@@ -2546,11 +2551,14 @@ int do_rollback(const char *devname, int force)
+ 		fprintf(stderr, "unable to open %s\n", devname);
+ 		goto fail;
+ 	}
+-	root = open_ctree_fd(fd, devname, 0, O_RDWR);
+-	if (!root) {
++
++	fs_info = open_ctree_fd(fd, devname, 0, O_RDWR, 0);
++	if (!fs_info) {
+ 		fprintf(stderr, "unable to open ctree\n");
+ 		goto fail;
+ 	}
++	root = fs_info->fs_root;
++
+ 	ret = may_rollback(root);
+ 	if (ret < 0) {
+ 		fprintf(stderr, "unable to do rollback\n");
+diff --git a/disk-io.c b/disk-io.c
+index f4368f3..dc100b0 100644
+--- a/disk-io.c
++++ b/disk-io.c
+@@ -441,7 +441,8 @@ static int find_and_setup_log_root(struct btrfs_root *tree_root,
+ 				     btrfs_super_generation(disk_super) + 1);
+ 
+ 	fs_info->log_root_tree = log_root;
+-	BUG_ON(!log_root->node);
++	if (!log_root->node)
++		return -EIO;
+ 	return 0;
+ }
+ 
+@@ -571,10 +572,11 @@ struct btrfs_root *btrfs_read_fs_root(struct btrfs_fs_info *fs_info,
+ 	return root;
+ }
+ 
+-struct btrfs_root *open_ctree(const char *filename, u64 sb_bytenr, int writes)
++struct btrfs_fs_info *open_fs_info(const char *filename, u64 sb_bytenr,
++				   int writes, int partial)
+ {
+ 	int fp;
+-	struct btrfs_root *root;
++	struct btrfs_fs_info *fs_info;
+ 	int flags = O_CREAT | O_RDWR;
+ 
+ 	if (!writes)
+@@ -585,14 +587,25 @@ struct btrfs_root *open_ctree(const char *filename, u64 sb_bytenr, int writes)
+ 		fprintf (stderr, "Could not open %s\n", filename);
+ 		return NULL;
+ 	}
+-	root = open_ctree_fd(fp, filename, sb_bytenr, writes);
++	fs_info = open_ctree_fd(fp, filename, sb_bytenr, writes, partial);
++
+ 	close(fp);
++	return fs_info;
++}
+ 
+-	return root;
++
++struct btrfs_root *open_ctree(const char *filename, u64 sb_bytenr, int writes)
++{
++	struct btrfs_fs_info *fs_info;
++
++	fs_info = open_fs_info(filename, sb_bytenr, writes, 0);
++	if (fs_info)
++		return fs_info->fs_root;
++	return NULL;
+ }
+ 
+-struct btrfs_root *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
+-				 int writes)
++struct btrfs_fs_info *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
++				    int writes, int partial)
+ {
+ 	u32 sectorsize;
+ 	u32 nodesize;
+@@ -727,7 +740,8 @@ struct btrfs_root *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
+ 
+ 	if (!(btrfs_super_flags(disk_super) & BTRFS_SUPER_FLAG_METADUMP)) {
+ 		ret = btrfs_read_chunk_tree(chunk_root);
+-		BUG_ON(ret);
++		if (ret)
++			goto fail;
+ 	}
+ 
+ 	blocksize = btrfs_level_size(tree_root,
+@@ -737,25 +751,32 @@ struct btrfs_root *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
+ 	tree_root->node = read_tree_block(tree_root,
+ 					  btrfs_super_root(disk_super),
+ 					  blocksize, generation);
+-	BUG_ON(!tree_root->node);
++	if (!tree_root->node)
++		goto fail;
++
+ 	ret = find_and_setup_root(tree_root, fs_info,
+ 				  BTRFS_EXTENT_TREE_OBJECTID, extent_root);
+-	BUG_ON(ret);
++	if (ret)
++		goto fail;
++
+ 	extent_root->track_dirty = 1;
+ 
+ 	ret = find_and_setup_root(tree_root, fs_info,
+ 				  BTRFS_DEV_TREE_OBJECTID, dev_root);
+-	BUG_ON(ret);
++	if (ret)
++		goto fail;
++
+ 	dev_root->track_dirty = 1;
+ 
+ 	ret = find_and_setup_root(tree_root, fs_info,
+ 				  BTRFS_CSUM_TREE_OBJECTID, csum_root);
+-	BUG_ON(ret);
++	if (ret)
++		goto fail;
+ 	csum_root->track_dirty = 1;
+ 
+-	BUG_ON(ret);
+-
+-	find_and_setup_log_root(tree_root, fs_info, disk_super);
++	ret = find_and_setup_log_root(tree_root, fs_info, disk_super);
++	if (ret)
++		goto fail;
+ 
+ 	fs_info->generation = generation + 1;
+ 	btrfs_read_block_groups(fs_info->tree_root);
+@@ -769,7 +790,11 @@ struct btrfs_root *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
+ 	fs_info->metadata_alloc_profile = (u64)-1;
+ 	fs_info->system_alloc_profile = fs_info->metadata_alloc_profile;
+ 
+-	return fs_info->fs_root;
++	return fs_info;
++fail:
++	if (partial)
++		return fs_info;
++	return NULL;
+ }
+ 
+ int btrfs_read_dev_super(int fd, struct btrfs_super_block *sb, u64 sb_bytenr)
+diff --git a/disk-io.h b/disk-io.h
+index 7ebec24..03c5eee 100644
+--- a/disk-io.h
++++ b/disk-io.h
+@@ -44,8 +44,9 @@ struct extent_buffer *btrfs_find_create_tree_block(struct btrfs_root *root,
+ int clean_tree_block(struct btrfs_trans_handle *trans,
+ 		     struct btrfs_root *root, struct extent_buffer *buf);
+ struct btrfs_root *open_ctree(const char *filename, u64 sb_bytenr, int writes);
+-struct btrfs_root *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
+-				 int writes);
++struct btrfs_fs_info *open_fs_info(const char *filename, u64 sb_bytenr, int writes, int partial);
++struct btrfs_fs_info *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
++				 int writes, int partial);
+ int close_ctree(struct btrfs_root *root);
+ int write_all_supers(struct btrfs_root *root);
+ int write_ctree_super(struct btrfs_trans_handle *trans,
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0005-Temporary-debugging-for-dragonn.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0005-Temporary-debugging-for-dragonn.patch
new file mode 100644
index 0000000..54123f7
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0005-Temporary-debugging-for-dragonn.patch
@@ -0,0 +1,75 @@
+Upstream-Status: Inappropriate [Backport]
+From e3064e90cfd0be823b2da3edff64f97756fcc245 Mon Sep 17 00:00:00 2001
+From: Chris Mason <chris.mason@oracle.com>
+Date: Mon, 25 Apr 2011 16:31:40 -0400
+Subject: [PATCH 5/5] Temporary debugging for dragonn
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ btrfsck.c |    3 +++
+ disk-io.c |   16 ++++++++--------
+ 2 files changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/btrfsck.c b/btrfsck.c
+index f760706..cb3dee0 100644
+--- a/btrfsck.c
++++ b/btrfsck.c
+@@ -855,6 +855,7 @@ static u64 count_csum_range(struct btrfs_root *root, u64 start, u64 len)
+ 	u64 csum_end;
+ 	u16 csum_size = btrfs_super_csum_size(&root->fs_info->super_copy);
+ 
++	return 0;
+ 	btrfs_init_path(&path);
+ 
+ 	key.objectid = BTRFS_EXTENT_CSUM_OBJECTID;
+@@ -2666,6 +2667,8 @@ static int add_root_to_pending(struct extent_buffer *buf,
+ 			       struct cache_tree *nodes,
+ 			       struct btrfs_key *root_key)
+ {
++	if (root_key->objectid == 7)
++		return 0;
+ 	if (btrfs_header_level(buf) > 0)
+ 		add_pending(nodes, seen, buf->start, buf->len);
+ 	else
+diff --git a/disk-io.c b/disk-io.c
+index dc100b0..c242364 100644
+--- a/disk-io.c
++++ b/disk-io.c
+@@ -614,12 +614,12 @@ struct btrfs_fs_info *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
+ 	u32 stripesize;
+ 	u64 generation;
+ 	struct btrfs_key key;
+-	struct btrfs_root *tree_root = malloc(sizeof(struct btrfs_root));
+-	struct btrfs_root *extent_root = malloc(sizeof(struct btrfs_root));
+-	struct btrfs_root *chunk_root = malloc(sizeof(struct btrfs_root));
+-	struct btrfs_root *dev_root = malloc(sizeof(struct btrfs_root));
+-	struct btrfs_root *csum_root = malloc(sizeof(struct btrfs_root));
+-	struct btrfs_fs_info *fs_info = malloc(sizeof(*fs_info));
++	struct btrfs_root *tree_root = kzalloc(sizeof(struct btrfs_root), GFP_NOFS);
++	struct btrfs_root *extent_root = kzalloc(sizeof(struct btrfs_root), GFP_NOFS);
++	struct btrfs_root *chunk_root = kzalloc(sizeof(struct btrfs_root), GFP_NOFS);
++	struct btrfs_root *dev_root = kzalloc(sizeof(struct btrfs_root), GFP_NOFS);
++	struct btrfs_root *csum_root = kzalloc(sizeof(struct btrfs_root), GFP_NOFS);
++	struct btrfs_fs_info *fs_info = kzalloc(sizeof(*fs_info), GFP_NOFS);
+ 	int ret;
+ 	struct btrfs_super_block *disk_super;
+ 	struct btrfs_fs_devices *fs_devices = NULL;
+@@ -767,13 +767,13 @@ struct btrfs_fs_info *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
+ 		goto fail;
+ 
+ 	dev_root->track_dirty = 1;
+-
++#if 0
+ 	ret = find_and_setup_root(tree_root, fs_info,
+ 				  BTRFS_CSUM_TREE_OBJECTID, csum_root);
+ 	if (ret)
+ 		goto fail;
+ 	csum_root->track_dirty = 1;
+-
++#endif
+ 	ret = find_and_setup_log_root(tree_root, fs_info, disk_super);
+ 	if (ret)
+ 		goto fail;
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-command-to-over.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-command-to-over.patch
new file mode 100644
index 0000000..2102f08
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-command-to-over.patch
@@ -0,0 +1,170 @@
+Upstream-Status: Inappropriate [Backport]
+From 70c6c10134b502fa69955746554031939b85fb0c Mon Sep 17 00:00:00 2001
+From: Chris Mason <chris.mason@oracle.com>
+Date: Thu, 9 Dec 2010 16:36:29 -0500
+Subject: [PATCH 01/15] Btrfs-progs: add a btrfs-select-super command to overwrite the super
+
+Btrfs stores multiple copies of the superblock, and for common power-failure
+crashes where barriers were not in use, one of the super copies is often
+valid while the first copy is not.
+
+This adds a btrfs-select-super -s N /dev/xxx command, which can
+overwrite all the super blocks with a copy that you have already
+determined is valid with btrfsck -s
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ Makefile             |    3 ++
+ btrfs-select-super.c |   99 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ disk-io.c            |    2 +-
+ disk-io.h            |    1 +
+ 4 files changed, 104 insertions(+), 1 deletions(-)
+ create mode 100644 btrfs-select-super.c
+
+diff --git a/Makefile b/Makefile
+index 6e6f6c6..d65f6a2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -62,6 +62,9 @@ btrfs-debug-tree: $(objects) debug-tree.o
+ btrfs-zero-log: $(objects) btrfs-zero-log.o
+ 	gcc $(CFLAGS) -o btrfs-zero-log $(objects) btrfs-zero-log.o $(LDFLAGS) $(LIBS)
+ 
++btrfs-select-super: $(objects) btrfs-select-super.o
++	gcc $(CFLAGS) -o btrfs-select-super $(objects) btrfs-select-super.o $(LDFLAGS) $(LIBS)
++
+ btrfstune: $(objects) btrfstune.o
+ 	gcc $(CFLAGS) -o btrfstune $(objects) btrfstune.o $(LDFLAGS) $(LIBS)
+ 
+diff --git a/btrfs-select-super.c b/btrfs-select-super.c
+new file mode 100644
+index 0000000..f12f36c
+--- /dev/null
++++ b/btrfs-select-super.c
+@@ -0,0 +1,99 @@
++/*
++ * Copyright (C) 2007 Oracle.  All rights reserved.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public
++ * License v2 as published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public
++ * License along with this program; if not, write to the
++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++ * Boston, MA 021110-1307, USA.
++ */
++
++#define _XOPEN_SOURCE 500
++#define _GNU_SOURCE 1
++#include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <sys/stat.h>
++#include "kerncompat.h"
++#include "ctree.h"
++#include "disk-io.h"
++#include "print-tree.h"
++#include "transaction.h"
++#include "list.h"
++#include "version.h"
++#include "utils.h"
++
++static void print_usage(void)
++{
++	fprintf(stderr, "usage: btrfs-select-super -s number dev\n");
++	fprintf(stderr, "%s\n", BTRFS_BUILD_VERSION);
++	exit(1);
++}
++
++int main(int ac, char **av)
++{
++	struct btrfs_root *root;
++	int ret;
++	int num;
++	u64 bytenr = 0;
++
++	while(1) {
++		int c;
++		c = getopt(ac, av, "s:");
++		if (c < 0)
++			break;
++		switch(c) {
++			case 's':
++				num = atol(optarg);
++				bytenr = btrfs_sb_offset(num);
++				printf("using SB copy %d, bytenr %llu\n", num,
++				       (unsigned long long)bytenr);
++				break;
++			default:
++				print_usage();
++		}
++	}
++	ac = ac - optind;
++
++	if (ac != 1)
++		print_usage();
++
++	if (bytenr == 0) {
++		fprintf(stderr, "Please select the super copy with -s\n");
++		print_usage();
++	}
++
++	radix_tree_init();
++
++	if((ret = check_mounted(av[optind])) < 0) {
++		fprintf(stderr, "Could not check mount status: %s\n", strerror(ret));
++		return ret;
++	} else if(ret) {
++		fprintf(stderr, "%s is currently mounted. Aborting.\n", av[optind]);
++		return -EBUSY;
++	}
++
++	root = open_ctree(av[optind], bytenr, 1);
++
++	if (root == NULL)
++		return 1;
++
++	/* make the super writing code think we've read the first super */
++	root->fs_info->super_bytenr = BTRFS_SUPER_INFO_OFFSET;
++	ret = write_all_supers(root);
++
++	/* we don't close the ctree or anything, because we don't want a real
++	 * transaction commit.  We just want the super copy we pulled off the
++	 * disk to overwrite all the other copies
++	 */ 
++	return ret;
++}
+diff --git a/disk-io.c b/disk-io.c
+index a6e1000..5bd9cfc 100644
+--- a/disk-io.c
++++ b/disk-io.c
+@@ -828,7 +828,7 @@ int write_dev_supers(struct btrfs_root *root, struct btrfs_super_block *sb,
+ 
+ 	if (root->fs_info->super_bytenr != BTRFS_SUPER_INFO_OFFSET) {
+ 		btrfs_set_super_bytenr(sb, root->fs_info->super_bytenr);
+-
++printk("speiiiiiiiiiiiiiiiiiiiiiiiiiiiii\n");
+ 		crc = ~(u32)0;
+ 		crc = btrfs_csum_data(NULL, (char *)sb + BTRFS_CSUM_SIZE, crc,
+ 				      BTRFS_SUPER_INFO_SIZE - BTRFS_CSUM_SIZE);
+diff --git a/disk-io.h b/disk-io.h
+index 49e5692..7ebec24 100644
+--- a/disk-io.h
++++ b/disk-io.h
+@@ -47,6 +47,7 @@ struct btrfs_root *open_ctree(const char *filename, u64 sb_bytenr, int writes);
+ struct btrfs_root *open_ctree_fd(int fp, const char *path, u64 sb_bytenr,
+ 				 int writes);
+ int close_ctree(struct btrfs_root *root);
++int write_all_supers(struct btrfs_root *root);
+ int write_ctree_super(struct btrfs_trans_handle *trans,
+ 		      struct btrfs_root *root);
+ int btrfs_read_dev_super(int fd, struct btrfs_super_block *sb, u64 sb_bytenr);
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0002-Btrfs-progs-use-safe-string-manipulation-functions.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0002-Btrfs-progs-use-safe-string-manipulation-functions.patch
new file mode 100644
index 0000000..67739be
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0002-Btrfs-progs-use-safe-string-manipulation-functions.patch
@@ -0,0 +1,152 @@
+Upstream-Status: Inappropriate [Backport]
+From 2636bf1da17720fc99b14cf4db33f1d1a4c9e0ee Mon Sep 17 00:00:00 2001
+From: Eduardo Silva <eduardo.silva@oracle.com>
+Date: Mon, 7 Feb 2011 08:55:04 -0300
+Subject: [PATCH 02/15] Btrfs-progs use safe string manipulation functions
+
+Signed-off-by: Eduardo Silva <eduardo.silva@oracle.com>
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ btrfs_cmds.c |   14 +++++++-------
+ btrfsctl.c   |    2 +-
+ convert.c    |    2 +-
+ utils.c      |    9 +++++----
+ 4 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/btrfs_cmds.c b/btrfs_cmds.c
+index 8031c58..fffb423 100644
+--- a/btrfs_cmds.c
++++ b/btrfs_cmds.c
+@@ -375,7 +375,7 @@ int do_clone(int argc, char **argv)
+ 	printf("Create a snapshot of '%s' in '%s/%s'\n",
+ 	       subvol, dstdir, newname);
+ 	args.fd = fd;
+-	strcpy(args.name, newname);
++	strncpy(args.name, newname, BTRFS_PATH_NAME_MAX);
+ 	res = ioctl(fddst, BTRFS_IOC_SNAP_CREATE, &args);
+ 
+ 	close(fd);
+@@ -436,7 +436,7 @@ int do_delete_subvolume(int argc, char **argv)
+ 	}
+ 
+ 	printf("Delete subvolume '%s/%s'\n", dname, vname);
+-	strcpy(args.name, vname);
++	strncpy(args.name, vname, BTRFS_PATH_NAME_MAX);
+ 	res = ioctl(fd, BTRFS_IOC_SNAP_DESTROY, &args);
+ 
+ 	close(fd);
+@@ -490,7 +490,7 @@ int do_create_subvol(int argc, char **argv)
+ 	}
+ 
+ 	printf("Create subvolume '%s/%s'\n", dstdir, newname);
+-	strcpy(args.name, newname);
++	strncpy(args.name, newname, BTRFS_PATH_NAME_MAX);
+ 	res = ioctl(fddst, BTRFS_IOC_SUBVOL_CREATE, &args);
+ 
+ 	close(fddst);
+@@ -553,7 +553,7 @@ int do_scan(int argc, char **argv)
+ 
+ 		printf("Scanning for Btrfs filesystems in '%s'\n", argv[i]);
+ 
+-		strcpy(args.name, argv[i]);
++		strncpy(args.name, argv[i], BTRFS_PATH_NAME_MAX);
+ 		/*
+ 		 * FIXME: which are the error code returned by this ioctl ?
+ 		 * it seems that is impossible to understand if there no is
+@@ -593,7 +593,7 @@ int do_resize(int argc, char **argv)
+ 	}
+ 
+ 	printf("Resize '%s' of '%s'\n", path, amount);
+-	strcpy(args.name, amount);
++	strncpy(args.name, amount, BTRFS_PATH_NAME_MAX);
+ 	res = ioctl(fd, BTRFS_IOC_RESIZE, &args);
+ 	close(fd);
+ 	if( res < 0 ){
+@@ -736,7 +736,7 @@ int do_add_volume(int nargs, char **args)
+ 		}
+ 		close(devfd);
+ 
+-		strcpy(ioctl_args.name, args[i]);
++		strncpy(ioctl_args.name, args[i], BTRFS_PATH_NAME_MAX);
+ 		res = ioctl(fdmnt, BTRFS_IOC_ADD_DEV, &ioctl_args);
+ 		if(res<0){
+ 			fprintf(stderr, "ERROR: error adding the device '%s'\n", args[i]);
+@@ -792,7 +792,7 @@ int do_remove_volume(int nargs, char **args)
+ 		struct	btrfs_ioctl_vol_args arg;
+ 		int	res;
+ 
+-		strcpy(arg.name, args[i]);
++		strncpy(arg.name, args[i], BTRFS_PATH_NAME_MAX);
+ 		res = ioctl(fdmnt, BTRFS_IOC_RM_DEV, &arg);
+ 		if(res<0){
+ 			fprintf(stderr, "ERROR: error removing the device '%s'\n", args[i]);
+diff --git a/btrfsctl.c b/btrfsctl.c
+index 92bdf39..adfa519 100644
+--- a/btrfsctl.c
++++ b/btrfsctl.c
+@@ -237,7 +237,7 @@ int main(int ac, char **av)
+ 	 }
+ 
+ 	if (name)
+-		strcpy(args.name, name);
++                strncpy(args.name, name, BTRFS_PATH_NAME_MAX + 1);
+ 	else
+ 		args.name[0] = '\0';
+ 
+diff --git a/convert.c b/convert.c
+index d037c98..fbcf4a3 100644
+--- a/convert.c
++++ b/convert.c
+@@ -857,7 +857,7 @@ static int copy_single_xattr(struct btrfs_trans_handle *trans,
+ 		data = databuf;
+ 		datalen = bufsize;
+ 	}
+-	strcpy(namebuf, xattr_prefix_table[name_index]);
++	strncpy(namebuf, xattr_prefix_table[name_index], XATTR_NAME_MAX);
+ 	strncat(namebuf, EXT2_EXT_ATTR_NAME(entry), entry->e_name_len);
+ 	if (name_len + datalen > BTRFS_LEAF_DATA_SIZE(root) -
+ 	    sizeof(struct btrfs_item) - sizeof(struct btrfs_dir_item)) {
+diff --git a/utils.c b/utils.c
+index fd894f3..96ef94d 100644
+--- a/utils.c
++++ b/utils.c
+@@ -108,7 +108,7 @@ int make_btrfs(int fd, const char *device, const char *label,
+ 	btrfs_set_super_csum_type(&super, BTRFS_CSUM_TYPE_CRC32);
+ 	btrfs_set_super_chunk_root_generation(&super, 1);
+ 	if (label)
+-		strcpy(super.label, label);
++		strncpy(super.label, label, BTRFS_LABEL_SIZE - 1);
+ 
+ 	buf = malloc(sizeof(*buf) + max(sectorsize, leafsize));
+ 
+@@ -828,7 +828,7 @@ void btrfs_register_one_device(char *fname)
+ 			"skipping device registration\n");
+ 		return;
+ 	}
+-	strcpy(args.name, fname);
++	strncpy(args.name, fname, BTRFS_PATH_NAME_MAX);
+ 	ret = ioctl(fd, BTRFS_IOC_SCAN_DEV, &args);
+ 	close(fd);
+ }
+@@ -971,6 +971,7 @@ static char *size_strs[] = { "", "KB", "MB", "GB", "TB",
+ char *pretty_sizes(u64 size)
+ {
+ 	int num_divs = 0;
++        int pretty_len = 16;
+ 	u64 last_size = size;
+ 	u64 fract_size = size;
+ 	float fraction;
+@@ -988,8 +989,8 @@ char *pretty_sizes(u64 size)
+ 		return NULL;
+ 
+ 	fraction = (float)fract_size / 1024;
+-	pretty = malloc(16);
+-	sprintf(pretty, "%.2f%s", fraction, size_strs[num_divs-1]);
++	pretty = malloc(pretty_len);
++	snprintf(pretty, pretty_len, "%.2f%s", fraction, size_strs[num_divs-1]);
+ 	return pretty;
+ }
+ 
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0003-Btrfs-progs-utils-Informative-errors.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0003-Btrfs-progs-utils-Informative-errors.patch
new file mode 100644
index 0000000..afc8105
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0003-Btrfs-progs-utils-Informative-errors.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Inappropriate [Backport]
+From ac1a80f52434d05230f9933d8f68e28cc09e10b0 Mon Sep 17 00:00:00 2001
+From: Goldwyn Rodrigues <rgoldwyn@gmail.com>
+Date: Mon, 7 Feb 2011 07:34:36 +0000
+Subject: [PATCH 03/15] Btrfs-progs utils Informative errors
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ utils.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/utils.c b/utils.c
+index 96ef94d..d8c3dcc 100644
+--- a/utils.c
++++ b/utils.c
+@@ -867,7 +867,7 @@ again:
+ 	}
+ 	dirp = opendir(dirname);
+ 	if (!dirp) {
+-		fprintf(stderr, "Unable to open /sys/block for scanning\n");
++		fprintf(stderr, "Unable to open %s for scanning\n", dirname);
+ 		return -ENOENT;
+ 	}
+ 	while(1) {
+@@ -902,7 +902,8 @@ again:
+ 		}
+ 		fd = open(fullpath, O_RDONLY);
+ 		if (fd < 0) {
+-			fprintf(stderr, "failed to read %s\n", fullpath);
++			fprintf(stderr, "failed to read %s: %s\n", fullpath,
++					strerror(errno));
+ 			continue;
+ 		}
+ 		ret = btrfs_scan_one_device(fd, fullpath, &tmp_devices,
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0004-update-man-page-to-new-defragment-command-interface.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0004-update-man-page-to-new-defragment-command-interface.patch
new file mode 100644
index 0000000..4080a75
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0004-update-man-page-to-new-defragment-command-interface.patch
@@ -0,0 +1,99 @@
+Upstream-Status: Inappropriate [Backport]
+From 0a63a11c3d3bbb7e061daad28435b5eef91a947d Mon Sep 17 00:00:00 2001
+From: Hubert Kario <kario@wit.edu.pl>
+Date: Sun, 23 Jan 2011 15:31:07 +0000
+Subject: [PATCH 04/15] update man page to new defragment command interface
+
+Update
+
+        btrfs filesystem defragment
+
+command explanation. Add explanation of advanced parameters and notes
+about general usage.
+
+Add few notes about the
+
+        btrfs <command> --help
+
+usage, fix related grammar.
+
+Signed-off-by: Hubert Kario <kario@wit.edu.pl>
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ man/btrfs.8.in |   33 ++++++++++++++++++++++++++-------
+ 1 files changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/man/btrfs.8.in b/man/btrfs.8.in
+index 26ef982..cba2de1 100644
+--- a/man/btrfs.8.in
++++ b/man/btrfs.8.in
+@@ -15,7 +15,7 @@ btrfs \- control a btrfs filesystem
+ .PP
+ \fBbtrfs\fP \fBsubvolume set-default\fP\fI <id> <path>\fP
+ .PP
+-\fBbtrfs\fP \fBfilesystem defrag\fP\fI <file>|<dir> [<file>|<dir>...]\fP
++\fBbtrfs\fP \fBfilesystem defragment\fP\fI [-vcf] [-s start] [-l len] [-t size] <file>|<dir> [<file>|<dir>...]\fP
+ .PP
+ \fBbtrfs\fP \fBfilesystem sync\fP\fI <path> \fP
+ .PP
+@@ -34,6 +34,8 @@ btrfs \- control a btrfs filesystem
+ .PP
+ \fBbtrfs\fP \fBhelp|\-\-help|\-h \fP\fI\fP
+ .PP
++\fBbtrfs\fP \fB<command> \-\-help \fP\fI\fP
++.PP
+ .SH DESCRIPTION
+ .B btrfs
+ is used to control the filesystem and the files and directories stored. It is
+@@ -60,12 +62,12 @@ returns an error.
+ 
+ If a command is terminated by
+ .I --help
+-, the relevant help is showed. If the passed command matches more commands,
+-the help of all the matched commands are showed. For example
++, the detailed help is showed. If the passed command matches more commands,
++detailed help of all the matched commands is showed. For example
+ .I btrfs dev --help
+ shows the help of all
+ .I device*
+-command.
++commands.
+ 
+ .SH COMMANDS
+ .TP
+@@ -98,12 +100,29 @@ mount time via the \fIsubvol=\fR option.
+ 
+ \fBsubvolume set-default\fR\fI <id> <path>\fR
+ Set the subvolume of the filesystem \fI<path>\fR which is mounted as 
+-\fIdefault\fR. The subvolume is identified by \fB<id>\fR, which 
++\fIdefault\fR. The subvolume is identified by \fI<id>\fR, which 
+ is returned by the \fBsubvolume list\fR command.
+ .TP
+ 
+-\fBfilesystem defragment\fP\fI <file>|<dir> [<file>|<dir>...]\fR
+-Defragment files and/or directories.
++\fBfilesystem defragment\fP\fI [-vcf] [-s start] [-l len] [-t size] <file>|<dir> [<file>|<dir>...]\fR
++Defragment file data and/or directory metadata. To defragment all files in a
++directory you have to specify each one on its own or use your shell wildcards.
++
++\fB-v\fP be verbose
++
++\fB-c\fP compress file contents while defragmenting
++
++\fB-f\fP flush filesystem after defragmenting
++
++\fB-s start\fP defragment only from byte \fIstart\fR onward
++
++\fB-l len\fP defragment only up to \fIlen\fR bytes
++
++\fB-t size\fP defragment only files at least \fIsize\fR bytes big
++
++NOTE: defragmenting with kernels up to 2.6.37 will unlink COW-ed copies of data, don't 
++use it if you use snapshots, have de-duplicated your data or made copies with 
++\fBcp --reflink\fP.
+ .TP
+ 
+ \fBdevice scan\fR \fI[<device> [<device>..]]\fR
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0005-Improve-error-handling-in-the-btrfs-command.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0005-Improve-error-handling-in-the-btrfs-command.patch
new file mode 100644
index 0000000..e7e3fae
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0005-Improve-error-handling-in-the-btrfs-command.patch
@@ -0,0 +1,510 @@
+Upstream-Status: Inappropriate [Backport]
+From b3007332100e01ca84c161b6c75f0a414ab4611b Mon Sep 17 00:00:00 2001
+From: Goffredo Baroncelli <kreijack@libero.it>
+Date: Mon, 20 Dec 2010 20:06:19 +0000
+Subject: [PATCH 05/15] Improve error handling in the btrfs command
+
+Hi Chris,
+
+below is enclosed a trivial patch, which has the aim to improve the error
+reporting of the "btrfs" command.
+
+You can pull from
+
+	http://cassiopea.homelinux.net/git/btrfs-progs-unstable.git
+
+branch
+
+	strerror
+
+I changed every printf("some-error") to something like:
+
+	e = errno;
+	fprintf(stderr, "ERROR: .... - %s", strerror(e));
+
+so:
+
+1) all the error are reported to standard error
+2) At the end of the message is printed the error as returned by the system.
+
+The change is quite simple, I replaced every printf("some-error") to the line
+above. I don't touched anything other.
+I also integrated a missing "printf" on the basis of the Ben patch.
+
+This patch leads the btrfs command to be more "user friendly" :-)
+
+Regards
+G.Baroncelli
+
+ btrfs-list.c |   40 ++++++++++++++++++++++--------
+ btrfs_cmds.c |   77 ++++++++++++++++++++++++++++++++++++++++-----------------
+ utils.c      |    6 ++++
+ 3 files changed, 89 insertions(+), 34 deletions(-)
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ btrfs-list.c |   40 ++++++++++++++++++++++--------
+ btrfs_cmds.c |   77 ++++++++++++++++++++++++++++++++++++++++-----------------
+ utils.c      |    6 ++++
+ 3 files changed, 89 insertions(+), 34 deletions(-)
+
+diff --git a/btrfs-list.c b/btrfs-list.c
+index 93766a8..abcc2f4 100644
+--- a/btrfs-list.c
++++ b/btrfs-list.c
+@@ -265,7 +265,7 @@ static int resolve_root(struct root_lookup *rl, struct root_info *ri)
+ static int lookup_ino_path(int fd, struct root_info *ri)
+ {
+ 	struct btrfs_ioctl_ino_lookup_args args;
+-	int ret;
++	int ret, e;
+ 
+ 	if (ri->path)
+ 		return 0;
+@@ -275,9 +275,11 @@ static int lookup_ino_path(int fd, struct root_info *ri)
+ 	args.objectid = ri->dir_id;
+ 
+ 	ret = ioctl(fd, BTRFS_IOC_INO_LOOKUP, &args);
++	e = errno;
+ 	if (ret) {
+-		fprintf(stderr, "ERROR: Failed to lookup path for root %llu\n",
+-			(unsigned long long)ri->ref_tree);
++		fprintf(stderr, "ERROR: Failed to lookup path for root %llu - %s\n",
++			(unsigned long long)ri->ref_tree,
++			strerror(e));
+ 		return ret;
+ 	}
+ 
+@@ -320,15 +322,18 @@ static u64 find_root_gen(int fd)
+ 	unsigned long off = 0;
+ 	u64 max_found = 0;
+ 	int i;
++	int e;
+ 
+ 	memset(&ino_args, 0, sizeof(ino_args));
+ 	ino_args.objectid = BTRFS_FIRST_FREE_OBJECTID;
+ 
+ 	/* this ioctl fills in ino_args->treeid */
+ 	ret = ioctl(fd, BTRFS_IOC_INO_LOOKUP, &ino_args);
++	e = errno;
+ 	if (ret) {
+-		fprintf(stderr, "ERROR: Failed to lookup path for dirid %llu\n",
+-			(unsigned long long)BTRFS_FIRST_FREE_OBJECTID);
++		fprintf(stderr, "ERROR: Failed to lookup path for dirid %llu - %s\n",
++			(unsigned long long)BTRFS_FIRST_FREE_OBJECTID,
++			strerror(e));
+ 		return 0;
+ 	}
+ 
+@@ -351,8 +356,10 @@ static u64 find_root_gen(int fd)
+ 
+ 	while (1) {
+ 		ret = ioctl(fd, BTRFS_IOC_TREE_SEARCH, &args);
++		e = errno;
+ 		if (ret < 0) {
+-			fprintf(stderr, "ERROR: can't perform the search\n");
++			fprintf(stderr, "ERROR: can't perform the search - %s\n",
++				strerror(e));
+ 			return 0;
+ 		}
+ 		/* the ioctl returns the number of item it found in nr_items */
+@@ -407,14 +414,16 @@ static char *__ino_resolve(int fd, u64 dirid)
+ 	struct btrfs_ioctl_ino_lookup_args args;
+ 	int ret;
+ 	char *full;
++	int e;
+ 
+ 	memset(&args, 0, sizeof(args));
+ 	args.objectid = dirid;
+ 
+ 	ret = ioctl(fd, BTRFS_IOC_INO_LOOKUP, &args);
++	e = errno;
+ 	if (ret) {
+-		fprintf(stderr, "ERROR: Failed to lookup path for dirid %llu\n",
+-			(unsigned long long)dirid);
++		fprintf(stderr, "ERROR: Failed to lookup path for dirid %llu - %s\n",
++			(unsigned long long)dirid, strerror(e) );
+ 		return ERR_PTR(ret);
+ 	}
+ 
+@@ -472,6 +481,7 @@ static char *ino_resolve(int fd, u64 ino, u64 *cache_dirid, char **cache_name)
+ 	struct btrfs_ioctl_search_header *sh;
+ 	unsigned long off = 0;
+ 	int namelen;
++	int e;
+ 
+ 	memset(&args, 0, sizeof(args));
+ 
+@@ -490,8 +500,10 @@ static char *ino_resolve(int fd, u64 ino, u64 *cache_dirid, char **cache_name)
+ 	sk->nr_items = 1;
+ 
+ 	ret = ioctl(fd, BTRFS_IOC_TREE_SEARCH, &args);
++	e = errno;
+ 	if (ret < 0) {
+-		fprintf(stderr, "ERROR: can't perform the search\n");
++		fprintf(stderr, "ERROR: can't perform the search - %s\n",
++			strerror(e));
+ 		return NULL;
+ 	}
+ 	/* the ioctl returns the number of item it found in nr_items */
+@@ -550,6 +562,7 @@ int list_subvols(int fd)
+ 	char *name;
+ 	u64 dir_id;
+ 	int i;
++	int e;
+ 
+ 	root_lookup_init(&root_lookup);
+ 
+@@ -578,8 +591,10 @@ int list_subvols(int fd)
+ 
+ 	while(1) {
+ 		ret = ioctl(fd, BTRFS_IOC_TREE_SEARCH, &args);
++		e = errno;
+ 		if (ret < 0) {
+-			fprintf(stderr, "ERROR: can't perform the search\n");
++			fprintf(stderr, "ERROR: can't perform the search - %s\n",
++				strerror(e));
+ 			return ret;
+ 		}
+ 		/* the ioctl returns the number of item it found in nr_items */
+@@ -747,6 +762,7 @@ int find_updated_files(int fd, u64 root_id, u64 oldest_gen)
+ 	u64 found_gen;
+ 	u64 max_found = 0;
+ 	int i;
++	int e;
+ 	u64 cache_dirid = 0;
+ 	u64 cache_ino = 0;
+ 	char *cache_dir_name = NULL;
+@@ -773,8 +789,10 @@ int find_updated_files(int fd, u64 root_id, u64 oldest_gen)
+ 	max_found = find_root_gen(fd);
+ 	while(1) {
+ 		ret = ioctl(fd, BTRFS_IOC_TREE_SEARCH, &args);
++		e = errno;
+ 		if (ret < 0) {
+-			fprintf(stderr, "ERROR: can't perform the search\n");
++			fprintf(stderr, "ERROR: can't perform the search- %s\n",
++				strerror(e));
+ 			return ret;
+ 		}
+ 		/* the ioctl returns the number of item it found in nr_items */
+diff --git a/btrfs_cmds.c b/btrfs_cmds.c
+index fffb423..775bfe1 100644
+--- a/btrfs_cmds.c
++++ b/btrfs_cmds.c
+@@ -156,6 +156,7 @@ int do_defrag(int ac, char **av)
+ 	int verbose = 0;
+ 	int fancy_ioctl = 0;
+ 	struct btrfs_ioctl_defrag_range_args range;
++	int e=0;
+ 
+ 	optind = 1;
+ 	while(1) {
+@@ -219,19 +220,21 @@ int do_defrag(int ac, char **av)
+ 		}
+ 		if (!fancy_ioctl) {
+ 			ret = ioctl(fd, BTRFS_IOC_DEFRAG, NULL);
++			e=errno;
+ 		} else {
+ 			ret = ioctl(fd, BTRFS_IOC_DEFRAG_RANGE, &range);
+ 			if (ret && errno == ENOTTY) {
+-				fprintf(stderr, "defrag range ioctl not "
++				fprintf(stderr, "ERROR: defrag range ioctl not "
+ 					"supported in this kernel, please try "
+ 					"without any options.\n");
+ 				errors++;
++				close(fd);
+ 				break;
+ 			}
+ 		}
+ 		if (ret) {
+-			fprintf(stderr, "ioctl failed on %s ret %d errno %d\n",
+-				av[i], ret, errno);
++			fprintf(stderr, "ERROR: defrag failed on %s - %s\n",
++				av[i], strerror(e));
+ 			errors++;
+ 		}
+ 		close(fd);
+@@ -310,7 +313,7 @@ int do_subvol_list(int argc, char **argv)
+ int do_clone(int argc, char **argv)
+ {
+ 	char	*subvol, *dst;
+-	int	res, fd, fddst, len;
++	int	res, fd, fddst, len, e;
+ 	char	*newname;
+ 	char	*dstdir;
+ 
+@@ -377,12 +380,14 @@ int do_clone(int argc, char **argv)
+ 	args.fd = fd;
+ 	strncpy(args.name, newname, BTRFS_PATH_NAME_MAX);
+ 	res = ioctl(fddst, BTRFS_IOC_SNAP_CREATE, &args);
++	e = errno;
+ 
+ 	close(fd);
+ 	close(fddst);
+ 
+ 	if(res < 0 ){
+-		fprintf( stderr, "ERROR: cannot snapshot '%s'\n",subvol);
++		fprintf( stderr, "ERROR: cannot snapshot '%s' - %s\n",
++			subvol, strerror(e));
+ 		return 11;
+ 	}
+ 
+@@ -392,7 +397,7 @@ int do_clone(int argc, char **argv)
+ 
+ int do_delete_subvolume(int argc, char **argv)
+ {
+-	int	res, fd, len;
++	int	res, fd, len, e;
+ 	struct btrfs_ioctl_vol_args	args;
+ 	char	*dname, *vname, *cpath;
+ 	char	*path = argv[1];
+@@ -438,11 +443,13 @@ int do_delete_subvolume(int argc, char **argv)
+ 	printf("Delete subvolume '%s/%s'\n", dname, vname);
+ 	strncpy(args.name, vname, BTRFS_PATH_NAME_MAX);
+ 	res = ioctl(fd, BTRFS_IOC_SNAP_DESTROY, &args);
++	e = errno;
+ 
+ 	close(fd);
+ 
+ 	if(res < 0 ){
+-		fprintf( stderr, "ERROR: cannot delete '%s/%s'\n",dname, vname);
++		fprintf( stderr, "ERROR: cannot delete '%s/%s' - %s\n",
++			dname, vname, strerror(e));
+ 		return 11;
+ 	}
+ 
+@@ -452,7 +459,7 @@ int do_delete_subvolume(int argc, char **argv)
+ 
+ int do_create_subvol(int argc, char **argv)
+ {
+-	int	res, fddst, len;
++	int	res, fddst, len, e;
+ 	char	*newname;
+ 	char	*dstdir;
+ 	struct btrfs_ioctl_vol_args	args;
+@@ -492,11 +499,13 @@ int do_create_subvol(int argc, char **argv)
+ 	printf("Create subvolume '%s/%s'\n", dstdir, newname);
+ 	strncpy(args.name, newname, BTRFS_PATH_NAME_MAX);
+ 	res = ioctl(fddst, BTRFS_IOC_SUBVOL_CREATE, &args);
++	e = errno;
+ 
+ 	close(fddst);
+ 
+ 	if(res < 0 ){
+-		fprintf( stderr, "ERROR: cannot create subvolume\n");
++		fprintf( stderr, "ERROR: cannot create subvolume - %s\n",
++			strerror(e));
+ 		return 11;
+ 	}
+ 
+@@ -506,7 +515,7 @@ int do_create_subvol(int argc, char **argv)
+ 
+ int do_fssync(int argc, char **argv)
+ {
+-	int fd, res;
++	int 	fd, res, e;
+ 	char	*path = argv[1];
+ 
+ 	fd = open_file_or_dir(path);
+@@ -517,9 +526,11 @@ int do_fssync(int argc, char **argv)
+ 
+ 	printf("FSSync '%s'\n", path);
+ 	res = ioctl(fd, BTRFS_IOC_SYNC);
++	e = errno;
+ 	close(fd);
+ 	if( res < 0 ){
+-		fprintf(stderr, "ERROR: unable to fs-syncing '%s'\n", path);
++		fprintf(stderr, "ERROR: unable to fs-syncing '%s' - %s\n", 
++			path, strerror(e));
+ 		return 16;
+ 	}
+ 
+@@ -528,7 +539,7 @@ int do_fssync(int argc, char **argv)
+ 
+ int do_scan(int argc, char **argv)
+ {
+-	int	i, fd;
++	int	i, fd, e;
+ 	if(argc<=1){
+ 		int ret;
+ 
+@@ -560,10 +571,12 @@ int do_scan(int argc, char **argv)
+ 		 * a btrfs filesystem from an I/O error !!!
+ 		 */
+ 		ret = ioctl(fd, BTRFS_IOC_SCAN_DEV, &args);
++		e = errno;
+ 
+ 		if( ret < 0 ){
+ 			close(fd);
+-			fprintf(stderr, "ERROR: unable to scan the device '%s'\n", argv[i]);
++			fprintf(stderr, "ERROR: unable to scan the device '%s' - %s\n", 
++				argv[i], strerror(e));
+ 			return 11;
+ 		}
+ 	}
+@@ -577,7 +590,7 @@ int do_resize(int argc, char **argv)
+ {
+ 
+ 	struct btrfs_ioctl_vol_args	args;
+-	int	fd, res, len;
++	int	fd, res, len, e;
+ 	char	*amount=argv[1], *path=argv[2];
+ 
+ 	fd = open_file_or_dir(path);
+@@ -595,9 +608,11 @@ int do_resize(int argc, char **argv)
+ 	printf("Resize '%s' of '%s'\n", path, amount);
+ 	strncpy(args.name, amount, BTRFS_PATH_NAME_MAX);
+ 	res = ioctl(fd, BTRFS_IOC_RESIZE, &args);
++	e = errno;
+ 	close(fd);
+ 	if( res < 0 ){
+-		fprintf(stderr, "ERROR: unable to resize '%s'\n", path);
++		fprintf(stderr, "ERROR: unable to resize '%s' - %s\n", 
++			path, strerror(e));
+ 		return 30;
+ 	}
+ 	return 0;
+@@ -691,7 +706,7 @@ int do_add_volume(int nargs, char **args)
+ {
+ 
+ 	char	*mntpnt = args[nargs-1];
+-	int	i, fdmnt, ret=0;
++	int	i, fdmnt, ret=0, e;
+ 
+ 
+ 	fdmnt = open_file_or_dir(mntpnt);
+@@ -738,8 +753,10 @@ int do_add_volume(int nargs, char **args)
+ 
+ 		strncpy(ioctl_args.name, args[i], BTRFS_PATH_NAME_MAX);
+ 		res = ioctl(fdmnt, BTRFS_IOC_ADD_DEV, &ioctl_args);
++		e = errno;
+ 		if(res<0){
+-			fprintf(stderr, "ERROR: error adding the device '%s'\n", args[i]);
++			fprintf(stderr, "ERROR: error adding the device '%s' - %s\n", 
++				args[i], strerror(e));
+ 			ret++;
+ 		}
+ 
+@@ -756,7 +773,7 @@ int do_add_volume(int nargs, char **args)
+ int do_balance(int argc, char **argv)
+ {
+ 
+-	int	fdmnt, ret=0;
++	int	fdmnt, ret=0, e;
+ 	struct btrfs_ioctl_vol_args args;
+ 	char	*path = argv[1];
+ 
+@@ -768,9 +785,11 @@ int do_balance(int argc, char **argv)
+ 
+ 	memset(&args, 0, sizeof(args));
+ 	ret = ioctl(fdmnt, BTRFS_IOC_BALANCE, &args);
++	e = errno;
+ 	close(fdmnt);
+ 	if(ret<0){
+-		fprintf(stderr, "ERROR: balancing '%s'\n", path);
++		fprintf(stderr, "ERROR: error during balancing '%s' - %s\n", 
++			path, strerror(e));
+ 
+ 		return 19;
+ 	}
+@@ -780,7 +799,7 @@ int do_remove_volume(int nargs, char **args)
+ {
+ 
+ 	char	*mntpnt = args[nargs-1];
+-	int	i, fdmnt, ret=0;
++	int	i, fdmnt, ret=0, e;
+ 
+ 	fdmnt = open_file_or_dir(mntpnt);
+ 	if (fdmnt < 0) {
+@@ -794,8 +813,10 @@ int do_remove_volume(int nargs, char **args)
+ 
+ 		strncpy(arg.name, args[i], BTRFS_PATH_NAME_MAX);
+ 		res = ioctl(fdmnt, BTRFS_IOC_RM_DEV, &arg);
++		e = errno;
+ 		if(res<0){
+-			fprintf(stderr, "ERROR: error removing the device '%s'\n", args[i]);
++			fprintf(stderr, "ERROR: error removing the device '%s' - %s\n", 
++				args[i], strerror(e));
+ 			ret++;
+ 		}
+ 	}
+@@ -809,7 +830,7 @@ int do_remove_volume(int nargs, char **args)
+ 
+ int do_set_default_subvol(int nargs, char **argv)
+ {
+-	int	ret=0, fd;
++	int	ret=0, fd, e;
+ 	u64	objectid;
+ 	char	*path = argv[2];
+ 	char	*subvolid = argv[1];
+@@ -826,9 +847,11 @@ int do_set_default_subvol(int nargs, char **argv)
+ 		return 30;
+ 	}
+ 	ret = ioctl(fd, BTRFS_IOC_DEFAULT_SUBVOL, &objectid);
++	e = errno;
+ 	close(fd);
+ 	if( ret < 0 ){
+-		fprintf(stderr, "ERROR: unable to set a new default subvolume\n");
++		fprintf(stderr, "ERROR: unable to set a new default subvolume - %s\n",
++			strerror(e));
+ 		return 30;
+ 	}
+ 	return 0;
+@@ -840,6 +863,7 @@ int do_df_filesystem(int nargs, char **argv)
+ 	u64 count = 0, i;
+ 	int ret;
+ 	int fd;
++	int e;
+ 	char *path = argv[1];
+ 
+ 	fd = open_file_or_dir(path);
+@@ -856,7 +880,10 @@ int do_df_filesystem(int nargs, char **argv)
+ 	sargs->total_spaces = 0;
+ 
+ 	ret = ioctl(fd, BTRFS_IOC_SPACE_INFO, sargs);
++	e = errno;
+ 	if (ret) {
++		fprintf(stderr, "ERROR: couldn't get space info on '%s' - %s\n",
++			path, strerror(e));
+ 		free(sargs);
+ 		return ret;
+ 	}
+@@ -874,7 +901,11 @@ int do_df_filesystem(int nargs, char **argv)
+ 	sargs->total_spaces = 0;
+ 
+ 	ret = ioctl(fd, BTRFS_IOC_SPACE_INFO, sargs);
++	e = errno;
+ 	if (ret) {
++		fprintf(stderr, "ERROR: couldn't get space info on '%s' - %s\n",
++			path, strerror(e));
++		close(fd);
+ 		free(sargs);
+ 		return ret;
+ 	}
+diff --git a/utils.c b/utils.c
+index d8c3dcc..2a15d86 100644
+--- a/utils.c
++++ b/utils.c
+@@ -821,6 +821,7 @@ void btrfs_register_one_device(char *fname)
+ 	struct btrfs_ioctl_vol_args args;
+ 	int fd;
+ 	int ret;
++	int e;
+ 
+ 	fd = open("/dev/btrfs-control", O_RDONLY);
+ 	if (fd < 0) {
+@@ -830,6 +831,11 @@ void btrfs_register_one_device(char *fname)
+ 	}
+ 	strncpy(args.name, fname, BTRFS_PATH_NAME_MAX);
+ 	ret = ioctl(fd, BTRFS_IOC_SCAN_DEV, &args);
++	e = errno;
++	if(ret<0){
++		fprintf(stderr, "ERROR: unable to scan the device '%s' - %s\n",
++			fname, strerror(e));
++	}
+ 	close(fd);
+ }
+ 
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0006-Btrfs-progs-update-super-fields-for-space-cache.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0006-Btrfs-progs-update-super-fields-for-space-cache.patch
new file mode 100644
index 0000000..d8b8b10
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0006-Btrfs-progs-update-super-fields-for-space-cache.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Inappropriate [Backport]
+From c2cefc42ebf8e32e36b1866048a02a579f2cef9a Mon Sep 17 00:00:00 2001
+From: Josef Bacik <josef@redhat.com>
+Date: Thu, 9 Dec 2010 18:27:03 +0000
+Subject: [PATCH 06/15] Btrfs-progs: update super fields for space cache
+
+This patch updates the super field to add the cache_generation member.  It also
+makes us set it to -1 on mkfs so any new filesystem will get the space cache
+stuff turned on.  Thanks,
+
+Signed-off-by: Josef Bacik <josef@redhat.com>
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ ctree.h |    6 +++++-
+ utils.c |    1 +
+ 2 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/ctree.h b/ctree.h
+index b79e238..962c510 100644
+--- a/ctree.h
++++ b/ctree.h
+@@ -340,8 +340,10 @@ struct btrfs_super_block {
+ 
+ 	char label[BTRFS_LABEL_SIZE];
+ 
++	__le64 cache_generation;
++
+ 	/* future expansion */
+-	__le64 reserved[32];
++	__le64 reserved[31];
+ 	u8 sys_chunk_array[BTRFS_SYSTEM_CHUNK_ARRAY_SIZE];
+ } __attribute__ ((__packed__));
+ 
+@@ -1564,6 +1566,8 @@ BTRFS_SETGET_STACK_FUNCS(super_incompat_flags, struct btrfs_super_block,
+ 			 incompat_flags, 64);
+ BTRFS_SETGET_STACK_FUNCS(super_csum_type, struct btrfs_super_block,
+ 			 csum_type, 16);
++BTRFS_SETGET_STACK_FUNCS(super_cache_generation, struct btrfs_super_block,
++			 cache_generation, 64);
+ 
+ static inline int btrfs_super_csum_size(struct btrfs_super_block *s)
+ {
+diff --git a/utils.c b/utils.c
+index 2a15d86..35e17b8 100644
+--- a/utils.c
++++ b/utils.c
+@@ -107,6 +107,7 @@ int make_btrfs(int fd, const char *device, const char *label,
+ 	btrfs_set_super_stripesize(&super, stripesize);
+ 	btrfs_set_super_csum_type(&super, BTRFS_CSUM_TYPE_CRC32);
+ 	btrfs_set_super_chunk_root_generation(&super, 1);
++	btrfs_set_super_cache_generation(&super, -1);
+ 	if (label)
+ 		strncpy(super.label, label, BTRFS_LABEL_SIZE - 1);
+ 
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0007-Btrfs-progs-add-support-for-mixed-data-metadata-bloc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0007-Btrfs-progs-add-support-for-mixed-data-metadata-bloc.patch
new file mode 100644
index 0000000..f533c5b
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0007-Btrfs-progs-add-support-for-mixed-data-metadata-bloc.patch
@@ -0,0 +1,403 @@
+Upstream-Status: Inappropriate [Backport]
+From e7ef1f26a25d06d5606934dced7b52f3e33f1d33 Mon Sep 17 00:00:00 2001
+From: Josef Bacik <josef@redhat.com>
+Date: Thu, 9 Dec 2010 18:31:08 +0000
+Subject: [PATCH 07/15] Btrfs-progs: add support for mixed data+metadata block groups
+
+So alot of crazy people (I'm looking at you Meego) want to use btrfs on phones
+and such with small devices.  Unfortunately the way we split out metadata/data
+chunks it makes space usage inefficient for volumes that are smaller than
+1gigabyte.  So add a -M option for mixing metadata+data, and default to this
+mixed mode if the filesystem is less than or equal to 1 gigabyte.  I've tested
+this with xfstests on a 100mb filesystem and everything is a-ok.
+
+Signed-off-by: Josef Bacik <josef@redhat.com>
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ btrfs-vol.c  |    4 +-
+ btrfs_cmds.c |   13 +++++-
+ ctree.h      |   10 +++--
+ mkfs.c       |  122 +++++++++++++++++++++++++++++++++++++++++-----------------
+ utils.c      |   10 ++--
+ utils.h      |    2 +-
+ 6 files changed, 112 insertions(+), 49 deletions(-)
+
+diff --git a/btrfs-vol.c b/btrfs-vol.c
+index 4ed799d..f573023 100644
+--- a/btrfs-vol.c
++++ b/btrfs-vol.c
+@@ -143,7 +143,9 @@ int main(int ac, char **av)
+ 		exit(1);
+ 	}
+ 	if (cmd == BTRFS_IOC_ADD_DEV) {
+-		ret = btrfs_prepare_device(devfd, device, 1, &dev_block_count);
++		int mixed = 0;
++
++		ret = btrfs_prepare_device(devfd, device, 1, &dev_block_count, &mixed);
+ 		if (ret) {
+ 			fprintf(stderr, "Unable to init %s\n", device);
+ 			exit(1);
+diff --git a/btrfs_cmds.c b/btrfs_cmds.c
+index 775bfe1..c21a007 100644
+--- a/btrfs_cmds.c
++++ b/btrfs_cmds.c
+@@ -720,6 +720,7 @@ int do_add_volume(int nargs, char **args)
+ 		int	devfd, res;
+ 		u64 dev_block_count = 0;
+ 		struct stat st;
++		int mixed = 0;
+ 
+ 		devfd = open(args[i], O_RDWR);
+ 		if (!devfd) {
+@@ -742,7 +743,7 @@ int do_add_volume(int nargs, char **args)
+ 			continue;
+ 		}
+ 
+-		res = btrfs_prepare_device(devfd, args[i], 1, &dev_block_count);
++		res = btrfs_prepare_device(devfd, args[i], 1, &dev_block_count, &mixed);
+ 		if (res) {
+ 			fprintf(stderr, "ERROR: Unable to init '%s'\n", args[i]);
+ 			close(devfd);
+@@ -920,8 +921,14 @@ int do_df_filesystem(int nargs, char **argv)
+ 		memset(description, 0, 80);
+ 
+ 		if (flags & BTRFS_BLOCK_GROUP_DATA) {
+-			snprintf(description, 5, "%s", "Data");
+-			written += 4;
++			if (flags & BTRFS_BLOCK_GROUP_METADATA) {
++				snprintf(description, 15, "%s",
++					 "Data+Metadata");
++				written += 14;
++			} else {
++				snprintf(description, 5, "%s", "Data");
++				written += 4;
++			}
+ 		} else if (flags & BTRFS_BLOCK_GROUP_SYSTEM) {
+ 			snprintf(description, 7, "%s", "System");
+ 			written += 6;
+diff --git a/ctree.h b/ctree.h
+index 962c510..ed83d02 100644
+--- a/ctree.h
++++ b/ctree.h
+@@ -352,13 +352,15 @@ struct btrfs_super_block {
+  * ones specified below then we will fail to mount
+  */
+ #define BTRFS_FEATURE_INCOMPAT_MIXED_BACKREF	(1ULL << 0)
+-#define BTRFS_FEATURE_INCOMPAT_DEFAULT_SUBVOL	(2ULL << 0)
++#define BTRFS_FEATURE_INCOMPAT_DEFAULT_SUBVOL	(1ULL << 1)
++#define BTRFS_FEATURE_INCOMPAT_MIXED_GROUPS	(1ULL << 2)
+ 
+ #define BTRFS_FEATURE_COMPAT_SUPP		0ULL
+ #define BTRFS_FEATURE_COMPAT_RO_SUPP		0ULL
+-#define BTRFS_FEATURE_INCOMPAT_SUPP		\
+-	(BTRFS_FEATURE_INCOMPAT_MIXED_BACKREF |	\
+-	 BTRFS_FEATURE_INCOMPAT_DEFAULT_SUBVOL)
++#define BTRFS_FEATURE_INCOMPAT_SUPP			\
++	(BTRFS_FEATURE_INCOMPAT_MIXED_BACKREF |		\
++	 BTRFS_FEATURE_INCOMPAT_DEFAULT_SUBVOL |	\
++	 BTRFS_FEATURE_INCOMPAT_MIXED_GROUPS)
+ 
+ /*
+  * A leaf is full of items. offset and size tell us where to find
+diff --git a/mkfs.c b/mkfs.c
+index 2e99b95..04de93a 100644
+--- a/mkfs.c
++++ b/mkfs.c
+@@ -69,7 +69,7 @@ static u64 parse_size(char *s)
+ 	return atol(s) * mult;
+ }
+ 
+-static int make_root_dir(struct btrfs_root *root)
++static int make_root_dir(struct btrfs_root *root, int mixed)
+ {
+ 	struct btrfs_trans_handle *trans;
+ 	struct btrfs_key location;
+@@ -88,30 +88,47 @@ static int make_root_dir(struct btrfs_root *root)
+ 				     0, BTRFS_MKFS_SYSTEM_GROUP_SIZE);
+ 	BUG_ON(ret);
+ 
+-	ret = btrfs_alloc_chunk(trans, root->fs_info->extent_root,
+-				&chunk_start, &chunk_size,
+-				BTRFS_BLOCK_GROUP_METADATA);
+-	BUG_ON(ret);
+-	ret = btrfs_make_block_group(trans, root, 0,
+-				     BTRFS_BLOCK_GROUP_METADATA,
+-				     BTRFS_FIRST_CHUNK_TREE_OBJECTID,
+-				     chunk_start, chunk_size);
+-	BUG_ON(ret);
++	if (mixed) {
++		ret = btrfs_alloc_chunk(trans, root->fs_info->extent_root,
++					&chunk_start, &chunk_size,
++					BTRFS_BLOCK_GROUP_METADATA |
++					BTRFS_BLOCK_GROUP_DATA);
++		BUG_ON(ret);
++		ret = btrfs_make_block_group(trans, root, 0,
++					     BTRFS_BLOCK_GROUP_METADATA |
++					     BTRFS_BLOCK_GROUP_DATA,
++					     BTRFS_FIRST_CHUNK_TREE_OBJECTID,
++					     chunk_start, chunk_size);
++		BUG_ON(ret);
++		printf("Created a data/metadata chunk of size %llu\n", chunk_size);
++	} else {
++		ret = btrfs_alloc_chunk(trans, root->fs_info->extent_root,
++					&chunk_start, &chunk_size,
++					BTRFS_BLOCK_GROUP_METADATA);
++		BUG_ON(ret);
++		ret = btrfs_make_block_group(trans, root, 0,
++					     BTRFS_BLOCK_GROUP_METADATA,
++					     BTRFS_FIRST_CHUNK_TREE_OBJECTID,
++					     chunk_start, chunk_size);
++		BUG_ON(ret);
++	}
+ 
+ 	root->fs_info->system_allocs = 0;
+ 	btrfs_commit_transaction(trans, root);
+ 	trans = btrfs_start_transaction(root, 1);
+ 	BUG_ON(!trans);
+ 
+-	ret = btrfs_alloc_chunk(trans, root->fs_info->extent_root,
+-				&chunk_start, &chunk_size,
+-				BTRFS_BLOCK_GROUP_DATA);
+-	BUG_ON(ret);
+-	ret = btrfs_make_block_group(trans, root, 0,
+-				     BTRFS_BLOCK_GROUP_DATA,
+-				     BTRFS_FIRST_CHUNK_TREE_OBJECTID,
+-				     chunk_start, chunk_size);
+-	BUG_ON(ret);
++	if (!mixed) {
++		ret = btrfs_alloc_chunk(trans, root->fs_info->extent_root,
++					&chunk_start, &chunk_size,
++					BTRFS_BLOCK_GROUP_DATA);
++		BUG_ON(ret);
++		ret = btrfs_make_block_group(trans, root, 0,
++					     BTRFS_BLOCK_GROUP_DATA,
++					     BTRFS_FIRST_CHUNK_TREE_OBJECTID,
++					     chunk_start, chunk_size);
++		BUG_ON(ret);
++	}
+ 
+ 	ret = btrfs_make_root_dir(trans, root->fs_info->tree_root,
+ 			      BTRFS_ROOT_TREE_DIR_OBJECTID);
+@@ -200,7 +217,7 @@ static int create_one_raid_group(struct btrfs_trans_handle *trans,
+ 
+ static int create_raid_groups(struct btrfs_trans_handle *trans,
+ 			      struct btrfs_root *root, u64 data_profile,
+-			      u64 metadata_profile)
++			      u64 metadata_profile, int mixed)
+ {
+ 	u64 num_devices = btrfs_super_num_devices(&root->fs_info->super_copy);
+ 	u64 allowed;
+@@ -215,20 +232,24 @@ static int create_raid_groups(struct btrfs_trans_handle *trans,
+ 		allowed = BTRFS_BLOCK_GROUP_RAID0 | BTRFS_BLOCK_GROUP_RAID1;
+ 
+ 	if (allowed & metadata_profile) {
++		u64 meta_flags = BTRFS_BLOCK_GROUP_METADATA;
++
+ 		ret = create_one_raid_group(trans, root,
+ 					    BTRFS_BLOCK_GROUP_SYSTEM |
+ 					    (allowed & metadata_profile));
+ 		BUG_ON(ret);
+ 
+-		ret = create_one_raid_group(trans, root,
+-					    BTRFS_BLOCK_GROUP_METADATA |
++		if (mixed)
++			meta_flags |= BTRFS_BLOCK_GROUP_DATA;
++
++		ret = create_one_raid_group(trans, root, meta_flags |
+ 					    (allowed & metadata_profile));
+ 		BUG_ON(ret);
+ 
+ 		ret = recow_roots(trans, root);
+ 		BUG_ON(ret);
+ 	}
+-	if (num_devices > 1 && (allowed & data_profile)) {
++	if (!mixed && num_devices > 1 && (allowed & data_profile)) {
+ 		ret = create_one_raid_group(trans, root,
+ 					    BTRFS_BLOCK_GROUP_DATA |
+ 					    (allowed & data_profile));
+@@ -274,6 +295,7 @@ static void print_usage(void)
+ 	fprintf(stderr, "\t -l --leafsize size of btree leaves\n");
+ 	fprintf(stderr, "\t -L --label set a label\n");
+ 	fprintf(stderr, "\t -m --metadata metadata profile, values like data profile\n");
++	fprintf(stderr, "\t -M --mixed mix metadata and data together\n");
+ 	fprintf(stderr, "\t -n --nodesize size of btree nodes\n");
+ 	fprintf(stderr, "\t -s --sectorsize min block allocation\n");
+ 	fprintf(stderr, "%s\n", BTRFS_BUILD_VERSION);
+@@ -328,6 +350,7 @@ static struct option long_options[] = {
+ 	{ "leafsize", 1, NULL, 'l' },
+ 	{ "label", 1, NULL, 'L'},
+ 	{ "metadata", 1, NULL, 'm' },
++	{ "mixed", 0, NULL, 'M' },
+ 	{ "nodesize", 1, NULL, 'n' },
+ 	{ "sectorsize", 1, NULL, 's' },
+ 	{ "data", 1, NULL, 'd' },
+@@ -358,10 +381,13 @@ int main(int ac, char **av)
+ 	int first_fd;
+ 	int ret;
+ 	int i;
++	int mixed = 0;
++	int data_profile_opt = 0;
++	int metadata_profile_opt = 0;
+ 
+ 	while(1) {
+ 		int c;
+-		c = getopt_long(ac, av, "A:b:l:n:s:m:d:L:V", long_options,
++		c = getopt_long(ac, av, "A:b:l:n:s:m:d:L:VM", long_options,
+ 				&option_index);
+ 		if (c < 0)
+ 			break;
+@@ -371,6 +397,7 @@ int main(int ac, char **av)
+ 				break;
+ 			case 'd':
+ 				data_profile = parse_profile(optarg);
++				data_profile_opt = 1;
+ 				break;
+ 			case 'l':
+ 				leafsize = parse_size(optarg);
+@@ -380,6 +407,10 @@ int main(int ac, char **av)
+ 				break;
+ 			case 'm':
+ 				metadata_profile = parse_profile(optarg);
++				metadata_profile_opt = 1;
++				break;
++			case 'M':
++				mixed = 1;
+ 				break;
+ 			case 'n':
+ 				nodesize = parse_size(optarg);
+@@ -389,12 +420,10 @@ int main(int ac, char **av)
+ 				break;
+ 			case 'b':
+ 				block_count = parse_size(optarg);
+-				if (block_count < 256*1024*1024) {
+-					fprintf(stderr, "File system size "
+-						"%llu bytes is too small, "
+-						"256M is required at least\n",
+-						(unsigned long long)block_count);
+-					exit(1);
++				if (block_count <= 1024*1024*1024) {
++					printf("SMALL VOLUME: forcing mixed "
++					       "metadata/data groups\n");
++					mixed = 1;
+ 				}
+ 				zero_end = 0;
+ 				break;
+@@ -439,9 +468,22 @@ int main(int ac, char **av)
+ 	}
+ 	first_fd = fd;
+ 	first_file = file;
+-	ret = btrfs_prepare_device(fd, file, zero_end, &dev_block_count);
++	ret = btrfs_prepare_device(fd, file, zero_end, &dev_block_count,
++				   &mixed);
+ 	if (block_count == 0)
+ 		block_count = dev_block_count;
++	if (mixed) {
++		if (!metadata_profile_opt)
++			metadata_profile = 0;
++		if (!data_profile_opt)
++			data_profile = 0;
++
++		if (metadata_profile != data_profile) {
++			fprintf(stderr, "With mixed block groups data and metadata "
++				"profiles must be the same\n");
++			exit(1);
++		}
++	}
+ 
+ 	blocks[0] = BTRFS_SUPER_INFO_OFFSET;
+ 	for (i = 1; i < 7; i++) {
+@@ -459,7 +501,7 @@ int main(int ac, char **av)
+ 	root = open_ctree(file, 0, O_RDWR);
+ 	root->fs_info->alloc_start = alloc_start;
+ 
+-	ret = make_root_dir(root);
++	ret = make_root_dir(root, mixed);
+ 	if (ret) {
+ 		fprintf(stderr, "failed to setup the root directory\n");
+ 		exit(1);
+@@ -478,6 +520,8 @@ int main(int ac, char **av)
+ 
+ 	zero_end = 1;
+ 	while(ac-- > 0) {
++		int old_mixed = mixed;
++
+ 		file = av[optind++];
+ 		ret = check_mounted(file);
+ 		if (ret < 0) {
+@@ -503,8 +547,8 @@ int main(int ac, char **av)
+ 			continue;
+ 		}
+ 		ret = btrfs_prepare_device(fd, file, zero_end,
+-					   &dev_block_count);
+-
++					   &dev_block_count, &mixed);
++		mixed = old_mixed;
+ 		BUG_ON(ret);
+ 
+ 		ret = btrfs_add_to_fsid(trans, root, fd, file, dev_block_count,
+@@ -515,12 +559,20 @@ int main(int ac, char **av)
+ 
+ raid_groups:
+ 	ret = create_raid_groups(trans, root, data_profile,
+-				 metadata_profile);
++				 metadata_profile, mixed);
+ 	BUG_ON(ret);
+ 
+ 	ret = create_data_reloc_tree(trans, root);
+ 	BUG_ON(ret);
+ 
++	if (mixed) {
++		struct btrfs_super_block *super = &root->fs_info->super_copy;
++		u64 flags = btrfs_super_incompat_flags(super);
++
++		flags |= BTRFS_FEATURE_INCOMPAT_MIXED_GROUPS;
++		btrfs_set_super_incompat_flags(super, flags);
++	}
++
+ 	printf("fs created label %s on %s\n\tnodesize %u leafsize %u "
+ 	    "sectorsize %u size %s\n",
+ 	    label, first_file, nodesize, leafsize, sectorsize,
+diff --git a/utils.c b/utils.c
+index 35e17b8..ad980ae 100644
+--- a/utils.c
++++ b/utils.c
+@@ -512,7 +512,8 @@ int btrfs_add_to_fsid(struct btrfs_trans_handle *trans,
+ 	return 0;
+ }
+ 
+-int btrfs_prepare_device(int fd, char *file, int zero_end, u64 *block_count_ret)
++int btrfs_prepare_device(int fd, char *file, int zero_end, u64 *block_count_ret,
++			 int *mixed)
+ {
+ 	u64 block_count;
+ 	u64 bytenr;
+@@ -532,10 +533,9 @@ int btrfs_prepare_device(int fd, char *file, int zero_end, u64 *block_count_ret)
+ 	}
+ 	zero_end = 1;
+ 
+-	if (block_count < 256 * 1024 * 1024) {
+-		fprintf(stderr, "device %s is too small "
+-		        "(must be at least 256 MB)\n", file);
+-		exit(1);
++	if (block_count < 1024 * 1024 * 1024 && !(*mixed)) {
++		printf("SMALL VOLUME: forcing mixed metadata/data groups\n");
++		*mixed = 1;
+ 	}
+ 	ret = zero_dev_start(fd);
+ 	if (ret) {
+diff --git a/utils.h b/utils.h
+index 9dce5b0..a28d7f4 100644
+--- a/utils.h
++++ b/utils.h
+@@ -27,7 +27,7 @@ int make_btrfs(int fd, const char *device, const char *label,
+ int btrfs_make_root_dir(struct btrfs_trans_handle *trans,
+ 			struct btrfs_root *root, u64 objectid);
+ int btrfs_prepare_device(int fd, char *file, int zero_end,
+-			 u64 *block_count_ret);
++			 u64 *block_count_ret, int *mixed);
+ int btrfs_add_to_fsid(struct btrfs_trans_handle *trans,
+ 		      struct btrfs_root *root, int fd, char *path,
+ 		      u64 block_count, u32 io_width, u32 io_align,
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0008-Update-for-lzo-support.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0008-Update-for-lzo-support.patch
new file mode 100644
index 0000000..a1bd415
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0008-Update-for-lzo-support.patch
@@ -0,0 +1,203 @@
+Upstream-Status: Inappropriate [Backport]
+From 97e64f8cb21685b7359169f3047c0d082b0ff7e8 Mon Sep 17 00:00:00 2001
+From: Li Zefan <lizf@cn.fujitsu.com>
+Date: Thu, 18 Nov 2010 03:49:56 +0000
+Subject: [PATCH 08/15] Update for lzo support
+
+[Btrfs-Progs][V2] Update for lzo support
+
+- Add incompat flag, otherwise btrfs-progs will report error
+  when operating on btrfs filesystems mounted with lzo option.
+
+- Update man page.
+
+- Allow to turn on lzo compression for defrag operation:
+
+  # btrfs filesystem defragment -c[zlib, lzo] <file>
+
+  Note: "-c zlib" will fail, because that's how getopt() works
+  for optional arguments.
+
+Signed-off-by: Li Zefan <lizf@cn.fujitsu.com>
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ btrfs.c        |    2 +-
+ btrfs_cmds.c   |   24 ++++++++++++++++++++----
+ ctree.h        |   10 +++++++---
+ ioctl.h        |    9 ++++++++-
+ man/btrfs.8.in |   10 ++++++----
+ 5 files changed, 42 insertions(+), 13 deletions(-)
+
+diff --git a/btrfs.c b/btrfs.c
+index 46314cf..1b4f403 100644
+--- a/btrfs.c
++++ b/btrfs.c
+@@ -65,7 +65,7 @@ static struct Command commands[] = {
+ 		"List the recently modified files in a filesystem."
+ 	},
+ 	{ do_defrag, -1,
+-	  "filesystem defragment", "[-vcf] [-s start] [-l len] [-t size] <file>|<dir> [<file>|<dir>...]\n"
++	  "filesystem defragment", "[-vf] [-c[zlib,lzo]] [-s start] [-l len] [-t size] <file>|<dir> [<file>|<dir>...]\n"
+ 		"Defragment a file or a directory."
+ 	},
+ 	{ do_set_default_subvol, 2,
+diff --git a/btrfs_cmds.c b/btrfs_cmds.c
+index c21a007..26d4fcc 100644
+--- a/btrfs_cmds.c
++++ b/btrfs_cmds.c
+@@ -142,10 +142,21 @@ static u64 parse_size(char *s)
+ 	return atoll(s) * mult;
+ }
+ 
++static int parse_compress_type(char *s)
++{
++	if (strcmp(optarg, "zlib") == 0)
++		return BTRFS_COMPRESS_ZLIB;
++	else if (strcmp(optarg, "lzo") == 0)
++		return BTRFS_COMPRESS_LZO;
++	else {
++		fprintf(stderr, "Unknown compress type %s\n", s);
++		exit(1);
++	};
++}
++
+ int do_defrag(int ac, char **av)
+ {
+ 	int fd;
+-	int compress = 0;
+ 	int flush = 0;
+ 	u64 start = 0;
+ 	u64 len = (u64)-1;
+@@ -157,15 +168,18 @@ int do_defrag(int ac, char **av)
+ 	int fancy_ioctl = 0;
+ 	struct btrfs_ioctl_defrag_range_args range;
+ 	int e=0;
++	int compress_type = BTRFS_COMPRESS_NONE;
+ 
+ 	optind = 1;
+ 	while(1) {
+-		int c = getopt(ac, av, "vcfs:l:t:");
++		int c = getopt(ac, av, "vc::fs:l:t:");
+ 		if (c < 0)
+ 			break;
+ 		switch(c) {
+ 		case 'c':
+-			compress = 1;
++			compress_type = BTRFS_COMPRESS_ZLIB;
++			if (optarg)
++				compress_type = parse_compress_type(optarg);
+ 			fancy_ioctl = 1;
+ 			break;
+ 		case 'f':
+@@ -203,8 +217,10 @@ int do_defrag(int ac, char **av)
+ 	range.start = start;
+ 	range.len = len;
+ 	range.extent_thresh = thresh;
+-	if (compress)
++	if (compress_type) {
+ 		range.flags |= BTRFS_DEFRAG_RANGE_COMPRESS;
++		range.compress_type = compress_type;
++	}
+ 	if (flush)
+ 		range.flags |= BTRFS_DEFRAG_RANGE_START_IO;
+ 
+diff --git a/ctree.h b/ctree.h
+index ed83d02..61eb639 100644
+--- a/ctree.h
++++ b/ctree.h
+@@ -354,12 +354,14 @@ struct btrfs_super_block {
+ #define BTRFS_FEATURE_INCOMPAT_MIXED_BACKREF	(1ULL << 0)
+ #define BTRFS_FEATURE_INCOMPAT_DEFAULT_SUBVOL	(1ULL << 1)
+ #define BTRFS_FEATURE_INCOMPAT_MIXED_GROUPS	(1ULL << 2)
++#define BTRFS_FEATURE_INCOMPAT_COMPRESS_LZO	(1ULL << 3)
+ 
+ #define BTRFS_FEATURE_COMPAT_SUPP		0ULL
+ #define BTRFS_FEATURE_COMPAT_RO_SUPP		0ULL
+ #define BTRFS_FEATURE_INCOMPAT_SUPP			\
+ 	(BTRFS_FEATURE_INCOMPAT_MIXED_BACKREF |		\
+ 	 BTRFS_FEATURE_INCOMPAT_DEFAULT_SUBVOL |	\
++	 BTRFS_FEATURE_INCOMPAT_COMPRESS_LZO |		\
+ 	 BTRFS_FEATURE_INCOMPAT_MIXED_GROUPS)
+ 
+ /*
+@@ -505,9 +507,11 @@ struct btrfs_timespec {
+ } __attribute__ ((__packed__));
+ 
+ typedef enum {
+-	BTRFS_COMPRESS_NONE = 0,
+-	BTRFS_COMPRESS_ZLIB = 1,
+-	BTRFS_COMPRESS_LAST = 2,
++	BTRFS_COMPRESS_NONE  = 0,
++	BTRFS_COMPRESS_ZLIB  = 1,
++	BTRFS_COMPRESS_LZO   = 2,
++	BTRFS_COMPRESS_TYPES = 2,
++	BTRFS_COMPRESS_LAST  = 3,
+ } btrfs_compression_type;
+ 
+ /* we don't understand any encryption methods right now */
+diff --git a/ioctl.h b/ioctl.h
+index 776d7a9..bb7b9e0 100644
+--- a/ioctl.h
++++ b/ioctl.h
+@@ -116,8 +116,15 @@ struct btrfs_ioctl_defrag_range_args {
+ 	 */
+ 	__u32 extent_thresh;
+ 
++	/*
++	 * which compression method to use if turning on compression
++	 * for this defrag operation.  If unspecified, zlib will
++	 * be used
++	 */
++	__u32 compress_type;
++
+ 	/* spare for later */
+-	__u32 unused[5];
++	__u32 unused[4];
+ };
+ 
+ struct btrfs_ioctl_space_info {
+diff --git a/man/btrfs.8.in b/man/btrfs.8.in
+index cba2de1..1ffed13 100644
+--- a/man/btrfs.8.in
++++ b/man/btrfs.8.in
+@@ -15,12 +15,12 @@ btrfs \- control a btrfs filesystem
+ .PP
+ \fBbtrfs\fP \fBsubvolume set-default\fP\fI <id> <path>\fP
+ .PP
+-\fBbtrfs\fP \fBfilesystem defragment\fP\fI [-vcf] [-s start] [-l len] [-t size] <file>|<dir> [<file>|<dir>...]\fP
+-.PP
+ \fBbtrfs\fP \fBfilesystem sync\fP\fI <path> \fP
+ .PP
+ \fBbtrfs\fP \fBfilesystem resize\fP\fI [+/\-]<size>[gkm]|max <filesystem>\fP
+ .PP
++\fBbtrfs\fP \fBfilesystem defrag\fP\fI [options] <file>|<dir> [<file>|<dir>...]\fP
++.PP
+ \fBbtrfs\fP \fBdevice scan\fP\fI [<device> [<device>..]]\fP
+ .PP
+ \fBbtrfs\fP \fBdevice show\fP\fI <dev>|<label> [<dev>|<label>...]\fP
+@@ -30,7 +30,6 @@ btrfs \- control a btrfs filesystem
+ \fBbtrfs\fP \fBdevice add\fP\fI <dev> [<dev>..] <path> \fP
+ .PP
+ \fBbtrfs\fP \fBdevice delete\fP\fI <dev> [<dev>..] <path> \fP]
+-
+ .PP
+ \fBbtrfs\fP \fBhelp|\-\-help|\-h \fP\fI\fP
+ .PP
+@@ -104,10 +103,13 @@ Set the subvolume of the filesystem \fI<path>\fR which is mounted as
+ is returned by the \fBsubvolume list\fR command.
+ .TP
+ 
+-\fBfilesystem defragment\fP\fI [-vcf] [-s start] [-l len] [-t size] <file>|<dir> [<file>|<dir>...]\fR
++\fBfilesystem defragment\fP -c[zlib|lzo] [-l \fIlen\fR] [-s \fIstart\fR] [-t \fIsize\fR] -[vf] <\fIfile\fR>|<\fIdir\fR> [<\fIfile\fR>|<\fIdir\fR>...]
++
+ Defragment file data and/or directory metadata. To defragment all files in a
+ directory you have to specify each one on its own or use your shell wildcards.
+ 
++The start position and the number of bytes to deframention can be specified by \fIstart\fR and \fIlen\fR. Any extent bigger than \fIthresh\fR will be considered already defragged. Use 0 to take the kernel default, and use 1 to say eveery single extent must be rewritten. You can also turn on compression in defragment operations.
++
+ \fB-v\fP be verbose
+ 
+ \fB-c\fP compress file contents while defragmenting
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0009-Update-clean-up-btrfs-help-and-man-page-V2.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0009-Update-clean-up-btrfs-help-and-man-page-V2.patch
new file mode 100644
index 0000000..3b44d20
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0009-Update-clean-up-btrfs-help-and-man-page-V2.patch
@@ -0,0 +1,272 @@
+Upstream-Status: Inappropriate [Backport]
+From 6f81e1197015ab2dc41beec92c347919feb26967 Mon Sep 17 00:00:00 2001
+From: Goffredo Baroncelli <kreijack@libero.it>
+Date: Sun, 5 Dec 2010 17:47:45 +0000
+Subject: [PATCH 09/15] Update/clean up btrfs help and man page V2
+
+Hi all,
+
+enclose you can find a patch which improves the help of the btrfs commands,
+ updates the INSTALL file  and  the btrfs (command) man page.
+
+Regarding the help of the btrfs command:
+- moved the "subvolume set-default" command in the "subvolume" commands group
+- removed a wrong new line
+- small tweak on the basis of Andreas suggestion
+
+Regarding the btrfs command man page:
+- renaming the command "device balance" in "filesystem balance" (thanks to
+Andreas Phillipp to highlight that)
+- adding the entry "subvolume find-new"
+- document the switches of the command "filesystem defrag"
+- document the <devid> facility of the command "filesystem resize"
+- small tweak on the basis of Andreas suggestion
+
+Regarding the INSTALL file, which was very old, I removed the reference of the
+old btrfsctl utility and changed the examples using the btrfs command.
+I removed the old (and now wrong) statement about the inability to delete a
+subvolume/snapshot
+
+Chris, you can pull the patch from the branch "help_cleanup" of the following
+repository.
+
+http://cassiopea.homelinux.net/git/btrfs-progs-unstable.git
+
+(or you can browse the changes at
+http://cassiopea.homelinux.net/git/btrfs-progs-unstable.git/?p=btrfs-
+progs-unstable-all.git;a=summary)
+
+The patch is very simple: only updates the man page, the INSTALL file and
+ moves/updates some lines in the help of btrfs command. Comments are welcome.
+
+Regards
+G.Baroncelli
+
+ INSTALL        |   29 ++++++++++++++++++++---------
+ btrfs.c        |   24 ++++++++++++------------
+ man/btrfs.8.in |   45 +++++++++++++++++++++++++--------------------
+ 3 files changed, 57 insertions(+), 41 deletions(-)
+
+ all the block devices.
+ .TP
+@@ -138,21 +143,21 @@ can expand the partition before enlarging the filesystem
+and shrink the
+ partition after reducing the size of the filesystem.
+ .TP
+
+-\fBfilesystem show\fR [<uuid>|<label>]\fR
+-Show the btrfs filesystem with some additional info. If no UUID or label is
+-passed, \fBbtrfs\fR show info of all the btrfs filesystem.
++\fBfilesystem show\fR [<device>|<uuid>|<label>]\fR
++Show the btrfs filesystem with some additional info. If no argument is
++passed, \fBbtrfs\fR shows info of all the btrfs filesystems.
+ .TP
+
+-\fBdevice balance\fR \fI<path>\fR
++\fBfilesystem balance\fR \fI<path>\fR
+ Balance the chunks of the filesystem identified by \fI<path>\fR
+ across the devices.
+ .TP
+
+-\fBdevice add\fR\fI <dev> [<dev>..] <path>\fR
++\fBdevice add\fR\fI <device> [<device>...] <path>\fR
+ Add device(s) to the filesystem identified by \fI<path>\fR.
+ .TP
+
+-\fBdevice delete\fR\fI <dev> [<dev>..] <path>\fR
++\fBdevice delete\fR\fI <device> [<device>...] <path>\fR
+ Remove device(s) from a filesystem identified by \fI<path>\fR.
+ .PP
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ INSTALL        |   29 ++++++++++++++++++++---------
+ btrfs.c        |   24 ++++++++++++------------
+ man/btrfs.8.in |   29 +++++++++++++++++------------
+ 3 files changed, 49 insertions(+), 33 deletions(-)
+
+diff --git a/INSTALL b/INSTALL
+index 16b45a5..3840148 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -22,23 +22,32 @@ in the e2fsprogs sources, and is usually available as libuuid or
+ e2fsprogs-devel from various distros.
+ 
+ Building the utilities is just make ; make install.  The programs go
+-into /usr/local/bin.  The commands available are:
++into /usr/local/bin.  The mains commands available are:
+ 
+ mkfs.btrfs: create a filesystem
+ 
+-btrfsctl: control program to create snapshots and subvolumes:
+-
++btrfs: control program to create snapshots and subvolumes:
++	# mount a btrfs filesystem
+ 	mount /dev/sda2 /mnt
+-	btrfsctl -s new_subvol_name /mnt
+-	btrfsctl -s snapshot_of_default /mnt/default
+-	btrfsctl -s snapshot_of_new_subvol /mnt/new_subvol_name
+-	btrfsctl -s snapshot_of_a_snapshot /mnt/snapshot_of_new_subvol
++
++	# create a subvolume
++	btrfs subvolume create /mnt/new_subvol_name
++
++	# snapshot of a subvolume
++	btrfs subvolume snapshot /mnt/default /mnt/snapshot_of_default 
++	btrfs subvolume snapshot /mnt/snapshot_of_default \
++		/mnt/snapshot_of_a_snapshot
++
++	# list of the subvolumes
+ 	ls /mnt
+ 	default snapshot_of_a_snapshot snapshot_of_new_subvol
+ 	new_subvol_name snapshot_of_default
+ 
+-	Snapshots and subvolumes cannot be deleted right now, but you can
+-	rm -rf all the files and directories inside them.
++	# removal of a subvolume or a snapshot
++	btrfs subvolume delete /mn/snapshot_of_a_snapshot
++
++	# look a the btrfs man page for further information
++	man btrfs
+ 
+ btrfsck: do a limited check of the FS extent trees.</li>
+ 
+@@ -46,3 +55,5 @@ debug-tree: print all of the FS metadata in text form.  Example:
+ 
+ 	debug-tree /dev/sda2 >& big_output_file
+ 
++
++
+diff --git a/btrfs.c b/btrfs.c
+index 1b4f403..62140ef 100644
+--- a/btrfs.c
++++ b/btrfs.c
+@@ -61,6 +61,11 @@ static struct Command commands[] = {
+ 	{ do_subvol_list, 1, "subvolume list", "<path>\n"
+ 		"List the snapshot/subvolume of a filesystem."
+ 	},
++	{ do_set_default_subvol, 2,
++	  "subvolume set-default", "<id> <path>\n"
++		"Set the subvolume of the filesystem <path> which will be mounted\n"
++		"as default."
++	},
+ 	{ do_find_newer, 2, "subvolume find-new", "<path> <last_gen>\n"
+ 		"List the recently modified files in a filesystem."
+ 	},
+@@ -68,11 +73,6 @@ static struct Command commands[] = {
+ 	  "filesystem defragment", "[-vf] [-c[zlib,lzo]] [-s start] [-l len] [-t size] <file>|<dir> [<file>|<dir>...]\n"
+ 		"Defragment a file or a directory."
+ 	},
+-	{ do_set_default_subvol, 2,
+-	  "subvolume set-default", "<id> <path>\n"
+-		"Set the subvolume of the filesystem <path> which will be mounted\n"
+-		"as default."
+-	},
+ 	{ do_fssync, 1,
+ 	  "filesystem sync", "<path>\n"
+ 		"Force a sync on the filesystem <path>."
+@@ -83,29 +83,29 @@ static struct Command commands[] = {
+ 		"will occupe all available space on the device."
+ 	},
+ 	{ do_show_filesystem, 999,
+-	  "filesystem show", "[<uuid>|<label>]\n"
+-		"Show the info of a btrfs filesystem. If no <uuid> or <label>\n"
++	  "filesystem show", "[<device>|<uuid>|<label>]\n"
++		"Show the info of a btrfs filesystem. If no argument\n"
+ 		"is passed, info of all the btrfs filesystem are shown."
+ 	},
+ 	{ do_df_filesystem, 1,
+ 	  "filesystem df", "<path>\n"
+-		"Show space usage information for a mount point\n."
++		"Show space usage information for a mount point."
+ 	},
+ 	{ do_balance, 1,
+ 	  "filesystem balance", "<path>\n"
+ 		"Balance the chunks across the device."
+ 	},
+-	{ do_scan,
+-	  999, "device scan", "[<device> [<device>..]\n"
++	{ do_scan, 999, 
++	  "device scan", "[<device>...]\n"
+ 		"Scan all device for or the passed device for a btrfs\n"
+ 		"filesystem."
+ 	},
+ 	{ do_add_volume, -2,
+-	  "device add", "<dev> [<dev>..] <path>\n"
++	  "device add", "<device> [<device>...] <path>\n"
+ 		"Add a device to a filesystem."
+ 	},
+ 	{ do_remove_volume, -2,
+-	  "device delete", "<dev> [<dev>..] <path>\n"
++	  "device delete", "<device> [<device>...] <path>\n"
+ 		"Remove a device from a filesystem."
+ 	},
+ 	/* coming soon
+diff --git a/man/btrfs.8.in b/man/btrfs.8.in
+index 1ffed13..b9b8913 100644
+--- a/man/btrfs.8.in
++++ b/man/btrfs.8.in
+@@ -21,15 +21,19 @@ btrfs \- control a btrfs filesystem
+ .PP
+ \fBbtrfs\fP \fBfilesystem defrag\fP\fI [options] <file>|<dir> [<file>|<dir>...]\fP
+ .PP
+-\fBbtrfs\fP \fBdevice scan\fP\fI [<device> [<device>..]]\fP
++\fBbtrfs\fP \fBsubvolume find-new\fP\fI <subvolume> <last_gen>\fP
+ .PP
+-\fBbtrfs\fP \fBdevice show\fP\fI <dev>|<label> [<dev>|<label>...]\fP
++\fBbtrfs\fP \fBfilesystem balance\fP\fI <path> \fP
+ .PP
+-\fBbtrfs\fP \fBdevice balance\fP\fI <path> \fP
++\fBbtrfs\fP \fBfilesystem defragment\fP\fI <file>|<dir> [<file>|<dir>...]\fP
+ .PP
+-\fBbtrfs\fP \fBdevice add\fP\fI <dev> [<dev>..] <path> \fP
++\fBbtrfs\fP \fBdevice scan\fP\fI [<device>...]\fP
+ .PP
+-\fBbtrfs\fP \fBdevice delete\fP\fI <dev> [<dev>..] <path> \fP]
++\fBbtrfs\fP \fBdevice show\fP\fI [<device>|<uuid>|<label>]\fP
++.PP
++\fBbtrfs\fP \fBdevice add\fP\fI <device> [<device>...] <path> \fP
++.PP
++\fBbtrfs\fP \fBdevice delete\fP\fI <device> [<device>...] <path> \fP]
+ .PP
+ \fBbtrfs\fP \fBhelp|\-\-help|\-h \fP\fI\fP
+ .PP
+@@ -48,17 +52,16 @@ For example: it is possible to run
+ instead of
+ .I btrfs subvolume snapshot.
+ But
+-.I btrfs dev s
++.I btrfs file s
+ is not allowed, because
+-.I dev s
++.I file s
+ may be interpreted both as
+-.I device show
++.I filesystem show
+ and as
+-.I device scan.
++.I filesystem sync.
+ In this case
+ .I btrfs
+-returns an error.
+-
++returnsfilesystem sync
+ If a command is terminated by
+ .I --help
+ , the detailed help is showed. If the passed command matches more commands,
+@@ -125,9 +128,11 @@ The start position and the number of bytes to deframention can be specified by \
+ NOTE: defragmenting with kernels up to 2.6.37 will unlink COW-ed copies of data, don't 
+ use it if you use snapshots, have de-duplicated your data or made copies with 
+ \fBcp --reflink\fP.
++\fBsubvolume find-new\fR\fI <subvolume> <last_gen>\fR
++List the recently modified files in a subvolume, after \fI<last_gen>\fR ID.
+ .TP
+ 
+-\fBdevice scan\fR \fI[<device> [<device>..]]\fR
++\fBdevice scan\fR \fI[<device>...]\fR
+ Scan devices for a btrfs filesystem. If no devices are passed, \fBbtrfs\fR scans
+ all the block devices.
+ .TP
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0010-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0010-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch
new file mode 100644
index 0000000..17e515d
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0010-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch
@@ -0,0 +1,152 @@
+Upstream-Status: Inappropriate [Backport]
+From 36d8ab7002c5707538849a61eaa97cbac262bbc3 Mon Sep 17 00:00:00 2001
+From: Goffredo Baroncelli <kreijack@libero.it>
+Date: Sun, 5 Dec 2010 17:47:36 +0000
+Subject: [PATCH 10/15] Deprecate btrfsctl, btrfs-show, btrfs-vol
+
+Hi all,
+
+the patch below deprecates the following programs
+
+* btrfsctl
+* btrfs-vol
+* btrfs-show
+
+the reason is simple, these programs are superseded by the btrfs utility,
+both in terms of documentation, usability and bug. The goal is to avoid
+to duplicate codes and avoid update two programs.
+
+The patch adds a warning in the man pages, in the INSTALL file and in the
+programs.
+
+$ ./btrfsctl
+**
+** WARNING: this program is considered deprecated
+** Please consider to switch to the btrfs utility
+**
+no valid commands given
+usage: btrfsctl [ -d file|dir] [ -s snap_name subvol|tree ]
+                [-r size] [-A device] [-a] [-c] [-D dir .]
+        -d filename: defragments one file
+        -d directory: defragments the entire Btree
+        -s snap_name dir: creates a new snapshot of dir
+        -S subvol_name dir: creates a new subvolume
+        -r [+-]size[gkm]: resize the FS by size amount
+        -A device: scans the device file for a Btrfs filesystem
+        -a: scans all devices for Btrfs filesystems
+        -c: forces a single FS sync
+        -D: delete snapshot
+        -m [tree id] directory: set the default mounted subvolume to the [tree
+id] or the
+directory
+
+Below the patch, but it is possible to pull the changes from:
+
+ 	http://cassiopea.homelinux.net/git/btrfs-progs-unstable.git
+
+branch
+
+	btrfs-deprecated
+
+Comments are welcome.
+
+G.Baroncelli
+
+ INSTALL             |    5 +++++
+ btrfs-show.c        |    5 +++++
+ btrfs-vol.c         |    5 +++++
+ btrfsctl.c          |    5 +++++
+ man/btrfs-show.8.in |    3 +++
+ man/btrfsctl.8.in   |    3 +++
+ 6 files changed, 26 insertions(+), 0 deletions(-)
+
+the tool to create a new snapshot for the filesystem.
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ btrfs-show.c        |    5 +++++
+ btrfs-vol.c         |    5 +++++
+ btrfsctl.c          |    5 +++++
+ man/btrfs-show.8.in |    3 +++
+ man/btrfsctl.8.in   |    3 +++
+ 5 files changed, 21 insertions(+), 0 deletions(-)
+
+diff --git a/btrfs-show.c b/btrfs-show.c
+index c49626c..8210fd2 100644
+--- a/btrfs-show.c
++++ b/btrfs-show.c
+@@ -117,6 +117,11 @@ int main(int ac, char **av)
+ 	int ret;
+ 	int option_index = 0;
+ 
++	printf( "**\n"
++		"** WARNING: this program is considered deprecated\n"
++		"** Please consider to switch to the btrfs utility\n"
++		"**\n");
++
+ 	while(1) {
+ 		int c;
+ 		c = getopt_long(ac, av, "", long_options,
+diff --git a/btrfs-vol.c b/btrfs-vol.c
+index f573023..0efdbc1 100644
+--- a/btrfs-vol.c
++++ b/btrfs-vol.c
+@@ -78,6 +78,11 @@ int main(int ac, char **av)
+ 	struct btrfs_ioctl_vol_args args;
+ 	u64 dev_block_count = 0;
+ 
++	printf( "**\n"
++		"** WARNING: this program is considered deprecated\n"
++		"** Please consider to switch to the btrfs utility\n"
++		"**\n");
++
+ 	while(1) {
+ 		int c;
+ 		c = getopt_long(ac, av, "a:br:", long_options,
+diff --git a/btrfsctl.c b/btrfsctl.c
+index adfa519..73e20ec 100644
+--- a/btrfsctl.c
++++ b/btrfsctl.c
+@@ -107,6 +107,11 @@ int main(int ac, char **av)
+ 	char *fullpath;
+ 	u64 objectid = 0;
+ 
++	printf( "**\n"
++		"** WARNING: this program is considered deprecated\n"
++		"** Please consider to switch to the btrfs utility\n"
++		"**\n");
++	
+ 	if (ac == 2 && strcmp(av[1], "-a") == 0) {
+ 		fprintf(stderr, "Scanning for Btrfs filesystems\n");
+ 		btrfs_scan_one_dir("/dev", 1);
+diff --git a/man/btrfs-show.8.in b/man/btrfs-show.8.in
+index dd0b147..cb98b68 100644
+--- a/man/btrfs-show.8.in
++++ b/man/btrfs-show.8.in
+@@ -3,6 +3,9 @@
+ btrfs-show \- scan the /dev directory for btrfs partitions and print results.
+ .SH SYNOPSIS
+ .B btrfs-show
++.SH NOTE
++.B btrfs-show
++is deprecated. Please consider to switch to the btrfs utility.	
+ .SH DESCRIPTION
+ .B btrfs-show
+ is used to scan the /dev directory for btrfs partitions and display brief
+diff --git a/man/btrfsctl.8.in b/man/btrfsctl.8.in
+index c2d4488..8705fa6 100644
+--- a/man/btrfsctl.8.in
++++ b/man/btrfsctl.8.in
+@@ -10,6 +10,9 @@ btrfsctl \- control a btrfs filesystem
+ [ \fB \-A\fP\fI device\fP ]
+ [ \fB \-a\fP ]
+ [ \fB \-c\fP ]
++.SH NOTE
++B btrfsctl
++is deprecated. Please consider to switch to the btrfs utility.
+ .SH DESCRIPTION
+ .B btrfsctl
+ is used to control the filesystem and the files and directories stored. It is the tool to create a new snapshot for the filesystem.
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0011-Add-the-btrfs-filesystem-label-command.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0011-Add-the-btrfs-filesystem-label-command.patch
new file mode 100644
index 0000000..40ccb5b
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0011-Add-the-btrfs-filesystem-label-command.patch
@@ -0,0 +1,390 @@
+Upstream-Status: Inappropriate [Backport]
+From d1dc6a9cff7e2fe4f335ca783a4b033457b3e184 Mon Sep 17 00:00:00 2001
+From: Goffredo Baroncelli <kreijack@inwind.it>
+Date: Sun, 5 Dec 2010 17:46:44 +0000
+Subject: [PATCH 11/15] Add the "btrfs filesystem label" command
+
+Hi all,
+
+this patch adds the command "btrfs filesystem label" to change (or show) the
+label of a filesystem.
+This patch is a subset of the one written previously by Morey Roof. I
+included the user space part only. So it is possible only to change/show a
+label of a *single device* and *unounted* filesystem.
+
+The reason of excluding the kernel space part, is to simplify the patch in
+order to speed the check and then the merging of the patch itself. In fact I
+have to point out that in the past there was almost three attempts to propose
+this patch, without success neither complaints.
+
+Chris, let me know how you want to proceed. I know that you are very busy,
+and you prefer to work to stabilize btrfs instead adding new feature. But I
+think that changing a label is a *essential* feature for a filesystem
+managing tool. Think about a mount by LABEL.
+
+To show a label
+
+$ btrfs filesystem label <device>
+
+To set a label
+
+$ btrfs filesystem label <device> <newlabel>
+
+Please guys, give a look to the source.
+Comments are welcome.
+
+You can pull the source from the branch "label" of the repository
+http://cassiopea.homelinux.net/git/btrfs-progs-unstable.git
+
+Regards
+G.Baroncelli
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ Makefile       |    2 +-
+ btrfs.c        |    5 --
+ btrfs_cmds.c   |   16 +++++++
+ btrfs_cmds.h   |    1 +
+ btrfslabel.c   |  121 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ btrfslabel.h   |    5 ++
+ man/btrfs.8.in |   19 +++++++++
+ utils.c        |   57 ++++++++++++++++++++++++++
+ utils.h        |    2 +
+ 9 files changed, 222 insertions(+), 6 deletions(-)
+ create mode 100644 btrfslabel.c
+ create mode 100644 btrfslabel.h
+
+diff --git a/Makefile b/Makefile
+index d65f6a2..4b95d2f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,7 +4,7 @@ CFLAGS = -g -Werror -Os
+ objects = ctree.o disk-io.o radix-tree.o extent-tree.o print-tree.o \
+ 	  root-tree.o dir-item.o file-item.o inode-item.o \
+ 	  inode-map.o crc32c.o rbtree.o extent-cache.o extent_io.o \
+-	  volumes.o utils.o btrfs-list.o
++	  volumes.o utils.o btrfs-list.o btrfslabel.o
+ 
+ #
+ CHECKFLAGS=-D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ -Wbitwise \
+diff --git a/btrfs.c b/btrfs.c
+index 62140ef..4cd4210 100644
+--- a/btrfs.c
++++ b/btrfs.c
+@@ -108,11 +108,6 @@ static struct Command commands[] = {
+ 	  "device delete", "<device> [<device>...] <path>\n"
+ 		"Remove a device from a filesystem."
+ 	},
+-	/* coming soon
+-	{ 2, "filesystem label", "<label> <path>\n"
+-		"Set the label of a filesystem"
+-	}
+-	*/
+ 	{ 0, 0 , 0 }
+ };
+ 
+diff --git a/btrfs_cmds.c b/btrfs_cmds.c
+index 26d4fcc..6de73f4 100644
+--- a/btrfs_cmds.c
++++ b/btrfs_cmds.c
+@@ -40,6 +40,7 @@
+ #include "volumes.h"
+ 
+ #include "btrfs_cmds.h"
++#include "btrfslabel.h"
+ 
+ #ifdef __CHECKER__
+ #define BLKGETSIZE64 0
+@@ -874,6 +875,21 @@ int do_set_default_subvol(int nargs, char **argv)
+ 	return 0;
+ }
+ 
++int do_change_label(int nargs, char **argv)
++{
++	/* check the number of argument */
++	if ( nargs > 3 ){
++		fprintf(stderr, "ERROR: '%s' requires maximum 2 args\n",
++			argv[0]);
++		return -2;
++	}else if (nargs == 2){
++		return get_label(argv[1]);
++	} else {	/* nargs == 0 */
++		return set_label(argv[1], argv[2]);
++	}
++}
++
++
+ int do_df_filesystem(int nargs, char **argv)
+ {
+ 	struct btrfs_ioctl_space_args *sargs;
+diff --git a/btrfs_cmds.h b/btrfs_cmds.h
+index 7bde191..ab722d4 100644
+--- a/btrfs_cmds.h
++++ b/btrfs_cmds.h
+@@ -32,3 +32,4 @@ int list_subvols(int fd);
+ int do_df_filesystem(int nargs, char **argv);
+ int find_updated_files(int fd, u64 root_id, u64 oldest_gen);
+ int do_find_newer(int argc, char **argv);
++int do_change_label(int argc, char **argv);
+diff --git a/btrfslabel.c b/btrfslabel.c
+new file mode 100644
+index 0000000..c9f4684
+--- /dev/null
++++ b/btrfslabel.c
+@@ -0,0 +1,121 @@
++/*
++ * Copyright (C) 2008 Morey Roof.   All rights reserved.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public
++ * License v2 as published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public
++ * License along with this program; if not, write to the
++ * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
++ * Boston, MA 021110-1307, USA.
++ */
++
++#define _GNU_SOURCE
++
++#ifndef __CHECKER__
++#include <sys/ioctl.h>
++#include <sys/mount.h>
++#include "ioctl.h"
++#endif /* __CHECKER__ */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <dirent.h>
++#include <fcntl.h>
++#include <unistd.h>
++#include <linux/fs.h>
++#include <linux/limits.h>
++#include <ctype.h>
++#include "kerncompat.h"
++#include "ctree.h"
++#include "utils.h"
++#include "version.h"
++#include "disk-io.h"
++#include "transaction.h"
++
++#define MOUNTED                        1
++#define UNMOUNTED                      2
++#define GET_LABEL                      3
++#define SET_LABEL                      4
++
++static void change_label_unmounted(char *dev, char *nLabel)
++{
++       struct btrfs_root *root;
++       struct btrfs_trans_handle *trans;
++
++       /* Open the super_block at the default location
++        * and as read-write.
++        */
++       root = open_ctree(dev, 0, 1);
++
++       trans = btrfs_start_transaction(root, 1);
++       strncpy(root->fs_info->super_copy.label, nLabel, BTRFS_LABEL_SIZE);
++       btrfs_commit_transaction(trans, root);
++
++       /* Now we close it since we are done. */
++       close_ctree(root);
++}
++
++static void get_label_unmounted(char *dev)
++{
++       struct btrfs_root *root;
++
++       /* Open the super_block at the default location
++        * and as read-only.
++        */
++       root = open_ctree(dev, 0, 0);
++
++       fprintf(stdout, "%s\n", root->fs_info->super_copy.label);
++
++       /* Now we close it since we are done. */
++       close_ctree(root);
++}
++
++int get_label(char *btrfs_dev)
++{
++
++	int ret;
++	ret = check_mounted(btrfs_dev);
++	if (ret < 0)
++	{
++	       fprintf(stderr, "FATAL: error checking %s mount status\n", btrfs_dev);
++	       return -1;
++	}
++
++	if(ret != 0)
++	{
++	       fprintf(stderr, "FATAL: the filesystem has to be unmounted\n");
++	       return -2;
++	}
++	get_label_unmounted(btrfs_dev);
++	return 0;
++}
++
++
++int set_label(char *btrfs_dev, char *nLabel)
++{
++
++	int ret;
++	ret = check_mounted(btrfs_dev);
++	if (ret < 0)
++	{
++	       fprintf(stderr, "FATAL: error checking %s mount status\n", btrfs_dev);
++	       return -1;
++	}
++
++	if(ret != 0)
++	{
++	       fprintf(stderr, "FATAL: the filesystem has to be unmounted\n");
++	       return -2;
++	}
++	change_label_unmounted(btrfs_dev, nLabel);
++	return 0;
++}
+diff --git a/btrfslabel.h b/btrfslabel.h
+new file mode 100644
+index 0000000..abf43ad
+--- /dev/null
++++ b/btrfslabel.h
+@@ -0,0 +1,5 @@
++/* btrflabel.h */
++
++
++int get_label(char *btrfs_dev);
++int set_label(char *btrfs_dev, char *nLabel);
+\ No newline at end of file
+diff --git a/man/btrfs.8.in b/man/btrfs.8.in
+index b9b8913..6f92f91 100644
+--- a/man/btrfs.8.in
++++ b/man/btrfs.8.in
+@@ -19,6 +19,8 @@ btrfs \- control a btrfs filesystem
+ .PP
+ \fBbtrfs\fP \fBfilesystem resize\fP\fI [+/\-]<size>[gkm]|max <filesystem>\fP
+ .PP
++\fBbtrfs\fP \fBfilesystem label\fP\fI <dev> [newlabel]\fP
++.PP
+ \fBbtrfs\fP \fBfilesystem defrag\fP\fI [options] <file>|<dir> [<file>|<dir>...]\fP
+ .PP
+ \fBbtrfs\fP \fBsubvolume find-new\fP\fI <subvolume> <last_gen>\fP
+@@ -164,6 +166,23 @@ can expand the partition before enlarging the filesystem and shrink the
+ partition after reducing the size of the filesystem.
+ .TP
+ 
++\fBbtrfs\fP \fBfilesystem label\fP\fI <dev> [newlabel]\fP
++Show or update the label of a filesystem. \fI<dev>\fR is used to identify the
++filesystem. 
++If a \fInewlabel\fR optional argument is passed, the label is changed. The
++following costraints exist for a label:
++.IP
++- the maximum allowable lenght shall be less or equal than 256 chars
++.IP
++- the label shall not  contain the '/' or '\\' characters.
++
++NOTE: Currently there are the following limitations:
++.IP
++- the filesystem has to be unmounted
++.IP
++- the filesystem should not have more than one device.
++.TP
++
+ \fBfilesystem show\fR [<uuid>|<label>]\fR
+ Show the btrfs filesystem with some additional info. If no UUID or label is
+ passed, \fBbtrfs\fR show info of all the btrfs filesystem.
+diff --git a/utils.c b/utils.c
+index ad980ae..13373c9 100644
+--- a/utils.c
++++ b/utils.c
+@@ -812,6 +812,39 @@ out_mntloop_err:
+ 	return ret;
+ }
+ 
++/* Gets the mount point of btrfs filesystem that is using the specified device.
++ * Returns 0 is everything is good, <0 if we have an error.
++ * TODO: Fix this fucntion and check_mounted to work with multiple drive BTRFS
++ * setups.
++ */
++int get_mountpt(char *dev, char *mntpt, size_t size)
++{
++       struct mntent *mnt;
++       FILE *f;
++       int ret = 0;
++
++       f = setmntent("/proc/mounts", "r");
++       if (f == NULL)
++               return -errno;
++
++       while ((mnt = getmntent(f)) != NULL )
++       {
++               if (strcmp(dev, mnt->mnt_fsname) == 0)
++               {
++                       strncpy(mntpt, mnt->mnt_dir, size);
++                       break;
++               }
++       }
++
++       if (mnt == NULL)
++       {
++               /* We didn't find an entry so lets report an error */
++               ret = -1;
++       }
++
++       return ret;
++}
++
+ struct pending_dir {
+ 	struct list_head list;
+ 	char name[256];
+@@ -1002,3 +1035,27 @@ char *pretty_sizes(u64 size)
+ 	return pretty;
+ }
+ 
++/*
++ * Checks to make sure that the label matches our requirements.
++ * Returns:
++       0    if everything is safe and usable
++      -1    if the label is too long
++      -2    if the label contains an invalid character
++ */
++int check_label(char *input)
++{
++       int i;
++       int len = strlen(input);
++
++       if (len > BTRFS_LABEL_SIZE) {
++               return -1;
++       }
++
++       for (i = 0; i < len; i++) {
++               if (input[i] == '/' || input[i] == '\\') {
++                       return -2;
++               }
++       }
++
++       return 0;
++}
+diff --git a/utils.h b/utils.h
+index a28d7f4..c3004ae 100644
+--- a/utils.h
++++ b/utils.h
+@@ -40,4 +40,6 @@ int check_mounted(const char *devicename);
+ int btrfs_device_already_in_root(struct btrfs_root *root, int fd,
+ 				 int super_offset);
+ char *pretty_sizes(u64 size);
++int check_label(char *input);
++int get_mountpt(char *dev, char *mntpt, size_t size);
+ #endif
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0012-Btrfs-progs-Update-man-page-for-mixed-data-metadata-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0012-Btrfs-progs-Update-man-page-for-mixed-data-metadata-.patch
new file mode 100644
index 0000000..2f3746f
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0012-Btrfs-progs-Update-man-page-for-mixed-data-metadata-.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Inappropriate [Backport]
+From 4c6ae809c50d44d4530a211b95b004002b3ba45f Mon Sep 17 00:00:00 2001
+From: Mitch Harder <mitch.harder@sabayonlinux.org>
+Date: Mon, 15 Nov 2010 16:32:12 +0000
+Subject: [PATCH 12/15] Btrfs-progs: Update man page for mixed data+metadata option.
+
+Update the mkfs.btrfs man page for the -M option to mix data and
+metadata chunks.
+
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ man/mkfs.btrfs.8.in |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/man/mkfs.btrfs.8.in b/man/mkfs.btrfs.8.in
+index 1e14c6c..432db1b 100644
+--- a/man/mkfs.btrfs.8.in
++++ b/man/mkfs.btrfs.8.in
+@@ -9,6 +9,7 @@ mkfs.btrfs \- create an btrfs filesystem
+ [ \fB \-l\fP\fI leafsize\fP ]
+ [ \fB \-L\fP\fI label\fP ]
+ [ \fB \-m\fP\fI metadata profile\fP ]
++[ \fB \-M\fP\fI mixed data+metadata\fP ]
+ [ \fB \-n\fP\fI nodesize\fP ]
+ [ \fB \-s\fP\fI sectorsize\fP ]
+ [ \fB \-h\fP ]
+@@ -45,6 +46,12 @@ Specify a label for the filesystem.
+ Specify how metadata must be spanned across the devices specified. Valid
+ values are raid0, raid1, raid10 or single.
+ .TP
++\fB\-M\fR, \fB\-\-mixed\fR
++Mix data and metadata chunks together for more efficient space 
++utilization.  This feature incurs a performance penalty in
++larger filesystems.  It is recommended for use with filesystems
++of 1 GiB or smaller.
++.TP
+ \fB\-n\fR, \fB\-\-nodesize \fIsize\fR
+ Specify the nodesize. By default the value is set to the pagesize.
+ .TP
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0013-btrfs-progs-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0013-btrfs-progs-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch
new file mode 100644
index 0000000..215106e
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0013-btrfs-progs-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch
@@ -0,0 +1,1108 @@
+Upstream-Status: Inappropriate [Backport]
+From e3736c698e8b490bea1375576b718a2de6e89603 Mon Sep 17 00:00:00 2001
+From: Donggeun Kim <dg77.kim@samsung.com>
+Date: Thu, 8 Jul 2010 09:17:59 +0000
+Subject: [PATCH 13/15] btrfs-progs: Add new feature to mkfs.btrfs to make file system image file from source directory
+
+Changes from V1 to V2:
+- support extended attributes
+- move btrfs_alloc_data_chunk function to volumes.c
+- fix an execution error when additional useless parameters are specified
+- fix traverse_directory function so that the insertion functions for the common items are invoked in a single point
+
+The extended attributes is implemented through llistxattr and getxattr function calls.
+
+Thanks
+
+Signed-off-by: Donggeun Kim <dg77.kim@samsung.com>
+Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ mkfs.c    |  864 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
+ volumes.c |  104 ++++++++
+ volumes.h |    3 +
+ 3 files changed, 947 insertions(+), 24 deletions(-)
+
+diff --git a/mkfs.c b/mkfs.c
+index 04de93a..57c88f9 100644
+--- a/mkfs.c
++++ b/mkfs.c
+@@ -29,12 +29,14 @@
+ #include <stdlib.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/dir.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <getopt.h>
+ #include <uuid/uuid.h>
+ #include <linux/fs.h>
+ #include <ctype.h>
++#include <attr/xattr.h>
+ #include "kerncompat.h"
+ #include "ctree.h"
+ #include "disk-io.h"
+@@ -43,6 +45,15 @@
+ #include "utils.h"
+ #include "version.h"
+ 
++static u64 index_cnt = 2;
++
++struct directory_name_entry {
++	char *dir_name;
++	char *path;
++	ino_t inum;
++	struct list_head list;
++};
++
+ static u64 parse_size(char *s)
+ {
+ 	int len = strlen(s);
+@@ -298,6 +309,7 @@ static void print_usage(void)
+ 	fprintf(stderr, "\t -M --mixed mix metadata and data together\n");
+ 	fprintf(stderr, "\t -n --nodesize size of btree nodes\n");
+ 	fprintf(stderr, "\t -s --sectorsize min block allocation\n");
++	fprintf(stderr, "\t -r --rootdir the source directory\n");
+ 	fprintf(stderr, "%s\n", BTRFS_BUILD_VERSION);
+ 	exit(1);
+ }
+@@ -355,9 +367,768 @@ static struct option long_options[] = {
+ 	{ "sectorsize", 1, NULL, 's' },
+ 	{ "data", 1, NULL, 'd' },
+ 	{ "version", 0, NULL, 'V' },
++	{ "rootdir", 1, NULL, 'r' },
+ 	{ 0, 0, 0, 0}
+ };
+ 
++static int add_directory_items(struct btrfs_trans_handle *trans,
++			       struct btrfs_root *root, u64 objectid,
++			       ino_t parent_inum, const char *name,
++			       struct stat *st, int *dir_index_cnt)
++{
++	int ret;
++	int name_len;
++	struct btrfs_key location;
++	u8 filetype = 0;
++
++	name_len = strlen(name);
++
++	location.objectid = objectid;
++	location.offset = 0;
++	btrfs_set_key_type(&location, BTRFS_INODE_ITEM_KEY);
++
++	if (S_ISDIR(st->st_mode))
++		filetype = BTRFS_FT_DIR;
++	if (S_ISREG(st->st_mode))
++		filetype = BTRFS_FT_REG_FILE;
++	if (S_ISLNK(st->st_mode))
++		filetype = BTRFS_FT_SYMLINK;
++
++	ret = btrfs_insert_dir_item(trans, root, name, name_len,
++				    parent_inum, &location,
++				    filetype, index_cnt);
++
++	*dir_index_cnt = index_cnt;
++	index_cnt++;
++
++	return ret;
++}
++
++static int fill_inode_item(struct btrfs_trans_handle *trans,
++			   struct btrfs_root *root,
++			   struct btrfs_inode_item *dst, struct stat *src)
++{
++	u64 blocks = 0;
++	u64 sectorsize = root->sectorsize;
++
++	btrfs_set_stack_inode_generation(dst, trans->transid);
++	btrfs_set_stack_inode_size(dst, src->st_size);
++	btrfs_set_stack_inode_nbytes(dst, 0);
++	btrfs_set_stack_inode_block_group(dst, 0);
++	btrfs_set_stack_inode_nlink(dst, src->st_nlink);
++	btrfs_set_stack_inode_uid(dst, src->st_uid);
++	btrfs_set_stack_inode_gid(dst, src->st_gid);
++	btrfs_set_stack_inode_mode(dst, src->st_mode);
++	btrfs_set_stack_inode_rdev(dst, 0);
++	btrfs_set_stack_inode_flags(dst, 0);
++	btrfs_set_stack_timespec_sec(&dst->atime, src->st_atime);
++	btrfs_set_stack_timespec_nsec(&dst->atime, 0);
++	btrfs_set_stack_timespec_sec(&dst->ctime, src->st_ctime);
++	btrfs_set_stack_timespec_nsec(&dst->ctime, 0);
++	btrfs_set_stack_timespec_sec(&dst->mtime, src->st_mtime);
++	btrfs_set_stack_timespec_nsec(&dst->mtime, 0);
++	btrfs_set_stack_timespec_sec(&dst->otime, 0);
++	btrfs_set_stack_timespec_nsec(&dst->otime, 0);
++
++	if (S_ISDIR(src->st_mode)) {
++		btrfs_set_stack_inode_size(dst, 0);
++		btrfs_set_stack_inode_nlink(dst, 1);
++	}
++	if (S_ISREG(src->st_mode)) {
++		btrfs_set_stack_inode_size(dst, (u64)src->st_size);
++		if (src->st_size <= BTRFS_MAX_INLINE_DATA_SIZE(root))
++			btrfs_set_stack_inode_nbytes(dst, src->st_size);
++		else {
++			blocks = src->st_size / sectorsize;
++			if (src->st_size % sectorsize)
++				blocks += 1;
++			blocks *= sectorsize;
++			btrfs_set_stack_inode_nbytes(dst, blocks);
++		}
++	}
++	if (S_ISLNK(src->st_mode))
++		btrfs_set_stack_inode_nbytes(dst, src->st_size + 1);
++
++	return 0;
++}
++
++static int directory_select(const struct direct *entry)
++{
++	if ((strncmp(entry->d_name, ".", entry->d_reclen) == 0) ||
++		(strncmp(entry->d_name, "..", entry->d_reclen) == 0))
++		return 0;
++	else
++		return 1;
++}
++
++static u64 calculate_dir_inode_size(char *dirname)
++{
++	int count, i;
++	struct direct **files, *cur_file;
++	u64 dir_inode_size = 0;
++
++	count = scandir(dirname, &files, directory_select, NULL);
++
++	for (i = 0; i < count; i++) {
++		cur_file = files[i];
++		dir_inode_size += strlen(cur_file->d_name);
++	}
++
++	dir_inode_size *= 2;
++	return dir_inode_size;
++}
++
++static int add_inode_items(struct btrfs_trans_handle *trans,
++			   struct btrfs_root *root,
++			   struct stat *st, char *name,
++			   u64 self_objectid, ino_t parent_inum,
++			   int dir_index_cnt, struct btrfs_inode_item *inode_ret)
++{
++	int ret;
++	struct btrfs_key inode_key;
++	struct btrfs_inode_item btrfs_inode;
++	u64 objectid;
++	u64 inode_size = 0;
++	int name_len;
++
++	name_len = strlen(name);
++	fill_inode_item(trans, root, &btrfs_inode, st);
++	objectid = self_objectid;
++
++	if (S_ISDIR(st->st_mode)) {
++		inode_size = calculate_dir_inode_size(name);
++		btrfs_set_stack_inode_size(&btrfs_inode, inode_size);
++	}
++
++	inode_key.objectid = objectid;
++	inode_key.offset = 0;
++	btrfs_set_key_type(&inode_key, BTRFS_INODE_ITEM_KEY);
++
++	ret = btrfs_insert_inode(trans, root, objectid, &btrfs_inode);
++	if (ret)
++		goto fail;
++
++	ret = btrfs_insert_inode_ref(trans, root, name, name_len,
++				     objectid, parent_inum, dir_index_cnt);
++	if (ret)
++		goto fail;
++
++	*inode_ret = btrfs_inode;
++fail:
++	return ret;
++}
++
++static int add_xattr_item(struct btrfs_trans_handle *trans,
++			  struct btrfs_root *root, u64 objectid,
++			  const char *file_name)
++{
++	int ret;
++	int cur_name_len;
++	char xattr_list[XATTR_LIST_MAX];
++	char *cur_name;
++	char cur_value[XATTR_SIZE_MAX];
++	char delimiter = '\0';
++	char *next_location = xattr_list;
++
++	ret = llistxattr(file_name, xattr_list, XATTR_LIST_MAX);
++	if (ret < 0) {
++		fprintf(stderr, "get a list of xattr failed for %s\n",
++			file_name);
++		return ret;
++	}
++	if (ret == 0)
++		return ret;
++
++	cur_name = strtok(xattr_list, &delimiter);
++	while (cur_name != NULL) {
++		cur_name_len = strlen(cur_name);
++		next_location += cur_name_len + 1;
++
++		ret = getxattr(file_name, cur_name, cur_value, XATTR_SIZE_MAX);
++		if (ret < 0) {
++			fprintf(stderr, "get a xattr value failed for %s\n",
++				cur_name);
++		}
++
++		ret = btrfs_insert_xattr_item(trans, root, cur_name,
++					      cur_name_len, cur_value,
++					      ret, objectid);
++		if (ret) {
++			fprintf(stderr, "insert a xattr item failed for %s\n",
++				file_name);
++		}
++
++		cur_name = strtok(next_location, &delimiter);
++	}
++
++	return ret;
++}
++
++static int custom_alloc_extent(struct btrfs_root *root, u64 num_bytes,
++			       u64 hint_byte, struct btrfs_key *ins)
++{
++	u64 start;
++	u64 end;
++	u64 last = hint_byte;
++	int ret;
++	int wrapped = 0;
++	struct btrfs_block_group_cache *cache;
++
++	while (1) {
++		ret = find_first_extent_bit(&root->fs_info->free_space_cache,
++					    last, &start, &end, EXTENT_DIRTY);
++		if (ret) {
++			if (wrapped++ == 0) {
++				last = 0;
++				continue;
++			} else {
++				goto fail;
++			}
++		}
++
++		start = max(last, start);
++		last = end + 1;
++		if (last - start < num_bytes)
++			continue;
++
++		last = start + num_bytes;
++		if (test_range_bit(&root->fs_info->pinned_extents,
++				   start, last - 1, EXTENT_DIRTY, 0))
++			continue;
++
++		cache = btrfs_lookup_block_group(root->fs_info, start);
++		BUG_ON(!cache);
++		if (cache->flags & BTRFS_BLOCK_GROUP_SYSTEM ||
++		    last > cache->key.objectid + cache->key.offset) {
++			last = cache->key.objectid + cache->key.offset;
++			continue;
++		}
++
++		if (cache->flags & (BTRFS_BLOCK_GROUP_SYSTEM |
++			    BTRFS_BLOCK_GROUP_METADATA)) {
++			last = cache->key.objectid + cache->key.offset;
++			continue;
++		}
++
++		clear_extent_dirty(&root->fs_info->free_space_cache,
++				   start, start + num_bytes - 1, 0);
++
++		ins->objectid = start;
++		ins->offset = num_bytes;
++		ins->type = BTRFS_EXTENT_ITEM_KEY;
++		return 0;
++	}
++fail:
++	fprintf(stderr, "not enough free space\n");
++	return -ENOSPC;
++}
++
++static int record_file_extent(struct btrfs_trans_handle *trans,
++			      struct btrfs_root *root, u64 objectid,
++			      struct btrfs_inode_item *inode,
++			      u64 file_pos, u64 disk_bytenr,
++			      u64 num_bytes)
++{
++	int ret;
++	struct btrfs_fs_info *info = root->fs_info;
++	struct btrfs_root *extent_root = info->extent_root;
++	struct extent_buffer *leaf;
++	struct btrfs_file_extent_item *fi;
++	struct btrfs_key ins_key;
++	struct btrfs_path path;
++	struct btrfs_extent_item *ei;
++
++	btrfs_init_path(&path);
++
++	ins_key.objectid = objectid;
++	ins_key.offset = 0;
++	btrfs_set_key_type(&ins_key, BTRFS_EXTENT_DATA_KEY);
++	ret = btrfs_insert_empty_item(trans, root, &path, &ins_key,
++				      sizeof(*fi));
++	if (ret)
++		goto fail;
++	leaf = path.nodes[0];
++	fi = btrfs_item_ptr(leaf, path.slots[0],
++			    struct btrfs_file_extent_item);
++	btrfs_set_file_extent_generation(leaf, fi, trans->transid);
++	btrfs_set_file_extent_type(leaf, fi, BTRFS_FILE_EXTENT_REG);
++	btrfs_set_file_extent_disk_bytenr(leaf, fi, disk_bytenr);
++	btrfs_set_file_extent_disk_num_bytes(leaf, fi, num_bytes);
++	btrfs_set_file_extent_offset(leaf, fi, 0);
++	btrfs_set_file_extent_num_bytes(leaf, fi, num_bytes);
++	btrfs_set_file_extent_ram_bytes(leaf, fi, num_bytes);
++	btrfs_set_file_extent_compression(leaf, fi, 0);
++	btrfs_set_file_extent_encryption(leaf, fi, 0);
++	btrfs_set_file_extent_other_encoding(leaf, fi, 0);
++	btrfs_mark_buffer_dirty(leaf);
++
++	btrfs_release_path(root, &path);
++
++	ins_key.objectid = disk_bytenr;
++	ins_key.offset = num_bytes;
++	ins_key.type = BTRFS_EXTENT_ITEM_KEY;
++
++	ret = btrfs_insert_empty_item(trans, extent_root, &path,
++				&ins_key, sizeof(*ei));
++	if (ret == 0) {
++		leaf = path.nodes[0];
++		ei = btrfs_item_ptr(leaf, path.slots[0],
++				    struct btrfs_extent_item);
++
++		btrfs_set_extent_refs(leaf, ei, 0);
++		btrfs_set_extent_generation(leaf, ei, trans->transid);
++		btrfs_set_extent_flags(leaf, ei, BTRFS_EXTENT_FLAG_DATA);
++
++		btrfs_mark_buffer_dirty(leaf);
++		ret = btrfs_update_block_group(trans, root, disk_bytenr,
++					       num_bytes, 1, 0);
++		if (ret)
++			goto fail;
++	} else if (ret != -EEXIST) {
++		goto fail;
++	}
++
++	ret = btrfs_inc_extent_ref(trans, root, disk_bytenr, num_bytes, 0,
++				   root->root_key.objectid,
++				   objectid, 0);
++fail:
++	btrfs_release_path(root, &path);
++	return ret;
++}
++
++static int add_symbolic_link(struct btrfs_trans_handle *trans,
++			     struct btrfs_root *root,
++			     u64 objectid, const char *path_name)
++{
++	int ret;
++	u64 sectorsize = root->sectorsize;
++	char *buf = malloc(sectorsize);
++
++	ret = readlink(path_name, buf, sectorsize);
++	if (ret <= 0) {
++		fprintf(stderr, "readlink failed for %s\n", path_name);
++		goto fail;
++	}
++	if (ret > sectorsize) {
++		fprintf(stderr, "symlink too long for %s", path_name);
++		ret = -1;
++		goto fail;
++	}
++	ret = btrfs_insert_inline_extent(trans, root, objectid, 0,
++					 buf, ret + 1);
++fail:
++	free(buf);
++	return ret;
++}
++
++static int add_file_items(struct btrfs_trans_handle *trans,
++			  struct btrfs_root *root,
++			  struct btrfs_inode_item *btrfs_inode, u64 objectid,
++			  ino_t parent_inum, struct stat *st,
++			  const char *path_name, int out_fd)
++{
++	int ret;
++	ssize_t ret_read;
++	u64 bytes_read = 0;
++	char *buffer = NULL;
++	struct btrfs_key key;
++	int blocks;
++	u32 sectorsize = root->sectorsize;
++	u64 first_block = 0;
++	u64 num_blocks = 0;
++	int fd;
++
++	fd = open(path_name, O_RDONLY);
++	if (fd == -1) {
++		fprintf(stderr, "%s open failed\n", path_name);
++		goto end;
++	}
++
++	blocks = st->st_size / sectorsize;
++	if (st->st_size % sectorsize)
++		blocks += 1;
++
++	if (st->st_size <= BTRFS_MAX_INLINE_DATA_SIZE(root)) {
++		buffer = malloc(st->st_size);
++		ret_read = pread64(fd, buffer, st->st_size, bytes_read);
++		if (ret_read == -1) {
++			fprintf(stderr, "%s read failed\n", path_name);
++			goto end;
++		}
++
++		ret = btrfs_insert_inline_extent(trans, root, objectid, 0,
++						 buffer, st->st_size);
++		goto end;
++	}
++
++	ret = custom_alloc_extent(root, blocks * sectorsize, 0, &key);
++	if (ret)
++		goto end;
++
++	first_block = key.objectid;
++	bytes_read = 0;
++	buffer = malloc(sectorsize);
++
++	do {
++		memset(buffer, 0, sectorsize);
++		ret_read = pread64(fd, buffer, sectorsize, bytes_read);
++		if (ret_read == -1) {
++			fprintf(stderr, "%s read failed\n", path_name);
++			goto end;
++		}
++
++		ret = pwrite64(out_fd, buffer, sectorsize,
++			       first_block + bytes_read);
++		if (ret != sectorsize) {
++			fprintf(stderr, "output file write failed\n");
++			goto end;
++		}
++
++		/* checksum for file data */
++		ret = btrfs_csum_file_block(trans, root->fs_info->csum_root,
++				first_block + (blocks * sectorsize),
++				first_block + bytes_read,
++				buffer, sectorsize);
++		if (ret) {
++			fprintf(stderr, "%s checksum failed\n", path_name);
++			goto end;
++		}
++
++		bytes_read += ret_read;
++		num_blocks++;
++	} while (ret_read == sectorsize);
++
++	if (num_blocks > 0) {
++		ret = record_file_extent(trans, root, objectid, btrfs_inode,
++					 first_block, first_block,
++					 blocks * sectorsize);
++		if (ret)
++			goto end;
++	}
++
++end:
++	if (buffer)
++		free(buffer);
++	close(fd);
++	return ret;
++}
++
++static char *make_path(char *dir, char *name)
++{
++	char *path;
++
++	path = malloc(strlen(dir) + strlen(name) + 2);
++	if (!path)
++		return NULL;
++	strcpy(path, dir);
++	if (dir[strlen(dir) - 1] != '/')
++		strcat(path, "/");
++	strcat(path, name);
++	return path;
++}
++
++static int traverse_directory(struct btrfs_trans_handle *trans,
++			      struct btrfs_root *root, char *dir_name,
++			      struct directory_name_entry *dir_head, int out_fd)
++{
++	int ret = 0;
++
++	struct btrfs_inode_item cur_inode;
++	struct btrfs_inode_item *inode_item;
++	int count, i, dir_index_cnt;
++	struct direct **files;
++	struct stat st;
++	struct directory_name_entry *dir_entry, *parent_dir_entry;
++	struct direct *cur_file;
++	ino_t parent_inum, cur_inum;
++	ino_t highest_inum = 0;
++	char *parent_dir_name;
++	struct btrfs_path path;
++	struct extent_buffer *leaf;
++	struct btrfs_key root_dir_key;
++	u64 root_dir_inode_size = 0;
++
++	/* Add list for source directory */
++	dir_entry = malloc(sizeof(struct directory_name_entry));
++	dir_entry->dir_name = dir_name;
++	dir_entry->path = malloc(strlen(dir_name) + 1);
++	strcpy(dir_entry->path, dir_name);
++
++	parent_inum = highest_inum + BTRFS_FIRST_FREE_OBJECTID;
++	dir_entry->inum = parent_inum;
++	list_add_tail(&dir_entry->list, &dir_head->list);
++
++	btrfs_init_path(&path);
++
++	root_dir_key.objectid = btrfs_root_dirid(&root->root_item);
++	root_dir_key.offset = 0;
++	btrfs_set_key_type(&root_dir_key, BTRFS_INODE_ITEM_KEY);
++	ret = btrfs_lookup_inode(trans, root, &path, &root_dir_key, 1);
++	if (ret) {
++		fprintf(stderr, "root dir lookup error\n");
++		goto fail;
++	}
++
++	leaf = path.nodes[0];
++	inode_item = btrfs_item_ptr(leaf, path.slots[0],
++				    struct btrfs_inode_item);
++
++	root_dir_inode_size = calculate_dir_inode_size(dir_name);
++	btrfs_set_inode_size(leaf, inode_item, root_dir_inode_size);
++	btrfs_mark_buffer_dirty(leaf);
++
++	btrfs_release_path(root, &path);
++
++	do {
++		parent_dir_entry = list_entry(dir_head->list.next,
++					      struct directory_name_entry,
++					      list);
++		list_del(&parent_dir_entry->list);
++
++		parent_inum = parent_dir_entry->inum;
++		parent_dir_name = parent_dir_entry->dir_name;
++		if (chdir(parent_dir_entry->path)) {
++			fprintf(stderr, "chdir error for %s\n",
++				parent_dir_name);
++			goto fail;
++		}
++
++		count = scandir(parent_dir_entry->path, &files,
++				directory_select, NULL);
++
++		for (i = 0; i < count; i++) {
++			cur_file = files[i];
++
++			if (lstat(cur_file->d_name, &st) == -1) {
++				fprintf(stderr, "lstat failed for file %s\n",
++					cur_file->d_name);
++				goto fail;
++			}
++
++			cur_inum = ++highest_inum + BTRFS_FIRST_FREE_OBJECTID;
++			ret = add_directory_items(trans, root,
++						  cur_inum, parent_inum,
++						  cur_file->d_name,
++						  &st, &dir_index_cnt);
++			if (ret) {
++				fprintf(stderr, "add_directory_items failed\n");
++				goto fail;
++			}
++
++			ret = add_inode_items(trans, root, &st,
++					      cur_file->d_name, cur_inum,
++					      parent_inum, dir_index_cnt,
++					      &cur_inode);
++			if (ret) {
++				fprintf(stderr, "add_inode_items failed\n");
++				goto fail;
++			}
++
++			ret = add_xattr_item(trans, root,
++					     cur_inum, cur_file->d_name);
++			if (ret) {
++				fprintf(stderr, "add_xattr_item failed\n");
++				goto fail;
++			}
++
++			if (S_ISDIR(st.st_mode)) {
++				dir_entry = malloc(sizeof(struct directory_name_entry));
++				dir_entry->dir_name = cur_file->d_name;
++				dir_entry->path = make_path(parent_dir_entry->path,
++							    cur_file->d_name);
++				dir_entry->inum = cur_inum;
++				list_add_tail(&dir_entry->list,	&dir_head->list);
++			} else if (S_ISREG(st.st_mode)) {
++				ret = add_file_items(trans, root, &cur_inode,
++						     cur_inum, parent_inum, &st,
++						     cur_file->d_name, out_fd);
++				if (ret) {
++					fprintf(stderr, "add_file_items failed\n");
++					goto fail;
++				}
++			} else if (S_ISLNK(st.st_mode)) {
++				ret = add_symbolic_link(trans, root,
++						        cur_inum, cur_file->d_name);
++				if (ret) {
++					fprintf(stderr, "add_symbolic_link failed\n");
++					goto fail;
++				}
++			}
++		}
++
++		free(parent_dir_entry->path);
++		free(parent_dir_entry);
++
++		index_cnt = 2;
++
++	} while (!list_empty(&dir_head->list));
++
++	return 0;
++fail:
++	free(parent_dir_entry->path);
++	free(parent_dir_entry);
++	return -1;
++}
++
++static int open_target(char *output_name)
++{
++	int output_fd;
++	output_fd = open(output_name, O_CREAT | O_RDWR | O_TRUNC,
++		         S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH);
++
++	return output_fd;
++}
++
++static int create_chunks(struct btrfs_trans_handle *trans,
++			 struct btrfs_root *root, u64 num_of_meta_chunks,
++			 u64 size_of_data)
++{
++	u64 chunk_start;
++	u64 chunk_size;
++	u64 meta_type = BTRFS_BLOCK_GROUP_METADATA;
++	u64 data_type = BTRFS_BLOCK_GROUP_DATA;
++	u64 minimum_data_chunk_size = 64 * 1024 * 1024;
++	u64 i;
++	int ret;
++
++	for (i = 0; i < num_of_meta_chunks; i++) {
++		ret = btrfs_alloc_chunk(trans, root->fs_info->extent_root,
++					&chunk_start, &chunk_size, meta_type);
++		BUG_ON(ret);
++		ret = btrfs_make_block_group(trans, root->fs_info->extent_root, 0,
++					     meta_type, BTRFS_FIRST_CHUNK_TREE_OBJECTID,
++					     chunk_start, chunk_size);
++		BUG_ON(ret);
++		set_extent_dirty(&root->fs_info->free_space_cache,
++				 chunk_start, chunk_start + chunk_size - 1, 0);
++	}
++
++	if (size_of_data < minimum_data_chunk_size)
++		size_of_data = minimum_data_chunk_size;
++	ret = btrfs_alloc_data_chunk(trans, root->fs_info->extent_root,
++				     &chunk_start, size_of_data, data_type);
++	BUG_ON(ret);
++	ret = btrfs_make_block_group(trans, root->fs_info->extent_root, 0,
++				     data_type, BTRFS_FIRST_CHUNK_TREE_OBJECTID,
++				     chunk_start, size_of_data);
++	BUG_ON(ret);
++	set_extent_dirty(&root->fs_info->free_space_cache,
++			 chunk_start, chunk_start + size_of_data - 1, 0);
++	return ret;
++}
++
++static int make_image(char *source_dir, struct btrfs_root *root, int out_fd)
++{
++	int ret;
++	struct btrfs_trans_handle *trans;
++
++	struct stat root_st;
++	int root_len;
++
++	struct directory_name_entry dir_head;
++
++	ret = lstat(source_dir, &root_st);
++	if (ret) {
++		fprintf(stderr, "unable to lstat the %s\n", source_dir);
++		goto fail;
++	}
++
++	root_len = strlen(source_dir);
++
++	INIT_LIST_HEAD(&dir_head.list);
++
++	trans = btrfs_start_transaction(root, 1);
++	ret = traverse_directory(trans, root, source_dir, &dir_head, out_fd);
++	if (ret) {
++		fprintf(stderr, "unable to traverse_directory\n");
++		goto fail;
++	}
++	btrfs_commit_transaction(trans, root);
++
++	printf("Making image is completed.\n");
++	return 0;
++fail:
++	fprintf(stderr, "Making image is aborted.\n");
++	return -1;
++}
++
++static u64 size_sourcedir(char *dir_name, u64 sectorsize,
++			  u64 *num_of_meta_chunks_ret, u64 *size_of_data_ret)
++{
++	u64 dir_size = 0;
++	u64 total_size = 0;
++	int ret;
++	char command[1024];
++	char path[512];
++	char *file_name = "temp_file";
++	FILE *file;
++	u64 minimum_data_size = 256 * 1024 * 1024;	/* 256MB */
++	u64 default_chunk_size = 8 * 1024 * 1024;	/* 8MB */
++	u64 allocated_meta_size = 8 * 1024 * 1024;	/* 8MB */
++	u64 allocated_total_size = 20 * 1024 * 1024;	/* 20MB */
++	u64 num_of_meta_chunks = 0;
++	u64 num_of_allocated_meta_chunks =
++			allocated_meta_size / default_chunk_size;
++
++	ret = sprintf(command, "du -B 4096 -s ");
++	if (ret < 0) {
++		fprintf(stderr, "error executing sprintf for du command\n");
++		return -1;
++	}
++	strcat(command, dir_name);
++	strcat(command, " > ");
++	strcat(command, file_name);
++	ret = system(command);
++
++	file = fopen(file_name, "r");
++	ret = fscanf(file, "%lld %s\n", &dir_size, path);
++	fclose(file);
++	remove(file_name);
++
++	dir_size *= sectorsize;
++	*size_of_data_ret = dir_size;
++
++	num_of_meta_chunks = (dir_size / 2) / default_chunk_size;
++	if (((dir_size / 2) % default_chunk_size) != 0)
++		num_of_meta_chunks++;
++	if (num_of_meta_chunks <= num_of_allocated_meta_chunks)
++		num_of_meta_chunks = 0;
++	else
++		num_of_meta_chunks -= num_of_allocated_meta_chunks;
++
++	total_size = allocated_total_size + dir_size +
++		     (num_of_meta_chunks * default_chunk_size);
++
++	*num_of_meta_chunks_ret = num_of_meta_chunks;
++
++	if (total_size < minimum_data_size)
++		total_size = minimum_data_size;
++
++	return total_size;
++}
++
++static int zero_output_file(int out_fd, u64 size, u32 sectorsize)
++{
++	int len = sectorsize;
++	int loop_num = size / sectorsize;
++	u64 location = 0;
++	char *buf = malloc(len);
++	int ret = 0, i;
++	ssize_t written;
++
++	if (!buf)
++		return -ENOMEM;
++	memset(buf, 0, len);
++	for (i = 0; i < loop_num; i++) {
++		written = pwrite64(out_fd, buf, len, location);
++		if (written != len)
++			ret = -EIO;
++		location += sectorsize;
++	}
++	free(buf);
++	return ret;
++}
++
+ int main(int ac, char **av)
+ {
+ 	char *file;
+@@ -385,9 +1156,15 @@ int main(int ac, char **av)
+ 	int data_profile_opt = 0;
+ 	int metadata_profile_opt = 0;
+ 
++	char *source_dir = NULL;
++	int source_dir_set = 0;
++	char *output = "output.img";
++	u64 num_of_meta_chunks = 0;
++	u64 size_of_data = 0;
++
+ 	while(1) {
+ 		int c;
+-		c = getopt_long(ac, av, "A:b:l:n:s:m:d:L:VM", long_options,
++		c = getopt_long(ac, av, "A:b:l:n:s:m:d:L:r:VM", long_options,
+ 				&option_index);
+ 		if (c < 0)
+ 			break;
+@@ -430,6 +1207,10 @@ int main(int ac, char **av)
+ 			case 'V':
+ 				print_version();
+ 				break;
++			case 'r':
++				source_dir = optarg;
++				source_dir_set = 1;
++				break;
+ 			default:
+ 				print_usage();
+ 		}
+@@ -443,6 +1224,8 @@ int main(int ac, char **av)
+ 		fprintf(stderr, "Illegal nodesize %u\n", nodesize);
+ 		exit(1);
+ 	}
++	if (source_dir_set)
++		ac++;
+ 	ac = ac - optind;
+ 	if (ac == 0)
+ 		print_usage();
+@@ -450,28 +1233,47 @@ int main(int ac, char **av)
+ 	printf("\nWARNING! - %s IS EXPERIMENTAL\n", BTRFS_BUILD_VERSION);
+ 	printf("WARNING! - see http://btrfs.wiki.kernel.org before using\n\n");
+ 
+-	file = av[optind++];
+-	ret = check_mounted(file);
+-	if (ret < 0) {
+-		fprintf(stderr, "error checking %s mount status\n", file);
+-		exit(1);
+-	}
+-	if (ret == 1) {
+-		fprintf(stderr, "%s is mounted\n", file);
+-		exit(1);
+-	}
+-	ac--;
+-	fd = open(file, O_RDWR);
+-	if (fd < 0) {
+-		fprintf(stderr, "unable to open %s\n", file);
+-		exit(1);
++	if (source_dir == 0) {
++		file = av[optind++];
++		ret = check_mounted(file);
++		if (ret < 0) {
++			fprintf(stderr, "error checking %s mount status\n", file);
++			exit(1);
++		}
++		if (ret == 1) {
++			fprintf(stderr, "%s is mounted\n", file);
++			exit(1);
++		}
++		ac--;
++		fd = open(file, O_RDWR);
++		if (fd < 0) {
++			fprintf(stderr, "unable to open %s\n", file);
++			exit(1);
++		}
++		first_fd = fd;
++		first_file = file;
++		ret = btrfs_prepare_device(fd, file, zero_end, &dev_block_count, &mixed);
++		if (block_count == 0)
++			block_count = dev_block_count;
++	} else {
++		ac = 0;
++		fd = open_target(output);
++		if (fd < 0) {
++			fprintf(stderr, "unable to open the %s\n", file);
++			exit(1);
++		}
++
++		file = output;
++		first_fd = fd;
++		first_file = file;
++		block_count = size_sourcedir(source_dir, sectorsize,
++					     &num_of_meta_chunks, &size_of_data);
++		ret = zero_output_file(fd, block_count, sectorsize);
++		if (ret) {
++			fprintf(stderr, "unable to zero the output file\n");
++			exit(1);
++		}
+ 	}
+-	first_fd = fd;
+-	first_file = file;
+-	ret = btrfs_prepare_device(fd, file, zero_end, &dev_block_count,
+-				   &mixed);
+-	if (block_count == 0)
+-		block_count = dev_block_count;
+ 	if (mixed) {
+ 		if (!metadata_profile_opt)
+ 			metadata_profile = 0;
+@@ -558,9 +1360,11 @@ int main(int ac, char **av)
+ 	}
+ 
+ raid_groups:
+-	ret = create_raid_groups(trans, root, data_profile,
++	if (!source_dir_set) {
++		ret = create_raid_groups(trans, root, data_profile,
+ 				 metadata_profile, mixed);
+-	BUG_ON(ret);
++		BUG_ON(ret);
++	}
+ 
+ 	ret = create_data_reloc_tree(trans, root);
+ 	BUG_ON(ret);
+@@ -580,6 +1384,18 @@ raid_groups:
+ 
+ 	printf("%s\n", BTRFS_BUILD_VERSION);
+ 	btrfs_commit_transaction(trans, root);
++
++	if (source_dir_set) {
++		trans = btrfs_start_transaction(root, 1);
++		ret = create_chunks(trans, root,
++				    num_of_meta_chunks, size_of_data);
++		BUG_ON(ret);
++		btrfs_commit_transaction(trans, root);
++
++		ret = make_image(source_dir, root, fd);
++		BUG_ON(ret);
++	}
++
+ 	ret = close_ctree(root);
+ 	BUG_ON(ret);
+ 
+diff --git a/volumes.c b/volumes.c
+index 7671855..4bb77e2 100644
+--- a/volumes.c
++++ b/volumes.c
+@@ -857,6 +857,110 @@ again:
+ 	return ret;
+ }
+ 
++int btrfs_alloc_data_chunk(struct btrfs_trans_handle *trans,
++			   struct btrfs_root *extent_root, u64 *start,
++			   u64 num_bytes, u64 type)
++{
++	u64 dev_offset;
++	struct btrfs_fs_info *info = extent_root->fs_info;
++	struct btrfs_root *chunk_root = extent_root->fs_info->chunk_root;
++	struct btrfs_stripe *stripes;
++	struct btrfs_device *device = NULL;
++	struct btrfs_chunk *chunk;
++	struct list_head *dev_list = &extent_root->fs_info->fs_devices->devices;
++	struct list_head *cur;
++	struct map_lookup *map;
++	u64 physical;
++	u64 calc_size = 8 * 1024 * 1024;
++	int num_stripes = 1;
++	int sub_stripes = 0;
++	int ret;
++	int index;
++	int stripe_len = 64 * 1024;
++	struct btrfs_key key;
++
++	key.objectid = BTRFS_FIRST_CHUNK_TREE_OBJECTID;
++	key.type = BTRFS_CHUNK_ITEM_KEY;
++	ret = find_next_chunk(chunk_root, BTRFS_FIRST_CHUNK_TREE_OBJECTID,
++			      &key.offset);
++	if (ret)
++		return ret;
++
++	chunk = kmalloc(btrfs_chunk_item_size(num_stripes), GFP_NOFS);
++	if (!chunk)
++		return -ENOMEM;
++
++	map = kmalloc(map_lookup_size(num_stripes), GFP_NOFS);
++	if (!map) {
++		kfree(chunk);
++		return -ENOMEM;
++	}
++
++	stripes = &chunk->stripe;
++	calc_size = num_bytes;
++
++	index = 0;
++	cur = dev_list->next;
++	device = list_entry(cur, struct btrfs_device, dev_list);
++
++	while (index < num_stripes) {
++		struct btrfs_stripe *stripe;
++
++		ret = btrfs_alloc_dev_extent(trans, device,
++			     info->chunk_root->root_key.objectid,
++			     BTRFS_FIRST_CHUNK_TREE_OBJECTID, key.offset,
++			     calc_size, &dev_offset);
++		BUG_ON(ret);
++
++		device->bytes_used += calc_size;
++		ret = btrfs_update_device(trans, device);
++		BUG_ON(ret);
++
++		map->stripes[index].dev = device;
++		map->stripes[index].physical = dev_offset;
++		stripe = stripes + index;
++		btrfs_set_stack_stripe_devid(stripe, device->devid);
++		btrfs_set_stack_stripe_offset(stripe, dev_offset);
++		memcpy(stripe->dev_uuid, device->uuid, BTRFS_UUID_SIZE);
++		physical = dev_offset;
++		index++;
++	}
++
++	/* key was set above */
++	btrfs_set_stack_chunk_length(chunk, num_bytes);
++	btrfs_set_stack_chunk_owner(chunk, extent_root->root_key.objectid);
++	btrfs_set_stack_chunk_stripe_len(chunk, stripe_len);
++	btrfs_set_stack_chunk_type(chunk, type);
++	btrfs_set_stack_chunk_num_stripes(chunk, num_stripes);
++	btrfs_set_stack_chunk_io_align(chunk, stripe_len);
++	btrfs_set_stack_chunk_io_width(chunk, stripe_len);
++	btrfs_set_stack_chunk_sector_size(chunk, extent_root->sectorsize);
++	btrfs_set_stack_chunk_sub_stripes(chunk, sub_stripes);
++	map->sector_size = extent_root->sectorsize;
++	map->stripe_len = stripe_len;
++	map->io_align = stripe_len;
++	map->io_width = stripe_len;
++	map->type = type;
++	map->num_stripes = num_stripes;
++	map->sub_stripes = sub_stripes;
++
++	ret = btrfs_insert_item(trans, chunk_root, &key, chunk,
++				btrfs_chunk_item_size(num_stripes));
++	BUG_ON(ret);
++	*start = key.offset;
++
++	map->ce.start = key.offset;
++	map->ce.size = num_bytes;
++
++	ret = insert_existing_cache_extent(
++			   &extent_root->fs_info->mapping_tree.cache_tree,
++			   &map->ce);
++	BUG_ON(ret);
++
++	kfree(chunk);
++	return ret;
++}
++
+ void btrfs_mapping_init(struct btrfs_mapping_tree *tree)
+ {
+ 	cache_tree_init(&tree->cache_tree);
+diff --git a/volumes.h b/volumes.h
+index bb78751..93b0e48 100644
+--- a/volumes.h
++++ b/volumes.h
+@@ -107,6 +107,9 @@ int btrfs_read_chunk_tree(struct btrfs_root *root);
+ int btrfs_alloc_chunk(struct btrfs_trans_handle *trans,
+ 		      struct btrfs_root *extent_root, u64 *start,
+ 		      u64 *num_bytes, u64 type);
++int btrfs_alloc_data_chunk(struct btrfs_trans_handle *trans,
++			   struct btrfs_root *extent_root, u64 *start,
++			   u64 num_bytes, u64 type);
+ int btrfs_read_super_device(struct btrfs_root *root, struct extent_buffer *buf);
+ int btrfs_add_device(struct btrfs_trans_handle *trans,
+ 		     struct btrfs_root *root,
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0014-btrfs-progs-fix-wrong-extent-buffer-size-when-readin.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0014-btrfs-progs-fix-wrong-extent-buffer-size-when-readin.patch
new file mode 100644
index 0000000..6a0f9d6
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0014-btrfs-progs-fix-wrong-extent-buffer-size-when-readin.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [Backport]
+From 32ba8209276d3ac1723ea6373aaec9d6399ce5ca Mon Sep 17 00:00:00 2001
+From: Miao Xie <miaox@cn.fujitsu.com>
+Date: Tue, 13 Jul 2010 09:18:04 +0000
+Subject: [PATCH 14/15] btrfs-progs: fix wrong extent buffer size when reading tree block
+
+the root extent buffer of a tree may not be a leaf, so we must get the right
+size by its level when reading it.
+
+Signed-off-by: Miao Xie <miaox@cn.fujitsu.com>
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ debug-tree.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/debug-tree.c b/debug-tree.c
+index 0525354..99c12d6 100644
+--- a/debug-tree.c
++++ b/debug-tree.c
+@@ -212,7 +212,9 @@ again:
+ 			read_extent_buffer(leaf, &ri, offset, sizeof(ri));
+ 			buf = read_tree_block(tree_root_scan,
+ 					      btrfs_root_bytenr(&ri),
+-					      tree_root_scan->leafsize, 0);
++					      btrfs_level_size(tree_root_scan,
++							btrfs_root_level(&ri)),
++					      0);
+ 			switch(found_key.objectid) {
+ 			case BTRFS_ROOT_TREE_OBJECTID:
+ 				if (!skip)
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0015-btrfs-progs-add-discard-support-to-mkfs.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0015-btrfs-progs-add-discard-support-to-mkfs.patch
new file mode 100644
index 0000000..7a93b53
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0015-btrfs-progs-add-discard-support-to-mkfs.patch
@@ -0,0 +1,110 @@
+Upstream-Status: Inappropriate [Backport]
+From e6bd18d8938986c997c45f0ea95b221d4edec095 Mon Sep 17 00:00:00 2001
+From: Christoph Hellwig <hch@lst.de>
+Date: Thu, 21 Apr 2011 16:24:07 -0400
+Subject: [PATCH 15/15] btrfs-progs: add discard support to mkfs
+
+Discard the whole device before starting to create the filesystem structures.
+Modelled after similar support in mkfs.xfs.
+
+Signed-off-by: Christoph Hellwig <hch@lst.de>
+Signed-off-by: Chris Mason <chris.mason@oracle.com>
+---
+ btrfs_cmds.c |   21 +++++++++++++++++----
+ utils.c      |   21 +++++++++++++++++++++
+ 2 files changed, 38 insertions(+), 4 deletions(-)
+
+diff --git a/btrfs_cmds.c b/btrfs_cmds.c
+index 6de73f4..32f6b25 100644
+--- a/btrfs_cmds.c
++++ b/btrfs_cmds.c
+@@ -732,13 +732,26 @@ int do_add_volume(int nargs, char **args)
+ 		return 12;
+ 	}
+ 
+-	for(i=1 ; i < (nargs-1) ; i++ ){
++	for (i = 1; i < (nargs-1); i++ ){
+ 		struct btrfs_ioctl_vol_args ioctl_args;
+ 		int	devfd, res;
+ 		u64 dev_block_count = 0;
+ 		struct stat st;
+ 		int mixed = 0;
+ 
++		res = check_mounted(args[i]);
++		if (res < 0) {
++			fprintf(stderr, "error checking %s mount status\n",
++				args[i]);
++			ret++;
++			continue;
++		}
++		if (res == 1) {
++			fprintf(stderr, "%s is mounted\n", args[i]);
++			ret++;
++			continue;
++		}
++
+ 		devfd = open(args[i], O_RDWR);
+ 		if (!devfd) {
+ 			fprintf(stderr, "ERROR: Unable to open device '%s'\n", args[i]);
+@@ -746,8 +759,8 @@ int do_add_volume(int nargs, char **args)
+ 			ret++;
+ 			continue;
+ 		}
+-		ret = fstat(devfd, &st);
+-		if (ret) {
++		res = fstat(devfd, &st);
++		if (res) {
+ 			fprintf(stderr, "ERROR: Unable to stat '%s'\n", args[i]);
+ 			close(devfd);
+ 			ret++;
+@@ -781,7 +794,7 @@ int do_add_volume(int nargs, char **args)
+ 	}
+ 
+ 	close(fdmnt);
+-	if( ret)
++	if (ret)
+ 		return ret+20;
+ 	else
+ 		return 0;
+diff --git a/utils.c b/utils.c
+index 13373c9..17e5afe 100644
+--- a/utils.c
++++ b/utils.c
+@@ -50,6 +50,20 @@
+ static inline int ioctl(int fd, int define, u64 *size) { return 0; }
+ #endif
+ 
++#ifndef BLKDISCARD
++#define BLKDISCARD	_IO(0x12,119)
++#endif
++
++static int
++discard_blocks(int fd, u64 start, u64 len)
++{
++	u64 range[2] = { start, len };
++
++	if (ioctl(fd, BLKDISCARD, &range) < 0)
++		return errno;
++	return 0;
++}
++
+ static u64 reference_root_table[] = {
+ 	[1] =	BTRFS_ROOT_TREE_OBJECTID,
+ 	[2] =	BTRFS_EXTENT_TREE_OBJECTID,
+@@ -537,6 +551,13 @@ int btrfs_prepare_device(int fd, char *file, int zero_end, u64 *block_count_ret,
+ 		printf("SMALL VOLUME: forcing mixed metadata/data groups\n");
+ 		*mixed = 1;
+ 	}
++
++	/*
++	 * We intentionally ignore errors from the discard ioctl.  It is
++	 * not necessary for the mkfs functionality but just an optimization.
++	 */
++	discard_blocks(fd, 0, block_count);
++
+ 	ret = zero_dev_start(fd);
+ 	if (ret) {
+ 		fprintf(stderr, "failed to zero device start %d\n", ret);
+-- 
+1.7.2.3
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
new file mode 100644
index 0000000..312dff3
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Checksumming Copy on Write Filesystem utilities"
+DESCRIPTION = "Btrfs is a new copy on write filesystem for Linux aimed at \
+implementing advanced features while focusing on fault tolerance, repair and \
+easy administration. \
+This package contains utilities (mkfs, fsck, btrfsctl) used to work with \
+btrfs and an utility (btrfs-convert) to make a btrfs filesystem from an ext3."
+
+HOMEPAGE = "https://btrfs.wiki.kernel.org"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
+SECTION = "base"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs-unstable.git;protocol=git;tag=1b444cd2e6ab8dcafdd47dbaeaae369dd1517c17;branch=master"
+
+S = "${WORKDIR}/git"
+
+PR = "r0"
+
+SRC_URI += "file://upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-command-to-over.patch \
+	    file://upstream-tmp/0002-Btrfs-progs-use-safe-string-manipulation-functions.patch \
+	    file://upstream-tmp/0003-Btrfs-progs-utils-Informative-errors.patch \
+	    file://upstream-tmp/0004-update-man-page-to-new-defragment-command-interface.patch \
+	    file://upstream-tmp/0005-Improve-error-handling-in-the-btrfs-command.patch \
+	    file://upstream-tmp/0006-Btrfs-progs-update-super-fields-for-space-cache.patch \
+	    file://upstream-tmp/0007-Btrfs-progs-add-support-for-mixed-data-metadata-bloc.patch \
+	    file://upstream-tmp/0008-Update-for-lzo-support.patch \
+	    file://upstream-tmp/0009-Update-clean-up-btrfs-help-and-man-page-V2.patch \
+	    file://upstream-tmp/0010-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch \
+	    file://upstream-tmp/0011-Add-the-btrfs-filesystem-label-command.patch \
+	    file://upstream-tmp/0012-Btrfs-progs-Update-man-page-for-mixed-data-metadata-.patch \
+	    file://upstream-tmp/0013-btrfs-progs-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch \
+	    file://upstream-tmp/0014-btrfs-progs-fix-wrong-extent-buffer-size-when-readin.patch \
+	    file://upstream-tmp/0015-btrfs-progs-add-discard-support-to-mkfs.patch \
+	    file://upstream-for-dragonn/0001-Fill-missing-devices-so-degraded-filesystems-can-be-.patch \
+	    file://upstream-for-dragonn/0002-Check-for-RAID10-in-set_avail_alloc_bits.patch \
+	    file://upstream-for-dragonn/0003-Print-the-root-generation-in-btrfs-debug-tree.patch \
+	    file://upstream-for-dragonn/0004-Allow-partial-FS-opens-for-btrfsck-scanning.patch \
+	    file://mkfs-xin-fixes.patch \
+	    file://debian/01-labels.patch \
+	    file://debian/02-ftbfs.patch \
+	    file://fix_use_of_gcc.patch \
+		"
+
+SRC_URI[md5sum] = "78b1700d318de8518abfaab71f99a885"
+SRC_URI[sha256sum] = "1285774e0cb72984fac158dd046c8d405324754febd30320cd31e459253e4b65"
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+}
+
+BBCLASSEXTEND = "native"
-- 
1.7.4.4



