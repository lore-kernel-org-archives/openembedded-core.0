Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.611.1795034980495361060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=dO5YrleV;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5430f70c827so20546791cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034979; x=1795639779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpbuFl1AXRZi4YQKU00JiUYdEbHc8UFgUi0as2HnWWY=;
        b=dO5YrleVdhAZ6EyWzqDh5+vfzJ343htRKxSRpInBOO+m7uxsS8nXXs1JOS4D3oHFHB
         aA+Zp6QJuT+rvTHO2GXjJEnPaSHOfbt4BV4+TzqMy7iuWfISY2xAYgbaBLkCxQlLoN7K
         MjumBdmb8601k3wzWmrEP5cX0KUIcV+a3SiQLTiuTMBh8EJk8Fv51/eyGD/HxQax5lYh
         3Wvo1d7xOCSV89YyNL6F6Rkly6vVY/ocnLjrZNb1HqdApOmEYs1IRDBtbUWrqpNJzKNT
         ZnmYVvE/H3JrVPUlBkndTY2f2ZjpAU86DaqAR0UeEb8OwbNtjTGAagh2K0FS2QJu86yL
         GMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034979; x=1795639779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpbuFl1AXRZi4YQKU00JiUYdEbHc8UFgUi0as2HnWWY=;
        b=2D6j2bHjGezYZGYBiQJx/nqzZ1RLtxni5Fm56sade22A/nBoPFSun9qvCC92mOly8t
         B+Uxb7pVnU2AR4AWXdC9svXshirY0HhnWS5CoKtuAIQUEEaFvRVd0Uyy4+V5c2JA/eaE
         PUcwmknQuslNoYWXBj/XcKO/3quC1I/aliM3oYiyRswDedOA0GHLvPcL8qpwSI+jrpZb
         X9oul8+hVTTbsBx9n3Ry+n4V8emEFmjuwvqitoaIBLrfVzzncQ6Iq+h/CPkys3EDPUh5
         sQyjkhge9jO8zxKNo+9vWrVUOu6NcH4VcNj0CQWtBdJFJ1uCktcblAtMSt5Kta0Qh4Pa
         t0UA==
X-Gm-Message-State: APuU4Z/CZFh/0T9Df+enSo91np/rmVLSvFnYZVxZMYTDlJcLBc+iYa5D
	1u39dwYys49IZh+yPCp9r22pkTRxyCB5yk3tlR2JgnMpo11EnVhE/bTVf36o2ZHNhxyRRSTNidQ
	kXM1x
X-Gm-Gg: AYBFou3xFtiZTdtXb12nWVUmzyNw9B04q7mvfS8xdvZf2JzvLo6PnAemVzZUBIdFsor
	lAaSKtuy6hSaH5RR6HE1Ub3Bp6Mm81WfMDc+qitXaV/0Er1j7yy7gc/khd0DVtIBmMk4tVAjkvS
	RpZj/S6YZKgv33v9kNLbGS9jcHMDm1UwEN5QZDSV+diziuexfJGxGT+1kaw/J6lZpigfUtyfTAy
	2D0jm2hFsUugMs/75UAkULgQmr7hMkI3wkI2tfG2Vdnsj5ZH6xyys9dA1tXVipAnXBCMQ5vFB1d
	N04bCvaMVWba7FuMn2Gxuy+rqCCq+880zOtV2T8C1OJ2YnTh9ZYoeTHBZlrBVCNg6ahQJ4hKMc4
	IpUay4ErDs4SBTRffU+LQWEpmRXDPlSgTy3agkBPTZhIFdBonNcnNaqw18o2EOFX/CxAWqkyGh/
	RepjMAVIIGLXeoP06/gs8vxnlDp3/1ZG8lpg9WLT6DlbCstWEJxlxAgd3aNYNluNiFxzTAS11sX
	pnQnZre61kU7dtXnpyXPX83LGJdhTiWu3rFF5fnRTPrTRmMB6KkZ5MgJ65wBdY0WOZSZbMavFO9
	uk9bxQPQAo1KD7pjJBNMwVchFkZCIOVVhG1UsdGQdkFy2uLnYU2GPQj9PGg+bGZyTh2cjpLdrbN
	Qy8Q5
X-Received: by 2002:a05:622a:2447:b0:55d:36a7:81c2 with SMTP id d75a77b69052e-55d5a2d1ef5mr61362851cf.5.1795034979306;
        Wed, 18 Nov 2026 12:49:39 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:38 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 10/12] lib/oeqa/selftest/cases/riscvtunes.py: add RISC-V tune selftests
