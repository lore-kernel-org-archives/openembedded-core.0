Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72DD475D7D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 07:23:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t687NnXe027610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 00:23:49 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Jul 2015 00:23:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 00:23:48 -0700
Message-ID: <2f7f2a6a9bd0b6d559ed8d9aaf3635f1e3bad411.1436340132.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436340132.git.liezhi.yang@windriver.com>
References: <cover.1436340132.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] python-smartpm: 1.4.1 -> 1.5
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
X-List-Received-Date: Wed, 08 Jul 2015 07:23:49 -0000
Content-Type: text/plain

* Remove the following patches since the are already in the source:
smart-config-ignore-all-recommends.patch
smart-conflict-provider.patch
smart-dflags.patch
smart-filename-NAME_MAX.patch
smart-flag-exclude-packages.patch
smart-flag-ignore-recommends.patch
smart-metadata-match.patch
smart-multilib-fixes.patch
smart-rpm-extra-macros.patch
smart-rpm-md-parse.patch
smart-rpm-root.patch
smart-tmpdir.patch
smart-yaml-error.patch

* Update the following patches, part of the code are already in the
  source:
smart-attempt.patch
smart-improve-error-reporting.patch
smart-recommends.patch
smartpm-rpm5-nodig.patch

* Use github and git repo as the SRC_URI.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python-smartpm/smart-attempt.patch      |  164 ++-
 .../smart-config-ignore-all-recommends.patch       |   24 -
 .../python-smartpm/smart-conflict-provider.patch   |  196 ----
 .../python/python-smartpm/smart-dflags.patch       |   45 -
 .../python-smartpm/smart-filename-NAME_MAX.patch   |   35 -
 .../smart-flag-exclude-packages.patch              |   70 --
 .../smart-flag-ignore-recommends.patch             |   60 --
 .../smart-improve-error-reporting.patch            |  168 +---
 .../python-smartpm/smart-metadata-match.patch      |   28 -
 .../python-smartpm/smart-multilib-fixes.patch      |   22 -
 .../python/python-smartpm/smart-recommends.patch   | 1051 +-------------------
 .../python-smartpm/smart-rpm-extra-macros.patch    |   27 -
 .../python/python-smartpm/smart-rpm-md-parse.patch |   26 -
 .../python/python-smartpm/smart-rpm-root.patch     |   80 --
 .../python/python-smartpm/smart-tmpdir.patch       |   30 -
 .../python/python-smartpm/smart-yaml-error.patch   |   86 --
 .../python/python-smartpm/smartpm-rpm5-nodig.patch |   47 +-
 ...thon-smartpm_1.4.1.bb => python-smartpm_git.bb} |   23 +-
 18 files changed, 132 insertions(+), 2050 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch
 rename meta/recipes-devtools/python/{python-smartpm_1.4.1.bb => python-smartpm_git.bb} (84%)

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
index 82d2e6c..ec98e03 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
@@ -18,38 +18,68 @@ Upstream-Status: Pending
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 ---
- smart.py                  |  5 +++-
- smart/commands/install.py |  5 ++++
- smart/transaction.py      | 65 +++++++++++++++++++++++++++++++++++------------
- 3 files changed, 58 insertions(+), 17 deletions(-)
+ backends/rpm/pm.py |   35 ++++++++++++++++++++++++++++++++++-
+ transaction.py     |   50 +++++++++++++++++++++++++++++++++++++-------------
+ 2 files changed, 71 insertions(+), 14 deletions(-)
 
