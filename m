Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 694A078347
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 07:13:38 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p46so7235135wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 00:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IZ9fbStvFylq/n1xzpg8REJzN+GYNf8cSpKSA3iK1vg=;
	b=awsQQJcOsKgBvFRR9q4KKAsbkh7tyq78PAURDPj4aL2LZdQHz4DXlBNGZjX2WzYrUH
	lLv396iE3vkRFwpmSVt2dy5ilIaUdzQQfy0KlnBE87kPT97oZWW1klyhYrfOQ5WJkWdX
	crLG1s4hKp9hi+DU/4b/yhqHKZW1kKu6TiXIcBzZ0wXNkY3inXwFz08cOPUp+v/FXXCR
	8fBYi1cChXaWkIqJ436Co9mNXFv+6SjorZbaG6YwN50DT1iPa+jlo83fF93njtNbXG5O
	1LBzefNI9jq0j/KvTazn4uUnwg18i10CcxLJRxToSYlzC6qw1422o8LlPTqxO6hmzT5r
	yCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IZ9fbStvFylq/n1xzpg8REJzN+GYNf8cSpKSA3iK1vg=;
	b=tsCIwyxlaWTuIAFU2/zoLNjUIlzuDLZgdgCCKoDSgwuQ6vGukqwmUlP+UHZS8WpEP3
	+s5NAhSutQvk0OvkFCEm0S2jkap33KVYNEV6Mix38zlTEiCY31JepEzECEDTjir+jB+S
	IIJ+v7rW+dYQ9uNitVrIw1EaOBqFmCQNR5tWXwaZTFbeQ+jKl1M5IbOwMWT0I1BVhZRE
	I/czceW0kfCG82z/YVUq6c3eIuKgwbEPf6zGOIf2ch2gociVWzwWUHkefHhOTTJl+air
	UKkPTKEgvnu/vikNL2ud9uwsVyECPDjwKx5IZ2RrtFFeV3cLw+DLCsqTfiNHevIUnB0x
	iiBQ==
X-Gm-Message-State: AMCzsaWIncKqH2+kArUJBHzLXyuSTYtbGZEWVl1WldkJshxj/0wwJiJf
	EChBcq8eDVOXbKBbKXdYvXBl1vSozw==
X-Google-Smtp-Source: ABhQp+Rzjz+UD9LFd1tiCdNcx5DDt397GUnkpW85dL5I6+z2/cVmYkvH6Q63GLKDzOYBV3/iih1tLA==
X-Received: by 10.223.196.164 with SMTP id m33mr615397wrf.258.1508397219990;
	Thu, 19 Oct 2017 00:13:39 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p54BD539E.dip0.t-ipconnect.de.
	[84.189.83.158])
	by smtp.gmail.com with ESMTPSA id r68sm793081wmd.4.2017.10.19.00.13.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 00:13:39 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Oct 2017 09:13:26 +0200
Message-Id: <dd6b71b3163409a56783b14f58f6b08e4a91c945.1508397167.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c50c4521e6299e86250f5b3ff2b58709500814e5.1508397167.git-series.patrick.ohly@intel.com>
References: <cover.c50c4521e6299e86250f5b3ff2b58709500814e5.1508397167.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] useradd-staticids: explain how to fix the the problem
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
X-List-Received-Date: Thu, 19 Oct 2017 07:13:39 -0000

When a distro uses useradd-staticids.bbclass and some developer
unfamiliar with the static ID mechanism tries to add a recipe which
needs new IDs, the resulting error or warning is typically not
something that the developer will understand.

Even experienced developers do not get enough information. They first
must find out whether the missing ID is for a system user or group,
then locate the file(s) in which the ID could be added. Both of this
is now part of the message:

ERROR: .../meta/recipes-extended/cronie/cronie_1.5.1.bb: cronie -
cronie: system groupname crontab does not have a static ID defined.
Add crontab to one of these files: /.../conf/distro/include/my-distro-group

The case that no file was found is also handled:

ERROR: .../meta/recipes-extended/cronie/cronie_1.5.1.bb: cronie -
cronie: system groupname crontab does not have a static ID defined.
USERADD_GID_TABLES file(s) not found in BBPATH: files/group

It would be nice if the error message could also list the range in
which a new ID needs to be allocated, but /etc/login.defs isn't
available at the time of creating the message, so that part is still
something that a developer needs to know.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/useradd-staticids.bbclass | 62 ++++++++++++---------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 3d0bc09..589a99f 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -38,10 +38,14 @@ def update_useradd_static_config(d):
 
         return id_table
 
-    def handle_missing_id(id, type, pkg):
+    def handle_missing_id(id, type, pkg, files, var, value):
         # For backwards compatibility we accept "1" in addition to "error"
         error_dynamic = d.getVar('USERADD_ERROR_DYNAMIC')
         msg = "%s - %s: %sname %s does not have a static ID defined." % (d.getVar('PN'), pkg, type, id)
