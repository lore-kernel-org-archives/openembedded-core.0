Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D3DC87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.17937.1754642997708249122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZP/cDAS;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2401b855980so13626235ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642997; x=1755247797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Trb7PFGlellBbTNTlVhpdaNZn34qoReBUU2I/Htc0K4=;
        b=WZP/cDASnYZYE4dk6NUkWlKMmeMs6dkNykEHf2Pou28GgKfTw80RsPPV1gelv63Emr
         FtqCRH+O060iTiTcrcMD5tL7Sc0qxPazHj21LQO4k3cMohxN9/jXUDeBQjWHNfjWm+VR
         pPMRjvY9xtigxCaAD2a5faTS3uLJ68KShrgzgV4IV868oRZxBEj/OcFAOz2bP/kLi30o
         SL3vbQqBE9Z8St047+T1hUYRXVW90ZfNyqdk29KJT0RRUag9nEE18uzLJ2gbNJaJ791O
         WLi5Qhd1ALBZyiYahvUkWD3JS9Tgf+cqAoH/vgLYfTHTJAzhtArfYfY9eBS9mAhtUGMI
         ubdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642997; x=1755247797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Trb7PFGlellBbTNTlVhpdaNZn34qoReBUU2I/Htc0K4=;
        b=gtouZzpjwwMEiBtX+f7GuMThBpjwFZaccOdv8prfGUzBRD7rASMLPHVkSb37BPMYy6
         JsLH05oW71EQ4agssQALQ29FKvGeuajPh/gpu3SP5IjKQXYt66ihumTf/XVtgFZmMMah
         zUz8BOjoJRIRHV4PimqQY/qtTbqp+Wavcu3J/HU5w+0wqnBQH+bZLV86lr6DBjiuZ/ME
         N0JVdf/DrDSDJHmTP6HuUzRgHc37C0dt51x/tqC4kq3yWfiJ29kXtPHoerk4Uvj8BazV
         a36ExZcMSUfmCxpW2avB1J1JXQp95UUkKdFKwwGaLx6lXk3tdTkoMe5VPMyjCMICiSuT
         wXeg==
X-Gm-Message-State: AOJu0Yw4Ljriy2ojRc4pC+vIVOrQ5qMCazzkhM1ta6UHKY4jdl4JM6sV
	AsOoJkb41b5rmViNnolRKfI8OgDWT30/OgUXb8GRw8+n42Ez/nLaysTM/Hptlg==
X-Gm-Gg: ASbGncsSX++I7UdsM5CHG8iupwbj45DFwHzVFnhJsMq/AlBcOKAGXt+YcXd/2pK8PF/
	SD2VzuXmWCWGmcU2qnNZkN998fXtlYDF+CZcCZct++184wJri76KxCMbH3WV5Qv3qs2qucFUqOL
	vOt+qdx2CudDYKSwhvlO13YFLvUX3zj63doCc4hSL7CkjDKGyTl3kwPIztU/lPGf2IN4/GFv9KB
	Gs8sjWsiIPLbc7HYWmmhMjGMmRrVl02GBljmj9552+2y6eZAaScewlhjaQ8bPAnXnBG2h/8Ec/x
	xgldtjI8HrN+wrG3G8msvFzQQ5k/I+G5b8PWOHqMGT4wN6AbgDOdqRpF7W+qrUgxI9pvkkb/h1h
	sSTB4BGE1EDlVxoHhDuWUHJxJQW2mGDqB
X-Google-Smtp-Source: AGHT+IHQbENPBBAZ1HKCB6TqPzJ2zt8xwoj0Sar1zA+iM8mBv5V+DivNi+kz1z4+9jQu+uj1MYvexQ==
X-Received: by 2002:a17:902:d550:b0:234:1163:ff99 with SMTP id d9443c01a7336-242c222c806mr32410155ad.43.1754642996652;
        Fri, 08 Aug 2025 01:49:56 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:56 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Estner <michaelestner@web.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 07/23] bitbake: lib: Remove double imports
Date: Fri,  8 Aug 2025 14:19:15 +0530
Message-Id: <20250808084931.2156763-7-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221604

From: Michael Estner <michaelestner@web.de>

* Remove double imports mentioned by pylint

