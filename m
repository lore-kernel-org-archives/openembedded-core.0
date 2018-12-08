Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 37F7A79CA7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Dec 2018 20:56:16 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id b85so3537388pfc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Dec 2018 12:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T8gW8IjnYnolBW6S8chTSkS4GNQ1mEaaM4rbV1OE618=;
	b=sn0/dypU+bBSGwwNbhD8Mq//4hFE4jP7BIenHQKPFXjOWZZWMeRTQEeXh5IIXV3hW4
	tx6gVEU29aevyfBjYF6irC8lgaPiihTVIIWBCuNEOnS8C0oBh4exIS4AZV38F+eWjtPg
	KcUKl4lkEjO5iRBikoSvyJtmSzCWX4e7Dmix+ykLWseev3VOBEDql/pocqI6UQxHvwAo
	EhmL0n8RvVdACs6ulfhLbxZOE467BpQhGmziTfvYrLH6tVle/v2toybuqKAhbDxZdwD3
	JusZJhoVJq+ZunUWHW0084HjL39AJL5hnuj2/O0bGJYFRtKvLCvlURE1Vp2xAZnLXWhh
	+hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T8gW8IjnYnolBW6S8chTSkS4GNQ1mEaaM4rbV1OE618=;
	b=SfEid+UMn0I1TEeiOXWOvobfCUYrDNtQx4ocTUXHHi5PWjitytPpfCoSXVHdKUY0RC
	zhfnqQtyP5fyc4QlmWCF4xdMA/C3JjrjbFhEkuOCw+CIeMNtijzQ0KUfClzpRptFK5zf
	rY9DA7VsUF1KTAullgy3hOhoddUDABvIiKgBry8JRJdWPNB1g2ZVc8Beg+LaGhpf1RUB
	RdCnH+jFH2/b/M2gji4VPFo8XudGilYFh4B0Dz/4W55UZamMpIf0DTJCPT//sJbJLRSg
	BMc3OF7vCmZckCwUmTwS2JFcdhxhrFepUHmfqWPOmuEslgffAOC3mtV/BwpnmSzYPy/X
	ymsQ==
X-Gm-Message-State: AA+aEWYngqLfmPriXBEO7zK3WR24SfjItzyx+9IokTOWQbsdSBHOCNci
	4r5QItnxoKUhJxCitsqbYLPEgdd1lmk=
X-Google-Smtp-Source: AFSGD/VPW+SblKzxjbQIfNDi6n0xnycC0iJ6TdgfM6wrb71Jb2SFzarAQJZp+ieXLUvBJA/huhZhHg==
X-Received: by 2002:a63:ff16:: with SMTP id k22mr6231872pgi.244.1544302577346; 
	Sat, 08 Dec 2018 12:56:17 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	s2sm12394659pfa.167.2018.12.08.12.56.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Dec 2018 12:56:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Dec 2018 12:56:02 -0800
Message-Id: <20181208205602.25506-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] mdadm: Drop redundant patches and fix build with clang
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
X-List-Received-Date: Sat, 08 Dec 2018 20:56:17 -0000
Content-Transfer-Encoding: 8bit

Several patches were being applied unnecessarily, the purpose they
served at one point has either been fixed differently, or accepted
upstream.

