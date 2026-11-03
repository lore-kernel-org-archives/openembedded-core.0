Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13189.1793717961959715151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=HAL5nfmZ;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.50, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6aff2e5b322so997624a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793717960; x=1794322760; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HEc/rxfIjD3qyMSH4C9yHRsYtF1N3FxwrPcBAjASGM8=;
        b=HAL5nfmZpVVdGen8+IYwLmgueoH/szc/hYyVOiMPKq2pgO0/+R+sMQoJicn7BIDZid
         Nty7/i/OJNZTpRbMnha3P5vBmI1+tu3hWozYd2W5rX3cdRuHqSH61Swblw1v4zOM90SQ
         UAmtUlhk/dlhPYmicPM/PgF7e4ZEz25+tLQCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717960; x=1794322760;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEc/rxfIjD3qyMSH4C9yHRsYtF1N3FxwrPcBAjASGM8=;
        b=jGegnfWkHrvytv1H57PAp1VUDXiTEiMNmT63JRl9JHELSRxaB4XabrgCJTwo9TdTdN
         hrQ2mEPAXhG1KwGYEpr2/f00Fp+mE+cb2x4lODD+HNXAHmp6KTCecskRcweTd/gp/TPg
         /wsmjqf32b2okYS3VaUjAPlgTDnal9qkex03k9fGaH9usYb4AU8U43qkWya2ZwPeIi+1
         5KYnxOYqdJwrI1bK425pXJkrUfQuLdSakXDxDfdnOxB6rNVWNo2DXRS0waxLuh7P8iHh
         /TEGQbCM/snAjcbUobIeB7PbbZ6Ocsk6nHZa7EIJyiF5C99+BC4PYKE9jfm1SWKZvhqW
         2xPQ==
X-Gm-Message-State: APuU4Z9YPqqaxVU4SKuJXuWJbV3PGE8Q7e83ZKeSdq2qrEF3hCIyDtOe
	zuJwer8fYI0+hQSpIrGb7WGCLTskl6WbEg/a7rPXx9/mMgY5mWKYV4MI5VUgoOVnlKScM6tuU3Z
	FTGD3cUI=
X-Gm-Gg: AYBFou3IOycmJ6bilKbmyUnuaftOygETmcOg4jeQfMyIzyt3voW9pakhVbhZJZu8l/1
	soPok2u7CRx0kjgbNbZEc6ghqpoJRun1C+/UY1ezDbrqtDuWteFBL//AdebaliwRCqz6UNj2Vas
	UmnL/pVdrvtPWRrKbgCvnxEsYp8qI9SBQeNo97S+m/Q7k6dziZrzZw/rkGFGVeh3PdjMWo8FKkh
	az8vYhwIMBhiNZOM6HF9y+RPV6vPJgqE4TWDTz8SGzppWY4jf5mSNcFbTndq881axeYAsBKtD5i
	k8ubbCRZk28zwIKk39v16VQi9Wir5w+ZUqddqsVc0rLk6JRsUlxJIZgxbCDbeYeA3ZKS1wtmAXr
	t9/r0HGO1/1wfHakmDxPasgcb7/qSw9BJgFMoXjiFfsg4/yifGN3qJuJ9BErf/ApSw4W2ws3s/K
	Chu7MdWofLQOVoX7IiehjCs5NC9oqgxIBeSXLJBmOxtHTvAoDBnO1EU7UPbgzmKPkGpbp81vpTC
	gHGOvMk9tJqTxLqZrtTY6T7idiSkayR7LyKi3LHogPUWw5JHFpmmXveBYd9OvPOEMD4B3ZMhMMm
	U1XlelqAFND/BCbPaLo2lJGL1PFPz+pWKTsX58nEM/Buu2NNjH1PRih0+xL5osdRkqBJgnXYf5X
	IVNYiZqfRNVP0GfZscqqsqQIUHhiD8IuWOY8S7q5nZutTLzHLnzZ9WqQfcSr326mUZY9OtX2fW4
	PZp/t/w6rMS1pvNQQYGrBSewZa4nUxWqAkQE36
X-Received: by 2002:a17:906:f806:b0:c46:ae89:cd3c with SMTP id a640c23a62f3a-c4ca7936928mr1142139066b.1.1793717959714;
        Tue, 03 Nov 2026 06:59:19 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.amarulasolutions.com (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3dcd8sm96379266b.54.2026.11.03.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:59:19 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v11 3/4] dnf: Upgrade to 5.4.6.0
Date: Tue,  3 Nov 2026 15:59:09 +0100
Message-ID: <20261103145914.1229467-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103145914.1229467-1-adam.duskett@amarulasolutions.com>
References: <20261103145914.1229467-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 14:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249286
Content-Type: text/plain; charset="utf-8"

Completely rewritten in C++, there are several changes needed
to facilitate moving from DNF4 to DNF5. Below are some significant
items to note:

    - Added a negative lookahead filter for the following warning if
      RPM_SIGN_PACKAGES != '1': "Warning: skipped OpenPGP checks"
      This warning is hard-coded and piped to stderr if gpg checks
      are disabled. However, most users do not sign their RPM packages
      and use dnf to simply construct the rootfs.

    - The "-v/--verbose" cli option is removed. As such, remove the argument
    everywhere it was called.[1]

    - the rpmverbosity cli option is replaced with --setopt=rpmverbosity

    - Change gpgcheck to pkg_gpgcheck as this is what the documentation
    recommends.[2]

    - --nogpgcheck is now --no-gpgchecks

    - --setopt=protect_running_kernel=False has to be set or else every dnf
    transaction complains that /boot/vmlinuz-${kernel_version} does not
    exist in /var/log/dnf5.log. There is an open issue on github[3] to enable
    the currently not-yet implemented `autocheck_running_kernel option`, but
    it has been open for quite some time and the protect_running_kernel
    option supresses the message.

    - Move --skip-broken to after the install argument as the global
      --skip-broken argument is removed.

    - /var/cache/dnf is replaced with /var/cache/libdnf5

    - Add `features += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'`
          `features += 'PACKAGECONFIG:append:pn-librepo = " sequoia"\n'`
      to test_testimage_dnf as librepo currently does not work
      with gpgme.

    - Change `if line.startswith("Error in POSTIN scriptlet in rpm package"):`
      to `if "Error in %post scriptlet:" in line:` as dnf prints `>>>`
      charachters and the error string has changed.

While DNF5 has many config options, unfortunately, the majority
of them depends on sdbus-c++, which is not included in OE-core.
However, the package is included in meta-openembedded, so it's
best to include the PACKAGECONFIG options in the recipe and
leave them off by default.

1: https://github.com/rpm-software-management/dnf5/issues/464
2: https://dnf5.readthedocs.io/en/latest/dnf5.conf.5.html
3: https://github.com/rpm-software-management/dnf5/issues/1255

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v10 -> v11: added 0006-rename-stdout-stderr-members.patch to fix musl builds

 .../lib/oeqa/runtime/cases/dnf_runtime.py     |   6 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |  23 +-
 meta/lib/oe/package_manager/rpm/rootfs.py     |   3 +
 meta/lib/oeqa/runtime/cases/dnf.py            |  16 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   5 +
 ...tly-install-tmpfiles.d-configuration.patch |  18 --
 ...ode-etc-and-systemd-unit-directories.patch |  26 ---
 ...-hardcode-the-systemd-unit-directory.patch |  29 +++
 .../0001-dnf-write-the-log-lock-to-root.patch |  29 ---
 .../0001-lock.py-fix-Exception-handling.patch |  62 ------
 ...et-python-path-for-completion_helper.patch |  21 --
 .../dnf/0002-cmake-set-CMP0190-to-OLD.patch   |  51 +++++
 ...0003-Do-not-hardcode-system_cachedir.patch |  36 +++
 ...004-add-support-for-gcc-12-and-below.patch | 135 ++++++++++++
 ...Do-not-prepend-installroot-to-logdir.patch |  28 ---
 ...rm-arch-mapping-issues-for-qemuarmv5.patch |  59 +++++
 .../0006-rename-stdout-stderr-members.patch   | 205 ++++++++++++++++++
 ...PYTHON_INSTALL_DIR-by-running-python.patch |  24 --
 .../0030-Run-python-scripts-using-env.patch   |  34 ---
 meta/recipes-devtools/dnf/dnf_4.24.0.bb       |  96 --------
 meta/recipes-devtools/dnf/dnf_5.4.6.0.bb      | 181 ++++++++++++++++
 22 files changed, 730 insertions(+), 359 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-directory.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0002-cmake-set-CMP0190-to-OLD.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0003-Do-not-hardcode-system_cachedir.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0004-add-support-for-gcc-12-and-below.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0006-rename-stdout-stderr-members.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf_4.24.0.bb
 create mode 100644 meta/recipes-devtools/dnf/dnf_5.4.6.0.bb

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index d2f0f88f7d..27158b5193 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -41,11 +41,11 @@ class DnfSelftest(DnfTest):
 
         import re
         # Use '-y' for non-interactive mode: automatically import the feed signing key
