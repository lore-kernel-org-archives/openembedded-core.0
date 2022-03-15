Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5430C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 11:22:49 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.9399.1647343368043205708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 04:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=dF7mVCfi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647343366; i=@fujitsu.com;
	bh=pp70CLnzJzTPOKJmYhRe65DjopTyL7o6GFupGMfzqIE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=dF7mVCfiKga1aVjTP17nlFJAxjHDyREagLnRgvRAuPhdkPgWTrrhGgUU6wrHH7OmK
	 5XAu5vqSCq2k02zipxRT5KiuXilW31Le+gMY/KRSC0TJoaM7TjJq3Yk+0FElvQ6Bht
	 EVeoz3B4ptLD8qFmeLZFZRkJDM8hDgqKTLbT3QPFXIM0p3dtORL2RXeGfD9Ma01sA3
	 r/ctsdR3kQYqSY0m1Fli69k/VJZw2hiiH6vLuDPkjkKdeunM1xSFtzjBXzGFwTevw/
	 Wkr+GoLbGVHfPjuzIHpm4ExlfC6eZHtqGGXAgLdY+sA38TrhkRjwKYpExEWJN/yr1i
	 vPmGfY2jxY/Gw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSZe13CD
  J4PhXdYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPHyynMBW8DKvqONrA2MK5262Lk4hASeMwo
  8fz8BHYI5zyTxMFJkxghnBOMEh0N11i6GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwEpi78wVbCAlLAKqEitOeYCEeQWcJNbeXQFWIiGgIDHl4XtmiLigxMmZT1ggxqhKdB
  95ygRhy0s0b53NDFGvKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMArOQjJqFZNQsJKMWMDKvYrR
  NKspMzyjJTczM0TU0MNA1NDTVNbPUNTbWS6zSTdRLLdVNTs0rKUoEyuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGckqxq+IOxmt9P/UOMUpyMCmJ8rKIGCQJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCNLQXKCRalpqdWpGXmAKMKJi3BwaMkwvsSJM1bXJCYW5yZDpE6xajLsf/alb3MQix5+XmpUu
  K870GKBECKMkrz4EbAIvwSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFesTKgKTyZeSVwm14
  BHcEEdMQ8aT2QI0oSEVJSDUwdDCvi17Lvddm8t2yPrEOosxrzyvY0hs2q1rHSCfuzZF0ucAlU
  eM66cefy9OOfjis3rUru3a5wUVN3RnRBRMafG0JzYzT8OHjql9c6Sibuvd/G777i6NtLGkEqj
  LXF3HcWhhlPTipP8iz9WLi0o0E/+LjClYDLWatz72xw/ZEjL5I/k6M7q49prpmeAdeETQd+fn
  izZeIGMT/uyEeFJ3ekXJ1oUsfI9OHE86QzaWVMR4KiXsz2a77a/OyKyRyx+7M290/I91/6PTz
  F8FzWZM9/a84svcJQqeQ9wy6MXXXBWrOFOSs323qseX1K3KH5x5KuLSET553L9TflNTX7vF5p
  y8fd3VKhDlYrIyfveKrEUpyRaKjFXFScCACbKau+awMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-545.messagelabs.com!1647343365!12743!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13178 invoked from network); 15 Mar 2022 11:22:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 11:22:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 15C94100455
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:22:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 07BE2100354
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:22:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 11:22:32 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcgroup: upgrade 2.0 -> 2.0.1
Date: Tue, 15 Mar 2022 19:22:16 +0800
Message-ID: <1647343339-78926-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 11:22:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163234

module.patch
musl-decls-compat.patch
removed since they're included in 2.0.1

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Allow reading/writing from cgroup.* files in cgroup v2
- Add support for cgroup v2's cgroup.threads file
- Fix issue where libcgroup/pam wasn't working properly when
  cgrulesengd is disabled
- Fix a bug where the cgroup version wasn't initialized in a
  named cgroup v1 hierarchy
- Various automake bug fixes
- Build PAM module as unversioned DSO
- Fix build issues with musl libc
- Fix potential TOCTOU race in cgroup_get_procs()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgroup/libcgroup/module.patch          |  36 ---
 .../libcgroup/musl-decls-compat.patch         | 284 ------------------
 .../{libcgroup_2.0.bb =3D> libcgroup_2.0.1.bb}  |   6 +-
 3 files changed, 2 insertions(+), 324 deletions(-)
 delete mode 100644 meta/recipes-core/libcgroup/libcgroup/module.patch
 delete mode 100644 meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
 rename meta/recipes-core/libcgroup/{libcgroup_2.0.bb =3D> libcgroup_2.0.1.bb} (87%)

