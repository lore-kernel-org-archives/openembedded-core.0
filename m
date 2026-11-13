Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12348.1794579785793414061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 06:23:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=U0A+M41p;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.50, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b5785aea56so172221a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794579784; x=1795184584; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJ5DDQJP/LZ+8Hog0LMYCZo/dx8sPG+JIVROFU6ZGQE=;
        b=U0A+M41pPIwCg1kN3IClnG8ReW58Hbbm9mQZVjkgskN5EQa5p6DJE11QNw49qVlC2Q
         AnUfaFz1twODjEg9Y/sfZCHq8GzHsep4CSl3q4wrLojnBZw/WOvqVP80jvaxuXFz2prP
         H4++bo45CM5hNuEd7xZqEJahdY7lBWK0I4BSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579784; x=1795184584;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJ5DDQJP/LZ+8Hog0LMYCZo/dx8sPG+JIVROFU6ZGQE=;
        b=0TdcyONn5WnTSU0a7HtftupqWE+vfZAWjFRfAmDiGDUMEq3nRSJ9q3/0dXmOVmoi0O
         2I5GC/NTKRdMcURr2sr/jONE4Pz1r100orM/07qEK4kIeJjZbmBJj+ynMdVD0/6rRcNJ
         fbo4a7C0YMfX/73/IrcOWZJEfiiur8dzqBbwD/0twNBy0dBBJWcnnhihaZer28YZ9eK0
         jWYaY5Nr2REeHntOIHUhrwCehplwkrxLS8/w7RdTnAWv545IpO7Y9OWWuDL4HmpZEfU4
         AgGCvdAcNIDl71efJ4ic0xKEXSgm06kykWrzkHxmrj8kCxECq1C7rmMtai+0FDzOKZPg
         Trrg==
X-Gm-Message-State: APuU4Z/XGYEj4AGIX6SqOwDtsAvOmOLfDaKRe+b4F/V4Hb4CVS5PMOqE
	2tJFRW1xsOtfRUr6XZR/wc9125TFlk3kIkAYm5hQ655Fk5fV+Nr1gBfxco4eOO0AunnYmBwDrSW
	qSSq6pXw=
X-Gm-Gg: AYBFou3xLJIv/Qr5z2JYpNCEJ+8zDkpooWHtFumNldFvJV9cTgRwRjG4Gja+OzuH6XH
	aLzDiiul9xJvnQG31Yfpa5lfb5RyHZHCje3SuhrsNsEoUqmopeDNeFidFzFkPRDV9rACoDKsor0
	8wqBCc5oZ3kKuwyXa0YZbHkudhXXf0jGSDkjVef/B86H0ly18kR4HjMBNCo4uJPZb7iih+7LcRw
	3t3gp+O0UYlxxcGxDvn/L7DlLEE7ms+sm/F17q3owGd5BAFQDOTfuEFPnIW5m00cszWZWEs2gqS
	CACM1BFSwjglO/NQmF+tbu6KLJ9R3VmB5OMXrpcbc0j2kjKBb4vlv/og8SyHJfuLRMD1vBHX7Bs
	C0l+HhhCqcDQEiXzNp8jXkD7XcihDoFVZcw3cbz9e2qDDg2HYABF5Dr7ZkwNLiStcaGyNcAv+cp
	04JFX8qdYA3lhOTJfvgb6LgbXSlUOSYmrjH4O80xpNLa9rcCtrcXixMlpcQkEleF+MQR6ssKzVJ
	YRM0lgy9HeqmWR2I1nZst+nato3fOAsqqAdPhcqI6rjLDhV9paQs8SRjh/afalfPmi6gVyYB2Cd
	JYF5zJkn2aFbcoV3NgkopRB9e8FsDrnwUJG+yjahCPIavJ3+X0jmxh3fxs0wX+9alp+7NCJNEld
	mMeQh+daKJkfmFYJiTyJBeVI1rxCJ2L013QJLbLesPy4UwDl/7yIu6XXdPDF6JJt3lw49Naj+ns
	ZiXwAnPvL8e1L/EE28aXwqGeZtW98eUP9MavHHw54ZTw1cSLsrJoek+XVQcDWvoz/4nKGXwPCvq
	S6ohSX3xDrJQT4=