-        output_makecache = self.dnf('-vy makecache')
+        output_makecache = self.dnf('-y makecache')
         self.assertTrue(re.match(r".*Failed to synchronize cache", output_makecache, re.DOTALL) is None, msg = "dnf makecache failed to synchronize repo: %s" %(output_makecache))
         self.assertTrue(re.match(r".*Metadata cache created", output_makecache, re.DOTALL) is not None, msg = "dnf makecache failed: %s" %(output_makecache))
 
-        output_repoinfo = self.dnf('-v repoinfo')
-        matchobj = re.match(r".*Repo-pkgs\s*:\s*(?P<n_pkgs>[0-9]+)", output_repoinfo, re.DOTALL)
+        output_repoinfo = self.dnf('repoinfo')
+        matchobj = re.match(r".*Total packages\s*:\s*(?P<n_pkgs>[0-9]+)", output_repoinfo, re.DOTALL)
         self.assertTrue(matchobj is not None, msg = "Could not find the amount of packages in dnf repoinfo output: %s" %(output_repoinfo))
         self.assertTrue(int(matchobj.group('n_pkgs')) > 0, msg = "Amount of remote packages is not more than zero: %s\n" %(output_repoinfo))
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9c7ab70bd0..4ad835fca4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -157,7 +157,7 @@ RECIPE_MAINTAINER:pn-diffutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-distcc-config = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dmidecode = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-dnf = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-dnf = "Adam Duskett <adam.duskett@amarulasolutions.com>"
 RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
 RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index ccb4316bd0..6e6fd3c5ab 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -163,7 +163,7 @@ class RpmPM(PackageManager):
             gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
 
         if self.d.getVar('RPM_SIGN_PACKAGES') != '1':
-            gpg_opts += 'gpgcheck=0\n'
+            gpg_opts += 'pkg_gpgcheck=0\n'
 
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
         remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
@@ -200,11 +200,11 @@ class RpmPM(PackageManager):
         package_exclude = self.d.getVar('PACKAGE_EXCLUDE')
         exclude_pkgs = (bad_recommendations.split() if bad_recommendations else []) + (package_exclude.split() if package_exclude else [])
 
