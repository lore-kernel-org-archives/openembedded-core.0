Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id CC4DC73219
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 00:59:57 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 65so125703771pff.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 16:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QYi69ILLHuaxqGiDfPK+4pcbjPzQIuRUadBfGiK1qaI=;
	b=TW1Rej0SOYou9wonl5wpqZvxRrd3l6N8ma8QFDDjTrHzbdNusufydWUJW4GbPdJjb4
	Ex5Lqg0TpQnDtXsTf6NPzIWcpUYGnbDSllOj02BhO3gqtrEw3tXssT+FNO0Ka2gIVENK
	SjSvmV6CgFc2AIyIhOP45Ld8IY8lU6rphRMMbIpwNnJYcdx4gJIQaGjW66KYmLBU7oWX
	E5X+9ffNsMeG7VUIVDXwDYYnmayBGiQrwe/085QfYqNvTkzO9x9r5xBVTEsT0qv6YWBC
	fkv0BDBY4K0gwKoAPSJrDMCJR+R8inFLk0ojsqTzavls5G96C7DtO1WCTfcxe1TLlYLG
	eIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QYi69ILLHuaxqGiDfPK+4pcbjPzQIuRUadBfGiK1qaI=;
	b=ZRXlY7a41gxAQMAd89J6xHTKDPXxiyTGejKpvXY+R+bUrDTIEOVfkA9XYeES/8MlFR
	TQ00AOZTVqR3IN/5trpypGPVh5ZAg9oQSVxP6/qnYM2NOus1NH2dHQjj5Xw1ws+oJMWu
	qZdDlUZWzUuXbbxrPJi0zvp2nn8Gyr4PvPzk/Ubpm6uphxKl12VY2oBON/KMQDgnVaVZ
	qCd4eaFqvnn7YANRJVp4eyNIthoHXTW5f7erO7x3FCogQWEgKEfj/mr/RXyg/e5N2krN
	0lcK6cPBKxolMKWlbDnp12q5tHPuv5p+duvI039aBBw5lKtFIyH5QrxBpr11nazmkpbw
	Xw1A==
X-Gm-Message-State: ALoCoQneEW5cj8VWtXTeOj2zp4kf5Tz5vq6YcWpA9bAKFOE2v9UOcXVFKsAf1rzmrxhNyxILoxg2F+e4qXQAP2xMaMZOywLWOQ==
X-Received: by 10.98.66.74 with SMTP id p71mr19183648pfa.105.1452905998326;
	Fri, 15 Jan 2016 16:59:58 -0800 (PST)
Received: from bigIsland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	i76sm17915055pfj.68.2016.01.15.16.59.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jan 2016 16:59:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 16:59:49 -0800
Message-Id: <1452905989-29316-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452905989-29316-1-git-send-email-akuster808@gmail.com>
References: <1452905989-29316-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][master][jetrho]] openssh: CVE-2016-1907
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
X-List-Received-Date: Sat, 16 Jan 2016 00:59:58 -0000

From: Armin Kuster <akuster@mvista.com>

This issue requires three commits:
https://anongit.mindrot.org/openssh.git/commit/?id=ed4ce82dbfa8a3a3c8ea6fa0db113c71e234416c
https://anongit.mindrot.org/openssh.git/commit/?id=f98a09cacff7baad8748c9aa217afd155a4d493f
https://anongit.mindrot.org/openssh.git/commit/?id=2fecfd486bdba9f51b3a789277bb0733ca36e1c0

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssh/openssh/CVE-2016-1907_2.patch          |  65 ++++
 .../openssh/openssh/CVE-2016-1907_3.patch          | 329 +++++++++++++++++++++
 .../openssh/CVE-2016-1907_upstream_commit.patch    |  33 +++
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb |   5 +-
 4 files changed, 431 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_3.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_2.patch