(Bitbake rev: 741db6719efca5aa9ef2c15e60cdd624e4aa1a8d)

Signed-off-by: Michael Estner <michaelestner@web.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1836b205a2716e85f36346762805e2e505a5eb6)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/__init__.py                                 | 1 -
 bitbake/lib/bb/acl.py                                      | 2 --
 bitbake/lib/bb/fetch2/git.py                               | 1 -
 bitbake/lib/bb/fetch2/gitsm.py                             | 2 +-
 bitbake/lib/bb/runqueue.py                                 | 1 -
 bitbake/lib/bs4/__init__.py                                | 1 -
 bitbake/lib/bs4/diagnose.py                                | 1 -
 bitbake/lib/ply/yacc.py                                    | 1 -
 bitbake/lib/toaster/orm/models.py                          | 3 +--
 bitbake/lib/toaster/toastergui/templatetags/projecttags.py | 1 -
 bitbake/lib/toaster/toastergui/views.py                    | 2 --
 bitbake/lib/toaster/toastermain/settings.py                | 1 -
 12 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/bitbake/lib/bb/__init__.py b/bitbake/lib/bb/__init__.py
index cdec9e4d6c..a3c259479a 100644
--- a/bitbake/lib/bb/__init__.py
+++ b/bitbake/lib/bb/__init__.py
@@ -214,7 +214,6 @@ def deprecated(func, name=None, advice=""):
 # For compatibility
 def deprecate_import(current, modulename, fromlist, renames = None):
     """Import objects from one module into another, wrapping them with a DeprecationWarning"""
-    import sys
 
     module = __import__(modulename, fromlist = fromlist)
     for position, objname in enumerate(fromlist):
diff --git a/bitbake/lib/bb/acl.py b/bitbake/lib/bb/acl.py
index 0f41b275cf..e9dbdb617f 100755
--- a/bitbake/lib/bb/acl.py
+++ b/bitbake/lib/bb/acl.py
@@ -195,8 +195,6 @@ class ACL(object):
 
 def main():
     import argparse
-    import pwd
-    import grp
     from pathlib import Path
 
     parser = argparse.ArgumentParser()
diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 6badda5972..168f14d0c8 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -817,7 +817,6 @@ class Git(FetchMethod):
         """
         Return True if git-lfs can be found, False otherwise.
         """
-        import shutil
         return shutil.which("git-lfs", path=d.getVar('PATH')) is not None
 
     def _get_repo_url(self, ud):
diff --git a/bitbake/lib/bb/fetch2/gitsm.py b/bitbake/lib/bb/fetch2/gitsm.py
index ba62517f08..bab1bf2580 100644
--- a/bitbake/lib/bb/fetch2/gitsm.py
+++ b/bitbake/lib/bb/fetch2/gitsm.py
@@ -264,7 +264,7 @@ class GitSM(Git):
         Git.clean(self, ud, d)
 
     def implicit_urldata(self, ud, d):
-        import shutil, subprocess, tempfile
+        import subprocess
 
         urldata = []
         def add_submodule(ud, url, module, modpath, workdir, d):
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index db68f97e68..809324d3fd 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -476,7 +476,6 @@ class RunQueueData:
         self.runtaskentries = {}
 
     def runq_depends_names(self, ids):
-        import re
         ret = []
         for id in ids:
             nam = os.path.basename(id)
diff --git a/bitbake/lib/bs4/__init__.py b/bitbake/lib/bs4/__init__.py
index e35725b86e..e226b9cf4a 100644
--- a/bitbake/lib/bs4/__init__.py
+++ b/bitbake/lib/bs4/__init__.py
@@ -463,6 +463,5 @@ class FeatureNotFound(ValueError):
 
 #By default, act as an HTML pretty-printer.
 if __name__ == '__main__':
-    import sys
     soup = BeautifulSoup(sys.stdin)
     print(soup.prettify())
diff --git a/bitbake/lib/bs4/diagnose.py b/bitbake/lib/bs4/diagnose.py
index 083395fb46..8d6ce8f87e 100644
--- a/bitbake/lib/bs4/diagnose.py
+++ b/bitbake/lib/bs4/diagnose.py
@@ -16,7 +16,6 @@ import tempfile
 import time
 import traceback
 import sys
