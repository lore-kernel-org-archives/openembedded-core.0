Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.8364.1620831462795992984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TO4ZhAIf;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id u16so22511184oiu.7
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4tLGRrWIXRiVTY0FSW0n+sGKZZYUbaryBCg8mCb6c6Q=;
        b=TO4ZhAIfooqFmxQwME5iq+Z9FdecqwPeocSIXCOQYnFJjbA5Osg8bvZmAmOWnDAvUB
         dFzvDlc9nhcGrJ2TYobpjjQPBnuHzOF8qC7UkQopOzXiMmSAbbRlitiRcrvx8u/o/H4a
         KxGf7U4hzuQnvgamEVFpvzM80jgW7qX71oJiMKLlpLji+uvkVVMk4yTAjHPZfuMPEIug
         o29mGFrGoUwWilzUjYsSxw/97h7pPwt5vKbZFaOfYhch5b/1KeYOX4QEQDxT/00KfX31
         gjpRF3hu4AVhf5h/McStP6dzGAww+nWgq7T3scY6quBWJE9f3KTe9OfzgVkKsG0+ST9+
         BO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4tLGRrWIXRiVTY0FSW0n+sGKZZYUbaryBCg8mCb6c6Q=;
        b=D/PA86HNMi07uwntWQTkNF5qdqMDkbG8CVEi5uHF+9yUWtXNUv7VODwJS7dvtbxkon
         fSFjpmI4ocmCTiY3hBnC5yhF4M81zozQ6gu2QRDSiZVWPjiG1C1+B8lIAetsTqIWjg2z
         PW0+Gb+DdKrrBj97uad3IO7PMbPTPMkOHonbDhODP/mz2Y0JgwSzxteFMK0HC7B8Vb35
         755Az5fMBc+ZqFxzm62+ispurTvIbGt9glloEhCQqosscFR2hNKAfjrm4w+MfKvWt2Ff
         0Wk1kag8dKoxTYSdjeGbwSD4M8e15Xg/FZ/jK1Pcp3Z/B71nZfJKOA705mRjSrtDwzlc
         6oiA==
X-Gm-Message-State: AOAM532eLYbaU1J8O7PSuPdYSCYWv5rf/OliKUNRO2IWi3/IDFHq/dY3
	INi4dsrl7ld3ZK7uI2nGmMa0MwbBjPqHWTjaMKM=
X-Google-Smtp-Source: ABdhPJxJ2W/tTl+kqKh5Qnt/jeghP2mK5zmz8IInN6ZdlcKSRQX/ZcNErPtY4Q2d6S128TEgw6uiBw==
X-Received: by 2002:aca:a9c4:: with SMTP id s187mr26634648oie.47.1620831461551;
        Wed, 12 May 2021 07:57:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.57.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:57:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/22] subversion: fix CVE-2020-17525
Date: Wed, 12 May 2021 04:56:40 -1000
Message-Id: <4c95f65ac81b2b4da317009f997f94758089d3ca.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../subversion/CVE-2020-17525.patch           | 117 ++++++++++++++++++
 .../subversion/subversion_1.13.0.bb           |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2020-17525.patch