X-Received: by 2002:a17:906:c4e:b0:c4d:3543:336e with SMTP id a640c23a62f3a-c5095db63d3mr250410766b.0.1794579782999;
        Fri, 13 Nov 2026 06:23:02 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.arnhem.chello.nl (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm104620666b.78.2026.11.13.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:23:02 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v14 2/5] dnf: Upgrade to 5.4.7.0
Date: Fri, 13 Nov 2026 15:22:55 +0100
Message-ID: <20261113142259.1708386-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113142259.1708386-1-adam.duskett@amarulasolutions.com>
References: <20261113142259.1708386-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 14:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250173
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

    - /var/cache/dnf is replaced with /var/cache/libdnf5, and dnf5 keeps
      its state in /usr/lib/sysimage/libdnf5. Add both to
      packaging_data_dirs, otherwise images without package-management
      keep them, and the transaction history leaks TMPDIR paths.

    - Pass the local repository to --repofrompath as a file:// URL.
      dnf5 only reports package locations for URL baseurls, so with a
      bare path "repoquery --location" prints nothing.

    - Add `features += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'`
          `features += 'PACKAGECONFIG:append:pn-librepo = " sequoia"\n'`
      to test_testimage_dnf as librepo currently does not work
      with gpgme.

    - Change `if line.startswith("Error in POSTIN scriptlet in rpm package"):`
      to `if "Error in %post scriptlet:" in line:` as dnf prints `>>>`
      charachters and the error string has changed. dnf5 also reports
      the full name-epoch:version-release.arch, so strip it down to the
      package name.

    - Update test_incremental_image_generation for the "Installing:" and
      "Removing:" transaction tables that dnf5 prints.

    - Remove `EXTRANATIVEPATH += "python3-native" from rootfs_rpm.bbclass`
      as dnf5 is C++ based.

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
v11 -> v12: Fixed more broken tests due to different DNF5 messages compared to DNF4
v12 -> v13: Add dnf5 directories to self.packaging_data_dirs to prevent stale
            directories to show up in fitimages which causes bitbake failures.
v13 -> v14: Remove EXTRANATIVEPATH += "python3-native" from rootfs_rpm.bbclass

 .../lib/oeqa/runtime/cases/dnf_runtime.py     |   6 +-
 meta/classes-recipe/rootfs_rpm.bbclass        |   3 -
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |  35 +--
 meta/lib/oe/package_manager/rpm/rootfs.py     |   3 +
 meta/lib/oeqa/runtime/cases/dnf.py            |  16 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py  |   4 +-
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
 ...f5-offline-fix-build-without-systemd.patch |  35 +++
 ...PYTHON_INSTALL_DIR-by-running-python.patch |  24 --
 .../0030-Run-python-scripts-using-env.patch   |  34 ---
 meta/recipes-devtools/dnf/dnf_4.24.0.bb       |  96 --------
 meta/recipes-devtools/dnf/dnf_5.4.7.0.bb      | 183 ++++++++++++++++
 25 files changed, 776 insertions(+), 369 deletions(-)
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
 create mode 100644 meta/recipes-devtools/dnf/dnf/0007-dnf5-offline-fix-build-without-systemd.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
 delete mode 100644 meta/recipes-devtools/dnf/dnf_4.24.0.bb
 create mode 100644 meta/recipes-devtools/dnf/dnf_5.4.7.0.bb

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
diff --git a/meta/classes-recipe/rootfs_rpm.bbclass b/meta/classes-recipe/rootfs_rpm.bbclass
index 55f1cc92ca..58d77ffe1f 100644
--- a/meta/classes-recipe/rootfs_rpm.bbclass
+++ b/meta/classes-recipe/rootfs_rpm.bbclass
@@ -17,9 +17,6 @@ export STAGING_LIBDIR
 # Add 100Meg of extra space for dnf
 IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("PACKAGE_INSTALL", "dnf", " + 102400", "", d)}"
 
