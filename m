Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4326.1794732553776882469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MWrDjNGy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso935894f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732552; x=1795337352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VMrcEYbooq1pYljDR6hpHkfTVzQAC2HQyQLCCv+Hemg=;
        b=MWrDjNGy5w5iDdZXPTCzjx43irOnRGPmi9/c7DZojWJOTZBgXCVtIRCF4b/+9mOZZz
         0W1RWJjqF+Pvly6QQ9x9AL/LwvdjUNZ6AscmNZnsNqBbXhho7SwEkqvV0DnfYeuJLDQM
         TXp4LfKZ+IvEqUuw5FAN3i/fVaXbgl4j0A5Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732552; x=1795337352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VMrcEYbooq1pYljDR6hpHkfTVzQAC2HQyQLCCv+Hemg=;
        b=M/1VtRowyN3ryYGCTlGILP4KEB1arwAQYTnLuL5CwH8Uf3JkV/CA+gD8Q3s1KufmF+
         UUvSdgyu8vblJUswDQK7baleC6LF1NHRDbp0xy0kX7Ch18tSCPdUKG8dWfYzYWSWvSTF
         KoIh3Hzx7yPg+8k7XRdz4LDNPxilkvyIyavFo2CXjfPchD0MLpwNP6vF1xXlOGXLQur0
         ZaDm9QvIf5wAON1OLHvURiaTg0XA9RNH6rHsEUhZmCGzjx32XwmaQYmL3eyHUptUi/uS
         ho/ohAhu5S511+FJBDMb0eJJQVTbdL0ZH7boatEmBrGwECyR+EHjz634i/8intnNDg90
         JUSg==
X-Gm-Message-State: APuU4Z9enMnIVKbCKhzXqj96DuZu5PB07H8Af9LFx2x3xVBOpjrHt9m4
	mX5XEKjuScjtkBEz0hXlE1nTvP4u7pn28aYc+gHBnFe2D+Q0wf4vkkmbApeD7i9ldfl0+S6IMjv
	agxM5+eA=
X-Gm-Gg: AYBFou3cj5Ig4wdfmHNyEt7t9YZ+XljpFf1R6kWvRSRrkQBY7ld3XSZJdiq9CqQdQ8w
	XuUCqbBlzYkA/RwSaXkliKnOwcR2FibkJbubQyhYh0FopXnA7G6ZXmZLxS59Q8loMlQUK40A79L
	vKSfTDUzvDwMyPTc9/qLuZ6S53coT+tcW+q9pvua6dgWtnNFTuRDYK4tn3aEQFUlSvDPKWy8MaV
	/JBQ9ZfmtZYDpGZ0UESH0/ALeGLIVs6hQzV1ngjkBUIfmlS5DGbaKr0K7dbsTFiaXZ+Hqr6BoJM
	EH/o0POnno0FxLBDPiGKtmA9J4f5avTLrRAgJ9LU7ypGlSJWL7SFubrSe+OkPXGJP7+2ujLQk+R
	RDOJm4tN1azX4I+oGXYyFQ/uLLImtPLQkaJSd/uhoth92Cij7P8+0ycg3ffkkQ+JOFDjCY4NCY8
	QcPjt6Gi6Cbwilfsri02vcjSYbVMgAML3DW2aMxRN1GNEFhsak7t8fBP/L8V9oSmu5Sjnb2e3u9
	ojEaDnC+VYRN18jTR582xIOB310PlxZBLNGogsyawV5OgJBACerZYtQOrZaDhwlcJp9529Jc8WZ
	z20KBy8vn6oZmihcCqbvX+/PvGNsKSt9u7g3/LG/S6+tdZPBV459Y25IXHDhmsXcVKzC7GJFBPK
	47gs=
X-Received: by 2002:a05:6000:4009:b0:48c:7143:610c with SMTP id ffacd0b85a97d-49c73bf0a80mr17528787f8f.36.1794732551828;
        Sun, 15 Nov 2026 00:49:11 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/41] oeqa: Let subprocess decode output instead of calling .decode()
Date: Sun, 15 Nov 2026 08:48:17 +0000
Message-ID: <20261115084845.701136-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250245
Content-Type: text/plain; charset="utf-8"

