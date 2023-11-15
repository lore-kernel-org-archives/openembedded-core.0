Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F28C5ACB8
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:16 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.14619.1700059029930698307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ayNBZX/k;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=if8b92bw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018bd36a300e-f86242ca-83dc-4f87-ace9-75811f871744-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ulWNNJpuDaJ9K1ostYDpGSlU+OvfeYtR5FVvH7SLOxE=;
	b=ayNBZX/k5XocaHeKthzyzXsIM6hn4keTOA5ZGtU62Mq2NUd5xoTEaqQ1M7QHdLoa
	cNXOhxJ+j6t6TVpQE/2T08wqvlO1B4stI2lVago2RhBzQ/o8/tL4spR42cCk5Ctx78n
	clacVk4qwthSDHhSmv10PCObdtrEkABm7XOeVUXg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ulWNNJpuDaJ9K1ostYDpGSlU+OvfeYtR5FVvH7SLOxE=;
	b=if8b92bwqWthOsLTxEmGiZrmjOyuGTmNv4i8sZ4uk9VSat4o+qygk6a8qx7RsbpE
	099smyFrd0C56A9JAxBlgkQROa7BYakn/4Awkfvp6amW2tR8UEGpuZ1MwkZIFZVn1oP
	nHpEdkKmWe8gw4mK4zrmNiTiIRd6IFgLXeY4MmzY=
Content-Type: multipart/mixed; boundary="===============3778693489542079714=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shared-mime-info: upgrading to 2.4 SUCCEEDED
Message-ID: <0101018bd36a300e-f86242ca-83dc-4f87-ace9-75811f871744-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190720

--===============3778693489542079714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shared-mime-info* to *2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shared-mime-info-upgrade-2.3-2.4.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 3cb8249c909b31ee8ea89f270f7509286a75be26 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 14:16:55 +0000
Subject: [PATCH] shared-mime-info: upgrade 2.3 -> 2.4

---
 .../0001-Fix-literal-as-per-c-11.patch        | 279 ------------------
 ...001-Fix-string-literal-concatenation.patch |  39 ---
 .../shared-mime-info/shared-mime-info_git.bb  |   9 +-
 3 files changed, 3 insertions(+), 324 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch
