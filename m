Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58342.1795453300302081827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 09:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Qfvy0rC8;
 spf=pass (domain: baylibre.com, ip: 209.85.210.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-85c1135c286so2895116a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 09:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795453299; x=1796058099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAwaWltstvgwPpWGY4rUiti4PBNa30+rspzCzYmZDLU=;
        b=Qfvy0rC8DrEPYnRIVm9auBRFf/1yFUw902W67TPhbAKgFzvksfNSp+nLTouw4bSp2h
         Rym3a6vn7wAIjF2Da5vxECJ/vR5R6bBvoZgdV8BNqRVTjpaTBHvb64zFLuYZUF976gMX
         bVH2U+nlumOwPpzGiMDhOx6HzBMgd2+RBwJQTqbS/JXw7bH+N81CUYg/L6gCe3G4Zh/Q
         qLX0tcnFQbEoFnx5Tn2fmtxLqpxuXQ3LTmlzkvCfKUgM9pkHmdccjWdX12Wqy7uiPNmv
         6xhXMMg4DaCavgeDjnsNzVsa1ABtt+tNFkyegz1SpVBEwDaiM3mbRW7NRze8gT1ChEht
         FXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453299; x=1796058099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAwaWltstvgwPpWGY4rUiti4PBNa30+rspzCzYmZDLU=;
        b=LrI27KCCVDse5YkkbzWvhCpaA+k1unUot0cUQz9Q9AHgyf8N/fYuhlACfLvOmu983N
         9cOcCvHK029oWExI2Sf2R+PhhUbd+rWDhpkWUP3yZzZa79aiOyLsyZcv4HC6vZzxhWDq
         eG59Rj9Amusmm+MYobjtKfEslJ7nINYYX7UqwzKORKIt1ozkOzIJmDo2uGSoVbRpIQqH
         gJA4YTgAu/Z3ts4gYfzIwpLcsdrQI2iIP7dazWYQax3etMddkLg1rb2fZkZtauqN024+
         YFWJ771T72eMptbIi1+Oci6S9fjAusZOWl0A/PUP5BcQs2A0hrz376lVNCP/pHqRAH6o
         f6Jw==
X-Gm-Message-State: APuU4Z8DQq5UiTqlMSFjcdCp/Ry/EWRSYN6LZmH/+MFPcLoHTexdFbWF
	qPizU4d9my4nPOYXxx6kll2M7RNOMTcBD5WjHJ36In7t/pI1zS88VFhsOrxLTZHWozDiPPDHsrs
	r2a5U
X-Gm-Gg: AZFdTZcOx+1D42IDTtzvVB0ZV2sdrSra+GPhrxPvpn/qfL9CCr7schY8yBBKxjNRLr9
	L42Z2uDOvDH4WNUmvtG4wRKDJsP2shgbf1RqROVqJm5xTok/OwVCshzuT3jv1nuL5MmECo+82rl
	MeXChAbVc+baJVYBXMkXHL0mI+PaBk+2232JKImnJy2F6INTx23gOkJQnCJ2qi4kHTf/ZFKoHy8
	1ahr+8X6wJGfgX9Y5tpquc21QataA83JGUH0US5MA6i/OBa40e0dNcyaWewLfaCew+ghFVlYLxI
	pRymgByTlcm5MjV/V0ToNsJL62BZyuYReaB9vcDm+MH+fyC0iWaTHB1OlMc69o4pyGbgbiL4+/P
	mStvvbfwWRaVxy8IvTUL/i/QrsCUlHEJDagN03V19UunH4gUoGI7aIpdw7PJbuq2+NoE4KjTePe
	L8TqXG0ETSP9isLFIUBM1nqChBq4KfVF21JVsEZuj7NUMRHa/g2m8CAnVqWhEKDg4DZbZeX4zb3
	y+4h3OgyY3xX6jOAk6myHSOtg1Cwb0tXKkVdj8fkUacz4DJpJVPVmJY5BLnIQwEwQRzrRGFxjGG
	ChFRFfAq1/8FI0Fj5pooTMsJYcSRZmahHntuPLG1hVaXf8SIqBAJMxBASJDtUD3okhueD2FeX40
	xXECwvoxpCVK7J1L90QXtQ2n/gA==
X-Received: by 2002:ac8:59d5:0:b0:55d:6cfa:3e85 with SMTP id d75a77b69052e-55d76a15e9amr235162381cf.16.1795453288734;
        Mon, 23 Nov 2026 09:01:28 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788ae02fsm101985591cf.29.2026.11.23.09.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:01:27 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
Subject: [OE-core][PATCH] meta/lib/oe/sanity.py: error on very long package archs
Date: Mon, 23 Nov 2026 12:01:25 -0500
Message-ID: <20261123170125.328630-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 17:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250926
Content-Type: text/plain; charset="utf-8"

RISC-V tunes that don't set RISCVPKGARCH:tune-<name> fall back to
TUNE_RISCV_PKGARCH, which grows with every extension enabled. This can
easily exceed allowable maximums for build and sstate paths, so it
should be a fatal error when this tuning string becomes too long to
build.

Add a generic check in sanity.py so that sanity.bbclass throws an error
if TUNE_PKGARCH is too long for any architecture. This gives plenty of
headroom for basic RISC-V tunings and profiles, and it should be
adequate for other platforms as well. Update the selftest in
riscvtunes.py to make sure we do a parse and check the sanity output for
the new message.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/README     |  5 +++--
 meta/lib/oe/sanity.py                      |  9 +++++++++
 meta/lib/oeqa/selftest/cases/riscvtunes.py | 12 +++++++-----
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/meta/conf/machine/include/riscv/README b/meta/conf/machine/include/riscv/README
index 278da51ba9..2b84688cb9 100644
--- a/meta/conf/machine/include/riscv/README
+++ b/meta/conf/machine/include/riscv/README
@@ -92,8 +92,9 @@ TUNE_RISCV_PKGARCH - This is the PKGARCH value generated from TUNE_FEATURES.
 RISCVPKGARCH - This is the package arch actually used.  As with ARMPKGARCH
                on arm, each tune sets it as a literal in
                RISCVPKGARCH:tune-<name>, so that it only changes when
-               deliberately changed.  Tunes that don't set it fall back to
-               TUNE_RISCV_PKGARCH.
+               deliberately changed. Tunes that don't set it fall back to
+               TUNE_RISCV_PKGARCH. The sanity check errors if the package
+               arch is longer than 64 characters.
 
 The standard variables are defined as:
 
diff --git a/meta/lib/oe/sanity.py b/meta/lib/oe/sanity.py
index c9149ec974..139a2ef314 100644
--- a/meta/lib/oe/sanity.py
+++ b/meta/lib/oe/sanity.py
@@ -279,6 +279,15 @@ def check_sanity_validmachine(sanity_data):
     if tunefound == False:
         messages = messages + "Error, the PACKAGE_ARCHS variable (%s) for DEFAULTTUNE (%s) does not contain TUNE_PKGARCH (%s)." % (pkgarchs, defaulttune, tunepkg)
 
+    # Very long package archs (e.g. RISC-V tunes falling back to the full ISA
+    # string) can exceed allowable lengths for build and sstate paths, so alert
+    # the user if this is the case.
+    if len(tunepkg) > 64:
+        messages = messages + ("Error, TUNE_PKGARCH (%s) for DEFAULTTUNE (%s) is "
+                               "longer than 64 characters. Set a shorter package "
+                               "arch for the tune (e.g. RISCVPKGARCH:tune-%s on "
+                               "RISC-V).\n" % (tunepkg, defaulttune, defaulttune))
+
     return messages
 
 # Patch before 2.7 can't handle all the features in git-style diffs.  Some
diff --git a/meta/lib/oeqa/selftest/cases/riscvtunes.py b/meta/lib/oeqa/selftest/cases/riscvtunes.py
index b2ff2cc739..7e30e50a75 100644
--- a/meta/lib/oeqa/selftest/cases/riscvtunes.py
+++ b/meta/lib/oeqa/selftest/cases/riscvtunes.py
@@ -93,22 +93,24 @@ class RiscvTunesTests(OESelftestTestCase):
     def test_riscv_pkgarch_fallback(self):
         """
         Check that custom tunes which don't set RISCVPKGARCH:tune-<name> get
-        TUNE_RISCV_PKGARCH as their package arch, and that it's an error if
-        that is too long.
+        TUNE_RISCV_PKGARCH as their package arch, and that the sanity checks
+        reject it if that is too long.
         """
         def config(tune, features):
             return self._machine_config() + \
                    'AVAILTUNES += "%s"\n' \
                    'TUNE_FEATURES:tune-%s = "%s"\n' \
-                   'DEFAULTTUNE = "%s"\n' % (tune, tune, features, tune)
+                   'PACKAGE_EXTRA_ARCHS:tune-%s = "${RISCVPKGARCH}"\n' \
+                   'DEFAULTTUNE = "%s"\n' % (tune, tune, features, tune, tune)
 
         self.write_config(config('rv64imac-zicond', riscv_isa_to_tune('rv64imac_zicond')))
         self.assertEqual(get_bb_var('TUNE_PKGARCH'), 'riscv64imac_zicond')
 
+        # Use 'bitbake -p' to parse, so that sanity checks are triggered
         self.write_config(config('rva22-zicond', riscv_isa_to_tune('rva22u64') + ' zicond'))
-        result = bitbake('-e', ignore_status=True)
+        result = bitbake('-p', ignore_status=True)
         self.assertNotEqual(result.status, 0)
-        self.assertIn('Set RISCVPKGARCH:tune-rva22-zicond to a shorter name', result.output)
+        self.assertIn('for DEFAULTTUNE (rva22-zicond) is longer than 64 characters', result.output)
 
     def test_riscv_unusual_tunes(self):
         """
-- 
2.56.1