-# Dnf is python based, so be sure python3-native is available to us.
-EXTRANATIVEPATH += "python3-native"
-
 RPMROOTFSDEPENDS = "rpm-native:do_populate_sysroot \
     dnf-native:do_populate_sysroot \
     createrepo-c-native:do_populate_sysroot"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0a7bc016e0..9992ea225e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -157,7 +157,7 @@ RECIPE_MAINTAINER:pn-diffutils = "Ahmed Merdan <ahmed.merdan@windriver.com>"
 RECIPE_MAINTAINER:pn-distcc = "Ahmed Merdan <ahmed.merdan@windriver.com>"
 RECIPE_MAINTAINER:pn-distcc-config = "Kusuma Dirisala <kusuma.dirisala@windriver.com>"
 RECIPE_MAINTAINER:pn-dmidecode = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-dnf = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-dnf = "Adam Duskett <adam.duskett@amarulasolutions.com>"
 RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
 RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index ccb4316bd0..3460a6bb35 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -83,7 +83,8 @@ class RpmPM(PackageManager):
         self.saved_packaging_data = self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
-        self.packaging_data_dirs = ['etc/rpm', 'etc/rpmrc', 'etc/dnf', 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
+        self.packaging_data_dirs = ['etc/rpm', 'etc/rpmrc', 'etc/dnf', 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf',
+                                    'usr/lib/sysimage/libdnf5', 'var/cache/libdnf5']
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved')):
@@ -163,7 +164,7 @@ class RpmPM(PackageManager):
             gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
 
         if self.d.getVar('RPM_SIGN_PACKAGES') != '1':
-            gpg_opts += 'gpgcheck=0\n'
+            gpg_opts += 'pkg_gpgcheck=0\n'
 
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
         remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
@@ -200,11 +201,11 @@ class RpmPM(PackageManager):
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
@@ -212,8 +213,10 @@ class RpmPM(PackageManager):
             if line.startswith("Error: Systemctl"):
                 bb.error(line)
 
-            if line.startswith("Error in POSTIN scriptlet in rpm package"):
-                failed_scriptlets_pkgnames[line.split()[-1]] = True
+            if "Error in %post scriptlet:" in line:
+                # dnf reports name-epoch:version-release.arch, keep only the name
+                pkgname = line.split()[-1].rsplit("-", 2)[0]
+                failed_scriptlets_pkgnames[pkgname] = True
 
         if len(failed_scriptlets_pkgnames) > 0:
             failed_postinsts_abort(list(failed_scriptlets_pkgnames.keys()), self.d.expand("${T}/log.do_${BB_CURRENTTASK}"))
@@ -313,16 +316,21 @@ class RpmPM(PackageManager):
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
                             ]
         if hasattr(self, "rpm_repo_dir"):
-            standard_dnf_args.append("--repofrompath=oe-repo,%s" % (self.rpm_repo_dir))
+            standard_dnf_args.append("--repofrompath=oe-repo,file://%s" % (self.rpm_repo_dir))
         cmd = [dnf_cmd] + standard_dnf_args + dnf_args
         bb.note('Running %s' % ' '.join(cmd))
         try:
@@ -335,9 +343,9 @@ class RpmPM(PackageManager):
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
@@ -406,8 +414,7 @@ class RpmPM(PackageManager):
         pkg_name = output.splitlines()[-1]
         if not pkg_name.endswith(".rpm"):
             bb.fatal("dnf could not find package %s in repository: %s" %(pkg, output))
-        # Strip file: prefix
-        pkg_path = pkg_name[5:]
+        pkg_path = pkg_name.removeprefix("file://")
 
         tar_cmd = bb.utils.which(os.getenv("PATH"), "tar")
         rpm2archive_cmd = bb.utils.which(os.getenv("PATH"), "rpm2archive")
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
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 59145df0fd..92d8595591 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -27,12 +27,12 @@ class ImageOptionsTests(OESelftestTestCase):
         bitbake("core-image-minimal")
         log_data_file = os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")
         log_data_created = ftools.read_file(log_data_file)
-        incremental_created = re.search(r"Installing\s*:\s*packagegroup-core-ssh-openssh", log_data_created)
+        incremental_created = re.search(r"^Installing:\n(?: .*\n)*? packagegroup-core-ssh-openssh\s", log_data_created, re.M)
         self.remove_config('IMAGE_FEATURES += "ssh-server-openssh"')
         self.assertTrue(incremental_created, msg = "Match failed in:\n%s" % log_data_created)
         bitbake("core-image-minimal")
         log_data_removed = ftools.read_file(log_data_file)
