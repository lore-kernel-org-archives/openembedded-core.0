Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45125.1795622909924240744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=QnkbK2md;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91c847584b8so65408606d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622909; x=1796227709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1MPhYqNrB8dha4OUuDylAjhlUDI+kXPg10ttIY2Bu/4=;
        b=QnkbK2mdBZ8z1Ox5SG7lY+40RuYlsdZEEDBWi5EA0E9FTYqZ9BvRdwktusNefe2gFn
         2cGj75gC8a8CHlAmhXMq+nluh6AwM3LQ/cUvvaOa3vMwzztGHb5exmOsGoqzNVKBkY19
         89IVcgfCT/GJsfVpscdlqToLMLmyAPp4cJERU8sEK8L6Wrwqs/Uztk6KmNnVJ1scoQdx
         RDFbRaH72XD51aSSHSU6JJEPvnaC9xzO/9L9sXmDCm/U7sPAxRs4yvjq+TlaefsTQZru
         nI4phKpzDSBQtPNfrsY+BsEfxr9FfonKV6YjxYA3jftffpNN+a6ZMJ+LyX7K8KBL1zGv
         oVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622909; x=1796227709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1MPhYqNrB8dha4OUuDylAjhlUDI+kXPg10ttIY2Bu/4=;
        b=cFqmDZ10JXmCBjyQN4NT05SWB23jGlNsoXdQHAayPVwrrt/fStuRdXKNK8XxYQ259V
         smxM9wYjYOyIytfHjDxYxVarn+B7LYu6pzpurdqpH2/UbifYowP+ja6q8Vt0c6RFPdpJ
         3MfpAhwaQVyDuc5FSyHvNLPiCFIrzWsYn7+HWJR5ibgSr1XbEyyRIauPyFYjjyGQB8cE
         mFTom61G9flp4VSBLFF5xMQMfA9UIiif+UvYvQb6GEuHflPhEnZnV3VFEQGw3YzKCYQY
         DxPbrKQaEx0IQj/aj8kS/V9Ik3mWx40eN27lKyLpvA4ai7zMigymIGuqI22JrZHOTfX1
         cnLg==
X-Gm-Message-State: APuU4Z/CS0j8pGGZEVikmhXoQQFVo6U4y2kqUSAmpppkIWk6Y4IHT02D
	XIVKhh21IOZeRzGkbtg8qNWvuDMVMCZBMjlAcrdo0OcrbcWc7+NFWpKzzSObCAM75cbzNHXA5sa
	t4VyU
X-Gm-Gg: AZFdTZfnmVb0E/MnSgGo6yYVaxWUHyab/9EsoAhW8jcs5cW12FLHpYUjrmfJ8jxrzXg
	rApZ4CbkQ//5WvR0sjK8Mc7CgtBWatKW9BMpyUsPyPQG03HFlnf1+CAWM7VpY8T5+JHYUKjhBPt
	AYJCb1lY5JTjSDbrvEYOXWw4F560D8HXVR35R5++23efdZmzyyLOoj36rO909A1QVXixT2fBJCa
	PUy5HwOgSnQd/SB+M/g4aXVwJjJZGn+zLfTK+XzLAtvDO0g2F2Tvac3LYpHB7Ga+P7p4PUzuFZC
	yb6Udg1UMMES2U/I38StOdbsU/SwDmdsVyJ2rHwfTW8TKQtZxeVWlIESgDt80sIKUcd+hklkDyK
	sMFm+qU+HTi3BVYf2N4IwWLTe+U7BQStxoJc/KZzFMXUTJ52MUIpahzT1mONOw88p7j56mihsz2
	EQRyavu5foIrRkbxYgChOzUPx+mkkqdBN2NH1ECZ5cs4JCmArGnwyn6B5I2+pfCGSjD2s/LsErY
	NifS5g13Wd/PeC0iRZn78hgV/4nDF34j/MInyC3FQcBGhY9HhytwVkGMxwEF0BNiGrBwrkVwfev
	cK4zJIYhlcMSBAztP0214tqnCyzSdfJJi49shAlCnHk59RDlcLl4ugOHGPq5cpdXxd1qQAHy5aP
	ZSSqJ6BT4mw==
