Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10186.1794574398671394961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 04:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rxaW1/oB;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso103504e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 04:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574396; x=1795179196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFvGkco8YI5Qh24cQfiVstBlPqQnhCEb2Ltu4+8Khpg=;
        b=rxaW1/oBx1xEoBHFjK/pO4ZFkThVlAb/5rn1VOhI0J7nQGOFXsXFpsLs5zzim+01IG
         AMdSfSB4/A1hdHHz77FbVEcZrPQPnnWt8EPAuHc5emGx/I0SfK/usYoJod7jbYn22BFr
         4wxsfQvwVeih2wYGfTAtruI0iQ6A6njIS1NfKdBcuirrctugnDT+VsRq0X6Kk7MWbqd6
         gBMu/f1ip9FtL1eDNXMEYNlJNk7ZMuHu2I1OyrtNzW8IkRKpvpPhejrK5nYkJNrZS5Mu
         EcQ52kP0GqREsJ7GWzsTQi4zCacR2yaAfHM4gKURSLLhqmLOTY+sa1NKqklHR/72V45q
         KL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574396; x=1795179196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFvGkco8YI5Qh24cQfiVstBlPqQnhCEb2Ltu4+8Khpg=;
        b=sHWKwLNgchlstmYOwQF+v1g7babxBvYGZak0f/WRJVj/1IOquRGQSQ/tCT3qfXZer1
         ldSJMiY85Xctc40jC8nuPaZOrAFVVIlaGQLd6QoeP8nUA4NUFD2qshryoD+FqdUK3g8I
         5Pu8XEEHf7lKQeeq0x7jBx2LqOvEpg6qtbtMwyo8/yIb3Mr4lCUfeahb+++xR2ZmiVpb
         y/01g8wYfBXx+jHt+4cURjX9BWoiL48HY69mubPuWqEAIU8r4eC8yAH6GRJqYv/j9db0
         TequWoBv8zCWgIyNn19JRtZ3GuvcidW4SDC/aZiDZY/4xLOWUWBjJqW/K5vhSH5jxrbM
         TGQQ==
X-Gm-Message-State: APuU4Z+jyWDDcw+dO4Yr0Ql7Gi72jjWHp/evlHXZLLV2u3sOQXdBQ6W2
	UL2ajKphvPdpCgrcWbbbzfHk5OKeBIC5kFiuyA9KKIqcX+EDSXsSmPyrmHh1DL28ev0Uw87joEY
	uCUSqb0c=
X-Gm-Gg: AYBFou3dHfiYUZkLGB0/E4QDQkTlHU+EoxFYbm33Oy5YO+YdDzQSbJ3ex/X0PlCGV9J
	K00zuoldIN9Us2UXZbImZvUEKBHe1UJUfhyC+m8NtePxSrl6eUr8tztuAx4towwcHaFcqs5Ot7T
	domIYth1LMSQTwNtMNiZJT30dHmIAXAnMpKXSOnxjXb4KxD/Ve5gj5wr/1j/52xSy1O8a3pt/03
	tEAqHlHmGKsxAkuuIwQzkCpmLQyhYD9qkn0K5sFtcK/WeRnA/Afew68sLUHCuoV7SVaclSFct9n
	drfJI0EO2Ny3WZws7xrHHWnTzPF6t0Xack8aYnskWWcZpn2JNQDYQMVJ5QUg43gRPLRl6lim70/
	s6t2/A/LS40FXdBbRuhFsWHUl704usI5CHCQ6MhHxZULwTU3HzMHWhECqNFukv663Tza76NTelc
	DbZFryM5a2C+6JI4xj94MRYcioSfYocMiphQ4v4ZwiJU8C1sbUzg6yskI79ErdFvYBX8a6GaRgu
	bfBlKMqle0hzRprXYOIf+Kri+M+LZVUZdyITsstJ4TeA4JuZ2n9+0yKXiJHiyUx2HRIEIrZm8VY
	XCFPFLCACKg6NwMiwnSPBwj8gRf0HXYQUPiGYZIz8VR87uyH/fo+izQSoeS1laRvUthkkYivQoB
	CKw==
X-Received: by 2002:a05:6512:2342:b0:5c1:4cab:2ce4 with SMTP id 2adb3069b0e04-5c170b5cf11mr967900e87.42.1794574396310;
        Fri, 13 Nov 2026 04:53:16 -0800 (PST)
