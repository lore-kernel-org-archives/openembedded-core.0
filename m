Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id AF5BA7190D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 20:15:54 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so3782467wgg.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 12:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gC9WgAsaT4u7gwxATmsmy2V1Ob6d/mofi9UY6PkMXwc=;
	b=Iys7uv9hGQUZclKUD1M2cnW7Kop9EwsVyvyW0ac4Rf4tBFKQJrrdrDPR3XWcstyI99
	QPUBmRs/tWyApQFt7V9MF1uUB6mCASj3t8QJbPAO82OhIQoSt2ucNY2gR9QC90iupsa/
	kDMUTZYoDvTVNfJETRLeVExrlaLhe3NfnOhnWdJJ0AEuS7WvT0iTOL3ZBQAg6nnt+2VU
	33VMTFcKCE6jsLM0+WV9QgPqZFnjWRLEGmttNaEUCfIQl34hcJAsO25A1TPmrxn6934U
	7AQnWpBR9CT5NbpDd6wx0pjuYXVYvMpCg2SVd51STLMyzF3cwPPkXIJNeLsmUA4gi2Us
	q62g==
X-Received: by 10.180.89.208 with SMTP id bq16mr18355989wib.52.1416082554435; 
	Sat, 15 Nov 2014 12:15:54 -0800 (PST)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id s2sm8266290wia.3.2014.11.15.12.15.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Nov 2014 12:15:53 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Nov 2014 20:15:41 +0000
Message-Id: <1416082543-7559-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1416082543-7559-1-git-send-email-paul@paulbarker.me.uk>
References: <1416082543-7559-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 1/3] opkg: Upgrade to v0.2.4
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
X-List-Received-Date: Sat, 15 Nov 2014 20:15:57 -0000

The patches for opkg have been rebased using git so that they apply cleanly onto
the new release.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg/add-exclude.patch  | 22 ++++++++++----------
 .../opkg/opkg/no-install-recommends.patch          | 24 +++++++++++-----------
 .../opkg/{opkg_0.2.2.bb => opkg_0.2.4.bb}          |  4 ++--
 3 files changed, 25 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.2.2.bb => opkg_0.2.4.bb} (70%)

diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
index c684534..a10014d 100644
--- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
+++ b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
@@ -1,4 +1,4 @@
-From 5d707bbfcafd88b8b5b5821972c8c958fc3b2039 Mon Sep 17 00:00:00 2001
+From 60c3f93e95a3ca54ef0a7eebc5ef29a5d92d3110 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@paulbarker.me.uk>
 Date: Fri, 28 Mar 2014 15:20:22 +0000
 Subject: [PATCH 2/2] opkg-0.2.x: add-exclude
@@ -28,10 +28,10 @@ Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
  4 files changed, 34 insertions(+)
 
 diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
-index 1e65bad..9c4c854 100644
+index 4eee37b..1ab63fb 100644
 --- a/libopkg/opkg_conf.c
 +++ b/libopkg/opkg_conf.c
-@@ -442,6 +442,7 @@ opkg_conf_init(void)
+@@ -447,6 +447,7 @@ opkg_conf_init(void)
  	pkg_dest_list_init(&conf->pkg_dest_list);
  	pkg_dest_list_init(&conf->tmp_dest_list);
  	nv_pair_list_init(&conf->arch_list);
@@ -40,7 +40,7 @@ index 1e65bad..9c4c854 100644
  	return 0;
  }
 diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
-index 6045a58..ad58849 100644
+index 2f189e0..6d6e613 100644
 --- a/libopkg/opkg_conf.h
 +++ b/libopkg/opkg_conf.h
 @@ -51,6 +51,8 @@ struct opkg_conf
@@ -53,10 +53,10 @@ index 6045a58..ad58849 100644
       int restrict_to_default_dest;
       pkg_dest_t *default_dest;
 diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
-index d2d279e..b572e18 100644
+index 41bf206..eb630d1 100644
 --- a/libopkg/pkg_depends.c
 +++ b/libopkg/pkg_depends.c
-@@ -212,6 +212,22 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
+@@ -204,6 +204,22 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
  			 continue;
  		    }
  