-Index: smart-1.4.1/smart/commands/install.py
-===================================================================
---- smart-1.4.1.orig/smart/commands/install.py
-+++ smart-1.4.1/smart/commands/install.py
-@@ -50,6 +50,8 @@ def option_parser():
-     parser = OptionParser(usage=USAGE,
-                           description=DESCRIPTION,
-                           examples=EXAMPLES)
-+    parser.add_option("--attempt", action="store_true",
-+                      help=_("attempt to install packages, ignore failures"))
-     parser.add_option("--stepped", action="store_true",
-                       help=_("split operation in steps"))
-     parser.add_option("--urls", action="store_true",
-@@ -80,6 +82,9 @@ def main(ctrl, opts):
-     if not opts.args:
-         raise Error, _("no package(s) given")
- 
-+    if opts.attempt:
-+	sysconf.set("attempt-install", True, soft=True)
+diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py
+index 9bbd952..ba6405a 100644
+--- a/smart/backends/rpm/pm.py
++++ b/smart/backends/rpm/pm.py
+@@ -241,15 +241,48 @@ class RPMPackageManager(PackageManager):
+         cb = RPMCallback(prog, upgradednames)
+         cb.grabOutput(True)
+         probs = None
++        retry = 0
+         try:
+             probs = ts.run(cb, None)
+         finally:
+             del getTS.ts
+             cb.grabOutput(False)
++            if probs and sysconf.has("attempt-install", soft=True):
++                def remove_conflict(pkgNEVR):
++                    for key in changeset.keys():
++                        if pkgNEVR == str(key):
++                            del changeset[key]
++                            del pkgpaths[key]
++                            iface.warning("Removing %s due to file %s conflicting with %s" % (pkgNEVR, fname, altNEVR))
++                            break
++
++                retry = 1
++                for prob in probs:
++                    if prob[1][0] == rpm.RPMPROB_NEW_FILE_CONFLICT:
++                        msg = prob[0].split()
++                        fname = msg[1]
++                        pkgNEVR = msg[7]
++                        altNEVR = msg[9]
++                        pkgNEVR = pkgNEVR.rsplit('.', 1)[0] + '@' + pkgNEVR.rsplit('.', 1)[1]
++                        altNEVR = altNEVR.rsplit('.', 1)[0] + '@' + altNEVR.rsplit('.', 1)[1]
++                        remove_conflict(pkgNEVR)
++                    elif prob[1][0] == rpm.RPMPROB_FILE_CONFLICT:
++                        msg = prob[0].split()
++                        fname = msg[1]
++                        pkgNEVR = msg[5]
++                        altNEVR = msg[11]
++                        pkgNEVR = pkgNEVR.rsplit('.', 1)[0] + '@' + pkgNEVR.rsplit('.', 1)[1]
++                        altNEVR = altNEVR.rsplit('.', 1)[0] + '@' + altNEVR.rsplit('.', 1)[1]
++                        remove_conflict(pkgNEVR)
++                    else:
++                        retry = 0
 +
-     if opts.explain:
-         sysconf.set("explain-changesets", True, soft=True)
+             prog.setDone()
+-            if probs:
++            if probs and (not retry):
+                 raise Error, "\n".join([x[0] for x in probs])
+             prog.stop()
++            if retry and len(changeset):
++                self.commit(changeset, pkgpaths)
  
-Index: smart-1.4.1/smart/transaction.py
-===================================================================
---- smart-1.4.1.orig/smart/transaction.py
-+++ smart-1.4.1/smart/transaction.py
+ class RPMCallback:
+     def __init__(self, prog, upgradednames):
+diff --git a/smart/transaction.py b/smart/transaction.py
+index 4b90cb7..3e043e9 100644
+--- a/smart/transaction.py
++++ b/smart/transaction.py
 @@ -555,6 +555,8 @@ class Transaction(object):
          changeset.set(pkg, INSTALL)
          isinst = changeset.installed
@@ -145,79 +175,3 @@ Index: smart-1.4.1/smart/transaction.py
                      changeset.set(pkg, INSTALL)
                      locked[pkg] = (LOCKED_INSTALL, None)
                  elif op is REMOVE:
-@@ -1216,9 +1240,18 @@ class Transaction(object):
-                     else:
-                         op = REMOVE
-                 if op is INSTALL or op is REINSTALL:
--                    self._install(pkg, changeset, locked, pending)
--                    if pkg in changeset:
--                        changeset.setRequested(pkg, True)
-+                    try:
-+                        self._install(pkg, changeset, locked, pending)
-+                        if pkg in changeset:
-+                            changeset.setRequested(pkg, True)
-+                    except Failed, e:
-+                        if attempt:
-+                            iface.warning(_("Can't install %s: %s") % (pkg, e))
-+                            if pkg in changeset:
-+                                del changeset[pkg]
-+                            continue
-+                        else:
-+                            raise Failed, e
-                 elif op is REMOVE:
-                     self._remove(pkg, changeset, locked, pending)
-                 elif op is UPGRADE:
-Index: smart-1.4.1/smart/backends/rpm/pm.py
-===================================================================
---- smart-1.4.1.orig/smart/backends/rpm/pm.py
-+++ smart-1.4.1/smart/backends/rpm/pm.py
-@@ -243,15 +253,48 @@ class RPMPackageManager(PackageManager):
-         cb = RPMCallback(prog, upgradednames)
-         cb.grabOutput(True)
-         probs = None
-+        retry = 0
-         try:
-             probs = ts.run(cb, None)
-         finally:
-             del getTS.ts
-             cb.grabOutput(False)
-+            if probs and sysconf.has("attempt-install", soft=True):
-+                def remove_conflict(pkgNEVR):
-+                    for key in changeset.keys():
-+                        if pkgNEVR == str(key):
-+                            del changeset[key]
-+                            del pkgpaths[key]
-+                            iface.warning("Removing %s due to file %s conflicting with %s" % (pkgNEVR, fname, altNEVR))
-+                            break
-+
-+                retry = 1
-+                for prob in probs:
-+                    if prob[1][0] == rpm.RPMPROB_NEW_FILE_CONFLICT:
-+                        msg = prob[0].split()
-+                        fname = msg[1]
-+                        pkgNEVR = msg[7]
-+                        altNEVR = msg[9]
-+                        pkgNEVR = pkgNEVR.rsplit('.', 1)[0] + '@' + pkgNEVR.rsplit('.', 1)[1]
-+                        altNEVR = altNEVR.rsplit('.', 1)[0] + '@' + altNEVR.rsplit('.', 1)[1]
-+                        remove_conflict(pkgNEVR)
-+                    elif prob[1][0] == rpm.RPMPROB_FILE_CONFLICT:
-+                        msg = prob[0].split()
-+                        fname = msg[1]
-+                        pkgNEVR = msg[5]
-+                        altNEVR = msg[11]
-+                        pkgNEVR = pkgNEVR.rsplit('.', 1)[0] + '@' + pkgNEVR.rsplit('.', 1)[1]
-+                        altNEVR = altNEVR.rsplit('.', 1)[0] + '@' + altNEVR.rsplit('.', 1)[1]
-+                        remove_conflict(pkgNEVR)
-+                    else:
-+                        retry = 0
-+
-             prog.setDone()
--            if probs:
-+            if probs and (not retry):
-                 raise Error, "\n".join([x[0] for x in probs])
-             prog.stop()
-+            if retry and len(changeset):
-+                self.commit(changeset, pkgpaths)
- 
- class RPMCallback:
-     def __init__(self, prog, upgradednames):
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch b/meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch
deleted file mode 100644
index df9d779..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Add a simple method to disable the install of recommended packages
-
-Upstream-Status: Pending
-
-Usage:
-   smart config --set ignore-all-recommends=1
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: smart-1.4.1/smart/transaction.py
-===================================================================
---- smart-1.4.1.orig/smart/transaction.py
-+++ smart-1.4.1/smart/transaction.py
-@@ -611,7 +611,9 @@ class Transaction(object):
-             for prv in req.providedby:
-                 for prvpkg in prv.packages:
-                     if not reqrequired:
--                        if pkgconf.testFlag("ignore-recommends", prvpkg):
-+                        if sysconf.get("ignore-all-recommends", 0) == 1:
-+                            continue
-+                        elif pkgconf.testFlag("ignore-recommends", prvpkg):
-                             continue
-                     if isinst(prvpkg):
-                         found = True
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch b/meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch
deleted file mode 100644
index 10a7447..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-Report a reason when a dependency could not be installed because it is locked
-
-If a requirement of a package is conflicted, depending on how the
-solution is reached, the transaction code may eliminate all providers
-of the requirement and then error out because nothing provides them. To
-work around this, store a reason in the locked dict and report that back
-if we need to, so for example instead of:
-
-  error: Can't install packagegroup-core-ssh-dropbear-1.0-r1@all: no package provides dropbear
-
-we now get:
-
-  error: Can't install packagegroup-core-ssh-dropbear-1.0-r1@all: unable to install provider for dropbear:
-  error:     dropbear-2013.58-r1.0@armv5te is conflicted by openssh-sshd-6.2p2-r0@armv5te
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- smart/const.py       |  7 +++++++
- smart/transaction.py | 58 +++++++++++++++++++++++++++++++++++++++++-----------
- 2 files changed, 53 insertions(+), 12 deletions(-)
-
-diff --git a/smart/const.py b/smart/const.py
-index 4d8e5cb..67c1ac5 100644
---- a/smart/const.py
-+++ b/smart/const.py
-@@ -70,4 +70,11 @@ DATADIR     = "/var/lib/smart/"
- USERDATADIR = "~/.smart/"
- CONFFILE    = "config"
- 
-+LOCKED_INSTALL     = Enum('LOCKED_INSTALL')
-+LOCKED_REMOVE      = Enum('LOCKED_REMOVE')
-+LOCKED_CONFLICT    = Enum('LOCKED_CONFLICT')
-+LOCKED_CONFLICT_BY = Enum('LOCKED_CONFLICT_BY')
-+LOCKED_NO_COEXIST  = Enum('LOCKED_NO_COEXIST')
-+LOCKED_SYSCONF     = Enum('LOCKED_SYSCONF')
-+
- # vim:ts=4:sw=4:et
-diff --git a/smart/transaction.py b/smart/transaction.py
-index 300b9cc..dd9aa38 100644
---- a/smart/transaction.py
-+++ b/smart/transaction.py
-@@ -19,10 +19,31 @@
- # along with Smart Package Manager; if not, write to the Free Software
- # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- #
--from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP
-+from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP, LOCKED_INSTALL, LOCKED_CONFLICT, LOCKED_CONFLICT_BY, LOCKED_NO_COEXIST, LOCKED_SYSCONF, LOCKED_REMOVE
- from smart.cache import PreRequires, Package
- from smart import *
- 
-+def lock_reason(pkg, lockvalue):
-+    try:
-+        (reason, otherpkg) = lockvalue
-+    except TypeError:
-+        reason = None
-+        lockvalue = None
-+    if reason == LOCKED_INSTALL:
-+        return _("%s is to be installed") % pkg
-+    elif reason == LOCKED_CONFLICT:
-+        return _("%s conflicts with %s") % (pkg, otherpkg)
-+    elif reason ==  LOCKED_CONFLICT_BY:
-+        return _("%s is conflicted by %s") % (pkg, otherpkg)
-+    elif reason ==  LOCKED_NO_COEXIST:
-+        return _("%s cannot coexist with %s") % (pkg, otherpkg)
-+    elif reason ==  LOCKED_SYSCONF:
-+        return _("%s is locked in system configuration") % pkg
-+    elif reason ==  LOCKED_REMOVE:
-+        return _("%s is to be removed") % pkg
-+    else:
-+        return _("%s is locked (unknown reason)") % pkg
-+
- class ChangeSet(dict):
- 
-     def __init__(self, cache, state=None, requested=None):
-@@ -187,7 +208,7 @@ class Policy(object):
-         for pkg in pkgconf.filterByFlag("lock", cache.getPackages()):
-             if pkg not in self._locked:
-                 self._sysconflocked.append(pkg)
--                self._locked[pkg] = True
-+                self._locked[pkg] = (LOCKED_SYSCONF, None)
- 
-     def runFinished(self):
-         self._priorities.clear()
-@@ -524,7 +545,7 @@ class Transaction(object):
-         if ownpending:
-             pending = []
- 
--        locked[pkg] = True
-+        locked[pkg] = (LOCKED_INSTALL, None)
-         changeset.set(pkg, INSTALL)
-         isinst = changeset.installed
- 
-@@ -535,7 +556,7 @@ class Transaction(object):
-                     if prvpkg is pkg:
-                         continue
-                     if not isinst(prvpkg):
--                        locked[prvpkg] = True
-+                        locked[prvpkg] = (LOCKED_CONFLICT_BY, pkg)
-                         continue
-                     if prvpkg in locked:
-                         raise Failed, _("Can't install %s: conflicted package "
-@@ -550,7 +571,7 @@ class Transaction(object):
-                     if cnfpkg is pkg:
-                         continue
-                     if not isinst(cnfpkg):
--                        locked[cnfpkg] = True
-+                        locked[cnfpkg] = (LOCKED_CONFLICT, pkg)
-                         continue
-                     if cnfpkg in locked:
-                         raise Failed, _("Can't install %s: it's conflicted by "
-@@ -565,7 +586,7 @@ class Transaction(object):
-         for namepkg in namepkgs:
-             if namepkg is not pkg and not pkg.coexists(namepkg):
-                 if not isinst(namepkg):
--                    locked[namepkg] = True
-+                    locked[namepkg] = (LOCKED_NO_COEXIST, pkg)
-                     continue
-                 if namepkg in locked:
-                     raise Failed, _("Can't install %s: it can't coexist "
-@@ -577,6 +598,7 @@ class Transaction(object):
- 
-             # Check if someone is already providing it.
-             prvpkgs = {}
-+            lockedpkgs = {}
-             found = False
-             for prv in req.providedby:
-                 for prvpkg in prv.packages:
-@@ -585,6 +607,8 @@ class Transaction(object):
-                         break
-                     if prvpkg not in locked:
-                         prvpkgs[prvpkg] = True
-+                    else:
-+                        lockedpkgs[prvpkg] = locked[prvpkg]
-                 else:
-                     continue
-                 break
-@@ -597,7 +621,17 @@ class Transaction(object):
-             if not prvpkgs:
-                 # No packages provide it at all. Give up.
-                 if req in pkg.requires:
--                    raise Failed, _("Can't install %s: no package provides %s") % \
-+                    reasons = []
-+                    for prv in req.providedby:
-+                        for prvpkg in prv.packages:
-+                            lockedres = lockedpkgs.get(prvpkg, None)
-+                            if lockedres:
-+                                reasons.append(lock_reason(prvpkg, lockedres))
-+                    if reasons:
-+                        raise Failed, _("Can't install %s: unable to install provider for %s:\n    %s") % \
-+                                (pkg, req, '\n    '.join(reasons))
-+                    else:
-+                        raise Failed, _("Can't install %s: no package provides %s") % \
-                                 (pkg, req)
-                 else:
-                     # It's only a recommend, skip
-@@ -627,7 +661,7 @@ class Transaction(object):
-         if ownpending:
-             pending = []
- 
--        locked[pkg] = True
-+        locked[pkg] = (LOCKED_REMOVE, None)
-         changeset.set(pkg, REMOVE)
-         isinst = changeset.installed
- 
-@@ -1140,22 +1174,22 @@ class Transaction(object):
-                 if op is KEEP:
-                     if pkg in changeset:
-                         del changeset[pkg]
--                    locked[pkg] = True
-+                    locked[pkg] = (LOCKED_KEEP, None)
-                 elif op is INSTALL:
-                     if not isinst(pkg) and pkg in locked:
-                         raise Failed, _("Can't install %s: it's locked") % pkg
-                     changeset.set(pkg, INSTALL)
--                    locked[pkg] = True
-+                    locked[pkg] = (LOCKED_INSTALL, None)
-                 elif op is REMOVE:
-                     if isinst(pkg) and pkg in locked:
-                         raise Failed, _("Can't remove %s: it's locked") % pkg
-                     changeset.set(pkg, REMOVE)
--                    locked[pkg] = True
-+                    locked[pkg] = (LOCKED_REMOVE, None)
-                 elif op is REINSTALL:
-                     if pkg in locked:
-                         raise Failed, _("Can't reinstall %s: it's locked")%pkg
-                     changeset.set(pkg, INSTALL, force=True)
--                    locked[pkg] = True
-+                    locked[pkg] = (LOCKED_INSTALL, None)
-                 elif op is UPGRADE:
-                     pass
- 
--- 
-1.8.1.2
-
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch b/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
deleted file mode 100644
index 531ea51..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-backends/rpm: add support for setting dependency flags
-
-This is useful for OpenEmbedded so that we can do the equivalent of
-the --nolinktos and --noparentdirs rpm command line options.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-[sgw - Added try/catch for rpm4 since it does not have setDFlags() API]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-
-Index: smart-1.4.1/smart/backends/rpm/pm.py
-===================================================================
---- smart-1.4.1.orig/smart/backends/rpm/pm.py
-+++ smart-1.4.1/smart/backends/rpm/pm.py
-@@ -106,6 +106,26 @@ class RPMPackageManager(PackageManager):
-             flags |= rpm.RPMTRANS_FLAG_TEST
-         ts.setFlags(flags)
- 
-+        try:
-+            dflags = ts.setDFlags(0)
-+            if sysconf.get("rpm-noupgrade", False):
-+                dflags |= rpm.RPMDEPS_FLAG_NOUPGRADE
-+            if sysconf.get("rpm-norequires", False):
-+                dflags |= rpm.RPMDEPS_FLAG_NOREQUIRES
-+            if sysconf.get("rpm-noconflicts", False):
-+                dflags |= rpm.RPMDEPS_FLAG_NOCONFLICTS
-+            if sysconf.get("rpm-noobsoletes", False):
-+                dflags |= rpm.RPMDEPS_FLAG_NOOBSOLETES
-+            if sysconf.get("rpm-noparentdirs", False):
-+                dflags |= rpm.RPMDEPS_FLAG_NOPARENTDIRS
-+            if sysconf.get("rpm-nolinktos", False):
-+                dflags |= rpm.RPMDEPS_FLAG_NOLINKTOS
-+            if sysconf.get("rpm-nosuggest", False):
-+                dflags |= rpm.RPMDEPS_FLAG_NOSUGGEST
-+            ts.setDFlags(dflags)
-+        except AttributeError, ae:
-+            pass
-+
-         # Set rpm verbosity level.
-         levelname = sysconf.get('rpm-log-level')
-         level = {
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch b/meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch
deleted file mode 100644
index 22794a7..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-filename-NAME_MAX.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a17998b6be3319ae476a64f366737bc267a53a8a Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 16 Sep 2013 05:54:13 -0400
-Subject: [PATCH] fetcher.py: truncate the filename to meet NAME_MAX
-
-The function getLocalPath() converts the filepath into the filename,
-there would be a "File name too long" error when len(filename) >
-NAME_MAX, truncate it to meet NAME_MAX will fix the problem.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- smart/fetcher.py |    8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/smart/fetcher.py b/smart/fetcher.py
---- a/smart/fetcher.py
-+++ b/smart/fetcher.py
-@@ -139,6 +139,14 @@ class Fetcher(object):
-             filename = os.path.basename(path)
-         if self._localpathprefix:
-             filename = self._localpathprefix+filename
-+        # pathconf requires the path existed
-+        if not os.path.exists(self._localdir):
-+            os.makedirs(self._localdir)
-+        name_max = os.pathconf(self._localdir, 'PC_NAME_MAX')
-+        # The length of the filename should be less than NAME_MAX
-+        if len(filename) > name_max:
-+            iface.debug(_("Truncate %s to %s") % (filename, filename[-name_max:]))
-+            filename = filename[-name_max:]
-         return os.path.join(self._localdir, filename)
- 
-     def setForceCopy(self, value):
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch b/meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch
deleted file mode 100644
index 21a2874..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Add exclude-packages flag support
-
-Allow configuring specific packages to be excluded.  This will allow
-users to specify things NOT to install, and if they are attempted an
-error will be generated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: smart-1.4.1/smart/const.py
-===================================================================
---- smart-1.4.1.orig/smart/const.py
-+++ smart-1.4.1/smart/const.py
-@@ -70,6 +70,7 @@ DATADIR     = "/var/lib/smart/"
- USERDATADIR = "~/.smart/"
- CONFFILE    = "config"
- 
-+LOCKED_EXCLUDE     = Enum('LOCKED_EXCLUDE')
- LOCKED_INSTALL     = Enum('LOCKED_INSTALL')
- LOCKED_REMOVE      = Enum('LOCKED_REMOVE')
- LOCKED_CONFLICT    = Enum('LOCKED_CONFLICT')
-Index: smart-1.4.1/smart/transaction.py
-===================================================================
---- smart-1.4.1.orig/smart/transaction.py
-+++ smart-1.4.1/smart/transaction.py
-@@ -19,7 +19,7 @@
- # along with Smart Package Manager; if not, write to the Free Software
- # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- #
--from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP, LOCKED_INSTALL, LOCKED_CONFLICT, LOCKED_CONFLICT_BY, LOCKED_NO_COEXIST, LOCKED_SYSCONF, LOCKED_REMOVE
-+from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP, LOCKED_EXCLUDE, LOCKED_INSTALL, LOCKED_CONFLICT, LOCKED_CONFLICT_BY, LOCKED_NO_COEXIST, LOCKED_SYSCONF, LOCKED_REMOVE
- from smart.cache import PreRequires, Package
- from smart import *
- 
-@@ -29,7 +29,9 @@ def lock_reason(pkg, lockvalue):
-     except TypeError:
-         reason = None
-         lockvalue = None
--    if reason == LOCKED_INSTALL:
-+    if reason == LOCKED_EXCLUDE:
-+        return _("%s is to be excluded") % pkg
-+    elif reason == LOCKED_INSTALL:
-         return _("%s is to be installed") % pkg
-     elif reason == LOCKED_CONFLICT:
-         return _("%s conflicts with %s") % (pkg, otherpkg)
-@@ -210,6 +212,10 @@ class Policy(object):
-                 self._sysconflocked.append(pkg)
-                 self._locked[pkg] = (LOCKED_SYSCONF, None)
- 
-+        for pkg in pkgconf.filterByFlag("exclude-packages", cache.getPackages()):
-+            if pkg not in self._locked:
-+                self._locked[pkg] = (LOCKED_EXCLUDE, None)
-+
-     def runFinished(self):
-         self._priorities.clear()
-         for pkg in self._sysconflocked:
-Index: smart-1.4.1/smart/commands/flag.py
-===================================================================
---- smart-1.4.1.orig/smart/commands/flag.py
-+++ smart-1.4.1/smart/commands/flag.py
-@@ -47,6 +47,8 @@ Currently known flags are:
-   multi-version - Flagged packages may have more than one version
-                   installed in the system at the same time
-                   (backend dependent).
-+  exclude-packages - Flagged packages will be excluded, if they are
-+                  required, an error will be generated.
-   ignore-recommends - Flagged packages will not be installed, if
-                   they are only recommended by a package to be
-                   installed rather than required.
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch b/meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch
deleted file mode 100644
index 5d5c6f4..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Add ignore-recommends flag support
-
-Allow configuring recommends on specific packages to be ignored.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- smart/commands/flag.py | 3 +++
- smart/transaction.py   | 7 ++++++-
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/smart/commands/flag.py b/smart/commands/flag.py
-index 8b90496..191bb11 100644
---- a/smart/commands/flag.py
-+++ b/smart/commands/flag.py
-@@ -47,6 +47,9 @@ Currently known flags are:
-   multi-version - Flagged packages may have more than one version
-                   installed in the system at the same time
-                   (backend dependent).
-+  ignore-recommends - Flagged packages will not be installed, if
-+                  they are only recommended by a package to be
-+                  installed rather than required.
- 
-   security      - Flagged packages are updates for security errata.
-   bugfix        - Flagged packages are updates for bugfix errata.
-diff --git a/smart/transaction.py b/smart/transaction.py
-index dd9aa38..38eabae 100644
---- a/smart/transaction.py
-+++ b/smart/transaction.py
-@@ -596,12 +596,17 @@ class Transaction(object):
-         # Install packages required by this one.
-         for req in pkg.requires + pkg.recommends:
- 
-+            reqrequired = req in pkg.requires
-+
-             # Check if someone is already providing it.
-             prvpkgs = {}
-             lockedpkgs = {}
-             found = False
-             for prv in req.providedby:
-                 for prvpkg in prv.packages:
-+                    if not reqrequired:
-+                        if pkgconf.testFlag("ignore-recommends", prvpkg):
-+                            continue
-                     if isinst(prvpkg):
-                         found = True
-                         break
-@@ -620,7 +625,7 @@ class Transaction(object):
- 
-             if not prvpkgs:
-                 # No packages provide it at all. Give up.
--                if req in pkg.requires:
-+                if reqrequired:
-                     reasons = []
-                     for prv in req.providedby:
-                         for prvpkg in prv.packages:
--- 
-1.8.1.2
-
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch b/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
index 2ca0f6d..b82265b 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
@@ -8,170 +8,8 @@ Upstream-Status: Pending
 
 Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
 
-diff --git a/smart/commands/channel.py b/smart/commands/channel.py
-index aa76f91..63fbb35 100644
---- a/smart/commands/channel.py
-+++ b/smart/commands/channel.py
-@@ -157,7 +157,17 @@ def main(ctrl, opts):
-                               opts.show is None and opts.yaml is None):
-         iface.warning(_("Can't edit channels information."))
-         raise Error, _("Configuration is in readonly mode.")
--    
-+
-+    # Argument check
-+    opts.check_args_of_option("set", -1)
-+    opts.check_args_of_option("remove", -1)
-+    opts.check_args_of_option("edit", 0)
-+    opts.check_args_of_option("enable", -1)
-+    opts.check_args_of_option("disable", -1)
-+    opts.ensure_action("channel", ["add", "set", "remove", "remove_all",
-+                       "list", "show", "yaml", "enable", "disable"])
-+    opts.check_remaining_args()
-+
-     if opts.add is not None:
-         if not opts.add and opts.args == ["-"]:
-             newchannels = []
-diff --git a/smart/commands/check.py b/smart/commands/check.py
-index b08608a..506e852 100644
---- a/smart/commands/check.py
-+++ b/smart/commands/check.py
-@@ -72,6 +72,9 @@ def parse_options(argv):
- 
- def main(ctrl, opts, reloadchannels=True):
- 
-+    # Argument check
-+    opts.check_args_of_option("channels", 1)
-+
-     if sysconf.get("auto-update"):
-         from smart.commands import update
-         updateopts = update.parse_options([])
-diff --git a/smart/commands/config.py b/smart/commands/config.py
-index dd50dee..4fe4366 100644
---- a/smart/commands/config.py
-+++ b/smart/commands/config.py
-@@ -80,6 +80,12 @@ def main(ctrl, opts):
-     globals["false"] = False
-     globals["no"] = False
- 
-+    # Check arguments
-+    opts.check_args_of_option("set", -1)
-+    opts.check_args_of_option("remove", -1)
-+    opts.ensure_action("config", ["set", "show", "yaml", "remove"])
-+    opts.check_remaining_args()
-+
-     if opts.set:
-         for opt in opts.set:
-             m = SETRE.match(opt)
-diff --git a/smart/commands/download.py b/smart/commands/download.py
-index 6837993..b853c61 100644
---- a/smart/commands/download.py
-+++ b/smart/commands/download.py
-@@ -81,6 +81,14 @@ def parse_options(argv):
- 
- def main(ctrl, opts):
- 
-+    # Argument check
-+    opts.check_args_of_option("target", 1)
-+    opts.check_args_of_option("output", 1)
-+    opts.check_args_of_option("from_urls", -1)
-+    opts.check_args_of_option("from_metalink", -1)
-+    if not opts.args and not opts.from_metalink and not opts.from_urls:
-+        raise Error, _("no package(s) given")
-+
-     packages = []
-     if opts.args:
-         if sysconf.get("auto-update"):
-diff --git a/smart/commands/info.py b/smart/commands/info.py
-index 12f74f0..59fbe98 100644
---- a/smart/commands/info.py
-+++ b/smart/commands/info.py
-@@ -58,6 +58,10 @@ def parse_options(argv):
- 
- def main(ctrl, opts, reloadchannels=True):
- 
-+    # Argument check
-+    if not opts.args:
-+      raise Error, _("No package(s) given")
-+
-     if sysconf.get("auto-update"):
-         from smart.commands import update
-         updateopts = update.parse_options([])
-diff --git a/smart/commands/install.py b/smart/commands/install.py
-index 8a45954..590222c 100644
---- a/smart/commands/install.py
-+++ b/smart/commands/install.py
-@@ -76,6 +76,10 @@ def parse_options(argv):
- 
- def main(ctrl, opts):
-  
-+    # Argument check
-+    if not opts.args:
-+        raise Error, _("no package(s) given")
-+
-     if opts.explain:
-         sysconf.set("explain-changesets", True, soft=True)
- 
-diff --git a/smart/commands/reinstall.py b/smart/commands/reinstall.py
-index e59d896..32da3e6 100644
---- a/smart/commands/reinstall.py
-+++ b/smart/commands/reinstall.py
-@@ -68,7 +68,11 @@ def parse_options(argv):
-     return opts
- 
- def main(ctrl, opts):
--    
-+
-+    # Argument check
-+    if not opts.args:
-+        raise Error, _("no package(s) given")
-+
-     if opts.explain:
-         sysconf.set("explain-changesets", True, soft=True)
- 
-diff --git a/smart/commands/remove.py b/smart/commands/remove.py
-index b4823a6..acd3bbd 100644
---- a/smart/commands/remove.py
-+++ b/smart/commands/remove.py
-@@ -74,6 +74,10 @@ def parse_options(argv):
- 
- def main(ctrl, opts):
- 
-+    # Argument check
-+    if not opts.args:
-+        raise Error, _("no package(s) given")
-+
-     if opts.explain:
-         sysconf.set("explain-changesets", True, soft=True)
- 
-diff --git a/smart/commands/search.py b/smart/commands/search.py
-index 0d0b573..44806b8 100644
---- a/smart/commands/search.py
-+++ b/smart/commands/search.py
-@@ -44,6 +44,8 @@ def option_parser():
- def parse_options(argv):
-     opts = query.parse_options(argv, usage=USAGE, \
-                                description=DESCRIPTION, examples=EXAMPLES)
-+    if not argv:
-+      raise Error, _("Search expression not specified")
-     opts.name = opts.args
-     opts.summary = opts.args
-     opts.description = opts.args
-diff --git a/smart/commands/upgrade.py b/smart/commands/upgrade.py
-index ec86290..7e290d8 100644
---- a/smart/commands/upgrade.py
-+++ b/smart/commands/upgrade.py
-@@ -91,6 +91,9 @@ def parse_options(argv):
- 
- def main(ctrl, opts):
- 
-+    # Argument check
-+    opts.check_args_of_option("flag", 1)
-+
-     if opts.explain:
-         sysconf.set("explain-changesets", True, soft=True)
- 
 diff --git a/smart/util/optparse.py b/smart/util/optparse.py
-index 4a3d3a8..279b0bf 100644
+index 6fff1bc..f445a3b 100644
 --- a/smart/util/optparse.py
 +++ b/smart/util/optparse.py
 @@ -70,6 +70,8 @@ import sys, os
@@ -183,7 +21,7 @@ index 4a3d3a8..279b0bf 100644
  
  def _repr(self):
      return "<%s at 0x%x: %s>" % (self.__class__.__name__, id(self), self)
-@@ -708,6 +710,12 @@ class Option:
+@@ -710,6 +712,12 @@ class Option:
              self.action, self.dest, opt, value, values, parser)
  
      def take_action(self, action, dest, opt, value, values, parser):
@@ -196,7 +34,7 @@ index 4a3d3a8..279b0bf 100644
          if action == "store":
              setattr(values, dest, value)
          elif action == "store_const":
-@@ -819,6 +827,54 @@ class Values:
+@@ -821,6 +829,54 @@ class Values:
              setattr(self, attr, value)
          return getattr(self, attr)
  
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch b/meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch
deleted file mode 100644
index d06f416..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-smart - backends/rmp/metadata.py: Fix incorrect call to the match function
-
-The match function should take three parameters, name, comparison, version...
-The original code was passing it a reference to the object holding the data
-instead, which caused the comparison in match to always fail.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
---- a/smart/backends/rpm/metadata.py
-+++ b/smart/backends/rpm/metadata.py
-@@ -332,13 +332,13 @@
-                     reqargs = [x for x in reqdict
-                                if not ((x[2] is None or "=" in x[2]) and
-                                        (RPMProvides, x[1], x[3]) in prvdict or
--                                       system_provides.match(*x[:3]))]
-+                                       system_provides.match(x[1], x[2], x[3]))]
-                     reqargs = collapse_libc_requires(reqargs)
- 
-                     recargs = [x for x in recdict
-                                if not ((x[2] is None or "=" in x[2]) and
-                                        (RPMProvides, x[1], x[3]) in prvdict or
--                                       system_provides.match(*x[:3]))]
-+                                       system_provides.match(x[1], x[2], x[3]))]
- 
-                     prvargs = prvdict.keys()
-                     cnfargs = cnfdict.keys()
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch b/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
deleted file mode 100644
index 56fef79..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-To fix some multilib issues, change the way the RPM backend decides
-if two packages can coexist: if they have a different architecture,
-automatically assume that they can coexist (which is fundamental for
-multilib).
-
-Upstream-Status: Pending
-
-Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
-
-diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
-index 6e83d40..7140c1b 100644
---- a/smart/backends/rpm/base.py
-+++ b/smart/backends/rpm/base.py
-@@ -228,6 +228,8 @@ class RPMPackage(Package):
-             return False
-         selfver, selfarch = splitarch(self.version)
-         otherver, otherarch = splitarch(other.version)
-+        if selfarch != otherarch:
-+            return True
-         selfcolor = getArchColor(selfarch)
-         othercolor = getArchColor(otherarch)
-         if (selfcolor and othercolor and selfcolor != othercolor and
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-recommends.patch b/meta/recipes-devtools/python/python-smartpm/smart-recommends.patch
index a41b1be..d607fc4 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-recommends.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-recommends.patch
@@ -10,10 +10,10 @@ Upstream-Status: Pending
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
 diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
-index 0489e11..b9e9cb2 100644
+index 9332ea0..4fcfbee 100644
 --- a/smart/backends/rpm/base.py
 +++ b/smart/backends/rpm/base.py
-@@ -198,6 +198,29 @@ class RPMPackage(Package):
+@@ -225,6 +225,52 @@ class RPMPackage(Package):
                          break
                  else:
                      return False
@@ -40,413 +40,37 @@ index 0489e11..b9e9cb2 100644
 +                        break
 +                else:
 +                    return False
++        srecs = fk(self.recommends)
++        orecs = fk(other.recommends)
++        if srecs != orecs:
++            for srec in srecs:
++                if srec.name[0] == "/" or srec in orecs:
++                    continue
++                for orec in orecs:
++                    if (srec.name == orec.name and
++                        srec.relation == orec.relation and
++                        checkver(srec.version, orec.version)):
++                        break
++                else:
++                    return False
++            for orec in orecs:
++                if orec.name[0] == "/" or orec in srecs:
++                    continue
++                for srec in srecs:
++                    if (srec.name == orec.name and
++                        srec.relation == orec.relation and
++                        checkver(srec.version, orec.version)):
++                        break
++                else:
++                    return False
          return True
  
      def coexists(self, other):
-diff --git a/smart/backends/rpm/header.py b/smart/backends/rpm/header.py
-index 31786cc..4880f43 100644
---- a/smart/backends/rpm/header.py
-+++ b/smart/backends/rpm/header.py
-@@ -292,6 +292,7 @@ class RPMHeaderLoader(Loader):
-                     f = [0]
-                 elif type(f) != list:
-                     f = [f]
-+                recdict = {}
-                 reqdict = {}
-                 for i in range(len(n)):
-                     ni = n[i]
-@@ -308,10 +309,16 @@ class RPMHeaderLoader(Loader):
-                             # RPMSENSE_SCRIPT_PREUN |
-                             # RPMSENSE_SCRIPT_POST |
-                             # RPMSENSE_SCRIPT_POSTUN == 7744
--                            reqdict[(f[i]&7744 and PreReq or Req,
--                                     intern(ni), r, vi)] = True
-+                            if (f[i]&rpm.RPMSENSE_MISSINGOK):
-+                                recdict[(f[i]&7744 and PreReq or Req,
-+                                         intern(ni), r, vi)] = True
-+                            else:
-+                                reqdict[(f[i]&7744 and PreReq or Req,
-+                                         intern(ni), r, vi)] = True
-+                recargs = collapse_libc_requires(recdict.keys())
-                 reqargs = collapse_libc_requires(reqdict.keys())
-             else:
-+                recargs = None
-                 reqargs = None
- 
-             n = h[1054] # RPMTAG_CONFLICTNAME
-@@ -365,7 +372,7 @@ class RPMHeaderLoader(Loader):
-                 versionarch = "%s@%s" % (distversion, arch)
- 
-             pkg = self.buildPackage((Pkg, name, versionarch),
--                                    prvargs, reqargs, upgargs, cnfargs)
-+                                    prvargs, reqargs, upgargs, cnfargs, recargs)
-             pkg.loaders[self] = offset
-             self._offsets[offset] = pkg
-             self._groups[pkg] = intern(h[rpm.RPMTAG_GROUP])
-@@ -583,8 +590,8 @@ class URPMILoader(RPMHeaderListLoader):
-     def setErrataFlags(self, flagdict):
-         self._flagdict = flagdict
-     
--    def buildPackage(self, pkgargs, prvargs, reqargs, upgargs, cnfargs):
--        pkg = Loader.buildPackage(self, pkgargs, prvargs, reqargs, upgargs, cnfargs)
-+    def buildPackage(self, pkgargs, prvargs, reqargs, upgargs, cnfargs, recargs):
-+        pkg = Loader.buildPackage(self, pkgargs, prvargs, reqargs, upgargs, cnfargs, recargs)
-         name = pkgargs[1]
-         if hasattr(self, '_flagdict') and self._flagdict and name in self._flagdict:
-             if sysconf.getReadOnly():
-diff --git a/smart/backends/rpm/metadata.py b/smart/backends/rpm/metadata.py
-index 2c54f39..568fe06 100644
---- a/smart/backends/rpm/metadata.py
-+++ b/smart/backends/rpm/metadata.py
-@@ -165,6 +165,7 @@ class RPMMetaDataLoader(Loader):
-         distepoch = None
-         info = {}
-         reqdict = {}
-+        recdict = {}
-         prvdict = {}
-         upgdict = {}
-         cnfdict = {}
-@@ -287,12 +288,16 @@ class RPMMetaDataLoader(Loader):
- 
-                     lasttag = queue[-1].tag
-                     if lasttag == REQUIRES:
--                        if elem.get("pre") == "1":
--                            reqdict[(RPMPreRequires,
--                                     ename, erelation, eversion)] = True
-+                        if elem.get("missingok") == "1":
-+                            recdict[(RPMRequires,
-+                                    ename, erelation, eversion)] = True
-                         else:
--                            reqdict[(RPMRequires,
--                                     ename, erelation, eversion)] = True
-+                            if elem.get("pre") == "1":
-+                                reqdict[(RPMPreRequires,
-+                                        ename, erelation, eversion)] = True
-+                            else:
-+                                reqdict[(RPMRequires,
-+                                        ename, erelation, eversion)] = True
- 
-                     elif lasttag == PROVIDES:
-                         if ename[0] == "/":
-@@ -328,6 +333,12 @@ class RPMMetaDataLoader(Loader):
-                                        (RPMProvides, x[1], x[3]) in prvdict or
-                                        system_provides.match(*x[:3]))]
-                     reqargs = collapse_libc_requires(reqargs)
-+
-+                    recargs = [x for x in recdict
-+                               if not ((x[2] is None or "=" in x[2]) and
-+                                       (RPMProvides, x[1], x[3]) in prvdict or
-+                                       system_provides.match(*x[:3]))]
-+
-                     prvargs = prvdict.keys()
-                     cnfargs = cnfdict.keys()
-                     upgargs = upgdict.keys()
-@@ -339,7 +350,7 @@ class RPMMetaDataLoader(Loader):
-                         versionarch = "%s@%s" % (distversion, arch)
- 
-                     pkg = self.buildPackage((RPMPackage, name, versionarch),
--                                            prvargs, reqargs, upgargs, cnfargs)
-+                                            prvargs, reqargs, upgargs, cnfargs, recargs)
-                     pkg.loaders[self] = info
- 
-                     # Store the provided files for future usage.
-@@ -362,6 +373,7 @@ class RPMMetaDataLoader(Loader):
-                     distepoch = None
-                     pkgid = None
-                     reqdict.clear()
-+                    recdict.clear()
-                     prvdict.clear()
-                     upgdict.clear()
-                     cnfdict.clear()
-diff --git a/smart/cache.py b/smart/cache.py
-index b829825..cec8bb3 100644
---- a/smart/cache.py
-+++ b/smart/cache.py
-@@ -32,7 +32,8 @@ class Package(object):
-         self.name = name
-         self.version = version
-         self.provides = ()
--        self.requires = ()
-+        self.requires = []
-+        self.recommends = []
-         self.upgrades = ()
-         self.conflicts = ()
-         self.installed = False
-@@ -55,7 +56,9 @@ class Package(object):
-             fk([x for x in self.provides if x.name[0] != "/"]) !=
-             fk([x for x in other.provides if x.name[0] != "/"]) or
-             fk([x for x in self.requires if x.name[0] != "/"]) !=
--            fk([x for x in other.requires if x.name[0] != "/"])):
-+            fk([x for x in other.requires if x.name[0] != "/"]) or
-+            fk([x for x in self.recommends if x.name[0] != "/"]) !=
-+            fk([x for x in other.recommends if x.name[0] != "/"])):
-             return False
-         return True
- 
-@@ -110,6 +113,7 @@ class Package(object):
-                 self.version,
-                 self.provides,
-                 self.requires,
-+                self.recommends,
-                 self.upgrades,
-                 self.conflicts,
-                 self.installed,
-@@ -122,6 +126,7 @@ class Package(object):
-          self.version,
-          self.provides,
-          self.requires,
-+         self.recommends,
-          self.upgrades,
-          self.conflicts,
-          self.installed,
-@@ -274,6 +279,7 @@ class Provides(object):
-         self.version = version
-         self.packages = []
-         self.requiredby = ()
-+        self.recommendedby = ()
-         self.upgradedby = ()
-         self.conflictedby = ()
- 
-@@ -401,7 +407,7 @@ class Loader(object):
-     def loadFileProvides(self, fndict):
-         pass
- 
--    def buildPackage(self, pkgargs, prvargs, reqargs, upgargs, cnfargs):
-+    def buildPackage(self, pkgargs, prvargs, reqargs, upgargs, cnfargs, recargs = None):
-         cache = self._cache
-         pkg = pkgargs[0](*pkgargs[1:])
-         relpkgs = []
-@@ -427,6 +433,17 @@ class Loader(object):
-                 relpkgs.append(req.packages)
-                 pkg.requires.append(req)
- 
-+        if recargs:
-+            pkg.recommends = []
-+            for args in recargs:
-+                rec = cache._objmap.get(args)
-+                if not rec:
-+                    rec = args[0](*args[1:])
-+                    cache._objmap[args] = rec
-+                    cache._recommends.append(rec)
-+                relpkgs.append(rec.packages)
-+                pkg.recommends.append(rec)
-+
-         if upgargs:
-             pkg.upgrades = []
-             for args in upgargs:
-@@ -572,6 +589,7 @@ class Cache(object):
-         self._packages = []
-         self._provides = []
-         self._requires = []
-+        self._recommends = []
-         self._upgrades = []
-         self._conflicts = []
-         self._objmap = {}
-@@ -581,6 +599,8 @@ class Cache(object):
-             del prv.packages[:]
-             if prv.requiredby:
-                 del prv.requiredby[:]
-+            if prv.recommendedby:
-+                del prv.recommendedby[:]
-             if prv.upgradedby:
-                 del prv.upgradedby[:]
-             if prv.conflictedby:
-@@ -589,6 +609,10 @@ class Cache(object):
-             del req.packages[:]
-             if req.providedby:
-                 del req.providedby[:]
-+        for rec in self._recommends:
-+            del rec.packages[:]
-+            if rec.providedby:
-+                del rec.providedby[:]
-         for upg in self._upgrades:
-             del upg.packages[:]
-             if upg.providedby:
-@@ -600,6 +624,7 @@ class Cache(object):
-         del self._packages[:]
-         del self._provides[:]
-         del self._requires[:]
-+        del self._recommends[:]
-         del self._upgrades[:]
-         del self._conflicts[:]
-         self._objmap.clear()
-@@ -621,6 +646,7 @@ class Cache(object):
-         packages = {}
-         provides = {}
-         requires = {}
-+        recommends = {}
-         upgrades = {}
-         conflicts = {}
-         objmap = self._objmap
-@@ -646,6 +672,11 @@ class Cache(object):
-                         if req not in requires:
-                             objmap[req.getInitArgs()] = req
-                             requires[req] = True
-+                    for rec in pkg.recommends[:]:
-+                        rec.packages.append(pkg)
-+                        if rec not in recommends:
-+                            objmap[rec.getInitArgs()] = rec
-+                            recommends[rec] = True
-                     for upg in pkg.upgrades:
-                         upg.packages.append(pkg)
-                         if upg not in upgrades:
-@@ -659,6 +690,7 @@ class Cache(object):
-         self._packages[:] = packages.keys()
-         self._provides[:] = provides.keys()
-         self._requires[:] = requires.keys()
-+        self._recommends[:] = recommends.keys()
-         self._upgrades[:] = upgrades.keys()
-         self._conflicts[:] = conflicts.keys()
- 
-@@ -710,6 +742,14 @@ class Cache(object):
-                     lst.append(req)
-                 else:
-                     reqnames[name] = [req]
-+        recnames = {}
-+        for rec in self._recommends:
-+            for name in rec.getMatchNames():
-+                lst = recnames.get(name)
-+                if lst:
-+                    lst.append(rec)
-+                else:
-+                    recnames[name] = [rec]
-         upgnames = {}
-         for upg in self._upgrades:
-             for name in upg.getMatchNames():
-@@ -739,6 +779,18 @@ class Cache(object):
-                             prv.requiredby.append(req)
-                         else:
-                             prv.requiredby = [req]
-+            lst = recnames.get(prv.name)
-+            if lst:
-+                for rec in lst:
-+                    if rec.matches(prv):
-+                        if rec.providedby:
-+                            rec.providedby.append(prv)
-+                        else:
-+                            rec.providedby = [prv]
-+                        if prv.recommendedby:
-+                            prv.recommendedby.append(rec)
-+                        else:
-+                            prv.recommendedby = [rec]
-             lst = upgnames.get(prv.name)
-             if lst:
-                 for upg in lst:
-@@ -782,6 +834,12 @@ class Cache(object):
-         else:
-             return [x for x in self._requires if x.name == name]
- 
-+    def getRecommends(self, name=None):
-+        if not name:
-+            return self._recommends
-+        else:
-+            return [x for x in self._recommends if x.name == name]
-+
-     def getUpgrades(self, name=None):
-         if not name:
-             return self._upgrades
-@@ -807,6 +865,12 @@ class Cache(object):
-                 for req in self._requires:
-                     if prvname in req.getMatchNames() and req.matches(prv):
-                         searcher.addResult(req)
-+        if searcher.recommends:
-+            for prv in searcher.recommends:
-+                prvname = prv.name
-+                for req in self._recommends:
-+                    if prvname in req.getMatchNames() and req.matches(prv):
-+                        searcher.addResult(req)
-         if searcher.upgrades:
-             for prv in searcher.upgrades:
-                 prvname = prv.name
-@@ -839,6 +903,7 @@ class Cache(object):
-         self._packages = state["_packages"]
-         provides = {}
-         requires = {}
-+        recommends = {}
-         upgrades = {}
-         conflicts = {}
-         for pkg in self._packages:
-@@ -848,6 +913,9 @@ class Cache(object):
-             for req in pkg.requires:
-                 req.packages.append(pkg)
-                 requires[req] = True
-+            for rec in pkg.recommends:
-+                rec.packages.append(pkg)
-+                recommends[rec] = True
-             for upg in pkg.upgrades:
-                 upg.packages.append(pkg)
-                 upgrades[upg] = True
-@@ -856,6 +924,7 @@ class Cache(object):
-                 conflicts[cnf] = True
-         self._provides = provides.keys()
-         self._requires = requires.keys()
-+        self._recommends = recommends.keys()
-         self._upgrades = upgrades.keys()
-         self._conflicts = conflicts.keys()
-         self._objmap = {}
 diff --git a/smart/ccache.c b/smart/ccache.c
