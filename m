Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id E96B760123
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 18:22:53 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so153150529pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 10:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=JBBH9V49fTbyEC6d6Fni35bxaXc8wkYQw4coWWvatRc=;
	b=o8C+WAw5iuFZ0YKUU2k/13V3b8B+HmCJGHjzeN3k4jBH+s5FrnlV2VjTDtJW+Uf1Hu
	2SCN3e04OANn5itnbq9OgNWVZ0Xy4DhIZG/zN3AjRMpW6lSq2+Jxh0BCapfw79hrzqmu
	u5KLtPhGwKPzctj7LpyL9nIag8D3tePAtGdNhQ7ypfEmn0lvzhyuCNgnnT9S34cx7IDt
	WrZdnpKPdurvsG4KFPniRkWlwYEX71TqjJkMnEsMw134kPgikSxM/T9gVAghb22AlouQ
	861ZMH+o1lqbVuCgbFcnGGbNcN/HadppuXzVRVbbqoiC5k1aGIPGnbrbEmACzAmLhVrW
	x1Ww==
X-Received: by 10.98.0.137 with SMTP id 131mr6861145pfa.137.1448130174709;
	Sat, 21 Nov 2015 10:22:54 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	bd2sm4418924pbb.25.2015.11.21.10.22.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Nov 2015 10:22:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id D8D8FFCC83A; Sat, 21 Nov 2015 10:22:47 -0800 (PST)
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Nov 2015 10:22:45 -0800
Message-Id: <8a2034bffef3811ecff710b9a29dedeb52ed0f27.1448130025.git.akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1448130024.git.akuster@mvista.com>
References: <cover.1448130024.git.akuster@mvista.com>
In-Reply-To: <cover.1448130024.git.akuster@mvista.com>
References: <cover.1448130024.git.akuster@mvista.com>
Subject: [PATCH 4/4] openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565
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
X-List-Received-Date: Sat, 21 Nov 2015 18:22:55 -0000

three security fixes.

CVE-2015-6563 (Low) openssh: Privilege separation weakness related to PAM support
CVE-2015-6564 (medium)  openssh: Use-after-free bug related to PAM support
CVE-2015-6565 (High)  openssh: Incorrectly set TTYs to be world-writable

(From OE-Core rev: 259df232b513367a0a18b17e3e377260a770288f)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>

Conflicts:
	meta/recipes-connectivity/openssh/openssh_6.6p1.bb
---
 .../openssh/openssh/CVE-2015-6563.patch            | 36 ++++++++++++++++++++++
 .../openssh/openssh/CVE-2015-6564.patch            | 34 ++++++++++++++++++++
 .../openssh/openssh/CVE-2015-6565.patch            | 35 +++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb |  5 ++-
 4 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch
new file mode 100644
index 0000000..19cea41
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch
@@ -0,0 +1,36 @@
+CVE-2015-6563
+
+Don't resend username to PAM; it already has it. 
+Pointed out by Moritz Jodeit; ok dtucker@
+
+Upstream-Status: Backport
+https://github.com/openssh/openssh-portable/commit/d4697fe9a28dab7255c60433e4dd23cf7fce8a8b
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: openssh-6.7p1/monitor.c
+===================================================================
+--- openssh-6.7p1.orig/monitor.c
++++ openssh-6.7p1/monitor.c
+@@ -1046,9 +1046,7 @@ extern KbdintDevice sshpam_device;
+ int
+ mm_answer_pam_init_ctx(int sock, Buffer *m)
+ {
+-
+ 	debug3("%s", __func__);
+-	authctxt->user = buffer_get_string(m, NULL);
+ 	sshpam_ctxt = (sshpam_device.init_ctx)(authctxt);
+ 	sshpam_authok = NULL;
+ 	buffer_clear(m);
+Index: openssh-6.7p1/monitor_wrap.c
+===================================================================
+--- openssh-6.7p1.orig/monitor_wrap.c
++++ openssh-6.7p1/monitor_wrap.c
+@@ -826,7 +826,6 @@ mm_sshpam_init_ctx(Authctxt *authctxt)
+ 
+ 	debug3("%s", __func__);
+ 	buffer_init(&m);
+-	buffer_put_cstring(&m, authctxt->user);
+ 	mm_request_send(pmonitor->m_recvfd, MONITOR_REQ_PAM_INIT_CTX, &m);
+ 	debug3("%s: waiting for MONITOR_ANS_PAM_INIT_CTX", __func__);
+ 	mm_request_receive_expect(pmonitor->m_recvfd, MONITOR_ANS_PAM_INIT_CTX, &m);
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch
new file mode 100644
index 0000000..588d42d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch
@@ -0,0 +1,34 @@
+CVE-2015-6564
+
+ set sshpam_ctxt to NULL after free
+
+ Avoids use-after-free in monitor when privsep child is compromised.
+ Reported by Moritz Jodeit; ok dtucker@
+
+Upstream-Status: Backport
+https://github.com/openssh/openssh-portable/commit/5e75f5198769056089fb06c4d738ab0e5abc66f7
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: openssh-6.7p1/monitor.c
+===================================================================
+--- openssh-6.7p1.orig/monitor.c
++++ openssh-6.7p1/monitor.c
+@@ -1128,14 +1128,16 @@ mm_answer_pam_respond(int sock, Buffer *
+ int
+ mm_answer_pam_free_ctx(int sock, Buffer *m)
+ {
++    int r = sshpam_authok != NULL && sshpam_authok == sshpam_ctxt;
+ 
+ 	debug3("%s", __func__);
+ 	(sshpam_device.free_ctx)(sshpam_ctxt);
++    sshpam_ctxt = sshpam_authok = NULL;
+ 	buffer_clear(m);
+ 	mm_request_send(sock, MONITOR_ANS_PAM_FREE_CTX, m);
+ 	auth_method = "keyboard-interactive";
+ 	auth_submethod = "pam";
+-	return (sshpam_authok == sshpam_ctxt);
++	return r;
+ }
+ #endif
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch
new file mode 100644
index 0000000..42667b0
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch
@@ -0,0 +1,35 @@
+CVE-2015-6565 openssh: Incorrectly set TTYs to be world-writable
+
+fix pty permissions; patch from Nikolay Edigaryev; ok deraadt
+
+Upstream-Status: Backport
+
+merged two changes into one.
+[1] https://anongit.mindrot.org/openssh.git/commit/sshpty.c?id=a5883d4eccb94b16c355987f58f86a7dee17a0c2
+tighten permissions on pty when the "tty" group does not exist; pointed out by Corinna Vinschen; ok markus
+
+[2] https://anongit.mindrot.org/openssh.git/commit/sshpty.c?id=6f941396b6835ad18018845f515b0c4fe20be21a
+fix pty permissions; patch from Nikolay Edigaryev; ok deraadt
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: openssh-6.7p1/sshpty.c
+===================================================================
+--- openssh-6.7p1.orig/sshpty.c
++++ openssh-6.7p1/sshpty.c
+@@ -196,13 +196,8 @@ pty_setowner(struct passwd *pw, const ch
+ 
+ 	/* Determine the group to make the owner of the tty. */
+ 	grp = getgrnam("tty");
+-	if (grp) {
+-		gid = grp->gr_gid;
+-		mode = S_IRUSR | S_IWUSR | S_IWGRP;
+-	} else {
+-		gid = pw->pw_gid;
+-		mode = S_IRUSR | S_IWUSR | S_IWGRP | S_IWOTH;
+-	}
++    gid = (grp != NULL) ? grp->gr_gid : pw->pw_gid;
++    mode = (grp != NULL) ? 0620 : 0600;
+ 
+ 	/*
+ 	 * Change owner and mode of the tty as required.
diff --git a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
index f575665..4b88704 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
@@ -25,7 +25,10 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://run-ptest \
            file://openssh-CVE-2014-2532.patch \
            file://openssh-CVE-2014-2653.patch \
-           file://auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch"
+           file://CVE-2015-6563.patch  \
+           file://CVE-2015-6564.patch \
+           file://CVE-2015-6565.patch \
+           "
 
 PAM_SRC_URI = "file://sshd"
 
-- 
1.9.1


