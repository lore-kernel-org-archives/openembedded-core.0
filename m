Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7364.1793792645179888125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZLPRdnDu;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3acd523a802so4537411fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 03:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793792643; x=1794397443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUv+d0mtlKN3XKWoXy7cW6TPfBnSqGE3u9mmWIStxRQ=;
        b=ZLPRdnDuvpvJMP9ATBdCz/VTRPSNo6lVtLwwH4f2QIxp+al4sWZf5umscC4Z+DqIGL
         MfWD+cPkXHt1flRduU8GAVGdEaYJfNRPtH5DCuiqKGLmetesrKWhP4goME6fARZLoG9n
         a4Rz06u+pQlwIYQSv72nFRYt2ScOZ1AtBjhOa1UlUsM3ai4E/tebNFbftozGkX5qo27z
         ifb8AUQmFgX0ODRlOWJAWMR9indEenDxgln8nljXSpUiNE3m1ROBTw16oXf+WkclyBlw
         /dqqSFMg8ETklP+nRiVrbFahSONyNDoXqwotnQap6f4qCpg222J2I5H9OAf863EjK41t
         6+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792643; x=1794397443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUv+d0mtlKN3XKWoXy7cW6TPfBnSqGE3u9mmWIStxRQ=;
        b=2oyzal8K43skpZ/7DaqUQTTYZIYe1MrMhqw88alRGbH32RmKUGUThVKaIM9GS/QIye
         YvnnkjfZWloBWlWRlyiZkhaiEnCBB5K3EL1Db+8MoiMmckNJ9M3/qvC9yopz5Z+KW7/4
         dtccqfYSNnlyN6f0zwHUDDeU1XjkhVC9qvnoY1fQy+DvTZYMT/mtaygG4+xftWBhvp/D
         a2AChCkXmHdFmjakdoGW2XM0SbI7uYgw5ESiRW5CQlhzYXXKm3bZug3/SfmUg41QA8r1
         JchY/Tn0r+olKv9bMCZFcSrj5/OKZrz1w6kwXMaDkv8d93W5B8FnGcYbsO3a00x7veYN
         CxUA==
X-Gm-Message-State: APuU4Z9QBtY+8i3C1Sm53fmT02433h0kYPD6D0UpN0vp3jsW8qJ5D2f5
	DlEkJm2IJN7ro5LNdLijhvaf2HZ5XO4PAtwWZ34Pg5ceEOROdpxbViK85vTANvJoM9hQQ+/RQC0
	3wI8GXjU=
X-Gm-Gg: AYBFou1zz8eU4dnbIB+bfbyR8EeZijPnjC0omjUA49jQf7GGV3AEg4S+zANmu5pIOWn
	qrGKUl0vLldGmrl20JTFplwbMOXC/63zyr/I1x8YNoDyD64eu5CafqgQHxGaLtZkvCjHoydf5Y4
	dh0agc5dsVL60FLce/xTFYoBHMGPyWCSoEToPW6yVsL8DEH5vcJpc+nMHgdt89Dse5q0HZDEQZU
	a0p2z9wGiv3Qhv4k/VWXcEYlPSbvA5wEuYugYmRRaddoEZmtObzvnc1j9w8+Lu+t2tePp+X2QYF
	22Xdl7RJet9m+sTmrpVgTCPvl928ZpdLUMw90X9VhbuWx+7h08jPeEXeF7vFJUe85B9rx9C7tnC
	zsofB54JfF87MSf+K+3O7w9b+SxO/uh3ht23W6kdxCdxhKk/4V+/Uimt5UykZqtEpBC+0gP4M1I
	ALMvE2k7mIvat/KSIJkW9ECIegW32OqlyfTg9LgxksKEK8nnQmKL21d6UtkpS/dlenB/+Q+tmIv
	fQULzmz52LzhE9E20vwGqO3rFELvnUJH5X2UdFqlpt6pShnEXZjUnCepksACQDFETLYyz+i12Il
	aLfr3+pnulDft7i7DW6sfBA9PzSf67pQKYuWYk4jAcOrJRZ6dpuM0IGgng==
X-Received: by 2002:a05:651c:31cd:b0:3ac:e0a2:1438 with SMTP id 38308e7fff4ca-3ace0a21bf8mr1519721fa.29.1793792642900;
        Wed, 04 Nov 2026 03:44:02 -0800 (PST)
Return-Path: <mikko.rapeli@linaro.org>
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6facc6sm4027611fa.37.2026.11.04.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:44:02 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] kernel-yocto.bbclass: capture stderr from subprocess.check_output()
Date: Wed,  4 Nov 2026 13:43:41 +0200
Message-ID: <20261104114341.656092-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249371
Content-Type: text/plain; charset="utf-8"

Hard to debug failures without stderr in output.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/kernel-yocto.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 43674e8bcb..002782f2ee 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -548,7 +548,7 @@ python do_config_analysis() {
         for action in ["analysis","audit"]:
             if action == "analysis":
                 try:
-                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c], cwd=s, env=env ).decode('utf-8')
+                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c], cwd=s, stderr=subprocess.STDOUT, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
                     bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
@@ -556,7 +556,7 @@ python do_config_analysis() {
 
             if action == "audit":
                 try:
-                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary', '--extended', '--sanity', c], cwd=s, env=env ).decode('utf-8')
+                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary', '--extended', '--sanity', c], cwd=s, stderr=subprocess.STDOUT, env=env ).decode('utf-8')
                 except subprocess.CalledProcessError as e:
                     bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
@@ -593,7 +593,7 @@ python do_kernel_configcheck() {
     # passed a valid meta-series for processing
     kmeta = d.getVar("KMETA")
     if not kmeta or not os.path.exists('{}/{}'.format(s,kmeta)):
-        kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
+        kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S'), stderr=subprocess.STDOUT).decode('utf-8').rstrip()
 
     env = os.environ.copy()
     env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
@@ -608,7 +608,7 @@ python do_kernel_configcheck() {
         env['CLANG_FLAGS'] = " -fintegrated-as"
 
     try:
-        configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
+        configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], stderr=subprocess.STDOUT, env=env).decode('utf-8')
     except subprocess.CalledProcessError as e:
         bb.fatal( "Cannot gather config fragments for audit: %s" % e.output.decode("utf-8") )
 
@@ -627,7 +627,7 @@ python do_kernel_configcheck() {
 
     # category #1: mismatches
     try:
-        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, env=env ).decode('utf-8')
+        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, stderr=subprocess.STDOUT, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
         bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
@@ -649,7 +649,7 @@ python do_kernel_configcheck() {
     if bsp_check_visibility > 1:
         extra_params = "--strict"
     try:
-        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, env=env ).decode('utf-8')
+        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, stderr=subprocess.STDOUT, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
         bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
@@ -668,7 +668,7 @@ python do_kernel_configcheck() {
 
     # category #3: redefined options (this is pretty verbose and is debug only)
     try:
-        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, env=env ).decode('utf-8')
+        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, stderr=subprocess.STDOUT, env=env ).decode('utf-8')
     except subprocess.CalledProcessError as e:
         bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
 
-- 
2.55.0