new file mode 100644
index 0000000..9fac69c
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_2.patch
@@ -0,0 +1,65 @@
+From f98a09cacff7baad8748c9aa217afd155a4d493f Mon Sep 17 00:00:00 2001
+From: "mmcc@openbsd.org" <mmcc@openbsd.org>
+Date: Tue, 20 Oct 2015 03:36:35 +0000
+Subject: [PATCH] upstream commit
+
+Replace a function-local allocation with stack memory.
+
+ok djm@
+
+Upstream-ID: c09fbbab637053a2ab9f33ca142b4e20a4c5a17e
+Upstream-Status: Backport
+CVE: CVE-2016-1907
+
+[YOCTO #8935]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ clientloop.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/clientloop.c b/clientloop.c
+index 87ceb3d..1e05cba 100644
+--- a/clientloop.c
++++ b/clientloop.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: clientloop.c,v 1.275 2015/07/10 06:21:53 markus Exp $ */
++/* $OpenBSD: clientloop.c,v 1.276 2015/10/20 03:36:35 mmcc Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -311,11 +311,10 @@ client_x11_get_proto(const char *display, const char *xauth_path,
+ 	static char proto[512], data[512];
+ 	FILE *f;
+ 	int got_data = 0, generated = 0, do_unlink = 0, i;
+-	char *xauthdir, *xauthfile;
++	char xauthdir[PATH_MAX] = "", xauthfile[PATH_MAX] = "";
+ 	struct stat st;
+ 	u_int now, x11_timeout_real;
+ 
+-	xauthdir = xauthfile = NULL;
+ 	*_proto = proto;
+ 	*_data = data;
+ 	proto[0] = data[0] = '\0';
+@@ -343,8 +342,6 @@ client_x11_get_proto(const char *display, const char *xauth_path,
+ 			display = xdisplay;
+ 		}
+ 		if (trusted == 0) {
+-			xauthdir = xmalloc(PATH_MAX);
+-			xauthfile = xmalloc(PATH_MAX);
+ 			mktemp_proto(xauthdir, PATH_MAX);
+ 			/*
+ 			 * The authentication cookie should briefly outlive
+@@ -407,8 +404,6 @@ client_x11_get_proto(const char *display, const char *xauth_path,
+ 		unlink(xauthfile);
+ 		rmdir(xauthdir);
+ 	}
+-	free(xauthdir);
+-	free(xauthfile);
+ 
+ 	/*
+ 	 * If we didn't get authentication data, just make up some
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_3.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_3.patch
new file mode 100644
index 0000000..3dfc51a
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_3.patch
@@ -0,0 +1,329 @@
+From ed4ce82dbfa8a3a3c8ea6fa0db113c71e234416c Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 13 Jan 2016 23:04:47 +0000
+Subject: [PATCH] upstream commit
+
+eliminate fallback from untrusted X11 forwarding to trusted
+ forwarding when the X server disables the SECURITY extension; Reported by
+ Thomas Hoger; ok deraadt@
+
+Upstream-ID: f76195bd2064615a63ef9674a0e4096b0713f938
+Upstream-Status: Backport
+CVE: CVE-2016-1907
+
+[YOCTO #8935]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ clientloop.c | 114 ++++++++++++++++++++++++++++++++++++-----------------------
+ clientloop.h |   4 +--
+ mux.c        |  22 ++++++------
+ ssh.c        |  23 +++++-------
+ 4 files changed, 93 insertions(+), 70 deletions(-)
+
+Index: openssh-7.1p2/clientloop.c
+===================================================================
+--- openssh-7.1p2.orig/clientloop.c
++++ openssh-7.1p2/clientloop.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: clientloop.c,v 1.276 2015/10/20 03:36:35 mmcc Exp $ */
++/* $OpenBSD: clientloop.c,v 1.279 2016/01/13 23:04:47 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -288,6 +288,9 @@ client_x11_display_valid(const char *dis
+ {
+ 	size_t i, dlen;
+ 
++	if (display == NULL)
++		return 0;
++
+ 	dlen = strlen(display);
+ 	for (i = 0; i < dlen; i++) {
+ 		if (!isalnum((u_char)display[i]) &&
+@@ -301,34 +304,33 @@ client_x11_display_valid(const char *dis
+ 
+ #define SSH_X11_PROTO		"MIT-MAGIC-COOKIE-1"
+ #define X11_TIMEOUT_SLACK	60
+-void
++int
+ client_x11_get_proto(const char *display, const char *xauth_path,
+     u_int trusted, u_int timeout, char **_proto, char **_data)
+ {
+-	char cmd[1024];
+-	char line[512];
+-	char xdisplay[512];
++	char cmd[1024], line[512], xdisplay[512];
++	char xauthfile[PATH_MAX], xauthdir[PATH_MAX];
+ 	static char proto[512], data[512];
+ 	FILE *f;
+-	int got_data = 0, generated = 0, do_unlink = 0, i;
+-	char xauthdir[PATH_MAX] = "", xauthfile[PATH_MAX] = "";
++	int got_data = 0, generated = 0, do_unlink = 0, i, r;
+ 	struct stat st;
+ 	u_int now, x11_timeout_real;
+ 
+ 	*_proto = proto;
+ 	*_data = data;
+-	proto[0] = data[0] = '\0';
++	proto[0] = data[0] = xauthfile[0] = xauthdir[0] = '\0';
+ 
+-	if (xauth_path == NULL ||(stat(xauth_path, &st) == -1)) {
+-		debug("No xauth program.");
+-	} else if (!client_x11_display_valid(display)) {
+-		logit("DISPLAY '%s' invalid, falling back to fake xauth data",
++	if (!client_x11_display_valid(display)) {
++		logit("DISPLAY \"%s\" invalid; disabling X11 forwarding",
+ 		    display);
+-	} else {
+-		if (display == NULL) {
+-			debug("x11_get_proto: DISPLAY not set");
+-			return;
+-		}
++		return -1;
++	}
++	if (xauth_path != NULL && stat(xauth_path, &st) == -1) {
++		debug("No xauth program.");
++		xauth_path = NULL;
++	}
++
++	if (xauth_path != NULL) {
+ 		/*
+ 		 * Handle FamilyLocal case where $DISPLAY does
+ 		 * not match an authorization entry.  For this we
+@@ -337,43 +339,60 @@ client_x11_get_proto(const char *display
+ 		 *      is not perfect.
+ 		 */
+ 		if (strncmp(display, "localhost:", 10) == 0) {
+-			snprintf(xdisplay, sizeof(xdisplay), "unix:%s",
+-			    display + 10);
++			if ((r = snprintf(xdisplay, sizeof(xdisplay), "unix:%s",
++			    display + 10)) < 0 ||
++			    (size_t)r >= sizeof(xdisplay)) {
++				error("%s: display name too long", __func__);
++				return -1;
++			}
+ 			display = xdisplay;
+ 		}
+ 		if (trusted == 0) {
+-			mktemp_proto(xauthdir, PATH_MAX);
+ 			/*
++			 * Generate an untrusted X11 auth cookie.
++			 *
+ 			 * The authentication cookie should briefly outlive
+ 			 * ssh's willingness to forward X11 connections to
+ 			 * avoid nasty fail-open behaviour in the X server.
+ 			 */
++			mktemp_proto(xauthdir, sizeof(xauthdir));
++			if (mkdtemp(xauthdir) == NULL) {
++				error("%s: mkdtemp: %s",
++				    __func__, strerror(errno));
++				return -1;
++			}
++			do_unlink = 1;
++			if ((r = snprintf(xauthfile, sizeof(xauthfile),
++			    "%s/xauthfile", xauthdir)) < 0 ||
++			    (size_t)r >= sizeof(xauthfile)) {
++				error("%s: xauthfile path too long", __func__);
++				unlink(xauthfile);
++				rmdir(xauthdir);
++				return -1;
++			}
++
+ 			if (timeout >= UINT_MAX - X11_TIMEOUT_SLACK)
+ 				x11_timeout_real = UINT_MAX;
+ 			else
+ 				x11_timeout_real = timeout + X11_TIMEOUT_SLACK;
+-			if (mkdtemp(xauthdir) != NULL) {
+-				do_unlink = 1;
+-				snprintf(xauthfile, PATH_MAX, "%s/xauthfile",
+-				    xauthdir);
+-				snprintf(cmd, sizeof(cmd),
+-				    "%s -f %s generate %s " SSH_X11_PROTO
+-				    " untrusted timeout %u 2>" _PATH_DEVNULL,
+-				    xauth_path, xauthfile, display,
+-				    x11_timeout_real);
+-				debug2("x11_get_proto: %s", cmd);
+-				if (x11_refuse_time == 0) {
+-					now = monotime() + 1;
+-					if (UINT_MAX - timeout < now)
+-						x11_refuse_time = UINT_MAX;
+-					else
+-						x11_refuse_time = now + timeout;
+-					channel_set_x11_refuse_time(
+-					    x11_refuse_time);
+-				}
+-				if (system(cmd) == 0)
+-					generated = 1;
++			if ((r = snprintf(cmd, sizeof(cmd),
++			    "%s -f %s generate %s " SSH_X11_PROTO
++			    " untrusted timeout %u 2>" _PATH_DEVNULL,
++			    xauth_path, xauthfile, display,
++			    x11_timeout_real)) < 0 ||
++			    (size_t)r >= sizeof(cmd))
++				fatal("%s: cmd too long", __func__);
++			debug2("%s: %s", __func__, cmd);
++			if (x11_refuse_time == 0) {
++				now = monotime() + 1;
++				if (UINT_MAX - timeout < now)
++					x11_refuse_time = UINT_MAX;
++				else
++					x11_refuse_time = now + timeout;
++				channel_set_x11_refuse_time(x11_refuse_time);
+ 			}
++			if (system(cmd) == 0)
++				generated = 1;
+ 		}
+ 
+ 		/*
+@@ -395,9 +414,7 @@ client_x11_get_proto(const char *display
+ 				got_data = 1;
+ 			if (f)
+ 				pclose(f);
+-		} else
+-			error("Warning: untrusted X11 forwarding setup failed: "
+-			    "xauth key data not generated");
++		}
+ 	}
+ 
+ 	if (do_unlink) {
+@@ -405,6 +422,13 @@ client_x11_get_proto(const char *display
+ 		rmdir(xauthdir);
+ 	}
+ 
++	/* Don't fall back to fake X11 data for untrusted forwarding */
++	if (!trusted && !got_data) {
++		error("Warning: untrusted X11 forwarding setup failed: "
++		    "xauth key data not generated");
++		return -1;
++	}
++
+ 	/*
+ 	 * If we didn't get authentication data, just make up some
+ 	 * data.  The forwarding code will check the validity of the
+@@ -427,6 +451,8 @@ client_x11_get_proto(const char *display
+ 			rnd >>= 8;
+ 		}
+ 	}
++
++	return 0;
+ }
+ 
+ /*
+Index: openssh-7.1p2/clientloop.h
+===================================================================
+--- openssh-7.1p2.orig/clientloop.h
++++ openssh-7.1p2/clientloop.h
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: clientloop.h,v 1.31 2013/06/02 23:36:29 dtucker Exp $ */
++/* $OpenBSD: clientloop.h,v 1.32 2016/01/13 23:04:47 djm Exp $ */
+ 
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+@@ -39,7 +39,7 @@
+ 
+ /* Client side main loop for the interactive session. */
+ int	 client_loop(int, int, int);
+-void	 client_x11_get_proto(const char *, const char *, u_int, u_int,
++int	 client_x11_get_proto(const char *, const char *, u_int, u_int,
+ 	    char **, char **);
+ void	 client_global_request_reply_fwd(int, u_int32_t, void *);
+ void	 client_session2_setup(int, int, int, const char *, struct termios *,
+Index: openssh-7.1p2/mux.c
+===================================================================
+--- openssh-7.1p2.orig/mux.c
++++ openssh-7.1p2/mux.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: mux.c,v 1.54 2015/08/19 23:18:26 djm Exp $ */
++/* $OpenBSD: mux.c,v 1.58 2016/01/13 23:04:47 djm Exp $ */
+ /*
+  * Copyright (c) 2002-2008 Damien Miller <djm@openbsd.org>
+  *
+@@ -1354,16 +1354,18 @@ mux_session_confirm(int id, int success,
+ 		char *proto, *data;
+ 
+ 		/* Get reasonable local authentication information. */
+-		client_x11_get_proto(display, options.xauth_location,
++		if (client_x11_get_proto(display, options.xauth_location,
+ 		    options.forward_x11_trusted, options.forward_x11_timeout,
+-		    &proto, &data);
+-		/* Request forwarding with authentication spoofing. */
+-		debug("Requesting X11 forwarding with authentication "
+-		    "spoofing.");
+-		x11_request_forwarding_with_spoofing(id, display, proto,
+-		    data, 1);
+-		client_expect_confirm(id, "X11 forwarding", CONFIRM_WARN);
+-		/* XXX exit_on_forward_failure */
++		    &proto, &data) == 0) {
++			/* Request forwarding with authentication spoofing. */
++			debug("Requesting X11 forwarding with authentication "
++			    "spoofing.");
++			x11_request_forwarding_with_spoofing(id, display, proto,
++			    data, 1);
++			/* XXX exit_on_forward_failure */
++			client_expect_confirm(id, "X11 forwarding",
++			    CONFIRM_WARN);
++		}
+ 	}
+ 
+ 	if (cctx->want_agent_fwd && options.forward_agent) {
+Index: openssh-7.1p2/ssh.c
+===================================================================
+--- openssh-7.1p2.orig/ssh.c
++++ openssh-7.1p2/ssh.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh.c,v 1.420 2015/07/30 00:01:34 djm Exp $ */
++/* $OpenBSD: ssh.c,v 1.433 2016/01/13 23:04:47 djm Exp $ */
+ /*
+  * Author: Tatu Ylonen <ylo@cs.hut.fi>
+  * Copyright (c) 1995 Tatu Ylonen <ylo@cs.hut.fi>, Espoo, Finland
+@@ -1604,6 +1604,7 @@ ssh_session(void)
+ 	struct winsize ws;
+ 	char *cp;
+ 	const char *display;
++	char *proto = NULL, *data = NULL;
+ 
+ 	/* Enable compression if requested. */
+ 	if (options.compression) {
+@@ -1674,13 +1675,9 @@ ssh_session(void)
+ 	display = getenv("DISPLAY");
+ 	if (display == NULL && options.forward_x11)
+ 		debug("X11 forwarding requested but DISPLAY not set");
+-	if (options.forward_x11 && display != NULL) {
+-		char *proto, *data;
+-		/* Get reasonable local authentication information. */
+-		client_x11_get_proto(display, options.xauth_location,
+-		    options.forward_x11_trusted,
+-		    options.forward_x11_timeout,
+-		    &proto, &data);
++	if (options.forward_x11 && client_x11_get_proto(display,
++	    options.xauth_location, options.forward_x11_trusted,
++	    options.forward_x11_timeout, &proto, &data) == 0) {
+ 		/* Request forwarding with authentication spoofing. */
+ 		debug("Requesting X11 forwarding with authentication "
+ 		    "spoofing.");
+@@ -1770,6 +1767,7 @@ ssh_session2_setup(int id, int success,
+ 	extern char **environ;
+ 	const char *display;
+ 	int interactive = tty_flag;
++	char *proto = NULL, *data = NULL;
+ 
+ 	if (!success)
+ 		return; /* No need for error message, channels code sens one */
+@@ -1777,12 +1775,9 @@ ssh_session2_setup(int id, int success,
+ 	display = getenv("DISPLAY");
+ 	if (display == NULL && options.forward_x11)
+ 		debug("X11 forwarding requested but DISPLAY not set");
+-	if (options.forward_x11 && display != NULL) {
+-		char *proto, *data;
+-		/* Get reasonable local authentication information. */
+-		client_x11_get_proto(display, options.xauth_location,
+-		    options.forward_x11_trusted,
+-		    options.forward_x11_timeout, &proto, &data);
++	if (options.forward_x11 && client_x11_get_proto(display,
++	    options.xauth_location, options.forward_x11_trusted,
++	    options.forward_x11_timeout, &proto, &data) == 0) {
+ 		/* Request forwarding with authentication spoofing. */
+ 		debug("Requesting X11 forwarding with authentication "
+ 		    "spoofing.");
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch
new file mode 100644
index 0000000..f3d132e
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch
@@ -0,0 +1,33 @@
+From d77148e3a3ef6c29b26ec74331455394581aa257 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 8 Nov 2015 21:59:11 +0000
+Subject: [PATCH] upstream commit
+
+fix OOB read in packet code caused by missing return
+ statement found by Ben Hawkes; ok markus@ deraadt@
+
+Upstream-ID: a3e3a85434ebfa0690d4879091959591f30efc62
+
+Upstream-Status: Backport
+CVE: CVE-2016-1907
+
+[YOCTO #8935]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ packet.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: openssh-7.1p2/packet.c
+===================================================================
+--- openssh-7.1p2.orig/packet.c
++++ openssh-7.1p2/packet.c
+@@ -1855,6 +1855,7 @@ ssh_packet_process_incoming(struct ssh *
+ 		if (len >= state->packet_discard) {
+ 			if ((r = ssh_packet_stop_discard(ssh)) != 0)
+ 				return r;
++			return SSH_ERR_CONN_CORRUPT;
+ 		}
+ 		state->packet_discard -= len;
+ 		return 0;
diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
index ac824ee..9c62d78 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
@@ -20,7 +20,10 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://sshdgenkeys.service \
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
-           file://run-ptest"
+           file://run-ptest \
+           file://CVE-2016-1907_upstream_commit.patch \
+           file://CVE-2016-1907_2.patch \
+           file://CVE-2016-1907_3.patch "
 
 PAM_SRC_URI = "file://sshd"
 
-- 
1.9.1


