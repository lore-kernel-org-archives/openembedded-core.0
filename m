Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id E1C196FF4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 05:26:56 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id cy9so428044261pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 21:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+bo80tHVLYuZKo8DUAWGqU1QtuYKr0OVU/w/wcWcivc=;
	b=oAZxy7zTsAhY5EJOiJzn34vJhtTcz3tRddFMZy6lYZxI+orWP7gIkb24jo3yNLtWbY
	bUm+2V8qiyo6vQi3j3YpmOUE6e5TOx/HPebPftu5RBgkoicMsyIpFXgZIFCmzDhx88Jx
	G5CFOh5QNWj1BjCnpSkRwpfNfHauH/DXKw0lWWwrxO0ZWnm9Xgk17Pc2h2erNqNnyM6t
	AhP8Erw1TkzhkL19+a3zhfrpdXw3310wd9Cbq1pBrHf6yr/6kod89l9jLVadDTOpPkMF
	K3iU/2OK9ygyrfHyiTUeWzZKZ1qq+lO7c4ZOlWMfkkwMLALZMH6tOZN/dzL/gWHC9jL2
	hgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+bo80tHVLYuZKo8DUAWGqU1QtuYKr0OVU/w/wcWcivc=;
	b=U1zIVeQcxi9tBEyd3D60vmzmGM2TqcH84/kL+UG/rVtklLNTc4juTWogPz+3F9Wzu5
	ZIJ+AQD5r/V27d+5fr9K7aL0Pq6Ul05E5I/GfjzTA/gQpMflHqgAEZdlzbwCzO4uJ9ZG
	9ua+kUHtYz4X/GuVkT98+MciaYTiJbuGVijUwqjPJqJSLUyrHAN7XYd4vBideGtpVP3H
	1En+KnmYfLWzsCDrCk1XNY+nTKIGCNlpL5WENYi2X84MhMQL03SA5+ttYyHxsyt3ZmFY
	+BIqXJbt2eSGVT6QHaDhgAYY93ArG+TnIOOsaaYdcJ2C76oVluYCojtW5jJcOZG/quZu
	kpPA==
X-Gm-Message-State: ALoCoQmf1vVpvA5pswtg0J5RlgshikhU2n3f/hUoCwcfVoKJKI3lxfzSG5sQFzTEbSDvEdB0tb5S8J93fgmCVwpL0Yx5sfy1Sg==
X-Received: by 10.66.65.203 with SMTP id z11mr33893950pas.152.1453094817344;
	Sun, 17 Jan 2016 21:26:57 -0800 (PST)
Received: from bigIsland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	i76sm30464425pfj.68.2016.01.17.21.26.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 21:26:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 21:26:50 -0800
Message-Id: <1453094810-8670-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][fido] openssh: CVE-2016-077x
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
X-List-Received-Date: Mon, 18 Jan 2016 05:26:57 -0000

From: Armin Kuster <akuster@mvista.com>

this address two CVE's.
CVE-2016-0777 and CVE-2016-0778

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssh/openssh/CVE-2016-077x.patch            | 56 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.7p1.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-077x.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2016-077x.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2016-077x.patch
new file mode 100644
index 0000000..4cc462d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2016-077x.patch
@@ -0,0 +1,56 @@
+From e6c85f8889c5c9eb04796fdb76d2807636b9eef5 Mon Sep 17 00:00:00 2001
+From: Damien Miller <djm@mindrot.org>
+Date: Fri, 15 Jan 2016 01:30:36 +1100
+Subject: [PATCH] forcibly disable roaming support in the client
+
+
+Upstream-Status: Backport
+CVE: CVE-2016-0777
+CVE: CVE-2016-0778
+
+[Yocto #8935]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ readconf.c | 5 ++---
+ ssh.c      | 3 ---
+ 2 files changed, 2 insertions(+), 6 deletions(-)
+
+Index: openssh-6.7p1/readconf.c
+===================================================================
+--- openssh-6.7p1.orig/readconf.c
++++ openssh-6.7p1/readconf.c
+@@ -1597,7 +1597,7 @@ initialize_options(Options * options)
+ 	options->tun_remote = -1;
+ 	options->local_command = NULL;
+ 	options->permit_local_command = -1;
+-	options->use_roaming = -1;
++	options->use_roaming = 0;
+ 	options->visual_host_key = -1;
+ 	options->ip_qos_interactive = -1;
+ 	options->ip_qos_bulk = -1;
+@@ -1768,8 +1768,7 @@ fill_default_options(Options * options)
+ 		options->tun_remote = SSH_TUNID_ANY;
+ 	if (options->permit_local_command == -1)
+ 		options->permit_local_command = 0;
+-	if (options->use_roaming == -1)
+-		options->use_roaming = 1;
++	options->use_roaming = 0;
+ 	if (options->visual_host_key == -1)
+ 		options->visual_host_key = 0;
+ 	if (options->ip_qos_interactive == -1)
+Index: openssh-6.7p1/ssh.c
+===================================================================
+--- openssh-6.7p1.orig/ssh.c
++++ openssh-6.7p1/ssh.c
+@@ -1800,9 +1800,6 @@ ssh_session2(void)
+ 			fork_postauth();
+ 	}
+ 
+-	if (options.use_roaming)
+-		request_roaming();
+-
+ 	return client_loop(tty_flag, tty_flag ?
+ 	    options.escape_char : SSH_ESCAPECHAR_NONE, id);
+ }
diff --git a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
index 9246284..700bf7f 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.7p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://CVE-2015-6564.patch \
            file://CVE-2015-6565.patch \
            file://CVE-2015-5600.patch \
+           file://CVE-2016-077x.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
1.9.1


