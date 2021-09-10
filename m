Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web08.9685.1631282870937986649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UzGBs30I;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id q39so3030305oiw.12
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PfPukDnrQEpO0TeL3FdL95QaA7grsqnWt7fghctzDIs=;
        b=UzGBs30IfcaK5knXS3pAWgRFjcz7gReYr7N4uxugHHD2ivwVhtzeaT7DeW/+lLv8Qs
         a3ENf4bYOdCIhvB749t4OU+dyC6ly7q0gzOVC6oF5P6rSykt+mm9+UanGFw0uwaG+YNI
         0b5aYoVc/eIm/vZHC+yM8p8JVWVLXf4AcfIKhu+293krwIKVROElfDOKgKWn83w0EIuV
         +5bjjyaxvly4SV1pB/2Oj1BT0GXQsI4fSPebPuu2UClkM+rWeRzJq4CJUG7v8olRCE4q
         PLcSb4sFfNISutJkqz82O/LK20HaI1Ypwicx71A8wWYWynuY07ldmONhuTKeqCeozrD/
         dfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PfPukDnrQEpO0TeL3FdL95QaA7grsqnWt7fghctzDIs=;
        b=HVqdcciUiWj9j+CsuNGQWSjZCYZ9ljUbWK1JaaHdKNs4LAekXP6iH4J7dgC6afLT2l
         nGf3YJ29UgC680OjW/S/3T5MIio6NYmGZpz2OcKEewVGau4hVx2Ob56gmkaN+CUnAvST
         q0Mvez9fdBdCHzsE8m75Pa0rAvefPxWQsyRmD0J9+09HwYDQJHHprpe7UMDtZOmQqjbv
         cWv79kTvn9F1HvvOq757gSl7hoJAHLSZ/26XCpRmzXqy7TQLRppsbx4rwfeUXoSJ66Pc
         M/GL7aIw2rc8EFXauIzxbwG1gZPsonHqtmuU2OCr+fO/qKsQqtBMCzqiVy9xyH0YpA7Z
         spIQ==
X-Gm-Message-State: AOAM530Wx6TlE8N4F6Cq1/4TZ/DmrGOYv6o5TqqcNgi3h2DkN1G9JtTX
	0mjHQwfgj+imqkXYdN/bWz/av/NJdWm1Uqtk
X-Google-Smtp-Source: ABdhPJziWsqMCu9iX85MOcr//9wwDcfEIrTNWu8CFqrynsRP4RZEYYFo6+esaRbIQ5gtkh8KjpB34g==
X-Received: by 2002:aca:ab93:: with SMTP id u141mr4233935oie.151.1631282869661;
        Fri, 10 Sep 2021 07:07:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.07.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:07:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/9] dbus: upgrade 1.12.16 -> 1.12.18
Date: Fri, 10 Sep 2021 04:07:12 -1000
Message-Id: <376916ce6b3e0fe0ef22d5bda4efee5550c9b399.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631282682.git.steve@sakoman.com>
References: <cover.1631282682.git.steve@sakoman.com>
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

Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

