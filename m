Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id D18BB73286
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 00:19:11 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id uo6so387199698pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 16:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1NDcwjF9rRkljRAv++jJ68BF0v7Z3x5ecq4AVxjpEXE=;
	b=oIyKjA+m2lnunXt1opm052LGY3q9udy4vhGavAUy/jcvCfdpLI3oNhqgEx0KYzyBRS
	nM8U5lKKGRkmLuN20atukJfqP4nGNTJBAr/l2+J/MMgA7mnzaEMWPR3fYYIzxz3FlKqr
	FCLlxUWQeSlZ8qFQn3KXQTWqSKAvvfGPpPQ9I9W/rj1lYCoZSDrj4OyX08fTk6kRoR+q
	X0AQOFjZ5X4kEs2VHU6M3LEIMbkJ5avQCjKDKfMC24y8/s6Q2axHalJxBwYmkuD5Wttl
	9xhC94yI1aPmcQ9OMPP5r/PkrrhjDnSLYUCFfHuhA6EkTefAgmgQkQsRk9gmugDl7iW1
	mvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1NDcwjF9rRkljRAv++jJ68BF0v7Z3x5ecq4AVxjpEXE=;
	b=Fnzu6TkRozRXp6fOpjmdX8o1Uc3tfmrGtcYiqQ1kktXxU/WIuTvijPVlf7pD0fiMBg
	oqKVr+r3meSQFt2ch7wsCxyQw8kjj73fC+31DHywDtQuaOjM77pHhR2S3BV3D4YtWCiI
	1uaGvGNK1tlNQAo3AWsKUj+1ImI2jKfoglNtTRuRTGWpH9MSOIbT2FVgJo5Ku03azcZt
	2QwtR6zDv7tT75inWttuFdgbHEIsVyAJTCghOYeavQujCKgrwGmYXxGt9/Vj+s1RZ4QB
	1oTWFEJ/npw2hJD50G8lM4NR7vUuJihJ9IOHKkdqvd5g7iuYJBAkj0d8xXNg3TM9t79A
	WoeA==
X-Gm-Message-State: ALoCoQkwNmfx89jF88oW5B+L7TmmoM9svddg5+jy1CJY7pxI/T+R2fEwsseygcEBCGLDpy2kIskcq3t8uyMcDgaVTkHxb6qxEg==
X-Received: by 10.66.189.200 with SMTP id gk8mr18916259pac.36.1452903550070;
	Fri, 15 Jan 2016 16:19:10 -0800 (PST)
Received: from bigIsland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	dz6sm17904479pab.19.2016.01.15.16.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jan 2016 16:19:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 16:19:01 -0800
Message-Id: <1452903541-19597-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452903541-19597-1-git-send-email-akuster808@gmail.com>
References: <1452903541-19597-1-git-send-email-akuster808@gmail.com>
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
X-List-Received-Date: Sat, 16 Jan 2016 00:19:11 -0000

From: Armin Kuster <akuster@mvista.com>

SECURITY: Fix an out of-bound read access in the packet handling code.
Reported by Ben Hawkes
https://anongit.mindrot.org/openssh.git/commit/?id=2fecfd486bdba9f51b3a789277bb0733ca36e1c

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssh/CVE-2016-1907_upstream_commit.patch    | 33 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch

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
index ac824ee..288d37e 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
@@ -20,7 +20,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://sshdgenkeys.service \
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
-           file://run-ptest"
+           file://run-ptest \
+           file://CVE-2016-1907_upstream_commit.patch "
 
 PAM_SRC_URI = "file://sshd"
 
-- 
1.9.1