Date: Wed, 18 Nov 2026 15:48:51 -0500
Message-ID: <20261118204853.2155173-11-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250593
Content-Type: text/plain; charset="utf-8"

Add selftests for the RISC-V tunes in oe-core, covering:

- Every tune in tune-riscv.inc has a package arch that's in
  PACKAGE_ARCHS
- PACKAGE_EXTRA_ARCHS only lists package archs for tunes that each tune
  is a superset of, with its own coming last
- Package archs for profile tunes and their '-march' and '-mabi' options
- Existing tunes' package archs don't change
- The 'riscv64' and 'riscv32' aliases match 'riscv64gc' and 'riscv32gc'
  respectively
- Custom tunes that don't set RISCVPKGARCH:tune-<name> fall back to
  TUNE_RISCV_PKGARCH, and error if they're too long
- Custom tunes with unusual extension sets build, i.e. the compiler
  accepts their respective '-march', and the package arch works for
  build/sstate paths

AI-Generated: Uses Claude Opus 5.5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/riscvtunes.py | 148 +++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/riscvtunes.py

diff --git a/meta/lib/oeqa/selftest/cases/riscvtunes.py b/meta/lib/oeqa/selftest/cases/riscvtunes.py
new file mode 100644
index 0000000000..daee22a51e
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/riscvtunes.py
@@ -0,0 +1,148 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oe.tune import riscv_isa_to_tune
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
+
+class RiscvTunesTests(OESelftestTestCase):
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        cls.orig_machine = get_bb_var('MACHINE')
+
+    def _machine_config(self, machine='qemuriscv64'):
+        # Builds set up by bitbake-setup select the machine with a builtin
+        # fragment, which is fatal alongside a MACHINE assignment, so drop it
+        return 'OE_FRAGMENTS:remove = "machine/%s"\nMACHINE = "%s"\n' % (self.orig_machine, machine)
+
+    def test_riscv_default_tunes(self):
+        """
+        Parse every RISC-V tune and check it yields a usable package arch, and
+        that PACKAGE_EXTRA_ARCHS only lists archs of other tunes whose
+        extensions are all available in this one.
+        """
+        # Only variables are checked here, so the riscv32 tunes can use the same
+        # machine
+        self.write_config(self._machine_config())
+        tunes = get_bb_var('AVAILTUNES').split()
+
+        vars = {}
+        for tune in tunes:
+            self.write_config(self._machine_config() + 'DEFAULTTUNE = "%s"\n' % tune)
+            vars[tune] = get_bb_vars(['TUNE_FEATURES', 'TUNE_PKGARCH', 'PACKAGE_EXTRA_ARCHS', 'PACKAGE_ARCHS'])
+
+        pkgarch_features = {v['TUNE_PKGARCH']: set(v['TUNE_FEATURES'].split()) for v in vars.values()}
+
+        for tune, v in vars.items():
+            with self.subTest(tune=tune):
+                self.assertTrue(v['TUNE_FEATURES'], 'empty TUNE_FEATURES')
+                self.assertTrue(v['TUNE_PKGARCH'], 'empty TUNE_PKGARCH')
+                self.assertIn(v['TUNE_PKGARCH'], v['PACKAGE_ARCHS'].split())
+
+                features = set(v['TUNE_FEATURES'].split())
+                # za64rs is a stricter za128rs, which RVA20U64 requires
+                if 'za64rs' in features:
+                    features.add('za128rs')
+                for arch in v['PACKAGE_EXTRA_ARCHS'].split():
+                    self.assertIn(arch, pkgarch_features, '%s is not the package arch of any tune' % arch)
+                    self.assertLessEqual(pkgarch_features[arch], features, '%s needs extensions %s lacks' % (arch, tune))
+                # The tune's own package arch has the highest priority
+                self.assertEqual(v['PACKAGE_EXTRA_ARCHS'].split()[-1], v['TUNE_PKGARCH'])
+
+        # Profile tunes are named after the profile
+        for profile in ['rva20u64', 'rva22u64', 'rva23u64']:
+            with self.subTest(profile=profile):
+                self.assertEqual(vars[profile]['TUNE_PKGARCH'], profile + '_zifencei')
+                self.assertEqual(vars[profile]['TUNE_FEATURES'], riscv_isa_to_tune(profile) + ' zifencei')
+
+        # The package archs of the existing tunes must not change
+        self.assertEqual(vars['riscv64gc']['TUNE_PKGARCH'], 'riscv64imafdc_zicsr_zifencei')
+        self.assertEqual(vars['riscv32gc']['TUNE_PKGARCH'], 'riscv32imafdc_zicsr_zifencei')
+
+        # Legacy tune names behave exactly like the tunes they alias
+        for alias, target in [('riscv64', 'riscv64gc'), ('riscv32', 'riscv32gc')]:
+            with self.subTest(alias=alias):
+                self.assertIn(alias, tunes)
+                self.assertEqual(vars[alias], vars[target])
+
+    def test_riscv_profile_ccargs(self):
+        """
+        Check the -march and -mabi options of the profile tunes.
+        """
+        for profile in ['rva20u64', 'rva22u64', 'rva23u64']:
+            with self.subTest(profile=profile):
+                self.write_config(self._machine_config() + 'DEFAULTTUNE = "%s"\n' % profile)
+                ccargs = get_bb_var('TUNE_CCARGS').split()
+                self.assertIn('-mabi=lp64d', ccargs)
+                march = [a for a in ccargs if a.startswith('-march=')]
+                self.assertEqual(len(march), 1, ccargs)
+                exts = march[0][len('-march='):].split('_')
+                self.assertTrue(exts[0].startswith('rv64imafdc'), exts[0])
+                # Every multi-letter extension of the profile is passed on
+                for f in riscv_isa_to_tune(profile).split() + ['zifencei']:
+                    if len(f) > 1 and f not in ('rv', '64'):
+                        self.assertIn(f, exts)
+
+    def test_riscv_pkgarch_fallback(self):
+        """
+        Check that custom tunes which don't set RISCVPKGARCH:tune-<name> get
+        TUNE_RISCV_PKGARCH as their package arch, and that it's an error if
+        that is too long.
+        """
+        def config(tune, features):
+            return self._machine_config() + \
+                   'AVAILTUNES += "%s"\n' \
+                   'TUNE_FEATURES:tune-%s = "%s"\n' \
+                   'DEFAULTTUNE = "%s"\n' % (tune, tune, features, tune)
+
+        self.write_config(config('rv64imac-zicond', riscv_isa_to_tune('rv64imac_zicond')))
+        self.assertEqual(get_bb_var('TUNE_PKGARCH'), 'riscv64imac_zicond')
+
+        self.write_config(config('rva22-zicond', riscv_isa_to_tune('rva22u64') + ' zicond'))
+        result = bitbake('-e', ignore_status=True)
+        self.assertNotEqual(result.status, 0)
+        self.assertIn('Set RISCVPKGARCH:tune-rva22-zicond to a shorter name', result.output)
+
+    def test_riscv_unusual_tunes(self):
+        """
+        Define custom tunes with unusual extension combinations, as a BSP
+        might, and check each one builds: the sanity checks accept the
+        package arch, gcc and binutils accept the -march string, and the
+        package arch works in the build and sstate paths.
+        """
+        def profile(name, drop=None):
+            return ' '.join(f for f in riscv_isa_to_tune(name).split() if f != drop) + ' zifencei'
+        tunes = {
+            # no float (lp64 ABI), with bitmanip. Short enough to use the
+            # fallback package arch.
+            'rv64-nofloat-bitmanip': riscv_isa_to_tune('rv64imac_zicsr_zifencei_zba_zbb_zbs'),
+            # no profile, scalar extensions on top of gc
+            'rv64gc-scalar-extras': riscv_isa_to_tune('rv64gc_zicbom_zicboz_zicond_zfa_zfhmin'),
+            # profile plus vector crypto extensions
+            'rva20-vector-crypto': profile('rva20u64') + ' v zvbb zvkt',
+            # a profile missing one extension
+            'rva22-no-zkt': profile('rva22u64', 'zkt'),
+            # rva23u64 without the full vector extension
+            'rva23-no-v': profile('rva23u64', 'v'),
+        }
+
+        config = self._machine_config()
+        for tune, features in tunes.items():
+            config += 'AVAILTUNES += "%s"\n' % tune
+            config += 'TUNE_FEATURES:tune-%s = "%s"\n' % (tune, features)
+            # The rest are too long for the fallback, so name them as a BSP
+            # would have to
+            if tune != 'rv64-nofloat-bitmanip':
+                config += 'RISCVPKGARCH:tune-%s = "%s"\n' % (tune, tune.replace('-', '_'))
+            config += 'PACKAGE_EXTRA_ARCHS:tune-%s = "${RISCVPKGARCH}"\n' % tune
+
+        for tune in tunes:
+            with self.subTest(tune=tune):
+                self.write_config(config + 'DEFAULTTUNE = "%s"\n' % tune)
+                # small, and compiled with TUNE_CCARGS. It has no do_build, and
+                # populate_sysroot also writes an sstate object.
+                bitbake('libgcc-initial -c populate_sysroot')
-- 
2.56.0