diff --git a/meta/recipes-devtools/subversion/subversion/CVE-2020-17525.patch b/meta/recipes-devtools/subversion/subversion/CVE-2020-17525.patch
new file mode 100644
index 0000000000..5bebde2a86
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/CVE-2020-17525.patch
@@ -0,0 +1,117 @@
+Upstream-Status: Backport [ https://subversion.apache.org/security/CVE-2020-17525-advisory.txt ] 
+CVE: CVE-2020-17525
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+  Remote unauthenticated denial-of-service in Subversion mod_authz_svn.
+
+Summary:
+========
+
+  Subversion's mod_authz_svn module will crash if the server is using
+  in-repository authz rules with the AuthzSVNReposRelativeAccessFile
+  option and a client sends a request for a non-existing repository URL.
+
+  This can lead to disruption for users of the service.
+
+Known vulnerable:
+=================
+
+  mod_dav_svn+mod_authz_svn servers 1.9.0 through 1.10.6 (inclusive).
+  mod_dav_svn+mod_authz_svn servers 1.11.0 through 1.14.0 (inclusive).
+
+Known fixed:
+============
+
+  mod_dav_svn+mod_authz_svn servers 1.14.1
+  mod_dav_svn+mod_authz_svn servers 1.10.7
+
+Details:
+========
+
+  A null-pointer-dereference has been found in mod_authz_svn that results in
+  a remote unauthenticated Denial-of-Service in some server configurations.
+
+  The vulnerability can be triggered by an unauthenticated user if the
+  Apache HTTPD server is configured to use an in-repository authz file,
+  with configuration directives such as:
+
+    AuthzSVNAccessFile "^/authz"
+    AuthzSVNReposRelativeAccessFile "^/authz"
+
+  The problem originates when sending a GET request to a non-existent
+  repository. The mod_authz_svn module will attempt to find authz rules
+  at a path within the requested SVN repository. Upon constructing this
+  path, the function svn_repos_find_root_path will return a NULL pointer
+  since the requested repository does not exist on-disk.
+  A check for this legitimate NULL pointer condition is missing, which
+  results in a segmentation fault when the NULL pointer is used.
+
+  The in-repository authz feature was first introduced in Subversion 1.8:
+  https://subversion.apache.org/docs/release-notes/1.8.html#in-repo-authz
+
+  The missing NULL check was first introduced during refactoring of the
+  authz code during development work leading up to Subversion 1.9.
+  Subversion 1.8 servers are unaffected.
+
+Severity:
+=========
+
+  CVSSv3 Base Score: 7.5 (High)
+
+  CVSSv3 Base Vector: CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+  Exploitation results in denial of service by crashing the HTTPD worker
+  handling the request. The impact of this differs depending on how the
+  Apache HTTPD server is configured, including the choice of MPM (Multi-
+  Processing-Module). If the worker shares its memory address space with
+  the main thread, as is the case with e.g. the Event MPM, the entire
+  HTTPD server process will terminate. If the pre-fork MPM is used, the
+  worker will terminate but the HTTPD server will stay up, and service
+  availability will depend on how frequently the attacker is able to
+  send malicious requests which target the vulnerability.
+
+Recommendations:
+================
+
+  We recommend all users to upgrade to a known fixed release of the
+  Subversion mod_dav_svn server.
+
+  Users who are unable to upgrade may apply the included patches.
+
+  As a workaround, the use of in-repository authz rules files with
+  the AuthzSVNReposRelativeAccessFile can be avoided by switching
+  to an alternative configuration which fetches an authz rules file
+  from the server's filesystem, rather than from an SVN repository.
+
+References:
+===========
+
+  CVE-2020-17525 (Subversion)
+
+Reported by:
+============
+
+  Thomas Åkesson, simonsoft.se
+
+Patches:
+========
+
+  Patch for Subversion 1.10, 1.14:
+
+[[[
+Index: subversion/libsvn_repos/config_file.c
+===================================================================
+--- a/subversion/libsvn_repos/config_file.c	(revision 1883994)
++++ b/subversion/libsvn_repos/config_file.c	(working copy)
+@@ -237,6 +237,10 @@ get_repos_config(svn_stream_t **stream,
+     {
+       /* Search for a repository in the full path. */
+       repos_root_dirent = svn_repos_find_root_path(dirent, scratch_pool);
++      if (repos_root_dirent == NULL)
++        return svn_error_trace(handle_missing_file(stream, checksum, access,
++                                                   url, must_exist,
++                                                   svn_node_none));
+ 
+       /* Attempt to open a repository at repos_root_dirent. */
+       SVN_ERR(svn_repos_open3(&access->repos, repos_root_dirent, NULL,
+]]]
diff --git a/meta/recipes-devtools/subversion/subversion_1.13.0.bb b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
index 37b8ca3602..34c0dbe5b8 100644
--- a/meta/recipes-devtools/subversion/subversion_1.13.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://serfmacro.patch \
+           file://CVE-2020-17525.patch \
            "
 
 SRC_URI[md5sum] = "3004b4dae18bf45a0b6ea4ef8820064d"
-- 
2.25.1

