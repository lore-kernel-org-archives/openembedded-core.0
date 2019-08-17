Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8127F7F322
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 21:21:50 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id c81so4899709pfc.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=U/AkCS6HZxfhfdE4ZGxHCbYOJv5geNkYZCEN89EuAqw=;
	b=sPKNl0uNjzqx86OUNTRJnIjQV3+64ArbepPK6Z/AuszpSp6F1/dtDcM1JDNyff6/GY
	6IY4I03QP1fDbNsam37BregJIEkeGNpWdCa+wdGUsAdNyR6cd3O5zKlLXU3iPOnVe8Wx
	llJFHcwpR3Jg+K0k9dpizss/l1QYS7nmGiEANi/Ud8isA7SYvEeR9huXljHubVbvOjp4
	Btyq4j2opoLi0L/yDEGMXgbIJ8BgCNLKXTJdYTmoKh+wkXtRuX+X4l2M6aVqSLonXGuZ
	HhVsC3u/kGaxsapgLGclEaEXFzvclOfoSz/SPCOwEgALCyOXtIQtNzXRrW/0I7KliF6H
	f6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=U/AkCS6HZxfhfdE4ZGxHCbYOJv5geNkYZCEN89EuAqw=;
	b=hu2FQKX18wXiJ9xMp+zBwYr69SeyU8jE4jrkMY5ntl0n+VIodLT2fkcQ2xHHM/aj1h
	5dVcepYFE3m+uh3SJKZJehglgBmXqQsgfAj2OwaZPFCTCcHocinPskkoh8zlgcwpYHW4
	7EtfhnRswq//+/KRKV/QDOfDzn7h0XphagM2JfbPt2WbOa2/u0JPcvFkNNYVuigmVGj2
	KkWRiVVPOPHft+QWaTguWttNntD0w2mmdhl0ueESGHjzDg3ygpx92Z1mk+49TcPi2SUj
	MXoX9nXjRnIW/dbyuqapsgNVMd/Btl6GbIIFy1pQjCEDGB5/mY4N+QAs58lWDKKW+drO
	bwnA==
X-Gm-Message-State: APjAAAV3Py0jy0PBREo9E3IaJtoyIJw2fxN3trASc+h/xFZdCcje2DEm
	yGO1uPXsoJWuT5cYnuK6Y8nwOpvs
X-Google-Smtp-Source: APXvYqzR2YJXRDuACMDsJ72XvSA8J1KJ/q2NTLkeo/cdQUckz44udeCC72OgAver6UHA3gyipI0/wg==
X-Received: by 2002:aa7:97b7:: with SMTP id d23mr17754370pfq.203.1566076911426;
	Sat, 17 Aug 2019 14:21:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:29d8:851b:cd27:3ce0])
	by smtp.gmail.com with ESMTPSA id a20sm7261804pjo.0.2019.08.17.14.21.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Aug 2019 14:21:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Aug 2019 14:21:38 -0700
Message-Id: <144363decc922ed03a584eb9b29cf9808a469d08.1566076780.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1566076780.git.akuster808@gmail.com>
References: <cover.1566076780.git.akuster808@gmail.com>
Subject: [thud-next][ 5/8] dbus: fix CVE-2019-12749
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
X-List-Received-Date: Sat, 17 Aug 2019 21:21:50 -0000

From: Andrii Bordunov via Openembedded-core <openembedded-core@lists.openembedded.org>

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch | 127 +++++++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.12.10.bb           |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch

diff --git a/meta/recipes-core/dbus/dbus/CVE-2019-12749.patch b/meta/recipes-core/dbus/dbus/CVE-2019-12749.patch
new file mode 100644
index 0000000..393c70c
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/CVE-2019-12749.patch
@@ -0,0 +1,127 @@
+From f0120c5d97a4cc1b659e86d38f2b1f646ca20ea3 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 30 May 2019 12:53:03 +0100
+Subject: [PATCH] auth: Reject DBUS_COOKIE_SHA1 for users other than the server
+ owner
+
+The DBUS_COOKIE_SHA1 authentication mechanism aims to prove ownership
+of a shared home directory by having the server write a secret "cookie"
+into a .dbus-keyrings subdirectory of the desired identity's home
+directory with 0700 permissions, and having the client prove that it can
+read the cookie. This never actually worked for non-malicious clients in
+the case where server uid != client uid (unless the server and client
+both have privileges, such as Linux CAP_DAC_OVERRIDE or traditional
+Unix uid 0) because an unprivileged server would fail to write out the
+cookie, and an unprivileged client would be unable to read the resulting
+file owned by the server.
+
+Additionally, since dbus 1.7.10 we have checked that ~/.dbus-keyrings
+is owned by the uid of the server (a side-effect of a check added to
+harden our use of XDG_RUNTIME_DIR), further ruling out successful use
+by a non-malicious client with a uid differing from the server's.
+
+Joe Vennix of Apple Information Security discovered that the
+implementation of DBUS_COOKIE_SHA1 was susceptible to a symbolic link
+attack: a malicious client with write access to its own home directory
+could manipulate a ~/.dbus-keyrings symlink to cause the DBusServer to
+read and write in unintended locations. In the worst case this could
+result in the DBusServer reusing a cookie that is known to the
+malicious client, and treating that cookie as evidence that a subsequent
+client connection came from an attacker-chosen uid, allowing
+authentication bypass.
+
+This is mitigated by the fact that by default, the well-known system
+dbus-daemon (since 2003) and the well-known session dbus-daemon (in
+stable releases since dbus 1.10.0 in 2015) only accept the EXTERNAL
+authentication mechanism, and as a result will reject DBUS_COOKIE_SHA1
+at an early stage, before manipulating cookies. As a result, this
+vulnerability only applies to:
+
+* system or session dbus-daemons with non-standard configuration
+* third-party dbus-daemon invocations such as at-spi2-core (although
+  in practice at-spi2-core also only accepts EXTERNAL by default)
+* third-party uses of DBusServer such as the one in Upstart
+
+Avoiding symlink attacks in a portable way is difficult, because APIs
+like openat() and Linux /proc/self/fd are not universally available.
+However, because DBUS_COOKIE_SHA1 already doesn't work in practice for
+a non-matching uid, we can solve this vulnerability in an easier way
+without regressions, by rejecting it early (before looking at
+~/.dbus-keyrings) whenever the requested identity doesn't match the
+identity of the process hosting the DBusServer.
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+Closes: https://gitlab.freedesktop.org/dbus/dbus/issues/269
+Closes: CVE-2019-12749
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/dbus/dbus/commit
+/47b1a4c41004bf494b87370987b222c934b19016]
+
+CVE: CVE-2019-12749
+
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
+---
+ dbus/dbus-auth.c | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/dbus/dbus-auth.c b/dbus/dbus-auth.c
+index 37d8d4c9..7390a9d5 100644
+--- a/dbus/dbus-auth.c
++++ b/dbus/dbus-auth.c
+@@ -529,6 +529,7 @@ sha1_handle_first_client_response (DBusAuth         *auth,
+   DBusString tmp2;
+   dbus_bool_t retval = FALSE;
+   DBusError error = DBUS_ERROR_INIT;
++  DBusCredentials *myself = NULL;
+ 
+   _dbus_string_set_length (&auth->challenge, 0);
+   
+@@ -565,6 +566,34 @@ sha1_handle_first_client_response (DBusAuth         *auth,
+       return FALSE;
+     }
+ 
++  myself = _dbus_credentials_new_from_current_process ();
++
++  if (myself == NULL)
++    goto out;
++
++  if (!_dbus_credentials_same_user (myself, auth->desired_identity))
++    {
++      /*
++       * DBUS_COOKIE_SHA1 is not suitable for authenticating that the
++       * client is anyone other than the user owning the process
++       * containing the DBusServer: we probably aren't allowed to write
++       * to other users' home directories. Even if we can (for example
++       * uid 0 on traditional Unix or CAP_DAC_OVERRIDE on Linux), we
++       * must not, because the other user controls their home directory,
++       * and could carry out symlink attacks to make us read from or
++       * write to unintended locations. It's difficult to avoid symlink
++       * attacks in a portable way, so we just don't try. This isn't a
++       * regression, because DBUS_COOKIE_SHA1 never worked for other
++       * users anyway.
++       */
++      _dbus_verbose ("%s: client tried to authenticate as \"%s\", "
++                     "but that doesn't match this process",
++                     DBUS_AUTH_NAME (auth),
++                     _dbus_string_get_const_data (data));
++      retval = send_rejected (auth);
++      goto out;
++    }
++
+   /* we cache the keyring for speed, so here we drop it if it's the
+    * wrong one. FIXME caching the keyring here is useless since we use
+    * a different DBusAuth for every connection.
+@@ -679,6 +708,9 @@ sha1_handle_first_client_response (DBusAuth         *auth,
+   _dbus_string_zero (&tmp2);
+   _dbus_string_free (&tmp2);
+ 
++  if (myself != NULL)
++    _dbus_credentials_unref (myself);
++
+   return retval;
+ }
+ 
+-- 
+2.22.0
+
diff --git a/meta/recipes-core/dbus/dbus_1.12.10.bb b/meta/recipes-core/dbus/dbus_1.12.10.bb
index d71f7f7..d7ad1d8 100644
--- a/meta/recipes-core/dbus/dbus_1.12.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.10.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+		   file://CVE-2019-12749.patch \
 "
 
 SRC_URI[md5sum] = "c3e12b4206e2a7da39d7cc42567790ef"
-- 
2.7.4


