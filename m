Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.7172.1588714222539929279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 14:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MR6QSJHc;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id e26so194533wmk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 14:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jRflWUVEz5mPbpHR50ha/o3ov6fmfypYE82Mn8HwsKk=;
        b=MR6QSJHcwlhOWRaZt5+w8qeojAeon2kAg3YCxhHRlpc2kbnN+dkx2iGxsZEFMz8kMx
         GQdw6n45Wp2eldqtk9yX0fn0i/y9N30aEfYEDzqzy89Ks0abGpJExwOcfNY101c43oeg
         W0YDzTLgg0GxxzJE8zzBto5hrjy4GykNKGpsruTf/UaFhvC4MS4PEcSQnmP4JxSlRlmc
         9AdEZUQxKCBncPqKNdOpWcp+tNdgeB8IgWgSki5zbATMSu9RrKH2SI3WuQK87a1+sOjC
         sbbo4+O9sIuGUe674VRq8vwWVXQB49GgMujmKcqvEr3KavGETp0dBCzM0UolO6DEUZ+1
         IJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jRflWUVEz5mPbpHR50ha/o3ov6fmfypYE82Mn8HwsKk=;
        b=MYE9ZKFeMSp3t9zSi7bv5UJuBLzO5qLAOgfYn+JxGXVUorXV/q7Vrm2U5Ov5PwtCzl
         zDK48GHs5C3OBT1K5aY9PxqxdOIXgW+iGnMxtbrRNxN30rcQ6LehperMnzG19ajfGcON
         MYwkhaPXkpBXFjXXmpfSXVViyduAekeYAZpfHv5OVl/Le1L/Phhte0yBOxyLgym509m6
         RAMLPoVeA58fOchb0A0m9r2uZ6cnFwtN4drutLB9GPWjARUhlz2fZA8NAZjDx8+YU7gD
         pwWw1/9NZJHtQ9X/L3XXrbzydd+1WT29hTQ8YzWcDOrHopcLm8ynwiMkaClGi6xMZJKY
         gShw==
X-Gm-Message-State: AGi0PuZa75byW5AvNyc0Bln+M5yFNhgJVSW8EgXDZBJkjh5krj1GZd4Z
	cNNAJWxdud3oaB1sw4mPQ4ZFAoHkGA0=
X-Google-Smtp-Source: APiQypIgQRA3syVAQSN9QeNkm7FKQ1mqUG4HsnjH4GSO8u/xwlyBDLWvG5pC5go1KTpBZDzXPkNCFQ==
X-Received: by 2002:a1c:9cc6:: with SMTP id f189mr718208wme.75.1588714220465;
        Tue, 05 May 2020 14:30:20 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2pfrec.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id 5sm5577456wmg.34.2020.05.05.14.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 14:30:19 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] ref-manual: IMAGE_FEATURE, add allow-root-login
Date: Tue,  5 May 2020 23:30:13 +0200
Message-Id: <20200505213013.1529300-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Add documentation of allow-root-login
- Correct the documentation of allow-empty-password

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/ref-features.xml  | 17 ++++++++++-------
 documentation/ref-manual/ref-variables.xml |  8 ++++----
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/ref-features.xml b/documentation/ref-manual/ref-features.xml
index 294b297c20..b48b119ccc 100644
--- a/documentation/ref-manual/ref-features.xml
+++ b/documentation/ref-manual/ref-features.xml
@@ -210,11 +210,11 @@
                 <listitem><para><emphasis>usbhost:</emphasis> Include USB Host
                     support (allows to connect external keyboard, mouse,
                     storage, network etc).</para></listitem>
-                <listitem><para><emphasis>usrmerge:</emphasis> Merges the 
-                    <filename>/bin</filename>, <filename>/sbin</filename>, 
-                    <filename>/lib</filename>, and <filename>/lib64</filename>       
-                    directories into their respective counterparts in the 
-                    <filename>/usr</filename> directory to provide better package 
+                <listitem><para><emphasis>usrmerge:</emphasis> Merges the
+                    <filename>/bin</filename>, <filename>/sbin</filename>,
+                    <filename>/lib</filename>, and <filename>/lib64</filename>
+                    directories into their respective counterparts in the
+                    <filename>/usr</filename> directory to provide better package
                    and application compatibility.</para></listitem>
                 <listitem><para><emphasis>wayland:</emphasis> Include the
                     Wayland display server protocol and the library that
@@ -247,8 +247,11 @@
             The following image features are available for all images:
             <itemizedlist>
                 <listitem><para><emphasis>allow-empty-password:</emphasis>
-                    Allows Dropbear and OpenSSH to accept root logins
-                    and logins from accounts having an empty password string.
+                    Allows Dropbear and OpenSSH to accept logins from accounts
+                    with an empty password string.
+                    </para></listitem>
+                <listitem><para><emphasis>allow-root-login:</emphasis>
+                    Allows Dropbear and OpenSSH to accept root logins.
                     </para></listitem>
                 <listitem><para><emphasis>dbg-pkgs:</emphasis>
                     Installs debug symbol packages for all packages installed
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 9ebe72cbd0..0ef522f513 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -4493,10 +4493,10 @@
 "debug-tweaks" - Makes an image suitable for debugging.
                  For example, allows root logins without
                  passwords and enables post-installation
-                 logging. See the 'allow-empty-password'
-                 and 'post-install-logging' features in
-                 the "<link linkend='ref-features-image'>Image Features</link>" section for
-                 more information.
+                 logging. See the 'allow-empty-password',
+                 'allow-root-login' and 'post-install-logging'
+                 features in the "<link linkend='ref-features-image'>Image Features</link>"
+                 section for more information.
 
 "dev-pkgs" - Adds -dev packages for all installed packages.
              This is useful if you want to develop against
-- 
2.25.4