deleted file mode 100644
index 25f409c206..0000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-literal-as-per-c-11.patch
+++ /dev/null
@@ -1,279 +0,0 @@
-From 157c16b09f54741aefbc4be6a3507455f0378389 Mon Sep 17 00:00:00 2001
-From: Biswapriyo Nath <nathbappai@gmail.com>
-Date: Sun, 8 Oct 2023 13:26:43 +0000
-Subject: [PATCH] Fix missing sentinel warning with clang
-
-This fixes the compiler warnings similar as following.
-
-../src/update-mime-database.cpp:393:50: warning: missing sentinel in function call [-Wsentinel]
-  393 |                         g_strconcat(namespaceURI, " ", localName, NULL),
-      |                                                                       ^
-      |                                                                       , nullptr
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/commit/157c16b09f54741aefbc4be6a3507455f0378389]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/update-mime-database.cpp | 58 ++++++++++++++++++------------------
- 1 file changed, 29 insertions(+), 29 deletions(-)
-
---- a/src/update-mime-database.cpp
-+++ b/src/update-mime-database.cpp
-@@ -390,7 +390,7 @@ static void add_namespace(Type *type, co
- 	}
- 
- 	g_hash_table_insert(namespace_hash,
--			g_strconcat(namespaceURI, " ", localName, NULL),
-+			g_strconcat(namespaceURI, " ", localName, nullptr),
- 			type);
- }
- 
-@@ -1023,7 +1023,7 @@ static void write_out_type(gpointer key,
- 	char *lower;
- 
- 	lower = g_ascii_strdown(type->media, -1);
--	media = g_strconcat(mime_dir, "/", lower, NULL);
-+	media = g_strconcat(mime_dir, "/", lower, nullptr);
- 	g_free(lower);
- #ifdef _WIN32
- 	fs::create_directory(media);
-@@ -1032,7 +1032,7 @@ static void write_out_type(gpointer key,
- #endif
- 
- 	lower = g_ascii_strdown(type->subtype, -1);
--	filename = g_strconcat(media, "/", lower, ".xml.new", NULL);
-+	filename = g_strconcat(media, "/", lower, ".xml.new", nullptr);
- 	g_free(lower);
- 	g_free(media);
- 	media = NULL;
-@@ -1622,7 +1622,7 @@ static Magic *magic_new(xmlNode *node, T
- 			magic_free(magic);
- 			magic = NULL;
- 			(*error)->message = g_strconcat(
--				_("Error in <match> element: "), old, NULL);
-+				_("Error in <match> element: "), old, nullptr);
- 			g_free(old);
- 		} else if (magic->matches == NULL) {
- 			magic_free(magic);
-@@ -1843,7 +1843,7 @@ static TreeMagic *tree_magic_new(xmlNode
- 			tree_magic_free(magic);
- 			magic = NULL;
- 			(*error)->message = g_strconcat(
--				_("Error in <treematch> element: "), old, NULL);
-+				_("Error in <treematch> element: "), old, nullptr);
- 			g_free(old);
- 		}
- 	}
-@@ -1960,7 +1960,7 @@ static void delete_old_types(const gchar
- 
- 	for (i = 0; i < G_N_ELEMENTS(media_types); i++)
- 	{
--		const fs::path media_dir = g_strconcat(mime_dir, "/", media_types[i], NULL);
-+		const fs::path media_dir = g_strconcat(mime_dir, "/", media_types[i], nullptr);
- 
- 		if (!fs::is_directory(fs::status(media_dir)))
- 			continue;
-@@ -1973,13 +1973,13 @@ static void delete_old_types(const gchar
- 				continue;
- 
- 			char *type_name = g_strconcat(media_types[i], "/",
--						dir_entry.path().filename().string().c_str(), NULL);
-+						dir_entry.path().filename().string().c_str(), nullptr);
- 			type_name[strlen(type_name) - 4] = '\0';
- 			if (!g_hash_table_lookup(types, type_name))
- 			{
- 				char *path;
- 				path = g_strconcat(mime_dir, "/",
--						type_name, ".xml", NULL);
-+						type_name, ".xml", nullptr);
- #if 0
- 				g_warning("Removing old info for type %s",
- 						path);
-@@ -2002,7 +2002,7 @@ static void add_ns(gpointer key, gpointe
- 	Type *type = (Type *) value;
- 
- 	g_ptr_array_add(lines, g_strconcat(ns, " ", type->media,
--					   "/", type->subtype, "\n", NULL));
-+					   "/", type->subtype, "\n", nullptr));
- }
- 
- /* Write all the collected namespace rules to 'XMLnamespaces' */
-@@ -2038,7 +2038,7 @@ static void write_subclass(gpointer key,
- 
- 	for (l = list; l; l = l->next)
- 	{
--		line = g_strconcat (static_cast<const gchar *>(key), " ", l->data, "\n", NULL);
-+		line = g_strconcat (static_cast<const gchar *>(key), " ", l->data, "\n", nullptr);
- 		fwrite(line, 1, strlen(line), stream);
- 		g_free (line);
- 	}
-@@ -2061,7 +2061,7 @@ static void add_alias(gpointer key, gpoi
- 	
- 	g_ptr_array_add(lines, g_strconcat(alias, " ", type->media,
- 					   "/", type->subtype, "\n", 
--					   NULL));
-+					   nullptr));
- }
- 
- /* Write all the collected aliases */
-@@ -2092,7 +2092,7 @@ static void add_type(gpointer key, gpoin
- {
- 	GPtrArray *lines = (GPtrArray *) data;
- 	
--	g_ptr_array_add(lines, g_strconcat((char *)key, "\n", NULL));
-+	g_ptr_array_add(lines, g_strconcat((char *)key, "\n", nullptr));
- }
- 
- /* Write all the collected types */
-@@ -2127,7 +2127,7 @@ static void write_one_icon(gpointer key,
- 	FILE *stream = (FILE *)data;
- 	char *line;
- 
--	line = g_strconcat (mimetype, ":", iconname, "\n", NULL);
-+	line = g_strconcat (mimetype, ":", iconname, "\n", nullptr);
- 	fwrite(line, 1, strlen(line), stream);
- 	g_free (line);
- }
-@@ -2168,7 +2168,7 @@ static void check_in_path_xdg_data(const
- 		dirs[n] = g_strdup(env);
- 	else
- 		dirs[n] = g_build_filename(g_get_home_dir(), ".local",
--						"share", NULL);
-+						"share", nullptr);
- 	n++;
- 
- 	for (i = 0; i < n; i++)
-@@ -3588,7 +3588,7 @@ newest_mtime(const char *packagedir)
- 	while ((name = g_dir_read_name(dir))) {
- 		char *path;
- 
--		path = g_build_filename(packagedir, name, NULL);
-+		path = g_build_filename(packagedir, name, nullptr);
- 		retval = g_stat(path, &statbuf);
- 		g_free(path);
- 		if (retval < 0)
-@@ -3609,7 +3609,7 @@ is_cache_up_to_date (const char *mimedir
- 	char *mimeversion;
- 	int retval;
- 
--	mimeversion = g_build_filename(mimedir, "/version", NULL);
-+	mimeversion = g_build_filename(mimedir, "/version", nullptr);
- 	retval = g_stat(mimeversion, &version_stat);
- 	g_free(mimeversion);
- 	if (retval < 0)
-@@ -3694,7 +3694,7 @@ int main(int argc, char **argv)
- 		}
- 	}
- 
--	package_dir = g_strconcat(mime_dir, "/packages", NULL);
-+	package_dir = g_strconcat(mime_dir, "/packages", nullptr);
- 
- 	if (!fs::exists(mime_dir) && !fs::is_directory(fs::status(mime_dir)))
- 	{
-@@ -3747,7 +3747,7 @@ int main(int argc, char **argv)
- 
- 		g_hash_table_foreach(globs_hash, collect_glob2, &glob_list);
- 		glob_list = g_list_sort(glob_list, (GCompareFunc)compare_glob_by_weight);
--		globs_path = g_strconcat(mime_dir, "/globs.new", NULL);
-+		globs_path = g_strconcat(mime_dir, "/globs.new", nullptr);
- 		globs = fopen_gerror(globs_path, error);
- 		if (!globs)
- 			goto out;
-@@ -3761,7 +3761,7 @@ int main(int argc, char **argv)
- 			goto out;
- 		g_free(globs_path);
- 
--		globs_path = g_strconcat(mime_dir, "/globs2.new", NULL);
-+		globs_path = g_strconcat(mime_dir, "/globs2.new", nullptr);
- 		globs = fopen_gerror(globs_path, error);
- 		if (!globs)
- 			goto out;
-@@ -3782,7 +3782,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *magic_path;
- 		int i;
--		magic_path = g_strconcat(mime_dir, "/magic.new", NULL);
-+		magic_path = g_strconcat(mime_dir, "/magic.new", nullptr);
- 		stream = fopen_gerror(magic_path, error);
- 		if (!stream)
- 			goto out;
-@@ -3807,7 +3807,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *ns_path;
- 
--		ns_path = g_strconcat(mime_dir, "/XMLnamespaces.new", NULL);
-+		ns_path = g_strconcat(mime_dir, "/XMLnamespaces.new", nullptr);
- 		stream = fopen_gerror(ns_path, error);
- 		if (!stream)
- 			goto out;
-@@ -3823,7 +3823,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		
--		path = g_strconcat(mime_dir, "/subclasses.new", NULL);
-+		path = g_strconcat(mime_dir, "/subclasses.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3839,7 +3839,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		
--		path = g_strconcat(mime_dir, "/aliases.new", NULL);
-+		path = g_strconcat(mime_dir, "/aliases.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3855,7 +3855,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		
--		path = g_strconcat(mime_dir, "/types.new", NULL);
-+		path = g_strconcat(mime_dir, "/types.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3871,7 +3871,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *icon_path;
- 
--		icon_path = g_strconcat(mime_dir, "/generic-icons.new", NULL);
-+		icon_path = g_strconcat(mime_dir, "/generic-icons.new", nullptr);
- 		stream = fopen_gerror(icon_path, error);
- 		if (!stream)
- 			goto out;
-@@ -3887,7 +3887,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *icon_path;
- 
--		icon_path = g_strconcat(mime_dir, "/icons.new", NULL);
-+		icon_path = g_strconcat(mime_dir, "/icons.new", nullptr);
- 		stream = fopen_gerror(icon_path, error);
- 		if (!stream)
- 			goto out;
-@@ -3903,7 +3903,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		int i;
--		path = g_strconcat(mime_dir, "/treemagic.new", NULL);
-+		path = g_strconcat(mime_dir, "/treemagic.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3928,7 +3928,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 		
--		path = g_strconcat(mime_dir, "/mime.cache.new", NULL);
-+		path = g_strconcat(mime_dir, "/mime.cache.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
-@@ -3944,7 +3944,7 @@ int main(int argc, char **argv)
- 		FILE *stream;
- 		char *path;
- 
--		path = g_strconcat(mime_dir, "/version.new", NULL);
-+		path = g_strconcat(mime_dir, "/version.new", nullptr);
- 		stream = fopen_gerror(path, error);
- 		if (!stream)
- 			goto out;
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch
deleted file mode 100644
index 7825c39312..0000000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-string-literal-concatenation.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ccf704a606625bc62e70dbe815b309c22a0bda05 Mon Sep 17 00:00:00 2001
-From: Tobias Mayer <tobim@fastmail.fm>
-Date: Sun, 8 Oct 2023 00:11:49 +0200
-Subject: [PATCH] Fix string literal concatenation
-
-Clang is not able to disambiguate between multiple string literatals
-and C++11 user defined literals. Spaces help.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xdg/shared-mime-info/-/commit/12a3a6b1141c704fc594379af1808bb9008d588c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/update-mime-database.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/update-mime-database.cpp b/src/update-mime-database.cpp
-index 733ba06..29d82a9 100644
---- a/src/update-mime-database.cpp
-+++ b/src/update-mime-database.cpp
-@@ -2158,7 +2158,7 @@ static void check_in_path_xdg_data(const char *mime_path)
- 
- 	env = getenv("XDG_DATA_DIRS");
- 	if (!env)
--		env = "/usr/local/share/"PATH_SEPARATOR"/usr/share/";
-+		env = "/usr/local/share/" PATH_SEPARATOR "/usr/share/";
- 	dirs = g_strsplit(env, PATH_SEPARATOR, 0);
- 	g_return_if_fail(dirs != NULL);
- 	for (n = 0; dirs[n]; n++)
-@@ -2170,7 +2170,7 @@ static void check_in_path_xdg_data(const char *mime_path)
- 		dirs[n] = g_build_filename(g_get_home_dir(), ".local",
- 						"share", NULL);
- 	n++;
--	
-+
- 	for (i = 0; i < n; i++)
- 	{
- 		if (stat(dirs[i], &dir_info) == 0 &&
--- 
-2.42.0
-
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index cae0064333..937428221e 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -8,12 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
-SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
-           file://0001-Fix-string-literal-concatenation.patch \
-           file://0001-Fix-literal-as-per-c-11.patch \
-           "
-SRCREV = "8e80a317f5c61a7f410330abea441e0b0b9280b5"
-PV = "2.3"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
+SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
+PV = "2.4"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gettext python3native mime
-- 
2.39.2


--===============3778693489542079714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/shared-mime-info: SRC_URI changed from "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master file://0001-Fix-string-literal-concatenation.patch file://0001-Fix-literal-as-per-c-11.patch" to "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
packages/core2-64-poky-linux/shared-mime-info: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-data: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-data: PKGSIZE changed from 2459704 to 2470771 (+0%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-data: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-dbg: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-dbg: PKGSIZE changed from 697688 to 699800 (+0%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-dbg: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-dev: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-dev: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-doc: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-doc: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-af: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-af: PKGSIZE changed from 31803 to 31260 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-af: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ar: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ar: PKGSIZE changed from 46388 to 45663 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ar: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-as: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-as: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ast: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ast: PKGSIZE changed from 11006 to 10593 (-4%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ast: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-az: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-az: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-be+latin: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-be+latin: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-be: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-be: PKGSIZE changed from 50252 to 58585 (+17%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-be: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-bg: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-bg: PKGSIZE changed from 48300 to 47652 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-bg: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-bn-in: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-bn-in: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ca+valencia: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ca+valencia: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ca: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ca: PKGSIZE changed from 42281 to 41615 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ca: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-cs: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-cs: PKGSIZE changed from 37279 to 36683 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-cs: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-cy: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-cy: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-da: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-da: PKGSIZE changed from 40231 to 39599 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-da: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-de: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-de: PKGSIZE changed from 51057 to 52191 (+2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-de: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-el: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-el: PKGSIZE changed from 39876 to 39181 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-el: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-en-gb: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-en-gb: PKGSIZE changed from 42873 to 42175 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-en-gb: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-eo: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-eo: PKGSIZE changed from 19696 to 19606 (-0%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-eo: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-es: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-es: PKGSIZE changed from 54247 to 55893 (+3%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-es: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-et: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-et: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-eu: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-eu: PKGSIZE changed from 43046 to 48584 (+13%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-eu: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fa: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fa: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fi: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fi: PKGSIZE changed from 43319 to 42633 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fi: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fo: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fo: PKGSIZE changed from 27349 to 26842 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fo: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fr: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fr: PKGSIZE changed from 41327 to 40688 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fr: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fur: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fur: PKGSIZE changed from 36983 to 36428 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-fur: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ga: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ga: PKGSIZE changed from 37088 to 36490 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ga: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-gl: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-gl: PKGSIZE changed from 46257 to 45688 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-gl: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-gu: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-gu: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-he: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-he: PKGSIZE changed from 46156 to 45442 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-he: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-hi: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-hi: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-hr: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-hr: PKGSIZE changed from 44374 to 43687 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-hr: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-hu: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-hu: PKGSIZE changed from 41200 to 40531 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-hu: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ia: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ia: PKGSIZE changed from 33691 to 33147 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ia: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-id: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-id: PKGSIZE changed from 40358 to 39731 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-id: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-is: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-is: PKGSIZE changed from 40863 to 40237 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-is: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-it: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-it: PKGSIZE changed from 51911 to 51185 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-it: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ja: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ja: PKGSIZE changed from 48916 to 50279 (+3%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ja: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ka: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ka: PKGSIZE changed from 18484 to 18219 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ka: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-kk: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-kk: PKGSIZE changed from 50983 to 50126 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-kk: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-kn: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-kn: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ko: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ko: PKGSIZE changed from 45004 to 44311 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ko: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ky: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ky: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-lt: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-lt: PKGSIZE changed from 30850 to 30299 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-lt: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-lv: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-lv: PKGSIZE changed from 30603 to 30063 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-lv: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ml: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ml: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-mr: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-mr: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ms: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ms: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-nb: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-nb: PKGSIZE changed from 23982 to 23459 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-nb: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-nl: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-nl: PKGSIZE changed from 43939 to 43203 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-nl: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-nn: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-nn: PKGSIZE changed from 24579 to 24066 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-nn: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-oc: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-oc: PKGSIZE changed from 36827 to 36276 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-oc: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-or: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-or: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pa: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pa: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pl: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pl: PKGSIZE changed from 53042 to 54240 (+2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pl: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pt-br: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pt-br: PKGSIZE changed from 46197 to 46531 (+1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pt-br: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pt: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pt: PKGSIZE changed from 36335 to 35825 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-pt: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ro: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ro: PKGSIZE changed from 28233 to 27690 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ro: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ru: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ru: PKGSIZE changed from 51705 to 63213 (+22%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ru: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-rw: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-rw: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-si: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-si: PKGSIZE changed from 56160 to 55325 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-si: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sk: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sk: PKGSIZE changed from 39017 to 38467 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sk: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sl: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sl: PKGSIZE changed from 44544 to 43822 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sl: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sq: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sq: PKGSIZE changed from 38779 to 38751 (-0%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sq: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sr+latin: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sr+latin: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sr: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sr: PKGSIZE changed from 44864 to 44195 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sr: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sv: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sv: PKGSIZE changed from 50153 to 51291 (+2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-sv: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ta: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ta: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-te: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-te: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-th: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-th: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-tr: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-tr: PKGSIZE changed from 44801 to 43999 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-tr: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-uk: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-uk: PKGSIZE changed from 62357 to 63803 (+2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-uk: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-vi: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-vi: PKGSIZE changed from 27624 to 27098 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-vi: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-wa: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-wa: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-zh-cn: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-zh-cn: PKGSIZE changed from 42065 to 41389 (-2%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-zh-cn: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-zh-hk: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-zh-hk: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-zh-tw: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-zh-tw: PKGSIZE changed from 40127 to 39853 (-1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-zh-tw: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-src: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-src: PKGSIZE changed from 87251 to 87264 (+0%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-src: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-staticdev: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-staticdev: PKGV changed from 2.3 [default] to 2.4 [default]
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info: FILELIST: removed "/usr/share/mime/application/x-bzip-compressed-tar.xml /usr/share/mime/application/x-ms-dos-executable.xml /usr/share/mime/application/x-bzip.xml", added "/usr/share/mime/text/vbscript.encode.xml /usr/share/mime/application/x-bzip1.xml /usr/share/mime/application/x-dosexec.xml /usr/share/mime/application/json5.xml /usr/share/mime/text/x-vb.xml /usr/share/mime/application/x-powershell.xml /usr/share/mime/application/its+xml.xml /usr/share/mime/text/jscript.encode.xml /usr/share/mime/application/appinstaller.xml /usr/share/mime/application/vnd.cups-ppd.xml /usr/share/mime/application/wasm.xml /usr/share/mime/application/appx.xml /usr/share/mime/application/msix.xml /usr/share/mime/application/vnd.microsoft.portable-executable.xml /usr/share/mime/application/x-bzip1-compressed-tar.xml /usr/share/mime/application/msixbundle.xml /usr/share/mime/text/x-basic.xml /usr/share/mime/application/appxbundle.xml /usr
 /share/mime/application/x-ms-shortcut.xml /usr/share/mime/text/x-component.xml /usr/share/mime/application/x-msdownload.xml /usr/share/mime/application/x-ms-ne-executable.xml /usr/share/mime/chemical/x-pdb.xml"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info: PV changed from "2.3" to "2.4"
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info: PKGSIZE changed from 2823339 to 2845093 (+1%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info: PKGV changed from 2.3 [default] to 2.4 [default]
Changes to packages/core2-64-poky-linux/shared-mime-info (sysroot):
  /usr/share/mime/application/appinstaller.xml was added
  /usr/share/mime/application/appxbundle.xml was added
  /usr/share/mime/application/appx.xml was added
  /usr/share/mime/application/its+xml.xml was added
  /usr/share/mime/application/json5.xml was added
  /usr/share/mime/application/msixbundle.xml was added
  /usr/share/mime/application/msix.xml was added
  /usr/share/mime/application/vnd.cups-ppd.xml was added
  /usr/share/mime/application/vnd.microsoft.portable-executable.xml was added
  /usr/share/mime/application/wasm.xml was added
  /usr/share/mime/application/x-bzip1-compressed-tar.xml was added
  /usr/share/mime/application/x-bzip1.xml was added
  /usr/share/mime/application/x-dosexec.xml was added
  /usr/share/mime/application/x-msdownload.xml was added
  /usr/share/mime/application/x-ms-ne-executable.xml was added
  /usr/share/mime/application/x-ms-shortcut.xml was added
  /usr/share/mime/application/x-powershell.xml was added
  /usr/share/mime/chemical was added
  /usr/share/mime/chemical/x-pdb.xml was added
  /usr/share/mime/text/jscript.encode.xml was added
  /usr/share/mime/text/vbscript.encode.xml was added
  /usr/share/mime/text/x-basic.xml was added
  /usr/share/mime/text/x-component.xml was added
  /usr/share/mime/text/x-vb.xml was added
  /usr/share/mime/application/x-bzip-compressed-tar.xml was removed
  /usr/share/mime/application/x-bzip.xml was removed
  /usr/share/mime/application/x-ms-dos-executable.xml was removed
Changes to packages/x86_64-linux/shared-mime-info-native (sysroot):
  /usr/share/mime/application/appinstaller.xml was added
  /usr/share/mime/application/appxbundle.xml was added
  /usr/share/mime/application/appx.xml was added
  /usr/share/mime/application/its+xml.xml was added
  /usr/share/mime/application/json5.xml was added
  /usr/share/mime/application/msixbundle.xml was added
  /usr/share/mime/application/msix.xml was added
  /usr/share/mime/application/vnd.cups-ppd.xml was added
  /usr/share/mime/application/vnd.microsoft.portable-executable.xml was added
  /usr/share/mime/application/wasm.xml was added
  /usr/share/mime/application/x-bzip1-compressed-tar.xml was added
  /usr/share/mime/application/x-bzip1.xml was added
  /usr/share/mime/application/x-dosexec.xml was added
  /usr/share/mime/application/x-msdownload.xml was added
  /usr/share/mime/application/x-ms-ne-executable.xml was added
  /usr/share/mime/application/x-ms-shortcut.xml was added
  /usr/share/mime/application/x-powershell.xml was added
  /usr/share/mime/chemical was added
  /usr/share/mime/chemical/x-pdb.xml was added
  /usr/share/mime/text/jscript.encode.xml was added
  /usr/share/mime/text/vbscript.encode.xml was added
  /usr/share/mime/text/x-basic.xml was added
  /usr/share/mime/text/x-component.xml was added
  /usr/share/mime/text/x-vb.xml was added
  /usr/share/mime/application/x-bzip-compressed-tar.xml was removed
  /usr/share/mime/application/x-bzip.xml was removed
  /usr/share/mime/application/x-ms-dos-executable.xml was removed

--===============3778693489542079714==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shared-mime-info-upgrade-2.3-2.4.patch"

RnJvbSAzY2I4MjQ5YzkwOWIzMWVlOGVhODlmMjcwZjc1MDkyODZhNzViZTI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTQ6MTY6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFyZWQtbWltZS1pbmZvOiB1cGdyYWRlIDIuMyAtPiAyLjQKCi0tLQogLi4uLzAwMDEtRml4LWxp
dGVyYWwtYXMtcGVyLWMtMTEucGF0Y2ggICAgICAgIHwgMjc5IC0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uMDAxLUZpeC1zdHJpbmctbGl0ZXJhbC1jb25jYXRlbmF0aW9uLnBhdGNoIHwgIDM5IC0tLQog
Li4uL3NoYXJlZC1taW1lLWluZm8vc2hhcmVkLW1pbWUtaW5mb19naXQuYmIgIHwgICA5ICstCiAz
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMzI0IGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NoYXJlZC1taW1lLWluZm8vc2hhcmVk
LW1pbWUtaW5mby8wMDAxLUZpeC1saXRlcmFsLWFzLXBlci1jLTExLnBhdGNoCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2hhcmVkLW1pbWUtaW5mby9zaGFyZWQtbWlt
ZS1pbmZvLzAwMDEtRml4LXN0cmluZy1saXRlcmFsLWNvbmNhdGVuYXRpb24ucGF0Y2gKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zaGFyZWQtbWltZS1pbmZvL3NoYXJlZC1taW1l
LWluZm8vMDAwMS1GaXgtbGl0ZXJhbC1hcy1wZXItYy0xMS5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3NoYXJlZC1taW1lLWluZm8vc2hhcmVkLW1pbWUtaW5mby8wMDAxLUZpeC1saXRlcmFs
LWFzLXBlci1jLTExLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyNWY0MDlj
MjA2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NoYXJlZC1taW1lLWlu
Zm8vc2hhcmVkLW1pbWUtaW5mby8wMDAxLUZpeC1saXRlcmFsLWFzLXBlci1jLTExLnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsMjc5ICswLDAgQEAKLUZyb20gMTU3YzE2YjA5ZjU0NzQxYWVmYmM0
YmU2YTM1MDc0NTVmMDM3ODM4OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEJpc3dh
cHJpeW8gTmF0aCA8bmF0aGJhcHBhaUBnbWFpbC5jb20+Ci1EYXRlOiBTdW4sIDggT2N0IDIwMjMg
MTM6MjY6NDMgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4IG1pc3Npbmcgc2VudGluZWwgd2Fy
bmluZyB3aXRoIGNsYW5nCi0KLVRoaXMgZml4ZXMgdGhlIGNvbXBpbGVyIHdhcm5pbmdzIHNpbWls
YXIgYXMgZm9sbG93aW5nLgotCi0uLi9zcmMvdXBkYXRlLW1pbWUtZGF0YWJhc2UuY3BwOjM5Mzo1
MDogd2FybmluZzogbWlzc2luZyBzZW50aW5lbCBpbiBmdW5jdGlvbiBjYWxsIFstV3NlbnRpbmVs
XQotICAzOTMgfCAgICAgICAgICAgICAgICAgICAgICAgICBnX3N0cmNvbmNhdChuYW1lc3BhY2VV
UkksICIgIiwgbG9jYWxOYW1lLCBOVUxMKSwKLSAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KLSAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICwgbnVsbHB0cgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFto
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveGRnL3NoYXJlZC1taW1lLWluZm8vLS9jb21t
aXQvMTU3YzE2YjA5ZjU0NzQxYWVmYmM0YmU2YTM1MDc0NTVmMDM3ODM4OV0KLVNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBzcmMvdXBkYXRlLW1pbWUt
ZGF0YWJhc2UuY3BwIHwgNTggKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCi0g
MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQotCi0tLS0g
YS9zcmMvdXBkYXRlLW1pbWUtZGF0YWJhc2UuY3BwCi0rKysgYi9zcmMvdXBkYXRlLW1pbWUtZGF0
YWJhc2UuY3BwCi1AQCAtMzkwLDcgKzM5MCw3IEBAIHN0YXRpYyB2b2lkIGFkZF9uYW1lc3BhY2Uo
VHlwZSAqdHlwZSwgY28KLSAJfQotIAotIAlnX2hhc2hfdGFibGVfaW5zZXJ0KG5hbWVzcGFjZV9o
YXNoLAotLQkJCWdfc3RyY29uY2F0KG5hbWVzcGFjZVVSSSwgIiAiLCBsb2NhbE5hbWUsIE5VTEwp
LAotKwkJCWdfc3RyY29uY2F0KG5hbWVzcGFjZVVSSSwgIiAiLCBsb2NhbE5hbWUsIG51bGxwdHIp
LAotIAkJCXR5cGUpOwotIH0KLSAKLUBAIC0xMDIzLDcgKzEwMjMsNyBAQCBzdGF0aWMgdm9pZCB3
cml0ZV9vdXRfdHlwZShncG9pbnRlciBrZXksCi0gCWNoYXIgKmxvd2VyOwotIAotIAlsb3dlciA9
IGdfYXNjaWlfc3RyZG93bih0eXBlLT5tZWRpYSwgLTEpOwotLQltZWRpYSA9IGdfc3RyY29uY2F0
KG1pbWVfZGlyLCAiLyIsIGxvd2VyLCBOVUxMKTsKLSsJbWVkaWEgPSBnX3N0cmNvbmNhdChtaW1l
X2RpciwgIi8iLCBsb3dlciwgbnVsbHB0cik7Ci0gCWdfZnJlZShsb3dlcik7Ci0gI2lmZGVmIF9X
SU4zMgotIAlmczo6Y3JlYXRlX2RpcmVjdG9yeShtZWRpYSk7Ci1AQCAtMTAzMiw3ICsxMDMyLDcg
QEAgc3RhdGljIHZvaWQgd3JpdGVfb3V0X3R5cGUoZ3BvaW50ZXIga2V5LAotICNlbmRpZgotIAot
IAlsb3dlciA9IGdfYXNjaWlfc3RyZG93bih0eXBlLT5zdWJ0eXBlLCAtMSk7Ci0tCWZpbGVuYW1l
ID0gZ19zdHJjb25jYXQobWVkaWEsICIvIiwgbG93ZXIsICIueG1sLm5ldyIsIE5VTEwpOwotKwlm
aWxlbmFtZSA9IGdfc3RyY29uY2F0KG1lZGlhLCAiLyIsIGxvd2VyLCAiLnhtbC5uZXciLCBudWxs
cHRyKTsKLSAJZ19mcmVlKGxvd2VyKTsKLSAJZ19mcmVlKG1lZGlhKTsKLSAJbWVkaWEgPSBOVUxM
OwotQEAgLTE2MjIsNyArMTYyMiw3IEBAIHN0YXRpYyBNYWdpYyAqbWFnaWNfbmV3KHhtbE5vZGUg
Km5vZGUsIFQKLSAJCQltYWdpY19mcmVlKG1hZ2ljKTsKLSAJCQltYWdpYyA9IE5VTEw7Ci0gCQkJ
KCplcnJvciktPm1lc3NhZ2UgPSBnX3N0cmNvbmNhdCgKLS0JCQkJXygiRXJyb3IgaW4gPG1hdGNo
PiBlbGVtZW50OiAiKSwgb2xkLCBOVUxMKTsKLSsJCQkJXygiRXJyb3IgaW4gPG1hdGNoPiBlbGVt
ZW50OiAiKSwgb2xkLCBudWxscHRyKTsKLSAJCQlnX2ZyZWUob2xkKTsKLSAJCX0gZWxzZSBpZiAo
bWFnaWMtPm1hdGNoZXMgPT0gTlVMTCkgewotIAkJCW1hZ2ljX2ZyZWUobWFnaWMpOwotQEAgLTE4
NDMsNyArMTg0Myw3IEBAIHN0YXRpYyBUcmVlTWFnaWMgKnRyZWVfbWFnaWNfbmV3KHhtbE5vZGUK
LSAJCQl0cmVlX21hZ2ljX2ZyZWUobWFnaWMpOwotIAkJCW1hZ2ljID0gTlVMTDsKLSAJCQkoKmVy
cm9yKS0+bWVzc2FnZSA9IGdfc3RyY29uY2F0KAotLQkJCQlfKCJFcnJvciBpbiA8dHJlZW1hdGNo
PiBlbGVtZW50OiAiKSwgb2xkLCBOVUxMKTsKLSsJCQkJXygiRXJyb3IgaW4gPHRyZWVtYXRjaD4g
ZWxlbWVudDogIiksIG9sZCwgbnVsbHB0cik7Ci0gCQkJZ19mcmVlKG9sZCk7Ci0gCQl9Ci0gCX0K
LUBAIC0xOTYwLDcgKzE5NjAsNyBAQCBzdGF0aWMgdm9pZCBkZWxldGVfb2xkX3R5cGVzKGNvbnN0
IGdjaGFyCi0gCi0gCWZvciAoaSA9IDA7IGkgPCBHX05fRUxFTUVOVFMobWVkaWFfdHlwZXMpOyBp
KyspCi0gCXsKLS0JCWNvbnN0IGZzOjpwYXRoIG1lZGlhX2RpciA9IGdfc3RyY29uY2F0KG1pbWVf
ZGlyLCAiLyIsIG1lZGlhX3R5cGVzW2ldLCBOVUxMKTsKLSsJCWNvbnN0IGZzOjpwYXRoIG1lZGlh
X2RpciA9IGdfc3RyY29uY2F0KG1pbWVfZGlyLCAiLyIsIG1lZGlhX3R5cGVzW2ldLCBudWxscHRy
KTsKLSAKLSAJCWlmICghZnM6OmlzX2RpcmVjdG9yeShmczo6c3RhdHVzKG1lZGlhX2RpcikpKQot
IAkJCWNvbnRpbnVlOwotQEAgLTE5NzMsMTMgKzE5NzMsMTMgQEAgc3RhdGljIHZvaWQgZGVsZXRl
X29sZF90eXBlcyhjb25zdCBnY2hhcgotIAkJCQljb250aW51ZTsKLSAKLSAJCQljaGFyICp0eXBl
X25hbWUgPSBnX3N0cmNvbmNhdChtZWRpYV90eXBlc1tpXSwgIi8iLAotLQkJCQkJCWRpcl9lbnRy
eS5wYXRoKCkuZmlsZW5hbWUoKS5zdHJpbmcoKS5jX3N0cigpLCBOVUxMKTsKLSsJCQkJCQlkaXJf
ZW50cnkucGF0aCgpLmZpbGVuYW1lKCkuc3RyaW5nKCkuY19zdHIoKSwgbnVsbHB0cik7Ci0gCQkJ
dHlwZV9uYW1lW3N0cmxlbih0eXBlX25hbWUpIC0gNF0gPSAnXDAnOwotIAkJCWlmICghZ19oYXNo
X3RhYmxlX2xvb2t1cCh0eXBlcywgdHlwZV9uYW1lKSkKLSAJCQl7Ci0gCQkJCWNoYXIgKnBhdGg7
Ci0gCQkJCXBhdGggPSBnX3N0cmNvbmNhdChtaW1lX2RpciwgIi8iLAotLQkJCQkJCXR5cGVfbmFt
ZSwgIi54bWwiLCBOVUxMKTsKLSsJCQkJCQl0eXBlX25hbWUsICIueG1sIiwgbnVsbHB0cik7Ci0g
I2lmIDAKLSAJCQkJZ193YXJuaW5nKCJSZW1vdmluZyBvbGQgaW5mbyBmb3IgdHlwZSAlcyIsCi0g
CQkJCQkJcGF0aCk7Ci1AQCAtMjAwMiw3ICsyMDAyLDcgQEAgc3RhdGljIHZvaWQgYWRkX25zKGdw
b2ludGVyIGtleSwgZ3BvaW50ZQotIAlUeXBlICp0eXBlID0gKFR5cGUgKikgdmFsdWU7Ci0gCi0g
CWdfcHRyX2FycmF5X2FkZChsaW5lcywgZ19zdHJjb25jYXQobnMsICIgIiwgdHlwZS0+bWVkaWEs
Ci0tCQkJCQkgICAiLyIsIHR5cGUtPnN1YnR5cGUsICJcbiIsIE5VTEwpKTsKLSsJCQkJCSAgICIv
IiwgdHlwZS0+c3VidHlwZSwgIlxuIiwgbnVsbHB0cikpOwotIH0KLSAKLSAvKiBXcml0ZSBhbGwg
dGhlIGNvbGxlY3RlZCBuYW1lc3BhY2UgcnVsZXMgdG8gJ1hNTG5hbWVzcGFjZXMnICovCi1AQCAt
MjAzOCw3ICsyMDM4LDcgQEAgc3RhdGljIHZvaWQgd3JpdGVfc3ViY2xhc3MoZ3BvaW50ZXIga2V5
LAotIAotIAlmb3IgKGwgPSBsaXN0OyBsOyBsID0gbC0+bmV4dCkKLSAJewotLQkJbGluZSA9IGdf
c3RyY29uY2F0IChzdGF0aWNfY2FzdDxjb25zdCBnY2hhciAqPihrZXkpLCAiICIsIGwtPmRhdGEs
ICJcbiIsIE5VTEwpOwotKwkJbGluZSA9IGdfc3RyY29uY2F0IChzdGF0aWNfY2FzdDxjb25zdCBn
Y2hhciAqPihrZXkpLCAiICIsIGwtPmRhdGEsICJcbiIsIG51bGxwdHIpOwotIAkJZndyaXRlKGxp
bmUsIDEsIHN0cmxlbihsaW5lKSwgc3RyZWFtKTsKLSAJCWdfZnJlZSAobGluZSk7Ci0gCX0KLUBA
IC0yMDYxLDcgKzIwNjEsNyBAQCBzdGF0aWMgdm9pZCBhZGRfYWxpYXMoZ3BvaW50ZXIga2V5LCBn
cG9pCi0gCQotIAlnX3B0cl9hcnJheV9hZGQobGluZXMsIGdfc3RyY29uY2F0KGFsaWFzLCAiICIs
IHR5cGUtPm1lZGlhLAotIAkJCQkJICAgIi8iLCB0eXBlLT5zdWJ0eXBlLCAiXG4iLCAKLS0JCQkJ
CSAgIE5VTEwpKTsKLSsJCQkJCSAgIG51bGxwdHIpKTsKLSB9Ci0gCi0gLyogV3JpdGUgYWxsIHRo
ZSBjb2xsZWN0ZWQgYWxpYXNlcyAqLwotQEAgLTIwOTIsNyArMjA5Miw3IEBAIHN0YXRpYyB2b2lk
IGFkZF90eXBlKGdwb2ludGVyIGtleSwgZ3BvaW4KLSB7Ci0gCUdQdHJBcnJheSAqbGluZXMgPSAo
R1B0ckFycmF5ICopIGRhdGE7Ci0gCQotLQlnX3B0cl9hcnJheV9hZGQobGluZXMsIGdfc3RyY29u
Y2F0KChjaGFyICopa2V5LCAiXG4iLCBOVUxMKSk7Ci0rCWdfcHRyX2FycmF5X2FkZChsaW5lcywg
Z19zdHJjb25jYXQoKGNoYXIgKilrZXksICJcbiIsIG51bGxwdHIpKTsKLSB9Ci0gCi0gLyogV3Jp
dGUgYWxsIHRoZSBjb2xsZWN0ZWQgdHlwZXMgKi8KLUBAIC0yMTI3LDcgKzIxMjcsNyBAQCBzdGF0
aWMgdm9pZCB3cml0ZV9vbmVfaWNvbihncG9pbnRlciBrZXksCi0gCUZJTEUgKnN0cmVhbSA9IChG
SUxFICopZGF0YTsKLSAJY2hhciAqbGluZTsKLSAKLS0JbGluZSA9IGdfc3RyY29uY2F0IChtaW1l
dHlwZSwgIjoiLCBpY29ubmFtZSwgIlxuIiwgTlVMTCk7Ci0rCWxpbmUgPSBnX3N0cmNvbmNhdCAo
bWltZXR5cGUsICI6IiwgaWNvbm5hbWUsICJcbiIsIG51bGxwdHIpOwotIAlmd3JpdGUobGluZSwg
MSwgc3RybGVuKGxpbmUpLCBzdHJlYW0pOwotIAlnX2ZyZWUgKGxpbmUpOwotIH0KLUBAIC0yMTY4
LDcgKzIxNjgsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19pbl9wYXRoX3hkZ19kYXRhKGNvbnN0Ci0g
CQlkaXJzW25dID0gZ19zdHJkdXAoZW52KTsKLSAJZWxzZQotIAkJZGlyc1tuXSA9IGdfYnVpbGRf
ZmlsZW5hbWUoZ19nZXRfaG9tZV9kaXIoKSwgIi5sb2NhbCIsCi0tCQkJCQkJInNoYXJlIiwgTlVM
TCk7Ci0rCQkJCQkJInNoYXJlIiwgbnVsbHB0cik7Ci0gCW4rKzsKLSAKLSAJZm9yIChpID0gMDsg
aSA8IG47IGkrKykKLUBAIC0zNTg4LDcgKzM1ODgsNyBAQCBuZXdlc3RfbXRpbWUoY29uc3QgY2hh
ciAqcGFja2FnZWRpcikKLSAJd2hpbGUgKChuYW1lID0gZ19kaXJfcmVhZF9uYW1lKGRpcikpKSB7
Ci0gCQljaGFyICpwYXRoOwotIAotLQkJcGF0aCA9IGdfYnVpbGRfZmlsZW5hbWUocGFja2FnZWRp
ciwgbmFtZSwgTlVMTCk7Ci0rCQlwYXRoID0gZ19idWlsZF9maWxlbmFtZShwYWNrYWdlZGlyLCBu
YW1lLCBudWxscHRyKTsKLSAJCXJldHZhbCA9IGdfc3RhdChwYXRoLCAmc3RhdGJ1Zik7Ci0gCQln
X2ZyZWUocGF0aCk7Ci0gCQlpZiAocmV0dmFsIDwgMCkKLUBAIC0zNjA5LDcgKzM2MDksNyBAQCBp
c19jYWNoZV91cF90b19kYXRlIChjb25zdCBjaGFyICptaW1lZGlyCi0gCWNoYXIgKm1pbWV2ZXJz
aW9uOwotIAlpbnQgcmV0dmFsOwotIAotLQltaW1ldmVyc2lvbiA9IGdfYnVpbGRfZmlsZW5hbWUo
bWltZWRpciwgIi92ZXJzaW9uIiwgTlVMTCk7Ci0rCW1pbWV2ZXJzaW9uID0gZ19idWlsZF9maWxl
bmFtZShtaW1lZGlyLCAiL3ZlcnNpb24iLCBudWxscHRyKTsKLSAJcmV0dmFsID0gZ19zdGF0KG1p
bWV2ZXJzaW9uLCAmdmVyc2lvbl9zdGF0KTsKLSAJZ19mcmVlKG1pbWV2ZXJzaW9uKTsKLSAJaWYg
KHJldHZhbCA8IDApCi1AQCAtMzY5NCw3ICszNjk0LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQotIAkJfQotIAl9Ci0gCi0tCXBhY2thZ2VfZGlyID0gZ19zdHJjb25jYXQobWlt
ZV9kaXIsICIvcGFja2FnZXMiLCBOVUxMKTsKLSsJcGFja2FnZV9kaXIgPSBnX3N0cmNvbmNhdCht
aW1lX2RpciwgIi9wYWNrYWdlcyIsIG51bGxwdHIpOwotIAotIAlpZiAoIWZzOjpleGlzdHMobWlt
ZV9kaXIpICYmICFmczo6aXNfZGlyZWN0b3J5KGZzOjpzdGF0dXMobWltZV9kaXIpKSkKLSAJewot
QEAgLTM3NDcsNyArMzc0Nyw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKLSAK
LSAJCWdfaGFzaF90YWJsZV9mb3JlYWNoKGdsb2JzX2hhc2gsIGNvbGxlY3RfZ2xvYjIsICZnbG9i
X2xpc3QpOwotIAkJZ2xvYl9saXN0ID0gZ19saXN0X3NvcnQoZ2xvYl9saXN0LCAoR0NvbXBhcmVG
dW5jKWNvbXBhcmVfZ2xvYl9ieV93ZWlnaHQpOwotLQkJZ2xvYnNfcGF0aCA9IGdfc3RyY29uY2F0
KG1pbWVfZGlyLCAiL2dsb2JzLm5ldyIsIE5VTEwpOwotKwkJZ2xvYnNfcGF0aCA9IGdfc3RyY29u
Y2F0KG1pbWVfZGlyLCAiL2dsb2JzLm5ldyIsIG51bGxwdHIpOwotIAkJZ2xvYnMgPSBmb3Blbl9n
ZXJyb3IoZ2xvYnNfcGF0aCwgZXJyb3IpOwotIAkJaWYgKCFnbG9icykKLSAJCQlnb3RvIG91dDsK
LUBAIC0zNzYxLDcgKzM3NjEsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCi0g
CQkJZ290byBvdXQ7Ci0gCQlnX2ZyZWUoZ2xvYnNfcGF0aCk7Ci0gCi0tCQlnbG9ic19wYXRoID0g
Z19zdHJjb25jYXQobWltZV9kaXIsICIvZ2xvYnMyLm5ldyIsIE5VTEwpOwotKwkJZ2xvYnNfcGF0
aCA9IGdfc3RyY29uY2F0KG1pbWVfZGlyLCAiL2dsb2JzMi5uZXciLCBudWxscHRyKTsKLSAJCWds
b2JzID0gZm9wZW5fZ2Vycm9yKGdsb2JzX3BhdGgsIGVycm9yKTsKLSAJCWlmICghZ2xvYnMpCi0g
CQkJZ290byBvdXQ7Ci1AQCAtMzc4Miw3ICszNzgyLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQotIAkJRklMRSAqc3RyZWFtOwotIAkJY2hhciAqbWFnaWNfcGF0aDsKLSAJCWlu
dCBpOwotLQkJbWFnaWNfcGF0aCA9IGdfc3RyY29uY2F0KG1pbWVfZGlyLCAiL21hZ2ljLm5ldyIs
IE5VTEwpOwotKwkJbWFnaWNfcGF0aCA9IGdfc3RyY29uY2F0KG1pbWVfZGlyLCAiL21hZ2ljLm5l
dyIsIG51bGxwdHIpOwotIAkJc3RyZWFtID0gZm9wZW5fZ2Vycm9yKG1hZ2ljX3BhdGgsIGVycm9y
KTsKLSAJCWlmICghc3RyZWFtKQotIAkJCWdvdG8gb3V0OwotQEAgLTM4MDcsNyArMzgwNyw3IEBA
IGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKLSAJCUZJTEUgKnN0cmVhbTsKLSAJCWNo
YXIgKm5zX3BhdGg7Ci0gCi0tCQluc19wYXRoID0gZ19zdHJjb25jYXQobWltZV9kaXIsICIvWE1M
bmFtZXNwYWNlcy5uZXciLCBOVUxMKTsKLSsJCW5zX3BhdGggPSBnX3N0cmNvbmNhdChtaW1lX2Rp
ciwgIi9YTUxuYW1lc3BhY2VzLm5ldyIsIG51bGxwdHIpOwotIAkJc3RyZWFtID0gZm9wZW5fZ2Vy
cm9yKG5zX3BhdGgsIGVycm9yKTsKLSAJCWlmICghc3RyZWFtKQotIAkJCWdvdG8gb3V0OwotQEAg
LTM4MjMsNyArMzgyMyw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKLSAJCUZJ
TEUgKnN0cmVhbTsKLSAJCWNoYXIgKnBhdGg7Ci0gCQkKLS0JCXBhdGggPSBnX3N0cmNvbmNhdCht
aW1lX2RpciwgIi9zdWJjbGFzc2VzLm5ldyIsIE5VTEwpOwotKwkJcGF0aCA9IGdfc3RyY29uY2F0
KG1pbWVfZGlyLCAiL3N1YmNsYXNzZXMubmV3IiwgbnVsbHB0cik7Ci0gCQlzdHJlYW0gPSBmb3Bl
bl9nZXJyb3IocGF0aCwgZXJyb3IpOwotIAkJaWYgKCFzdHJlYW0pCi0gCQkJZ290byBvdXQ7Ci1A
QCAtMzgzOSw3ICszODM5LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQotIAkJ
RklMRSAqc3RyZWFtOwotIAkJY2hhciAqcGF0aDsKLSAJCQotLQkJcGF0aCA9IGdfc3RyY29uY2F0
KG1pbWVfZGlyLCAiL2FsaWFzZXMubmV3IiwgTlVMTCk7Ci0rCQlwYXRoID0gZ19zdHJjb25jYXQo
bWltZV9kaXIsICIvYWxpYXNlcy5uZXciLCBudWxscHRyKTsKLSAJCXN0cmVhbSA9IGZvcGVuX2dl
cnJvcihwYXRoLCBlcnJvcik7Ci0gCQlpZiAoIXN0cmVhbSkKLSAJCQlnb3RvIG91dDsKLUBAIC0z
ODU1LDcgKzM4NTUsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCi0gCQlGSUxF
ICpzdHJlYW07Ci0gCQljaGFyICpwYXRoOwotIAkJCi0tCQlwYXRoID0gZ19zdHJjb25jYXQobWlt
ZV9kaXIsICIvdHlwZXMubmV3IiwgTlVMTCk7Ci0rCQlwYXRoID0gZ19zdHJjb25jYXQobWltZV9k
aXIsICIvdHlwZXMubmV3IiwgbnVsbHB0cik7Ci0gCQlzdHJlYW0gPSBmb3Blbl9nZXJyb3IocGF0
aCwgZXJyb3IpOwotIAkJaWYgKCFzdHJlYW0pCi0gCQkJZ290byBvdXQ7Ci1AQCAtMzg3MSw3ICsz
ODcxLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQotIAkJRklMRSAqc3RyZWFt
OwotIAkJY2hhciAqaWNvbl9wYXRoOwotIAotLQkJaWNvbl9wYXRoID0gZ19zdHJjb25jYXQobWlt
ZV9kaXIsICIvZ2VuZXJpYy1pY29ucy5uZXciLCBOVUxMKTsKLSsJCWljb25fcGF0aCA9IGdfc3Ry
Y29uY2F0KG1pbWVfZGlyLCAiL2dlbmVyaWMtaWNvbnMubmV3IiwgbnVsbHB0cik7Ci0gCQlzdHJl
YW0gPSBmb3Blbl9nZXJyb3IoaWNvbl9wYXRoLCBlcnJvcik7Ci0gCQlpZiAoIXN0cmVhbSkKLSAJ
CQlnb3RvIG91dDsKLUBAIC0zODg3LDcgKzM4ODcsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqKmFyZ3YpCi0gCQlGSUxFICpzdHJlYW07Ci0gCQljaGFyICppY29uX3BhdGg7Ci0gCi0tCQlp
Y29uX3BhdGggPSBnX3N0cmNvbmNhdChtaW1lX2RpciwgIi9pY29ucy5uZXciLCBOVUxMKTsKLSsJ
CWljb25fcGF0aCA9IGdfc3RyY29uY2F0KG1pbWVfZGlyLCAiL2ljb25zLm5ldyIsIG51bGxwdHIp
OwotIAkJc3RyZWFtID0gZm9wZW5fZ2Vycm9yKGljb25fcGF0aCwgZXJyb3IpOwotIAkJaWYgKCFz
dHJlYW0pCi0gCQkJZ290byBvdXQ7Ci1AQCAtMzkwMyw3ICszOTAzLDcgQEAgaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKiphcmd2KQotIAkJRklMRSAqc3RyZWFtOwotIAkJY2hhciAqcGF0aDsKLSAJ
CWludCBpOwotLQkJcGF0aCA9IGdfc3RyY29uY2F0KG1pbWVfZGlyLCAiL3RyZWVtYWdpYy5uZXci
LCBOVUxMKTsKLSsJCXBhdGggPSBnX3N0cmNvbmNhdChtaW1lX2RpciwgIi90cmVlbWFnaWMubmV3
IiwgbnVsbHB0cik7Ci0gCQlzdHJlYW0gPSBmb3Blbl9nZXJyb3IocGF0aCwgZXJyb3IpOwotIAkJ
aWYgKCFzdHJlYW0pCi0gCQkJZ290byBvdXQ7Ci1AQCAtMzkyOCw3ICszOTI4LDcgQEAgaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQotIAkJRklMRSAqc3RyZWFtOwotIAkJY2hhciAqcGF0
aDsKLSAJCQotLQkJcGF0aCA9IGdfc3RyY29uY2F0KG1pbWVfZGlyLCAiL21pbWUuY2FjaGUubmV3
IiwgTlVMTCk7Ci0rCQlwYXRoID0gZ19zdHJjb25jYXQobWltZV9kaXIsICIvbWltZS5jYWNoZS5u
ZXciLCBudWxscHRyKTsKLSAJCXN0cmVhbSA9IGZvcGVuX2dlcnJvcihwYXRoLCBlcnJvcik7Ci0g
CQlpZiAoIXN0cmVhbSkKLSAJCQlnb3RvIG91dDsKLUBAIC0zOTQ0LDcgKzM5NDQsNyBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCi0gCQlGSUxFICpzdHJlYW07Ci0gCQljaGFyICpw
YXRoOwotIAotLQkJcGF0aCA9IGdfc3RyY29uY2F0KG1pbWVfZGlyLCAiL3ZlcnNpb24ubmV3Iiwg
TlVMTCk7Ci0rCQlwYXRoID0gZ19zdHJjb25jYXQobWltZV9kaXIsICIvdmVyc2lvbi5uZXciLCBu
dWxscHRyKTsKLSAJCXN0cmVhbSA9IGZvcGVuX2dlcnJvcihwYXRoLCBlcnJvcik7Ci0gCQlpZiAo
IXN0cmVhbSkKLSAJCQlnb3RvIG91dDsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L3NoYXJlZC1taW1lLWluZm8vc2hhcmVkLW1pbWUtaW5mby8wMDAxLUZpeC1zdHJpbmctbGl0ZXJh
bC1jb25jYXRlbmF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2hhcmVkLW1pbWUt
aW5mby9zaGFyZWQtbWltZS1pbmZvLzAwMDEtRml4LXN0cmluZy1saXRlcmFsLWNvbmNhdGVuYXRp
b24ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDc4MjVjMzkzMTIuLjAwMDAw
MDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2hhcmVkLW1pbWUtaW5mby9zaGFyZWQt
bWltZS1pbmZvLzAwMDEtRml4LXN0cmluZy1saXRlcmFsLWNvbmNhdGVuYXRpb24ucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSwzOSArMCwwIEBACi1Gcm9tIGNjZjcwNGE2MDY2MjViYzYyZTcwZGJl
ODE1YjMwOWMyMmEwYmRhMDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBUb2JpYXMg
TWF5ZXIgPHRvYmltQGZhc3RtYWlsLmZtPgotRGF0ZTogU3VuLCA4IE9jdCAyMDIzIDAwOjExOjQ5
ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIEZpeCBzdHJpbmcgbGl0ZXJhbCBjb25jYXRlbmF0aW9u
Ci0KLUNsYW5nIGlzIG5vdCBhYmxlIHRvIGRpc2FtYmlndWF0ZSBiZXR3ZWVuIG11bHRpcGxlIHN0
cmluZyBsaXRlcmF0YWxzCi1hbmQgQysrMTEgdXNlciBkZWZpbmVkIGxpdGVyYWxzLiBTcGFjZXMg
aGVscC4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL3hkZy9zaGFyZWQtbWltZS1pbmZvLy0vY29tbWl0LzEyYTNhNmIxMTQxYzcwNGZj
NTk0Mzc5YWYxODA4YmI5MDA4ZDU4OGNdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgotLS0tCi0gc3JjL3VwZGF0ZS1taW1lLWRhdGFiYXNlLmNwcCB8IDQgKyst
LQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRp
ZmYgLS1naXQgYS9zcmMvdXBkYXRlLW1pbWUtZGF0YWJhc2UuY3BwIGIvc3JjL3VwZGF0ZS1taW1l
LWRhdGFiYXNlLmNwcAotaW5kZXggNzMzYmEwNi4uMjlkODJhOSAxMDA2NDQKLS0tLSBhL3NyYy91
cGRhdGUtbWltZS1kYXRhYmFzZS5jcHAKLSsrKyBiL3NyYy91cGRhdGUtbWltZS1kYXRhYmFzZS5j
cHAKLUBAIC0yMTU4LDcgKzIxNTgsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19pbl9wYXRoX3hkZ19k
YXRhKGNvbnN0IGNoYXIgKm1pbWVfcGF0aCkKLSAKLSAJZW52ID0gZ2V0ZW52KCJYREdfREFUQV9E
SVJTIik7Ci0gCWlmICghZW52KQotLQkJZW52ID0gIi91c3IvbG9jYWwvc2hhcmUvIlBBVEhfU0VQ
QVJBVE9SIi91c3Ivc2hhcmUvIjsKLSsJCWVudiA9ICIvdXNyL2xvY2FsL3NoYXJlLyIgUEFUSF9T
RVBBUkFUT1IgIi91c3Ivc2hhcmUvIjsKLSAJZGlycyA9IGdfc3Ryc3BsaXQoZW52LCBQQVRIX1NF
UEFSQVRPUiwgMCk7Ci0gCWdfcmV0dXJuX2lmX2ZhaWwoZGlycyAhPSBOVUxMKTsKLSAJZm9yIChu
ID0gMDsgZGlyc1tuXTsgbisrKQotQEAgLTIxNzAsNyArMjE3MCw3IEBAIHN0YXRpYyB2b2lkIGNo
ZWNrX2luX3BhdGhfeGRnX2RhdGEoY29uc3QgY2hhciAqbWltZV9wYXRoKQotIAkJZGlyc1tuXSA9
IGdfYnVpbGRfZmlsZW5hbWUoZ19nZXRfaG9tZV9kaXIoKSwgIi5sb2NhbCIsCi0gCQkJCQkJInNo
YXJlIiwgTlVMTCk7Ci0gCW4rKzsKLS0JCi0rCi0gCWZvciAoaSA9IDA7IGkgPCBuOyBpKyspCi0g
CXsKLSAJCWlmIChzdGF0KGRpcnNbaV0sICZkaXJfaW5mbykgPT0gMCAmJgotLS0gCi0yLjQyLjAK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2hhcmVkLW1pbWUtaW5mby9zaGFy
ZWQtbWltZS1pbmZvX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NoYXJlZC1taW1lLWlu
Zm8vc2hhcmVkLW1pbWUtaW5mb19naXQuYmIKaW5kZXggY2FlMDA2NDMzMy4uOTM3NDI4MjIxZSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2hhcmVkLW1pbWUtaW5mby9zaGFyZWQt
bWltZS1pbmZvX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zaGFyZWQtbWltZS1p
bmZvL3NoYXJlZC1taW1lLWluZm9fZ2l0LmJiCkBAIC04LDEyICs4LDkgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQy
NjMiCiAKIERFUEVORFMgPSAibGlieG1sMiBpdHN0b29sLW5hdGl2ZSBnbGliLTIuMCBzaGFyZWQt
bWltZS1pbmZvLW5hdGl2ZSB4bWx0by1uYXRpdmUiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy94ZGcvc2hhcmVkLW1pbWUtaW5mby5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1hc3RlciBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLUZpeC1zdHJpbmctbGl0ZXJh
bC1jb25jYXRlbmF0aW9uLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtRml4LWxpdGVy
YWwtYXMtcGVyLWMtMTEucGF0Y2ggXAotICAgICAgICAgICAiCi1TUkNSRVYgPSAiOGU4MGEzMTdm
NWM2MWE3ZjQxMDMzMGFiZWE0NDFlMGIwYjkyODBiNSIKLVBWID0gIjIuMyIKK1NSQ19VUkkgPSAi
Z2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94ZGcvc2hhcmVkLW1pbWUtaW5mby5naXQ7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKK1NSQ1JFViA9ICI5YTZkNmI4ZTk2MzkzNWYxNDVm
M2ExZWY0NDY1NTJkZTY5OTZkYWRhIgorUFYgPSAiMi40IgogUyA9ICIke1dPUktESVJ9L2dpdCIK
IAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgZ2V0dGV4dCBweXRob24zbmF0aXZlIG1pbWUKLS0g
CjIuMzkuMgoK

--===============3778693489542079714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-be: PKGSIZE changed from 50252 to 58585 (+17%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-eu: PKGSIZE changed from 43046 to 48584 (+13%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info-locale-ru: PKGSIZE changed from 51705 to 63213 (+22%)
packages/core2-64-poky-linux/shared-mime-info/shared-mime-info: FILELIST: removed "/usr/share/mime/application/x-ms-dos-executable.xml /usr/share/mime/application/x-bzip.xml /usr/share/mime/application/x-bzip-compressed-tar.xml", added "/usr/share/mime/application/x-ms-ne-executable.xml /usr/share/mime/application/appinstaller.xml /usr/share/mime/text/vbscript.encode.xml /usr/share/mime/application/its+xml.xml /usr/share/mime/application/appxbundle.xml /usr/share/mime/application/msixbundle.xml /usr/share/mime/text/x-component.xml /usr/share/mime/application/x-bzip1-compressed-tar.xml /usr/share/mime/text/x-basic.xml /usr/share/mime/application/vnd.microsoft.portable-executable.xml /usr/share/mime/application/x-bzip1.xml /usr/share/mime/application/x-ms-shortcut.xml /usr/share/mime/application/msix.xml /usr/share/mime/application/wasm.xml /usr/share/mime/application/appx.xml /usr/share/mime/text/jscript.encode.xml /usr/share/mime/application/vnd.cups-ppd.xml /usr/share/mime/applicati
 on/x-powershell.xml /usr/share/mime/application/json5.xml /usr/share/mime/application/x-msdownload.xml /usr/share/mime/chemical/x-pdb.xml /usr/share/mime/text/x-vb.xml /usr/share/mime/application/x-dosexec.xml"
Changes to packages/core2-64-poky-linux/shared-mime-info (sysroot):
  /usr/share/mime/application/appinstaller.xml was added
  /usr/share/mime/application/appxbundle.xml was added
  /usr/share/mime/application/appx.xml was added
  /usr/share/mime/application/its+xml.xml was added
  /usr/share/mime/application/json5.xml was added
  /usr/share/mime/application/msixbundle.xml was added
  /usr/share/mime/application/msix.xml was added
  /usr/share/mime/application/vnd.cups-ppd.xml was added
  /usr/share/mime/application/vnd.microsoft.portable-executable.xml was added
  /usr/share/mime/application/wasm.xml was added
  /usr/share/mime/application/x-bzip1-compressed-tar.xml was added
  /usr/share/mime/application/x-bzip1.xml was added
  /usr/share/mime/application/x-dosexec.xml was added
  /usr/share/mime/application/x-msdownload.xml was added
  /usr/share/mime/application/x-ms-ne-executable.xml was added
  /usr/share/mime/application/x-ms-shortcut.xml was added
  /usr/share/mime/application/x-powershell.xml was added
  /usr/share/mime/chemical was added
  /usr/share/mime/chemical/x-pdb.xml was added
  /usr/share/mime/text/jscript.encode.xml was added
  /usr/share/mime/text/vbscript.encode.xml was added
  /usr/share/mime/text/x-basic.xml was added
  /usr/share/mime/text/x-component.xml was added
  /usr/share/mime/text/x-vb.xml was added
  /usr/share/mime/application/x-bzip-compressed-tar.xml was removed
  /usr/share/mime/application/x-bzip.xml was removed
  /usr/share/mime/application/x-ms-dos-executable.xml was removed
Changes to packages/x86_64-linux/shared-mime-info-native (sysroot):
  /usr/share/mime/application/appinstaller.xml was added
  /usr/share/mime/application/appxbundle.xml was added
  /usr/share/mime/application/appx.xml was added
  /usr/share/mime/application/its+xml.xml was added
  /usr/share/mime/application/json5.xml was added
  /usr/share/mime/application/msixbundle.xml was added
  /usr/share/mime/application/msix.xml was added
  /usr/share/mime/application/vnd.cups-ppd.xml was added
  /usr/share/mime/application/vnd.microsoft.portable-executable.xml was added
  /usr/share/mime/application/wasm.xml was added
  /usr/share/mime/application/x-bzip1-compressed-tar.xml was added
  /usr/share/mime/application/x-bzip1.xml was added
  /usr/share/mime/application/x-dosexec.xml was added
  /usr/share/mime/application/x-msdownload.xml was added
  /usr/share/mime/application/x-ms-ne-executable.xml was added
  /usr/share/mime/application/x-ms-shortcut.xml was added
  /usr/share/mime/application/x-powershell.xml was added
  /usr/share/mime/chemical was added
  /usr/share/mime/chemical/x-pdb.xml was added
  /usr/share/mime/text/jscript.encode.xml was added
  /usr/share/mime/text/vbscript.encode.xml was added
  /usr/share/mime/text/x-basic.xml was added
  /usr/share/mime/text/x-component.xml was added
  /usr/share/mime/text/x-vb.xml was added
  /usr/share/mime/application/x-bzip-compressed-tar.xml was removed
  /usr/share/mime/application/x-bzip.xml was removed
  /usr/share/mime/application/x-ms-dos-executable.xml was removed

--===============3778693489542079714==--

