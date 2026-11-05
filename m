Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30075.1793868241014433857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kJpufrAc;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df4f540ebso811722f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868239; x=1794473039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FO/Xc2ScaawQSTmUXc31/IguVgN7Nh2GR7hqL43Gq0w=;
        b=kJpufrAchLJSZinHjqKe3SyJ9xwKHU1QRaE46s7L+jFpWgDPnDgJhQIDE7RAmo5dXP
         JgrQygW8o+oYqEg8sUh84AXtLpS3t7OdLtpBGdiWIUmnm4kuTAciuMHO3UzoBiEdNLRJ
         D5dSpfn7pVeDJj1f5sm1UVk2K4d4RV7mMrc4fEV3DTPv990fVgUVNenw7CIV9w8vn74Q
         wETzXS4wmfus9uNWGBNSorJCGbmU4GE/xtaIWmSQcD3Z8vMFejggNGgMiA3F06yy0lDy
         fsKWSOyQrF7UqUaA37IkRyCDpokMo82TDq8GKqgOqpvA7l6eYBTcgHOQ4Ti95aF6otZ9
         drEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868239; x=1794473039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FO/Xc2ScaawQSTmUXc31/IguVgN7Nh2GR7hqL43Gq0w=;
        b=1LbcElKl3s3BMx9Bnsog9rzJoV3zipYXoEE31hvWdtxS1ePgoxyR7VQqZt/YVsCbmQ
         aLA9QxfSfp2wJ7eH8Q3IF2/2T/UUb1AUhJZOrQKjoEQz+dhpwV16prgqFM7gpHUVBlU2
         zqjyAJ6aREYdLTN/B41r8ZKcOTLkkqMuObR1UIbjwnqR83HHu+MxQOfLHtwtVWBc2r00
         iDehhcF2bIJa+UHNx+ZeHA0AQF5OxSIDv4EpPHgntP4xhRx2o0cKF46nB4oQ1Enq6Rys
         MXkiqzxpU7FE+qcUYieG4JTw6U0XHFw69R99KmJVVwILwJMdzyVlV0KwSMNIhEPMHwq5
         LINA==
X-Gm-Message-State: APuU4Z82Nxh9NqaQ3f4jDCzwz0hHgvgZ69LlKaFOe9nZJgFNJgLkpbfL
	7LwGy2ipMgJB1arCID/RJB9Ez4EDZ+hm8qk4tiIpDFK8bgEwiMggSFfQvTSxmFGn8b4NzFSVW5p
	YUbH3RCc=
X-Gm-Gg: AYBFou1urieSQ0QEA4kx+53OeThmHmcbRMtfXHPx9OIo6uEr2Ymot0vmaMdpWizN4/b
	sJlQLmEzIq8mbF5reafWNreO2N1dqk1NFhfOlyJFy06E8f0SGRyKwPSxo64CiyFd9Jd06oavYoh
	V8qIIXKT9k+NYQkYVheuWTYtaPd5MonJh+iVkTjh+qQZt+HT+AGEeZNVB9D8Vc/q8+QVkxL08eF
	GY+HNnq9pq2oCqMgYImWvX8mTgpLO5aiHQCrzN2d0rgOXG5FieQU5LSWxDC2kzaET/4rPCkA09J
	lrh1N8GIHWEa8craqtspjKQJ0ub+4rqWdarbzbcqaoCoqLKR0w2IMpflvCeQYNv2T246V4mgc+w
	B38RHDN1Gu1MFV+kWUpHV+Y34MrgVLdA5bVpHl6IdTg8zVDW9NLc0j3n5DeT6inhKkCPIfz/0RL
	aRyccqCzVbMfTLNB7H1yipuoeOIBu4gxqsHKn3LMczCEDwqyDi6V0iO+aqyQ0YEqZwZtVQ+V0El
	zpymbGaAOOQem/ZvaslX/Qf/7OJSxQDJNwEBJ3SwSdD+4z0vI66nXfjRN3OZaTkgK2Rt/94HmVl
	SjRxyPXyeyRD5g+rswY6aE/P9agKNd4fy0NC0sMHhtMTUyhzp2ZcPA2GK6x7k9O4XxacbDOXidZ
	pIJntnLbKk79atqjmqlkeyluYxqmA
