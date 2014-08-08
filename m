Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF2470AAE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Aug 2014 15:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="466678086"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by azsmga001.ch.intel.com with ESMTP; 08 Aug 2014 15:06:49 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:48 -0500
Message-Id: <0f5a8dd1e3e175be457caf7ab91cae7531d1a9db.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 23/35] wic: Remove unused command versioning support
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:50 -0000

The default is F16 and there's no reason to change that, so remove
everything else.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../3rdparty/pykickstart/commands/bootloader.py    |  49 ------
 .../mic/3rdparty/pykickstart/commands/partition.py |  39 -----
 .../mic/3rdparty/pykickstart/handlers/control.py   | 169 ---------------------
 .../lib/mic/3rdparty/pykickstart/handlers/f10.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/f11.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/f12.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/f13.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/f14.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/f15.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/f7.py    |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/f8.py    |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/f9.py    |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/fc3.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/fc4.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/fc5.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/fc6.py   |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/rhel3.py |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/rhel4.py |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/rhel5.py |  24 ---
 .../lib/mic/3rdparty/pykickstart/handlers/rhel6.py |  24 ---
 20 files changed, 665 deletions(-)
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f10.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f11.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f12.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f13.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f14.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f15.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f7.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f8.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f9.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc3.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc4.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc5.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc6.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel3.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel4.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel5.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel6.py

diff --git a/scripts/lib/mic/3rdparty/pykickstart/commands/bootloader.py b/scripts/lib/mic/3rdparty/pykickstart/commands/bootloader.py
index b227fac..c2b552f 100644
--- a/scripts/lib/mic/3rdparty/pykickstart/commands/bootloader.py
+++ b/scripts/lib/mic/3rdparty/pykickstart/commands/bootloader.py
@@ -214,52 +214,3 @@ class F15_Bootloader(F14_Bootloader):
         op.add_option("--iscrypted", dest="isCrypted", action="store_true", default=False)
         op.add_option("--md5pass", action="callback", callback=password_cb, nargs=1, type="string")
         return op
-
-class RHEL5_Bootloader(FC4_Bootloader):
-    removedKeywords = FC4_Bootloader.removedKeywords
-    removedAttrs = FC4_Bootloader.removedAttrs
-
-    def __init__(self, writePriority=10, *args, **kwargs):
-        FC4_Bootloader.__init__(self, writePriority, *args, **kwargs)
-
-        self.hvArgs = kwargs.get("hvArgs", "")
-
-    def _getArgsAsStr(self):
-        ret = FC4_Bootloader._getArgsAsStr(self)
-
-        if self.hvArgs:
-            ret += " --hvargs=\"%s\"" %(self.hvArgs,)
-
-        return ret
-
-    def _getParser(self):
-        op = FC4_Bootloader._getParser(self)
-        op.add_option("--hvargs", dest="hvArgs", type="string")
-        return op
-
-class RHEL6_Bootloader(F12_Bootloader):
-    removedKeywords = F12_Bootloader.removedKeywords
-    removedAttrs = F12_Bootloader.removedAttrs
-
-    def __init__(self, writePriority=10, *args, **kwargs):
-        F12_Bootloader.__init__(self, writePriority, *args, **kwargs)
-
-        self.isCrypted = kwargs.get("isCrypted", False)
-
-    def _getArgsAsStr(self):
-        ret = F12_Bootloader._getArgsAsStr(self)
-
-        if self.isCrypted:
-            ret += " --iscrypted"
-
-        return ret
-
-    def _getParser(self):
-        def password_cb(option, opt_str, value, parser):
-            parser.values.isCrypted = True
-            parser.values.password = value
-
-        op = F12_Bootloader._getParser(self)
-        op.add_option("--iscrypted", dest="isCrypted", action="store_true", default=False)
-        op.add_option("--md5pass", action="callback", callback=password_cb, nargs=1, type="string")
-        return op
diff --git a/scripts/lib/mic/3rdparty/pykickstart/commands/partition.py b/scripts/lib/mic/3rdparty/pykickstart/commands/partition.py
index e65e012..56b91aa 100644
--- a/scripts/lib/mic/3rdparty/pykickstart/commands/partition.py
+++ b/scripts/lib/mic/3rdparty/pykickstart/commands/partition.py
@@ -115,26 +115,6 @@ class FC4_PartData(FC3_PartData):
 
         return retval
 
-class RHEL5_PartData(FC4_PartData):
-    removedKeywords = FC4_PartData.removedKeywords
-    removedAttrs = FC4_PartData.removedAttrs
-
-    def __init__(self, *args, **kwargs):
-        FC4_PartData.__init__(self, *args, **kwargs)
-        self.encrypted = kwargs.get("encrypted", False)
-        self.passphrase = kwargs.get("passphrase", "")
-
-    def _getArgsAsStr(self):
-        retval = FC4_PartData._getArgsAsStr(self)
-
-        if self.encrypted:
-            retval += " --encrypted"
-
-            if self.passphrase != "":
-                retval += " --passphrase=\"%s\"" % self.passphrase
-
-        return retval
-
 class F9_PartData(FC4_PartData):
     removedKeywords = FC4_PartData.removedKeywords + ["bytesPerInode"]
     removedAttrs = FC4_PartData.removedAttrs + ["bytesPerInode"]
