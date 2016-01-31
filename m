Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id D2DCD7725C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:53:32 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id uo6so70788596pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 11:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=C9F3NR/sMRkkSPwbKwXbjotVWVMODrAdAYzUrzN51lM=;
	b=ImpyT6QyU5BlyMhFbBIBAw7XHMsP0mVG6mRGNIuOIk5FfCrsQpL9GT4EUWEh3MfdLA
	GgB8w83X0megXLAVoI8iq8p6AEDejEbuSPt+Zu+RT11VmBf3yAiAXf8yysGpou7EPaN2
	DBYmkHFcxF8BmxwQOIUMx+4Sa+hXa6R25bE46hSxy8G1FvbverRzJ4VVXEi8ehmuvyAE
	XMF17FLKFyuXh7mtSk81SmsAU0LYzeuwo+OJ0SwS5wMSNigJG7TBgG2sJLJfaOB+pzqn
	rLvGH9oauyN/TTzFNGrV3qodEqGzOhu+BAhXpdUxUo1JuNkCdzPvd8L6DQkcZVlm1QLm
	ukBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=C9F3NR/sMRkkSPwbKwXbjotVWVMODrAdAYzUrzN51lM=;
	b=LkuMiYvVpKdzUzzSJS9oro9kLrEEZp2wTW7diXvvuR3uP0hLk3c9nP9+z1NtOPVslu
	A9DU+gB2wBOmnmB9LP0MjKD+WsCTw1VZNPqOz3qImmyI0ITQEUkVOsaAT4vJcxoQgKju
	oQZQTxKcVG06tS+MykOPLo6//LBmxP0K9TUA5MW84WH9VTi6sFBEcx52V2F9A2JlwJjU
	QrAdGIU8Nx3TVouAeDrI87kbeF6cRvRt0tKvq48MXTRFdwIbn46M1KE81+u5M8P0tX7M
	Fl9FxvsOlMSOMKhyO+mgyushqTX40qIo0x96/Dgd6vmejsRy+E5Sp8w+/yRyLoWnU4n+
	7mRA==
X-Gm-Message-State: AG10YOTANWlPY6ZUk1jbe0nCGkMwI9DTe0LtYfNqjLIgnKmpaxtkCfnB9B4toIsMBcR8bA==
X-Received: by 10.66.194.230 with SMTP id hz6mr32275416pac.70.1454270013280;
	Sun, 31 Jan 2016 11:53:33 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q136sm37670536pfq.66.2016.01.31.11.53.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 11:53:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 11:53:11 -0800
Message-Id: <d5724d3a12931fcc8e15d44e701870d2e64e19b2.1454255704.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
Subject: [jethro-next 5/8] bind: Security fix CVE-2015-8461
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
X-List-Received-Date: Sun, 31 Jan 2016 19:53:33 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8461 bind: race condition when handling socket errors can lead to an assertion failure in resolver.c\

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../bind/bind/CVE-2015-8461.patch                  | 44 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8461.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2015-8461.patch b/meta/recipes-connectivity/bind/bind/CVE-2015-8461.patch
new file mode 100644
index 0000000..88e9c83
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2015-8461.patch
@@ -0,0 +1,44 @@
+From adbf81335b67be0cebdcf9f1f4fcb38ef4814f4d Mon Sep 17 00:00:00 2001
+From: Mark Andrews <marka@isc.org>
+Date: Thu, 25 Jun 2015 18:36:27 +1000
+Subject: [PATCH] 4146.   [bug]           Address reference leak that could
+ prevent a clean                         shutdown. [RT #37125]
+
+Upstream-Status: Backport
+
+https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=commit;h=adbf81335b67be0cebdcf9f1f4fcb38ef4814f4d
+
+CVE: CVE-2015-8461
+Signed-off-by:  Armin Kuster <akuster@mvista.com>
+---
+ CHANGES            | 3 +++
+ lib/dns/resolver.c | 5 +++++
+ 2 files changed, 8 insertions(+)
+
+Index: bind-9.10.2-P4/CHANGES
+===================================================================
+--- bind-9.10.2-P4.orig/CHANGES
++++ bind-9.10.2-P4/CHANGES
+@@ -1,3 +1,6 @@
++4146.  [bug]           Address reference leak that could prevent a clean
++                       shutdown. [RT #37125]
++
+ 4260.  [security]      Insufficient testing when parsing a message allowed
+                        records with an incorrect class to be be accepted,
+                        triggering a REQUIRE failure when those records
+Index: bind-9.10.2-P4/lib/dns/resolver.c
+===================================================================
+--- bind-9.10.2-P4.orig/lib/dns/resolver.c
++++ bind-9.10.2-P4/lib/dns/resolver.c
+@@ -1649,6 +1649,11 @@ fctx_query(fetchctx_t *fctx, dns_adbaddr
+ 	if (query->dispatch != NULL)
+ 		dns_dispatch_detach(&query->dispatch);
+ 
++	LOCK(&res->buckets[fctx->bucketnum].lock);
++	INSIST(fctx->references > 1);
++	fctx->references--;
++	UNLOCK(&res->buckets[fctx->bucketnum].lock);
++
+  cleanup_query:
+ 	if (query->connects == 0) {
+ 		query->magic = 0;
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
index b22dbf3..19f87d7 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
@@ -24,6 +24,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2015-8704.patch \
            file://CVE-2015-8705.patch \
            file://CVE-2015-8000.patch \
+           file://CVE-2015-8461.patch \
            "
 
 SRC_URI[md5sum] = "8b1f5064837756c938eadc1537dec5c7"
-- 
2.3.5


