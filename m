Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44817.1795622118372440329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 07:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=GjV1LzXi;
 spf=pass (domain: baylibre.com, ip: 209.85.219.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9213922de73so5789266d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622117; x=1796226917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1MPhYqNrB8dha4OUuDylAjhlUDI+kXPg10ttIY2Bu/4=;
        b=GjV1LzXiymgNpLgLRvHVQ8ZeWKZoNKAfQpUBTQxtcTeNH4it/gKFEEOvE2pnStQQPm
         TU7+wEU15fqByKOzmK+BVuzx1Mddk4biSHUKy+LFLc/Y1r3xTShBUlXnjZ92o3M7kZVI
         Ktlt6+IFh0D32QXRdM0iBRRaqnlReNYCy6V8a84wLoii+R6kfa2EbSkhAbK7eC43tjtG
         yCqUMF+ADAJ9weuv0XE02WFIEdNwH6NSA6IHzQLe7o9D7d6qPYv7h1SEYxCT48UPpkpF
         ynyZs1w8jnalHFsz0ZJ2X+Vvzjvux1vExLd2ug8r7QMnW5AnNTeuXt19w7mJRshhZfQN
         DqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622117; x=1796226917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1MPhYqNrB8dha4OUuDylAjhlUDI+kXPg10ttIY2Bu/4=;
        b=UtzboCJvuRuYXzMSv9Ih2/Pdh92g18vDs1FF3+RxDq4GaIHVHiOInQalQ96s7SN0ay
         gk47OwbuN4HRlLG+nqdTTBsoUh5roYjoJ+yC36viSNSR1lUaTzaCnAE5w2UR7hxCGTZL
         tBkj39I/SCnoP9M1xHcaMTCvGFJ30oJoHc1GwFIVMt6oTzElpP/GEAoL1gXC7EfqkWm3
         gTuTRu+IyIBOAF1dDRVdhMp5C6IxmLex1+GOohuLdhagmSFyHYgiypdxWAG12R1unSw9
         16LNXEEBEDcQ5wCfLiVRbyPwwHxMgIdmM+doFIlJTYvjMOJtYkFrvgXT0XlFcz8+2nBk
         Id+Q==
X-Gm-Message-State: APuU4Z9zHHUtGBNwZRcjJi00LN3lekmyO3glzDdJ3epbm4/AIibEANJk
	RoRwTCfE0BhlhmUnWZfA/VB+tRbDXgm4ckeTr+EkvCI/u58aIQZ5CXNKgoCYR45hFF3XAUNl1Vj
	1lx8K
X-Gm-Gg: AZFdTZeVsQD5h/IzRHUP+UmmQ2KOsAjxPnCpAlUGPRwC+bzSBciMc7TdBAnh5SJqRNj
	rP4Agvk6c+/QrPHcTZQaMMOp9PubdOfpgDHh9SmEzvW9gs27MsXc1xNqivTSHp+U1CVwmb4XxNm
	kexe3Oqpr8JHMcdzuhyLilMv60di0ctTkS0Q9prmzBiW3vNtG+/6ptPe8FQNAbDa2VB45b8PZeg
	y1lnZ/2WdMW3ovAfagpFVO0acG59riLTxZou/haFZa+dezEcuc7le28k7fYCtiFc06pY94tsUI+
	2mDYiSOemmiEwQkeRNhD2lmPhomm3jlQGLgLsV7dGNOt4NJu6Q202gIniag/R42GRvSref+dVrL
	3EvK9l6kMkrCZ34u7aTslPvSbIPNKUKMErRL+0WqKN0L3/QBozkz9Dpd1dIzbkliyHKObtLhR/F
	FwIungq0RrE/r/n36rEpKYsucjssI8BOrbSOITzvKsep/2IzgeqfUusaEDM6JDnxl4gYq7bFB9e
	LNfkmGe8Cy3yO6aTISNBcFACJAxMHHxRtRVmnKebe3o/W5YKOct1WNt2WTGxyrlm8v4jNpOdXq8
	bt8CzEV7pny83Atp0S96Wg8h5RDuRjUPRyTM5X9XnmeCmhOzdR6VNKpOrAox606TSg0/i98T8DL
	V0heWE4GI4Q==
X-Received: by 2002:a05:6214:5192:b0:921:19b3:4c20 with SMTP id 6a1803df08f44-92134a79aa9mr336424616d6.17.1795622117084;
        Wed, 25 Nov 2026 07:55:17 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm167601326d6.15.2026.11.25.07.55.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:55:15 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6] ptest-cargo.bbclass: run do_install_ptest_cargo as a postfunc
Date: Wed, 25 Nov 2026 10:55:05 -0500
Message-ID: <20261125155508.3024814-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125155508.3024814-1-tgamblin@baylibre.com>
References: <20261125155508.3024814-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 15:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251201
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