X-Received: by 2002:a05:6000:26cc:b0:48c:77ad:d52d with SMTP id ffacd0b85a97d-48e6e510ee8mr38278321f8f.43.1793868239225;
        Thu, 05 Nov 2026 00:43:59 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 38/60] oe-selftest: devtool: retry lldb batch on handshake timeout
Date: Thu,  5 Nov 2026 09:42:57 +0100
Message-ID: <79b734747584ae2b6d230c84a0c28e6a5963dfde.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249497
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The ide-sdk lldb tests intermittently fail on the autobuilder with
"failed to get reply to handshake packet within timeout of 6.0 seconds".
LLDB hard-codes a 6 s minimum for this handshake, which a slow
lldb-server on a loaded target (NFS root, emulated) can exceed.
https://github.com/llvm/llvm-project/blob/release/23.x/lldb/source/Plugins/Process/gdb-remote/GDBRemoteCommunicationClient.cpp

Retry the lldb batch once in that case and log the target's lldb-server
log after each timeout so the cause can be diagnosed if it persists.

[YOCTO #16452]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8870539f603b5f3673109a5b06751c84ef626ca1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 26 ++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a6002ec2b68..dbe039f8e6e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4955,6 +4955,25 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         # Second pass: debug again, breakpoints now resolved at shifted line numbers
         lldb_session_func(magic_string_new)
 
+    def _run_lldb_batch(self, qemu, lldb_cmd):
+        """Run an lldb --batch session, retrying once on a gdb-remote handshake timeout.
+
+        lldb hard-codes a 6 s minimum wait for lldb-server's first reply, which
+        can be exceeded on a heavily loaded host (NFS root, emulated target).
+        On such a failure the lldb-server log is fetched from the target for
+        diagnosis. Any other failure is reported unchanged.
+        """
+        handshake_timeout = 'failed to get reply to handshake packet'
+        for attempt in (1, 2):
+            r = runCmd(lldb_cmd, ignore_status=True, output_log=self._cmd_logger)
+            if r.status == 0 or handshake_timeout not in r.output:
+                break
+            _, server_log = qemu.run('tail -n 50 /tmp/lldb_server_*/lldb_server.log')
+            self.logger.warning("lldb handshake timed out (attempt %d), lldb-server log:\n%s",
+                                attempt, server_log)
+        self.assertEqual(r.status, 0, "lldb batch session failed: %s" % r.output)
+        return r
+
     def _lldb_server_debugging_once(self, tempdir, qemu, magic_string):
         """Verify lldb-server (platform mode) + lldb batch debugging works end-to-end.
 
@@ -5042,8 +5061,7 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
                 source_map_args += [k, v_resolved]
             lldb_batch += ["-o", "settings set target.source-map %s" % " ".join(source_map_args)]
         lldb_batch += self._lldb_debug_cpp_example_batch_commands(tempdir)
-        r = runCmd(lldb_batch, output_log=self._cmd_logger)
-        self.assertEqual(r.status, 0, "lldb batch session failed: %s" % r.output)
+        r = self._run_lldb_batch(qemu, lldb_batch)
         self._lldb_debug_cpp_example_check(r.output, magic_string)
 
     def _verify_nfs_launch_json(self, tempdir, nfs_rootfs):
@@ -5103,10 +5121,8 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
         # Run an lldb batch session covering the executable, library and
         # header breakpoints, then continue to completion
         lldb_batch_args = self._lldb_debug_cpp_example_batch_commands(tempdir)
-        r = runCmd([lldb_script, '--batch'] + lldb_batch_args,
-                   output_log=self._cmd_logger)
+        r = self._run_lldb_batch(qemu, [lldb_script, '--batch'] + lldb_batch_args)
         self.logger.debug("lldb batch output: %s", r.output)
-        self.assertEqual(r.status, 0)
         self._lldb_debug_cpp_example_check(r.output, magic_string)
 
         # Stop lldb-server
