Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 873DA74B83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 10:53:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a3-v6so3679306wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pBtqUDYwRzAKcZcTclcGjcLvV5QZ9STaa5+VaXPtHZ8=;
	b=Yw+cj9cL+zg99TpwlMOIMxTn80xc+4GFQen1j/9wmcbNz8T63BLOJVhNEEoSEz512f
	xtY6v+X8q6/y+N/BNDuZUIBxz6P1X/BIHU7UXQIe6tDTEsYJTyIZO+hVW4sykd6WQVwi
	DMmXcmzolxBy/phZ8RL39ZA3zzLc3cYdan5Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pBtqUDYwRzAKcZcTclcGjcLvV5QZ9STaa5+VaXPtHZ8=;
	b=b7ayHl6pSImPCmSl79hqIaMUx3BcLJ+usameO8NeWqOxrBfo95desCliuxDzA8f6WU
	lJIMIBfbH0AeAhgUS04HbGRtgSLzquYkL4Ag+NpwSeX4+AGEsITrd3Rg491u+0mDyiPA
	v/MTbaJHLomqOR0+4adgg6MHmcwI3eZhjK6Wd1Jv3NamxY8SACYfaShkRpyiI3ShXKY2
	HkMue/o3ScuqqviczZhEaTsiTFm+HgyZMzPg15OG0N8qCZ+IyPUzFz6GMmVCoDPIVWc9
	gvS4cEaMY/z753Pph9fk6cjhfca9GLwWLNm6APfXoCGJJwarrvsTCVepfFGmmMe0UQPQ
	rjJw==
X-Gm-Message-State: AOUpUlF+5TelDCGCGv+dvT6mKWrL3oeTC6k56AEK6jpGbzdTF3ClR6IG
	QQjPSMmeLsFbs/2sfQFxFj6G/fiI/Tlcww==
X-Google-Smtp-Source: AAOMgpcIMofY4DZAJWfbC6hfd788xrAJyOp332QHJihmsL+zeJVAQDTtaIdGcObfdmppAItE1poqKQ==
X-Received: by 2002:a5d:4c4c:: with SMTP id
	n12-v6mr10750977wrt.71.1532429600997; 
	Tue, 24 Jul 2018 03:53:20 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm2037488wmh.19.2018.07.24.03.53.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 03:53:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2018 11:53:13 +0100
Message-Id: <20180724105316.2085-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724105316.2085-1-richard.purdie@linuxfoundation.org>
References: <20180724105316.2085-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/6] package: Use subprocess to be consistent with the rest of the class
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
X-List-Received-Date: Tue, 24 Jul 2018 10:53:20 -0000

Using 'sub' in one function just confuses things, standardise and fix
formatting of the parameters too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index df5206bda9e..be76b30f31c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1575,7 +1575,7 @@ SHLIBSWORKDIR = "${PKGDESTWORK}/${MLPREFIX}shlibs2"
 
 python package_do_shlibs() {
     import re, pipes
-    import subprocess as sub
+    import subprocess
 
     exclude_shlibs = d.getVar('EXCLUDE_FROM_SHLIBS', False)
     if exclude_shlibs:
@@ -1677,7 +1677,7 @@ python package_do_shlibs() {
                     sonames.add(prov)
         if file.endswith('.dylib') or file.endswith('.so'):
             rpath = []
-            p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file],stdout=sub.PIPE,stderr=sub.PIPE)
+            p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-l', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             out, err = p.communicate()
             # If returned successfully, process stdout for results
             if p.returncode == 0:
@@ -1686,7 +1686,7 @@ python package_do_shlibs() {
                     if l.startswith('path '):
                         rpath.append(l.split()[1])
 
-        p = sub.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file],stdout=sub.PIPE,stderr=sub.PIPE)
+        p = subprocess.Popen([d.expand("${HOST_PREFIX}otool"), '-L', file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
         out, err = p.communicate()
         # If returned successfully, process stdout for results
         if p.returncode == 0:
@@ -1710,7 +1710,7 @@ python package_do_shlibs() {
 
         if (file.endswith(".dll") or file.endswith(".exe")):
             # use objdump to search for "DLL Name: .*\.dll"
-            p = sub.Popen([d.expand("${HOST_PREFIX}objdump"), "-p", file], stdout = sub.PIPE, stderr= sub.PIPE)
+            p = subprocess.Popen([d.expand("${HOST_PREFIX}objdump"), "-p", file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             out, err = p.communicate()
             # process the output, grabbing all .dll names
             if p.returncode == 0:
-- 
2.17.1


