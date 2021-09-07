Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.4601.1631057549734517619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 16:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PeAZgrJB;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id e7so540544pgk.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 16:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tRhkFcHsKUS9HEIuJH6jJvp4zGVG57t5JGrPUdvp2lU=;
        b=PeAZgrJBlPdWmiVJYiB3WBIYbx496dph6maMV9s7WXUqu8bcl3XEKb/NdO14S7DQXf
         Qe1/MACRL16ePiWWnET7gE/8mvhAFXkMamY9ZCD/uafS1Gh2tbeNv2H7bAZn/yxhRZw2
         rX454Dl3jtpEJ81i9U7JuNcjbGu1GTMvjBiAcHI8YZTT/bCbegdwuT2M66koDURZUcI5
         1bhbLQc9Xc6Y/GGuLrTbmAQ4B2FinWRifD1xvtvPvt0OJz+++YZPpv30vSHk1MYnBCJJ
         u2jUbEftNdmxblOjBkdJ+QvTcxvFKpKv3RyudqCATI+y9YLL+ZhchHrSuGyMO3cQ67Rg
         qkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tRhkFcHsKUS9HEIuJH6jJvp4zGVG57t5JGrPUdvp2lU=;
        b=NTNac/4tXbqK6roFcy/4CZghc9ZIf8tIe3Wt1LwL0OBHsSpXcKsiDnanqyW7qdbfsf
         SENqVzjeXLZlFE4xoUAqq31jN9oy4cnf510QFux9+OW/BXCp4tLPAu3mW9nUYCrgGqdv
         +5qJIwkPHIOXprl4SKR7mJNrECQBugkSRj6sF3OEdZAQ55C5lg3PwKWNY15pS6NApY0C
         6j5y6yW2rN1GNanPxBLmVjo5spSnhXzCFv5yF9kkjVYaAADF3AgxvehesDSSzmq12HYL
         YLcoZw+GV0/4P8vWLAyYCAXh2WWI2kJ0pTj6meUN+xsDbEoqZBxqZ/TKnd3CujEL6rIE
         cyDw==
X-Gm-Message-State: AOAM533vX2AFk2yoQ1wyHa32cocaWI4FuoFQhGFu+VtT4VNKaZSUx1zf
	Y7avAssAoI/760KhzN2ijnbce+pbA6c=
X-Google-Smtp-Source: ABdhPJzb0WSb5qToTuo9p+HY3NmL3ieqK+JQrPVHnrjOx6ASQDA6XH8BW0tne96gswc1jbGwi0o+qA==
X-Received: by 2002:aa7:8a19:0:b0:3ed:c54d:663c with SMTP id m25-20020aa78a19000000b003edc54d663cmr850592pfa.24.1631057548927;
        Tue, 07 Sep 2021 16:32:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ece:8e2f:f07e:736f])
        by smtp.gmail.com with ESMTPSA id d200sm157186pfd.127.2021.09.07.16.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 16:32:28 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/5] dbus: upgrade 1.12.16 -> 1.12.18
Date: Tue,  7 Sep 2021 16:32:23 -0700
Message-Id: <20210907233227.3265977-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 8d33a2a4e4b6ff8f831523e5b1b16ead6b29cc79)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a62471f0641551717a260c67690d3a7d280ac028)
[Bug fix only update, drop cve patch now included

a0926ef86f (tag: dbus-1.12.18) Prepare 1.12.18
8bc1381819 fdpass test: Assert that we don't leak file descriptors
272d484283 sysdeps-unix: On MSG_CTRUNC, close the fds we did receive <- cve fix
31297172f1 Update NEWS
041d579139 dbus-daemon test: Don't test fd limits if in an unprivileged container
55b3f71376 Update NEWS
ced04aabc7 doxygen: fix example for dbus_message_append_args
3e40637b10 Update NEWS
3e0ea34966 cmake: Add X11 include path for tools
d0992805d7 doc: replace dbus-send's --address with --peer and --bus
dd32f6b617 Update NEWS
d251fe7850 Merge branch 'cherry-pick-b034b83b' into 'dbus-1.12'
2c6b0ad7f6 bus: Don't explicitly clear BusConnections.monitors
df0c675b93 Merge branch 'cherry-pick-bf71a58e' into 'dbus-1.12'
beb79b94fb doc: Fix environment variable name in dbus-daemon(1)
eab5d4a420 Start 1.12.18 development]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dbus/dbus/CVE-2020-12049.patch            | 78 -------------------
 .../dbus/{dbus_1.12.16.bb => dbus_1.12.18.bb} |  5 +-
 2 files changed, 2 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
 rename meta/recipes-core/dbus/{dbus_1.12.16.bb => dbus_1.12.18.bb} (97%)

