Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EBACA6C1BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 15:22:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so18315732wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lBPCR6Y38ZVuzeXP9QiO5fF2tx5eDpfDlZDgzpubWQM=;
	b=wNXYpk9tA5/L4k0v0XtOcsHGApqdcSB/jLEs0BzrG6a/s02nZs4nRDQCvyNaC34FLi
	i4HOgim9QErSR+ADySb+WA2d64aX1bzIshkENofOnqX0eohI7MXYnJqFX6fQo4oxvFJ8
	Otj+JxunxeB/RWdaPwhoMKAeqFeh3foRDR9ZL0qZ285iE5j9ELcKCGqWZIlYso0e8i8i
	8xbvVtb+4I3JnBIzmbR6AgzwlKcPL812RfyDuR2gbDELA5cD6mSJRLO2lNFQihqbgG93
	vkT1bzXFd8TxAaKHKKzQENqOd6NFwqI0e17lPGtFxOw5I1xaafb1GPzqMpxkAxD4f39f
	Z0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lBPCR6Y38ZVuzeXP9QiO5fF2tx5eDpfDlZDgzpubWQM=;
	b=QCURVn3ksPaSvH7Y/dz2cf8+feht3fv9bSxwYLQO7HOe4cPGm2hoJ/yPtye6T5GLov
	wIUyu0Vbq4OZRP4BMl0bS7OZ09vExaqiUJ3AvxrH/BpZHZVC3YFm/uKvxageON91qkL5
	j+eKLB6pTwoPvkmWC8J9AqE0qp7Q+VE/BGOyJhtgcOzdEDpzG8f5sM+8QECFjo5x31SL
	+v8pl7GGDAJY0y1gtc1gbBMGx7gVorxjPyEak2Cc4r/RGmT9kjytsaeX76Tpx/HRTyRW
	6gVgxIANdkxAKpZakemkzWHXgNTPT/8Bqcrjllu50MtwXukF3N3rCJlGtWrvcNWLQpGk
	PDcQ==
X-Gm-Message-State: APjAAAV6KSl8j+8Dy+uYBIoKQg8bh20FiPdI6MdMff5Ne3KEq0MyQBKy
	6+aGHpOtkgSe1NEdwgYDSZperbhp3BE=
X-Google-Smtp-Source: APXvYqzuUoLKjvRJj5Mw1k9jhFO06b59J4d83L3vO/aSCIuceZxNWq/SuffenbGEfEwabO8ZikMeGg==
X-Received: by 2002:adf:ff84:: with SMTP id j4mr23168093wrr.71.1562080972429; 
	Tue, 02 Jul 2019 08:22:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b203sm3548396wmd.41.2019.07.02.08.22.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jul 2019 08:22:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:22:47 +0100
Message-Id: <20190702152248.13678-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] multilib_script: fix whitespace
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
X-List-Received-Date: Tue, 02 Jul 2019 15:22:52 -0000

The blocks were intended with 3 spaces instead of 4.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/multilib_script.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/multilib_script.bbclass b/meta/classes/multilib_script.bbclass
index dc166d06c17..b11efc1ec5c 100644
--- a/meta/classes/multilib_script.bbclass
+++ b/meta/classes/multilib_script.bbclass
@@ -17,18 +17,18 @@ multilibscript_rename() {
 python () {
     # Do nothing if multilib isn't being used
     if not d.getVar("MULTILIB_VARIANTS"):
-       return
+        return
     # Do nothing for native/cross
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross', d):
-       return
+        return
 
     for entry in (d.getVar("MULTILIB_SCRIPTS", False) or "").split():
-       pkg, script = entry.split(":")
-       epkg = d.expand(pkg)
-       scriptname = os.path.basename(script)
-       d.appendVar("ALTERNATIVE_" + epkg, " " + scriptname + " ")
-       d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, script)
-       d.setVarFlag("ALTERNATIVE_TARGET", scriptname, script + "-${MULTILIB_SUFFIX}")
-       d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + script + " ${PKGD}" + script + "-${MULTILIB_SUFFIX}")
-       d.appendVar("FILES_" + epkg, " " + script + "-${MULTILIB_SUFFIX}")
+        pkg, script = entry.split(":")
+        epkg = d.expand(pkg)
+        scriptname = os.path.basename(script)
+        d.appendVar("ALTERNATIVE_" + epkg, " " + scriptname + " ")
+        d.setVarFlag("ALTERNATIVE_LINK_NAME", scriptname, script)
+        d.setVarFlag("ALTERNATIVE_TARGET", scriptname, script + "-${MULTILIB_SUFFIX}")
+        d.appendVar("multilibscript_rename",  "\n	mv ${PKGD}" + script + " ${PKGD}" + script + "-${MULTILIB_SUFFIX}")
+        d.appendVar("FILES_" + epkg, " " + script + "-${MULTILIB_SUFFIX}")
 }
-- 
2.11.0