Pass text=True to the subprocess calls rather than decoding the bytes
afterwards. This also covers CalledProcessError.output. Raw socket/pty
reads and base64 output are left as bytes.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/qemu.py                         | 2 +-
 meta/lib/oeqa/runtime/cases/boot.py                       | 4 ++--
 meta/lib/oeqa/runtime/cases/dnf.py                        | 2 +-
 meta/lib/oeqa/runtime/cases/ping.py                       | 4 ++--
 meta/lib/oeqa/sdk/testsdk.py                              | 4 ++--
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py                | 5 +++--
 meta/lib/oeqa/sdkext/testsdk.py                           | 4 ++--
 .../lib/oeqa/selftest/cases/yoctotestresultsquerytests.py | 2 +-
 meta/lib/oeqa/utils/metadata.py                           | 8 ++++----
 meta/lib/oeqa/utils/qemurunner.py                         | 3 +--
 meta/lib/oeqa/utils/qemutinyrunner.py                     | 4 ++--
 11 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index a4f53747b01..e3e5ec874d5 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -81,7 +81,7 @@ class OEQemuTarget(OESSHTarget):
             blcmd = ["tail", "-20", self.bootlog]
             msg += "===== start: snippet =====\n\n"
             try:
-                out = subprocess.check_output(blcmd, stderr=subprocess.STDOUT, timeout=1).decode('utf-8')
+                out = subprocess.check_output(blcmd, stderr=subprocess.STDOUT, timeout=1, text=True)
                 msg += "file: %s\n\n" % self.bootlog
                 msg += out
             except (subprocess.CalledProcessError, subprocess.TimeoutExpired, FileNotFoundError) as err:
diff --git a/meta/lib/oeqa/runtime/cases/boot.py b/meta/lib/oeqa/runtime/cases/boot.py
index dcee3311f78..1ea22ac9a63 100644
--- a/meta/lib/oeqa/runtime/cases/boot.py
+++ b/meta/lib/oeqa/runtime/cases/boot.py
@@ -24,8 +24,8 @@ class BootTest(OERuntimeTestCase):
         while count < 5:
             time.sleep(5)
             cmd = 'ping -c 1 %s' % self.target.ip