X-Received: by 2002:a0c:f15c:0:20b0:921:3dc3:ea70 with SMTP id 6a1803df08f44-9213dc3ebb1mr228649866d6.3.1795622908561;
        Wed, 25 Nov 2026 08:08:28 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787f6847sm25849466d6.30.2026.11.25.08.08.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:08:27 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6 v2] ptest-cargo.bbclass: run do_install_ptest_cargo as a postfunc
Date: Wed, 25 Nov 2026 11:08:19 -0500
Message-ID: <20261125160821.3028875-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125160821.3028875-1-tgamblin@baylibre.com>
References: <20261125160821.3028875-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251209
Content-Type: text/plain; charset="utf-8"

do_install_ptest_cargo appends to run-ptest, but run-ptest is only reset
by do_install_ptest_base's cleandirs. This means that changes to its
signature (e.g. by setting 'RUST_TEST_ARGS:pn-hyperfine = "--test-threads=1"'
in local.conf) just append another block to run-ptest with an 'exit $rc'
in between, so changed test arguments aren't actually used. Run
do_install_ptest_cargo as a postfunc for do_install_ptest_base instead
so that changes are always reflected.

do_install_ptest_cargo is removed as a task.

Tested by setting RUST_TEST_ARGS in local.conf as described above. Here
is a snippet of what the double-appended run-ptest script would look
like without this fix:

|if ! /usr/lib/hyperfine/ptest/hyperfine-e8776e44d98845b7
|then
|    rc=1
|    echo "FAIL: /usr/lib/hyperfine/ptest/hyperfine-e8776e44d98845b7"
|else
|    echo "PASS: /usr/lib/hyperfine/ptest/hyperfine-e8776e44d98845b7"
|fi
|exit $rc
|
|echo ""
|echo "## starting to run rust tests ##"
|if [ -z "$rc" ]; then rc=0; fi
|if ! /usr/lib/hyperfine/ptest/execution_order_tests-0fccc0f22d97e11e --test-threads=1
|then
|    rc=1
|    echo "FAIL: /usr/lib/hyperfine/ptest/execution_order_tests-0fccc0f22d97e11e"
|else

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 73b9e84766..cc82ea320b 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -125,21 +125,19 @@ python do_install_ptest_cargo() {
             shutil.chown(os.path.join(root, f), "root", "root")
 }
 
-do_install_ptest_cargo[dirs] = "${B}"
-do_install_ptest_cargo[doc] = "Create or update the run-ptest script with rust test binaries generated"
 do_compile_ptest_cargo[dirs] = "${B}"
 do_compile_ptest_cargo[doc] = "Generate rust test binaries through cargo"
 
 addtask compile_ptest_cargo after do_compile            before do_compile_ptest_base
-addtask install_ptest_cargo after do_install_ptest_base before do_package
 
-python () {
-    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
-        d.setVarFlag('do_install_ptest_cargo', 'fakeroot', '1')
-        d.setVarFlag('do_install_ptest_cargo', 'umask', '022')
+# Run as part of do_install_ptest_base so its cleandirs always provides a fresh
+# run-ptest to append to. As a separate task, a signature change (e.g.
+# RUST_TEST_ARGS) re-ran only this step, appending a second block after the
+# first "exit $rc".
+do_install_ptest_base[postfuncs] += "do_install_ptest_cargo"
 
+python () {
     # Remove all '*ptest_cargo' tasks when ptest is not enabled
     if not(d.getVar('PTEST_ENABLED') == "1"):
-        for i in ['do_compile_ptest_cargo', 'do_install_ptest_cargo']:
-            bb.build.deltask(i, d)
+        bb.build.deltask('do_compile_ptest_cargo', d)
 }
-- 
2.56.1

