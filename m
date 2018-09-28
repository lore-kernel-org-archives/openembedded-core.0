Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EECB675129
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 09:48:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s12-v6so1578406wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yOkhBVf1BbO89wlo8laRRRq0Hx6tsgmuUeJxTaya8tQ=;
	b=JPHUPumGA7C2qGfzZs/EDRnlmEIc2Ap77BbUQyMHU1WpFI0oTim73N9KF7bRut6hYZ
	rqSr0K0Jb5t5vr6vwqirVbgULEPAzyyJD+eVNvmijNvF+nT2Duv8FF/amAGR5CYVfs3P
	dUUNsfePJeDcRfhwBnaFifSsgWoKsg+lvM7yve6FrDdaWNKY4IY22HHeUbA3ZQzQVQpQ
	wUHE4aHDUt7t843/bWaEp9LleH0Vpn85ZopPGoDkL/aEqYU0GuU/xBeBACn1QnGjIQMm
	1TFrRQcW230shKb3y4Kah7JKr7EmOLYCiznKNcENv6CpPRnrTrvnRFrKIvR+NEERajD8
	fiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yOkhBVf1BbO89wlo8laRRRq0Hx6tsgmuUeJxTaya8tQ=;
	b=LRP+vKPTON/knuhS7WvjWxTHmwtJehQxqTMISqUx0lvPrsIsrzWivreqdFy7RVBC6j
	ZmS4QwxoHjKUuROPNUBTmmprzIkU+0/Bf+78VNat+1e4Im8FyvnRSGNULRPBGf2pkX6z
	OuX+uugkd7AnJSu7whLdP+/0fsLaGeDECsLd3xtA+XSk6R0pQ76tzKVMqHYFKxxbOc4G
	F85UCK457Fj6hSuxympMMVMCmDlv3zOxxC7b7Y6IHv6Gsn2GwaIGprGXXt22e/aMTlbc
	Bni/IR+D/qFJeXaKiBcoLIkH9YRxaLLA4rfomDsqzzI/8IIhJZPRTvuFz2qROcje7liM
	S0Fw==
X-Gm-Message-State: ABuFfogTAMMmkuhu/cu+pxgu0evD9eORRfZFBczdlPITEAsWHAd/UTxb
	ToI3vsNIL4xT00G9LZfnXqMOplnI
X-Google-Smtp-Source: ACcGV62wRqdW8AqcHXEE0aRRd6oWz+WX02jRHx/kTBKOlTAnOsW2rI9xwOmXc1mi98ezme+v4Z5Y1Q==
X-Received: by 2002:a1c:14d1:: with SMTP id
	200-v6mr1191336wmu.106.1538128101944; 
	Fri, 28 Sep 2018 02:48:21 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC51E791E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc5:1e79:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	x16-v6sm3244842wro.84.2018.09.28.02.48.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Sep 2018 02:48:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2018 11:48:13 +0200
Message-Id: <20180928094813.10862-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] image-buildinfo: drop more verbose build configuration
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
X-List-Received-Date: Fri, 28 Sep 2018 09:48:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* before DISTRO and DISTRO_VERSION were written only - this is not enough to
  get a complete picture in which environmet an image was build. Now same
  information as displayed on console is written.
* code fragment was based on bass.bbclass

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

I know timing is not the best - we are already feature freezed. But I
think it is an enhancement worth to have an exception...

 meta/classes/image-buildinfo.bbclass | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 213fb9cf9b..fbb3188040 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -15,18 +15,6 @@ IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION"
 # Desired location of the output file in the image.
 IMAGE_BUILDINFO_FILE ??= "${sysconfdir}/build"
 
-# From buildhistory.bbclass
-def image_buildinfo_outputvars(vars, listvars, d): 
-    vars = vars.split()
-    listvars = listvars.split()
-    ret = ""
-    for var in vars:
-        value = d.getVar(var) or ""
-        if (d.getVarFlag(var, 'type') == "list"):
-            value = oe.utils.squashspaces(value)
-        ret += "%s = %s\n" % (var, value)
-    return ret.rstrip('\n')
-
 # Gets git branch's status (clean or dirty)
 def get_layer_git_status(path):
     import subprocess
@@ -57,10 +45,18 @@ def buildinfo_target(d):
         # Get context
         if d.getVar('BB_WORKERCONTEXT') != '1':
                 return ""
-        # Single and list variables to be read
-        vars = (d.getVar("IMAGE_BUILDINFO_VARS") or "")
-        listvars = (d.getVar("IMAGE_BUILDINFO_LVARS") or "")
-        return image_buildinfo_outputvars(vars, listvars, d)
+        # taken from base.bbclass
+        localdata = bb.data.createCopy(d)
+        statuslines = []
+        g = globals()
+        func = 'buildcfg_vars'
+        if func not in g:
+            bb.warn("Build configuration function '%s' does not exist" % func)
+        else:
+            flines = g[func](localdata)
+            if flines:
+                statuslines.extend(flines)
+        return ('\n%s\n' % '\n'.join(statuslines))
 
 # Write build information to target filesystem
 python buildinfo () {
-- 
2.14.4