-        output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
-                         (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
+        output = self._invoke_dnf((["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
                          (["--setopt=install_weak_deps=False"] if (hard_depends_only or self.d.getVar('NO_RECOMMENDATIONS') == "1") else []) +
-                         (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
+                         (["--no-gpgchecks"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=pkg_gpgcheck=True"]) +
                          ["install"] +
+                         (["--skip-broken"] if attempt_only else []) +
                          pkgs)
 
         failed_scriptlets_pkgnames = collections.OrderedDict()
@@ -212,7 +212,7 @@ class RpmPM(PackageManager):
             if line.startswith("Error: Systemctl"):
                 bb.error(line)
 
-            if line.startswith("Error in POSTIN scriptlet in rpm package"):
+            if "Error in %post scriptlet:" in line:
                 failed_scriptlets_pkgnames[line.split()[-1]] = True
 
         if len(failed_scriptlets_pkgnames) > 0:
@@ -313,10 +313,15 @@ class RpmPM(PackageManager):
     def _invoke_dnf(self, dnf_args, fatal = True, print_output = True ):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
+        # Set XDG_CACHE_HOME to avoid dnf attempting to install oe-repo system cache to a /tmp/ directory on the host.
+        os.environ['XDG_CACHE_HOME'] = oe.path.join(os.path.join(self.target_rootfs, "var/cache/libdnf5"))
+
         dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
-        standard_dnf_args = ["-v", "--rpmverbosity=info", "-y",
-                             "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
+        standard_dnf_args = ["-y",
+                             "--config", os.path.join(self.d.getVar('STAGING_DIR_NATIVE'), "etc/dnf/dnf.conf"),
+                             "--setopt=rpmverbosity=info",
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
+                             "--setopt=pluginconfpath=%s" %(os.path.join(self.d.getVar('STAGING_DIR_NATIVE'), "etc/dnf/dnf.conf")),
                              "--installroot=%s" % (self.target_rootfs),
                              "--setopt=logdir=%s" % (self.d.getVar('T')),
                              "--setopt=optional_metadata_types=filelists",
@@ -335,9 +340,9 @@ class RpmPM(PackageManager):
                 e_output = e.output.decode("utf-8")
                 # RPM 6 fails the entire transaction when a %post scriptlet
                 # fails, causing dnf to exit non-zero. Let install_pkgs handle
-                # scriptlet failures via its existing "Error in POSTIN scriptlet"
+                # scriptlet failures via its existing "Error in %post scriptlet:"
                 # scanning rather than treating this as a fatal dnf invocation error.
-                if "Error in POSTIN scriptlet in rpm package" in e_output:
+                if "Error in %post scriptlet:" in e_output:
                     bb.note(e_output)
                     return e_output
                 extra_info = ""
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index 698685c067..8d54b5ab48 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -17,6 +17,9 @@ class PkgRootfs(Rootfs):
                                r'|exit 1\b|ERROR: |Error: |Error |ERROR '\
                                r'|Failed |Failed: |Failed$|Failed\(\d+\):)'
 
+        if self.d.getVar('RPM_SIGN_PACKAGES') != '1':
+            self.warn_check_regex = r'^(?!.*Warning: skipped OpenPGP checks)(warn|Warn|WARNING:)'
+
         self.manifest = PkgManifest(d, manifest_dir)
 
         self.pm = RpmPM(d,
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 3ccb18ce83..1becc8d8a0 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -17,7 +17,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 class DnfTest(OERuntimeTestCase):
 
     def dnf(self, command, expected = 0):
-        command = 'dnf %s' % command
+        command = 'dnf --setopt=protect_running_kernel=False %s' % command
         status, output = self.target.run(command, 1500)
         message = os.linesep.join([command, output])
         self.assertEqual(status, expected, message)
@@ -48,7 +48,7 @@ class DnfBasicTest(DnfTest):
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
     def test_dnf_history(self):
-        self.dnf('history')
+        self.dnf('history list')
 
 class DnfRepoTest(DnfTest):
 
@@ -68,7 +68,7 @@ class DnfRepoTest(DnfTest):
         deploy_url = 'http://%s:%s/' %(self.target.server_ip, self.repo_server.port)
         cmdlinerepoopts = ["--repofrompath=oe-testimage-repo-%s,%s%s" %(arch, deploy_url, arch) for arch in pkgarchs]
 
-        output = self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
+        output = self.dnf(" ".join(cmdlinerepoopts) + " --no-gpgchecks " + command)
         return output
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
@@ -96,7 +96,7 @@ class DnfRepoTest(DnfTest):
     def test_dnf_install_from_disk(self):
         self.dnf_with_repo('remove -y dnf-test-dep')
         self.dnf_with_repo('install -y --downloadonly dnf-test-dep')
-        status, output = self.target.run('find /var/cache/dnf -name dnf-test-dep*rpm')
+        status, output = self.target.run('find /var/cache/libdnf5 -name dnf-test-dep*rpm')
         self.assertEqual(status, 0, output)
         self.dnf_with_repo('install -y %s' % output)
 
@@ -134,8 +134,8 @@ class DnfRepoTest(DnfTest):
         self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
         self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
         self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
-        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox' % rootpath)
-        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
+        self.dnf_with_repo('install --installroot=%s -y busybox' % rootpath)
+        status, output = self.target.run('test -e %s/var/cache/libdnf5' % rootpath, 1500)
         self.assertEqual(0, status, output)
         status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
         self.assertEqual(0, status, output)
@@ -158,8 +158,8 @@ class DnfRepoTest(DnfTest):
         self.target.run('cp -r /etc/dnf %s/etc' % rootpath)
         self.target.run('cp /bin/busybox %s/bin/sh' % rootpath)
         self.target.run('mount -o bind /dev %s/dev/' % rootpath)
-        self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox' % rootpath)
-        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath)
+        self.dnf_with_repo('install --installroot=%s -y busybox' % rootpath)
+        status, output = self.target.run('test -e %s/var/cache/libdnf5' % rootpath)
         self.assertEqual(0, status, output)
         status, output = self.target.run('test -e %s/bin/busybox' % rootpath)
         self.assertEqual(0, status, output)
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index b82c7c7294..658253d296 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -209,6 +209,11 @@ QB_FSINFO = "tar.zst:rootfs-dbg"
         features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
         features += 'PACKAGE_CLASSES = "package_rpm"\n'
 
+        # librepo and rpm require sequoia
+        # https://github.com/rpm-software-management/dnf5/issues/2539
+        features += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
+        features += 'PACKAGECONFIG:append:pn-librepo = " sequoia"\n'
+
         bitbake('gnupg-native -c addto_recipe_sysroot')
 
         # Enable package feed signing
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
deleted file mode 100644
index fd942228b9..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 26 Jan 2017 16:36:20 +0200
-Subject: [PATCH] Corretly install tmpfiles.d configuration
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- etc/tmpfiles.d/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/etc/tmpfiles.d/CMakeLists.txt b/etc/tmpfiles.d/CMakeLists.txt
-index f69c773e..3eb6d0e8 100644
---- a/etc/tmpfiles.d/CMakeLists.txt
-+++ b/etc/tmpfiles.d/CMakeLists.txt
-@@ -1 +1 @@
--INSTALL (FILES dnf.conf DESTINATION /usr/lib/tmpfiles.d/)
-+INSTALL (FILES dnf.conf DESTINATION ${SYSCONFDIR}/tmpfiles.d/)
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
deleted file mode 100644
index 9d978cdc5f..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c2b2b91b58f4531d4baf0a01f5d868d71e577a84 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 26 Jan 2017 16:25:47 +0200
-Subject: [PATCH] Do not hardcode /etc and systemd unit directories
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e71e9517..8fcb2069 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3,8 +3,8 @@ PROJECT (dnf NONE)
- 
- INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
- 
--SET( SYSCONFDIR /etc)
--SET( SYSTEMD_DIR /usr/lib/systemd/system)
-+SET( SYSCONFDIR ${CMAKE_INSTALL_SYSCONFDIR})
-+SET( SYSTEMD_DIR $ENV{systemd_system_unitdir})
- 
- IF (NOT PYTHON_DESIRED)
-     FIND_PACKAGE (PythonInterp REQUIRED)
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-directory.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-directory.patch
new file mode 100644
index 0000000000..e79cab1b44
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-directory.patch
@@ -0,0 +1,29 @@
+From c07c29e50327a132f330287cd4e0ff428d140c96 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 15 Oct 2026 11:54:09 +0200
+Subject: [PATCH] Do not hardcode the systemd unit directory
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Rebased for 5.4.6.0
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 50ec5f7..2583772 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,7 @@ project(dnf5 LANGUAGES CXX C VERSION ${VERSION_PRIME}.${VERSION_MAJOR}.${VERSION
+ cmake_policy(VERSION ${CMAKE_VERSION})
+ 
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
+-set(SYSTEMD_DIR "/usr/lib/systemd/system" CACHE PATH "Directory for systemd unit files")
++set(SYSTEMD_DIR $ENV{systemd_system_unitdir} CACHE PATH "Directory for systemd unit files")
+ set(TMPFILES_DIR "/usr/lib/tmpfiles.d" CACHE PATH "Directory for systemd tmpfiles.d files")
+ 
+ message("Building ${PROJECT_NAME} version ${PROJECT_VERSION}")
+-- 
+2.56.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
deleted file mode 100644
index 18f9a30949..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 28 Apr 2020 15:55:00 +0200
-Subject: [PATCH] dnf: write the log lock to root
-
-Writing it to /var/log appears to be racing with installation
-of base-files, and if lock is created first, base-files
-will refuse to install (due to the target directory
-already existing, and base-files creating it as a symlink).
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/logging.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf/logging.py b/dnf/logging.py
-index ef0b25f3..94610af6 100644
---- a/dnf/logging.py
-+++ b/dnf/logging.py
-@@ -118,7 +118,7 @@ class MultiprocessRotatingFileHandler(logging.handlers.RotatingFileHandler):
-     def __init__(self, filename, mode='a', maxBytes=0, backupCount=0, encoding=None, delay=False):
-         super(MultiprocessRotatingFileHandler, self).__init__(
-             filename, mode, maxBytes, backupCount, encoding, delay)
--        self.rotate_lock = dnf.lock.build_log_lock("/var/log/", True)
-+        self.rotate_lock = dnf.lock.build_log_lock("/", True)
- 
-     def emit(self, record):
-         while True:
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
deleted file mode 100644
index 6bffe9af0a..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 13 Mar 2024 11:22:05 +0800
-Subject: [PATCH] lock.py: fix Exception handling
-
-Before, when logdir is not writable, _try_lock will raise an Exception
-like "Permission denied: '/var/log/log_lock.pid'", and in this case,
-_unlock_thread will not be called and the variable count will not be
-handled, it maybe cause log_lock.pid not be deleted in case like [1].
-
-For [1], it is an cross compile case, when dnf install some packages to
-rootfs, seems like some threads don't do chroot like work, some threads
-do chroot like work. so for the threads don't do chroot, "Permission denied"
-Exception happend, for the threads that do chroot, log_lock.pid will be
-created under installroot/var/log/log_lock.pid, since variable count not
-handled correct before, log_lock.pid may not be deleted correctly.
-
-So fixed like this, if _try_lock raise Exception, _unlock_thread first,
-then raise the Exception.
-
-[1] https://github.com/rpm-software-management/dnf/issues/1963
-
-Upstream-Status: Submitted [ https://github.com/rpm-software-management/dnf/pull/2065 ]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- dnf/lock.py | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/dnf/lock.py b/dnf/lock.py
-index 6817aac9..5718062a 100644
---- a/dnf/lock.py
-+++ b/dnf/lock.py
-@@ -128,7 +128,11 @@ class ProcessLock(object):
-         self._lock_thread()
-         prev_pid = -1
-         my_pid = os.getpid()
--        pid = self._try_lock(my_pid)
-+        try:
-+            pid = self._try_lock(my_pid)
-+        except Exception:
-+            self._unlock_thread()
-+            raise
-         while pid != my_pid:
-             if pid != -1:
-                 if not self.blocking:
-@@ -140,7 +144,11 @@ class ProcessLock(object):
-                     logger.info(msg)
-                     prev_pid = pid
-             time.sleep(1)
--            pid = self._try_lock(my_pid)
-+            try:
-+                pid = self._try_lock(my_pid)
-+            except Exception:
-+                self._unlock_thread()
-+                raise
- 
-     def __exit__(self, *exc_args):
-         if self.count == 1:
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
deleted file mode 100644
index fcd970a7ae..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Wed, 11 Mar 2020 22:10:02 +0000
-Subject: [PATCH] set python path for completion_helper
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
----
- dnf/cli/completion_helper.py.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf/cli/completion_helper.py.in b/dnf/cli/completion_helper.py.in
-index 0da0f2a2..9330d15b 100644
---- a/dnf/cli/completion_helper.py.in
-+++ b/dnf/cli/completion_helper.py.in
-@@ -1,4 +1,4 @@
--#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python3
- #
- # This file is part of dnf.
- #
diff --git a/meta/recipes-devtools/dnf/dnf/0002-cmake-set-CMP0190-to-OLD.patch b/meta/recipes-devtools/dnf/dnf/0002-cmake-set-CMP0190-to-OLD.patch
new file mode 100644
index 0000000000..1e8ccbf889
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0002-cmake-set-CMP0190-to-OLD.patch
@@ -0,0 +1,51 @@
+From 86755bbc9a6596f58f0437823de0ef8a6209e4ab Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 15 Oct 2026 11:54:37 +0200
+Subject: [PATCH] cmake: set CMP0190 to OLD
+
+Starting with CMake 4.1, cross-compiling python3 requires setting
+-DCMAKE_CROSSCOMPILING_EMULATOR which can be done by inheriting
+cmake-qemu. However, this leads to the following error:
+Interpreter: Cannot run the interpreter ".../python3-native/python3"
+
+This is due to the target sysroot python3 binary not being installed
+because it can't be executed.
+
+Set CMP0190 to old to force the old behavior.
+
+https://cmake.org/cmake/help/latest/policy/CMP0190.html
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ bindings/python3/CMakeLists.txt                      | 1 +
+ libdnf5-plugins/python_plugins_loader/CMakeLists.txt | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/bindings/python3/CMakeLists.txt b/bindings/python3/CMakeLists.txt
+index cb93269..aa961d0 100644
+--- a/bindings/python3/CMakeLists.txt
++++ b/bindings/python3/CMakeLists.txt
+@@ -6,6 +6,7 @@ endif()
+ message("Building bindings for python3")
+ 
+ 
++cmake_policy(SET CMP0190 OLD)
+ find_package(Python3 REQUIRED COMPONENTS Interpreter Development)
+ include_directories(${Python3_INCLUDE_DIRS})
+ 
+diff --git a/libdnf5-plugins/python_plugins_loader/CMakeLists.txt b/libdnf5-plugins/python_plugins_loader/CMakeLists.txt
+index 9ee2ffb..b8f908a 100644
+--- a/libdnf5-plugins/python_plugins_loader/CMakeLists.txt
++++ b/libdnf5-plugins/python_plugins_loader/CMakeLists.txt
+@@ -6,6 +6,7 @@ if(NOT WITH_PYTHON_PLUGINS_LOADER)
+     return()
+ endif()
+ 
++cmake_policy(SET CMP0190 OLD)
+ find_package(Python3 REQUIRED COMPONENTS Interpreter Development)
+ find_package(SWIG REQUIRED)
+ include_directories(${Python3_INCLUDE_DIRS})
+-- 
+2.56.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0003-Do-not-hardcode-system_cachedir.patch b/meta/recipes-devtools/dnf/dnf/0003-Do-not-hardcode-system_cachedir.patch
new file mode 100644
index 0000000000..0055b2f72e
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0003-Do-not-hardcode-system_cachedir.patch
@@ -0,0 +1,36 @@
+From 921f6357dcba131d11366ac11249e1a9b2649cd8 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 15 Oct 2026 11:55:10 +0200
+Subject: [PATCH] Do not hardcode system_cachedir
+
+Because dnf is ran in a fakeroot environment, the UID of the
+"user" is 0, and the hardcoded paths to the host system are
+attempted, leading to the following error:
+
+[log_check] DEBUG: Failed to expire repository cache in path "/var/cache/libdnf5/
+
+Remove the check for geteuid() == 0 and rely only on the
+user cache dir.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ libdnf5/conf/config_main.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libdnf5/conf/config_main.cpp b/libdnf5/conf/config_main.cpp
+index 2d808ec..a169af4 100644
+--- a/libdnf5/conf/config_main.cpp
++++ b/libdnf5/conf/config_main.cpp
+@@ -244,7 +244,7 @@ class ConfigMain::Impl {
+     // Repo main config
+ 
+     OptionNumber<std::uint32_t> retries{10};
+-    OptionPath cachedir{geteuid() == 0 ? SYSTEM_CACHEDIR : libdnf5::xdg::get_user_cache_dir() / "libdnf5"};
++    OptionPath cachedir{libdnf5::xdg::get_user_cache_dir() / "libdnf5"};
+     OptionBool fastestmirror{false};
+     OptionStringAppendList excludeenvs{std::vector<std::string>{}};
+     OptionStringAppendList excludegroups{std::vector<std::string>{}};
+-- 
+2.56.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0004-add-support-for-gcc-12-and-below.patch b/meta/recipes-devtools/dnf/dnf/0004-add-support-for-gcc-12-and-below.patch
new file mode 100644
index 0000000000..1ef49e307a
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0004-add-support-for-gcc-12-and-below.patch
@@ -0,0 +1,135 @@
+From 2305a8fcd6aec81676c684cb06b9d4a676af3bd3 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 15 Oct 2026 11:58:24 +0200
+Subject: [PATCH] add support for gcc 12 and below
+
+    - Add missing headers for gcc <= 12
+    - Add support for libfmt if the format header is not found
+    - Add an ifdef to support compilers without std::chrono::parse
+
+Commit 1e8ced2293ed62bc7774ef5a2d1aeb48e29e2236 introduced using
+std::chrono::parse which wasn't available until gcc 14.1. This change causes
+build failures when cross-compiling on older, but still supported platforms
+like Debian 12.
+
+Note: This patch should be removed once the minimum GCC version
+for Yocto is >= 14.1.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ libdnf5-cli/session.cpp                 | 12 ++++++++++++
+ libdnf5/CMakeLists.txt                  |  9 +++++++++
+ libdnf5/base/goal_elements.cpp          |  2 +-
+ libdnf5/conf/config_main.cpp            |  8 ++++++++
+ libdnf5/logger/memory_buffer_logger.cpp |  1 +
+ 5 files changed, 31 insertions(+), 1 deletion(-)
+
+diff --git a/libdnf5-cli/session.cpp b/libdnf5-cli/session.cpp
+index b2fa196..c5fc02f 100644
+--- a/libdnf5-cli/session.cpp
++++ b/libdnf5-cli/session.cpp
+@@ -22,6 +22,7 @@
+ #include <libdnf5/utils/bgettext/bgettext-mark-domain.h>
+ 
+ #include <chrono>
++#include <iomanip>
+ #include <limits>
+ #include <sstream>
+ #include <utility>
+@@ -254,7 +255,18 @@ DateOption::DateOption(
+             new libdnf5::OptionNumber<int64_t>(0, [](const std::string & value) {
+                 std::istringstream ss(value);
+                 std::chrono::sys_seconds tp;
++#if defined(__cpp_lib_chrono) && __cpp_lib_chrono >= 201907L
+                 ss >> std::chrono::parse("%F", tp);
++#else
++                std::tm tm{};
++                ss >> std::noskipws >> std::get_time(&tm, "%Y-%m-%d");
++                const auto ymd = std::chrono::year{tm.tm_year + 1900} / (tm.tm_mon + 1) / tm.tm_mday;
++                if (ymd.ok()) {
++                    tp = std::chrono::sys_days{ymd};
++                } else {
++                    ss.setstate(std::ios_base::failbit);
++                }
++#endif
+                 if (ss.fail()) {
+                     throw libdnf5::cli::ArgumentParserError(
+                         M_("Invalid date passed: \"{}\". Dates in \"YYYY-MM-DD\" format are expected"), value);
+diff --git a/libdnf5/CMakeLists.txt b/libdnf5/CMakeLists.txt
+index 359e39e..315a83b 100644
+--- a/libdnf5/CMakeLists.txt
++++ b/libdnf5/CMakeLists.txt
+@@ -11,6 +11,9 @@ if (NOT WITH_MODULEMD)
+     list(REMOVE_ITEM LIBDNF5_SOURCES ${LIBDNF5_SOURCES_MODULES})
+ endif()
+ 
++include(CheckIncludeFileCXX)
++check_include_file_cxx("format" CXX_FORMAT_SUPPORT)
++
+ # gather all pkg-config requires and write them to a .pc file later
+ list(APPEND LIBDNF5_PC_REQUIRES)
+ list(APPEND LIBDNF5_PC_REQUIRES_PRIVATE)
+@@ -49,6 +52,12 @@ set_target_properties(libdnf5 PROPERTIES SOVERSION ${DNF_SO_VERSION})
+ # required to have dlopen symbol
+ target_link_libraries(libdnf5 PUBLIC ${CMAKE_DL_LIBS})
+ 
++if (NOT CXX_FORMAT_SUPPORT)
++    find_package(fmt REQUIRED)
++    target_link_libraries(libdnf5_obj PRIVATE fmt::fmt)
++    target_compile_definitions(libdnf5_obj PUBLIC USE_FMTLIB)
++endif()
++
+ # required by clang
+ target_link_libraries(libdnf5 PUBLIC stdc++)
+ 
+diff --git a/libdnf5/base/goal_elements.cpp b/libdnf5/base/goal_elements.cpp
+index e5d4a4b..757a6f2 100644
+--- a/libdnf5/base/goal_elements.cpp
++++ b/libdnf5/base/goal_elements.cpp
+@@ -17,7 +17,7 @@
+ // You should have received a copy of the GNU Lesser General Public License
+ // along with libdnf.  If not, see <https://www.gnu.org/licenses/>.
+ 
+-
++#include <optional>
+ #include "libdnf5/base/goal_elements.hpp"
+ 
+ #include "libdnf5/common/exception.hpp"
+diff --git a/libdnf5/conf/config_main.cpp b/libdnf5/conf/config_main.cpp
+index a169af4..8f0c8fe 100644
+--- a/libdnf5/conf/config_main.cpp
++++ b/libdnf5/conf/config_main.cpp
+@@ -37,9 +37,17 @@
+ #include <algorithm>
+ #include <array>
+ #include <cctype>
++#include <optional>
+ #include <sstream>
+ #include <utility>
+ 
++#ifdef USE_FMTLIB
++#include <fmt/core.h>
++namespace std {
++    using fmt::format;
++}
++#endif
++
+ namespace libdnf5 {
+ 
+ /// @brief Converts a friendly bandwidth option to bytes
+diff --git a/libdnf5/logger/memory_buffer_logger.cpp b/libdnf5/logger/memory_buffer_logger.cpp
+index 85bf707..89307e9 100644
+--- a/libdnf5/logger/memory_buffer_logger.cpp
++++ b/libdnf5/logger/memory_buffer_logger.cpp
+@@ -20,6 +20,7 @@
+ #include "libdnf5/logger/memory_buffer_logger.hpp"
+ 
+ #include <mutex>
++#include <vector>
+ 
+ namespace libdnf5 {
+ 
+-- 
+2.56.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
deleted file mode 100644
index a1c58d6563..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0e7fc4a8523aad616493e6ad33c509e1e530d852 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 11 Jan 2017 15:10:13 +0200
-Subject: [PATCH] Do not prepend installroot to logdir.
-
-This would otherwise write the logs into rootfs/var/log
-(whereas we want them in $T),
-and will break installation of base-files rpm.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- dnf/cli/cli.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d3844df3..ac080f79 100644
---- a/dnf/cli/cli.py
-+++ b/dnf/cli/cli.py
-@@ -954,7 +954,7 @@ class Cli(object):
-             logger.warning(_("Unable to detect release version (use '--releasever' to specify "
-                              "release version)"))
- 
--        for opt in ('cachedir', 'logdir', 'persistdir'):
-+        for opt in ('cachedir', 'persistdir'):
-             conf.prepend_installroot(opt)
- 
-         self.base._logging._setup_from_dnf_conf(conf)
diff --git a/meta/recipes-devtools/dnf/dnf/0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch b/meta/recipes-devtools/dnf/dnf/0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch
new file mode 100644
index 0000000000..4fed5ff2a1
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch
@@ -0,0 +1,59 @@
+From 8580e30c9692548d7e3da88e03c08d985402fae2 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 15 Oct 2026 11:58:49 +0200
+Subject: [PATCH] libdnf: fix arm arch mapping issues for qemuarmv5
+
+We change the way rpm architectures work, we make the machine name the default
+machine specific package architecture.
+
+This arm mapping code can work or in the case of qemuarmv5, it doesn't as it
+creates armv5hl which doesn't exist and causes errrors. We can simply remove
+it, we don't need it.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Rebased for 5.4.6.0
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ libdnf5/utils/system.cpp | 24 ------------------------
+ 1 file changed, 24 deletions(-)
+
+diff --git a/libdnf5/utils/system.cpp b/libdnf5/utils/system.cpp
+index ecdc57e..35d8801 100644
+--- a/libdnf5/utils/system.cpp
++++ b/libdnf5/utils/system.cpp
+@@ -52,30 +52,6 @@ std::string detect_arch() {
+         throw RuntimeError(M_("Failed to execute uname()"));
+     }
+ 
+-    if (!strncmp(un.machine, "armv", 4)) {
+-        /* un.machine is armvXE, where X is version number and E is
+-         * endianness (b or l); we need to add modifiers such as
+-         * h (hardfloat), n (neon). Neon is a requirement of armv8 so
+-         * as far as rpm is concerned armv8l is the equivalent of armv7hnl
+-         * (or 7hnb) so we don't explicitly add 'n' for 8+ as it's expected. */
+-        char endian = un.machine[strlen(un.machine) - 1];
+-        char * modifier = un.machine + 5;
+-        while (isdigit(*modifier)) /* keep armv7, armv8, armv9, armv10, armv100, ... */
+-            modifier++;
+-        if (getauxval(AT_HWCAP) & HWCAP_ARM_VFP)
+-            *modifier++ = 'h';
+-        if ((atoi(un.machine + 4) == 7) && (getauxval(AT_HWCAP) & HWCAP_ARM_NEON))
+-            *modifier++ = 'n';
+-        *modifier++ = endian;
+-        *modifier = 0;
+-    }
+-#ifdef __MIPSEL__
+-    // support for little endian MIPS
+-    if (!strcmp(un.machine, "mips"))
+-        strcpy(un.machine, "mipsel");
+-    else if (!strcmp(un.machine, "mips64"))
+-        strcpy(un.machine, "mips64el");
+-#endif
+     return un.machine;
+ }
+ 
+-- 
+2.56.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0006-rename-stdout-stderr-members.patch b/meta/recipes-devtools/dnf/dnf/0006-rename-stdout-stderr-members.patch
new file mode 100644
index 0000000000..68d1f33df3
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0006-rename-stdout-stderr-members.patch
@@ -0,0 +1,205 @@
+From 42a4a73832913ce018cdc0147805ae324abb47a0 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Tue, 3 Nov 2026 12:33:12 +0100
+Subject: [PATCH] libdnf5: subprocess: rename stdout/stderr members of
+ CompletedProcess
+
+The C standard allows stdin, stdout and stderr to be defined as macros, which MUSL does:
+```
+  #define stdout (stdout)
+  #define stderr (stderr)
+```
+
+This breaks the build when cross-compiling on systems that use MUSL instead
+of glibc with the following error:
+  libdnf5/utils/bootc.cpp:44:74: error: expected unqualified-id before '(' token
+
+Rename the members to stdout_data and stderr_data to fix building against
+musl.
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf5/pull/3024]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ libdnf5/utils/bootc.cpp                | 11 +++---
+ libdnf5/utils/subprocess.cpp           |  4 +--
+ libdnf5/utils/subprocess.hpp           |  4 +--
+ test/libdnf5/utils/test_subprocess.cpp | 50 +++++++++++++-------------
+ 4 files changed, 36 insertions(+), 33 deletions(-)
+
+diff --git a/libdnf5/utils/bootc.cpp b/libdnf5/utils/bootc.cpp
+index 0027e02887..305114f30b 100644
+--- a/libdnf5/utils/bootc.cpp
++++ b/libdnf5/utils/bootc.cpp
+@@ -41,7 +41,8 @@ std::unique_ptr<json_object, decltype(&json_object_put)> get_bootc_status() {
+     // Check whether command failed (non-zero exit code)
+     if (result.returncode != 0) {
+         // Command ran but failed; show stderr to user
+-        std::string stderr_content(reinterpret_cast<const char *>(result.stderr.data()), result.stderr.size());
++        std::string stderr_content(
++            reinterpret_cast<const char *>(result.stderr_data.data()), result.stderr_data.size());
+         if (!stderr_content.empty()) {
+             throw libdnf5::RuntimeError(M_("Error checking bootc status: {}"), stderr_content);
+         } else {
+@@ -50,7 +51,7 @@ std::unique_ptr<json_object, decltype(&json_object_put)> get_bootc_status() {
+         }
+     }
+ 
+-    std::string stdout_content(reinterpret_cast<const char *>(result.stdout.data()), result.stdout.size());
++    std::string stdout_content(reinterpret_cast<const char *>(result.stdout_data.data()), result.stdout_data.size());
+     std::unique_ptr<json_object, decltype(&json_object_put)> root(
+         json_tokener_parse(stdout_content.c_str()), json_object_put);
+ 
+@@ -120,7 +121,8 @@ void make_usr_writable() {
+         // Set up transient overlay
+         const auto & result = subprocess::run("bootc", {"bootc", "usr-overlay", "--read-only"});
+         if (result.returncode != 0) {
+-            std::string stderr_content(reinterpret_cast<const char *>(result.stderr.data()), result.stderr.size());
++            std::string stderr_content(
++                reinterpret_cast<const char *>(result.stderr_data.data()), result.stderr_data.size());
+             if (!stderr_content.empty()) {
+                 throw libdnf5::RuntimeError(M_("Error running `bootc usr-overlay --read-only`: {}"), stderr_content);
+             } else {
+@@ -139,7 +141,8 @@ void make_usr_writable() {
+     const auto & result = subprocess::run("mount", {"mount", "--options-source=disable", "-o", "remount,rw", "/usr"});
+ 
+     if (result.returncode != 0) {
+-        std::string stderr_content(reinterpret_cast<const char *>(result.stderr.data()), result.stderr.size());
++        std::string stderr_content(
++            reinterpret_cast<const char *>(result.stderr_data.data()), result.stderr_data.size());
+         throw libdnf5::RuntimeError(M_("Failed to remount /usr as read-write: {}"), stderr_content);
+     }
+ }
+diff --git a/libdnf5/utils/subprocess.cpp b/libdnf5/utils/subprocess.cpp
+index 33299e0fec..3175d804f2 100644
+--- a/libdnf5/utils/subprocess.cpp
++++ b/libdnf5/utils/subprocess.cpp
+@@ -259,8 +259,8 @@ CompletedProcess run(const std::string & command, const std::vector<std::string>
+ 
+     return CompletedProcess{
+         .returncode = returncode,
+-        .stdout = stdout_bytes,
+-        .stderr = stderr_bytes,
++        .stdout_data = stdout_bytes,
++        .stderr_data = stderr_bytes,
+     };
+ }
+ 
+diff --git a/libdnf5/utils/subprocess.hpp b/libdnf5/utils/subprocess.hpp
+index 7a5066ea30..73f3934bc4 100644
+--- a/libdnf5/utils/subprocess.hpp
++++ b/libdnf5/utils/subprocess.hpp
+@@ -11,8 +11,8 @@ namespace libdnf5::utils::subprocess {
+ 
+ struct CompletedProcess {
+     int returncode;
+-    std::vector<std::byte> stdout;
+-    std::vector<std::byte> stderr;
++    std::vector<std::byte> stdout_data;
++    std::vector<std::byte> stderr_data;
+ };
+ 
+ /// @brief Run a command in a child process and wait for it to complete.
+diff --git a/test/libdnf5/utils/test_subprocess.cpp b/test/libdnf5/utils/test_subprocess.cpp
+index 20fdb7c52c..55084a2193 100644
+--- a/test/libdnf5/utils/test_subprocess.cpp
++++ b/test/libdnf5/utils/test_subprocess.cpp
+@@ -34,8 +34,8 @@ void UtilsSubprocessTest::test_stdout_capture() {
+         libdnf5::utils::subprocess::run("/usr/bin/env", {"/usr/bin/env", "sh", "-c", "echo 'Hello, World!'"});
+ 
+     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
+-    CPPUNIT_ASSERT_EQUAL(std::string("Hello, World!\n"), bytes_to_string(result.stdout));
+-    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stderr));
++    CPPUNIT_ASSERT_EQUAL(std::string("Hello, World!\n"), bytes_to_string(result.stdout_data));
++    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stderr_data));
+ }
+ 
+ 
+@@ -45,8 +45,8 @@ void UtilsSubprocessTest::test_stderr_capture() {
+         libdnf5::utils::subprocess::run("/usr/bin/env", {"/usr/bin/env", "sh", "-c", "echo 'Error message' >&2"});
+ 
+     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
+-    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stdout));
+-    CPPUNIT_ASSERT_EQUAL(std::string("Error message\n"), bytes_to_string(result.stderr));
++    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stdout_data));
++    CPPUNIT_ASSERT_EQUAL(std::string("Error message\n"), bytes_to_string(result.stderr_data));
+ }
+ 
+ 
+@@ -56,8 +56,8 @@ void UtilsSubprocessTest::test_stdout_and_stderr_capture() {
+         "/usr/bin/env", {"/usr/bin/env", "sh", "-c", "echo 'stdout line'; echo 'stderr line' >&2"});
+ 
+     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
+-    CPPUNIT_ASSERT_EQUAL(std::string("stdout line\n"), bytes_to_string(result.stdout));
+-    CPPUNIT_ASSERT_EQUAL(std::string("stderr line\n"), bytes_to_string(result.stderr));
++    CPPUNIT_ASSERT_EQUAL(std::string("stdout line\n"), bytes_to_string(result.stdout_data));
++    CPPUNIT_ASSERT_EQUAL(std::string("stderr line\n"), bytes_to_string(result.stderr_data));
+ }
+ 
+ 
+@@ -66,8 +66,8 @@ void UtilsSubprocessTest::test_exit_code_success() {
+     const auto result = libdnf5::utils::subprocess::run("/usr/bin/env", {"/usr/bin/env", "sh", "-c", "exit 0"});
+ 
+     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
+-    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stdout));
+-    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stderr));
++    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stdout_data));
++    CPPUNIT_ASSERT_EQUAL(std::string(""), bytes_to_string(result.stderr_data));
+ }
+ 
+ 
+@@ -97,17 +97,17 @@ void UtilsSubprocessTest::test_binary_data() {
+     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
+ 
+     // Verify stdout contains the expected binary data
+-    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(5), result.stdout.size());
+-    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x00), result.stdout[0]);
+-    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x01), result.stdout[1]);
+-    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x02), result.stdout[2]);
+-    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0xff), result.stdout[3]);
+-    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0xfe), result.stdout[4]);
++    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(5), result.stdout_data.size());
++    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x00), result.stdout_data[0]);
++    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x01), result.stdout_data[1]);
++    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x02), result.stdout_data[2]);
++    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0xff), result.stdout_data[3]);
++    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0xfe), result.stdout_data[4]);
+ 
+     // Verify stderr contains the expected binary data
+-    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(2), result.stderr.size());
+-    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x03), result.stderr[0]);
+-    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x04), result.stderr[1]);
++    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(2), result.stderr_data.size());
++    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x03), result.stderr_data[0]);
++    CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>(0x04), result.stderr_data[1]);
+ }
+ 
+ 
+@@ -131,20 +131,20 @@ done
+     const auto result = libdnf5::utils::subprocess::run("/usr/bin/env", {"/usr/bin/env", "sh", "-c", script});
+ 
+     // The expected size is: 1000 × 100 bytes = 100,000 bytes per stream
+-    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(100000), result.stdout.size());
+-    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(100000), result.stderr.size());
++    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(100000), result.stdout_data.size());
++    CPPUNIT_ASSERT_EQUAL(static_cast<size_t>(100000), result.stderr_data.size());
+ 
+     // Verify the command succeeded (didn't deadlock or error)
+     CPPUNIT_ASSERT_EQUAL(0, result.returncode);
+ 
+     // Verify the data is correct (should be all a's on stdout, b's on stderr)
+     // Check first few bytes (only if we have data)
+-    if (result.stdout.size() > 0) {
+-        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('a'), result.stdout[0]);
+-        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('a'), result.stdout[100]);
++    if (result.stdout_data.size() > 0) {
++        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('a'), result.stdout_data[0]);
++        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('a'), result.stdout_data[100]);
+     }
+-    if (result.stderr.size() > 0) {
+-        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('b'), result.stderr[0]);
+-        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('b'), result.stderr[100]);
++    if (result.stderr_data.size() > 0) {
++        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('b'), result.stderr_data[0]);
++        CPPUNIT_ASSERT_EQUAL(static_cast<std::byte>('b'), result.stderr_data[100]);
+     }
+ }
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
deleted file mode 100644
index 64ea7874d3..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:29:07 +0200
-Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9e2e9e9e..2056089d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -19,7 +19,7 @@ ELSE ()
-     MESSAGE (FATAL_ERROR "Invalid PYTHON_DESIRED value: " ${PYTHON_DESIRED})
- ENDIF()
- 
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('purelib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('purelib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
- 
- ADD_SUBDIRECTORY (dnf)
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
deleted file mode 100644
index eb46113f3a..0000000000
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:29:37 +0200
-Subject: [PATCH] Run python scripts using env
-
-Otherwise the build tools hardcode the python path into them.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- bin/dnf-automatic.in | 2 +-
- bin/dnf.in           | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
-index 17e35a05..28827e38 100755
---- a/bin/dnf-automatic.in
-+++ b/bin/dnf-automatic.in
-@@ -1,4 +1,4 @@
--#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python3
- # dnf-automatic executable.
- #
- # Copyright (C) 2014-2016 Red Hat, Inc.
-diff --git a/bin/dnf.in b/bin/dnf.in
-index 55ceb3f2..e38973c7 100755
---- a/bin/dnf.in
-+++ b/bin/dnf.in
-@@ -1,4 +1,4 @@
--#!@PYTHON_EXECUTABLE@
-+#!/usr/bin/env python3
- # The dnf executable script.
- #
- # Copyright (C) 2012-2016 Red Hat, Inc.
diff --git a/meta/recipes-devtools/dnf/dnf_4.24.0.bb b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
deleted file mode 100644
index 31bbb4032b..0000000000
--- a/meta/recipes-devtools/dnf/dnf_4.24.0.bb
+++ /dev/null
@@ -1,96 +0,0 @@
-SUMMARY = "Package manager forked from Yum, using libsolv as a dependency resolver"
-DESCRIPTION = "Software package manager that installs, updates, and removes \
-packages on RPM-based Linux distributions. It automatically computes \
-dependencies and determines the actions required to install packages."
-HOMEPAGE = "https://github.com/rpm-software-management/dnf"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
-                    "
-
-SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protocol=https;tag=${PV} \
-           file://0001-Corretly-install-tmpfiles.d-configuration.patch \
-           file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
-           file://0005-Do-not-prepend-installroot-to-logdir.patch \
-           file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
-           file://0030-Run-python-scripts-using-env.patch \
-           file://0001-set-python-path-for-completion_helper.patch \
-           file://0001-lock.py-fix-Exception-handling.patch \
-           "
-
-SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
-
-SRCREV = "e47634fbe3565d0580e89ec21adb7c1b308642ce"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
-
-inherit cmake gettext bash-completion setuptools3-base systemd
-
-DEPENDS += "libdnf librepo libcomps"
-
-# manpages generation requires http://www.sphinx-doc.org/
-EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS:${PN} += " \
-  python3-core \
-  python3-codecs \
-  python3-ctypes \
-  python3-netclient \
-  python3-email \
-  python3-threading \
-  python3-logging \
-  python3-fcntl \
-  librepo \
-  python3-shell \
-  libcomps \
-  libdnf \
-  python3-sqlite3 \
-  python3-compression \
-  python3-rpm \
-  python3-json \
-  python3-curses \
-  python3-misc \
-  "
-
-RDEPENDS:${PN}:class-native = ""
-
-RRECOMMENDS:${PN}:class-target += "gnupg"
-
-# Create a symlink called 'dnf' as 'make install' does not do it, but
-# .spec file in dnf source tree does (and then Fedora and dnf documentation
-# says that dnf binary is plain 'dnf').
-do_install:append() {
-        ln -rs ${D}/${bindir}/dnf-3 ${D}/${bindir}/dnf
-        ln -rs ${D}/${bindir}/dnf-automatic-3 ${D}/${bindir}/dnf-automatic
-}
-
-# Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
-do_install:append:class-native() {
-        create_wrapper ${D}/${bindir}/dnf \
-                SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
-                RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-}
-
-do_install:append:class-nativesdk() {
-        create_wrapper ${D}/${bindir}/dnf \
-                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
-                RPM_NO_CHROOT_FOR_SCRIPTS=1
-}
-
-SYSTEMD_SERVICE:${PN} = "dnf-makecache.service dnf-makecache.timer \
-                         dnf-automatic.service dnf-automatic.timer \
-                         dnf-automatic-download.service dnf-automatic-download.timer \
-                         dnf-automatic-install.service dnf-automatic-install.timer \
-                         dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
-"
-SYSTEMD_AUTO_ENABLE ?= "disable"
-
-SKIP_RECIPE[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
-
-# Packages for testing purposes
-PACKAGES += "${PN}-test-main ${PN}-test-dep"
-ALLOW_EMPTY:${PN}-test-main = "1"
-ALLOW_EMPTY:${PN}-test-dep = "1"
-RRECOMMENDS:${PN}-test-main = "${PN}-test-dep"
diff --git a/meta/recipes-devtools/dnf/dnf_5.4.6.0.bb b/meta/recipes-devtools/dnf/dnf_5.4.6.0.bb
new file mode 100644
index 0000000000..46ac6c209e
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf_5.4.6.0.bb
@@ -0,0 +1,181 @@
+SUMMARY = "DNF package manager rewritten in C++, using libsolv as a dependency resolver"
+DESCRIPTION = "\
+    DNF5 is a command-line package manager that automates the process of \
+    installing, upgrading, configuring, and removing computer programs in a \
+    consistent manner. It supports RPM packages, modulemd modules, and comps \
+    groups and environments. \
+"
+HOMEPAGE = "https://github.com/rpm-software-management/dnf5"
+BUGTRACKER = "https://github.com/rpm-software-management/dnf5/issues"
+CVE_PRODUCT = "rpm:dnf5 rpm-software-management:dnf5"
+SECTION = "base"
+
+LICENSE = "LGPL-2.1-or-later AND GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "\
+    file://COPYING.md;md5=9733192df318d0f806fd668b92ba0ba6 \
+    file://gpl-2.0.txt;md5=570a9b3749dd0463a1778803b12a6dce \
+    file://lgpl-2.1.txt;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+"
+
+DEPENDS = "\
+    fmt \
+    glib-2.0 \
+    json-c \
+    libmodulemd \
+    librepo \
+    libsolv \
+    libtoml11 \
+    libxml2 \
+    sqlite3 \
+    util-linux \
+"
+
+SRC_URI = "\
+    git://github.com/rpm-software-management/dnf5.git;protocol=https;branch=main;tag=${PV} \
+    file://0002-cmake-set-CMP0190-to-OLD.patch \
+    file://0003-Do-not-hardcode-system_cachedir.patch \
+    file://0004-add-support-for-gcc-12-and-below.patch \
+    file://0005-libdnf-fix-arm-arch-mapping-issues-for-qemuarmv5.patch \
+    file://0006-rename-stdout-stderr-members.patch \
+"
+SRC_URI:append:class-native = " file://0001-Do-not-hardcode-the-systemd-unit-directory.patch"
+SRCREV = "1b2de4bdc2f25a6de2884fb2cf81f80a8ce2a567"
+
+inherit bash-completion cmake gettext pkgconfig siteinfo systemd
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3targetconfig', '', d)}
+
+PACKAGECONFIG[acl] = "-DWITH_ACL=ON,-DWITH_ACL=OFF,acl"
+PACKAGECONFIG[dnfdaemon-client] = "-DWITH_DNF5DAEMON_CLIENT=ON,-DWITH_DNF5DAEMON_CLIENT=OFF,sdbus-c++"
+PACKAGECONFIG[dnfdaemon-server] = "-DWITH_DNF5DAEMON_SERVER=ON,-DWITH_DNF5DAEMON_SERVER=OFF,sdbus-c++"
+PACKAGECONFIG[plugins] = "-DWITH_DNF5_PLUGINS=ON,-DWITH_DNF5_PLUGINS=OFF,curl sdbus-c++ zlib"
+PACKAGECONFIG[plugin-actions] = "-DWITH_PLUGIN_ACTIONS=ON,-DWITH_PLUGIN_ACTIONS=OFF"
+PACKAGECONFIG[plugin-appstream] = "-DWITH_PLUGIN_APPSTREAM=ON,-DWITH_PLUGIN_APPSTREAM=OFF,appstream"
+PACKAGECONFIG[plugin-expired-pgp-keys] = "-DWITH_PLUGIN_EXPIRED_PGP_KEYS=ON,-DWITH_PLUGIN_EXPIRED_PGP_KEYS=OFF,gnupg"
+PACKAGECONFIG[plugin-local] = "-DWITH_PLUGIN_LOCAL=ON,-DWITH_PLUGIN_LOCAL=OFF"
+
+# sdbus-c++ and journalctl integration.
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON -DWITH_PLUGIN_SYSTEMD_INHIBIT=ON,-DWITH_SYSTEMD=OFF -DWITH_PLUGIN_SYSTEMD_INHIBIT=OFF,sdbus-c++"
+
+# build options - bindings
+PACKAGECONFIG[python3] = "-DWITH_PYTHON3=ON,-DWITH_PYTHON3=OFF,python3 swig-native"
+
+# No sdbus-c++-native package.
+PACKAGECONFIG:remove:class-native = "\
+    dnfdaemon-client \
+    dnfdaemon-server \
+    plugins \
+    plugin-manifest \
+    systemd \
+"
+
+PACKAGE_BEFORE_PN += "\
+    ${PN}-dnfdaemon-server \
+    ${PN}-plugins \
+    ${PN}-python3 \
+    ${PN}-systemd \
+"
+
+# manpages generation requires http://www.sphinx-doc.org/
+EXTRA_OECMAKE:append = " \
+    -DENABLE_SOLV_FOCUSNEW=ON \
+    -DWITH_DNF5_OBSOLETES_DNF=OFF \
+    -DWITH_DNF5=ON \
+    -DWITH_GO=OFF \
+    -DWITH_HTML=OFF \
+    -DWITH_LIBDNF5_CLI=ON \
+    -DWITH_MAN=OFF \
+    -DWITH_PERL5=OFF \
+    -DWITH_PLUGIN_RHSM=OFF \
+    -DWITH_RUBY=OFF \
+    -DWITH_TESTS=OFF \
+    -DWITH_PLUGIN_MANIFEST=OFF \
+"
+
+# No sdbus-c++-native package exists so remove all options that depend on it.
+EXTRA_OECMAKE:append:class-native = " \
+    -DWITH_DNF5DAEMON_CLIENT=OFF \
+    -DWITH_DNF5DAEMON_SERVER=OFF \
+    -DWITH_DNF5_PLUGINS=OFF \
+    -DWITH_PLUGIN_MANIFEST=OFF \
+    -DWITH_SYSTEMD=OFF \
+"
+
+# Create a symlink called 'dnf' as 'make install' does not do it, but
+# .spec file in dnf source tree does (and then Fedora and dnf documentation
+# says that dnf binary is plain 'dnf').
+do_install:append() {
+    ln -rs ${D}/${bindir}/dnf5 ${D}/${bindir}/dnf
+    install -d ${D}${sysconfdir}/dnf
+
+    # Breaks dnf because the builddep plugin is provided in the
+    # dnf-plugins-core package which is not available in oe-core.
+    rm -f ${D}${datadir}/dnf5/aliases.d/compatibility-plugins.conf
+}
+
+# Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
+do_install:append:class-native() {
+    create_wrapper ${D}/${bindir}/dnf \
+        SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
+        RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+        RPM_NO_CHROOT_FOR_SCRIPTS=1
+}
+
+do_install:append:class-nativesdk() {
+    create_wrapper ${D}/${bindir}/dnf \
+        RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
+        RPM_NO_CHROOT_FOR_SCRIPTS=1
+}
+
+# Packages for testing purposes
+PACKAGES += "${PN}-test-main ${PN}-test-dep"
+
+FILES:${PN} += "\
+    ${bindir}/dnf* \
+    ${datadir}/dbus-1/system-services/org.rpm.dnf.v0.service \
+    ${datadir}/dnf5 \
+    ${datadir}/polkit-1/actions/org.rpm.dnf* \
+    ${datadir}/polkit-1/rules.d/org.rpm.dnf* \
+    ${datadir}/zsh/site-functions/_dnf5 \
+    ${libdir}/dnf5 \
+    ${libdir}/libdnf5* \
+    ${sysconfdir}/dnf \
+"
+
+FILES:${PN}-bash-completion += "\
+    ${datadir}/bash-completion/completions/dnf5 \
+"
+
+FILES:${PN}-dnfdaemon-server += "\
+    ${systemd_system_unitdir}/dnf5daemon-server.service \
+    ${datadir}/dbus-1/interfaces/org.rpm.dnf* \
+    ${datadir}/dbus-1/system.d/org.rpm.dnf* \
+"
+
+FILES:${PN}-plugins += "\
+    ${systemd_system_unitdir}/dnf-automatic.service \
+    ${systemd_system_unitdir}/dnf-automatic.timer \
+    ${systemd_system_unitdir}/dnf5-automatic.service \
+    ${systemd_system_unitdir}/dnf5-automatic.timer \
+"
+
+FILES:${PN}-python3 += "\
+    ${libdir}/${PYTHON_DIR}/site-packages/libdnf* \
+"
+
+FILES:${PN}-systemd += "\
+    ${systemd_system_unitdir}/dnf5-makecache.service \
+    ${systemd_system_unitdir}/dnf5-makecache.timer \
+    ${systemd_system_unitdir}/dnf5-offline-transaction-cleanup.service \
+    ${systemd_system_unitdir}/dnf5-offline-transaction.service \
+"
+
+SYSTEMD_AUTO_ENABLE ?= "disable"
+
+RRECOMMENDS:${PN}:append:class-target = " bash-completion gnupg"
+RRECOMMENDS:${PN}-test-main = "${PN}-test-dep"
+ALLOW_EMPTY:${PN}-test-main = "1"
+ALLOW_EMPTY:${PN}-test-dep = "1"
+
+SKIP_RECIPE[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES due to disabled rpm support in libsolv', d)}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.56.0