@@ -80,7 +80,7 @@ index d2d279e..b572e18 100644
  		    if (satisfying_pkg != NULL) {
  			 satisfier_entry_pkg = satisfying_pkg;
 diff --git a/src/opkg-cl.c b/src/opkg-cl.c
-index 0315d41..67366b9 100644
+index 6378380..f10d10b 100644
 --- a/src/opkg-cl.c
 +++ b/src/opkg-cl.c
 @@ -45,6 +45,7 @@ enum {
@@ -91,7 +91,7 @@ index 0315d41..67366b9 100644
  	ARGS_OPT_NOACTION,
  	ARGS_OPT_DOWNLOAD_ONLY,
  	ARGS_OPT_NODEPS,
-@@ -95,6 +96,7 @@ static struct option long_options[] = {
+@@ -97,6 +98,7 @@ static struct option long_options[] = {
  	{"offline-root", 1, 0, 'o'},
  	{"add-arch", 1, 0, ARGS_OPT_ADD_ARCH},
  	{"add-dest", 1, 0, ARGS_OPT_ADD_DEST},
@@ -99,7 +99,7 @@ index 0315d41..67366b9 100644
  	{"test", 0, 0, ARGS_OPT_NOACTION},
  	{"tmp-dir", 1, 0, 't'},
  	{"tmp_dir", 1, 0, 't'},
-@@ -198,6 +200,18 @@ args_parse(int argc, char *argv[])
+@@ -200,6 +202,18 @@ args_parse(int argc, char *argv[])
  			}
  			free(tuple);
  			break;
@@ -118,7 +118,7 @@ index 0315d41..67366b9 100644
  		case ARGS_OPT_NOACTION:
  			conf->noaction = 1;
  			break;
-@@ -282,6 +296,7 @@ usage()
+@@ -287,6 +301,7 @@ usage()
  	printf("\t--offline-root <dir>            offline installation of packages.\n");
  	printf("\t--add-arch <arch>:<prio>        Register architecture with given priority\n");
  	printf("\t--add-dest <name>:<path>        Register destination with given path\n");
@@ -127,5 +127,5 @@ index 0315d41..67366b9 100644
  	printf("\t                                than the higher version one if more\n");
  	printf("\t                                than one candidate is found.\n");
 -- 
-2.0.4
+2.1.3
 
diff --git a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
index bcca56c..b4aed9c 100644
--- a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
+++ b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
@@ -1,4 +1,4 @@
-From 610207c9bc82f20c77d6f234465e36857c997ea0 Mon Sep 17 00:00:00 2001
+From 2e2ccc7e7fc81a7eee2d004d3644efbc1be1ad73 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@paulbarker.me.uk>
 Date: Fri, 28 Mar 2014 15:19:08 +0000
 Subject: [PATCH 1/2] opkg-0.2.x: no-install-recommends
@@ -15,7 +15,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  3 files changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
-index 38fa375..6045a58 100644
+index e0e045a..2f189e0 100644
 --- a/libopkg/opkg_conf.h
 +++ b/libopkg/opkg_conf.h
 @@ -82,6 +82,7 @@ struct opkg_conf
@@ -27,10 +27,10 @@ index 38fa375..6045a58 100644
       char *overlay_root;
       int query_all;
 diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
-index a4df7de..d2d279e 100644
+index 8ab6508..41bf206 100644
 --- a/libopkg/pkg_depends.c
 +++ b/libopkg/pkg_depends.c
-@@ -19,6 +19,7 @@
+@@ -21,6 +21,7 @@
  #include <ctype.h>
  
  #include "pkg.h"
@@ -38,7 +38,7 @@ index a4df7de..d2d279e 100644
  #include "opkg_utils.h"
  #include "pkg_hash.h"
  #include "opkg_message.h"
-@@ -204,7 +205,7 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
+@@ -196,7 +197,7 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
  		    /* user request overrides package recommendation */
  		    if (satisfying_pkg != NULL
  			&& (compound_depend->type == RECOMMEND || compound_depend->type == SUGGEST)
@@ -48,18 +48,18 @@ index a4df7de..d2d279e 100644
  					"%s at user request\n",
  					pkg->name, satisfying_pkg->name);
 diff --git a/src/opkg-cl.c b/src/opkg-cl.c
-index b711511..0315d41 100644
+index a1d121f..6378380 100644
 --- a/src/opkg-cl.c
 +++ b/src/opkg-cl.c
-@@ -50,6 +50,7 @@ enum {
- 	ARGS_OPT_NODEPS,
+@@ -51,6 +51,7 @@ enum {
  	ARGS_OPT_AUTOREMOVE,
  	ARGS_OPT_CACHE,
+         ARGS_OPT_COMBINE,
 +	ARGS_OPT_NOINSTALL_RECOMMENDS,
  };
  
  static struct option long_options[] = {
-@@ -89,6 +90,7 @@ static struct option long_options[] = {
+@@ -91,6 +92,7 @@ static struct option long_options[] = {
  	{"noaction", 0, 0, ARGS_OPT_NOACTION},
  	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
  	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
@@ -67,7 +67,7 @@ index b711511..0315d41 100644
  	{"offline", 1, 0, 'o'},
  	{"offline-root", 1, 0, 'o'},
  	{"add-arch", 1, 0, ARGS_OPT_ADD_ARCH},
-@@ -199,6 +201,9 @@ args_parse(int argc, char *argv[])
+@@ -201,6 +203,9 @@ args_parse(int argc, char *argv[])
  		case ARGS_OPT_NOACTION:
  			conf->noaction = 1;
  			break;
@@ -77,7 +77,7 @@ index b711511..0315d41 100644
          case ARGS_OPT_DOWNLOAD_ONLY:
  			conf->download_only = 1;
  			break;
-@@ -293,6 +298,8 @@ usage()
+@@ -300,6 +305,8 @@ usage()
  	printf("\t--noaction                      No action -- test only\n");
  	printf("\t--download-only                 No action -- download only\n");
  	printf("\t--nodeps                        Do not follow dependencies\n");
@@ -87,5 +87,5 @@ index b711511..0315d41 100644
  	printf("\t                                Remove package and all dependencies\n");
  	printf("\t--autoremove                    Remove packages that were installed\n");
 -- 
-1.9.1
+2.1.3
 
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.2.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
similarity index 70%
rename from meta/recipes-devtools/opkg/opkg_0.2.2.bb
rename to meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 867ff7a..2cca63c 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -9,5 +9,5 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "b3ecef90d67d2aed2a14c2116a027482"
-SRC_URI[sha256sum] = "aa554ce7538544aac4f69e8274a0f9b8b433b8c3b1d00704bd393f713303a12b"
+SRC_URI[md5sum] = "40ed2aee15abc8d550539449630091bd"
+SRC_URI[sha256sum] = "0f40c7e457d81edf9aedc07c778f4697111ab163a38ef95999faece015453086"
-- 
2.1.3