+        if files:
+            msg += " Add %s to one of these files: %s" % (id, files)
+        else:
+            msg += " %s file(s) not found in BBPATH: %s" % (var, value)
         if error_dynamic == 'error' or error_dynamic == '1':
             raise NotImplementedError(msg)
         elif error_dynamic == 'warn':
@@ -49,23 +53,24 @@ def update_useradd_static_config(d):
         elif error_dynamic == 'skip':
             raise bb.parse.SkipRecipe(msg)
 
+    # Return a list of configuration files based on either the default
+    # files/group or the contents of USERADD_GID_TABLES, resp.
+    # files/passwd for USERADD_UID_TABLES.
+    # Paths are resolved via BBPATH.
+    def get_table_list(d, var, default):
+        files = []
+        bbpath = d.getVar('BBPATH', True)
+        tables = d.getVar(var, True)
+        if not tables:
+            tables = default
+        for conf_file in tables.split():
+            files.append(bb.utils.which(bbpath, conf_file))
+        return (' '.join(files), var, default)
+
     # We parse and rewrite the useradd components
     def rewrite_useradd(params, is_pkg):
         parser = oe.useradd.build_useradd_parser()
 
-        # Return a list of configuration files based on either the default
-        # files/passwd or the contents of USERADD_UID_TABLES
-        # paths are resolved via BBPATH
-        def get_passwd_list(d):
-            str = ""
-            bbpath = d.getVar('BBPATH')
-            passwd_tables = d.getVar('USERADD_UID_TABLES')
-            if not passwd_tables:
-                passwd_tables = 'files/passwd'
-            for conf_file in passwd_tables.split():
-                str += " %s" % bb.utils.which(bbpath, conf_file)
-            return str
-
         newparams = []
         users = None
         for param in oe.useradd.split_commands(params):
@@ -86,10 +91,12 @@ def update_useradd_static_config(d):
             # all new users get the default ('*' which prevents login) until the user is
             # specifically configured by the system admin.
             if not users:
-                users = merge_files(get_passwd_list(d), 7)
+                files, table_var, table_value = get_table_list(d, 'USERADD_UID_TABLES', 'files/passwd')
+                users = merge_files(files, 7)
 
+            type = 'system user' if uaargs.system else 'normal user'
             if uaargs.LOGIN not in users:
-                handle_missing_id(uaargs.LOGIN, 'user', pkg)
+                handle_missing_id(uaargs.LOGIN, type, pkg, files, table_var, table_value)
                 newparams.append(param)
                 continue
 
@@ -147,7 +154,7 @@ def update_useradd_static_config(d):
 
             # Should be an error if a specific option is set...
             if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
-                 handle_missing_id(uaargs.LOGIN, 'user', pkg)
+                 handle_missing_id(uaargs.LOGIN, type, pkg, files, table_var, table_value)
 
             # Reconstruct the args...
             newparam  = ['', ' --defaults'][uaargs.defaults]
@@ -184,19 +191,6 @@ def update_useradd_static_config(d):
     def rewrite_groupadd(params, is_pkg):
         parser = oe.useradd.build_groupadd_parser()
 
-        # Return a list of configuration files based on either the default
-        # files/group or the contents of USERADD_GID_TABLES
-        # paths are resolved via BBPATH
-        def get_group_list(d):
-            str = ""
-            bbpath = d.getVar('BBPATH')
-            group_tables = d.getVar('USERADD_GID_TABLES')
-            if not group_tables:
-                group_tables = 'files/group'
-            for conf_file in group_tables.split():
-                str += " %s" % bb.utils.which(bbpath, conf_file)
-            return str
-
         newparams = []
         groups = None
         for param in oe.useradd.split_commands(params):
@@ -216,10 +210,12 @@ def update_useradd_static_config(d):
             # Note: similar to the passwd file, the 'password' filed is ignored
             # Note: group_members is ignored, group members must be configured with the GROUPMEMS_PARAM
             if not groups:
-                groups = merge_files(get_group_list(d), 4)
+                files, table_var, table_value = get_table_list(d, 'USERADD_GID_TABLES', 'files/group')
+                groups = merge_files(files, 4)
 
+            type = 'system group' if gaargs.system else 'normal group'
             if gaargs.GROUP not in groups:
-                handle_missing_id(gaargs.GROUP, 'group', pkg)
+                handle_missing_id(gaargs.GROUP, type, pkg, files, table_var, table_value)
                 newparams.append(param)
                 continue
 
@@ -231,7 +227,7 @@ def update_useradd_static_config(d):
                 gaargs.gid = field[2]
 
             if not gaargs.gid or not gaargs.gid.isdigit():
-                handle_missing_id(gaargs.GROUP, 'group', pkg)
+                handle_missing_id(gaargs.GROUP, type, pkg, files, table_var, table_value)
 
             # Reconstruct the args...
             newparam  = ['', ' --force'][gaargs.force]
-- 
git-series 0.9.1

