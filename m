Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 89843605B3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 16:40:02 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id a25so6009856lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2/ol/n/ukGMDwVl1btAQixH6smDEXDoCdEbQZX9SsHA=;
	b=X12ECEuihnbRV8+sfGvaEC/cLt3v+1MjylJSqiq/qspFbLX2kKDdkmKkJtiBEyxz4p
	RaQ0WWV7mRndOJ19YoiNvhScQJVmUjsUhgeqXnDuBI5aDvQGyaiUmnnD/XBQaus1XJbj
	UL4BQM5FsP/+muxkKLiwCGl0l+IpmNpDHRKs1VbeqaJveH7bAz6mnhrr9GyBLU8L8OnV
	BzQRM9bRbNQBMwAR1FB4KWMjUPDOgpG0eiCCZqGfmmsaHxoxir7vZsFfxH5ZYzdQ1liy
	jDmknJMIyetkHX3FtZUWNUfUGTS+P0WnntTmePX51ERoAy7XRWHyW5PYLbVynijQBk+L
	Jcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2/ol/n/ukGMDwVl1btAQixH6smDEXDoCdEbQZX9SsHA=;
	b=NLEDrxn6joYgNUB3UBiUHoYYTcdLvOq5kXQWuwEcIKkY4hFznVdSKslUCcE5YNbVfD
	ICrCzY1CRaNfCtvJ4FJXLv7FXr3ziDGIvTkOZay7P861xgYKxLqWr//dcZJvnW+KHecn
	7mnVBBTbuNgDtE2sDxvXFwkCvOzPiA/ZqxaOaRg4+6L3YORf6Ac9vTw9gNJ6v2mO5xob
	T/BoS7T7zWC7gRm4LzxgZe/ToRMygHtAgk2y2R2aEPe58IwtQUw5PaJMK6L/1vkeUUOj
	bBeJwmqYYMyWTfp15ethA9VkBOp0a7ylnQojjcIoLgawaGzan6wbZbXtYpgQ4AfpTvxT
	XnqA==
X-Gm-Message-State: APjAAAVa3Ej+QC4DgZ0aXAacrHpAFcEjzSSvnAhD1VzjmgEeBNUxb5o3
	xmCsNDZCB7faTm7iqzPLi15gfNe61tM=
X-Google-Smtp-Source: APXvYqxuFYwERwVPsw7ksNJUL7cqpZ+26kMCcMgSqAHEx7y7a91BYJkt7A5Ya2mZQgE4tr/tXgMmvQ==
X-Received: by 2002:a19:bec1:: with SMTP id o184mr7342437lff.86.1561826402822; 
	Sat, 29 Jun 2019 09:40:02 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id s19sm897814lji.38.2019.06.29.09.40.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 09:40:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jun 2019 18:39:58 +0200
Message-Id: <20190629163958.26162-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] dpkg: update to 1.19.7
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
X-List-Received-Date: Sat, 29 Jun 2019 16:40:02 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...s-expect-D-to-be-set-when-running-in.patch | 20 +++++++++----------
 .../dpkg/{dpkg_1.19.4.bb => dpkg_1.19.7.bb}   |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.19.4.bb => dpkg_1.19.7.bb} (86%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index b88be87490..9ca7262eb9 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -1,7 +1,7 @@
-From 24229971492515b64c81e8c6392e5dfbdc22b44c Mon Sep 17 00:00:00 2001
+From dd11ed66640f79143e42d778b58fdd5a61fb5836 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
-Subject: [PATCH 3/5] Our pre/postinsts expect $D to be set when running in a
+Subject: [PATCH] Our pre/postinsts expect $D to be set when running in a
  sysroot and don't expect a chroot. This matches up our system expectations
  with what dpkg does.
 
@@ -12,11 +12,11 @@ ALIMON 2016/05/26
 ALIMON 2017/02/21
 KKang 2019/02/20
 ---
- src/script.c | 44 +++-----------------------------------------
- 1 file changed, 3 insertions(+), 41 deletions(-)
+ src/script.c | 53 +++-------------------------------------------------
+ 1 file changed, 3 insertions(+), 50 deletions(-)
 
 diff --git a/src/script.c b/src/script.c
-index 0865b95..73ed35d 100644
+index abe65b6f7..621ff9b27 100644
 --- a/src/script.c
 +++ b/src/script.c
 @@ -96,58 +96,11 @@ setexecute(const char *path, struct stat *stab)
@@ -27,12 +27,12 @@ index 0865b95..73ed35d 100644
 -	const char *changedir;
 -	size_t instdirlen = strlen(instdir);
 -
--	if (instdirlen > 0 && fc_script_chrootless)
+-	if (instdirlen > 0 && in_force(FORCE_SCRIPT_CHROOTLESS))
 -		changedir = instdir;
 -	else
 -		changedir = "/";
 -
--	if (instdirlen > 0 && !fc_script_chrootless) {
+-	if (instdirlen > 0 && !in_force(FORCE_SCRIPT_CHROOTLESS)) {
 -		int rc;
 -
 -		if (strncmp(admindir, instdir, instdirlen) != 0)
@@ -43,7 +43,7 @@ index 0865b95..73ed35d 100644
 -			ohshite(_("unable to setenv for subprocesses"));
 -
 -		rc = chroot(instdir);
--		if (rc && fc_nonroot && errno == EPERM)
+-		if (rc && in_force(FORCE_NON_ROOT) && errno == EPERM)
 -			ohshit(_("not enough privileges to change root "
 -			         "directory with --force-not-root, consider "
 -			         "using --force-script-chrootless?"));
@@ -69,7 +69,7 @@ index 0865b95..73ed35d 100644
 -		      args.buf);
 -		varbuf_destroy(&args);
 -	}
--	if (instdirlen == 0 || fc_script_chrootless)
+-	if (instdirlen == 0 || in_force(FORCE_SCRIPT_CHROOTLESS))
 -		return cmd->filename;
 -
 -	if (strlen(cmd->filename) < instdirlen)
@@ -82,5 +82,5 @@ index 0865b95..73ed35d 100644
  
  /**
 -- 
-2.1.4
+2.17.1
 
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
similarity index 86%
rename from meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
index b83868fec0..e9dec337b3 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
@@ -18,5 +18,5 @@ SRC_URI_append_class-native = " \
                                 file://tweak-options-require-tar-1.27.patch \
 "
 
-SRC_URI[md5sum] = "1e4420409426d8c58bbe13a8e07c0c0b"
-SRC_URI[sha256sum] = "c15234e98655689586bff2d517a6fdc6135d139c54d52ae9cfa6a90007fee0ae"
+SRC_URI[md5sum] = "60f57c5494e6dfa177504d47bfa0e383"
+SRC_URI[sha256sum] = "4c27fededf620c0aa522fff1a48577ba08144445341257502e7730f2b1a296e8"
-- 
2.17.1


