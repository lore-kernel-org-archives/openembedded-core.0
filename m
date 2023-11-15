Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83750C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:43:48 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.9001.1700037821498038272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="119134485"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="119134485"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:43:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 95814D69D5
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:43:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C5874D5EB3
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:43:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB02D6B81F;
	Wed, 15 Nov 2023 17:43:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] shared-mime-info: upgrade 2.3 -> 2.4
Date: Wed, 15 Nov 2023 16:41:59 +0800
Message-Id: <1700037719-1748-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27998.006
X-TMASE-Result: 10-3.684800-10.000000
X-TMASE-MatchedRID: x6Z0l43VjRKjz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyWhLh9e7qvSIkhP
	dBA47hdyjzqLvABc+8gEgqi3rqEcYxJ8EINAmcWbNcwCMbCA8ag81ck8U80WlrfYIuZsOQ0sBOC
	yMglQlkjaU73B0kiPBU/YrmvLaA2ePjGcaJx+0AEM6z3iDvziB579S44FQhji2MZ/VGSaXH+VGl
	DXzCewMarZLe9SVlS0OJiBARmRplxppVRgJu1hv+9kW9mxCQvtTJDl9FKHbrnPWp1UK7zV95Uht
	+myr0XM28kKXD7bCdnGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BSuvtBzlaEqDUvQN19brjgJMJX
	DJjkqdT+ifdRjolDA+Wq4VBS96hlPetSk5bB6tydVNZaI2n6/8oioCrSMgeK+OO8YTtOnsIxE7q
	6mglq7hdLzrqQvgVVgf1coNKyQvI3fzE3wKa/rLWSvtORr1PaF2jIWUnlRQzVX7AOm/VrzYtIkj
	8usqkSQOOLVXP+lL2bM0Qi5eULMYV30ZD7XA/lupDIC9422DoL//VMxXlyE/nGwx36cSE11q1oo
	OQNRAvCunYqfdJFc6Hvyg1ZsxTfcu2IYLQNwP9vTnqYKYXTRn0tCKdnhB58k4rY1r+vswgXvQkG
	i3tjz/cUt5lc1lLg8TGYzM98Nm8emMK+tXfxKWwzv4RvkcXDSWF1LLyYeKXu++pFMUqUfG0bft+
	uKoMQtSbV6OA2xBm2Grk3HMjtfJ5c/SKnzp4NvzJKiEygTwJLv5Eyr/YIrqsDhztRXZ9Cm+LY9A
	78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190575

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-string-literal-concatenation.patch
0001-Fix-literal-as-per-c-11.patch 
removed since they're included in 2.4

Changelog:
==========
* Restore mimetype name for *.bz2 and *.tar.bz2
* Improve detection of application/mac-binhex40
* Add application/x-msdownload and subtypes
* Add Windows app store types
* Give Windows Installer packages the package icon
* Lower priority for text/x-mpsub's magic, so it doesn't match pcb-drillFile.drl
* Add application/x-powershell
* Add application/wasm
* Change comment of text/x-mpsub
* Change comment of text/x-mpl2
* Add text/x-component
* Give higher priority to the more specific image/apng magic
* Recognize *.jfif as image/jpeg
* Add application/its+xml
* Add text/x-vb
* Add text/x-basic
* Add new group "chemical" in update-mime-database
* Add mimetype for Protein Data Bank (pdb) files
* Remove too generic magic from application/x-pak
* Add application/json5
* Add text/vbscript.encode
* Add text/jscript.encode
* Add text/jscript as synonym of text/javascript
* Fix backwards relationship between text/javascript and application/ecmascript
* Add application/vnd.cups-ppd
* Add application/x-ms-shortcut
* Give application/x-mswinurl the link icon
* Fix missing sentinel warning with clang
* Fix false positive fdatasync detection on darwin
* Fix string literal concatenation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
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
2.34.1