@@ -281,25 +261,6 @@ class FC4_Partition(FC3_Partition):
         op.add_option("--label", dest="label")
         return op
 
-class RHEL5_Partition(FC4_Partition):
-    removedKeywords = FC4_Partition.removedKeywords
-    removedAttrs = FC4_Partition.removedAttrs
-
-    def __init__(self, writePriority=130, *args, **kwargs):
-        FC4_Partition.__init__(self, writePriority, *args, **kwargs)
-
-        def part_cb (option, opt_str, value, parser):
-            if value.startswith("/dev/"):
-                parser.values.ensure_value(option.dest, value[5:])
-            else:
-                parser.values.ensure_value(option.dest, value)
-
-    def _getParser(self):
-        op = FC4_Partition._getParser(self)
-        op.add_option("--encrypted", action="store_true", default=False)
-        op.add_option("--passphrase")
-        return op
-
 class F9_Partition(FC4_Partition):
     removedKeywords = FC4_Partition.removedKeywords
     removedAttrs = FC4_Partition.removedAttrs
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/control.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/control.py
index f6828a4..8dc80d1 100644
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/control.py
+++ b/scripts/lib/mic/3rdparty/pykickstart/handlers/control.py
@@ -26,130 +26,12 @@ from pykickstart.commands import *
 # command names can map to the same class.  However, the Handler will ensure
 # that only one instance of each class ever exists.
 commandMap = {
-    FC3: {
-        "bootloader": bootloader.FC3_Bootloader,
-        "part": partition.FC3_Partition,
-        "partition": partition.FC3_Partition,
-    },
-
-    # based on fc3
-    FC4: {
-        "bootloader": bootloader.FC4_Bootloader,
-        "part": partition.FC4_Partition,
-        "partition": partition.FC4_Partition,
-    },
-
-    # based on fc4
-    FC5: {
-        "bootloader": bootloader.FC4_Bootloader,
-        "part": partition.FC4_Partition,
-        "partition": partition.FC4_Partition,
-    },
-
-    # based on fc5
-    FC6: {
-        "bootloader": bootloader.FC4_Bootloader,
-        "part": partition.FC4_Partition,
-        "partition": partition.FC4_Partition,
-    },
-
-    # based on fc6
-    F7: {
-        "bootloader": bootloader.FC4_Bootloader,
-        "part": partition.FC4_Partition,
-        "partition": partition.FC4_Partition,
-    },
-
-    # based on f7
-    F8: {
-        "bootloader": bootloader.F8_Bootloader,
-        "part": partition.FC4_Partition,
-        "partition": partition.FC4_Partition,
-    },
-
-    # based on f8
-    F9: {
-        "bootloader": bootloader.F8_Bootloader,
-        "part": partition.F9_Partition,
-        "partition": partition.F9_Partition,
-    },
-
-    # based on f9
-    F10: {
-        "bootloader": bootloader.F8_Bootloader,
-        "part": partition.F9_Partition,
-        "partition": partition.F9_Partition,
-    },
-
-    # based on f10
-    F11: {
-        "bootloader": bootloader.F8_Bootloader,
-        "part": partition.F11_Partition,
-        "partition": partition.F11_Partition,
-    },
-
-    # based on f11
-    F12: {
-        "bootloader": bootloader.F12_Bootloader,
-        "part": partition.F12_Partition,
-        "partition": partition.F12_Partition,
-    },
-
-    # based on f12
-    F13: {
-        "bootloader": bootloader.F12_Bootloader,
-        "part": partition.F12_Partition,
-        "partition": partition.F12_Partition,
-    },
-
-    # based on f13
-    F14: {
-        "bootloader": bootloader.F14_Bootloader,
-        "part": partition.F14_Partition,
-        "partition": partition.F14_Partition,
-    },
-
-    # based on f14
-    F15: {
-        "bootloader": bootloader.F15_Bootloader,
-        "part": partition.F14_Partition,
-        "partition": partition.F14_Partition,
-    },
-
     # based on f15
     F16: {
         "bootloader": bootloader.F15_Bootloader,
         "part": partition.F14_Partition,
         "partition": partition.F14_Partition,
     },
-
-    # based on fc1
-    RHEL3: {
-        "bootloader": bootloader.FC3_Bootloader,
-        "part": partition.FC3_Partition,
-        "partition": partition.FC3_Partition,
-    },
-
-    # based on fc3
-    RHEL4: {
-        "bootloader": bootloader.FC3_Bootloader,
-        "part": partition.FC3_Partition,
-        "partition": partition.FC3_Partition,
-    },
-
-    # based on fc6
-    RHEL5: {
-        "bootloader": bootloader.RHEL5_Bootloader,
-        "part": partition.RHEL5_Partition,
-        "partition": partition.RHEL5_Partition,
-    },
-
-    # based on f13ish
-    RHEL6: {
-        "bootloader": bootloader.RHEL6_Bootloader,
-        "part": partition.F12_Partition,
-        "partition": partition.F12_Partition,
-    }
 }
 
 # This map is keyed on kickstart syntax version as provided by