diff --git a/meta/recipes-core/dbus/dbus/CVE-2020-12049.patch b/meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
deleted file mode 100644
index ac7a4b7a71..0000000000
--- a/meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 872b085f12f56da25a2dbd9bd0b2dff31d5aea63 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@collabora.com>
-Date: Thu, 16 Apr 2020 14:45:11 +0100
-Subject: [PATCH] sysdeps-unix: On MSG_CTRUNC, close the fds we did receive
-
-MSG_CTRUNC indicates that we have received fewer fds that we should
-have done because the buffer was too small, but we were treating it
-as though it indicated that we received *no* fds. If we received any,
-we still have to make sure we close them, otherwise they will be leaked.
-
-On the system bus, if an attacker can induce us to leak fds in this
-way, that's a local denial of service via resource exhaustion.
-
-Reported-by: Kevin Backhouse, GitHub Security Lab
-Fixes: dbus#294
-Fixes: CVE-2020-12049
-Fixes: GHSL-2020-057
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/872b085f12f56da25a2dbd9bd0b2dff31d5aea63]
-CVE: CVE-2020-12049
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
- dbus/dbus-sysdeps-unix.c | 32 ++++++++++++++++++++------------
- 1 file changed, 20 insertions(+), 12 deletions(-)
-
-diff --git a/dbus/dbus-sysdeps-unix.c b/dbus/dbus-sysdeps-unix.c
-index b5fc2466..b176dae1 100644
---- a/dbus/dbus-sysdeps-unix.c
-+++ b/dbus/dbus-sysdeps-unix.c
-@@ -435,18 +435,6 @@ _dbus_read_socket_with_unix_fds (DBusSocket        fd,
-       struct cmsghdr *cm;
-       dbus_bool_t found = FALSE;
- 
--      if (m.msg_flags & MSG_CTRUNC)
--        {
--          /* Hmm, apparently the control data was truncated. The bad
--             thing is that we might have completely lost a couple of fds
--             without chance to recover them. Hence let's treat this as a
--             serious error. */
--
--          errno = ENOSPC;
--          _dbus_string_set_length (buffer, start);
--          return -1;
--        }
--
-       for (cm = CMSG_FIRSTHDR(&m); cm; cm = CMSG_NXTHDR(&m, cm))
-         if (cm->cmsg_level == SOL_SOCKET && cm->cmsg_type == SCM_RIGHTS)
-           {
-@@ -501,6 +489,26 @@ _dbus_read_socket_with_unix_fds (DBusSocket        fd,
-       if (!found)
-         *n_fds = 0;
- 
-+      if (m.msg_flags & MSG_CTRUNC)
-+        {
-+          unsigned int i;
-+
-+          /* Hmm, apparently the control data was truncated. The bad
-+             thing is that we might have completely lost a couple of fds
-+             without chance to recover them. Hence let's treat this as a
-+             serious error. */
-+
-+          /* We still need to close whatever fds we *did* receive,
-+           * otherwise they'll never get closed. (CVE-2020-12049) */
-+          for (i = 0; i < *n_fds; i++)
-+            close (fds[i]);
-+
-+          *n_fds = 0;
-+          errno = ENOSPC;
-+          _dbus_string_set_length (buffer, start);
-+          return -1;
-+        }
-+
-       /* put length back (doesn't actually realloc) */
-       _dbus_string_set_length (buffer, start + bytes_read);
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-core/dbus/dbus_1.12.16.bb b/meta/recipes-core/dbus/dbus_1.12.18.bb
similarity index 97%
rename from meta/recipes-core/dbus/dbus_1.12.16.bb
rename to meta/recipes-core/dbus/dbus_1.12.18.bb
index 10d1b34448..2fcb3079ad 100644
--- a/meta/recipes-core/dbus/dbus_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.18.bb
@@ -16,11 +16,10 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-           file://CVE-2020-12049.patch \
 "
 
-SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
-SRC_URI[sha256sum] = "54a22d2fa42f2eb2a871f32811c6005b531b9613b1b93a0d269b05e7549fec80"
+SRC_URI[md5sum] = "4ca570c281be35d0b30ab83436712242"
+SRC_URI[sha256sum] = "64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
-- 
2.25.1

