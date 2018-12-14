Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE66E79D75
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 01:09:33 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so3873037wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 17:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=waaC7t7OCnuQlRw591CBy/99ZPdvByUbmSNXNDej2CM=;
	b=KQ1yruNZBunGTatruw8VpoMCBPNOSPXTeJ2cN0nUXCAaFlk5BliWXjmTGMpTn6YXY0
	bvvt8/nshTh+B4qaPv83tV+wJULl3o08KCNL1XEeycPQH/4KFJfmFQ47ErcDb42M7/lm
	1VfQmQaYCDBbxKdE19IdSlHsVhRkDem6kmqlKT6pMYDLMr3FV6ZZWedCDhl04PB67JJv
	eaB4yyAiIZMp1YLiPnUkzKEHLr7KrIVUIpRE27s3TjASU2wUIBO0T8qvrlEpAmvzBLg6
	995v13w35ifi2BDM0ZEptRBuehmo3ZsT7Oyt1p9bRB6kjAwn8hy2ksRovpgkrmsQ/rvV
	0YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=waaC7t7OCnuQlRw591CBy/99ZPdvByUbmSNXNDej2CM=;
	b=ndMqlzhuInoDxySu8dgeG/YqoBFDFkULMUuEtvPGZcRJZFfm5WluWVoW45V2Qk6yK+
	BGsuQXt84vBTVyXw4/2gVqajpoGLSeYK/toWpN7lu09bbFyY88FNxZwMfIZoVlmEUPh3
	+VURduVegobZfbkNedlVRPu5LQgJtP7U1WTS5fVHI5URdn+d47uc94rVi7Bsd+8jYayj
	MqINIMtUDNoSx3Pm4vmGux+tzFd59JKjyH4wk+sTD3JWfFnb++w3RbePeO4pqVMa/dBT
	tFz3DZ01dlW7CzEPTngKjQkKv8peR2rt5XMXcSfFst9jFQn7+RRAWsKW0mU3HxSWG7f9
	gvdg==
X-Gm-Message-State: AA+aEWZT4Kr9tg9P3kMYhVCtqxPtAm87ztD7N/IJS2gzWk5Y10iuDSH+
	iVdZqQo7N5RerE8gncejymIXAT93M3w=
X-Google-Smtp-Source: AFSGD/VoZioyFKgcpy9V40bDlZzJl/qQpYfgxkIjfTTGr50eAu7Re27rEOBOJn6eZ3aPwbFH6oicUw==
X-Received: by 2002:adf:ce86:: with SMTP id r6mr833203wrn.257.1544749774243;
	Thu, 13 Dec 2018 17:09:34 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h129sm7524265wma.0.2018.12.13.17.09.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 17:09:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 01:08:48 +0000
Message-Id: <20181214010848.24170-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181214010848.24170-1-ross.burton@intel.com>
References: <20181214010848.24170-1-ross.burton@intel.com>
Subject: [PATCH 2/2] package-manager: pylint fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2018 01:09:34 -0000

mark_packages() is implicitly abstract in OpkgDpkgPM so implement it for
clarity.

Also trivial whitespace, semicolons, unused variables, and regex strings.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/package_manager.py | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f0d98dd0ffc..564b74ae7b5 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -29,7 +29,7 @@ def opkg_query(cmd_output):
     a dictionary with the information of the packages. This is used
     when the packages are in deb or ipk format.
     """
-    verregex = re.compile(' \([=<>]* [^ )]*\)')
+    verregex = re.compile(r" \([=<>]* [^ )]*\)")
     output = dict()
     pkg = ""
     arch = ""
@@ -237,9 +237,9 @@ class DpkgIndexer(Indexer):
         bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "apt.conf.d"))
         bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "preferences.d"))
 
-        with open(os.path.join(self.apt_conf_dir, "preferences"), "w") as prefs_file:
+        with open(os.path.join(self.apt_conf_dir, "preferences"), "w"):
             pass
-        with open(os.path.join(self.apt_conf_dir, "sources.list"), "w+") as sources_file:
+        with open(os.path.join(self.apt_conf_dir, "sources.list"), "w+"):
             pass
 
         with open(self.apt_conf_file, "w") as apt_conf:
@@ -1118,6 +1118,10 @@ class OpkgDpkgPM(PackageManager):
 
         return tmp_dir
 
+    @abstractmethod
+    def mark_packages(self, status_tag, packages=None):
+        pass
+
     def _handle_intercept_failure(self, registered_pkgs):
         self.mark_packages("unpacked", registered_pkgs.split())
 
@@ -1633,13 +1637,13 @@ class DpkgPM(OpkgDpkgPM):
         # rename *.dpkg-new files/dirs
         for root, dirs, files in os.walk(self.target_rootfs):
             for dir in dirs:
-                new_dir = re.sub("\.dpkg-new", "", dir)
+                new_dir = re.sub(r"\.dpkg-new", "", dir)
                 if dir != new_dir:
                     os.rename(os.path.join(root, dir),
                               os.path.join(root, new_dir))
 
             for file in files:
-                new_file = re.sub("\.dpkg-new", "", file)
+                new_file = re.sub(r"\.dpkg-new", "", file)
                 if file != new_file:
                     os.rename(os.path.join(root, file),
                               os.path.join(root, new_file))
@@ -1744,11 +1748,10 @@ class DpkgPM(OpkgDpkgPM):
                                    os.path.join(self.deploy_dir, arch))
 
         base_arch_list = base_archs.split()
-        multilib_variants = self.d.getVar("MULTILIB_VARIANTS");
+        multilib_variants = self.d.getVar("MULTILIB_VARIANTS")
         for variant in multilib_variants.split():
             localdata = bb.data.createCopy(self.d)
             variant_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + variant, False)
-            orig_arch = localdata.getVar("DPKG_ARCH")
             localdata.setVar("DEFAULTTUNE", variant_tune)
             variant_arch = localdata.getVar("DPKG_ARCH")
             if variant_arch not in base_arch_list:
@@ -1762,7 +1765,7 @@ class DpkgPM(OpkgDpkgPM):
                     if match_arch:
                         for base_arch in base_arch_list:
                             architectures += "\"%s\";" % base_arch
-                        apt_conf.write("  Architectures {%s};\n" % architectures);
+                        apt_conf.write("  Architectures {%s};\n" % architectures)
                         apt_conf.write("  Architecture \"%s\";\n" % base_archs)
                     else:
                         line = re.sub("#ROOTFS#", self.target_rootfs, line)
-- 
2.11.0