@@ -158,58 +40,7 @@ commandMap = {
 # each name maps to exactly one data class and all data classes have a name.
 # More than one instance of each class is allowed to exist, however.
 dataMap = {
-    FC3: {
-        "PartData": partition.FC3_PartData,
-    },
-    FC4: {
-        "PartData": partition.FC4_PartData,
-    },
-    FC5: {
-        "PartData": partition.FC4_PartData,
-    },
-    FC6: {
-        "PartData": partition.FC4_PartData,
-    },
-    F7: {
-        "PartData": partition.FC4_PartData,
-    },
-    F8: {
-        "PartData": partition.FC4_PartData,
-    },
-    F9: {
-        "PartData": partition.F9_PartData,
-    },
-    F10: {
-        "PartData": partition.F9_PartData,
-    },
-    F11: {
-        "PartData": partition.F11_PartData,
-    },
-    F12: {
-        "PartData": partition.F12_PartData,
-    },
-    F13: {
-        "PartData": partition.F12_PartData,
-    },
-    F14: {
-        "PartData": partition.F14_PartData,
-    },
-    F15: {
-        "PartData": partition.F14_PartData,
-    },
     F16: {
         "PartData": partition.F14_PartData,
     },
-    RHEL3: {
-        "PartData": partition.FC3_PartData,
-    },
-    RHEL4: {
-        "PartData": partition.FC3_PartData,
-    },
-    RHEL5: {
-        "PartData": partition.RHEL5_PartData,
-    },
-    RHEL6: {
-        "PartData": partition.F12_PartData,
-    }
 }
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f10.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/f10.py
deleted file mode 100644
index 17c8211..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/f10.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2008 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class F10Handler(BaseHandler):
-    version = F10
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f11.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/f11.py
deleted file mode 100644
index d21aee3..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/f11.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2008 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class F11Handler(BaseHandler):
-    version = F11
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f12.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/f12.py
deleted file mode 100644
index cea3ece..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/f12.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2009 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class F12Handler(BaseHandler):
-    version = F12
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f13.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/f13.py
deleted file mode 100644
index b94c738..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/f13.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2009 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class F13Handler(BaseHandler):
-    version = F13
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f14.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/f14.py
deleted file mode 100644
index 478f75d..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/f14.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2010 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class F14Handler(BaseHandler):
-    version = F14
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f15.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/f15.py
deleted file mode 100644
index 12aecb4..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/f15.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2010 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class F15Handler(BaseHandler):
-    version = F15
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f7.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/f7.py
deleted file mode 100644
index 5e856ea..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/f7.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class F7Handler(BaseHandler):
-    version = F7
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f8.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/f8.py
deleted file mode 100644
index 1a97881..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/f8.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class F8Handler(BaseHandler):
-    version = F8
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/f9.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/f9.py
deleted file mode 100644
index 116f1b5..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/f9.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class F9Handler(BaseHandler):
-    version = F9
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/fc3.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/fc3.py
deleted file mode 100644
index a115dc2..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/fc3.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2005, 2006, 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class FC3Handler(BaseHandler):
-    version = FC3
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/fc4.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/fc4.py
deleted file mode 100644
index fd47b73..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/fc4.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class FC4Handler(BaseHandler):
-    version = FC4
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/fc5.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/fc5.py
deleted file mode 100644
index bcdc29d..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/fc5.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class FC5Handler(BaseHandler):
-    version = FC5
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/fc6.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/fc6.py
deleted file mode 100644
index c83a929..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/fc6.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2006, 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class FC6Handler(BaseHandler):
-    version = FC6
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel3.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel3.py
deleted file mode 100644
index 131763c..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel3.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class RHEL3Handler(BaseHandler):
-    version = RHEL3
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel4.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel4.py
deleted file mode 100644
index 3496c43..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel4.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class RHEL4Handler(BaseHandler):
-    version = RHEL4
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel5.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel5.py
deleted file mode 100644
index abb7a8d..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel5.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2007 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class RHEL5Handler(BaseHandler):
-    version = RHEL5
diff --git a/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel6.py b/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel6.py
deleted file mode 100644
index 7202419..0000000
--- a/scripts/lib/mic/3rdparty/pykickstart/handlers/rhel6.py
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Chris Lumens <clumens@redhat.com>
-#
-# Copyright 2010 Red Hat, Inc.
-#
-# This copyrighted material is made available to anyone wishing to use, modify,
-# copy, or redistribute it subject to the terms and conditions of the GNU
-# General Public License v.2.  This program is distributed in the hope that it
-# will be useful, but WITHOUT ANY WARRANTY expressed or implied, including the
-# implied warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along with
-# this program; if not, write to the Free Software Foundation, Inc., 51
-# Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  Any Red Hat
-# trademarks that are incorporated in the source code or documentation are not
-# subject to the GNU General Public License and may only be used or replicated
-# with the express permission of Red Hat, Inc. 
-#
-from pykickstart.base import *
-from pykickstart.version import *
-
-class RHEL6Handler(BaseHandler):
-    version = RHEL6
-- 
1.8.3.1