-            proc = Popen(cmd, shell=True, stdout=PIPE)
-            output += proc.communicate()[0].decode('utf-8')
+            proc = Popen(cmd, shell=True, stdout=PIPE, text=True)
+            output += proc.communicate()[0]
             if proc.poll() == 0:
                 count += 1
             else:
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 1becc8d8a02..e96f2ac765d 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -103,7 +103,7 @@ class DnfRepoTest(DnfTest):
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_from_disk'])
     def test_dnf_install_from_http(self):
         output = subprocess.check_output('%s %s -name dnf-test-dep*' % (bb.utils.which(os.getenv('PATH'), "find"),
-                                                                           os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo')), shell=True).decode("utf-8")
+                                                                           os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo')), shell=True, text=True)
         rpm_path = output.split("/")[-2] + "/" + output.split("/")[-1]
         url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, rpm_path)
         self.dnf_with_repo('remove -y dnf-test-dep')
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index baea1b385ba..f4c57f0f1ac 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -28,8 +28,8 @@ class PingTest(OERuntimeTestCase):
         try:
             while count < 5:
                 cmd = 'ping -c 1 %s' % self.target.ip
-                proc = Popen(cmd, shell=True, stdout=PIPE)
-                output += proc.communicate()[0].decode('utf-8')
+                proc = Popen(cmd, shell=True, stdout=PIPE, text=True)
+                output += proc.communicate()[0]
                 if proc.poll() == 0:
                     count += 1
                 else:
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 747608f260c..ee25d682b95 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -66,9 +66,9 @@ class TestSDK(TestSDKBase):
         import subprocess
 
         try:
-            subprocess.check_output("cd %s; %s <<EOF\n./\nY\nEOF" % (sdk_dir, tcname), shell=True)
+            subprocess.check_output("cd %s; %s <<EOF\n./\nY\nEOF" % (sdk_dir, tcname), shell=True, text=True)
         except subprocess.CalledProcessError as e:
-            bb.fatal("Couldn't install the SDK:\n%s" % e.output.decode("utf-8"))
+            bb.fatal("Couldn't install the SDK:\n%s" % e.output)
 
     def setup_context(self, d):
         """
diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index 66edf56f6a1..a6e9c8a97f8 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -46,8 +46,9 @@ class SDKBuildProject(BuildProject):
         self.log("Running . %s; " % self.sdkenv + cmd)
         try:
             output = subprocess.check_output(". %s; " % self.sdkenv + cmd, shell=True,
-                                             executable='/bin/bash', stderr=subprocess.STDOUT)
+                                             executable='/bin/bash', stderr=subprocess.STDOUT,
+                                             text=True)
         except subprocess.CalledProcessError as exc:
-            print(exc.output.decode('utf-8'))
+            print(exc.output)
             return exc.returncode
         return 0
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 8e262a10a06..40560fb47a4 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -47,9 +47,9 @@ class TestSDKExt(TestSDKBase):
         bb.utils.remove(sdk_dir, True)
         bb.utils.mkdirhier(sdk_dir)
         try:
-            subprocess.check_output([tcname, '-y', '-d', sdk_dir])
+            subprocess.check_output([tcname, '-y', '-d', sdk_dir], text=True)
         except subprocess.CalledProcessError as e:
-            msg = "Couldn't install the extensible SDK:\n%s" % e.output.decode("utf-8")
+            msg = "Couldn't install the extensible SDK:\n%s" % e.output
             logfn = os.path.join(sdk_dir, 'preparing_build_system.log')
             if os.path.exists(logfn):
                 msg += '\n\nContents of preparing_build_system.log:\n'
diff --git a/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py b/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
index be062cf7839..221265e317d 100644
--- a/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
+++ b/meta/lib/oeqa/selftest/cases/yoctotestresultsquerytests.py
@@ -31,7 +31,7 @@ class TestResultsQueryTests(OESelftestTestCase):
         workdir = create_workdir()
         try:
             url = subprocess.check_output(
-                ["git", "-C", workdir, "remote", "get-url", "origin"]).strip().decode("utf-8")
+                ["git", "-C", workdir, "remote", "get-url", "origin"], text=True).strip()
         except:
             shutil.rmtree(workdir, ignore_errors=True)
             self.fail(f"Can not execute git commands in {workdir}")
diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 98f177edbd4..941a66de03e 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -68,19 +68,19 @@ def git_rev_info(path):
     except ImportError:
         import subprocess
         try:
-            info['branch'] = subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"], cwd=path).decode('utf-8').strip()
+            info['branch'] = subprocess.check_output(["git", "rev-parse", "--abbrev-ref", "HEAD"], cwd=path, text=True).strip()
         except subprocess.CalledProcessError:
             pass
         try:
-            info['commit'] = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=path).decode('utf-8').strip()
+            info['commit'] = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=path, text=True).strip()
         except subprocess.CalledProcessError:
             pass
         try:
-            info['commit_count'] = int(subprocess.check_output(["git", "rev-list", "--count", "HEAD"], cwd=path).decode('utf-8').strip())
+            info['commit_count'] = int(subprocess.check_output(["git", "rev-list", "--count", "HEAD"], cwd=path, text=True).strip())
         except subprocess.CalledProcessError:
             pass
         try:
-            info['commit_time'] = int(subprocess.check_output(["git", "show", "--no-patch", "--format=%ct", "HEAD"], cwd=path).decode('utf-8').strip())
+            info['commit_time'] = int(subprocess.check_output(["git", "show", "--no-patch", "--format=%ct", "HEAD"], cwd=path, text=True).strip())
         except subprocess.CalledProcessError:
             pass
         return info
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 26782518e4e..0e27a977335 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -316,8 +316,7 @@ class QemuRunner:
                 % (self.runqemu.poll(), os.path.isfile(self.qemu_pidfile), str(qemu_pid), os.path.exists("/proc/" + str(qemu_pid))))
 
             # Dump all processes to help us to figure out what is going on...
-            ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command '], stdout=subprocess.PIPE).communicate()[0]
-            processes = ps.decode("utf-8")
+            processes = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command '], stdout=subprocess.PIPE, text=True).communicate()[0]
             self.logger.debug("Running processes:\n%s" % processes)
             op = getOutput(output)
             self.stop()
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index d4a42304e23..0510977e9de 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -143,8 +143,8 @@ class QemuTinyRunner(QemuRunner):
         #
         # Walk the process tree from the process specified looking for a qemu-system. Return its [pid'cmd]
         #
-        ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command'], stdout=subprocess.PIPE).communicate()[0]
-        processes = ps.decode("utf-8").split('\n')
+        ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,pri,ni,command'], stdout=subprocess.PIPE, text=True).communicate()[0]
+        processes = ps.split('\n')
         nfields = len(processes[0].split()) - 1
         pids = {}
         commands = {}