-index 7541e26..7193185 100644
+index 7193185..8b66515 100644
 --- a/smart/ccache.c
 +++ b/smart/ccache.c
-@@ -82,6 +82,7 @@ typedef struct {
-     PyObject *version;
-     PyObject *provides;
-     PyObject *requires;
-+    PyObject *recommends;
-     PyObject *upgrades;
-     PyObject *conflicts;
-     PyObject *installed;
-@@ -96,6 +97,7 @@ typedef struct {
-     PyObject *version;
-     PyObject *packages;
-     PyObject *requiredby;
-+    PyObject *recommendedby;
-     PyObject *upgradedby;
-     PyObject *conflictedby;
- } ProvidesObject;
-@@ -123,6 +125,7 @@ typedef struct {
-     PyObject *_packages;
-     PyObject *_provides;
-     PyObject *_requires;
-+    PyObject *_recommends;
-     PyObject *_upgrades;
-     PyObject *_conflicts;
-     PyObject *_objmap;
-@@ -211,7 +214,8 @@ Package_init(PackageObject *self, PyObject *args)
-     Py_INCREF(self->name);
-     Py_INCREF(self->version);
-     self->provides = PyTuple_New(0);
--    self->requires = PyTuple_New(0);
-+    self->requires = PyList_New(0);
-+    self->recommends = PyList_New(0);
-     self->upgrades = PyTuple_New(0);
-     self->conflicts = PyTuple_New(0);
-     Py_INCREF(Py_False);
-@@ -228,6 +232,7 @@ Package_traverse(PackageObject *self, visitproc visit, void *arg)
- {
-     Py_VISIT(self->provides);
-     Py_VISIT(self->requires);
-+    Py_VISIT(self->recommends);
-     Py_VISIT(self->upgrades);
-     Py_VISIT(self->conflicts);
-     Py_VISIT(self->loaders);
-@@ -239,6 +244,7 @@ Package_clear(PackageObject *self)
- {
-     Py_CLEAR(self->provides);
-     Py_CLEAR(self->requires);
-+    Py_CLEAR(self->recommends);
-     Py_CLEAR(self->upgrades);
-     Py_CLEAR(self->conflicts);
-     Py_CLEAR(self->loaders);
-@@ -252,6 +258,7 @@ Package_dealloc(PackageObject *self)
-     Py_XDECREF(self->version);
-     Py_XDECREF(self->provides);
-     Py_XDECREF(self->requires);
-+    Py_XDECREF(self->recommends);
-     Py_XDECREF(self->upgrades);
-     Py_XDECREF(self->conflicts);
-     Py_XDECREF(self->installed);
-@@ -453,6 +460,46 @@ Package_equals(PackageObject *self, PackageObject *other)
+@@ -500,6 +500,46 @@ Package_equals(PackageObject *self, PackageObject *other)
          }
      }
  
@@ -493,156 +117,7 @@ index 7541e26..7193185 100644
  exit:
      Py_INCREF(ret);
      return ret;
-@@ -606,13 +653,14 @@ Package_getPriority(PackageObject *self, PyObject *args)
- static PyObject *
- Package__getstate__(PackageObject *self, PyObject *args)
- {
--    PyObject *state = PyTuple_New(10);
-+    PyObject *state = PyTuple_New(11);
-     if (!state) return NULL;
- 
-     Py_INCREF(self->name);
-     Py_INCREF(self->version);
-     Py_INCREF(self->provides);
-     Py_INCREF(self->requires);
-+    Py_INCREF(self->recommends);
-     Py_INCREF(self->upgrades);
-     Py_INCREF(self->conflicts);
-     Py_INCREF(self->installed);
-@@ -620,16 +668,17 @@ Package__getstate__(PackageObject *self, PyObject *args)
-     Py_INCREF(self->priority);
-     Py_INCREF(self->loaders);
- 
--    PyTuple_SET_ITEM(state, 0, self->name);
--    PyTuple_SET_ITEM(state, 1, self->version);
--    PyTuple_SET_ITEM(state, 2, self->provides);
--    PyTuple_SET_ITEM(state, 3, self->requires);
--    PyTuple_SET_ITEM(state, 4, self->upgrades);
--    PyTuple_SET_ITEM(state, 5, self->conflicts);
--    PyTuple_SET_ITEM(state, 6, self->installed);
--    PyTuple_SET_ITEM(state, 7, self->essential);
--    PyTuple_SET_ITEM(state, 8, self->priority);
--    PyTuple_SET_ITEM(state, 9, self->loaders);
-+    PyTuple_SET_ITEM(state,  0, self->name);
-+    PyTuple_SET_ITEM(state,  1, self->version);
-+    PyTuple_SET_ITEM(state,  2, self->provides);
-+    PyTuple_SET_ITEM(state,  3, self->requires);
-+    PyTuple_SET_ITEM(state,  4, self->recommends);
-+    PyTuple_SET_ITEM(state,  5, self->upgrades);
-+    PyTuple_SET_ITEM(state,  6, self->conflicts);
-+    PyTuple_SET_ITEM(state,  7, self->installed);
-+    PyTuple_SET_ITEM(state,  8, self->essential);
-+    PyTuple_SET_ITEM(state,  9, self->priority);
-+    PyTuple_SET_ITEM(state, 10, self->loaders);
- 
-     return state;
- }
-@@ -637,7 +686,7 @@ Package__getstate__(PackageObject *self, PyObject *args)
- static PyObject *
- Package__setstate__(PackageObject *self, PyObject *state)
- {
--    if (!PyTuple_Check(state) || PyTuple_GET_SIZE(state) != 10) {
-+    if (!PyTuple_Check(state) || PyTuple_GET_SIZE(state) != 11) {
-         PyErr_SetString(StateVersionError, "");
-         return NULL;
-     }
-@@ -645,18 +694,20 @@ Package__setstate__(PackageObject *self, PyObject *state)
-     self->version = PyTuple_GET_ITEM(state, 1);
-     self->provides = PyTuple_GET_ITEM(state, 2);
-     self->requires = PyTuple_GET_ITEM(state, 3);
--    self->upgrades = PyTuple_GET_ITEM(state, 4);
--    self->conflicts = PyTuple_GET_ITEM(state, 5);
--    self->installed = PyTuple_GET_ITEM(state, 6);
--    self->essential = PyTuple_GET_ITEM(state, 7);
--    self->priority = PyTuple_GET_ITEM(state, 8);
--    self->loaders = PyTuple_GET_ITEM(state, 9);
-+    self->recommends = PyTuple_GET_ITEM(state, 4);
-+    self->upgrades = PyTuple_GET_ITEM(state, 5);
-+    self->conflicts = PyTuple_GET_ITEM(state, 6);
-+    self->installed = PyTuple_GET_ITEM(state, 7);
-+    self->essential = PyTuple_GET_ITEM(state, 8);
-+    self->priority = PyTuple_GET_ITEM(state, 9);
-+    self->loaders = PyTuple_GET_ITEM(state, 10);
- 
- 
-     Py_INCREF(self->name);
-     Py_INCREF(self->version);
-     Py_INCREF(self->provides);
-     Py_INCREF(self->requires);
-+    Py_INCREF(self->recommends);
-     Py_INCREF(self->upgrades);
-     Py_INCREF(self->conflicts);
-     Py_INCREF(self->installed);
-@@ -686,6 +737,7 @@ static PyMemberDef Package_members[] = {
-     {"version", T_OBJECT, OFF(version), 0, 0},
-     {"provides", T_OBJECT, OFF(provides), 0, 0},
-     {"requires", T_OBJECT, OFF(requires), 0, 0},
-+    {"recommends", T_OBJECT, OFF(recommends), 0, 0},
-     {"upgrades", T_OBJECT, OFF(upgrades), 0, 0},
-     {"conflicts", T_OBJECT, OFF(conflicts), 0, 0},
-     {"installed", T_OBJECT, OFF(installed), 0, 0},
-@@ -750,6 +802,7 @@ Provides_init(ProvidesObject *self, PyObject *args)
-     Py_INCREF(self->version);
-     self->packages = PyList_New(0);
-     self->requiredby = PyTuple_New(0);
-+    self->recommendedby = PyTuple_New(0);
-     self->upgradedby = PyTuple_New(0);
-     self->conflictedby = PyTuple_New(0);
-     return 0;
-@@ -760,6 +813,7 @@ Provides_traverse(ProvidesObject *self, visitproc visit, void *arg)
- {
-     Py_VISIT(self->packages);
-     Py_VISIT(self->requiredby);
-+    Py_VISIT(self->recommendedby);
-     Py_VISIT(self->upgradedby);
-     Py_VISIT(self->conflictedby);
-     return 0;
-@@ -770,6 +824,7 @@ Provides_clear(ProvidesObject *self)
- {
-     Py_CLEAR(self->packages);
-     Py_CLEAR(self->requiredby);
-+    Py_CLEAR(self->recommendedby);
-     Py_CLEAR(self->upgradedby);
-     Py_CLEAR(self->conflictedby);
-     return 0;
-@@ -782,6 +837,7 @@ Provides_dealloc(ProvidesObject *self)
-     Py_XDECREF(self->version);
-     Py_XDECREF(self->packages);
-     Py_XDECREF(self->requiredby);
-+    Py_XDECREF(self->recommendedby);
-     Py_XDECREF(self->upgradedby);
-     Py_XDECREF(self->conflictedby);
-     self->ob_type->tp_free((PyObject *)self);
-@@ -960,6 +1016,7 @@ static PyMemberDef Provides_members[] = {
-     {"version", T_OBJECT, OFF(version), 0, 0},
-     {"packages", T_OBJECT, OFF(packages), 0, 0},
-     {"requiredby", T_OBJECT, OFF(requiredby), 0, 0},
-+    {"recommendedby", T_OBJECT, OFF(recommendedby), 0, 0},
-     {"upgradedby", T_OBJECT, OFF(upgradedby), 0, 0},
-     {"conflictedby", T_OBJECT, OFF(conflictedby), 0, 0},
-     {NULL}
-@@ -1555,6 +1612,7 @@ Loader_buildPackage(LoaderObject *self, PyObject *args)
-     PyObject *reqargs;
-     PyObject *upgargs;
-     PyObject *cnfargs;
-+    PyObject *recargs = NULL;
-     PyObject *callargs;
-     
-     PyObject *pkg;
-@@ -1574,9 +1632,10 @@ Loader_buildPackage(LoaderObject *self, PyObject *args)
- 
-     cache = (CacheObject *)self->_cache;
- 
--    if (!PyArg_ParseTuple(args, "O!O&O&O&O&", &PyTuple_Type, &pkgargs,
-+    if (!PyArg_ParseTuple(args, "O!O&O&O&O&|O&", &PyTuple_Type, &pkgargs,
-                           mylist, &prvargs, mylist, &reqargs,
--                          mylist, &upgargs, mylist, &cnfargs))
-+                          mylist, &upgargs, mylist, &cnfargs,
-+                          mylist, &recargs))
-         return NULL;
- 
-     if (PyTuple_GET_SIZE(pkgargs) < 2) {
-@@ -1701,6 +1760,59 @@ Loader_buildPackage(LoaderObject *self, PyObject *args)
+@@ -1813,6 +1853,59 @@ Loader_buildPackage(LoaderObject *self, PyObject *args)
          }
      }
  
@@ -702,48 +177,7 @@ index 7541e26..7193185 100644
      /* if upgargs: */
      if (upgargs) {
          int i = 0;
-@@ -2391,6 +2503,7 @@ Cache_init(CacheObject *self, PyObject *args)
-     self->_packages = PyList_New(0);
-     self->_provides = PyList_New(0);
-     self->_requires = PyList_New(0);
-+    self->_recommends = PyList_New(0);
-     self->_upgrades = PyList_New(0);
-     self->_conflicts = PyList_New(0);
-     self->_objmap = PyDict_New();
-@@ -2404,6 +2517,7 @@ Cache_traverse(CacheObject *self, visitproc visit, void *arg)
-     Py_VISIT(self->_packages);
-     Py_VISIT(self->_provides);
-     Py_VISIT(self->_requires);
-+    Py_VISIT(self->_recommends);
-     Py_VISIT(self->_upgrades);
-     Py_VISIT(self->_conflicts);
-     Py_VISIT(self->_objmap);
-@@ -2417,6 +2531,7 @@ Cache_clear(CacheObject *self)
-     Py_CLEAR(self->_packages);
-     Py_CLEAR(self->_provides);
-     Py_CLEAR(self->_requires);
-+    Py_CLEAR(self->_recommends);
-     Py_CLEAR(self->_upgrades);
-     Py_CLEAR(self->_conflicts);
-     Py_CLEAR(self->_objmap);
-@@ -2430,6 +2545,7 @@ Cache_dealloc(CacheObject *self)
-     Py_XDECREF(self->_packages);
-     Py_XDECREF(self->_provides);
-     Py_XDECREF(self->_requires);
-+    Py_XDECREF(self->_recommends);
-     Py_XDECREF(self->_upgrades);
-     Py_XDECREF(self->_conflicts);
-     Py_XDECREF(self->_objmap);
-@@ -2449,6 +2565,8 @@ Cache_reset(CacheObject *self, PyObject *args)
-         LIST_CLEAR(prvobj->packages);
-         if (PyList_Check(prvobj->requiredby))
-             LIST_CLEAR(prvobj->requiredby);
-+        if (PyList_Check(prvobj->recommendedby))
-+            LIST_CLEAR(prvobj->recommendedby);
-         if (PyList_Check(prvobj->upgradedby))
-             LIST_CLEAR(prvobj->upgradedby);
-         if (PyList_Check(prvobj->conflictedby))
-@@ -2464,6 +2582,16 @@ Cache_reset(CacheObject *self, PyObject *args)
+@@ -2592,6 +2685,16 @@ Cache_reset(CacheObject *self, PyObject *args)
          if (PyList_Check(reqobj->providedby))
              LIST_CLEAR(reqobj->providedby);
      }
@@ -760,37 +194,7 @@ index 7541e26..7193185 100644
      len = PyList_GET_SIZE(self->_upgrades);
      for (i = 0; i != len; i++) {
          DependsObject *upgobj;
-@@ -2487,6 +2615,7 @@ Cache_reset(CacheObject *self, PyObject *args)
-     LIST_CLEAR(self->_packages);
-     LIST_CLEAR(self->_provides);
-     LIST_CLEAR(self->_requires);
-+    LIST_CLEAR(self->_recommends);
-     LIST_CLEAR(self->_upgrades);
-     LIST_CLEAR(self->_conflicts);
-     PyDict_Clear(self->_objmap);
-@@ -2534,6 +2663,7 @@ Cache__reload(CacheObject *self, PyObject *args)
-       packages = {}
-       provides = {}
-       requires = {}
-+      recommends = {}
-       upgrades = {}
-       conflicts = {}
-       objmap = self._objmap
-@@ -2541,11 +2671,12 @@ Cache__reload(CacheObject *self, PyObject *args)
-     PyObject *packages = PyDict_New();
-     PyObject *provides = PyDict_New();
-     PyObject *requires = PyDict_New();
-+    PyObject *recommends = PyDict_New();
-     PyObject *upgrades = PyDict_New();
-     PyObject *conflicts = PyDict_New();
-     PyObject *objmap = self->_objmap;
-     int i, ilen;
--    if (!packages || !provides || !requires || !conflicts)
-+    if (!packages || !provides || !requires || !recommends || !conflicts )
-         return NULL;
- 
-     /* for loader in loaders: */
-@@ -2679,6 +2810,30 @@ Cache__reload(CacheObject *self, PyObject *args)
+@@ -2834,6 +2937,30 @@ Cache__reload(CacheObject *self, PyObject *args)
                  }
  
                  /*
@@ -821,28 +225,7 @@ index 7541e26..7193185 100644
                     for upg in pkg.upgrades:
                         upg.packages.append(pkg)
                         if upg not in upgrades:
-@@ -2747,6 +2902,11 @@ Cache__reload(CacheObject *self, PyObject *args)
-     self->_requires = PyDict_Keys(requires);
-     Py_DECREF(requires);
- 
-+    /* self._recommends[:] = recommends.keys() */
-+    Py_DECREF(self->_recommends);
-+    self->_recommends = PyDict_Keys(recommends);
-+    Py_DECREF(recommends);
-+
-     /* self._upgrades[:] = upgrades.keys() */
-     Py_DECREF(self->_upgrades);
-     self->_upgrades = PyDict_Keys(upgrades);
-@@ -2852,7 +3012,7 @@ PyObject *
- Cache_linkDeps(CacheObject *self, PyObject *args)
- {
-     int i, j, len;
--    PyObject *reqnames, *upgnames, *cnfnames;
-+    PyObject *reqnames, *recnames, *upgnames, *cnfnames;
-     PyObject *lst;
- 
-     /* reqnames = {} */
-@@ -2896,6 +3056,47 @@ Cache_linkDeps(CacheObject *self, PyObject *args)
+@@ -3097,6 +3224,47 @@ Cache_linkDeps(CacheObject *self, PyObject *args)
          Py_DECREF(seq);
      }
  
@@ -890,7 +273,7 @@ index 7541e26..7193185 100644
      /* upgnames = {} */
      upgnames = PyDict_New();
      /* for upg in self._upgrades: */
-@@ -3035,6 +3236,56 @@ Cache_linkDeps(CacheObject *self, PyObject *args)
+@@ -3286,6 +3454,56 @@ Cache_linkDeps(CacheObject *self, PyObject *args)
              }
          }
  
@@ -947,107 +330,7 @@ index 7541e26..7193185 100644
          /* lst = upgnames.get(prv.name) */
          lst = PyDict_GetItem(upgnames, prv->name);
  
-@@ -3139,6 +3390,7 @@ Cache_linkDeps(CacheObject *self, PyObject *args)
-     }
- 
-     Py_DECREF(reqnames);
-+    Py_DECREF(recnames);
-     Py_DECREF(upgnames);
-     Py_DECREF(cnfnames);
- 
-@@ -3215,6 +3467,29 @@ Cache_getRequires(CacheObject *self, PyObject *args)
- }
- 
- PyObject *
-+Cache_getRecommends(CacheObject *self, PyObject *args)
-+{
-+    const char *name = NULL;
-+    PyObject *lst;
-+    int i, len;
-+    if (!PyArg_ParseTuple(args, "|s", &name))
-+        return NULL;
-+    if (!name) {
-+        Py_INCREF(self->_recommends);
-+        return self->_recommends;
-+    }
-+    lst = PyList_New(0);
-+    len = PyList_GET_SIZE(self->_recommends);
-+    for (i = 0; i != len; i++) {
-+        DependsObject *rec =
-+            (DependsObject*)PyList_GET_ITEM(self->_recommends, i);
-+        if (strcmp(STR(rec->name), name) == 0)
-+            PyList_Append(lst, (PyObject *)rec);
-+    }
-+    return lst;
-+}
-+
-+PyObject *
- Cache_getUpgrades(CacheObject *self, PyObject *args)
- {
-     const char *name = NULL;
-@@ -3324,6 +3599,38 @@ Cache_search(CacheObject *self, PyObject *searcher)
-     }
-     Py_DECREF(lst);
- 
-+    lst = PyObject_GetAttrString(searcher, "recommends");
-+    if (lst == NULL || !PyList_Check(lst)) {
-+        PyErr_SetString(PyExc_TypeError, "Invalid recommends attribute");
-+        return NULL;
-+    }
-+    for (i = 0; i != PyList_GET_SIZE(lst); i++) {
-+        ProvidesObject *prv = (ProvidesObject *)PyList_GET_ITEM(lst, i);
-+        for (j = 0; j != PyList_GET_SIZE(self->_recommends); j++) {
-+            PyObject *rec = PyList_GET_ITEM(self->_recommends, j);
-+            PyObject *names = PyObject_CallMethod(rec, "getMatchNames", NULL);
-+            PyObject *seq = PySequence_Fast(names, "getMatchNames() returned "
-+                                                   "non-sequence object");
-+            if (seq == NULL) return NULL;
-+            for (k = 0; k != PySequence_Fast_GET_SIZE(seq); k++) {
-+                if (strcmp(PyString_AS_STRING(PySequence_Fast_GET_ITEM(seq, k)),
-+                           PyString_AS_STRING(prv->name)) == 0) {
-+                    res = PyObject_CallMethod(rec, "matches", "O", prv);
-+                    if (res == NULL)
-+                        return NULL;
-+                    if (PyObject_IsTrue(res))
-+                        CALLMETHOD(searcher, "addResult", "O", rec);
-+                    Py_DECREF(res);
-+                    break;
-+                }
-+            }
-+
-+            Py_DECREF(names);
-+            Py_DECREF(seq);
-+        }
-+    }
-+    Py_DECREF(lst);
-+
-     lst = PyObject_GetAttrString(searcher, "upgrades");
-     if (lst == NULL || !PyList_Check(lst)) {
-         PyErr_SetString(PyExc_TypeError, "Invalid upgrades attribute");
-@@ -3420,7 +3727,7 @@ Cache__getstate__(CacheObject *self, PyObject *args)
- static PyObject *
- Cache__setstate__(CacheObject *self, PyObject *state)
- {
--    PyObject *provides, *requires, *upgrades, *conflicts;
-+    PyObject *provides, *requires, *recommends, *upgrades, *conflicts;
-     int i, ilen;
-     int j, jlen;
-     
-@@ -3452,11 +3759,13 @@ Cache__setstate__(CacheObject *self, PyObject *state)
-     /*
-        provides = {}
-        requires = {}
-+       recommends = {}
-        upgrades = {}
-        conflicts = {}
-     */
-     provides = PyDict_New();
-     requires = PyDict_New();
-+    recommends = PyDict_New();
-     upgrades = PyDict_New();
-     conflicts = PyDict_New();
- 
-@@ -3497,6 +3806,21 @@ Cache__setstate__(CacheObject *self, PyObject *state)
+@@ -3821,6 +4094,21 @@ Cache__setstate__(CacheObject *self, PyObject *state)
          }
  
          /*
@@ -1069,97 +352,11 @@ index 7541e26..7193185 100644
             for upg in pkg.upgrades:
                 upg.packages.append(pkg)
                 upgrades[upg] = True
-@@ -3525,6 +3849,7 @@ Cache__setstate__(CacheObject *self, PyObject *state)
-                 PyDict_SetItem(conflicts, cnf, Py_True);
-             }
-         }
-+
-     }
- 
-     /* self._provides = provides.keys() */
-@@ -3535,6 +3860,10 @@ Cache__setstate__(CacheObject *self, PyObject *state)
-     self->_requires = PyDict_Keys(requires);
-     Py_DECREF(requires);
- 
-+    /* self._recommends = recommends.keys() */
-+    self->_recommends = PyDict_Keys(recommends);
-+    Py_DECREF(recommends);
-+
-     /* self._upgrades = upgrades.keys() */
-     self->_upgrades = PyDict_Keys(upgrades);
-     Py_DECREF(upgrades);
-@@ -3562,6 +3891,7 @@ static PyMethodDef Cache_methods[] = {
-     {"getPackages", (PyCFunction)Cache_getPackages, METH_VARARGS, NULL},
-     {"getProvides", (PyCFunction)Cache_getProvides, METH_VARARGS, NULL},
-     {"getRequires", (PyCFunction)Cache_getRequires, METH_VARARGS, NULL},
-+    {"getRecommends", (PyCFunction)Cache_getRecommends, METH_VARARGS, NULL},
-     {"getUpgrades", (PyCFunction)Cache_getUpgrades, METH_VARARGS, NULL},
-     {"getConflicts", (PyCFunction)Cache_getConflicts, METH_VARARGS, NULL},
-     {"search", (PyCFunction)Cache_search, METH_O, NULL},
-@@ -3576,6 +3906,7 @@ static PyMemberDef Cache_members[] = {
-     {"_packages", T_OBJECT, OFF(_packages), RO, 0},
-     {"_provides", T_OBJECT, OFF(_provides), RO, 0},
-     {"_requires", T_OBJECT, OFF(_requires), RO, 0},
-+    {"_recommends", T_OBJECT, OFF(_recommends), RO, 0},
-     {"_upgrades", T_OBJECT, OFF(_upgrades), RO, 0},
-     {"_conflicts", T_OBJECT, OFF(_conflicts), RO, 0},
-     {"_objmap", T_OBJECT, OFF(_objmap), RO, 0},
 diff --git a/smart/commands/query.py b/smart/commands/query.py
-index 808e53a..9265cd9 100644
+index 9265cd9..b6f5697 100644
 --- a/smart/commands/query.py
 +++ b/smart/commands/query.py
-@@ -107,6 +107,8 @@ def option_parser(**kwargs):
-                       help=_("show requires for the given packages"))
-     parser.add_option("--show-prerequires", action="store_true",
-                       help=_("show requires selecting only pre-dependencies"))
-+    parser.add_option("--show-recommends", action="store_true",
-+                      help=_("show recommends for the given packages"))
-     parser.add_option("--show-upgrades", action="store_true",
-                       help=_("show upgrades for the given packages"))
-     parser.add_option("--show-conflicts", action="store_true",
-@@ -488,6 +490,19 @@ def main(ctrl, opts, reloadchannels=True):
-                                 continue
-                             output.showRequiresProvidedBy(pkg, req,
-                                                           prv, prvpkg)
-+        if pkg.recommends and (opts.show_recommends):
-+            pkg.recommends.sort()
-+            first = True
-+            for req in pkg.recommends:
-+                output.showRecommends(pkg, req)
-+                if opts.show_providedby and req.providedby:
-+                    for prv in req.providedby:
-+                        prv.packages.sort()
-+                        for prvpkg in prv.packages:
-+                            if opts.installed and not prvpkg.installed:
-+                                continue
-+                            output.showRecommendsProvidedBy(pkg, req,
-+                                                          prv, prvpkg)
-         if pkg.upgrades and (opts.show_upgrades or whoupgrades):
-             pkg.upgrades.sort()
-             first = True
-@@ -594,6 +609,12 @@ class NullOutput(object):
-     def showRequiresProvidedBy(self, pkg, req, prv, prvpkg):
-         pass
- 
-+    def showRecommends(self, pkg, req):
-+        pass
-+
-+    def showRecommendsProvidedBy(self, pkg, req, prv, prvpkg):
-+        pass
-+
-     def showUpgrades(self, pkg, upg):
-         pass
- 
-@@ -619,6 +640,8 @@ class TextOutput(NullOutput):
-         self._firstconflictedby = True
-         self._firstrequires = True
-         self._firstrequiresprovidedby = True
-+        self._firstrecommends = True
-+        self._firstrecommendsprovidedby = True
-         self._firstupgrades = True
-         self._firstupgradesprovidedby = True
-         self._firstconflicts = True
-@@ -711,6 +734,22 @@ class TextOutput(NullOutput):
+@@ -750,6 +750,22 @@ class TextOutput(NullOutput):
              name = str(prvpkg)
          print "       ", "%s (%s)" % (name, prv)
  
@@ -1182,181 +379,3 @@ index 808e53a..9265cd9 100644
      def showUpgrades(self, pkg, upg):
          if self._firstupgrades:
              self._firstupgrades = False
-@@ -797,6 +836,18 @@ class GraphVizOutput(NullOutput):
-             self._shown[req, prv] = True
-             print '    "Requires: %s" -> "Provides: %s";' % (req, prv)
- 
-+    def showRecommends(self, pkg, req):
-+        if (pkg, req) not in self._shown:
-+            self._shown[pkg, req] = True
-+            print '    "%s" -> "Recommends: %s";' % (pkg, req)
-+
-+    def showRecommendsProvidedBy(self, pkg, req, prv, prvpkg):
-+        self.showPackage(prvpkg)
-+        self.showProvides(prvpkg, prv)
-+        if (req, prv) not in self._shown:
-+            self._shown[req, prv] = True
-+            print '    "Recommends: %s" -> "Provides: %s";' % (req, prv)
-+
-     def showUpgrades(self, pkg, upg):
-         if (pkg, upg) not in self._shown:
-             self._shown[pkg, upg] = True
-diff --git a/smart/control.py b/smart/control.py
-index fd7083a..d44abe7 100644
---- a/smart/control.py
-+++ b/smart/control.py
-@@ -447,7 +447,7 @@ class Control(object):
-         queue = marked.keys()
-         while queue:
-             pkg = queue.pop(0)
--            for req in pkg.requires:
-+            for req in pkg.requires + pkg.recommends:
-                 for prv in req.providedby:
-                     for prvpkg in prv.packages:
-                         if (prvpkg.installed and
-@@ -794,7 +794,7 @@ class Control(object):
-         pkglst = []
-         for pkg in changeset:
-             n = 0
--            for req in pkg.requires:
-+            for req in pkg.requires + pkg.recommends:
-                 for prv in req.providedby:
-                     for prvpkg in prv.packages:
-                         if changeset.get(prvpkg) is INSTALL:
-diff --git a/smart/searcher.py b/smart/searcher.py
-index 216f4ce..32eb825 100644
---- a/smart/searcher.py
-+++ b/smart/searcher.py
-@@ -45,9 +45,9 @@ class Searcher(object):
- 
-     - provides is matched in Provides.search(), for the same reason.
- 
--    - requires, upgrades, and conflicts don't have special searching
--      methods. Instead, their usual match() method is given an instance
--      of the Provides type.
-+    - requires, recommends, upgrades, and conflicts don't have special
-+      searching methods. Instead, their usual match() method is given
-+      an instance of the Provides type.
- 
-     - group, path, url, and other information which is found by
-       PackageInfo, is searched by the Loader.search() method and
-@@ -62,6 +62,7 @@ class Searcher(object):
-         self.nameversion = []
-         self.provides = []
-         self.requires = []
-+        self.recommends = []
-         self.upgrades = []
-         self.conflicts = []
-         self.path = []
-@@ -76,6 +77,7 @@ class Searcher(object):
-         del self.nameversion[:]
-         del self.provides[:]
-         del self.requires[:]
-+        del self.recommends[:]
-         del self.upgrades[:]
-         del self.conflicts[:]
-         del self.path[:]
-@@ -122,6 +124,8 @@ class Searcher(object):
-             self.addProvides(s[9:], cutoff)
-         elif s.startswith("requires:"):
-             self.addRequires(s[9:])
-+        elif s.startswith("recommends:"):
-+            self.addRecommends(s[11:])
-         elif s.startswith("upgrades:"):
-             self.addUpgrades(s[9:])
-         elif s.startswith("conflicts:"):
-@@ -151,6 +155,7 @@ class Searcher(object):
-         return s and (
-                 s.startswith("provides:") or
-                 s.startswith("requires:") or
-+                s.startswith("recommends:") or
-                 s.startswith("upgrades:") or
-                 s.startswith("conflicts:") or
-                 s.startswith("url:") or
-@@ -182,6 +187,9 @@ class Searcher(object):
-     def addRequires(self, s):
-         self.requires.append(self._buildProvides(s))
- 
-+    def addRecommends(self, s):
-+        self.recommends.append(self._buildProvides(s))
-+
-     def addUpgrades(self, s):
-         self.upgrades.append(self._buildProvides(s))
- 
-diff --git a/smart/transaction.py b/smart/transaction.py
-index eb320d2..300b9cc 100644
---- a/smart/transaction.py
-+++ b/smart/transaction.py
-@@ -573,7 +573,7 @@ class Transaction(object):
-                 self._remove(namepkg, changeset, locked, pending, depth)
- 
-         # Install packages required by this one.
--        for req in pkg.requires:
-+        for req in pkg.requires + pkg.recommends:
- 
-             # Check if someone is already providing it.
-             prvpkgs = {}
-@@ -596,8 +596,12 @@ class Transaction(object):
- 
-             if not prvpkgs:
-                 # No packages provide it at all. Give up.
--                raise Failed, _("Can't install %s: no package provides %s") % \
--                              (pkg, req)
-+                if req in pkg.requires:
-+                    raise Failed, _("Can't install %s: no package provides %s") % \
-+                                (pkg, req)
-+                else:
-+                    # It's only a recommend, skip
-+                    continue
- 
-             if len(prvpkgs) == 1:
-                 # Don't check locked here. prvpkgs was
-@@ -1359,7 +1363,7 @@ class ChangeSetSplitter(object):
-         set = self._changeset
- 
-         # Check all dependencies needed by this package.
--        for req in pkg.requires:
-+        for req in pkg.requires + pkg.recommends:
- 
-             # Check if any already installed or to be installed
-             # package will solve the problem.
-@@ -1424,8 +1428,9 @@ class ChangeSetSplitter(object):
- 
-             # There are no solutions for the problem.
-             # Should we really care about it?
--            if (self._forcerequires or
--                isinstance(req, PreRequires)):
-+            if ((self._forcerequires or
-+                isinstance(req, PreRequires))
-+                and req in pkg.requires):
-                 raise Error, _("No providers for '%s', "
-                                "required by '%s'") % (req, pkg)
- 
-@@ -1625,7 +1630,7 @@ def recursiveInternalRequires(pkgmap, pkg, numrel, done=None):
-     return n
- 
- def forwardRequires(pkg, map):
--    for req in pkg.requires:
-+    for req in pkg.requires + pkg.recommends:
-         if req not in map:
-             map[req] = True
-             for prv in req.providedby:
-@@ -1794,6 +1799,15 @@ def checkPackages(cache, checkset, relateset, report=False):
-                 iface.info(_("Unsatisfied dependency: %s requires %s") %
-                            (pkg, req))
- 
-+        for req in pkg.recommends:
-+            for prv in req.providedby:
-+                for prvpkg in prv.packages:
-+                    if prvpkg in relateset:
-+                        break
-+                else:
-+                    continue
-+                break
-+
-         if not pkg.installed:
-             continue
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch b/meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch
deleted file mode 100644
index 30cb176..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-backends/rpm: implement rpm-extra-macros option
-
-Allow defining extra macros in the smart configuration to be passed
-to rpm before opening the database.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
-index b9e9cb2..234c844 100644
---- a/smart/backends/rpm/base.py
-+++ b/smart/backends/rpm/base.py
-@@ -53,6 +53,10 @@ def rpm_join_dbpath(root, dbpath):
-         return os.path.join(root, dbpath)
- 
- def getTS(new=False):
-+    if sysconf.get("rpm-extra-macros"):
-+        for key, value in sysconf.get("rpm-extra-macros").items():
-+            rpm.addMacro(key, str(value))
-+
-     rpm_root = os.path.abspath(sysconf.get("rpm-root", "/"))
-     if not hasattr(getTS, "ts") or getTS.root != rpm_root:
-         getTS.root = rpm_root
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch b/meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch
deleted file mode 100644
index 97cecc1..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-backends/rpm: fix parsing of rpm-md metadata
-
-If assertions are disabled then the queue.pop() wasn't being executed,
-leading to requires, recommends etc. not being read properly.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/smart/backends/rpm/metadata.py b/smart/backends/rpm/metadata.py
-index 2c54f39..dc9df22 100644
---- a/smart/backends/rpm/metadata.py
-+++ b/smart/backends/rpm/metadata.py
-@@ -188,7 +188,8 @@ class RPMMetaDataLoader(Loader):
- 
-             elif event == "end":
- 
--                assert queue.pop() is elem
-+                popped = queue.pop()
-+                assert popped is elem
- 
-                 if skip:
-                     if tag == skip:
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch b/meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch
deleted file mode 100644
index b2629ef..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-rpm-root.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Fix smart RPM backend to handle rpm-dbpath/rpm-root properly
-
-Don't assume that if the dbpath starts with / that it is an absolute
-path. This matches the behaviour of rpm itself. (If the root path is
-specified and does not start with /, rpm will prepend the root path
-twice and fail).
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
-index 7092332..0489e11 100644
---- a/smart/backends/rpm/base.py
-+++ b/smart/backends/rpm/base.py
-@@ -46,6 +46,12 @@ __all__ = ["RPMPackage", "RPMProvides", "RPMNameProvides", "RPMPreRequires",
-            "rpm", "getTS", "getArchScore", "getArchColor", "system_provides",
-            "collapse_libc_requires"]
- 
-+def rpm_join_dbpath(root, dbpath):
-+    if dbpath.startswith('/') and root:
-+        return os.path.join(root, dbpath[1:])
-+    else:
-+        return os.path.join(root, dbpath)
-+
- def getTS(new=False):
-     rpm_root = os.path.abspath(sysconf.get("rpm-root", "/"))
-     if not hasattr(getTS, "ts") or getTS.root != rpm_root:
-@@ -56,7 +62,7 @@ def getTS(new=False):
-         #if not sysconf.get("rpm-check-signatures", False):
-         #    getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
-         rpm_dbpath = sysconf.get("rpm-dbpath", "var/lib/rpm")
--        dbdir = os.path.join(getTS.root, rpm_dbpath)
-+        dbdir = rpm_join_dbpath(getTS.root, rpm_dbpath)
-         if not os.path.isdir(dbdir):
-             try:
-                 os.makedirs(dbdir)
-diff --git a/smart/channels/rpm_sys.py b/smart/channels/rpm_sys.py
-index efcb10e..b9fda27 100644
---- a/smart/channels/rpm_sys.py
-+++ b/smart/channels/rpm_sys.py
-@@ -20,7 +20,7 @@
- # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- #
- from smart.backends.rpm.header import RPMDBLoader
--from smart.backends.rpm.base import getTS
-+from smart.backends.rpm.base import getTS, rpm_join_dbpath
- from smart.channel import PackageChannel
- from smart import *
- import os
-@@ -32,9 +32,9 @@ class RPMSysChannel(PackageChannel):
- 
-     def fetch(self, fetcher, progress):
-         getTS() # Make sure the db exists.
--        path = os.path.join(sysconf.get("rpm-root", "/"),
--                            sysconf.get("rpm-dbpath", "var/lib/rpm"),
--                            "Packages")
-+        dbdir = rpm_join_dbpath(sysconf.get("rpm-root", "/"),
-+                            sysconf.get("rpm-dbpath", "var/lib/rpm"))
-+        path = os.path.join(dbdir, "Packages")
-         digest = os.path.getmtime(path)
-         if digest == self._digest:
-             return True
-diff --git a/smart/plugins/detectsys.py b/smart/plugins/detectsys.py
-index 2cd49ad..3959d07 100644
---- a/smart/plugins/detectsys.py
-+++ b/smart/plugins/detectsys.py
-@@ -20,10 +20,11 @@
- # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- #
- from smart import *
-+from smart.backends.rpm.base import rpm_join_dbpath
- import os
- 
- def detectRPMSystem():
--    dir = os.path.join(sysconf.get("rpm-root", "/"),
-+    dir = rpm_join_dbpath(sysconf.get("rpm-root", "/"),
-                        sysconf.get("rpm-dbpath", "var/lib/rpm"))
-     file = os.path.join(dir, "Packages")
-     if os.path.exists(file):
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch b/meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch
deleted file mode 100644
index 2f09ce9..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-backends/rpm: remove creation of /var/tmp
-
-This doesn't appear to be needed, and breaks installation of base-files
-in OpenEmbedded (since that is a symlink installed as part of the
-package).
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
-index 234c844..127354d 100644
---- a/smart/backends/rpm/base.py
-+++ b/smart/backends/rpm/base.py
-@@ -82,12 +82,6 @@ def getTS(new=False):
-             else:
-                 iface.warning(_("Initialized new rpm database at %s")
-                               % getTS.root)
--        tmpdir = os.path.join(getTS.root, "var/tmp")
--        if not os.path.isdir(tmpdir):
--            try:
--                os.makedirs(tmpdir)
--            except OSError:
--                pass
-     if new:
-         if sysconf.get("rpm-dbpath"):
-             rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch b/meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch
deleted file mode 100644
index e16c5c1..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-yaml-error.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Print a more friendly error if YAML output is requested without PyYAML
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/smart/commands/channel.py b/smart/commands/channel.py
-index 63fbb35..108f3f1 100644
---- a/smart/commands/channel.py
-+++ b/smart/commands/channel.py
-@@ -339,7 +339,10 @@ def main(ctrl, opts):
-                     print
- 
-     if opts.yaml is not None:
--        import yaml
-+        try:
-+            import yaml
-+        except ImportError:
-+            raise Error, _("Please install PyYAML in order to use this function")
-         yamlchannels = {}
-         for alias in (opts.yaml or sysconf.get("channels", ())):
-             channel = sysconf.get(("channels", alias))
-diff --git a/smart/commands/config.py b/smart/commands/config.py
-index 4fe4366..aa1db78 100644
---- a/smart/commands/config.py
-+++ b/smart/commands/config.py
-@@ -137,7 +137,10 @@ def main(ctrl, opts):
-             pprint.pprint(sysconf.get((), hard=True))
- 
-     if opts.yaml is not None:
--        import yaml
-+        try:
-+            import yaml
-+        except ImportError:
-+            raise Error, _("Please install PyYAML in order to use this function")
-         if opts.yaml:
-             marker = object()
-             for opt in opts.yaml:
-diff --git a/smart/commands/flag.py b/smart/commands/flag.py
-index ed18999..8b90496 100644
---- a/smart/commands/flag.py
-+++ b/smart/commands/flag.py
-@@ -138,7 +138,10 @@ def main(ctrl, opts):
-             print
- 
-     if opts.yaml is not None:
--        import yaml
-+        try:
-+            import yaml
-+        except ImportError:
-+            raise Error, _("Please install PyYAML in order to use this function")
-         yamlflags = {}
-         for flag in opts.yaml or pkgconf.getFlagNames():
-             flag = flag.strip()
-diff --git a/smart/commands/mirror.py b/smart/commands/mirror.py
-index ca50a95..f7b019d 100644
---- a/smart/commands/mirror.py
-+++ b/smart/commands/mirror.py
-@@ -218,7 +218,10 @@ def main(ctrl, opts):
-             print
- 
-     if opts.yaml:
--        import yaml
-+        try:
-+            import yaml
-+        except ImportError:
-+            raise Error, _("Please install PyYAML in order to use this function")
-         yamlmirrors = {}
-         mirrors = sysconf.get("mirrors", ())
-         for origin in mirrors:
-diff --git a/smart/commands/priority.py b/smart/commands/priority.py
-index d850d29..441ea32 100644
---- a/smart/commands/priority.py
-+++ b/smart/commands/priority.py
-@@ -117,7 +117,10 @@ def main(ctrl, opts):
-         print
- 
-     elif opts.yaml:
--        import yaml
-+        try:
-+            import yaml
-+        except ImportError:
-+            raise Error, _("Please install PyYAML in order to use this function")
-         yamlpriorities = {}
-         priorities = sysconf.get("package-priorities", {})
-         for name in opts.args or priorities:
diff --git a/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch b/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
index 9919a94..fefb29a 100644
--- a/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
@@ -6,41 +6,54 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-diff -ur smart-1.4.1.orig/smart/backends/rpm/base.py smart-1.4.1/smart/backends/rpm/base.py
---- smart-1.4.1.orig/smart/backends/rpm/base.py	2012-10-04 11:22:11.229351164 -0500
-+++ smart-1.4.1/smart/backends/rpm/base.py	2012-10-04 11:22:44.820170786 -0500
-@@ -53,8 +53,8 @@
+diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
+--- a/smart/backends/rpm/base.py
++++ b/smart/backends/rpm/base.py
+@@ -63,11 +63,11 @@ def getTS(new=False):
          if sysconf.get("rpm-dbpath"):
              rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
          getTS.ts = rpm.ts(getTS.root)
 -        if not sysconf.get("rpm-check-signatures", False):
--            getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
+-            if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
+-                getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
+-            else:
+-                raise Error, _("rpm requires checking signatures")
 +        #if not sysconf.get("rpm-check-signatures", False):
-+        #    getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
++        #    if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
++        #        getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
++        #    else:
++        #        raise Error, _("rpm requires checking signatures")
          rpm_dbpath = sysconf.get("rpm-dbpath", "var/lib/rpm")
-         dbdir = os.path.join(getTS.root, rpm_dbpath)
+         dbdir = rpm_join_dbpath(getTS.root, rpm_dbpath)
          if not os.path.isdir(dbdir):
-@@ -82,8 +82,8 @@
+@@ -89,11 +89,11 @@ def getTS(new=False):
          if sysconf.get("rpm-dbpath"):
              rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
          ts = rpm.ts(getTS.root)
 -        if not sysconf.get("rpm-check-signatures", False):
--            ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
+-            if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
+-                ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
+-            else:
+-                raise Error, _("rpm requires checking signatures")
 +        #if not sysconf.get("rpm-check-signatures", False):
-+        #    ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
++        #    if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
++        #        ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
++        #    else:
++        #        raise Error, _("rpm requires checking signatures")
          return ts
      else:
          return getTS.ts
-diff -ur smart-1.4.1.orig/smart/plugins/yumchannelsync.py smart-1.4.1/smart/plugins/yumchannelsync.py
---- smart-1.4.1.orig/smart/plugins/yumchannelsync.py	2010-12-06 03:11:05.000000000 -0600
-+++ smart-1.4.1/smart/plugins/yumchannelsync.py	2012-10-04 11:23:09.799350924 -0500
-@@ -56,7 +56,8 @@
+diff --git a/smart/plugins/yumchannelsync.py b/smart/plugins/yumchannelsync.py
+--- a/smart/plugins/yumchannelsync.py
++++ b/smart/plugins/yumchannelsync.py
+@@ -56,8 +56,8 @@ def _getreleasever():
  
      rpmroot = sysconf.get("rpm-root", "/")
      ts = rpmUtils.transaction.initReadOnlyTransaction(root=rpmroot)
--    ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
-+    #ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
-+    ts.pushVSFlags(~(rpm._RPMVSF_NODIGESTS))
+-    if hasattr(rpm, '_RPMVSF_NOSIGNATURES') and hasattr(rpm, '_RPMVSF_NODIGESTS'):
+-        ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
++    #if hasattr(rpm, '_RPMVSF_NOSIGNATURES') and hasattr(rpm, '_RPMVSF_NODIGESTS'):
++    #    ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
      releasever = None
      # HACK: we're hard-coding the most used distros, will add more if needed
      idx = ts.dbMatch('provides', 'fedora-release')
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
similarity index 84%
rename from meta/recipes-devtools/python/python-smartpm_1.4.1.bb
rename to meta/recipes-devtools/python/python-smartpm_git.bb
index 69b94a2..ed786e4 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -9,37 +9,24 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm gettext-native python-rpm"
-PR = "r9"
 SRCNAME = "smart"
 
 SRC_URI = "\
-          http://launchpad.net/smart/trunk/${PV}/+download/${SRCNAME}-${PV}.tar.bz2 \
+          git://github.com/smartpm/smart.git \
           file://smartpm-rpm5-nodig.patch \
-          file://smart-rpm-root.patch \
           file://smart-recommends.patch \
-          file://smart-rpm-extra-macros.patch \
-          file://smart-dflags.patch \
-          file://smart-rpm-md-parse.patch \
-          file://smart-tmpdir.patch \
-          file://smart-metadata-match.patch \
           file://smart-improve-error-reporting.patch \
-          file://smart-multilib-fixes.patch \
-          file://smart-yaml-error.patch \
           file://smart-channelsdir.patch \
-          file://smart-conflict-provider.patch \
-          file://smart-flag-ignore-recommends.patch \
-          file://smart-flag-exclude-packages.patch \
-          file://smart-config-ignore-all-recommends.patch \
           file://smart-attempt.patch \
-          file://smart-filename-NAME_MAX.patch \
           file://smart-rpm4-fixes.patch \
           file://smart-add-for-rpm-ignoresize-check.patch \
           file://smart-already-installed-message.patch \
          "
 
-SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-SRC_URI[sha256sum] = "b1d519ddb43d60f293b065c28870a5d9e8b591cd49e8c68caea48ace91085eba"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+SRCREV = "407a7eca766431257dcd1da15175cc36a1bb22d0"
+PV = "1.5+git${SRCPV}"
+
+S = "${WORKDIR}/git"
 
 # Options - rpm, qt4, gtk
 PACKAGECONFIG ??= "rpm"
-- 
1.7.9.5