diff --git a/meta/recipes-core/libcgroup/libcgroup/module.patch b/meta/recipes-core/libcgroup/libcgroup/module.patch
deleted file mode 100644
index d8ff9b1479..0000000000
--- a/meta/recipes-core/libcgroup/libcgroup/module.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 76f0879056ce7e3f0123c277f2303954d0b6cead Mon Sep 17 00:00:00 2001
-From: =3D=3FUTF-8=3Fq=3FTomasz=3D20K=3DC5=3D82oczko=3F=3D <kloczek@github.com>
-Date: Wed, 12 May 2021 20:36:02 +0000
-Subject: [PATCH 2/2] automake: build PAM module as unversioned DSO
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-PAM modules should be build as unversioned DSO.
-Add -avoid-version to pam_cgroup_la_LDFLAGS
-
-Signed-off-by: Tomasz K=C5=82oczko <kloczek@github.com>
-Signed-off-by: Tom Hromatka <tom.hromatka@oracle.com>
----
- src/pam/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/pam/Makefile.am b/src/pam/Makefile.am
-index bd5a91d..4b0b2a9 100644
---- a/src/pam/Makefile.am
-+++ b/src/pam/Makefile.am
-@@ -4,7 +4,7 @@ if WITH_PAM
- 
- pamlib_LTLIBRARIES =3D pam_cgroup.la
- pam_cgroup_la_SOURCES =3D pam_cgroup.c
--pam_cgroup_la_LDFLAGS =3D -module
-+pam_cgroup_la_LDFLAGS =3D -module -avoid-version
- pam_cgroup_la_LIBADD =3D $(top_builddir)/src/libcgroup.la -lpam
- 
- endif
--- 
-2.32.0
-
diff --git a/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch b/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
deleted file mode 100644
index 531a562967..0000000000
--- a/meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
+++ /dev/null
@@ -1,284 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 26f2889113789c176273bd24fcd1592a8064c346 Mon Sep 17 00:00:00 2001
-From: "Anthony G. Basile" <blueness@gentoo.org>
-Date: Tue, 6 Jul 2021 07:54:47 -0600
-Subject: [PATCH 1/2] Replace __BEGIN_DECLS and __END_DECLS with extern "C".
-
-The macros __BEGIN_DECLS and __END_DECLS are a GNU-ism found in
-glibc and uClibc, but not musl.  We replace them by the more general
-extern "C" { ... } block exposed only if we have __cplusplus.
-
-Forward ported from a patch by Anthony G. Basile <blueness@gentoo.org>.
-
-Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
-Signed-off-by: Tom Hromatka <tom.hromatka@oracle.com>
----
- include/libcgroup/config.h    | 8 ++++++--
- include/libcgroup/error.h     | 8 ++++++--
- include/libcgroup/groups.h    | 8 ++++++--
- include/libcgroup/init.h      | 8 ++++++--
- include/libcgroup/iterators.h | 8 ++++++--
- include/libcgroup/log.h       | 8 ++++++--
- include/libcgroup/tasks.h     | 8 ++++++--
- src/bindings/libcgroup.p      | 8 --------
- src/daemon/cgrulesengd.h      | 8 ++++++--
- src/libcgroup-internal.h      | 8 ++++++--
- src/tools/tools-common.h      | 8 ++++++--
- 11 files changed, 60 insertions(+), 28 deletions(-)
-
-diff --git a/include/libcgroup/config.h b/include/libcgroup/config.h
-index 9aaa390..f835009 100644
---- a/include/libcgroup/config.h
-+++ b/include/libcgroup/config.h
-@@ -9,7 +9,9 @@
- #include <features.h>
- #endif
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /**
-  * @defgroup group_config 5. Configuration
-@@ -128,6 +130,8 @@ int cgroup_config_create_template_group(
-  * @}
-  * @}
-  */
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif /*_LIBCGROUP_CONFIG_H*/
-diff --git a/include/libcgroup/error.h b/include/libcgroup/error.h
-index 1dfdde9..14a6e16 100644
---- a/include/libcgroup/error.h
-+++ b/include/libcgroup/error.h
-@@ -9,7 +9,9 @@
- #include <features.h>
- #endif
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /**
-  * @defgroup group_errors 6. Error handling
-@@ -99,6 +101,8 @@ int cgroup_get_last_errno(void);
-  * @}
-  * @}
-  */
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif /* _LIBCGROUP_INIT_H */
-diff --git a/include/libcgroup/groups.h b/include/libcgroup/groups.h
-index 201558f..39ec3cd 100644
---- a/include/libcgroup/groups.h
-+++ b/include/libcgroup/groups.h
-@@ -11,7 +11,9 @@
- #include <stdbool.h>
- #endif
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /**
-  * Flags for cgroup_delete_cgroup_ext().
-@@ -587,6 +589,8 @@ char *cgroup_get_cgroup_name(struct cgroup *cgroup);
-  */
- 
- 
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif /* _LIBCGROUP_GROUPS_H */
-diff --git a/include/libcgroup/init.h b/include/libcgroup/init.h
-index 5150f2f..ea2dcc9 100644
---- a/include/libcgroup/init.h
-+++ b/include/libcgroup/init.h
-@@ -9,7 +9,9 @@
- #include <features.h>
- #endif
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /**
-  * @defgroup group_init 1. Initialization
-@@ -58,6 +60,8 @@ int cgroup_get_subsys_mount_point(const char *controller, char **mount_point);
-  * @}
-  * @}
-  */
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif /* _LIBCGROUP_INIT_H */
-diff --git a/include/libcgroup/iterators.h b/include/libcgroup/iterators.h
-index c6d453d..b3ba3af 100644
---- a/include/libcgroup/iterators.h
-+++ b/include/libcgroup/iterators.h
-@@ -11,7 +11,9 @@
- #include <features.h>
- #endif
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /**
-  * @defgroup group_iterators 3. Iterators
-@@ -423,6 +425,8 @@ int cgroup_get_subsys_mount_point_end(void **handle);
-  * @}
-  */
- 
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif /* _LIBCGROUP_ITERATORS_H */
-diff --git a/include/libcgroup/log.h b/include/libcgroup/log.h
-index 0dd03b4..f693473 100644
---- a/include/libcgroup/log.h
-+++ b/include/libcgroup/log.h
-@@ -11,7 +11,9 @@
- 
- #include <stdarg.h>
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /**
-  * @defgroup group_log 7. Logging
-@@ -142,6 +144,8 @@ extern int cgroup_parse_log_level_str(const char *levelstr);
-  * @}
-  * @}
-  */
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif /* _LIBCGROUP_LOG_H */
-diff --git a/include/libcgroup/tasks.h b/include/libcgroup/tasks.h
-index aad438a..8553c30 100644
---- a/include/libcgroup/tasks.h
-+++ b/include/libcgroup/tasks.h
-@@ -12,7 +12,9 @@
- #include <stdbool.h>
- #endif
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /** Flags for cgroup_change_cgroup_uid_gid(). */
- enum cgflags {
-@@ -204,6 +206,8 @@ int cgroup_register_unchanged_process(pid_t pid, int flags);
-  * @}
-  * @}
-  */
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif /* _LIBCGROUP_TASKS_H */
-diff --git a/src/daemon/cgrulesengd.h b/src/daemon/cgrulesengd.h
-index e273b4b..0b12076 100644
---- a/src/daemon/cgrulesengd.h
-+++ b/src/daemon/cgrulesengd.h
-@@ -17,7 +17,9 @@
- 
- #include <features.h>
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- #include "config.h"
- #include "libcgroup.h"
-@@ -119,7 +121,9 @@ void cgre_flash_templates(int signum);
-  */
- void cgre_catch_term(int signum);
- 
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif /* _CGRULESENGD_H */
- 
-diff --git a/src/libcgroup-internal.h b/src/libcgroup-internal.h
-index 1dfc92b..edc5abb 100644
---- a/src/libcgroup-internal.h
-+++ b/src/libcgroup-internal.h
-@@ -16,7 +16,9 @@
- 
- #define __LIBCG_INTERNAL
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- #include "config.h"
- #include <dirent.h>
-@@ -407,6 +409,8 @@ int cgroupv2_controller_enabled(const char * const cg_name,
- 
- #endif /* UNIT_TEST */
- 
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif
-diff --git a/src/tools/tools-common.h b/src/tools/tools-common.h
-index 292c408..e3541b1 100644
---- a/src/tools/tools-common.h
-+++ b/src/tools/tools-common.h
-@@ -18,7 +18,9 @@
- 
- #define __TOOLS_COMMON
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- #include "config.h"
- #include <libcgroup.h>
- #include "../libcgroup-internal.h"
-@@ -136,6 +138,8 @@ int parse_r_flag(const char * const program_name,
- 
- #endif /* UNIT_TEST */
- 
--__END_DECLS
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
- 
- #endif /* TOOLS_COMMON */
--- 
-2.32.0
-
diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.bb b/meta/recipes-core/libcgroup/libcgroup_2.0.1.bb
similarity index 87%
rename from meta/recipes-core/libcgroup/libcgroup_2.0.bb
rename to meta/recipes-core/libcgroup/libcgroup_2.0.1.bb
index cb0156d9d8..857a4e86fd 100644
--- a/meta/recipes-core/libcgroup/libcgroup_2.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_2.0.1.bb
@@ -11,11 +11,9 @@ inherit autotools pkgconfig
 
 DEPENDS =3D "bison-native flex-native"
 
-SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
-           file://musl-decls-compat.patch \
-           file://module.patch"
+SRC_URI =3D "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] =3D "11a2fbf0e42f46089f406b8b0dca7fef04aec2f21600b70e402c5db3661305d7"
+SRC_URI[sha256sum] =3D "2dd9c566a90a053e7a5f47607e225648ba7aa9bb7763514dd4778e2ed530fe90"
 UPSTREAM_CHECK_URI =3D "https://github.com/libcgroup/libcgroup/releases/"
 
 DEPENDS:append:libc-musl =3D " fts "
-- 
2.25.1


