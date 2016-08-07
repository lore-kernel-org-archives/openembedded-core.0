Return-Path: <net147@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C79573289
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Aug 2016 08:39:18 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id hh10so22070995pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2016 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bnBiumf/1alUKydJI+w4fqngBmd5E2cMUc+4uPMEsOo=;
	b=oTwL0I1IdtpK/Ds1rXulchlqxcSwxgN3uG1RrDvRdo9zWyT50JfXce+pfOwPsTm0gT
	eJbm3TBoxieJb0fGXWAWI0yd9Rdt4jAu7d/B9bPDr6b3lPorT4nrEX1w9DkOZRT5wpsd
	CcMydbSfoFINohPJoVSzJKaIFfDWJl0GSN3z0D4VD5cYv9ypHD88ikiYqgfeDledRjts
	9vtbeMLdvBW3Wl00goLGg7cX6+eZ/ufuu35jnpUUj4+mq/QWlnqo5JLqPliABz9VjzuT
	WrFfh7ovx3eemFJpHl17umVzUsFcGiRfNtthtE2gMrXe+GiBNVZHl35hh2sTEuMvqFbc
	FltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bnBiumf/1alUKydJI+w4fqngBmd5E2cMUc+4uPMEsOo=;
	b=dd6krTmVtzZzT3gafVeqiP5ZEI6+xm0llDx1ncJK3NgO/UZs+bBxsCINnqmc34Amgv
	oPYldbBgQHDBWOU/zai5qfOI+4pkg9Juzp7VBPg+0azI6lx4kigGA8ioKpgslMeHZezw
	5rGspfTJK1zuDoITdpr1myH+Rg79y//GCffzyCiuuzAQ4O+cTRNilA8f5wUGWKzV2BW3
	BTQ50YtHpmz4mIDlc8j36u9GOzuL/wfG0lEADY/GPd0eUvn6KUBvVDjbUVcmz9wAYe9U
	xuc5Up6ZOOuCZZLlSIjHvUeP3OB7/iB6pEQSU2z6A424KYBsDRQssLwSaylcJ4OETEfx
	z1Iw==
X-Gm-Message-State: AEkoouuUymEk39SdrKu/JRhMf/JraT1hsrmMiJqHPGk6/flA3R/DtP790CqvSDN/Iadqlw==
X-Received: by 10.66.255.42 with SMTP id an10mr152744504pad.57.1470559159230; 
	Sun, 07 Aug 2016 01:39:19 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	e187sm39496442pfg.43.2016.08.07.01.39.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Aug 2016 01:39:18 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 18:38:45 +1000
Message-Id: <20160807083845.9539-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [krogoth][jethro][PATCH] meta/classes: fix bb.build.FuncFailed typos
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
X-List-Received-Date: Sun, 07 Aug 2016 08:39:19 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/grub-efi.bbclass  | 2 +-
 meta/classes/gummiboot.bbclass | 4 ++--
 meta/classes/syslinux.bbclass  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 4ce3d28..ec86627 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -93,7 +93,7 @@ python build_efi_cfg() {
     try:
          cfgfile = file(cfile, 'w')
     except OSError:
-        raise bb.build.funcFailed('Unable to open %s' % (cfile))
+        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
 
     cfgfile.write('# Automatically created by OE\n')
 
diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
index 1ebb946..96d1301 100644
--- a/meta/classes/gummiboot.bbclass
+++ b/meta/classes/gummiboot.bbclass
@@ -72,7 +72,7 @@ python build_efi_cfg() {
     try:
          cfgfile = open(cfile, 'w')
     except OSError:
-        raise bb.build.funcFailed('Unable to open %s' % (cfile))
+        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
 
     cfgfile.write('# Automatically created by OE\n')
     cfgfile.write('default %s\n' % (labels.split()[0]))
@@ -95,7 +95,7 @@ python build_efi_cfg() {
         try:
             entrycfg = open(entryfile, "w")
         except OSError:
-            raise bb.build.funcFailed('Unable to open %s' % (entryfile))
+            raise bb.build.FuncFailed('Unable to open %s' % (entryfile))
         localdata.setVar('OVERRIDES', label + ':' + overrides)
         bb.data.update_data(localdata)
 
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 52fb51f..8609cab 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -105,7 +105,7 @@ python build_syslinux_cfg () {
     try:
         cfgfile = file(cfile, 'w')
     except OSError:
-        raise bb.build.funcFailed('Unable to open %s' % (cfile))
+        raise bb.build.FuncFailed('Unable to open %s' % (cfile))
 
     cfgfile.write('# Automatically created by OE\n')
 
-- 
2.9.2