-        incremental_removed = re.search(r"Erasing\s*:\s*packagegroup-core-ssh-openssh", log_data_removed)
+        incremental_removed = re.search(r"^Removing:\n(?: .*\n)*? packagegroup-core-ssh-openssh\s", log_data_removed, re.M)
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
     def test_ccache_tool(self):
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
index 0000000000..4360139a26
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-systemd-unit-directory.patch
@@ -0,0 +1,29 @@
+From fd24b56096d436da4ffe5e560ac3aa34000a4d2e Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 15 Oct 2026 11:54:09 +0200
+Subject: [PATCH] Do not hardcode the systemd unit directory
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Rebased for 5.4.7.0
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9bc01ee..6fbc338 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,7 @@ project(dnf5 LANGUAGES CXX C VERSION ${VERSION_PRIME}.${VERSION_MAJOR}.${VERSION
+ cmake_policy(VERSION ${CMAKE_VERSION})
+ 
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
+-set(SYSTEMD_DIR "/usr/lib/systemd/system" CACHE PATH "Directory for systemd unit files")
++set(SYSTEMD_DIR $ENV{systemd_system_unitdir} CACHE PATH "Directory for systemd unit files")
+ set(TMPFILES_DIR "/usr/lib/tmpfiles.d" CACHE PATH "Directory for systemd tmpfiles.d files")
+ set(AUTO_IMPORT_KEYS_DIRS "/usr/share/pki/rpm-gpg:/etc/pki/rpm-gpg" CACHE STRING
+     "Colon-separated list of directories of OpenPGP keys trusted by auto_import_local_keys")
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
diff --git a/meta/recipes-devtools/dnf/dnf/0007-dnf5-offline-fix-build-without-systemd.patch b/meta/recipes-devtools/dnf/dnf/0007-dnf5-offline-fix-build-without-systemd.patch
new file mode 100644
index 0000000000..dba69d4bd9
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/0007-dnf5-offline-fix-build-without-systemd.patch
@@ -0,0 +1,35 @@
+From 81405407f84d87ebec7c3f9eeeaafaa148e9f462 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Fri, 6 Nov 2026 13:29:35 +0100
+Subject: [PATCH] dnf5: offline: fix build without systemd
+
+The plymouth argument of reboot() is only used when dnf5 is built with
+systemd support. Without it, the argument is unused and the build fails:
+
+  dnf5/commands/offline/offline.cpp:277:53: error: unused parameter
+  'plymouth' [-Werror=unused-parameter]
+
+Mark the argument as [[maybe_unused]].
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf5/pull/3030]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ dnf5/commands/offline/offline.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dnf5/commands/offline/offline.cpp b/dnf5/commands/offline/offline.cpp
+index 74123e2..f95ecdc 100644
+--- a/dnf5/commands/offline/offline.cpp
++++ b/dnf5/commands/offline/offline.cpp
+@@ -274,7 +274,7 @@ void invalidate_if_not_valid(libdnf5::offline::OfflineTransactionState & state,
+     }
+ }
+ 
+-void reboot(bool poweroff = false, PlymouthOutput * plymouth = nullptr) {
++void reboot(bool poweroff = false, [[maybe_unused]] PlymouthOutput * plymouth = nullptr) {
+     if (std::getenv("DNF_SYSTEM_UPGRADE_NO_REBOOT")) {
+         if (poweroff) {
+             std::cerr << "DNF_SYSTEM_UPGRADE_NO_REBOOT is set, not powering off." << std::endl;
+-- 
+2.56.0
+
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
diff --git a/meta/recipes-devtools/dnf/dnf_5.4.7.0.bb b/meta/recipes-devtools/dnf/dnf_5.4.7.0.bb
new file mode 100644
index 0000000000..d07b5e1f9f
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf_5.4.7.0.bb
@@ -0,0 +1,183 @@
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
+LICENSE = "LGPL-2.1-or-later AND LGPL-2.0-or-later AND GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "\
+    file://COPYING.md;md5=9733192df318d0f806fd668b92ba0ba6 \
+    file://gpl-2.0.txt;md5=570a9b3749dd0463a1778803b12a6dce \
+    file://lgpl-2.0.txt;md5=920be02b2cababb5f05b0b3a69d27263 \
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
+    file://0007-dnf5-offline-fix-build-without-systemd.patch \
+"
+SRC_URI:append:class-native = " file://0001-Do-not-hardcode-the-systemd-unit-directory.patch"
+SRCREV = "a42787112973edb4e5ba237d4fca6f878ac5f4c1"
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
+    -DWITH_PLUGIN_RHSM_CONTAINER=OFF \
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
2.56.1