Return-Path: <mikko.rapeli@linaro.org>
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171348078sm709493e87.57.2026.11.13.04.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:53:15 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] kernel-yocto.bbclass: capture stderr from subprocess.check_output()
Date: Fri, 13 Nov 2026 14:53:00 +0200
Message-ID: <20261113125300.1188997-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 12:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250169
Content-Type: text/plain; charset="utf-8"

Hard to debug failures without stderr in output.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/kernel-yocto.bbclass | 29 +++++++++++++-----------
 1 file changed, 16 insertions(+), 13 deletions(-)

v2: using text=True, removed utf-8 decoding, capturing stderr to pipe and
    printing separately in error case

v1: https://lists.openembedded.org/g/openembedded-core/message/249371

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 43674e8bcb..86fa2a9954 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -548,17 +548,17 @@ python do_config_analysis() {
         for action in ["analysis","audit"]:
             if action == "analysis":
                 try:
-                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c], cwd=s, env=env ).decode('utf-8')
+                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--blame', c], cwd=s, stderr=subprocess.PIPE, text=True, env=env)
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
+                    bb.fatal( "config analysis failed when running '%s': %s\n%s" % (" ".join(e.cmd), e.output, e.stderr))
 
                 outfile = d.getVar( 'CONFIG_ANALYSIS_FILE' )
 
             if action == "audit":
                 try:
-                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary', '--extended', '--sanity', c], cwd=s, env=env ).decode('utf-8')
+                    analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--summary', '--extended', '--sanity', c], cwd=s, stderr=subprocess.PIPE, text=True, env=env )
                 except subprocess.CalledProcessError as e:
-                    bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
+                    bb.fatal( "config analysis failed when running '%s': %s\n%s" % (" ".join(e.cmd), e.output, e.stderr))
 
                 outfile = d.getVar( 'CONFIG_AUDIT_FILE' )
 
@@ -593,7 +593,10 @@ python do_kernel_configcheck() {
     # passed a valid meta-series for processing
     kmeta = d.getVar("KMETA")
     if not kmeta or not os.path.exists('{}/{}'.format(s,kmeta)):
-        kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
+        try:
+            kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S'), stderr=subprocess.PIPE, text=True).rstrip()
+        except subprocess.CalledProcessError as e:
+            bb.fatal( "configcheck failed: %s\n%s" % (e.output, e.stderr))
 
     env = os.environ.copy()
     env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
@@ -608,9 +611,9 @@ python do_kernel_configcheck() {
         env['CLANG_FLAGS'] = " -fintegrated-as"
 
     try:
-        configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
+        configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], stderr=subprocess.PIPE, text=True, env=env)
     except subprocess.CalledProcessError as e:
-        bb.fatal( "Cannot gather config fragments for audit: %s" % e.output.decode("utf-8") )
+        bb.fatal( "Cannot gather config fragments for audit: %s\n%s" % (e.output, e.stderr))
 
     config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
     bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
@@ -627,9 +630,9 @@ python do_kernel_configcheck() {
 
     # category #1: mismatches
     try:
-        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, env=env ).decode('utf-8')
+        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--mismatches', extra_params], cwd=s, stderr=subprocess.PIPE, env=env, text=True )
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
+        bb.fatal( "config analysis failed when running '%s': %s\n%s" % (" ".join(e.cmd), e.output, e.stderr))
 
     if analysis:
         outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
@@ -649,9 +652,9 @@ python do_kernel_configcheck() {
     if bsp_check_visibility > 1:
         extra_params = "--strict"
     try:
-        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, env=env ).decode('utf-8')
+        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--invalid', extra_params], cwd=s, stderr=subprocess.PIPE, env=env, text=True )
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
+        bb.fatal( "config analysis failed when running '%s': %s\n%s" % (" ".join(e.cmd), e.output, e.stderr))
 
     if analysis:
         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
@@ -668,9 +671,9 @@ python do_kernel_configcheck() {
 
     # category #3: redefined options (this is pretty verbose and is debug only)
     try:
-        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, env=env ).decode('utf-8')
+        analysis = subprocess.check_output(['symbol_why.py', '--dotconfig',  '{}'.format( d.getVar('B') + '/.config' ), '--sanity'], cwd=s, stderr=subprocess.PIPE, env=env, text=True)
     except subprocess.CalledProcessError as e:
-        bb.fatal( "config analysis failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')))
+        bb.fatal( "config analysis failed when running '%s': %s\n%s" % (" ".join(e.cmd), e.output, e.stderr))
 
     if analysis:
         outfile = "{}/{}/cfg/redefinition.txt".format(s,kmeta)
-- 
2.55.0