-import cProfile
 
 def diagnose(data):
     """Diagnostic suite for isolating common problems."""
diff --git a/bitbake/lib/ply/yacc.py b/bitbake/lib/ply/yacc.py
index 381b50cf0b..529f85b081 100644
--- a/bitbake/lib/ply/yacc.py
+++ b/bitbake/lib/ply/yacc.py
@@ -1122,7 +1122,6 @@ class LRParser:
 # manipulate the rules that make up a grammar. 
 # -----------------------------------------------------------------------------
 
-import re
 
 # regex matching identifiers
 _is_identifier = re.compile(r'^[a-zA-Z0-9_-]+$')
diff --git a/bitbake/lib/toaster/orm/models.py b/bitbake/lib/toaster/orm/models.py
index 19c9686206..e2f488ed89 100644
--- a/bitbake/lib/toaster/orm/models.py
+++ b/bitbake/lib/toaster/orm/models.py
@@ -79,7 +79,6 @@ if 'sqlite' in settings.DATABASES['default']['ENGINE']:
     # end of HACK
 
 class GitURLValidator(validators.URLValidator):
-    import re
     regex = re.compile(
         r'^(?:ssh|git|http|ftp)s?://'  # http:// or https://
         r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+(?:[A-Z]{2,6}\.?|[A-Z0-9-]{2,}\.?)|'  # domain...
@@ -1500,7 +1499,7 @@ class Layer_Version(models.Model):
     # code lifted, with adaptations, from the layerindex-web application
     # https://git.yoctoproject.org/cgit/cgit.cgi/layerindex-web/
     def _handle_url_path(self, base_url, path):
-        import re, posixpath
+        import posixpath
         if base_url:
             if self.dirpath:
                 if path:
diff --git a/bitbake/lib/toaster/toastergui/templatetags/projecttags.py b/bitbake/lib/toaster/toastergui/templatetags/projecttags.py
index bd398f0012..aee9bbcd14 100644
--- a/bitbake/lib/toaster/toastergui/templatetags/projecttags.py
+++ b/bitbake/lib/toaster/toastergui/templatetags/projecttags.py
@@ -233,7 +233,6 @@ def filter_sizeovertotal(package_object, total_size):
 
     return '{:.1%}'.format(float(size)/float(total_size))
 
-from django.utils.safestring import mark_safe
 @register.filter
 def format_vpackage_rowclass(size):
     if size == -1:
diff --git a/bitbake/lib/toaster/toastergui/views.py b/bitbake/lib/toaster/toastergui/views.py
index 40aed265dc..061e6436c8 100644
--- a/bitbake/lib/toaster/toastergui/views.py
+++ b/bitbake/lib/toaster/toastergui/views.py
@@ -372,7 +372,6 @@ def _get_parameters_values(request, default_count, default_order):
 # set cookies for parameters. this is usefull in case parameters are set
 # manually from the GET values of the link
 def _set_parameters_values(pagesize, orderby, request):
-    from django.urls import resolve
     current_url = resolve(request.path_info).url_name
     request.session['%s_count' % current_url] = pagesize
     request.session['%s_orderby' % current_url] =orderby
@@ -699,7 +698,6 @@ class LazyEncoder(json.JSONEncoder):
         return super(LazyEncoder, self).default(obj)
 
 from toastergui.templatetags.projecttags import filtered_filesizeformat
-import os
 def _get_dir_entries(build_id, target_id, start):
     node_str = {
         Target_File.ITYPE_REGULAR   : '-',
diff --git a/bitbake/lib/toaster/toastermain/settings.py b/bitbake/lib/toaster/toastermain/settings.py
index e06adc5a93..d2a449627f 100644
--- a/bitbake/lib/toaster/toastermain/settings.py
+++ b/bitbake/lib/toaster/toastermain/settings.py
@@ -298,7 +298,6 @@ SOUTH_TESTS_MIGRATE = False
 
 # We automatically detect and install applications here if
 # they have a 'models.py' or 'views.py' file
-import os
 currentdir = os.path.dirname(__file__)
 for t in os.walk(os.path.dirname(currentdir)):
     modulename = os.path.basename(t[0])
-- 
2.25.1


