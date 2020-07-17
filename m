Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.12932.1594996744457910074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jaVNpgr8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id m9so5487430pfh.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FYtdQXKctuWYoYB1oXeohUAp7iDUY12djvw/tiuqiGo=;
        b=jaVNpgr8aUnONmlnvTiw54gE3kwPKoKeBLvE9rGfQmDG8YxF5XMPsX9KiJLO0dTVqA
         CzLa0svgfl2bOI1f1sKu31NyaWQnI3kziP2fCGUiSUZbc9pYDtgmf02q01cTQDoB1Jqo
         s9P7zNG3v9zlPuyzlA5cbrzuJ1QALao9byxD6jshCeIqCiJxOuFTgInKfGsaeGvjo296
         bB8bmJCqBrMc8ogk6cok2s6zttxylnaqt/XZPMAjtJgh7jOkpRZ5/GwIZL/0zE4bAy6A
         8MRfI2PgFKPdBGNtHfUU93tfw347kUMgj/q/RhkkgAvfc7ygESafc0wowtd/z0vVyqRF
         eN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FYtdQXKctuWYoYB1oXeohUAp7iDUY12djvw/tiuqiGo=;
        b=dkqddQ4z5qtOHD6cuQj8h2iEJg7MibQh3rTmaLgGL5Rkip/RhnYsKPIv9ICuDf01ik
         PdwLP/caIonXrHLTncHWZJwIhUwyoh1CAzIFCEhLnz9otrMzh3WLmuLGKOUYNzYn4Ft4
         rYkYCIf57gbWDOyoP4HXR0IbRt6Ax4fwm2WJ5j42AJ9sl/BMeu6Nnq3zjvht1/vTeIXY
         GqZU8mVVt0aYN0aRDI8/yaoyTMsACavkX/Npfv0CVM8GPsh3JwNnjOo2tbelSEgUexx8
         jqTYoonea+IjKqGdGDF2IUnTutrq9dZQ4akvHdjPQwBwdjqdpHxRkPpnYReQzhlW6tHx
         OHOw==
X-Gm-Message-State: AOAM531CMVB4Py4Y15QJjS8nzRuy/pU8q8p35CCHtmWOAA/fB1pWetTG
	h+9i7L2VAN4y3AiQXpkUPIO6w4ERZpw=
X-Google-Smtp-Source: ABdhPJw/9z/56MxFOu13i7oSQqFXHHzTvvX11ju6mglz5S53BDo6xrvHDFrZZJH/wkz3AIzrgNZR1g==
X-Received: by 2002:a05:6a00:f:: with SMTP id h15mr8227391pfk.193.1594996743524;
        Fri, 17 Jul 2020 07:39:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.39.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:39:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/20] scripts/lib/recipetool/create.py: fix regex strings
Date: Fri, 17 Jul 2020 04:37:21 -1000
Message-Id: <f8a5db7a6072ddb1be96405fc8b44f595275206d.1594996441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Tim Orling <timothy.t.orling@linux.intel.com>

Python now expects regex strings to be prepended with r.
Silence pylint/autopep8 and similar warnings by identifying
these regex patterns as... regex patterns.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0eae98a369d80340e48dc690d09a1364cde97973)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/create.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 8d78c5b6f9..566c75369a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -66,7 +66,7 @@ class RecipeHandler(object):
         libdir = d.getVar('libdir')
         base_libdir = d.getVar('base_libdir')
         libpaths = list(set([base_libdir, libdir]))
-        libname_re = re.compile('^lib(.+)\.so.*$')
+        libname_re = re.compile(r'^lib(.+)\.so.*$')
         pkglibmap = {}
         for lib, item in shlib_providers.items():
             for path, pkg in item.items():
@@ -428,7 +428,7 @@ def create_recipe(args):
 
     if scriptutils.is_src_url(source):
         # Warn about github archive URLs
-        if re.match('https?://github.com/[^/]+/[^/]+/archive/.+(\.tar\..*|\.zip)$', source):
+        if re.match(r'https?://github.com/[^/]+/[^/]+/archive/.+(\.tar\..*|\.zip)$', source):
             logger.warning('github archive files are not guaranteed to be stable and may be re-generated over time. If the latter occurs, the checksums will likely change and the recipe will fail at do_fetch. It is recommended that you point to an actual commit or tag in the repository instead (using the repository URL in conjunction with the -S/--srcrev option).')
         # Fetch a URL
         fetchuri = reformat_git_uri(urldefrag(source)[0])
@@ -830,7 +830,7 @@ def create_recipe(args):
         elif line.startswith('PV = '):
             if realpv:
                 # Replace the first part of the PV value
-                line = re.sub('"[^+]*\+', '"%s+' % realpv, line)
+                line = re.sub(r'"[^+]*\+', '"%s+' % realpv, line)
         lines_before.append(line)
 
     if args.also_native:
@@ -1066,8 +1066,8 @@ def crunch_license(licfile):
     import oe.utils
 
     # Note: these are carefully constructed!
-    license_title_re = re.compile('^\(?(#+ *)?(The )?.{1,10} [Ll]icen[sc]e( \(.{1,10}\))?\)?:?$')
-    license_statement_re = re.compile('^(This (project|software) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) under the .{1,10} [Ll]icen[sc]e:?$')
+    license_title_re = re.compile(r'^\(?(#+ *)?(The )?.{1,10} [Ll]icen[sc]e( \(.{1,10}\))?\)?:?$')
+    license_statement_re = re.compile(r'^(This (project|software) is( free software)? (released|licen[sc]ed)|(Released|Licen[cs]ed)) under the .{1,10} [Ll]icen[sc]e:?$')
     copyright_re = re.compile('^(#+)? *Copyright .*$')
 
     crunched_md5sums = {}
-- 
2.17.1