Add a new patch to make clang's diagnostics happy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Keep mdadm-fix-ptest-build-errors.patch
V3: Keep 0001-mdadm.h-Undefine-dprintf-before-redefining.patch

 ...abs-diff-in-a-standard-compliant-way.patch |  31 ++++
 .../files/0001-Disable-gcc8-warnings.patch    | 152 ------------------
 ...smacros.h-for-major-minor-defintions.patch |  44 -----
 ...omment-to-indicate-valid-fallthrough.patch | 124 --------------
 .../mdadm/files/gcc-4.9.patch                 |  31 ----
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |  20 ++-
 6 files changed, 40 insertions(+), 362 deletions(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Compute-abs-diff-in-a-standard-compliant-way.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/gcc-4.9.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Compute-abs-diff-in-a-standard-compliant-way.patch b/meta/recipes-extended/mdadm/files/0001-Compute-abs-diff-in-a-standard-compliant-way.patch
new file mode 100644
index 0000000000..803a59b3ec
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Compute-abs-diff-in-a-standard-compliant-way.patch
@@ -0,0 +1,31 @@
+From b273e892bd6aaafe448f84356abb78a6d463e784 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Dec 2018 17:22:39 -0800
+Subject: [PATCH] Compute abs diff in a standard compliant way
+
+This make it a bit less implementation defined and silences clang
+warning -Wabsolute-value
+
+| super-intel.c:2822:20: error: taking the absolute value of unsigned type 'unsi
+gned long long' has no effect [-Werror,-Wabsolute-value]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ super-intel.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/super-intel.c b/super-intel.c
+index 6438987..10d7218 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -2819,7 +2819,7 @@ static unsigned long long calc_component_size(struct imsm_map *map,
+ 	 * 2048 blocks per each device. If the difference is higher it means
+ 	 * that array size was expanded and num_data_stripes was not updated.
+ 	 */
+-	if ((unsigned int)abs(calc_dev_size - dev_size) >
++	if ((unsigned int)abs((int)calc_dev_size - (int)dev_size) >
+ 	    (1 << SECT_PER_MB_SHIFT) * member_disks) {
+ 		component_size = dev_size / member_disks;
+ 		dprintf("Invalid num_data_stripes in metadata; expected=%llu, found=%llu\n",
diff --git a/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch b/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
deleted file mode 100644
index 361d53ca6c..0000000000
--- a/meta/recipes-extended/mdadm/files/0001-Disable-gcc8-warnings.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From a6c991750ae6ebd87a0b9b243bec7fd8e5a064c5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 May 2018 12:56:41 -0700
-Subject: [PATCH] Disable gcc8 warnings
-
-This is needed until
-https://bugzilla.redhat.com/show_bug.cgi?id=1553958
-
-Fix super0.c issue which is triggered only in DEBUG_BUILD with -O1 (or any
-configuration without -ftree-vrp or with -fno-tree-vrp)
-
-super0.c: In function 'examine_super0':
-super0.c:238:32: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
-   snprintf(nb, sizeof(nb), "%4d", d);
-                                ^
-
-Upstream-Status: Inappropriate [Workaround]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Monitor.c     | 4 +++-
- mdopen.c      | 4 ++++
- super-ddf.c   | 4 ++++
- super-intel.c | 6 ++++++
- super0.c      | 2 +-
- super1.c      | 5 +++++
- 6 files changed, 23 insertions(+), 2 deletions(-)
-
-diff --git a/Monitor.c b/Monitor.c
-index 036103f..08cbd0a 100644
---- a/Monitor.c
-+++ b/Monitor.c
-@@ -445,7 +445,8 @@ static void alert(char *event, char *dev, char *disc, struct alert_info *info)
- 			       event, dev);
- 	}
- }
--
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-truncation"
- static int check_array(struct state *st, struct mdstat_ent *mdstat,
- 		       int test, struct alert_info *ainfo,
- 		       int increments, char *prefer)
-@@ -673,6 +674,7 @@ static int check_array(struct state *st, struct mdstat_ent *mdstat,
- 	st->err++;
- 	goto out;
- }
-+#pragma GCC diagnostic pop
- 
- static int add_new_arrays(struct mdstat_ent *mdstat, struct state **statelist,
- 			  int test, struct alert_info *info)
-diff --git a/mdopen.c b/mdopen.c
-index 98c54e4..4f72b69 100644
---- a/mdopen.c
-+++ b/mdopen.c
-@@ -26,6 +26,9 @@
- #include "md_p.h"
- #include <ctype.h>
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-truncation"
-+
- void make_parts(char *dev, int cnt)
- {
- 	/* make 'cnt' partition devices for 'dev'
-@@ -101,6 +104,7 @@ void make_parts(char *dev, int cnt)
- 	}
- 	free(name);
- }
-+#pragma GCC diagnostic pop
- 
- int create_named_array(char *devnm)
- {
-diff --git a/super-ddf.c b/super-ddf.c
-index 618542c..6ed4e7e 100644
---- a/super-ddf.c
-+++ b/super-ddf.c
-@@ -2828,6 +2828,9 @@ static void _set_config_size(struct phys_disk_entry *pde, const struct dl *dl)
- 		(unsigned long long)cfs, (unsigned long long)(dl->size-cfs));
- }
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-overflow"
-+
- /* Add a device to a container, either while creating it or while
-  * expanding a pre-existing container
-  */
-@@ -2964,6 +2967,7 @@ static int add_to_super_ddf(struct supertype *st,
- 
- 	return 0;
- }
-+#pragma GCC diagnostic pop
- 
- static int remove_from_super_ddf(struct supertype *st, mdu_disk_info_t *dk)
- {
-diff --git a/super-intel.c b/super-intel.c
-index 1bc4b80..39d0e92 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -333,6 +333,11 @@ struct md_list {
- };
- 
- #define pr_vrb(fmt, arg...) (void) (verbose && pr_err(fmt, ##arg))
-+#pragma GCC diagnostic push
-+# if __GNUC__ == 8
-+# pragma GCC diagnostic ignored "-Wstringop-truncation"
-+# endif
-+#pragma GCC diagnostic ignored "-Wformat-truncation"
- 
- static __u8 migr_type(struct imsm_dev *dev)
- {
-@@ -12208,3 +12213,4 @@ struct superswitch super_imsm = {
- 	.clear_bad_block  = imsm_clear_badblock,
- 	.get_bad_blocks   = imsm_get_badblocks,
- };
-+#pragma GCC diagnostic pop
-diff --git a/super0.c b/super0.c
-index 42989b9..f5e8031 100644
---- a/super0.c
-+++ b/super0.c
-@@ -229,7 +229,7 @@ static void examine_super0(struct supertype *st, char *homehost)
- 	     d++) {
- 		mdp_disk_t *dp;
- 		char *dv;
--		char nb[11];
-+		char nb[12];
- 		int wonly, failfast;
- 		if (d>=0) dp = &sb->disks[d];
- 		else dp = &sb->this_disk;
-diff --git a/super1.c b/super1.c
-index 636a286..f894cbb 100644
---- a/super1.c
-+++ b/super1.c
-@@ -1176,6 +1176,10 @@ static struct mdinfo *container_content1(struct supertype *st, char *subarray)
- 	return info;
- }
- 
-+#pragma GCC diagnostic push
-+# if __GNUC__ == 8
-+# pragma GCC diagnostic ignored "-Wstringop-truncation"
-+#endif
- static int update_super1(struct supertype *st, struct mdinfo *info,
- 			 char *update, char *devname, int verbose,
- 			 int uuid_set, char *homehost)
-@@ -1641,6 +1645,7 @@ static int init_super1(struct supertype *st, mdu_array_info_t *info,
- 
- 	return 1;
- }
-+#pragma GCC diagnostic pop
- 
- struct devinfo {
- 	int fd;
diff --git a/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch b/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
deleted file mode 100644
index 6293f9b2b3..0000000000
--- a/meta/recipes-extended/mdadm/files/0001-include-sys-sysmacros.h-for-major-minor-defintions.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 714f2262960a7fe9e8f973629ed214023e144590 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 18 Dec 2016 08:30:51 +0000
-Subject: [PATCH] include <sys/sysmacros.h> for major/minor defintions
-
-glibc 2.25 is warning about it if applications depend on
-sys/types.h for these macros, it expects to be included
-from <sys/sysmacros.h>
-
-Fixes
-| Grow.c:3534:13: error: In the GNU C Library, "minor" is defined
-|  by <sys/sysmacros.h>. For historical compatibility, it is
-|  currently defined by <sys/types.h> as well, but we plan to
-|  remove this soon. To use "minor", include <sys/sysmacros.h>
-|  directly. If you did not intend to use a system-defined macro
-|  "minor", you should undefine it after including <sys/types.h>. [-Werror]
-| Query.c: In function 'Query':
-| Query.c:105:13: error: In the GNU C Library, "makedev" is defined
-|  by <sys/sysmacros.h>. For historical compatibility, it is
-|  currently defined by <sys/types.h> as well, but we plan to
-|  remove this soon. To use "makedev", include <sys/sysmacros.h>
-|  directly. If you did not intend to use a system-defined macro
-|  "makedev", you should undefine it after including <sys/types.h>. [-Werror]
-|           makedev((unsigned)disc.major,(unsigned)disc.minor) == stb.st_rdev)
-|              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
----
- mdadm.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/mdadm.h b/mdadm.h
-index bb943bf..79c44c6 100644
---- a/mdadm.h
-+++ b/mdadm.h
-@@ -34,6 +34,7 @@ extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
- #endif
- 
- #include	<sys/types.h>
-+#include	<sys/sysmacros.h>
- #include	<sys/stat.h>
- #include	<stdint.h>
- #include	<stdlib.h>
diff --git a/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch b/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
deleted file mode 100644
index 0bd556d437..0000000000
--- a/meta/recipes-extended/mdadm/files/0005-Add-a-comment-to-indicate-valid-fallthrough.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 0c2c8ae6b3a1fb0f611f9795953a7a6ed06be38d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 Apr 2017 12:04:15 -0700
-Subject: [PATCH] Add a comment to indicate valid fallthrough
-
-gcc7 warns about code with fallthroughs, this patch adds
-the comment to indicate a valid fallthrough, helps gcc7
-compiler warnings
-
-This works in cross and native compilation case
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Submitted
----
- Grow.c        | 4 ++++
- bitmap.c      | 8 ++++++++
- mdadm.c       | 2 ++
- super-intel.c | 1 +
- util.c        | 1 +
- 5 files changed, 16 insertions(+)
-
-diff --git a/Grow.c b/Grow.c
-index 4436a4d..b3116e2 100644
---- a/Grow.c
-+++ b/Grow.c
-@@ -1447,6 +1447,7 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
- 		switch (info->new_level) {
- 		case 4:
- 			delta_parity = 1;
-+			/* fallthrough */
- 		case 0:
- 			re->level = 4;
- 			re->before.layout = 0;
-@@ -1474,10 +1475,12 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
- 
- 	case 4:
- 		info->array.layout = ALGORITHM_PARITY_N;
-+		/* fallthrough */
- 	case 5:
- 		switch (info->new_level) {
- 		case 0:
- 			delta_parity = -1;
-+			/* fallthrough */
- 		case 4:
- 			re->level = info->array.level;
- 			re->before.data_disks = info->array.raid_disks - 1;
-@@ -1533,6 +1536,7 @@ char *analyse_change(char *devname, struct mdinfo *info, struct reshape *re)
- 		case 4:
- 		case 5:
- 			delta_parity = -1;
-+			/* fallthrough */
- 		case 6:
- 			re->level = 6;
- 			re->before.data_disks = info->array.raid_disks - 2;
-diff --git a/bitmap.c b/bitmap.c
-index e38cb96..10af328 100644
---- a/bitmap.c
-+++ b/bitmap.c
-@@ -82,13 +82,21 @@ static inline int count_dirty_bits_byte(char byte, int num_bits)
- 
- 	switch (num_bits) { /* fall through... */
- 		case 8:	if (byte & 128) num++;
-+		/* fallthrough */
- 		case 7:	if (byte &  64) num++;
-+		/* fallthrough */
- 		case 6:	if (byte &  32) num++;
-+		/* fallthrough */
- 		case 5:	if (byte &  16) num++;
-+		/* fallthrough */
- 		case 4:	if (byte &   8) num++;
-+		/* fallthrough */
- 		case 3: if (byte &   4) num++;
-+		/* fallthrough */
- 		case 2:	if (byte &   2) num++;
-+		/* fallthrough */
- 		case 1:	if (byte &   1) num++;
-+		/* fallthrough */
- 		default: break;
- 	}
- 
-diff --git a/mdadm.c b/mdadm.c
-index 25a1abd..9843bc5 100644
---- a/mdadm.c
-+++ b/mdadm.c
-@@ -155,6 +155,7 @@ int main(int argc, char *argv[])
- 			    mode == CREATE || mode == GROW ||
- 			    mode == INCREMENTAL || mode == MANAGE)
- 				break; /* b means bitmap */
-+		/* fallthrough */
- 		case Brief:
- 			c.brief = 1;
- 			continue;
-@@ -839,6 +840,7 @@ int main(int argc, char *argv[])
- 
- 		case O(INCREMENTAL,NoDegraded):
- 			pr_err("--no-degraded is deprecated in Incremental mode\n");
-+			/* fallthrough */
- 		case O(ASSEMBLE,NoDegraded): /* --no-degraded */
- 			c.runstop = -1; /* --stop isn't allowed for --assemble,
- 					 * so we overload slightly */
-diff --git a/super-intel.c b/super-intel.c
-index e726987..1bc4b80 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -3425,6 +3425,7 @@ static void getinfo_super_imsm_volume(struct supertype *st, struct mdinfo *info,
- 
- 			}
- 		}
-+		/* fallthrough */
- 		case MIGR_VERIFY:
- 			/* we could emulate the checkpointing of
- 			 * 'sync_action=check' migrations, but for now
-diff --git a/util.c b/util.c
-index c26cf5f..61cbe23 100644
---- a/util.c
-+++ b/util.c
-@@ -400,6 +400,7 @@ unsigned long long parse_size(char *size)
- 		switch (*c) {
- 		case 'K':
- 			c++;
-+		/* fallthrough */
- 		default:
- 			s *= 2;
- 			break;
diff --git a/meta/recipes-extended/mdadm/files/gcc-4.9.patch b/meta/recipes-extended/mdadm/files/gcc-4.9.patch
deleted file mode 100644
index 473fd7821b..0000000000
--- a/meta/recipes-extended/mdadm/files/gcc-4.9.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8804bca3de1b79a7c579783b7e3a7603f43bbb48 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 May 2014 16:31:17 -0700
-Subject: [PATCH] mdadm: Fix build on gcc 4.9
-
-super-intel.c:5063:2: error: right-hand operand of comma expression has no effect [-Werror=unused-value]
-  snprintf((char *) spare->sig, MAX_SIGNATURE_LENGTH,
-  ^
-cc1: all warnings being treated as errors
-make: *** [super-intel.o] Error 1
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- super-intel.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/super-intel.c b/super-intel.c
-index 6438987..e726987 100644
---- a/super-intel.c
-+++ b/super-intel.c
-@@ -5941,7 +5941,7 @@ static int write_super_imsm_spares(struct intel_super *super, int doclose)
- 	spare->cache_size = mpb->cache_size;
- 	spare->pwr_cycle_count = __cpu_to_le32(1);
- 
--	snprintf((char *) spare->sig, MAX_SIGNATURE_LENGTH,
-+	(void)snprintf((char *) spare->sig, MAX_SIGNATURE_LENGTH,
- 		 MPB_SIGNATURE MPB_VERSION_RAID0);
- 
- 	for (d = super->disks; d; d = d->next) {
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index b9f55841cb..9118baaf1a 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -9,24 +9,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
-           file://gcc-4.9.patch \
+           file://run-ptest \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
            file://mdadm-fix-ptest-build-errors.patch \
-           file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
-           file://run-ptest \
            file://0001-mdadm.h-Undefine-dprintf-before-redefining.patch \
-           file://0001-include-sys-sysmacros.h-for-major-minor-defintions.patch \
-           file://0005-Add-a-comment-to-indicate-valid-fallthrough.patch \
+           file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
-           file://0001-Disable-gcc8-warnings.patch \
+           file://0001-Compute-abs-diff-in-a-standard-compliant-way.patch \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
 
-CFLAGS += "-fno-strict-aliasing"
-inherit autotools-brokensep
+inherit autotools-brokensep ptest
+
+CFLAGS_append_toolchain-clang = " -Wno-error=address-of-packed-member"
 
-EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
 # prevents 64-bit userland from seeing this definition, instead defaulting
 # to u64 == long in userspace. Define __SANE_USERSPACE_TYPES__ to get
@@ -35,6 +32,8 @@ CFLAGS_append_powerpc64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS_append_mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
+EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
+
 do_compile() {
 	# Point to right sbindir
 	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" -e "s;UDEVDIR = /lib;UDEVDIR = $nonarch_base_libdir;" ${S}/Makefile
@@ -46,8 +45,6 @@ do_install() {
 	autotools_do_install
 }
 
-inherit ptest
-
 do_compile_ptest() {
 	oe_runmake test
 }
@@ -62,6 +59,7 @@ do_install_ptest() {
 		install -D -m 755 $prg ${D}${PTEST_PATH}/
 	done
 }
+
 RDEPENDS_${PN}-ptest += "bash"
 RRECOMMENDS_${PN}-ptest += " \
     coreutils \
-- 
2.19.2


