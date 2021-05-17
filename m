Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.19346.1621260841654525604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xSGC8ADN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id g18so3375558pfr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4tLGRrWIXRiVTY0FSW0n+sGKZZYUbaryBCg8mCb6c6Q=;
        b=xSGC8ADNl0BIlNUWmbK1D0aFDY7TzfWRXNIBA9KJ2DUmMeXSo6pSqlz5qclI+NKNne
         WHQhzOSi0ATmcZT4/LVt8dSFkB/Qoxkayq2URXE1yyIc0mwpk3MOz6C2owwDaLCQLRuw
         nx7Ed3YvN5Xh5uDts6f7/GnXNswKGR1kVqmuVCl3bv45BGNgJ2ex2kr0VICylzyTDA3r
         nxILZvPCHAC5tRDDCLoFfK61dZGERdsmeQtm2rJD6+qhwPu1ZySxUVsv0D24vPBJydan
         cAc4RJIYChCDg8f3e7G2p4hVfyEOOYOcrgZSDBtmtBmHgT+bO6aIxHrJonwDZLfwv6Hc
         5XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4tLGRrWIXRiVTY0FSW0n+sGKZZYUbaryBCg8mCb6c6Q=;
        b=fma6xIR/YNAasUPuW9iApE4+GWiSuehYpMJDrL9WVLsDnVjq/P47ulnv2xtG977gvW
         WESNOkRFOyo4XLbFPQtF8RZBCEaip8cB2vcjFE0xt7irIz9Ilw6rOHBwgBKpkyADIXdX
         Ln29JihveAa1x3ujxiLAKHan3Be4Fk2mnkMmvoKJD0yYLovMSorfaoYb6eAk1RpbGCuN
         NTneJ5hEKxoxj0mJ5L8jiJqNsF8USBsnXKQhsUSP9xILZHy9PKq4ObZMGz8o2OU6AuPi
         Q+yjWIAVIHje8C+p01rv9jP1tahrpmXHlHmba4lAYM4EernVIkZfckeUY3dFgqqPBxAs
         lTCQ==
X-Gm-Message-State: AOAM531cs389Rlp/V+0t4a1ItLC3muOG3uJyqTkxdKRg/HZYFukB6u6H
	gqHdvjklDf/iVLik+DMdp+j2LpZg2LLjkq/XucQ=
X-Google-Smtp-Source: ABdhPJydWeUXnMquerx9vomnsZLc4tjTdkPzDZI/zRXVFjshS9wCgPP0bYjRbOfjnIzpPRXxh6HEyA==
X-Received: by 2002:a62:ea05:0:b029:27a:6fc6:af83 with SMTP id t5-20020a62ea050000b029027a6fc6af83mr58834515pfh.24.1621260840629;
        Mon, 17 May 2021 07:14:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.13.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/35] subversion: fix CVE-2020-17525
Date: Mon, 17 May 2021 04:13:07 -1000
Message-Id: <3975fe2156d30cc64005e56666f4e88716d5ba27.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
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

