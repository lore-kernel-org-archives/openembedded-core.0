Return-Path: <Lu.Jiang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61D92793DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 10:03:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7UA3ME8030202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:03:22 -0700
Received: from pek-ljiang0-d1.wrs.com (128.224.162.214) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 03:03:21 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2018 18:01:17 +0800
Message-ID: <1535623282-13919-3-git-send-email-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535623282-13919-1-git-send-email-lu.jiang@windriver.com>
References: <1535623282-13919-1-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] wic:move wic src into meta/receipt-support/wic
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
X-List-Received-Date: Thu, 30 Aug 2018 10:03:22 -0000
Content-Type: text/plain

Move wic src into package directory.

Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
---
 meta/recipes-support/wic/files/wic.py              |  542 ++++++++++
 meta/recipes-support/wic/files/wic/__init__.py     |   20 +
 meta/recipes-support/wic/files/wic/engine.py       |  578 +++++++++++
 meta/recipes-support/wic/files/wic/filemap.py      |  600 +++++++++++
 meta/recipes-support/wic/files/wic/help.py         | 1055 ++++++++++++++++++++
 meta/recipes-support/wic/files/wic/ksparser.py     |  235 +++++
 meta/recipes-support/wic/files/wic/misc.py         |  263 +++++
 meta/recipes-support/wic/files/wic/partition.py    |  424 ++++++++
 meta/recipes-support/wic/files/wic/pluginbase.py   |  149 +++
 .../wic/files/wic/plugins/imager/direct.py         |  611 ++++++++++++
 .../wic/files/wic/plugins/source/bootimg-efi.py    |  274 +++++
 .../files/wic/plugins/source/bootimg-partition.py  |  207 ++++
 .../wic/files/wic/plugins/source/bootimg-pcbios.py |  207 ++++
 .../files/wic/plugins/source/isoimage-isohybrid.py |  443 ++++++++
 .../wic/files/wic/plugins/source/rawcopy.py        |   91 ++
 .../wic/files/wic/plugins/source/rootfs.py         |  126 +++
 scripts/lib/wic/__init__.py                        |   20 -
 scripts/lib/wic/engine.py                          |  578 -----------
 scripts/lib/wic/filemap.py                         |  600 -----------
 scripts/lib/wic/help.py                            | 1055 --------------------
 scripts/lib/wic/ksparser.py                        |  235 -----
 scripts/lib/wic/misc.py                            |  263 -----
 scripts/lib/wic/partition.py                       |  424 --------
 scripts/lib/wic/pluginbase.py                      |  149 ---
 scripts/lib/wic/plugins/imager/direct.py           |  611 ------------
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  274 -----
 .../lib/wic/plugins/source/bootimg-partition.py    |  207 ----
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  207 ----
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  443 --------
 scripts/lib/wic/plugins/source/rawcopy.py          |   91 --
 scripts/lib/wic/plugins/source/rootfs.py           |  126 ---
 scripts/wic                                        |  542 ----------
 32 files changed, 5825 insertions(+), 5825 deletions(-)
 create mode 100755 meta/recipes-support/wic/files/wic.py
 create mode 100644 meta/recipes-support/wic/files/wic/__init__.py
 create mode 100644 meta/recipes-support/wic/files/wic/engine.py
 create mode 100644 meta/recipes-support/wic/files/wic/filemap.py
 create mode 100644 meta/recipes-support/wic/files/wic/help.py
 create mode 100644 meta/recipes-support/wic/files/wic/ksparser.py
 create mode 100644 meta/recipes-support/wic/files/wic/misc.py
 create mode 100644 meta/recipes-support/wic/files/wic/partition.py
 create mode 100644 meta/recipes-support/wic/files/wic/pluginbase.py
 create mode 100644 meta/recipes-support/wic/files/wic/plugins/imager/direct.py
 create mode 100644 meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
 create mode 100644 meta/recipes-support/wic/files/wic/plugins/source/bootimg-partition.py
 create mode 100644 meta/recipes-support/wic/files/wic/plugins/source/bootimg-pcbios.py
 create mode 100644 meta/recipes-support/wic/files/wic/plugins/source/isoimage-isohybrid.py
 create mode 100644 meta/recipes-support/wic/files/wic/plugins/source/rawcopy.py
 create mode 100644 meta/recipes-support/wic/files/wic/plugins/source/rootfs.py
 delete mode 100644 scripts/lib/wic/__init__.py
 delete mode 100644 scripts/lib/wic/engine.py
 delete mode 100644 scripts/lib/wic/filemap.py
 delete mode 100644 scripts/lib/wic/help.py
 delete mode 100644 scripts/lib/wic/ksparser.py
 delete mode 100644 scripts/lib/wic/misc.py
 delete mode 100644 scripts/lib/wic/partition.py
 delete mode 100644 scripts/lib/wic/pluginbase.py
 delete mode 100644 scripts/lib/wic/plugins/imager/direct.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg-efi.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg-partition.py
 delete mode 100644 scripts/lib/wic/plugins/source/bootimg-pcbios.py
 delete mode 100644 scripts/lib/wic/plugins/source/isoimage-isohybrid.py
 delete mode 100644 scripts/lib/wic/plugins/source/rawcopy.py
 delete mode 100644 scripts/lib/wic/plugins/source/rootfs.py
 delete mode 100755 scripts/wic

diff --git a/meta/recipes-support/wic/files/wic.py b/meta/recipes-support/wic/files/wic.py
new file mode 100755
index 0000000..7392bc4
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic.py
@@ -0,0 +1,542 @@
+#!/usr/bin/env python3
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION 'wic' is the OpenEmbedded Image Creator that users can
+# use to generate bootable images.  Invoking it without any arguments
+# will display help screens for the 'wic' command and list the
+# available 'wic' subcommands.  Invoking a subcommand without any
+# arguments will likewise display help screens for the specified
+# subcommand.  Please use that interface for detailed help.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+__version__ = "0.2.0"
+
+# Python Standard Library modules
+import os
+import sys
+import argparse
+import logging
+
+from collections import namedtuple
+from distutils import spawn
+
+# External modules
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path.insert(0, lib_path)
+import scriptpath
+scriptpath.add_oe_lib_path()
+
+# Check whether wic is running within eSDK environment
+sdkroot = scripts_path
+if os.environ.get('SDKTARGETSYSROOT'):
+    while sdkroot != '' and sdkroot != os.sep:
+        if os.path.exists(os.path.join(sdkroot, '.devtoolbase')):
+            # Set BUILDDIR for wic to work within eSDK
+            os.environ['BUILDDIR'] = sdkroot
+            # .devtoolbase only exists within eSDK
+            # If found, initialize bitbake path for eSDK environment and append to PATH
+            sdkroot = os.path.join(os.path.dirname(scripts_path), 'bitbake', 'bin')
+            os.environ['PATH'] += ":" + sdkroot
+            break
+        sdkroot = os.path.dirname(sdkroot)
+
+bitbake_exe = spawn.find_executable('bitbake')
+if bitbake_exe:
+    bitbake_path = scriptpath.add_bitbake_lib_path()
+    from bb import cookerdata
+    from bb.main import bitbake_main, BitBakeConfigParameters
+else:
+    bitbake_main = None
+
+from wic import WicError
+from wic.misc import get_bitbake_var, BB_VARS
+from wic import engine
+from wic import help as hlp
+
+
+def wic_logger():
+    """Create and convfigure wic logger."""
+    logger = logging.getLogger('wic')
+    logger.setLevel(logging.INFO)
+
+    handler = logging.StreamHandler()
+
+    formatter = logging.Formatter('%(levelname)s: %(message)s')
+    handler.setFormatter(formatter)
+
+    logger.addHandler(handler)
+
+    return logger
+
+logger = wic_logger()
+
+def rootfs_dir_to_args(krootfs_dir):
+    """
+    Get a rootfs_dir dict and serialize to string
+    """
+    rootfs_dir = ''
+    for key, val in krootfs_dir.items():
+        rootfs_dir += ' '
+        rootfs_dir += '='.join([key, val])
+    return rootfs_dir.strip()
+
+
+class RootfsArgAction(argparse.Action):
+    def __init__(self, **kwargs):
+        super().__init__(**kwargs)
+
+    def __call__(self, parser, namespace, value, option_string=None):
+        if not "rootfs_dir" in vars(namespace) or \
+           not type(namespace.__dict__['rootfs_dir']) is dict:
+            namespace.__dict__['rootfs_dir'] = {}
+
+        if '=' in value:
+            (key, rootfs_dir) = value.split('=')
+        else:
+            key = 'ROOTFS_DIR'
+            rootfs_dir = value
+
+        namespace.__dict__['rootfs_dir'][key] = rootfs_dir
+
+
+def wic_create_subcommand(options, usage_str):
+    """
+    Command-line handling for image creation.  The real work is done
+    by image.engine.wic_create()
+    """
+    if options.build_rootfs and not bitbake_main:
+        raise WicError("Can't build rootfs as bitbake is not in the $PATH")
+
+    if not options.image_name:
+        missed = []
+        for val, opt in [(options.rootfs_dir, 'rootfs-dir'),
+                         (options.bootimg_dir, 'bootimg-dir'),
+                         (options.kernel_dir, 'kernel-dir'),
+                         (options.native_sysroot, 'native-sysroot')]:
+            if not val:
+                missed.append(opt)
+        if missed:
+            raise WicError("The following build artifacts are not specified: %s" %
+                           ", ".join(missed))
+
+    if options.image_name:
+        BB_VARS.default_image = options.image_name
+    else:
+        options.build_check = False
+
+    if options.vars_dir:
+        BB_VARS.vars_dir = options.vars_dir
+
+    if options.build_check and not engine.verify_build_env():
+        raise WicError("Couldn't verify build environment, exiting")
+
+    if options.debug:
+        logger.setLevel(logging.DEBUG)
+
+    if options.image_name:
+        if options.build_rootfs:
+            argv = ["bitbake", options.image_name]
+            if options.debug:
+                argv.append("--debug")
+
+            logger.info("Building rootfs...\n")
+            if bitbake_main(BitBakeConfigParameters(argv),
+                            cookerdata.CookerConfiguration()):
+                raise WicError("bitbake exited with error")
+
+        rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
+        kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
+        bootimg_dir = get_bitbake_var("STAGING_DATADIR", options.image_name)
+
+        native_sysroot = options.native_sysroot
+        if options.vars_dir and not native_sysroot:
+            native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", options.image_name)
+    else:
+        if options.build_rootfs:
+            raise WicError("Image name is not specified, exiting. "
+                           "(Use -e/--image-name to specify it)")
+        native_sysroot = options.native_sysroot
+
+    if not options.vars_dir and (not native_sysroot or not os.path.isdir(native_sysroot)):
+        logger.info("Building wic-tools...\n")
+        if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
+                        cookerdata.CookerConfiguration()):
+            raise WicError("bitbake wic-tools failed")
+        native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
+
+    if not native_sysroot:
+        raise WicError("Unable to find the location of the native tools sysroot")
+
+    wks_file = options.wks_file
+
+    if not wks_file.endswith(".wks"):
+        wks_file = engine.find_canned_image(scripts_path, wks_file)
+        if not wks_file:
+            raise WicError("No image named %s found, exiting.  (Use 'wic list images' "
+                           "to list available images, or specify a fully-qualified OE "
+                           "kickstart (.wks) filename)" % options.wks_file)
+
+    if not options.image_name:
+        rootfs_dir = ''
+        if 'ROOTFS_DIR' in options.rootfs_dir:
+            rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
+        bootimg_dir = options.bootimg_dir
+        kernel_dir = options.kernel_dir
+        native_sysroot = options.native_sysroot
+        if rootfs_dir and not os.path.isdir(rootfs_dir):
+            raise WicError("--rootfs-dir (-r) not found, exiting")
+        if not os.path.isdir(bootimg_dir):
+            raise WicError("--bootimg-dir (-b) not found, exiting")
+        if not os.path.isdir(kernel_dir):
+            raise WicError("--kernel-dir (-k) not found, exiting")
+        if not os.path.isdir(native_sysroot):
+            raise WicError("--native-sysroot (-n) not found, exiting")
+    else:
+        not_found = not_found_dir = ""
+        if not os.path.isdir(rootfs_dir):
+            (not_found, not_found_dir) = ("rootfs-dir", rootfs_dir)
+        elif not os.path.isdir(kernel_dir):
+            (not_found, not_found_dir) = ("kernel-dir", kernel_dir)
+        elif not os.path.isdir(native_sysroot):
+            (not_found, not_found_dir) = ("native-sysroot", native_sysroot)
+        if not_found:
+            if not not_found_dir:
+                not_found_dir = "Completely missing artifact - wrong image (.wks) used?"
+            logger.info("Build artifacts not found, exiting.")
+            logger.info("  (Please check that the build artifacts for the machine")
+            logger.info("   selected in local.conf actually exist and that they")
+            logger.info("   are the correct artifacts for the image (.wks file)).\n")
+            raise WicError("The artifact that couldn't be found was %s:\n  %s", not_found, not_found_dir)
+
+    krootfs_dir = options.rootfs_dir
+    if krootfs_dir is None:
+        krootfs_dir = {}
+        krootfs_dir['ROOTFS_DIR'] = rootfs_dir
+
+    rootfs_dir = rootfs_dir_to_args(krootfs_dir)
+
+    logger.info("Creating image(s)...\n")
+    engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+                      native_sysroot, options)
+
+
+def wic_list_subcommand(args, usage_str):
+    """
+    Command-line handling for listing available images.
+    The real work is done by image.engine.wic_list()
+    """
+    if not engine.wic_list(args, scripts_path):
+        raise WicError("Bad list arguments, exiting")
+
+
+def wic_ls_subcommand(args, usage_str):
+    """
+    Command-line handling for list content of images.
+    The real work is done by engine.wic_ls()
+    """
+    engine.wic_ls(args, args.native_sysroot)
+
+def wic_cp_subcommand(args, usage_str):
+    """
+    Command-line handling for copying files/dirs to images.
+    The real work is done by engine.wic_cp()
+    """
+    engine.wic_cp(args, args.native_sysroot)
+
+def wic_rm_subcommand(args, usage_str):
+    """
+    Command-line handling for removing files/dirs from images.
+    The real work is done by engine.wic_rm()
+    """
+    engine.wic_rm(args, args.native_sysroot)
+
+def wic_write_subcommand(args, usage_str):
+    """
+    Command-line handling for writing images.
+    The real work is done by engine.wic_write()
+    """
+    engine.wic_write(args, args.native_sysroot)
+
+def wic_help_subcommand(args, usage_str):
+    """
+    Command-line handling for help subcommand to keep the current
+    structure of the function definitions.
+    """
+    pass
+
+
+def wic_help_topic_subcommand(usage_str, help_str):
+    """
+    Display function for help 'sub-subcommands'.
+    """
+    print(help_str)
+    return
+
+
+wic_help_topic_usage = """
+"""
+
+helptopics = {
+    "plugins":   [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_plugins_help],
+    "overview":  [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_overview_help],
+    "kickstart": [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_kickstart_help],
+    "create":    [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_create_help],
+    "ls":        [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_ls_help],
+    "cp":        [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_cp_help],
+    "rm":        [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_rm_help],
+    "write":     [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_write_help],
+    "list":      [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_list_help]
+}
+
+
+def wic_init_parser_create(subparser):
+    subparser.add_argument("wks_file")
+
+    subparser.add_argument("-o", "--outdir", dest="outdir", default='.',
+                      help="name of directory to create image in")
+    subparser.add_argument("-e", "--image-name", dest="image_name",
+                      help="name of the image to use the artifacts from "
+                           "e.g. core-image-sato")
+    subparser.add_argument("-r", "--rootfs-dir", action=RootfsArgAction,
+                      help="path to the /rootfs dir to use as the "
+                           ".wks rootfs source")
+    subparser.add_argument("-b", "--bootimg-dir", dest="bootimg_dir",
+                      help="path to the dir containing the boot artifacts "
+                           "(e.g. /EFI or /syslinux dirs) to use as the "
+                           ".wks bootimg source")
+    subparser.add_argument("-k", "--kernel-dir", dest="kernel_dir",
+                      help="path to the dir containing the kernel to use "
+                           "in the .wks bootimg")
+    subparser.add_argument("-n", "--native-sysroot", dest="native_sysroot",
+                      help="path to the native sysroot containing the tools "
+                           "to use to build the image")
+    subparser.add_argument("-s", "--skip-build-check", dest="build_check",
+                      action="store_false", default=True, help="skip the build check")
+    subparser.add_argument("-f", "--build-rootfs", action="store_true", help="build rootfs")
+    subparser.add_argument("-c", "--compress-with", choices=("gzip", "bzip2", "xz"),
+                      dest='compressor',
+                      help="compress image with specified compressor")
+    subparser.add_argument("-m", "--bmap", action="store_true", help="generate .bmap")
+    subparser.add_argument("--no-fstab-update" ,action="store_true",
+                      help="Do not change fstab file.")
+    subparser.add_argument("-v", "--vars", dest='vars_dir',
+                      help="directory with <image>.env files that store "
+                           "bitbake variables")
+    subparser.add_argument("-D", "--debug", dest="debug", action="store_true",
+                      default=False, help="output debug information")
+    return
+
+
+def wic_init_parser_list(subparser):
+    subparser.add_argument("list_type",
+                        help="can be 'images' or 'source-plugins' "
+                             "to obtain a list. "
+                             "If value is a valid .wks image file")
+    subparser.add_argument("help_for", default=[], nargs='*',
+                        help="If 'list_type' is a valid .wks image file "
+                             "this value can be 'help' to show the help information "
+                             "defined inside the .wks file")
+    return
+
+def imgtype(arg):
+    """
+    Custom type for ArgumentParser
+    Converts path spec to named tuple: (image, partition, path)
+    """
+    image = arg
+    part = path = None
+    if ':' in image:
+        image, part = image.split(':')
+        if '/' in part:
+            part, path = part.split('/', 1)
+        if not path:
+            path = '/'
+
+    if not os.path.isfile(image):
+        err = "%s is not a regular file or symlink" % image
+        raise argparse.ArgumentTypeError(err)
+
+    return namedtuple('ImgType', 'image part path')(image, part, path)
+
+def wic_init_parser_ls(subparser):
+    subparser.add_argument("path", type=imgtype,
+                        help="image spec: <image>[:<vfat partition>[<path>]]")
+    subparser.add_argument("-n", "--native-sysroot",
+                        help="path to the native sysroot containing the tools")
+
+def imgpathtype(arg):
+    img = imgtype(arg)
+    if img.part is None:
+        raise argparse.ArgumentTypeError("partition number is not specified")
+    return img
+
+def wic_init_parser_cp(subparser):
+    subparser.add_argument("src",
+                        help="source spec")
+    subparser.add_argument("dest", type=imgpathtype,
+                        help="image spec: <image>:<vfat partition>[<path>]")
+    subparser.add_argument("-n", "--native-sysroot",
+                        help="path to the native sysroot containing the tools")
+
+def wic_init_parser_rm(subparser):
+    subparser.add_argument("path", type=imgpathtype,
+                        help="path: <image>:<vfat partition><path>")
+    subparser.add_argument("-n", "--native-sysroot",
+                        help="path to the native sysroot containing the tools")
+
+def expandtype(rules):
+    """
+    Custom type for ArgumentParser
+    Converts expand rules to the dictionary {<partition>: size}
+    """
+    if rules == 'auto':
+        return {}
+    result = {}
+    for rule in rules.split('-'):
+        try:
+            part, size = rule.split(':')
+        except ValueError:
+            raise argparse.ArgumentTypeError("Incorrect rule format: %s" % rule)
+
+        if not part.isdigit():
+            raise argparse.ArgumentTypeError("Rule '%s': partition number must be integer" % rule)
+
+        # validate size
+        multiplier = 1
+        for suffix, mult in [('K', 1024), ('M', 1024 * 1024), ('G', 1024 * 1024 * 1024)]:
+            if size.upper().endswith(suffix):
+                multiplier = mult
+                size = size[:-1]
+                break
+        if not size.isdigit():
+            raise argparse.ArgumentTypeError("Rule '%s': size must be integer" % rule)
+
+        result[int(part)] = int(size) * multiplier
+
+    return result
+
+def wic_init_parser_write(subparser):
+    subparser.add_argument("image",
+                        help="path to the wic image")
+    subparser.add_argument("target",
+                        help="target file or device")
+    subparser.add_argument("-e", "--expand", type=expandtype,
+                        help="expand rules: auto or <partition>:<size>[,<partition>:<size>]")
+    subparser.add_argument("-n", "--native-sysroot",
+                        help="path to the native sysroot containing the tools")
+
+def wic_init_parser_help(subparser):
+    helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
+    for helptopic in helptopics:
+        helpparsers.add_parser(helptopic, help=helptopics[helptopic][2])
+    return
+
+
+subcommands = {
+    "create":    [wic_create_subcommand,
+                  hlp.wic_create_usage,
+                  hlp.wic_create_help,
+                  wic_init_parser_create],
+    "list":      [wic_list_subcommand,
+                  hlp.wic_list_usage,
+                  hlp.wic_list_help,
+                  wic_init_parser_list],
+    "ls":        [wic_ls_subcommand,
+                  hlp.wic_ls_usage,
+                  hlp.wic_ls_help,
+                  wic_init_parser_ls],
+    "cp":        [wic_cp_subcommand,
+                  hlp.wic_cp_usage,
+                  hlp.wic_cp_help,
+                  wic_init_parser_cp],
+    "rm":        [wic_rm_subcommand,
+                  hlp.wic_rm_usage,
+                  hlp.wic_rm_help,
+                  wic_init_parser_rm],
+    "write":     [wic_write_subcommand,
+                  hlp.wic_write_usage,
+                  hlp.wic_write_help,
+                  wic_init_parser_write],
+    "help":      [wic_help_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_help_help,
+                  wic_init_parser_help]
+}
+
+
+def init_parser(parser):
+    parser.add_argument("--version", action="version",
+        version="%(prog)s {version}".format(version=__version__))
+    subparsers = parser.add_subparsers(dest='command', help=hlp.wic_usage)
+    for subcmd in subcommands:
+        subparser = subparsers.add_parser(subcmd, help=subcommands[subcmd][2])
+        subcommands[subcmd][3](subparser)
+
+
+def main(argv):
+    parser = argparse.ArgumentParser(
+        description="wic version %s" % __version__)
+
+    init_parser(parser)
+
+    args = parser.parse_args(argv)
+
+    if "command" in vars(args):
+        if args.command == "help":
+            if args.help_topic is None:
+                parser.print_help()
+                print()
+                print("Please specify a help topic")
+            elif args.help_topic in helptopics:
+                hlpt = helptopics[args.help_topic]
+                hlpt[0](hlpt[1], hlpt[2])
+            return 0
+
+    return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
+
+
+if __name__ == "__main__":
+    try:
+        sys.exit(main(sys.argv[1:]))
+    except WicError as err:
+        print()
+        logger.error(err)
+        sys.exit(1)
diff --git a/meta/recipes-support/wic/files/wic/__init__.py b/meta/recipes-support/wic/files/wic/__init__.py
new file mode 100644
index 0000000..85876b1
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/__init__.py
@@ -0,0 +1,20 @@
+#!/usr/bin/env python -tt
+#
+# Copyright (c) 2007 Red Hat, Inc.
+# Copyright (c) 2011 Intel, Inc.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License as published by the Free
+# Software Foundation; version 2 of the License
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc., 59
+# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+
+class WicError(Exception):
+    pass
diff --git a/meta/recipes-support/wic/files/wic/engine.py b/meta/recipes-support/wic/files/wic/engine.py
new file mode 100644
index 0000000..850cec3
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/engine.py
@@ -0,0 +1,578 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+
+# This module implements the image creation engine used by 'wic' to
+# create images.  The engine parses through the OpenEmbedded kickstart
+# (wks) file specified and generates images that can then be directly
+# written onto media.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import logging
+import os
+import tempfile
+import json
+import subprocess
+
+from collections import namedtuple, OrderedDict
+from distutils.spawn import find_executable
+
+from wic import WicError
+from wic.filemap import sparse_copy
+from wic.pluginbase import PluginMgr
+from wic.misc import get_bitbake_var, exec_cmd
+
+logger = logging.getLogger('wic')
+
+def verify_build_env():
+    """
+    Verify that the build environment is sane.
+
+    Returns True if it is, false otherwise
+    """
+    if not os.environ.get("BUILDDIR"):
+        raise WicError("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
+
+    return True
+
+
+CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
+SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
+WIC_DIR = "wic"
+
+def build_canned_image_list(path):
+    layers_path = get_bitbake_var("BBLAYERS")
+    canned_wks_layer_dirs = []
+
+    if layers_path is not None:
+        for layer_path in layers_path.split():
+            for wks_path in (WIC_DIR, SCRIPTS_CANNED_IMAGE_DIR):
+                cpath = os.path.join(layer_path, wks_path)
+                if os.path.isdir(cpath):
+                    canned_wks_layer_dirs.append(cpath)
+
+    cpath = os.path.join(path, CANNED_IMAGE_DIR)
+    canned_wks_layer_dirs.append(cpath)
+
+    return canned_wks_layer_dirs
+
+def find_canned_image(scripts_path, wks_file):
+    """
+    Find a .wks file with the given name in the canned files dir.
+
+    Return False if not found
+    """
+    layers_canned_wks_dir = build_canned_image_list(scripts_path)
+
+    for canned_wks_dir in layers_canned_wks_dir:
+        for root, dirs, files in os.walk(canned_wks_dir):
+            for fname in files:
+                if fname.endswith("~") or fname.endswith("#"):
+                    continue
+                if fname.endswith(".wks") and wks_file + ".wks" == fname:
+                    fullpath = os.path.join(canned_wks_dir, fname)
+                    return fullpath
+    return None
+
+
+def list_canned_images(scripts_path):
+    """
+    List the .wks files in the canned image dir, minus the extension.
+    """
+    layers_canned_wks_dir = build_canned_image_list(scripts_path)
+
+    for canned_wks_dir in layers_canned_wks_dir:
+        for root, dirs, files in os.walk(canned_wks_dir):
+            for fname in files:
+                if fname.endswith("~") or fname.endswith("#"):
+                    continue
+                if fname.endswith(".wks"):
+                    fullpath = os.path.join(canned_wks_dir, fname)
+                    with open(fullpath) as wks:
+                        for line in wks:
+                            desc = ""
+                            idx = line.find("short-description:")
+                            if idx != -1:
+                                desc = line[idx + len("short-description:"):].strip()
+                                break
+                    basename = os.path.splitext(fname)[0]
+                    print("  %s\t\t%s" % (basename.ljust(30), desc))
+
+
+def list_canned_image_help(scripts_path, fullpath):
+    """
+    List the help and params in the specified canned image.
+    """
+    found = False
+    with open(fullpath) as wks:
+        for line in wks:
+            if not found:
+                idx = line.find("long-description:")
+                if idx != -1:
+                    print()
+                    print(line[idx + len("long-description:"):].strip())
+                    found = True
+                continue
+            if not line.strip():
+                break
+            idx = line.find("#")
+            if idx != -1:
+                print(line[idx + len("#:"):].rstrip())
+            else:
+                break
+
+
+def list_source_plugins():
+    """
+    List the available source plugins i.e. plugins available for --source.
+    """
+    plugins = PluginMgr.get_plugins('source')
+
+    for plugin in plugins:
+        print("  %s" % plugin)
+
+
+def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+               native_sysroot, options):
+    """
+    Create image
+
+    wks_file - user-defined OE kickstart file
+    rootfs_dir - absolute path to the build's /rootfs dir
+    bootimg_dir - absolute path to the build's boot artifacts directory
+    kernel_dir - absolute path to the build's kernel directory
+    native_sysroot - absolute path to the build's native sysroots dir
+    image_output_dir - dirname to create for image
+    options - wic command line options (debug, bmap, etc)
+
+    Normally, the values for the build artifacts values are determined
+    by 'wic -e' from the output of the 'bitbake -e' command given an
+    image name e.g. 'core-image-minimal' and a given machine set in
+    local.conf.  If that's the case, the variables get the following
+    values from the output of 'bitbake -e':
+
+    rootfs_dir:        IMAGE_ROOTFS
+    kernel_dir:        DEPLOY_DIR_IMAGE
+    native_sysroot:    STAGING_DIR_NATIVE
+
+    In the above case, bootimg_dir remains unset and the
+    plugin-specific image creation code is responsible for finding the
+    bootimg artifacts.
+
+    In the case where the values are passed in explicitly i.e 'wic -e'
+    is not used but rather the individual 'wic' options are used to
+    explicitly specify these values.
+    """
+    try:
+        oe_builddir = os.environ["BUILDDIR"]
+    except KeyError:
+        raise WicError("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
+
+    if not os.path.exists(options.outdir):
+        os.makedirs(options.outdir)
+
+    pname = 'direct'
+    plugin_class = PluginMgr.get_plugins('imager').get(pname)
+    if not plugin_class:
+        raise WicError('Unknown plugin: %s' % pname)
+
+    plugin = plugin_class(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+                          native_sysroot, oe_builddir, options)
+
+    plugin.do_create()
+
+    logger.info("The image(s) were created using OE kickstart file:\n  %s", wks_file)
+
+
+def wic_list(args, scripts_path):
+    """
+    Print the list of images or source plugins.
+    """
+    if args.list_type is None:
+        return False
+
+    if args.list_type == "images":
+
+        list_canned_images(scripts_path)
+        return True
+    elif args.list_type == "source-plugins":
+        list_source_plugins()
+        return True
+    elif len(args.help_for) == 1 and args.help_for[0] == 'help':
+        wks_file = args.list_type
+        fullpath = find_canned_image(scripts_path, wks_file)
+        if not fullpath:
+            raise WicError("No image named %s found, exiting. "
+                           "(Use 'wic list images' to list available images, "
+                           "or specify a fully-qualified OE kickstart (.wks) "
+                           "filename)" % wks_file)
+
+        list_canned_image_help(scripts_path, fullpath)
+        return True
+
+    return False
+
+
+class Disk:
+    def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
+        self.imagepath = imagepath
+        self.native_sysroot = native_sysroot
+        self.fstypes = fstypes
+        self._partitions = None
+        self._partimages = {}
+        self._lsector_size = None
+        self._psector_size = None
+        self._ptable_format = None
+
+        # find parted
+        self.paths = "/bin:/usr/bin:/usr/sbin:/sbin/"
+        if native_sysroot:
+            for path in self.paths.split(':'):
+                self.paths = "%s%s:%s" % (native_sysroot, path, self.paths)
+
+        self.parted = find_executable("parted", self.paths)
+        if not self.parted:
+            raise WicError("Can't find executable parted")
+
+        self.partitions = self.get_partitions()
+
+    def __del__(self):
+        for path in self._partimages.values():
+            os.unlink(path)
+
+    def get_partitions(self):
+        if self._partitions is None:
+            self._partitions = OrderedDict()
+            out = exec_cmd("%s -sm %s unit B print" % (self.parted, self.imagepath))
+            parttype = namedtuple("Part", "pnum start end size fstype")
+            splitted = out.splitlines()
+            lsector_size, psector_size, self._ptable_format = splitted[1].split(":")[3:6]
+            self._lsector_size = int(lsector_size)
+            self._psector_size = int(psector_size)
+            for line in splitted[2:]:
+                pnum, start, end, size, fstype = line.split(':')[:5]
+                partition = parttype(int(pnum), int(start[:-1]), int(end[:-1]),
+                                     int(size[:-1]), fstype)
+                self._partitions[pnum] = partition
+
+        return self._partitions
+
+    def __getattr__(self, name):
+        """Get path to the executable in a lazy way."""
+        if name in ("mdir", "mcopy", "mdel", "mdeltree", "sfdisk", "e2fsck",
+                    "resize2fs", "mkswap", "mkdosfs", "debugfs"):
+            aname = "_%s" % name
+            if aname not in self.__dict__:
+                setattr(self, aname, find_executable(name, self.paths))
+                if aname not in self.__dict__ or self.__dict__[aname] is None:
+                    raise WicError("Can't find executable '{}'".format(name))
+            return self.__dict__[aname]
+        return self.__dict__[name]
+
+    def _get_part_image(self, pnum):
+        if pnum not in self.partitions:
+            raise WicError("Partition %s is not in the image")
+        part = self.partitions[pnum]
+        # check if fstype is supported
+        for fstype in self.fstypes:
+            if part.fstype.startswith(fstype):
+                break
+        else:
+            raise WicError("Not supported fstype: {}".format(part.fstype))
+        if pnum not in self._partimages:
+            tmpf = tempfile.NamedTemporaryFile(prefix="wic-part")
+            dst_fname = tmpf.name
+            tmpf.close()
+            sparse_copy(self.imagepath, dst_fname, skip=part.start, length=part.size)
+            self._partimages[pnum] = dst_fname
+
+        return self._partimages[pnum]
+
+    def _put_part_image(self, pnum):
+        """Put partition image into partitioned image."""
+        sparse_copy(self._partimages[pnum], self.imagepath,
+                    seek=self.partitions[pnum].start)
+
+    def dir(self, pnum, path):
+        if self.partitions[pnum].fstype.startswith('ext'):
+            return exec_cmd("{} {} -R 'ls -l {}'".format(self.debugfs,
+                                                         self._get_part_image(pnum),
+                                                         path), as_shell=True)
+        else: # fat
+            return exec_cmd("{} -i {} ::{}".format(self.mdir,
+                                                   self._get_part_image(pnum),
+                                                   path))
+
+    def copy(self, src, pnum, path):
+        """Copy partition image into wic image."""
+        if self.partitions[pnum].fstype.startswith('ext'):
+            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
+                      format(path, src, os.path.basename(src),
+                             self.debugfs, self._get_part_image(pnum))
+        else: # fat
+            cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
+                                                  self._get_part_image(pnum),
+                                                  src, path)
+        exec_cmd(cmd, as_shell=True)
+        self._put_part_image(pnum)
+
+    def remove(self, pnum, path):
+        """Remove files/dirs from the partition."""
+        partimg = self._get_part_image(pnum)
+        if self.partitions[pnum].fstype.startswith('ext'):
+            cmd = "{} {} -wR 'rm {}'".format(self.debugfs,
+                                                self._get_part_image(pnum),
+                                                path)
+            out = exec_cmd(cmd , as_shell=True)
+            for line in out.splitlines():
+                if line.startswith("rm:"):
+                    if "file is a directory" in line:
+                        # Try rmdir to see if this is an empty directory. This won't delete
+                        # any non empty directory so let user know about any error that this might
+                        # generate.
+                        print(exec_cmd("{} {} -wR 'rmdir {}'".format(self.debugfs,
+                                                    self._get_part_image(pnum),
+                                                    path), as_shell=True))
+                    else:
+                        raise WicError("Could not complete operation: wic %s" % str(line))
+        else: # fat
+            cmd = "{} -i {} ::{}".format(self.mdel, partimg, path)
+            try:
+                exec_cmd(cmd)
+            except WicError as err:
+                if "not found" in str(err) or "non empty" in str(err):
+                    # mdel outputs 'File ... not found' or 'directory .. non empty"
+                    # try to use mdeltree as path could be a directory
+                    cmd = "{} -i {} ::{}".format(self.mdeltree,
+                                                 partimg, path)
+                    exec_cmd(cmd)
+                else:
+                    raise err
+        self._put_part_image(pnum)
+
+    def write(self, target, expand):
+        """Write disk image to the media or file."""
+        def write_sfdisk_script(outf, parts):
+            for key, val in parts['partitiontable'].items():
+                if key in ("partitions", "device", "firstlba", "lastlba"):
+                    continue
+                if key == "id":
+                    key = "label-id"
+                outf.write("{}: {}\n".format(key, val))
+            outf.write("\n")
+            for part in parts['partitiontable']['partitions']:
+                line = ''
+                for name in ('attrs', 'name', 'size', 'type', 'uuid'):
+                    if name == 'size' and part['type'] == 'f':
+                        # don't write size for extended partition
+                        continue
+                    val = part.get(name)
+                    if val:
+                        line += '{}={}, '.format(name, val)
+                if line:
+                    line = line[:-2] # strip ', '
+                if part.get('bootable'):
+                    line += ' ,bootable'
+                outf.write("{}\n".format(line))
+            outf.flush()
+
+        def read_ptable(path):
+            out = exec_cmd("{} -dJ {}".format(self.sfdisk, path))
+            return json.loads(out)
+
+        def write_ptable(parts, target):
+            with tempfile.NamedTemporaryFile(prefix="wic-sfdisk-", mode='w') as outf:
+                write_sfdisk_script(outf, parts)
+                cmd = "{} --no-reread {} < {} ".format(self.sfdisk, target, outf.name)
+                exec_cmd(cmd, as_shell=True)
+
+        if expand is None:
+            sparse_copy(self.imagepath, target)
+        else:
+            # copy first sectors that may contain bootloader
+            sparse_copy(self.imagepath, target, length=2048 * self._lsector_size)
+
+            # copy source partition table to the target
+            parts = read_ptable(self.imagepath)
+            write_ptable(parts, target)
+
+            # get size of unpartitioned space
+            free = None
+            for line in exec_cmd("{} -F {}".format(self.sfdisk, target)).splitlines():
+                if line.startswith("Unpartitioned space ") and line.endswith("sectors"):
+                    free = int(line.split()[-2])
+                    # Align free space to a 2048 sector boundary. YOCTO #12840.
+                    free = free - (free % 2048)
+            if free is None:
+                raise WicError("Can't get size of unpartitioned space")
+
+            # calculate expanded partitions sizes
+            sizes = {}
+            num_auto_resize = 0
+            for num, part in enumerate(parts['partitiontable']['partitions'], 1):
+                if num in expand:
+                    if expand[num] != 0: # don't resize partition if size is set to 0
+                        sectors = expand[num] // self._lsector_size
+                        free -= sectors - part['size']
+                        part['size'] = sectors
+                        sizes[num] = sectors
+                elif part['type'] != 'f':
+                    sizes[num] = -1
+                    num_auto_resize += 1
+
+            for num, part in enumerate(parts['partitiontable']['partitions'], 1):
+                if sizes.get(num) == -1:
+                    part['size'] += free // num_auto_resize
+
+            # write resized partition table to the target
+            write_ptable(parts, target)
+
+            # read resized partition table
+            parts = read_ptable(target)
+
+            # copy partitions content
+            for num, part in enumerate(parts['partitiontable']['partitions'], 1):
+                pnum = str(num)
+                fstype = self.partitions[pnum].fstype
+
+                # copy unchanged partition
+                if part['size'] == self.partitions[pnum].size // self._lsector_size:
+                    logger.info("copying unchanged partition {}".format(pnum))
+                    sparse_copy(self._get_part_image(pnum), target, seek=part['start'] * self._lsector_size)
+                    continue
+
+                # resize or re-create partitions
+                if fstype.startswith('ext') or fstype.startswith('fat') or \
+                   fstype.startswith('linux-swap'):
+
+                    partfname = None
+                    with tempfile.NamedTemporaryFile(prefix="wic-part{}-".format(pnum)) as partf:
+                        partfname = partf.name
+
+                    if fstype.startswith('ext'):
+                        logger.info("resizing ext partition {}".format(pnum))
+                        partimg = self._get_part_image(pnum)
+                        sparse_copy(partimg, partfname)
+                        exec_cmd("{} -pf {}".format(self.e2fsck, partfname))
+                        exec_cmd("{} {} {}s".format(\
+                                 self.resize2fs, partfname, part['size']))
+                    elif fstype.startswith('fat'):
+                        logger.info("copying content of the fat partition {}".format(pnum))
+                        with tempfile.TemporaryDirectory(prefix='wic-fatdir-') as tmpdir:
+                            # copy content to the temporary directory
+                            cmd = "{} -snompi {} :: {}".format(self.mcopy,
+                                                               self._get_part_image(pnum),
+                                                               tmpdir)
+                            exec_cmd(cmd)
+                            # create new msdos partition
+                            label = part.get("name")
+                            label_str = "-n {}".format(label) if label else ''
+
+                            cmd = "{} {} -C {} {}".format(self.mkdosfs, label_str, partfname,
+                                                          part['size'])
+                            exec_cmd(cmd)
+                            # copy content from the temporary directory to the new partition
+                            cmd = "{} -snompi {} {}/* ::".format(self.mcopy, partfname, tmpdir)
+                            exec_cmd(cmd, as_shell=True)
+                    elif fstype.startswith('linux-swap'):
+                        logger.info("creating swap partition {}".format(pnum))
+                        label = part.get("name")
+                        label_str = "-L {}".format(label) if label else ''
+                        uuid = part.get("uuid")
+                        uuid_str = "-U {}".format(uuid) if uuid else ''
+                        with open(partfname, 'w') as sparse:
+                            os.ftruncate(sparse.fileno(), part['size'] * self._lsector_size)
+                        exec_cmd("{} {} {} {}".format(self.mkswap, label_str, uuid_str, partfname))
+                    sparse_copy(partfname, target, seek=part['start'] * self._lsector_size)
+                    os.unlink(partfname)
+                elif part['type'] != 'f':
+                    logger.warning("skipping partition {}: unsupported fstype {}".format(pnum, fstype))
+
+def wic_ls(args, native_sysroot):
+    """List contents of partitioned image or vfat partition."""
+    disk = Disk(args.path.image, native_sysroot)
+    if not args.path.part:
+        if disk.partitions:
+            print('Num     Start        End          Size      Fstype')
+            for part in disk.partitions.values():
+                print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
+                          part.pnum, part.start, part.end,
+                          part.size, part.fstype))
+    else:
+        path = args.path.path or '/'
+        print(disk.dir(args.path.part, path))
+
+def wic_cp(args, native_sysroot):
+    """
+    Copy local file or directory to the vfat partition of
+    partitioned image.
+    """
+    disk = Disk(args.dest.image, native_sysroot)
+    disk.copy(args.src, args.dest.part, args.dest.path)
+
+def wic_rm(args, native_sysroot):
+    """
+    Remove files or directories from the vfat partition of
+    partitioned image.
+    """
+    disk = Disk(args.path.image, native_sysroot)
+    disk.remove(args.path.part, args.path.path)
+
+def wic_write(args, native_sysroot):
+    """
+    Write image to a target device.
+    """
+    disk = Disk(args.image, native_sysroot, ('fat', 'ext', 'swap'))
+    disk.write(args.target, args.expand)
+
+def find_canned(scripts_path, file_name):
+    """
+    Find a file either by its path or by name in the canned files dir.
+
+    Return None if not found
+    """
+    if os.path.exists(file_name):
+        return file_name
+
+    layers_canned_wks_dir = build_canned_image_list(scripts_path)
+    for canned_wks_dir in layers_canned_wks_dir:
+        for root, dirs, files in os.walk(canned_wks_dir):
+            for fname in files:
+                if fname == file_name:
+                    fullpath = os.path.join(canned_wks_dir, fname)
+                    return fullpath
+
+def get_custom_config(boot_file):
+    """
+    Get the custom configuration to be used for the bootloader.
+
+    Return None if the file can't be found.
+    """
+    # Get the scripts path of poky
+    scripts_path = os.path.abspath("%s/../.." % os.path.dirname(__file__))
+
+    cfg_file = find_canned(scripts_path, boot_file)
+    if cfg_file:
+        with open(cfg_file, "r") as f:
+            config = f.read()
+        return config
diff --git a/meta/recipes-support/wic/files/wic/filemap.py b/meta/recipes-support/wic/files/wic/filemap.py
new file mode 100644
index 0000000..a72fa09
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/filemap.py
@@ -0,0 +1,600 @@
+# Copyright (c) 2012 Intel, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License, version 2,
+# as published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+
+"""
+This module implements python implements a way to get file block. Two methods
+are supported - the FIEMAP ioctl and the 'SEEK_HOLE / SEEK_DATA' features of
+the file seek syscall. The former is implemented by the 'FilemapFiemap' class,
+the latter is implemented by the 'FilemapSeek' class. Both classes provide the
+same API. The 'filemap' function automatically selects which class can be used
+and returns an instance of the class.
+"""
+
+# Disable the following pylint recommendations:
+#   * Too many instance attributes (R0902)
+# pylint: disable=R0902
+
+import os
+import struct
+import array
+import fcntl
+import tempfile
+import logging
+
+def get_block_size(file_obj):
+    """
+    Returns block size for file object 'file_obj'. Errors are indicated by the
+    'IOError' exception.
+    """
+    # Get the block size of the host file-system for the image file by calling
+    # the FIGETBSZ ioctl (number 2).
+    binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
+    bsize = struct.unpack('I', binary_data)[0]
+    if not bsize:
+        import os
+        stat = os.fstat(file_obj.fileno())
+        if hasattr(stat, 'st_blksize'):
+            bsize = stat.st_blksize
+        else:
+            raise IOError("Unable to determine block size")
+    return bsize
+
+class ErrorNotSupp(Exception):
+    """
+    An exception of this type is raised when the 'FIEMAP' or 'SEEK_HOLE' feature
+    is not supported either by the kernel or the file-system.
+    """
+    pass
+
+class Error(Exception):
+    """A class for all the other exceptions raised by this module."""
+    pass
+
+
+class _FilemapBase(object):
+    """
+    This is a base class for a couple of other classes in this module. This
+    class simply performs the common parts of the initialization process: opens
+    the image file, gets its size, etc. The 'log' parameter is the logger object
+    to use for printing messages.
+    """
+
+    def __init__(self, image, log=None):
+        """
+        Initialize a class instance. The 'image' argument is full path to the
+        file or file object to operate on.
+        """
+
+        self._log = log
+        if self._log is None:
+            self._log = logging.getLogger(__name__)
+
+        self._f_image_needs_close = False
+
+        if hasattr(image, "fileno"):
+            self._f_image = image
+            self._image_path = image.name
+        else:
+            self._image_path = image
+            self._open_image_file()
+
+        try:
+            self.image_size = os.fstat(self._f_image.fileno()).st_size
+        except IOError as err:
+            raise Error("cannot get information about file '%s': %s"
+                        % (self._f_image.name, err))
+
+        try:
+            self.block_size = get_block_size(self._f_image)
+        except IOError as err:
+            raise Error("cannot get block size for '%s': %s"
+                        % (self._image_path, err))
+
+        self.blocks_cnt = self.image_size + self.block_size - 1
+        self.blocks_cnt //= self.block_size
+
+        try:
+            self._f_image.flush()
+        except IOError as err:
+            raise Error("cannot flush image file '%s': %s"
+                        % (self._image_path, err))
+
+        try:
+            os.fsync(self._f_image.fileno()),
+        except OSError as err:
+            raise Error("cannot synchronize image file '%s': %s "
+                        % (self._image_path, err.strerror))
+
+        self._log.debug("opened image \"%s\"" % self._image_path)
+        self._log.debug("block size %d, blocks count %d, image size %d"
+                        % (self.block_size, self.blocks_cnt, self.image_size))
+
+    def __del__(self):
+        """The class destructor which just closes the image file."""
+        if self._f_image_needs_close:
+            self._f_image.close()
+
+    def _open_image_file(self):
+        """Open the image file."""
+        try:
+            self._f_image = open(self._image_path, 'rb')
+        except IOError as err:
+            raise Error("cannot open image file '%s': %s"
+                        % (self._image_path, err))
+
+        self._f_image_needs_close = True
+
+    def block_is_mapped(self, block): # pylint: disable=W0613,R0201
+        """
+        This method has has to be implemented by child classes. It returns
+        'True' if block number 'block' of the image file is mapped and 'False'
+        otherwise.
+        """
+
+        raise Error("the method is not implemented")
+
+    def block_is_unmapped(self, block): # pylint: disable=W0613,R0201
+        """
+        This method has has to be implemented by child classes. It returns
+        'True' if block number 'block' of the image file is not mapped (hole)
+        and 'False' otherwise.
+        """
+
+        raise Error("the method is not implemented")
+
+    def get_mapped_ranges(self, start, count): # pylint: disable=W0613,R0201
+        """
+        This method has has to be implemented by child classes. This is a
+        generator which yields ranges of mapped blocks in the file. The ranges
+        are tuples of 2 elements: [first, last], where 'first' is the first
+        mapped block and 'last' is the last mapped block.
+
+        The ranges are yielded for the area of the file of size 'count' blocks,
+        starting from block 'start'.
+        """
+
+        raise Error("the method is not implemented")
+
+    def get_unmapped_ranges(self, start, count): # pylint: disable=W0613,R0201
+        """
+        This method has has to be implemented by child classes. Just like
+        'get_mapped_ranges()', but yields unmapped block ranges instead
+        (holes).
+        """
+
+        raise Error("the method is not implemented")
+
+
+# The 'SEEK_HOLE' and 'SEEK_DATA' options of the file seek system call
+_SEEK_DATA = 3
+_SEEK_HOLE = 4
+
+def _lseek(file_obj, offset, whence):
+    """This is a helper function which invokes 'os.lseek' for file object
+    'file_obj' and with specified 'offset' and 'whence'. The 'whence'
+    argument is supposed to be either '_SEEK_DATA' or '_SEEK_HOLE'. When
+    there is no more data or hole starting from 'offset', this function
+    returns '-1'.  Otherwise the data or hole position is returned."""
+
+    try:
+        return os.lseek(file_obj.fileno(), offset, whence)
+    except OSError as err:
+        # The 'lseek' system call returns the ENXIO if there is no data or
+        # hole starting from the specified offset.
+        if err.errno == os.errno.ENXIO:
+            return -1
+        elif err.errno == os.errno.EINVAL:
+            raise ErrorNotSupp("the kernel or file-system does not support "
+                               "\"SEEK_HOLE\" and \"SEEK_DATA\"")
+        else:
+            raise
+
+class FilemapSeek(_FilemapBase):
+    """
+    This class uses the 'SEEK_HOLE' and 'SEEK_DATA' to find file block mapping.
+    Unfortunately, the current implementation requires the caller to have write
+    access to the image file.
+    """
+
+    def __init__(self, image, log=None):
+        """Refer the '_FilemapBase' class for the documentation."""
+
+        # Call the base class constructor first
+        _FilemapBase.__init__(self, image, log)
+        self._log.debug("FilemapSeek: initializing")
+
+        self._probe_seek_hole()
+
+    def _probe_seek_hole(self):
+        """
+        Check whether the system implements 'SEEK_HOLE' and 'SEEK_DATA'.
+        Unfortunately, there seems to be no clean way for detecting this,
+        because often the system just fakes them by just assuming that all
+        files are fully mapped, so 'SEEK_HOLE' always returns EOF and
+        'SEEK_DATA' always returns the requested offset.
+
+        I could not invent a better way of detecting the fake 'SEEK_HOLE'
+        implementation than just to create a temporary file in the same
+        directory where the image file resides. It would be nice to change this
+        to something better.
+        """
+
+        directory = os.path.dirname(self._image_path)
+
+        try:
+            tmp_obj = tempfile.TemporaryFile("w+", dir=directory)
+        except IOError as err:
+            raise ErrorNotSupp("cannot create a temporary in \"%s\": %s" \
+                              % (directory, err))
+
+        try:
+            os.ftruncate(tmp_obj.fileno(), self.block_size)
+        except OSError as err:
+            raise ErrorNotSupp("cannot truncate temporary file in \"%s\": %s"
+                               % (directory, err))
+
+        offs = _lseek(tmp_obj, 0, _SEEK_HOLE)
+        if offs != 0:
+            # We are dealing with the stub 'SEEK_HOLE' implementation which
+            # always returns EOF.
+            self._log.debug("lseek(0, SEEK_HOLE) returned %d" % offs)
+            raise ErrorNotSupp("the file-system does not support "
+                               "\"SEEK_HOLE\" and \"SEEK_DATA\" but only "
+                               "provides a stub implementation")
+
+        tmp_obj.close()
+
+    def block_is_mapped(self, block):
+        """Refer the '_FilemapBase' class for the documentation."""
+        offs = _lseek(self._f_image, block * self.block_size, _SEEK_DATA)
+        if offs == -1:
+            result = False
+        else:
+            result = (offs // self.block_size == block)
+
+        self._log.debug("FilemapSeek: block_is_mapped(%d) returns %s"
+                        % (block, result))
+        return result
+
+    def block_is_unmapped(self, block):
+        """Refer the '_FilemapBase' class for the documentation."""
+        return not self.block_is_mapped(block)
+
+    def _get_ranges(self, start, count, whence1, whence2):
+        """
+        This function implements 'get_mapped_ranges()' and
+        'get_unmapped_ranges()' depending on what is passed in the 'whence1'
+        and 'whence2' arguments.
+        """
+
+        assert whence1 != whence2
+        end = start * self.block_size
+        limit = end + count * self.block_size
+
+        while True:
+            start = _lseek(self._f_image, end, whence1)
+            if start == -1 or start >= limit or start == self.image_size:
+                break
+
+            end = _lseek(self._f_image, start, whence2)
+            if end == -1 or end == self.image_size:
+                end = self.blocks_cnt * self.block_size
+            if end > limit:
+                end = limit
+
+            start_blk = start // self.block_size
+            end_blk = end // self.block_size - 1
+            self._log.debug("FilemapSeek: yielding range (%d, %d)"
+                            % (start_blk, end_blk))
+            yield (start_blk, end_blk)
+
+    def get_mapped_ranges(self, start, count):
+        """Refer the '_FilemapBase' class for the documentation."""
+        self._log.debug("FilemapSeek: get_mapped_ranges(%d,  %d(%d))"
+                        % (start, count, start + count - 1))
+        return self._get_ranges(start, count, _SEEK_DATA, _SEEK_HOLE)
+
+    def get_unmapped_ranges(self, start, count):
+        """Refer the '_FilemapBase' class for the documentation."""
+        self._log.debug("FilemapSeek: get_unmapped_ranges(%d,  %d(%d))"
+                        % (start, count, start + count - 1))
+        return self._get_ranges(start, count, _SEEK_HOLE, _SEEK_DATA)
+
+
+# Below goes the FIEMAP ioctl implementation, which is not very readable
+# because it deals with the rather complex FIEMAP ioctl. To understand the
+# code, you need to know the FIEMAP interface, which is documented in the
+# "Documentation/filesystems/fiemap.txt" file in the Linux kernel sources.
+
+# Format string for 'struct fiemap'
+_FIEMAP_FORMAT = "=QQLLLL"
+# sizeof(struct fiemap)
+_FIEMAP_SIZE = struct.calcsize(_FIEMAP_FORMAT)
+# Format string for 'struct fiemap_extent'
+_FIEMAP_EXTENT_FORMAT = "=QQQQQLLLL"
+# sizeof(struct fiemap_extent)
+_FIEMAP_EXTENT_SIZE = struct.calcsize(_FIEMAP_EXTENT_FORMAT)
+# The FIEMAP ioctl number
+_FIEMAP_IOCTL = 0xC020660B
+# This FIEMAP ioctl flag which instructs the kernel to sync the file before
+# reading the block map
+_FIEMAP_FLAG_SYNC = 0x00000001
+# Size of the buffer for 'struct fiemap_extent' elements which will be used
+# when invoking the FIEMAP ioctl. The larger is the buffer, the less times the
+# FIEMAP ioctl will be invoked.
+_FIEMAP_BUFFER_SIZE = 256 * 1024
+
+class FilemapFiemap(_FilemapBase):
+    """
+    This class provides API to the FIEMAP ioctl. Namely, it allows to iterate
+    over all mapped blocks and over all holes.
+
+    This class synchronizes the image file every time it invokes the FIEMAP
+    ioctl in order to work-around early FIEMAP implementation kernel bugs.
+    """
+
+    def __init__(self, image, log=None):
+        """
+        Initialize a class instance. The 'image' argument is full the file
+        object to operate on.
+        """
+
+        # Call the base class constructor first
+        _FilemapBase.__init__(self, image, log)
+        self._log.debug("FilemapFiemap: initializing")
+
+        self._buf_size = _FIEMAP_BUFFER_SIZE
+
+        # Calculate how many 'struct fiemap_extent' elements fit the buffer
+        self._buf_size -= _FIEMAP_SIZE
+        self._fiemap_extent_cnt = self._buf_size // _FIEMAP_EXTENT_SIZE
+        assert self._fiemap_extent_cnt > 0
+        self._buf_size = self._fiemap_extent_cnt * _FIEMAP_EXTENT_SIZE
+        self._buf_size += _FIEMAP_SIZE
+
+        # Allocate a mutable buffer for the FIEMAP ioctl
+        self._buf = array.array('B', [0] * self._buf_size)
+
+        # Check if the FIEMAP ioctl is supported
+        self.block_is_mapped(0)
+
+    def _invoke_fiemap(self, block, count):
+        """
+        Invoke the FIEMAP ioctl for 'count' blocks of the file starting from
+        block number 'block'.
+
+        The full result of the operation is stored in 'self._buf' on exit.
+        Returns the unpacked 'struct fiemap' data structure in form of a python
+        list (just like 'struct.upack()').
+        """
+
+        if self.blocks_cnt != 0 and (block < 0 or block >= self.blocks_cnt):
+            raise Error("bad block number %d, should be within [0, %d]"
+                        % (block, self.blocks_cnt))
+
+        # Initialize the 'struct fiemap' part of the buffer. We use the
+        # '_FIEMAP_FLAG_SYNC' flag in order to make sure the file is
+        # synchronized. The reason for this is that early FIEMAP
+        # implementations had many bugs related to cached dirty data, and
+        # synchronizing the file is a necessary work-around.
+        struct.pack_into(_FIEMAP_FORMAT, self._buf, 0, block * self.block_size,
+                         count * self.block_size, _FIEMAP_FLAG_SYNC, 0,
+                         self._fiemap_extent_cnt, 0)
+
+        try:
+            fcntl.ioctl(self._f_image, _FIEMAP_IOCTL, self._buf, 1)
+        except IOError as err:
+            # Note, the FIEMAP ioctl is supported by the Linux kernel starting
+            # from version 2.6.28 (year 2008).
+            if err.errno == os.errno.EOPNOTSUPP:
+                errstr = "FilemapFiemap: the FIEMAP ioctl is not supported " \
+                         "by the file-system"
+                self._log.debug(errstr)
+                raise ErrorNotSupp(errstr)
+            if err.errno == os.errno.ENOTTY:
+                errstr = "FilemapFiemap: the FIEMAP ioctl is not supported " \
+                         "by the kernel"
+                self._log.debug(errstr)
+                raise ErrorNotSupp(errstr)
+            raise Error("the FIEMAP ioctl failed for '%s': %s"
+                        % (self._image_path, err))
+
+        return struct.unpack(_FIEMAP_FORMAT, self._buf[:_FIEMAP_SIZE])
+
+    def block_is_mapped(self, block):
+        """Refer the '_FilemapBase' class for the documentation."""
+        struct_fiemap = self._invoke_fiemap(block, 1)
+
+        # The 3rd element of 'struct_fiemap' is the 'fm_mapped_extents' field.
+        # If it contains zero, the block is not mapped, otherwise it is
+        # mapped.
+        result = bool(struct_fiemap[3])
+        self._log.debug("FilemapFiemap: block_is_mapped(%d) returns %s"
+                        % (block, result))
+        return result
+
+    def block_is_unmapped(self, block):
+        """Refer the '_FilemapBase' class for the documentation."""
+        return not self.block_is_mapped(block)
+
+    def _unpack_fiemap_extent(self, index):
+        """
+        Unpack a 'struct fiemap_extent' structure object number 'index' from
+        the internal 'self._buf' buffer.
+        """
+
+        offset = _FIEMAP_SIZE + _FIEMAP_EXTENT_SIZE * index
+        return struct.unpack(_FIEMAP_EXTENT_FORMAT,
+                             self._buf[offset : offset + _FIEMAP_EXTENT_SIZE])
+
+    def _do_get_mapped_ranges(self, start, count):
+        """
+        Implements most the functionality for the  'get_mapped_ranges()'
+        generator: invokes the FIEMAP ioctl, walks through the mapped extents
+        and yields mapped block ranges. However, the ranges may be consecutive
+        (e.g., (1, 100), (100, 200)) and 'get_mapped_ranges()' simply merges
+        them.
+        """
+
+        block = start
+        while block < start + count:
+            struct_fiemap = self._invoke_fiemap(block, count)
+
+            mapped_extents = struct_fiemap[3]
+            if mapped_extents == 0:
+                # No more mapped blocks
+                return
+
+            extent = 0
+            while extent < mapped_extents:
+                fiemap_extent = self._unpack_fiemap_extent(extent)
+
+                # Start of the extent
+                extent_start = fiemap_extent[0]
+                # Starting block number of the extent
+                extent_block = extent_start // self.block_size
+                # Length of the extent
+                extent_len = fiemap_extent[2]
+                # Count of blocks in the extent
+                extent_count = extent_len // self.block_size
+
+                # Extent length and offset have to be block-aligned
+                assert extent_start % self.block_size == 0
+                assert extent_len % self.block_size == 0
+
+                if extent_block > start + count - 1:
+                    return
+
+                first = max(extent_block, block)
+                last = min(extent_block + extent_count, start + count) - 1
+                yield (first, last)
+
+                extent += 1
+
+            block = extent_block + extent_count
+
+    def get_mapped_ranges(self, start, count):
+        """Refer the '_FilemapBase' class for the documentation."""
+        self._log.debug("FilemapFiemap: get_mapped_ranges(%d,  %d(%d))"
+                        % (start, count, start + count - 1))
+        iterator = self._do_get_mapped_ranges(start, count)
+        first_prev, last_prev = next(iterator)
+
+        for first, last in iterator:
+            if last_prev == first - 1:
+                last_prev = last
+            else:
+                self._log.debug("FilemapFiemap: yielding range (%d, %d)"
+                                % (first_prev, last_prev))
+                yield (first_prev, last_prev)
+                first_prev, last_prev = first, last
+
+        self._log.debug("FilemapFiemap: yielding range (%d, %d)"
+                        % (first_prev, last_prev))
+        yield (first_prev, last_prev)
+
+    def get_unmapped_ranges(self, start, count):
+        """Refer the '_FilemapBase' class for the documentation."""
+        self._log.debug("FilemapFiemap: get_unmapped_ranges(%d,  %d(%d))"
+                        % (start, count, start + count - 1))
+        hole_first = start
+        for first, last in self._do_get_mapped_ranges(start, count):
+            if first > hole_first:
+                self._log.debug("FilemapFiemap: yielding range (%d, %d)"
+                                % (hole_first, first - 1))
+                yield (hole_first, first - 1)
+
+            hole_first = last + 1
+
+        if hole_first < start + count:
+            self._log.debug("FilemapFiemap: yielding range (%d, %d)"
+                            % (hole_first, start + count - 1))
+            yield (hole_first, start + count - 1)
+
+def filemap(image, log=None):
+    """
+    Create and return an instance of a Filemap class - 'FilemapFiemap' or
+    'FilemapSeek', depending on what the system we run on supports. If the
+    FIEMAP ioctl is supported, an instance of the 'FilemapFiemap' class is
+    returned. Otherwise, if 'SEEK_HOLE' is supported an instance of the
+    'FilemapSeek' class is returned. If none of these are supported, the
+    function generates an 'Error' type exception.
+    """
+
+    try:
+        return FilemapFiemap(image, log)
+    except ErrorNotSupp:
+        return FilemapSeek(image, log)
+
+def sparse_copy(src_fname, dst_fname, skip=0, seek=0,
+                length=0, api=None):
+    """
+    Efficiently copy sparse file to or into another file.
+
+    src_fname: path to source file
+    dst_fname: path to destination file
+    skip: skip N bytes at thestart of src
+    seek: seek N bytes from the start of dst
+    length: read N bytes from src and write them to dst
+    api: FilemapFiemap or FilemapSeek object
+    """
+    if not api:
+        api = filemap
+    fmap = api(src_fname)
+    try:
+        dst_file = open(dst_fname, 'r+b')
+    except IOError:
+        dst_file = open(dst_fname, 'wb')
+        if length:
+            dst_size = length + seek
+        else:
+            dst_size = os.path.getsize(src_fname) + seek - skip
+        dst_file.truncate(dst_size)
+
+    written = 0
+    for first, last in fmap.get_mapped_ranges(0, fmap.blocks_cnt):
+        start = first * fmap.block_size
+        end = (last + 1) * fmap.block_size
+
+        if skip >= end:
+            continue
+
+        if start < skip < end:
+            start = skip
+
+        fmap._f_image.seek(start, os.SEEK_SET)
+
+        written += start - skip - written
+        if length and written >= length:
+            dst_file.seek(seek + length, os.SEEK_SET)
+            dst_file.close()
+            return
+
+        dst_file.seek(seek + start - skip, os.SEEK_SET)
+
+        chunk_size = 1024 * 1024
+        to_read = end - start
+        read = 0
+
+        while read < to_read:
+            if read + chunk_size > to_read:
+                chunk_size = to_read - read
+            size = chunk_size
+            if length and written + size > length:
+                size = length - written
+            chunk = fmap._f_image.read(size)
+            dst_file.write(chunk)
+            read += size
+            written += size
+            if written == length:
+                dst_file.close()
+                return
+    dst_file.close()
diff --git a/meta/recipes-support/wic/files/wic/help.py b/meta/recipes-support/wic/files/wic/help.py
new file mode 100644
index 0000000..842b868
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/help.py
@@ -0,0 +1,1055 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This module implements some basic help invocation functions along
+# with the bulk of the help topic text for the OE Core Image Tools.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import subprocess
+import logging
+
+from wic.pluginbase import PluginMgr, PLUGIN_TYPES
+
+logger = logging.getLogger('wic')
+
+def subcommand_error(args):
+    logger.info("invalid subcommand %s", args[0])
+
+
+def display_help(subcommand, subcommands):
+    """
+    Display help for subcommand.
+    """
+    if subcommand not in subcommands:
+        return False
+
+    hlp = subcommands.get(subcommand, subcommand_error)[2]
+    if callable(hlp):
+        hlp = hlp()
+    pager = subprocess.Popen('less', stdin=subprocess.PIPE)
+    pager.communicate(hlp.encode('utf-8'))
+
+    return True
+
+
+def wic_help(args, usage_str, subcommands):
+    """
+    Subcommand help dispatcher.
+    """
+    if args.help_topic == None or not display_help(args.help_topic, subcommands):
+        print(usage_str)
+
+
+def get_wic_plugins_help():
+    """
+    Combine wic_plugins_help with the help for every known
+    source plugin.
+    """
+    result = wic_plugins_help
+    for plugin_type in PLUGIN_TYPES:
+        result += '\n\n%s PLUGINS\n\n' % plugin_type.upper()
+        for name, plugin in PluginMgr.get_plugins(plugin_type).items():
+            result += "\n %s plugin:\n" % name
+            if plugin.__doc__:
+                result += plugin.__doc__
+            else:
+                result += "\n    %s is missing docstring\n" % plugin
+    return result
+
+
+def invoke_subcommand(args, parser, main_command_usage, subcommands):
+    """
+    Dispatch to subcommand handler borrowed from combo-layer.
+    Should use argparse, but has to work in 2.6.
+    """
+    if not args.command:
+        logger.error("No subcommand specified, exiting")
+        parser.print_help()
+        return 1
+    elif args.command == "help":
+        wic_help(args, main_command_usage, subcommands)
+    elif args.command not in subcommands:
+        logger.error("Unsupported subcommand %s, exiting\n", args.command)
+        parser.print_help()
+        return 1
+    else:
+        subcmd = subcommands.get(args.command, subcommand_error)
+        usage = subcmd[1]
+        subcmd[0](args, usage)
+
+
+##
+# wic help and usage strings
+##
+
+wic_usage = """
+
+ Create a customized OpenEmbedded image
+
+ usage: wic [--version] | [--help] | [COMMAND [ARGS]]
+
+ Current 'wic' commands are:
+    help              Show help for command or one of the topics (see below)
+    create            Create a new OpenEmbedded image
+    list              List available canned images and source plugins
+
+ Help topics:
+    overview          wic overview - General overview of wic
+    plugins           wic plugins - Overview and API
+    kickstart         wic kickstart - wic kickstart reference
+"""
+
+wic_help_usage = """
+
+ usage: wic help <subcommand>
+
+ This command displays detailed help for the specified subcommand.
+"""
+
+wic_create_usage = """
+
+ Create a new OpenEmbedded image
+
+ usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
+            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+            [-r, --rootfs-dir] [-b, --bootimg-dir]
+            [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
+            [-c, --compress-with] [-m, --bmap]
+
+ This command creates an OpenEmbedded image based on the 'OE kickstart
+ commands' found in the <wks file>.
+
+ The -o option can be used to place the image in a directory with a
+ different name and location.
+
+ See 'wic help create' for more detailed instructions.
+"""
+
+wic_create_help = """
+
+NAME
+    wic create - Create a new OpenEmbedded image
+
+SYNOPSIS
+    wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
+        [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+        [-r, --rootfs-dir] [-b, --bootimg-dir]
+        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
+        [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
+
+DESCRIPTION
+    This command creates an OpenEmbedded image based on the 'OE
+    kickstart commands' found in the <wks file>.
+
+    In order to do this, wic needs to know the locations of the
+    various build artifacts required to build the image.
+
+    Users can explicitly specify the build artifact locations using
+    the -r, -b, -k, and -n options.  See below for details on where
+    the corresponding artifacts are typically found in a normal
+    OpenEmbedded build.
+
+    Alternatively, users can use the -e option to have 'wic' determine
+    those locations for a given image.  If the -e option is used, the
+    user needs to have set the appropriate MACHINE variable in
+    local.conf, and have sourced the build environment.
+
+    The -e option is used to specify the name of the image to use the
+    artifacts from e.g. core-image-sato.
+
+    The -r option is used to specify the path to the /rootfs dir to
+    use as the .wks rootfs source.
+
+    The -b option is used to specify the path to the dir containing
+    the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the
+    .wks bootimg source.
+
+    The -k option is used to specify the path to the dir containing
+    the kernel to use in the .wks bootimg.
+
+    The -n option is used to specify the path to the native sysroot
+    containing the tools to use to build the image.
+
+    The -f option is used to build rootfs by running "bitbake <image>"
+
+    The -s option is used to skip the build check.  The build check is
+    a simple sanity check used to determine whether the user has
+    sourced the build environment so that the -e option can operate
+    correctly.  If the user has specified the build artifact locations
+    explicitly, 'wic' assumes the user knows what he or she is doing
+    and skips the build check.
+
+    The -D option is used to display debug information detailing
+    exactly what happens behind the scenes when a create request is
+    fulfilled (or not, as the case may be).  It enumerates and
+    displays the command sequence used, and should be included in any
+    bug report describing unexpected results.
+
+    When 'wic -e' is used, the locations for the build artifacts
+    values are determined by 'wic -e' from the output of the 'bitbake
+    -e' command given an image name e.g. 'core-image-minimal' and a
+    given machine set in local.conf.  In that case, the image is
+    created as if the following 'bitbake -e' variables were used:
+
+    -r:        IMAGE_ROOTFS
+    -k:        STAGING_KERNEL_DIR
+    -n:        STAGING_DIR_NATIVE
+    -b:        empty (plugin-specific handlers must determine this)
+
+    If 'wic -e' is not used, the user needs to select the appropriate
+    value for -b (as well as -r, -k, and -n).
+
+    The -o option can be used to place the image in a directory with a
+    different name and location.
+
+    The -c option is used to specify compressor utility to compress
+    an image. gzip, bzip2 and xz compressors are supported.
+
+    The -m option is used to produce .bmap file for the image. This file
+    can be used to flash image using bmaptool utility.
+
+    The --no-fstab-update option is used to doesn't change fstab file. When
+    using this option the final fstab file will be same that in rootfs and
+    wic doesn't update file, e.g adding a new mount point. User can control
+    the fstab file content in base-files recipe.
+"""
+
+wic_list_usage = """
+
+ List available OpenEmbedded images and source plugins
+
+ usage: wic list images
+        wic list <image> help
+        wic list source-plugins
+
+ This command enumerates the set of available canned images as well as
+ help for those images.  It also can be used to list of available source
+ plugins.
+
+ The first form enumerates all the available 'canned' images.
+
+ The second form lists the detailed help information for a specific
+ 'canned' image.
+
+ The third form enumerates all the available --sources (source
+ plugins).
+
+ See 'wic help list' for more details.
+"""
+
+wic_list_help = """
+
+NAME
+    wic list - List available OpenEmbedded images and source plugins
+
+SYNOPSIS
+    wic list images
+    wic list <image> help
+    wic list source-plugins
+
+DESCRIPTION
+    This command enumerates the set of available canned images as well
+    as help for those images.  It also can be used to list available
+    source plugins.
+
+    The first form enumerates all the available 'canned' images.
+    These are actually just the set of .wks files that have been moved
+    into the /scripts/lib/wic/canned-wks directory).
+
+    The second form lists the detailed help information for a specific
+    'canned' image.
+
+    The third form enumerates all the available --sources (source
+    plugins).  The contents of a given partition are driven by code
+    defined in 'source plugins'.  Users specify a specific plugin via
+    the --source parameter of the partition .wks command.  Normally
+    this is the 'rootfs' plugin but can be any of the more specialized
+    sources listed by the 'list source-plugins' command.  Users can
+    also add their own source plugins - see 'wic help plugins' for
+    details.
+"""
+
+wic_ls_usage = """
+
+ List content of a partitioned image
+
+ usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>]
+
+ This command  outputs either list of image partitions or directory contents
+ of vfat and ext* partitions.
+
+ See 'wic help ls' for more detailed instructions.
+
+"""
+
+wic_ls_help = """
+
+NAME
+    wic ls - List contents of partitioned image or partition
+
+SYNOPSIS
+    wic ls <image>
+    wic ls <image>:<vfat or ext* partition>
+    wic ls <image>:<vfat or ext* partition><path>
+    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path>
+
+DESCRIPTION
+    This command lists either partitions of the image or directory contents
+    of vfat or ext* partitions.
+
+    The first form it lists partitions of the image.
+    For example:
+        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
+        Num     Start        End          Size      Fstype
+        1        1048576     24438783     23390208  fat16
+        2       25165824     50315263     25149440  ext4
+
+    Second and third form list directory content of the partition:
+        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        Volume in drive : is boot
+         Volume Serial Number is 2DF2-5F02
+        Directory for ::/
+
+        efi          <DIR>     2017-05-11  10:54
+        startup  nsh        26 2017-05-11  10:54
+        vmlinuz        6922288 2017-05-11  10:54
+                3 files           6 922 314 bytes
+                                 15 818 752 bytes free
+
+
+        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/EFI/boot/
+        Volume in drive : is boot
+         Volume Serial Number is 2DF2-5F02
+        Directory for ::/EFI/boot
+
+        .            <DIR>     2017-05-11  10:54
+        ..           <DIR>     2017-05-11  10:54
+        grub     cfg       679 2017-05-11  10:54
+        bootx64  efi    571392 2017-05-11  10:54
+                4 files             572 071 bytes
+                                 15 818 752 bytes free
+
+    The -n option is used to specify the path to the native sysroot
+    containing the tools(parted and mtools) to use.
+
+"""
+
+wic_cp_usage = """
+
+ Copy files and directories to the vfat or ext* partition
+
+ usage: wic cp <src> <image>:<partition>[<path>] [--native-sysroot <path>]
+
+ This command  copies local files or directories to the vfat or ext* partitions
+of partitioned  image.
+
+ See 'wic help cp' for more detailed instructions.
+
+"""
+
+wic_cp_help = """
+
+NAME
+    wic cp - copy files and directories to the vfat or ext* partitions
+
+SYNOPSIS
+    wic cp <src> <image>:<partition>
+    wic cp <src> <image>:<partition><path>
+    wic cp <src> <image>:<partition><path> --native-sysroot <path>
+
+DESCRIPTION
+    This command copies files and directories to the vfat or ext* partition of
+    the partitioned image.
+
+    The first form of it copies file or directory to the root directory of
+    the partition:
+        $ wic cp test.wks tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        Volume in drive : is boot
+         Volume Serial Number is DB4C-FD4C
+        Directory for ::/
+
+        efi          <DIR>     2017-05-24  18:15
+        loader       <DIR>     2017-05-24  18:15
+        startup  nsh        26 2017-05-24  18:15
+        vmlinuz        6926384 2017-05-24  18:15
+        test     wks       628 2017-05-24  21:22
+                5 files           6 927 038 bytes
+                                 15 677 440 bytes free
+
+    The second form of the command copies file or directory to the specified directory
+    on the partition:
+       $ wic cp test tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
+       $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
+       Volume in drive : is boot
+        Volume Serial Number is DB4C-FD4C
+       Directory for ::/efi
+
+       .            <DIR>     2017-05-24  18:15
+       ..           <DIR>     2017-05-24  18:15
+       boot         <DIR>     2017-05-24  18:15
+       test         <DIR>     2017-05-24  21:27
+               4 files                   0 bytes
+                                15 675 392 bytes free
+
+    The -n option is used to specify the path to the native sysroot
+    containing the tools(parted and mtools) to use.
+"""
+
+wic_rm_usage = """
+
+ Remove files or directories from the vfat or ext* partitions
+
+ usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
+
+ This command  removes files or directories from the vfat or ext* partitions of
+ the partitioned image.
+
+ See 'wic help rm' for more detailed instructions.
+
+"""
+
+wic_rm_help = """
+
+NAME
+    wic rm - remove files or directories from the vfat or ext* partitions
+
+SYNOPSIS
+    wic rm <src> <image>:<partition><path>
+    wic rm <src> <image>:<partition><path> --native-sysroot <path>
+
+DESCRIPTION
+    This command removes files or directories from the vfat or ext* partition of the
+    partitioned image:
+
+        $ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        Volume in drive : is boot
+         Volume Serial Number is 11D0-DE21
+        Directory for ::/
+
+        libcom32 c32    186500 2017-06-02  15:15
+        libutil  c32     24148 2017-06-02  15:15
+        syslinux cfg       209 2017-06-02  15:15
+        vesamenu c32     27104 2017-06-02  15:15
+        vmlinuz        6926384 2017-06-02  15:15
+                5 files           7 164 345 bytes
+                                 16 582 656 bytes free
+
+        $ wic rm ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/libutil.c32
+
+        $ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
+        Volume in drive : is boot
+         Volume Serial Number is 11D0-DE21
+        Directory for ::/
+
+        libcom32 c32    186500 2017-06-02  15:15
+        syslinux cfg       209 2017-06-02  15:15
+        vesamenu c32     27104 2017-06-02  15:15
+        vmlinuz        6926384 2017-06-02  15:15
+                4 files           7 140 197 bytes
+                                 16 607 232 bytes free
+
+    The -n option is used to specify the path to the native sysroot
+    containing the tools(parted and mtools) to use.
+"""
+
+wic_write_usage = """
+
+ Write image to a device
+
+ usage: wic write <image> <target device> [--expand [rules]] [--native-sysroot <path>]
+
+ This command writes partitioned image to a target device (USB stick, SD card etc).
+
+ See 'wic help write' for more detailed instructions.
+
+"""
+
+wic_write_help = """
+
+NAME
+    wic write - write an image to a device
+
+SYNOPSIS
+    wic write <image> <target>
+    wic write <image> <target> --expand auto
+    wic write <image> <target> --expand 1:100M-2:300M
+    wic write <image> <target> --native-sysroot <path>
+
+DESCRIPTION
+    This command writes an image to a target device (USB stick, SD card etc)
+
+        $ wic write ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic /dev/sdb
+
+    The --expand option is used to resize image partitions.
+    --expand auto expands partitions to occupy all free space available on the target device.
+    It's also possible to specify expansion rules in a format
+    <partition>:<size>[-<partition>:<size>...] for one or more partitions.
+    Specifying size 0 will keep partition unmodified.
+    Note: Resizing boot partition can result in non-bootable image for non-EFI images. It is
+    recommended to use size 0 for boot partition to keep image bootable.
+
+    The --native-sysroot option is used to specify the path to the native sysroot
+    containing the tools(parted, resize2fs) to use.
+"""
+
+wic_plugins_help = """
+
+NAME
+    wic plugins - Overview and API
+
+DESCRIPTION
+    plugins allow wic functionality to be extended and specialized by
+    users.  This section documents the plugin interface, which is
+    currently restricted to 'source' plugins.
+
+    'Source' plugins provide a mechanism to customize various aspects
+    of the image generation process in wic, mainly the contents of
+    partitions.
+
+    Source plugins provide a mechanism for mapping values specified in
+    .wks files using the --source keyword to a particular plugin
+    implementation that populates a corresponding partition.
+
+    A source plugin is created as a subclass of SourcePlugin (see
+    scripts/lib/wic/pluginbase.py) and the plugin file containing it
+    is added to scripts/lib/wic/plugins/source/ to make the plugin
+    implementation available to the wic implementation.
+
+    Source plugins can also be implemented and added by external
+    layers - any plugins found in a scripts/lib/wic/plugins/source/
+    directory in an external layer will also be made available.
+
+    When the wic implementation needs to invoke a partition-specific
+    implementation, it looks for the plugin that has the same name as
+    the --source param given to that partition.  For example, if the
+    partition is set up like this:
+
+      part /boot --source bootimg-pcbios   ...
+
+    then the methods defined as class members of the plugin having the
+    matching bootimg-pcbios .name class member would be used.
+
+    To be more concrete, here's the plugin definition that would match
+    a '--source bootimg-pcbios' usage, along with an example method
+    that would be called by the wic implementation when it needed to
+    invoke an implementation-specific partition-preparation function:
+
+    class BootimgPcbiosPlugin(SourcePlugin):
+        name = 'bootimg-pcbios'
+
+    @classmethod
+        def do_prepare_partition(self, part, ...)
+
+    If the subclass itself doesn't implement a function, a 'default'
+    version in a superclass will be located and used, which is why all
+    plugins must be derived from SourcePlugin.
+
+    The SourcePlugin class defines the following methods, which is the
+    current set of methods that can be implemented/overridden by
+    --source plugins.  Any methods not implemented by a SourcePlugin
+    subclass inherit the implementations present in the SourcePlugin
+    class (see the SourcePlugin source for details):
+
+      do_prepare_partition()
+          Called to do the actual content population for a
+          partition. In other words, it 'prepares' the final partition
+          image which will be incorporated into the disk image.
+
+      do_post_partition()
+          Called after the partition is created. It is useful to add post
+          operations e.g. signing the partition.
+
+      do_configure_partition()
+          Called before do_prepare_partition(), typically used to
+          create custom configuration files for a partition, for
+          example syslinux or grub config files.
+
+      do_install_disk()
+          Called after all partitions have been prepared and assembled
+          into a disk image.  This provides a hook to allow
+          finalization of a disk image, for example to write an MBR to
+          it.
+
+      do_stage_partition()
+          Special content-staging hook called before
+          do_prepare_partition(), normally empty.
+
+          Typically, a partition will just use the passed-in
+          parameters, for example the unmodified value of bootimg_dir.
+          In some cases however, things may need to be more tailored.
+          As an example, certain files may additionally need to be
+          take from bootimg_dir + /boot.  This hook allows those files
+          to be staged in a customized fashion.  Note that
+          get_bitbake_var() allows you to access non-standard
+          variables that you might want to use for these types of
+          situations.
+
+    This scheme is extensible - adding more hooks is a simple matter
+    of adding more plugin methods to SourcePlugin and derived classes.
+    Please see the implementation for details.
+"""
+
+wic_overview_help = """
+
+NAME
+    wic overview - General overview of wic
+
+DESCRIPTION
+    The 'wic' command generates partitioned images from existing
+    OpenEmbedded build artifacts.  Image generation is driven by
+    partitioning commands contained in an 'Openembedded kickstart'
+    (.wks) file (see 'wic help kickstart') specified either directly
+    on the command-line or as one of a selection of canned .wks files
+    (see 'wic list images').  When applied to a given set of build
+    artifacts, the result is an image or set of images that can be
+    directly written onto media and used on a particular system.
+
+    The 'wic' command and the infrastructure it's based on is by
+    definition incomplete - its purpose is to allow the generation of
+    customized images, and as such was designed to be completely
+    extensible via a plugin interface (see 'wic help plugins').
+
+  Background and Motivation
+
+    wic is meant to be a completely independent standalone utility
+    that initially provides easier-to-use and more flexible
+    replacements for a couple bits of existing functionality in
+    oe-core: directdisk.bbclass and mkefidisk.sh.  The difference
+    between wic and those examples is that with wic the functionality
+    of those scripts is implemented by a general-purpose partitioning
+    'language' based on Redhat kickstart syntax).
+
+    The initial motivation and design considerations that lead to the
+    current tool are described exhaustively in Yocto Bug #3847
+    (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3847).
+
+  Implementation and Examples
+
+    wic can be used in two different modes, depending on how much
+    control the user needs in specifying the Openembedded build
+    artifacts that will be used in creating the image: 'raw' and
+    'cooked'.
+
+    If used in 'raw' mode, artifacts are explicitly specified via
+    command-line arguments (see example below).
+
+    The more easily usable 'cooked' mode uses the current MACHINE
+    setting and a specified image name to automatically locate the
+    artifacts used to create the image.
+
+    OE kickstart files (.wks) can of course be specified directly on
+    the command-line, but the user can also choose from a set of
+    'canned' .wks files available via the 'wic list images' command
+    (example below).
+
+    In any case, the prerequisite for generating any image is to have
+    the build artifacts already available.  The below examples assume
+    the user has already build a 'core-image-minimal' for a specific
+    machine (future versions won't require this redundant step, but
+    for now that's typically how build artifacts get generated).
+
+    The other prerequisite is to source the build environment:
+
+      $ source oe-init-build-env
+
+    To start out with, we'll generate an image from one of the canned
+    .wks files.  The following generates a list of availailable
+    images:
+
+      $ wic list images
+        mkefidisk             Create an EFI disk image
+        directdisk            Create a 'pcbios' direct disk image
+
+    You can get more information about any of the available images by
+    typing 'wic list xxx help', where 'xxx' is one of the image names:
+
+      $ wic list mkefidisk help
+
+    Creates a partitioned EFI disk image that the user can directly dd
+    to boot media.
+
+    At any time, you can get help on the 'wic' command or any
+    subcommand (currently 'list' and 'create').  For instance, to get
+    the description of 'wic create' command and its parameters:
+
+      $ wic create
+
+       Usage:
+
+       Create a new OpenEmbedded image
+
+       usage: wic create <wks file or image name> [-o <DIRNAME> | ...]
+            [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
+            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
+            [-r, --rootfs-dir] [-b, --bootimg-dir] [-k, --kernel-dir]
+            [-n, --native-sysroot] [-f, --build-rootfs]
+
+       This command creates an OpenEmbedded image based on the 'OE
+       kickstart commands' found in the <wks file>.
+
+       The -o option can be used to place the image in a directory
+       with a different name and location.
+
+       See 'wic help create' for more detailed instructions.
+       ...
+
+    As mentioned in the command, you can get even more detailed
+    information by adding 'help' to the above:
+
+      $ wic help create
+
+    So, the easiest way to create an image is to use the -e option
+    with a canned .wks file.  To use the -e option, you need to
+    specify the image used to generate the artifacts and you actually
+    need to have the MACHINE used to build them specified in your
+    local.conf (these requirements aren't necessary if you aren't
+    using the -e options.)  Below, we generate a directdisk image,
+    pointing the process at the core-image-minimal artifacts for the
+    current MACHINE:
+
+      $ wic create directdisk -e core-image-minimal
+
+      Checking basic build environment...
+      Done.
+
+      Creating image(s)...
+
+      Info: The new image(s) can be found here:
+      /var/tmp/wic/build/directdisk-201309252350-sda.direct
+
+      The following build artifacts were used to create the image(s):
+
+      ROOTFS_DIR:      ...
+      BOOTIMG_DIR:     ...
+      KERNEL_DIR:      ...
+      NATIVE_SYSROOT:  ...
+
+      The image(s) were created using OE kickstart file:
+        .../scripts/lib/wic/canned-wks/directdisk.wks
+
+    The output shows the name and location of the image created, and
+    so that you know exactly what was used to generate the image, each
+    of the artifacts and the kickstart file used.
+
+    Similarly, you can create a 'mkefidisk' image in the same way
+    (notice that this example uses a different machine - because it's
+    using the -e option, you need to change the MACHINE in your
+    local.conf):
+
+      $ wic create mkefidisk -e core-image-minimal
+      Checking basic build environment...
+      Done.
+
+      Creating image(s)...
+
+      Info: The new image(s) can be found here:
+         /var/tmp/wic/build/mkefidisk-201309260027-sda.direct
+
+      ...
+
+    Here's an example that doesn't take the easy way out and manually
+    specifies each build artifact, along with a non-canned .wks file,
+    and also uses the -o option to have wic create the output
+    somewhere other than the default /var/tmp/wic:
+
+      $ wic create ./test.wks -o ./out --rootfs-dir
+      tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
+      --bootimg-dir tmp/sysroots/qemux86-64/usr/share
+      --kernel-dir tmp/deploy/images/qemux86-64
+      --native-sysroot tmp/sysroots/x86_64-linux
+
+     Creating image(s)...
+
+     Info: The new image(s) can be found here:
+           out/build/test-201507211313-sda.direct
+
+     The following build artifacts were used to create the image(s):
+       ROOTFS_DIR:                   tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
+       BOOTIMG_DIR:                  tmp/sysroots/qemux86-64/usr/share
+       KERNEL_DIR:                   tmp/deploy/images/qemux86-64
+       NATIVE_SYSROOT:               tmp/sysroots/x86_64-linux
+
+     The image(s) were created using OE kickstart file:
+     ./test.wks
+
+     Here is a content of test.wks:
+
+     part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
+     part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
+
+     bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
+
+
+    Finally, here's an example of the actual partition language
+    commands used to generate the mkefidisk image i.e. these are the
+    contents of the mkefidisk.wks OE kickstart file:
+
+      # short-description: Create an EFI disk image
+      # long-description: Creates a partitioned EFI disk image that the user
+      # can directly dd to boot media.
+
+      part /boot --source bootimg-efi --ondisk sda --fstype=efi --active
+
+      part / --source rootfs --ondisk sda --fstype=ext3 --label platform
+
+      part swap --ondisk sda --size 44 --label swap1 --fstype=swap
+
+      bootloader  --timeout=10  --append="rootwait console=ttyPCH0,115200"
+
+    You can get a complete listing and description of all the
+    kickstart commands available for use in .wks files from 'wic help
+    kickstart'.
+"""
+
+wic_kickstart_help = """
+
+NAME
+    wic kickstart - wic kickstart reference
+
+DESCRIPTION
+    This section provides the definitive reference to the wic
+    kickstart language.  It also provides documentation on the list of
+    --source plugins available for use from the 'part' command (see
+    the 'Platform-specific Plugins' section below).
+
+    The current wic implementation supports only the basic kickstart
+    partitioning commands: partition (or part for short) and
+    bootloader.
+
+    The following is a listing of the commands, their syntax, and
+    meanings. The commands are based on the Fedora kickstart
+    documentation but with modifications to reflect wic capabilities.
+
+      http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
+      http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader
+
+  Commands
+
+    * 'part' or 'partition'
+
+       This command creates a partition on the system and uses the
+       following syntax:
+
+         part [<mountpoint>]
+
+       The <mountpoint> is where the partition will be mounted and
+       must take of one of the following forms:
+
+         /<path>: For example: /, /usr, or /home
+
+         swap: The partition will be used as swap space.
+
+       If a <mountpoint> is not specified the partition will be created
+       but will not be mounted.
+
+       Partitions with a <mountpoint> specified will be automatically mounted.
+       This is achieved by wic adding entries to the fstab during image
+       generation. In order for a valid fstab to be generated one of the
+       --ondrive, --ondisk or --use-uuid partition options must be used for
+       each partition that specifies a mountpoint.  Note that with --use-uuid
+       and non-root <mountpoint>, including swap, the mount program must
+       understand the PARTUUID syntax.  This currently excludes the busybox
+       versions of these applications.
+
+
+       The following are supported 'part' options:
+
+         --size: The minimum partition size. Specify an integer value
+                 such as 500. Multipliers k, M ang G can be used. If
+                 not specified, the size is in MB.
+                 You do not need this option if you use --source.
+
+         --fixed-size: Exact partition size. Value format is the same
+                       as for --size option. This option cannot be
+                       specified along with --size. If partition data
+                       is larger than --fixed-size and error will be
+                       raised when assembling disk image.
+
+         --source: This option is a wic-specific option that names the
+                   source of the data that will populate the
+                   partition.  The most common value for this option
+                   is 'rootfs', but can be any value which maps to a
+                   valid 'source plugin' (see 'wic help plugins').
+
+                   If '--source rootfs' is used, it tells the wic
+                   command to create a partition as large as needed
+                   and to fill it with the contents of the root
+                   filesystem pointed to by the '-r' wic command-line
+                   option (or the equivalent rootfs derived from the
+                   '-e' command-line option).  The filesystem type
+                   that will be used to create the partition is driven
+                   by the value of the --fstype option specified for
+                   the partition (see --fstype below).
+
+                   If --source <plugin-name>' is used, it tells the
+                   wic command to create a partition as large as
+                   needed and to fill with the contents of the
+                   partition that will be generated by the specified
+                   plugin name using the data pointed to by the '-r'
+                   wic command-line option (or the equivalent rootfs
+                   derived from the '-e' command-line option).
+                   Exactly what those contents and filesystem type end
+                   up being are dependent on the given plugin
+                   implementation.
+
+                   If --source option is not used, the wic command
+                   will create empty partition. --size parameter has
+                   to be used to specify size of empty partition.
+
+         --ondisk or --ondrive: Forces the partition to be created on
+                                a particular disk.
+
+         --fstype: Sets the file system type for the partition.  These
+           apply to partitions created using '--source rootfs' (see
+           --source above).  Valid values are:
+
+             vfat
+             msdos
+             ext2
+             ext3
+             ext4
+             btrfs
+             squashfs
+             swap
+
+         --fsoptions: Specifies a free-form string of options to be
+                      used when mounting the filesystem. This string
+                      will be copied into the /etc/fstab file of the
+                      installed system and should be enclosed in
+                      quotes.  If not specified, the default string is
+                      "defaults".
+
+         --label label: Specifies the label to give to the filesystem
+                        to be made on the partition. If the given
+                        label is already in use by another filesystem,
+                        a new label is created for the partition.
+
+         --active: Marks the partition as active.
+
+         --align (in KBytes): This option is specific to wic and says
+                              to start a partition on an x KBytes
+                              boundary.
+
+         --no-table: This option is specific to wic. Space will be
+                     reserved for the partition and it will be
+                     populated but it will not be added to the
+                     partition table. It may be useful for
+                     bootloaders.
+
+         --exclude-path: This option is specific to wic. It excludes the given
+                         relative path from the resulting image. If the path
+                         ends with a slash, only the content of the directory
+                         is omitted, not the directory itself. This option only
+                         has an effect with the rootfs source plugin.
+
+         --extra-space: This option is specific to wic. It adds extra
+                        space after the space filled by the content
+                        of the partition. The final size can go
+                        beyond the size specified by --size.
+                        By default, 10MB. This option cannot be used
+                        with --fixed-size option.
+
+         --overhead-factor: This option is specific to wic. The
+                            size of the partition is multiplied by
+                            this factor. It has to be greater than or
+                            equal to 1. The default value is 1.3.
+                            This option cannot be used with --fixed-size
+                            option.
+
+         --part-name: This option is specific to wic. It specifies name for GPT partitions.
+
+         --part-type: This option is specific to wic. It specifies partition
+                      type GUID for GPT partitions.
+                      List of partition type GUIDS can be found here:
+                      http://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
+
+         --use-uuid: This option is specific to wic. It makes wic to generate
+                     random globally unique identifier (GUID) for the partition
+                     and use it in bootloader configuration to specify root partition.
+
+         --uuid: This option is specific to wic. It specifies partition UUID.
+                 It's useful if preconfigured partition UUID is added to kernel command line
+                 in bootloader configuration before running wic. In this case .wks file can
+                 be generated or modified to set preconfigured parition UUID using this option.
+
+         --fsuuid: This option is specific to wic. It specifies filesystem UUID.
+                   It's useful if preconfigured filesystem UUID is added to kernel command line
+                   in bootloader configuration before running wic. In this case .wks file can
+                   be generated or modified to set preconfigured filesystem UUID using this option.
+
+         --system-id: This option is specific to wic. It specifies partition system id. It's useful
+                      for the harware that requires non-default partition system ids. The parameter
+                      in one byte long hex number either with 0x prefix or without it.
+
+         --mkfs-extraopts: This option specifies extra options to pass to mkfs utility.
+                           NOTE, that wic uses default options for some filesystems, for example
+                           '-S 512' for mkfs.fat or '-F -i 8192' for mkfs.ext. Those options will
+                           not take effect when --mkfs-extraopts is used. This should be taken into
+                           account when using --mkfs-extraopts.
+
+    * bootloader
+
+      This command allows the user to specify various bootloader
+      options.  The following are supported 'bootloader' options:
+
+        --timeout: Specifies the number of seconds before the
+                   bootloader times out and boots the default option.
+
+        --append: Specifies kernel parameters. These will be added to
+                  bootloader command-line - for example, the syslinux
+                  APPEND or grub kernel command line.
+
+        --configfile: Specifies a user defined configuration file for
+                      the bootloader. This file must be located in the
+                      canned-wks folder or could be the full path to the
+                      file. Using this option will override any other
+                      bootloader option.
+
+      Note that bootloader functionality and boot partitions are
+      implemented by the various --source plugins that implement
+      bootloader functionality; the bootloader command essentially
+      provides a means of modifying bootloader configuration.
+
+    * include
+
+      This command allows the user to include the content of .wks file
+      into original .wks file.
+
+      Command uses the following syntax:
+
+         include <file>
+
+      The <file> is either path to the file or its name. If name is
+      specified wic will try to find file in the directories with canned
+      .wks files.
+
+"""
+
+wic_help_help = """
+NAME
+    wic help - display a help topic
+
+DESCRIPTION
+    Specify a help topic to display it. Topics are shown above.
+"""
diff --git a/meta/recipes-support/wic/files/wic/ksparser.py b/meta/recipes-support/wic/files/wic/ksparser.py
new file mode 100644
index 0000000..e590b2f
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/ksparser.py
@@ -0,0 +1,235 @@
+#!/usr/bin/env python -tt
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2016 Intel, Inc.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License as published by the Free
+# Software Foundation; version 2 of the License
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc., 59
+# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# DESCRIPTION
+# This module provides parser for kickstart format
+#
+# AUTHORS
+# Ed Bartosh <ed.bartosh> (at] linux.intel.com>
+
+"""Kickstart parser module."""
+
+import os
+import shlex
+import logging
+
+from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
+
+from wic.engine import find_canned
+from wic.partition import Partition
+
+logger = logging.getLogger('wic')
+
+class KickStartError(Exception):
+    """Custom exception."""
+    pass
+
+class KickStartParser(ArgumentParser):
+    """
+    This class overwrites error method to throw exception
+    instead of producing usage message(default argparse behavior).
+    """
+    def error(self, message):
+        raise ArgumentError(None, message)
+
+def sizetype(arg):
+    """
+    Custom type for ArgumentParser
+    Converts size string in <num>[K|k|M|G] format into the integer value
+    """
+    if arg.isdigit():
+        return int(arg) * 1024
+
+    if not arg[:-1].isdigit():
+        raise ArgumentTypeError("Invalid size: %r" % arg)
+
+    size = int(arg[:-1])
+    if arg.endswith("k") or arg.endswith("K"):
+        return size
+    if arg.endswith("M"):
+        return size * 1024
+    if arg.endswith("G"):
+        return size * 1024 * 1024
+
+    raise ArgumentTypeError("Invalid size: %r" % arg)
+
+def overheadtype(arg):
+    """
+    Custom type for ArgumentParser
+    Converts overhead string to float and checks if it's bigger than 1.0
+    """
+    try:
+        result = float(arg)
+    except ValueError:
+        raise ArgumentTypeError("Invalid value: %r" % arg)
+
+    if result < 1.0:
+        raise ArgumentTypeError("Overhead factor should be > 1.0" % arg)
+
+    return result
+
+def cannedpathtype(arg):
+    """
+    Custom type for ArgumentParser
+    Tries to find file in the list of canned wks paths
+    """
+    scripts_path = os.path.abspath(os.path.dirname(__file__) + '../../..')
+    result = find_canned(scripts_path, arg)
+    if not result:
+        raise ArgumentTypeError("file not found: %s" % arg)
+    return result
+
+def systemidtype(arg):
+    """
+    Custom type for ArgumentParser
+    Checks if the argument sutisfies system id requirements,
+    i.e. if it's one byte long integer > 0
+    """
+    error = "Invalid system type: %s. must be hex "\
+            "between 0x1 and 0xFF" % arg
+    try:
+        result = int(arg, 16)
+    except ValueError:
+        raise ArgumentTypeError(error)
+
+    if result <= 0 or result > 0xff:
+        raise ArgumentTypeError(error)
+
+    return arg
+
+class KickStart():
+    """Kickstart parser implementation."""
+
+    DEFAULT_EXTRA_SPACE = 10*1024
+    DEFAULT_OVERHEAD_FACTOR = 1.3
+
+    def __init__(self, confpath):
+
+        self.partitions = []
+        self.bootloader = None
+        self.lineno = 0
+        self.partnum = 0
+
+        parser = KickStartParser()
+        subparsers = parser.add_subparsers()
+
+        part = subparsers.add_parser('part')
+        part.add_argument('mountpoint', nargs='?')
+        part.add_argument('--active', action='store_true')
+        part.add_argument('--align', type=int)
+        part.add_argument('--exclude-path', nargs='+')
+        part.add_argument("--extra-space", type=sizetype)
+        part.add_argument('--fsoptions', dest='fsopts')
+        part.add_argument('--fstype', default='vfat',
+                          choices=('ext2', 'ext3', 'ext4', 'btrfs',
+                                   'squashfs', 'vfat', 'msdos', 'swap'))
+        part.add_argument('--mkfs-extraopts', default='')
+        part.add_argument('--label')
+        part.add_argument('--no-table', action='store_true')
+        part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
+        part.add_argument("--overhead-factor", type=overheadtype)
+        part.add_argument('--part-name')
+        part.add_argument('--part-type')
+        part.add_argument('--rootfs-dir')
+
+        # --size and --fixed-size cannot be specified together; options
+        # ----extra-space and --overhead-factor should also raise a parser
+        # --error, but since nesting mutually exclusive groups does not work,
+        # ----extra-space/--overhead-factor are handled later
+        sizeexcl = part.add_mutually_exclusive_group()
+        sizeexcl.add_argument('--size', type=sizetype, default=0)
+        sizeexcl.add_argument('--fixed-size', type=sizetype, default=0)
+
+        part.add_argument('--source')
+        part.add_argument('--sourceparams')
+        part.add_argument('--system-id', type=systemidtype)
+        part.add_argument('--use-uuid', action='store_true')
+        part.add_argument('--uuid')
+        part.add_argument('--fsuuid')
+
+        bootloader = subparsers.add_parser('bootloader')
+        bootloader.add_argument('--append')
+        bootloader.add_argument('--configfile')
+        bootloader.add_argument('--ptable', choices=('msdos', 'gpt'),
+                                default='msdos')
+        bootloader.add_argument('--timeout', type=int)
+        bootloader.add_argument('--source')
+
+        include = subparsers.add_parser('include')
+        include.add_argument('path', type=cannedpathtype)
+
+        self._parse(parser, confpath)
+        if not self.bootloader:
+            logger.warning('bootloader config not specified, using defaults\n')
+            self.bootloader = bootloader.parse_args([])
+
+    def _parse(self, parser, confpath):
+        """
+        Parse file in .wks format using provided parser.
+        """
+        with open(confpath) as conf:
+            lineno = 0
+            for line in conf:
+                line = line.strip()
+                lineno += 1
+                if line and line[0] != '#':
+                    try:
+                        line_args = shlex.split(line)
+                        parsed = parser.parse_args(line_args)
+                    except ArgumentError as err:
+                        raise KickStartError('%s:%d: %s' % \
+                                             (confpath, lineno, err))
+                    if line.startswith('part'):
+                        # SquashFS does not support UUID
+                        if parsed.fstype == 'squashfs' and parsed.use_uuid:
+                            err = "%s:%d: SquashFS does not support UUID" \
+                                  % (confpath, lineno)
+                            raise KickStartError(err)
+                        # using ArgumentParser one cannot easily tell if option
+                        # was passed as argument, if said option has a default
+                        # value; --overhead-factor/--extra-space cannot be used
+                        # with --fixed-size, so at least detect when these were
+                        # passed with non-0 values ...
+                        if parsed.fixed_size:
+                            if parsed.overhead_factor or parsed.extra_space:
+                                err = "%s:%d: arguments --overhead-factor and --extra-space not "\
+                                      "allowed with argument --fixed-size" \
+                                      % (confpath, lineno)
+                                raise KickStartError(err)
+                        else:
+                            # ... and provide defaults if not using
+                            # --fixed-size iff given option was not used
+                            # (again, one cannot tell if option was passed but
+                            # with value equal to 0)
+                            if '--overhead-factor' not in line_args:
+                                parsed.overhead_factor = self.DEFAULT_OVERHEAD_FACTOR
+                            if '--extra-space' not in line_args:
+                                parsed.extra_space = self.DEFAULT_EXTRA_SPACE
+
+                        self.partnum += 1
+                        self.partitions.append(Partition(parsed, self.partnum))
+                    elif line.startswith('include'):
+                        self._parse(parser, parsed.path)
+                    elif line.startswith('bootloader'):
+                        if not self.bootloader:
+                            self.bootloader = parsed
+                        else:
+                            err = "%s:%d: more than one bootloader specified" \
+                                      % (confpath, lineno)
+                            raise KickStartError(err)
diff --git a/meta/recipes-support/wic/files/wic/misc.py b/meta/recipes-support/wic/files/wic/misc.py
new file mode 100644
index 0000000..ee888b4
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/misc.py
@@ -0,0 +1,263 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This module provides a place to collect various wic-related utils
+# for the OpenEmbedded Image Tools.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+"""Miscellaneous functions."""
+
+import logging
+import os
+import re
+import subprocess
+
+from collections import defaultdict
+from distutils import spawn
+
+from wic import WicError
+
+logger = logging.getLogger('wic')
+
+# executable -> recipe pairs for exec_native_cmd
+NATIVE_RECIPES = {"bmaptool": "bmap-tools",
+                  "grub-mkimage": "grub-efi",
+                  "isohybrid": "syslinux",
+                  "mcopy": "mtools",
+                  "mdel" : "mtools",
+                  "mdeltree" : "mtools",
+                  "mdir" : "mtools",
+                  "mkdosfs": "dosfstools",
+                  "mkisofs": "cdrtools",
+                  "mkfs.btrfs": "btrfs-tools",
+                  "mkfs.ext2": "e2fsprogs",
+                  "mkfs.ext3": "e2fsprogs",
+                  "mkfs.ext4": "e2fsprogs",
+                  "mkfs.vfat": "dosfstools",
+                  "mksquashfs": "squashfs-tools",
+                  "mkswap": "util-linux",
+                  "mmd": "mtools",
+                  "parted": "parted",
+                  "sfdisk": "util-linux",
+                  "sgdisk": "gptfdisk",
+                  "syslinux": "syslinux"
+                 }
+
+def runtool(cmdln_or_args):
+    """ wrapper for most of the subprocess calls
+    input:
+        cmdln_or_args: can be both args and cmdln str (shell=True)
+    return:
+        rc, output
+    """
+    if isinstance(cmdln_or_args, list):
+        cmd = cmdln_or_args[0]
+        shell = False
+    else:
+        import shlex
+        cmd = shlex.split(cmdln_or_args)[0]
+        shell = True
+
+    sout = subprocess.PIPE
+    serr = subprocess.STDOUT
+
+    try:
+        process = subprocess.Popen(cmdln_or_args, stdout=sout,
+                                   stderr=serr, shell=shell)
+        sout, serr = process.communicate()
+        # combine stdout and stderr, filter None out and decode
+        out = ''.join([out.decode('utf-8') for out in [sout, serr] if out])
+    except OSError as err:
+        if err.errno == 2:
+            # [Errno 2] No such file or directory
+            raise WicError('Cannot run command: %s, lost dependency?' % cmd)
+        else:
+            raise # relay
+
+    return process.returncode, out
+
+def _exec_cmd(cmd_and_args, as_shell=False):
+    """
+    Execute command, catching stderr, stdout
+
+    Need to execute as_shell if the command uses wildcards
+    """
+    logger.debug("_exec_cmd: %s", cmd_and_args)
+    args = cmd_and_args.split()
+    logger.debug(args)
+
+    if as_shell:
+        ret, out = runtool(cmd_and_args)
+    else:
+        ret, out = runtool(args)
+    out = out.strip()
+    if ret != 0:
+        raise WicError("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
+                       (cmd_and_args, ret, out))
+
+    logger.debug("_exec_cmd: output for %s (rc = %d): %s",
+                 cmd_and_args, ret, out)
+
+    return ret, out
+
+
+def exec_cmd(cmd_and_args, as_shell=False):
+    """
+    Execute command, return output
+    """
+    return _exec_cmd(cmd_and_args, as_shell)[1]
+
+
+def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
+    """
+    Execute native command, catching stderr, stdout
+
+    Need to execute as_shell if the command uses wildcards
+
+    Always need to execute native commands as_shell
+    """
+    # The reason -1 is used is because there may be "export" commands.
+    args = cmd_and_args.split(';')[-1].split()
+    logger.debug(args)
+
+    if pseudo:
+        cmd_and_args = pseudo + cmd_and_args
+
+    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
+                   (native_sysroot, native_sysroot, native_sysroot)
+
+    native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
+                   (native_paths, cmd_and_args)
+    logger.debug("exec_native_cmd: %s", native_cmd_and_args)
+
+    # If the command isn't in the native sysroot say we failed.
+    if spawn.find_executable(args[0], native_paths):
+        ret, out = _exec_cmd(native_cmd_and_args, True)
+    else:
+        ret = 127
+        out = "can't find native executable %s in %s" % (args[0], native_paths)
+
+    prog = args[0]
+    # shell command-not-found
+    if ret == 127 \
+       or (pseudo and ret == 1 and out == "Can't find '%s' in $PATH." % prog):
+        msg = "A native program %s required to build the image "\
+              "was not found (see details above).\n\n" % prog
+        recipe = NATIVE_RECIPES.get(prog)
+        if recipe:
+            msg += "Please make sure wic-tools have %s-native in its DEPENDS, "\
+                   "build it with 'bitbake wic-tools' and try again.\n" % recipe
+        else:
+            msg += "Wic failed to find a recipe to build native %s. Please "\
+                   "file a bug against wic.\n" % prog
+        raise WicError(msg)
+
+    return ret, out
+
+BOOTDD_EXTRA_SPACE = 16384
+
+class BitbakeVars(defaultdict):
+    """
+    Container for Bitbake variables.
+    """
+    def __init__(self):
+        defaultdict.__init__(self, dict)
+
+        # default_image and vars_dir attributes should be set from outside
+        self.default_image = None
+        self.vars_dir = None
+
+    def _parse_line(self, line, image, matcher=re.compile(r"^([a-zA-Z0-9\-_+./~]+)=(.*)")):
+        """
+        Parse one line from bitbake -e output or from .env file.
+        Put result key-value pair into the storage.
+        """
+        if "=" not in line:
+            return
+        match = matcher.match(line)
+        if not match:
+            return
+        key, val = match.groups()
+        self[image][key] = val.strip('"')
+
+    def get_var(self, var, image=None, cache=True):
+        """
+        Get bitbake variable from 'bitbake -e' output or from .env file.
+        This is a lazy method, i.e. it runs bitbake or parses file only when
+        only when variable is requested. It also caches results.
+        """
+        if not image:
+            image = self.default_image
+
+        if image not in self:
+            if image and self.vars_dir:
+                fname = os.path.join(self.vars_dir, image + '.env')
+                if os.path.isfile(fname):
+                    # parse .env file
+                    with open(fname) as varsfile:
+                        for line in varsfile:
+                            self._parse_line(line, image)
+                else:
+                    print("Couldn't get bitbake variable from %s." % fname)
+                    print("File %s doesn't exist." % fname)
+                    return
+            else:
+                # Get bitbake -e output
+                cmd = "bitbake -e"
+                if image:
+                    cmd += " %s" % image
+
+                log_level = logger.getEffectiveLevel()
+                logger.setLevel(logging.INFO)
+                ret, lines = _exec_cmd(cmd)
+                logger.setLevel(log_level)
+
+                if ret:
+                    logger.error("Couldn't get '%s' output.", cmd)
+                    logger.error("Bitbake failed with error:\n%s\n", lines)
+                    return
+
+                # Parse bitbake -e output
+                for line in lines.split('\n'):
+                    self._parse_line(line, image)
+
+            # Make first image a default set of variables
+            if cache:
+                images = [key for key in self if key]
+                if len(images) == 1:
+                    self[None] = self[image]
+
+        result = self[image].get(var)
+        if not cache:
+            self.pop(image, None)
+
+        return result
+
+# Create BB_VARS singleton
+BB_VARS = BitbakeVars()
+
+def get_bitbake_var(var, image=None, cache=True):
+    """
+    Provide old get_bitbake_var API by wrapping
+    get_var method of BB_VARS singleton.
+    """
+    return BB_VARS.get_var(var, image, cache)
diff --git a/meta/recipes-support/wic/files/wic/partition.py b/meta/recipes-support/wic/files/wic/partition.py
new file mode 100644
index 0000000..5054779
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/partition.py
@@ -0,0 +1,424 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013-2016 Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This module provides the OpenEmbedded partition object definitions.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+# Ed Bartosh <ed.bartosh> (at] linux.intel.com>
+
+import logging
+import os
+import uuid
+
+from wic import WicError
+from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
+from wic.pluginbase import PluginMgr
+
+logger = logging.getLogger('wic')
+
+class Partition():
+
+    def __init__(self, args, lineno):
+        self.args = args
+        self.active = args.active
+        self.align = args.align
+        self.disk = args.disk
+        self.device = None
+        self.extra_space = args.extra_space
+        self.exclude_path = args.exclude_path
+        self.fsopts = args.fsopts
+        self.fstype = args.fstype
+        self.label = args.label
+        self.mkfs_extraopts = args.mkfs_extraopts
+        self.mountpoint = args.mountpoint
+        self.no_table = args.no_table
+        self.num = None
+        self.overhead_factor = args.overhead_factor
+        self.part_name = args.part_name
+        self.part_type = args.part_type
+        self.rootfs_dir = args.rootfs_dir
+        self.size = args.size
+        self.fixed_size = args.fixed_size
+        self.source = args.source
+        self.sourceparams = args.sourceparams
+        self.system_id = args.system_id
+        self.use_uuid = args.use_uuid
+        self.uuid = args.uuid
+        self.fsuuid = args.fsuuid
+
+        self.lineno = lineno
+        self.source_file = ""
+
+    def get_extra_block_count(self, current_blocks):
+        """
+        The --size param is reflected in self.size (in kB), and we already
+        have current_blocks (1k) blocks, calculate and return the
+        number of (1k) blocks we need to add to get to --size, 0 if
+        we're already there or beyond.
+        """
+        logger.debug("Requested partition size for %s: %d",
+                     self.mountpoint, self.size)
+
+        if not self.size:
+            return 0
+
+        requested_blocks = self.size
+
+        logger.debug("Requested blocks %d, current_blocks %d",
+                     requested_blocks, current_blocks)
+
+        if requested_blocks > current_blocks:
+            return requested_blocks - current_blocks
+        else:
+            return 0
+
+    def get_rootfs_size(self, actual_rootfs_size=0):
+        """
+        Calculate the required size of rootfs taking into consideration
+        --size/--fixed-size flags as well as overhead and extra space, as
+        specified in kickstart file. Raises an error if the
+        `actual_rootfs_size` is larger than fixed-size rootfs.
+
+        """
+        if self.fixed_size:
+            rootfs_size = self.fixed_size
+            if actual_rootfs_size > rootfs_size:
+                raise WicError("Actual rootfs size (%d kB) is larger than "
+                               "allowed size %d kB" %
+                               (actual_rootfs_size, rootfs_size))
+        else:
+            extra_blocks = self.get_extra_block_count(actual_rootfs_size)
+            if extra_blocks < self.extra_space:
+                extra_blocks = self.extra_space
+
+            rootfs_size = actual_rootfs_size + extra_blocks
+            rootfs_size *= self.overhead_factor
+
+            logger.debug("Added %d extra blocks to %s to get to %d total blocks",
+                         extra_blocks, self.mountpoint, rootfs_size)
+
+        return rootfs_size
+
+    @property
+    def disk_size(self):
+        """
+        Obtain on-disk size of partition taking into consideration
+        --size/--fixed-size options.
+
+        """
+        return self.fixed_size if self.fixed_size else self.size
+
+    def prepare(self, creator, cr_workdir, oe_builddir, rootfs_dir,
+                bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Prepare content for individual partitions, depending on
+        partition command parameters.
+        """
+        if not self.source:
+            if not self.size and not self.fixed_size:
+                raise WicError("The %s partition has a size of zero. Please "
+                               "specify a non-zero --size/--fixed-size for that "
+                               "partition." % self.mountpoint)
+
+            if self.fstype == "swap":
+                self.prepare_swap_partition(cr_workdir, oe_builddir,
+                                            native_sysroot)
+                self.source_file = "%s/fs.%s" % (cr_workdir, self.fstype)
+            else:
+                if self.fstype == 'squashfs':
+                    raise WicError("It's not possible to create empty squashfs "
+                                   "partition '%s'" % (self.mountpoint))
+
+                rootfs = "%s/fs_%s.%s.%s" % (cr_workdir, self.label,
+                                             self.lineno, self.fstype)
+                if os.path.isfile(rootfs):
+                    os.remove(rootfs)
+
+                prefix = "ext" if self.fstype.startswith("ext") else self.fstype
+                method = getattr(self, "prepare_empty_partition_" + prefix)
+                method(rootfs, oe_builddir, native_sysroot)
+                self.source_file = rootfs
+            return
+
+        plugins = PluginMgr.get_plugins('source')
+
+        if self.source not in plugins:
+            raise WicError("The '%s' --source specified for %s doesn't exist.\n\t"
+                           "See 'wic list source-plugins' for a list of available"
+                           " --sources.\n\tSee 'wic help source-plugins' for "
+                           "details on adding a new source plugin." %
+                           (self.source, self.mountpoint))
+
+        srcparams_dict = {}
+        if self.sourceparams:
+            # Split sourceparams string of the form key1=val1[,key2=val2,...]
+            # into a dict.  Also accepts valueless keys i.e. without =
+            splitted = self.sourceparams.split(',')
+            srcparams_dict = dict(par.split('=') for par in splitted if par)
+
+        plugin = PluginMgr.get_plugins('source')[self.source]
+        plugin.do_configure_partition(self, srcparams_dict, creator,
+                                      cr_workdir, oe_builddir, bootimg_dir,
+                                      kernel_dir, native_sysroot)
+        plugin.do_stage_partition(self, srcparams_dict, creator,
+                                  cr_workdir, oe_builddir, bootimg_dir,
+                                  kernel_dir, native_sysroot)
+        plugin.do_prepare_partition(self, srcparams_dict, creator,
+                                    cr_workdir, oe_builddir, bootimg_dir,
+                                    kernel_dir, rootfs_dir, native_sysroot)
+        plugin.do_post_partition(self, srcparams_dict, creator,
+                                    cr_workdir, oe_builddir, bootimg_dir,
+                                    kernel_dir, rootfs_dir, native_sysroot)
+
+        # further processing required Partition.size to be an integer, make
+        # sure that it is one
+        if not isinstance(self.size, int):
+            raise WicError("Partition %s internal size is not an integer. "
+                           "This a bug in source plugin %s and needs to be fixed." %
+                           (self.mountpoint, self.source))
+
+        if self.fixed_size and self.size > self.fixed_size:
+            raise WicError("File system image of partition %s is "
+                           "larger (%d kB) than its allowed size %d kB" %
+                           (self.mountpoint, self.size, self.fixed_size))
+
+    def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
+                       native_sysroot, real_rootfs = True):
+        """
+        Prepare content for a rootfs partition i.e. create a partition
+        and fill it from a /rootfs dir.
+
+        Currently handles ext2/3/4, btrfs, vfat and squashfs.
+        """
+        p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
+        p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
+                                         "%s/../pseudo" %  rootfs_dir)
+        p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
+        p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
+        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
+        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % p_localstatedir
+        pseudo += "export PSEUDO_PASSWD=%s;" % p_passwd
+        pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
+        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
+
+        rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
+                                         self.lineno, self.fstype)
+        if os.path.isfile(rootfs):
+            os.remove(rootfs)
+
+        # Get rootfs size from bitbake variable if it's not set in .ks file
+        if not self.size and real_rootfs:
+            # Bitbake variable ROOTFS_SIZE is calculated in
+            # Image._get_rootfs_size method from meta/lib/oe/image.py
+            # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
+            # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
+            rsize_bb = get_bitbake_var('ROOTFS_SIZE')
+            if rsize_bb:
+                logger.warning('overhead-factor was specified, but size was not,'
+                               ' so bitbake variables will be used for the size.'
+                               ' In this case both IMAGE_OVERHEAD_FACTOR and '
+                               '--overhead-factor will be applied')
+                self.size = int(round(float(rsize_bb)))
+
+        prefix = "ext" if self.fstype.startswith("ext") else self.fstype
+        method = getattr(self, "prepare_rootfs_" + prefix)
+        method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
+        self.source_file = rootfs
+
+        # get the rootfs size in the right units for kickstart (kB)
+        du_cmd = "du -Lbks %s" % rootfs
+        out = exec_cmd(du_cmd)
+        self.size = int(out.split()[0])
+
+    def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_dir,
+                           native_sysroot, pseudo):
+        """
+        Prepare content for an ext2/3/4 rootfs partition.
+        """
+        du_cmd = "du -ks %s" % rootfs_dir
+        out = exec_cmd(du_cmd)
+        actual_rootfs_size = int(out.split()[0])
+
+        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
+
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+
+        extraopts = self.mkfs_extraopts or "-F -i 8192"
+
+        label_str = ""
+        if self.label:
+            label_str = "-L %s" % self.label
+
+        mkfs_cmd = "mkfs.%s %s %s %s -U %s -d %s" % \
+            (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
+        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
+
+        mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
+        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
+
+    def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
+                             native_sysroot, pseudo):
+        """
+        Prepare content for a btrfs rootfs partition.
+        """
+        du_cmd = "du -ks %s" % rootfs_dir
+        out = exec_cmd(du_cmd)
+        actual_rootfs_size = int(out.split()[0])
+
+        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
+
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+
+        label_str = ""
+        if self.label:
+            label_str = "-L %s" % self.label
+
+        mkfs_cmd = "mkfs.%s -b %d -r %s %s %s -U %s %s" % \
+            (self.fstype, rootfs_size * 1024, rootfs_dir, label_str,
+             self.mkfs_extraopts, self.fsuuid, rootfs)
+        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
+
+    def prepare_rootfs_msdos(self, rootfs, oe_builddir, rootfs_dir,
+                             native_sysroot, pseudo):
+        """
+        Prepare content for a msdos/vfat rootfs partition.
+        """
+        du_cmd = "du -bks %s" % rootfs_dir
+        out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        rootfs_size = self.get_rootfs_size(blocks)
+
+        label_str = "-n boot"
+        if self.label:
+            label_str = "-n %s" % self.label
+
+        size_str = ""
+        if self.fstype == 'msdos':
+            size_str = "-F 16" # FAT 16
+
+        extraopts = self.mkfs_extraopts or '-S 512'
+
+        dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
+                    (label_str, self.fsuuid, size_str, extraopts, rootfs,
+                     max(8250, rootfs_size))
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % rootfs
+        exec_cmd(chmod_cmd)
+
+    prepare_rootfs_vfat = prepare_rootfs_msdos
+
+    def prepare_rootfs_squashfs(self, rootfs, oe_builddir, rootfs_dir,
+                                native_sysroot, pseudo):
+        """
+        Prepare content for a squashfs rootfs partition.
+        """
+        extraopts = self.mkfs_extraopts or '-noappend'
+        squashfs_cmd = "mksquashfs %s %s %s" % \
+                       (rootfs_dir, rootfs, extraopts)
+        exec_native_cmd(squashfs_cmd, native_sysroot, pseudo=pseudo)
+
+    def prepare_empty_partition_ext(self, rootfs, oe_builddir,
+                                    native_sysroot):
+        """
+        Prepare an empty ext2/3/4 partition.
+        """
+        size = self.disk_size
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), size * 1024)
+
+        extraopts = self.mkfs_extraopts or "-i 8192"
+
+        label_str = ""
+        if self.label:
+            label_str = "-L %s" % self.label
+
+        mkfs_cmd = "mkfs.%s -F %s %s -U %s %s" % \
+            (self.fstype, extraopts, label_str, self.fsuuid, rootfs)
+        exec_native_cmd(mkfs_cmd, native_sysroot)
+
+    def prepare_empty_partition_btrfs(self, rootfs, oe_builddir,
+                                      native_sysroot):
+        """
+        Prepare an empty btrfs partition.
+        """
+        size = self.disk_size
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), size * 1024)
+
+        label_str = ""
+        if self.label:
+            label_str = "-L %s" % self.label
+
+        mkfs_cmd = "mkfs.%s -b %d %s -U %s %s %s" % \
+                   (self.fstype, self.size * 1024, label_str, self.fsuuid,
+                    self.mkfs_extraopts, rootfs)
+        exec_native_cmd(mkfs_cmd, native_sysroot)
+
+    def prepare_empty_partition_msdos(self, rootfs, oe_builddir,
+                                      native_sysroot):
+        """
+        Prepare an empty vfat partition.
+        """
+        blocks = self.disk_size
+
+        label_str = "-n boot"
+        if self.label:
+            label_str = "-n %s" % self.label
+
+        size_str = ""
+        if self.fstype == 'msdos':
+            size_str = "-F 16" # FAT 16
+
+        extraopts = self.mkfs_extraopts or '-S 512'
+
+        dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
+                    (label_str, self.fsuuid, extraopts, size_str, rootfs,
+                     blocks)
+
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % rootfs
+        exec_cmd(chmod_cmd)
+
+    prepare_empty_partition_vfat = prepare_empty_partition_msdos
+
+    def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
+        """
+        Prepare a swap partition.
+        """
+        path = "%s/fs.%s" % (cr_workdir, self.fstype)
+
+        with open(path, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), self.size * 1024)
+
+        label_str = ""
+        if self.label:
+            label_str = "-L %s" % self.label
+
+        mkswap_cmd = "mkswap %s -U %s %s" % (label_str, self.fsuuid, path)
+        exec_native_cmd(mkswap_cmd, native_sysroot)
diff --git a/meta/recipes-support/wic/files/wic/pluginbase.py b/meta/recipes-support/wic/files/wic/pluginbase.py
new file mode 100644
index 0000000..686d2fe
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/pluginbase.py
@@ -0,0 +1,149 @@
+#!/usr/bin/env python -tt
+#
+# Copyright (c) 2011 Intel, Inc.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License as published by the Free
+# Software Foundation; version 2 of the License
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc., 59
+# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+
+__all__ = ['ImagerPlugin', 'SourcePlugin']
+
+import os
+import logging
+
+from collections import defaultdict
+from importlib.machinery import SourceFileLoader
+
+from wic import WicError
+from wic.misc import get_bitbake_var
+
+PLUGIN_TYPES = ["imager", "source"]
+
+SCRIPTS_PLUGIN_DIR = "scripts/lib/wic/plugins"
+
+logger = logging.getLogger('wic')
+
+PLUGINS = defaultdict(dict)
+
+class PluginMgr:
+    _plugin_dirs = []
+
+    @classmethod
+    def get_plugins(cls, ptype):
+        """Get dictionary of <plugin_name>:<class> pairs."""
+        if ptype not in PLUGIN_TYPES:
+            raise WicError('%s is not valid plugin type' % ptype)
+
+        # collect plugin directories
+        if not cls._plugin_dirs:
+            cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
+            layers = get_bitbake_var("BBLAYERS") or ''
+            for layer_path in layers.split():
+                path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR)
+                path = os.path.abspath(os.path.expanduser(path))
+                if path not in cls._plugin_dirs and os.path.isdir(path):
+                    cls._plugin_dirs.insert(0, path)
+
+        if ptype not in PLUGINS:
+            # load all ptype plugins
+            for pdir in cls._plugin_dirs:
+                ppath = os.path.join(pdir, ptype)
+                if os.path.isdir(ppath):
+                    for fname in os.listdir(ppath):
+                        if fname.endswith('.py'):
+                            mname = fname[:-3]
+                            mpath = os.path.join(ppath, fname)
+                            logger.debug("loading plugin module %s", mpath)
+                            SourceFileLoader(mname, mpath).load_module()
+
+        return PLUGINS.get(ptype)
+
+class PluginMeta(type):
+    def __new__(cls, name, bases, attrs):
+        class_type = type.__new__(cls, name, bases, attrs)
+        if 'name' in attrs:
+            PLUGINS[class_type.wic_plugin_type][attrs['name']] = class_type
+
+        return class_type
+
+class ImagerPlugin(metaclass=PluginMeta):
+    wic_plugin_type = "imager"
+
+    def do_create(self):
+        raise WicError("Method %s.do_create is not implemented" %
+                       self.__class__.__name__)
+
+class SourcePlugin(metaclass=PluginMeta):
+    wic_plugin_type = "source"
+    """
+    The methods that can be implemented by --source plugins.
+
+    Any methods not implemented in a subclass inherit these.
+    """
+
+    @classmethod
+    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.  This provides a hook to allow finalization of a
+        disk image e.g. to write an MBR to it.
+        """
+        logger.debug("SourcePlugin: do_install_disk: disk: %s", disk_name)
+
+    @classmethod
+    def do_stage_partition(cls, part, source_params, creator, cr_workdir,
+                           oe_builddir, bootimg_dir, kernel_dir,
+                           native_sysroot):
+        """
+        Special content staging hook called before do_prepare_partition(),
+        normally empty.
+
+        Typically, a partition will just use the passed-in parame e.g
+        straight bootimg_dir, etc, but in some cases, things need to
+        be more tailored e.g. to use a deploy dir + /boot, etc.  This
+        hook allows those files to be staged in a customized fashion.
+        Not that get_bitbake_var() allows you to acces non-standard
+        variables that you might want to use for this.
+        """
+        logger.debug("SourcePlugin: do_stage_partition: part: %s", part)
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(), typically used to create
+        custom configuration files for a partition, for example
+        syslinux or grub config files.
+        """
+        logger.debug("SourcePlugin: do_configure_partition: part: %s", part)
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir, rootfs_dir,
+                             native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+        logger.debug("SourcePlugin: do_prepare_partition: part: %s", part)
+
+    @classmethod
+    def do_post_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir, rootfs_dir,
+                             native_sysroot):
+        """
+        Called after the partition is created. It is useful to add post
+        operations e.g. security signing the partition.
+        """
+        logger.debug("SourcePlugin: do_post_partition: part: %s", part)
diff --git a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
new file mode 100644
index 0000000..81583e9
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
@@ -0,0 +1,611 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'direct' imager plugin class for 'wic'
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import logging
+import os
+import random
+import shutil
+import tempfile
+import uuid
+
+from time import strftime
+
+from oe.path import copyhardlinktree
+
+from wic import WicError
+from wic.filemap import sparse_copy
+from wic.ksparser import KickStart, KickStartError
+from wic.pluginbase import PluginMgr, ImagerPlugin
+from wic.misc import get_bitbake_var, exec_cmd, exec_native_cmd
+
+logger = logging.getLogger('wic')
+
+class DirectPlugin(ImagerPlugin):
+    """
+    Install a system into a file containing a partitioned disk image.
+
+    An image file is formatted with a partition table, each partition
+    created from a rootfs or other OpenEmbedded build artifact and dd'ed
+    into the virtual disk. The disk image can subsequently be dd'ed onto
+    media and used on actual hardware.
+    """
+    name = 'direct'
+
+    def __init__(self, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+                 native_sysroot, oe_builddir, options):
+        try:
+            self.ks = KickStart(wks_file)
+        except KickStartError as err:
+            raise WicError(str(err))
+
+        # parse possible 'rootfs=name' items
+        self.rootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
+        self.replaced_rootfs_paths = {}
+        self.bootimg_dir = bootimg_dir
+        self.kernel_dir = kernel_dir
+        self.native_sysroot = native_sysroot
+        self.oe_builddir = oe_builddir
+
+        self.outdir = options.outdir
+        self.compressor = options.compressor
+        self.bmap = options.bmap
+        self.no_fstab_update = options.no_fstab_update
+
+        self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
+                               strftime("%Y%m%d%H%M"))
+        self.workdir = tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
+        self._image = None
+        self.ptable_format = self.ks.bootloader.ptable
+        self.parts = self.ks.partitions
+
+        # as a convenience, set source to the boot partition source
+        # instead of forcing it to be set via bootloader --source
+        for part in self.parts:
+            if not self.ks.bootloader.source and part.mountpoint == "/boot":
+                self.ks.bootloader.source = part.source
+                break
+
+        image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
+        self._image = PartitionedImage(image_path, self.ptable_format,
+                                       self.parts, self.native_sysroot)
+
+    def do_create(self):
+        """
+        Plugin entry point.
+        """
+        try:
+            self.create()
+            self.assemble()
+            self.finalize()
+            self.print_info()
+        finally:
+            self.cleanup()
+
+    def _write_fstab(self, image_rootfs):
+        """overriden to generate fstab (temporarily) in rootfs. This is called
+        from _create, make sure it doesn't get called from
+        BaseImage.create()
+        """
+        if not image_rootfs:
+            return
+
+        fstab_path = image_rootfs + "/etc/fstab"
+        if not os.path.isfile(fstab_path):
+            return
+
+        with open(fstab_path) as fstab:
+            fstab_lines = fstab.readlines()
+
+        if self._update_fstab(fstab_lines, self.parts):
+            # copy rootfs dir to workdir to update fstab
+            # as rootfs can be used by other tasks and can't be modified
+            new_pseudo = os.path.realpath(os.path.join(self.workdir, "pseudo"))
+            from_dir = os.path.join(os.path.join(image_rootfs, ".."), "pseudo")
+            from_dir = os.path.realpath(from_dir)
+            copyhardlinktree(from_dir, new_pseudo)
+            new_rootfs = os.path.realpath(os.path.join(self.workdir, "rootfs_copy"))
+            copyhardlinktree(image_rootfs, new_rootfs)
+            fstab_path = os.path.join(new_rootfs, 'etc/fstab')
+
+            os.unlink(fstab_path)
+
+            with open(fstab_path, "w") as fstab:
+                fstab.writelines(fstab_lines)
+
+            return new_rootfs
+
+    def _update_fstab(self, fstab_lines, parts):
+        """Assume partition order same as in wks"""
+        updated = False
+        for part in parts:
+            if not part.realnum or not part.mountpoint \
+               or part.mountpoint == "/":
+                continue
+
+            if part.use_uuid:
+                if part.fsuuid:
+                    # FAT UUID is different from others
+                    if len(part.fsuuid) == 10:
+                        device_name = "UUID=%s-%s" % \
+                                       (part.fsuuid[2:6], part.fsuuid[6:])
+                    else:
+                        device_name = "UUID=%s" % part.fsuuid
+                else:
+                    device_name = "PARTUUID=%s" % part.uuid
+            else:
+                # mmc device partitions are named mmcblk0p1, mmcblk0p2..
+                prefix = 'p' if  part.disk.startswith('mmcblk') else ''
+                device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
+
+            opts = part.fsopts if part.fsopts else "defaults"
+            line = "\t".join([device_name, part.mountpoint, part.fstype,
+                              opts, "0", "0"]) + "\n"
+
+            fstab_lines.append(line)
+            updated = True
+
+        return updated
+
+    def _full_path(self, path, name, extention):
+        """ Construct full file path to a file we generate. """
+        return os.path.join(path, "%s-%s.%s" % (self.name, name, extention))
+
+    #
+    # Actual implemention
+    #
+    def create(self):
+        """
+        For 'wic', we already have our build artifacts - we just create
+        filesystems from the artifacts directly and combine them into
+        a partitioned image.
+        """
+        if self.no_fstab_update:
+            new_rootfs = None
+        else:
+            new_rootfs = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
+        if new_rootfs:
+            # rootfs was copied to update fstab
+            self.replaced_rootfs_paths[new_rootfs] = self.rootfs_dir['ROOTFS_DIR']
+            self.rootfs_dir['ROOTFS_DIR'] = new_rootfs
+
+        for part in self.parts:
+            # get rootfs size from bitbake variable if it's not set in .ks file
+            if not part.size:
+                # and if rootfs name is specified for the partition
+                image_name = self.rootfs_dir.get(part.rootfs_dir)
+                if image_name and os.path.sep not in image_name:
+                    # Bitbake variable ROOTFS_SIZE is calculated in
+                    # Image._get_rootfs_size method from meta/lib/oe/image.py
+                    # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
+                    # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
+                    rsize_bb = get_bitbake_var('ROOTFS_SIZE', image_name)
+                    if rsize_bb:
+                        part.size = int(round(float(rsize_bb)))
+
+        self._image.prepare(self)
+        self._image.layout_partitions()
+        self._image.create()
+
+    def assemble(self):
+        """
+        Assemble partitions into disk image
+        """
+        self._image.assemble()
+
+    def finalize(self):
+        """
+        Finalize the disk image.
+
+        For example, prepare the image to be bootable by e.g.
+        creating and installing a bootloader configuration.
+        """
+        source_plugin = self.ks.bootloader.source
+        disk_name = self.parts[0].disk
+        if source_plugin:
+            plugin = PluginMgr.get_plugins('source')[source_plugin]
+            plugin.do_install_disk(self._image, disk_name, self, self.workdir,
+                                   self.oe_builddir, self.bootimg_dir,
+                                   self.kernel_dir, self.native_sysroot)
+
+        full_path = self._image.path
+        # Generate .bmap
+        if self.bmap:
+            logger.debug("Generating bmap file for %s", disk_name)
+            python = os.path.join(self.native_sysroot, 'usr/bin/python3-native/python3')
+            bmaptool = os.path.join(self.native_sysroot, 'usr/bin/bmaptool')
+            exec_native_cmd("%s %s create %s -o %s.bmap" % \
+                            (python, bmaptool, full_path, full_path), self.native_sysroot)
+        # Compress the image
+        if self.compressor:
+            logger.debug("Compressing disk %s with %s", disk_name, self.compressor)
+            exec_cmd("%s %s" % (self.compressor, full_path))
+
+    def print_info(self):
+        """
+        Print the image(s) and artifacts used, for the user.
+        """
+        msg = "The new image(s) can be found here:\n"
+
+        extension = "direct" + {"gzip": ".gz",
+                                "bzip2": ".bz2",
+                                "xz": ".xz",
+                                None: ""}.get(self.compressor)
+        full_path = self._full_path(self.outdir, self.parts[0].disk, extension)
+        msg += '  %s\n\n' % full_path
+
+        msg += 'The following build artifacts were used to create the image(s):\n'
+        for part in self.parts:
+            if part.rootfs_dir is None:
+                continue
+            if part.mountpoint == '/':
+                suffix = ':'
+            else:
+                suffix = '["%s"]:' % (part.mountpoint or part.label)
+            rootdir = part.rootfs_dir
+            if rootdir in self.replaced_rootfs_paths:
+                rootdir = self.replaced_rootfs_paths[rootdir]
+            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), rootdir)
+
+        msg += '  BOOTIMG_DIR:                  %s\n' % self.bootimg_dir
+        msg += '  KERNEL_DIR:                   %s\n' % self.kernel_dir
+        msg += '  NATIVE_SYSROOT:               %s\n' % self.native_sysroot
+
+        logger.info(msg)
+
+    @property
+    def rootdev(self):
+        """
+        Get root device name to use as a 'root' parameter
+        in kernel command line.
+
+        Assume partition order same as in wks
+        """
+        for part in self.parts:
+            if part.mountpoint == "/":
+                if part.uuid:
+                    return "PARTUUID=%s" % part.uuid
+                else:
+                    suffix = 'p' if part.disk.startswith('mmcblk') else ''
+                    return "/dev/%s%s%-d" % (part.disk, suffix, part.realnum)
+
+    def cleanup(self):
+        if self._image:
+            self._image.cleanup()
+
+        # Move results to the output dir
+        if not os.path.exists(self.outdir):
+            os.makedirs(self.outdir)
+
+        for fname in os.listdir(self.workdir):
+            path = os.path.join(self.workdir, fname)
+            if os.path.isfile(path):
+                shutil.move(path, os.path.join(self.outdir, fname))
+
+        # remove work directory
+        shutil.rmtree(self.workdir, ignore_errors=True)
+
+# Overhead of the MBR partitioning scheme (just one sector)
+MBR_OVERHEAD = 1
+
+# Overhead of the GPT partitioning scheme
+GPT_OVERHEAD = 34
+
+# Size of a sector in bytes
+SECTOR_SIZE = 512
+
+class PartitionedImage():
+    """
+    Partitioned image in a file.
+    """
+
+    def __init__(self, path, ptable_format, partitions, native_sysroot=None):
+        self.path = path  # Path to the image file
+        self.numpart = 0  # Number of allocated partitions
+        self.realpart = 0 # Number of partitions in the partition table
+        self.offset = 0   # Offset of next partition (in sectors)
+        self.min_size = 0 # Minimum required disk size to fit
+                          # all partitions (in bytes)
+        self.ptable_format = ptable_format  # Partition table format
+        # Disk system identifier
+        self.identifier = random.SystemRandom().randint(1, 0xffffffff)
+
+        self.partitions = partitions
+        self.partimages = []
+        # Size of a sector used in calculations
+        self.sector_size = SECTOR_SIZE
+        self.native_sysroot = native_sysroot
+
+        # calculate the real partition number, accounting for partitions not
+        # in the partition table and logical partitions
+        realnum = 0
+        for part in self.partitions:
+            if part.no_table:
+                part.realnum = 0
+            else:
+                realnum += 1
+                if self.ptable_format == 'msdos' and realnum > 3 and len(partitions) > 4:
+                    part.realnum = realnum + 1
+                    continue
+                part.realnum = realnum
+
+        # generate parition and filesystem UUIDs
+        for part in self.partitions:
+            if not part.uuid and part.use_uuid:
+                if self.ptable_format == 'gpt':
+                    part.uuid = str(uuid.uuid4())
+                else: # msdos partition table
+                    part.uuid = '%08x-%02d' % (self.identifier, part.realnum)
+            if not part.fsuuid:
+                if part.fstype == 'vfat' or part.fstype == 'msdos':
+                    part.fsuuid = '0x' + str(uuid.uuid4())[:8].upper()
+                else:
+                    part.fsuuid = str(uuid.uuid4())
+
+    def prepare(self, imager):
+        """Prepare an image. Call prepare method of all image partitions."""
+        for part in self.partitions:
+            # need to create the filesystems in order to get their
+            # sizes before we can add them and do the layout.
+            part.prepare(imager, imager.workdir, imager.oe_builddir,
+                         imager.rootfs_dir, imager.bootimg_dir,
+                         imager.kernel_dir, imager.native_sysroot)
+
+            # Converting kB to sectors for parted
+            part.size_sec = part.disk_size * 1024 // self.sector_size
+
+    def layout_partitions(self):
+        """ Layout the partitions, meaning calculate the position of every
+        partition on the disk. The 'ptable_format' parameter defines the
+        partition table format and may be "msdos". """
+
+        logger.debug("Assigning %s partitions to disks", self.ptable_format)
+
+        # The number of primary and logical partitions. Extended partition and
+        # partitions not listed in the table are not included.
+        num_real_partitions = len([p for p in self.partitions if not p.no_table])
+
+        # Go through partitions in the order they are added in .ks file
+        for num in range(len(self.partitions)):
+            part = self.partitions[num]
+
+            if self.ptable_format == 'msdos' and part.part_name:
+                raise WicError("setting custom partition name is not " \
+                               "implemented for msdos partitions")
+
+            if self.ptable_format == 'msdos' and part.part_type:
+                # The --part-type can also be implemented for MBR partitions,
+                # in which case it would map to the 1-byte "partition type"
+                # filed at offset 3 of the partition entry.
+                raise WicError("setting custom partition type is not " \
+                               "implemented for msdos partitions")
+
+            # Get the disk where the partition is located
+            self.numpart += 1
+            if not part.no_table:
+                self.realpart += 1
+
+            if self.numpart == 1:
+                if self.ptable_format == "msdos":
+                    overhead = MBR_OVERHEAD
+                elif self.ptable_format == "gpt":
+                    overhead = GPT_OVERHEAD
+
+                # Skip one sector required for the partitioning scheme overhead
+                self.offset += overhead
+
+            if self.realpart > 3 and num_real_partitions > 4:
+                # Reserve a sector for EBR for every logical partition
+                # before alignment is performed.
+                if self.ptable_format == "msdos":
+                    self.offset += 1
+
+            if part.align:
+                # If not first partition and we do have alignment set we need
+                # to align the partition.
+                # FIXME: This leaves a empty spaces to the disk. To fill the
+                # gaps we could enlargea the previous partition?
+
+                # Calc how much the alignment is off.
+                align_sectors = self.offset % (part.align * 1024 // self.sector_size)
+
+                if align_sectors:
+                    # If partition is not aligned as required, we need
+                    # to move forward to the next alignment point
+                    align_sectors = (part.align * 1024 // self.sector_size) - align_sectors
+
+                    logger.debug("Realignment for %s%s with %s sectors, original"
+                                 " offset %s, target alignment is %sK.",
+                                 part.disk, self.numpart, align_sectors,
+                                 self.offset, part.align)
+
+                    # increase the offset so we actually start the partition on right alignment
+                    self.offset += align_sectors
+
+            part.start = self.offset
+            self.offset += part.size_sec
+
+            part.type = 'primary'
+            if not part.no_table:
+                part.num = self.realpart
+            else:
+                part.num = 0
+
+            if self.ptable_format == "msdos":
+                # only count the partitions that are in partition table
+                if num_real_partitions > 4:
+                    if self.realpart > 3:
+                        part.type = 'logical'
+                        part.num = self.realpart + 1
+
+            logger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
+                         "sectors (%d bytes).", part.mountpoint, part.disk,
+                         part.num, part.start, self.offset - 1, part.size_sec,
+                         part.size_sec * self.sector_size)
+
+        # Once all the partitions have been layed out, we can calculate the
+        # minumim disk size
+        self.min_size = self.offset
+        if self.ptable_format == "gpt":
+            self.min_size += GPT_OVERHEAD
+
+        self.min_size *= self.sector_size
+
+    def _create_partition(self, device, parttype, fstype, start, size):
+        """ Create a partition on an image described by the 'device' object. """
+
+        # Start is included to the size so we need to substract one from the end.
+        end = start + size - 1
+        logger.debug("Added '%s' partition, sectors %d-%d, size %d sectors",
+                     parttype, start, end, size)
+
+        cmd = "parted -s %s unit s mkpart %s" % (device, parttype)
+        if fstype:
+            cmd += " %s" % fstype
+        cmd += " %d %d" % (start, end)
+
+        return exec_native_cmd(cmd, self.native_sysroot)
+
+    def create(self):
+        logger.debug("Creating sparse file %s", self.path)
+        with open(self.path, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), self.min_size)
+
+        logger.debug("Initializing partition table for %s", self.path)
+        exec_native_cmd("parted -s %s mklabel %s" %
+                        (self.path, self.ptable_format), self.native_sysroot)
+
+        logger.debug("Set disk identifier %x", self.identifier)
+        with open(self.path, 'r+b') as img:
+            img.seek(0x1B8)
+            img.write(self.identifier.to_bytes(4, 'little'))
+
+        logger.debug("Creating partitions")
+
+        for part in self.partitions:
+            if part.num == 0:
+                continue
+
+            if self.ptable_format == "msdos" and part.num == 5:
+                # Create an extended partition (note: extended
+                # partition is described in MBR and contains all
+                # logical partitions). The logical partitions save a
+                # sector for an EBR just before the start of a
+                # partition. The extended partition must start one
+                # sector before the start of the first logical
+                # partition. This way the first EBR is inside of the
+                # extended partition. Since the extended partitions
+                # starts a sector before the first logical partition,
+                # add a sector at the back, so that there is enough
+                # room for all logical partitions.
+                self._create_partition(self.path, "extended",
+                                       None, part.start - 1,
+                                       self.offset - part.start + 1)
+
+            if part.fstype == "swap":
+                parted_fs_type = "linux-swap"
+            elif part.fstype == "vfat":
+                parted_fs_type = "fat32"
+            elif part.fstype == "msdos":
+                parted_fs_type = "fat16"
+                if not part.system_id:
+                    part.system_id = '0x6' # FAT16
+            else:
+                # Type for ext2/ext3/ext4/btrfs
+                parted_fs_type = "ext2"
+
+            # Boot ROM of OMAP boards require vfat boot partition to have an
+            # even number of sectors.
+            if part.mountpoint == "/boot" and part.fstype in ["vfat", "msdos"] \
+               and part.size_sec % 2:
+                logger.debug("Subtracting one sector from '%s' partition to "
+                             "get even number of sectors for the partition",
+                             part.mountpoint)
+                part.size_sec -= 1
+
+            self._create_partition(self.path, part.type,
+                                   parted_fs_type, part.start, part.size_sec)
+
+            if part.part_name:
+                logger.debug("partition %d: set name to %s",
+                             part.num, part.part_name)
+                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
+                                         (part.num, part.part_name,
+                                          self.path), self.native_sysroot)
+
+            if part.part_type:
+                logger.debug("partition %d: set type UID to %s",
+                             part.num, part.part_type)
+                exec_native_cmd("sgdisk --typecode=%d:%s %s" % \
+                                         (part.num, part.part_type,
+                                          self.path), self.native_sysroot)
+
+            if part.uuid and self.ptable_format == "gpt":
+                logger.debug("partition %d: set UUID to %s",
+                             part.num, part.uuid)
+                exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
+                                (part.num, part.uuid, self.path),
+                                self.native_sysroot)
+
+            if part.label and self.ptable_format == "gpt":
+                logger.debug("partition %d: set name to %s",
+                             part.num, part.label)
+                exec_native_cmd("parted -s %s name %d %s" % \
+                                (self.path, part.num, part.label),
+                                self.native_sysroot)
+
+            if part.active:
+                flag_name = "legacy_boot" if self.ptable_format == 'gpt' else "boot"
+                logger.debug("Set '%s' flag for partition '%s' on disk '%s'",
+                             flag_name, part.num, self.path)
+                exec_native_cmd("parted -s %s set %d %s on" % \
+                                (self.path, part.num, flag_name),
+                                self.native_sysroot)
+            if part.system_id:
+                exec_native_cmd("sfdisk --part-type %s %s %s" % \
+                                (self.path, part.num, part.system_id),
+                                self.native_sysroot)
+
+    def cleanup(self):
+        # remove partition images
+        for image in set(self.partimages):
+            os.remove(image)
+
+    def assemble(self):
+        logger.debug("Installing partitions")
+
+        for part in self.partitions:
+            source = part.source_file
+            if source:
+                # install source_file contents into a partition
+                sparse_copy(source, self.path, seek=part.start * self.sector_size)
+
+                logger.debug("Installed %s in partition %d, sectors %d-%d, "
+                             "size %d sectors", source, part.num, part.start,
+                             part.start + part.size_sec - 1, part.size_sec)
+
+                partimage = self.path + '.p%d' % part.num
+                os.rename(source, partimage)
+                self.partimages.append(partimage)
diff --git a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
new file mode 100644
index 0000000..0eb86a0
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
@@ -0,0 +1,274 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2014, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'bootimg-efi' source plugin class for 'wic'
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import logging
+import os
+import shutil
+
+from wic import WicError
+from wic.engine import get_custom_config
+from wic.pluginbase import SourcePlugin
+from wic.misc import (exec_cmd, exec_native_cmd,
+                      get_bitbake_var, BOOTDD_EXTRA_SPACE)
+
+logger = logging.getLogger('wic')
+
+class BootimgEFIPlugin(SourcePlugin):
+    """
+    Create EFI boot partition.
+    This plugin supports GRUB 2 and systemd-boot bootloaders.
+    """
+
+    name = 'bootimg-efi'
+
+    @classmethod
+    def do_configure_grubefi(cls, hdddir, creator, cr_workdir, source_params):
+        """
+        Create loader-specific (grub-efi) config
+        """
+        configfile = creator.ks.bootloader.configfile
+        custom_cfg = None
+        if configfile:
+            custom_cfg = get_custom_config(configfile)
+            if custom_cfg:
+                # Use a custom configuration for grub
+                grubefi_conf = custom_cfg
+                logger.debug("Using custom configuration file "
+                             "%s for grub.cfg", configfile)
+            else:
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s." % configfile)
+
+        initrd = source_params.get('initrd')
+
+        if initrd:
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not bootimg_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
+            exec_cmd(cp_cmd, True)
+        else:
+            logger.debug("Ignoring missing initrd")
+
+        if not custom_cfg:
+            # Create grub configuration using parameters from wks file
+            bootloader = creator.ks.bootloader
+
+            grubefi_conf = ""
+            grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
+            grubefi_conf += "default=boot\n"
+            grubefi_conf += "timeout=%s\n" % bootloader.timeout
+            grubefi_conf += "menuentry 'boot'{\n"
+
+            kernel = "/bzImage"
+
+            grubefi_conf += "linux %s root=%s rootwait %s\n" \
+                % (kernel, creator.rootdev, bootloader.append)
+
+            if initrd:
+               grubefi_conf += "initrd /%s\n" % initrd
+
+            grubefi_conf += "}\n"
+
+        logger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg",
+                     cr_workdir)
+        cfg = open("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir, "w")
+        cfg.write(grubefi_conf)
+        cfg.close()
+
+    @classmethod
+    def do_configure_systemdboot(cls, hdddir, creator, cr_workdir, source_params):
+        """
+        Create loader-specific systemd-boot/gummiboot config
+        """
+        install_cmd = "install -d %s/loader" % hdddir
+        exec_cmd(install_cmd)
+
+        install_cmd = "install -d %s/loader/entries" % hdddir
+        exec_cmd(install_cmd)
+
+        bootloader = creator.ks.bootloader
+
+        loader_conf = ""
+        loader_conf += "default boot\n"
+        loader_conf += "timeout %d\n" % bootloader.timeout
+
+        initrd = source_params.get('initrd')
+
+        if initrd:
+            # obviously we need to have a common common deploy var
+            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not bootimg_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
+            exec_cmd(cp_cmd, True)
+        else:
+            logger.debug("Ignoring missing initrd")
+
+        logger.debug("Writing systemd-boot config "
+                     "%s/hdd/boot/loader/loader.conf", cr_workdir)
+        cfg = open("%s/hdd/boot/loader/loader.conf" % cr_workdir, "w")
+        cfg.write(loader_conf)
+        cfg.close()
+
+        configfile = creator.ks.bootloader.configfile
+        custom_cfg = None
+        if configfile:
+            custom_cfg = get_custom_config(configfile)
+            if custom_cfg:
+                # Use a custom configuration for systemd-boot
+                boot_conf = custom_cfg
+                logger.debug("Using custom configuration file "
+                             "%s for systemd-boots's boot.conf", configfile)
+            else:
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s.", configfile)
+
+        if not custom_cfg:
+            # Create systemd-boot configuration using parameters from wks file
+            kernel = "/bzImage"
+
+            boot_conf = ""
+            boot_conf += "title boot\n"
+            boot_conf += "linux %s\n" % kernel
+            boot_conf += "options LABEL=Boot root=%s %s\n" % \
+                             (creator.rootdev, bootloader.append)
+
+            if initrd:
+                boot_conf += "initrd /%s\n" % initrd
+
+        logger.debug("Writing systemd-boot config "
+                     "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
+        cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
+        cfg.write(boot_conf)
+        cfg.close()
+
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(), creates loader-specific config
+        """
+        hdddir = "%s/hdd/boot" % cr_workdir
+
+        install_cmd = "install -d %s/EFI/BOOT" % hdddir
+        exec_cmd(install_cmd)
+
+        try:
+            if source_params['loader'] == 'grub-efi':
+                cls.do_configure_grubefi(hdddir, creator, cr_workdir, source_params)
+            elif source_params['loader'] == 'systemd-boot':
+                cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
+            else:
+                raise WicError("unrecognized bootimg-efi loader: %s" % source_params['loader'])
+        except KeyError:
+            raise WicError("bootimg-efi requires a loader, none specified")
+
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, prepare content for an EFI (grub) boot partition.
+        """
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+        staging_kernel_dir = kernel_dir
+
+        hdddir = "%s/hdd/boot" % cr_workdir
+
+        install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
+            (staging_kernel_dir, hdddir)
+        exec_cmd(install_cmd)
+
+
+        try:
+            if source_params['loader'] == 'grub-efi':
+                shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
+                                "%s/grub.cfg" % cr_workdir)
+                for mod in [x for x in os.listdir(kernel_dir) if x.startswith("grub-efi-")]:
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[9:])
+                    exec_cmd(cp_cmd, True)
+                shutil.move("%s/grub.cfg" % cr_workdir,
+                            "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
+            elif source_params['loader'] == 'systemd-boot':
+                for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
+                    exec_cmd(cp_cmd, True)
+            else:
+                raise WicError("unrecognized bootimg-efi loader: %s" %
+                               source_params['loader'])
+        except KeyError:
+            raise WicError("bootimg-efi requires a loader, none specified")
+
+        startup = os.path.join(kernel_dir, "startup.nsh")
+        if os.path.exists(startup):
+            cp_cmd = "cp %s %s/" % (startup, hdddir)
+            exec_cmd(cp_cmd, True)
+
+        du_cmd = "du -bks %s" % hdddir
+        out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        extra_blocks = part.get_extra_block_count(blocks)
+
+        if extra_blocks < BOOTDD_EXTRA_SPACE:
+            extra_blocks = BOOTDD_EXTRA_SPACE
+
+        blocks += extra_blocks
+
+        logger.debug("Added %d extra blocks to %s to get to %d total blocks",
+                     extra_blocks, part.mountpoint, blocks)
+
+        # dosfs image, created by mkdosfs
+        bootimg = "%s/boot.img" % cr_workdir
+
+        dosfs_cmd = "mkdosfs -n efi -i %s -C %s %d" % \
+                    (part.fsuuid, bootimg, blocks)
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % bootimg
+        exec_cmd(chmod_cmd)
+
+        du_cmd = "du -Lbks %s" % bootimg
+        out = exec_cmd(du_cmd)
+        bootimg_size = out.split()[0]
+
+        part.size = int(bootimg_size)
+        part.source_file = bootimg
diff --git a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-partition.py b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-partition.py
new file mode 100644
index 0000000..ddc880b
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-partition.py
@@ -0,0 +1,207 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'bootimg-partition' source plugin class for
+# 'wic'. The plugin creates an image of boot partition, copying over
+# files listed in IMAGE_BOOT_FILES bitbake variable.
+#
+# AUTHORS
+# Maciej Borzecki <maciej.borzecki (at] open-rnd.pl>
+#
+
+import logging
+import os
+import re
+
+from glob import glob
+
+from wic import WicError
+from wic.engine import get_custom_config
+from wic.pluginbase import SourcePlugin
+from wic.misc import exec_cmd, get_bitbake_var
+
+logger = logging.getLogger('wic')
+
+class BootimgPartitionPlugin(SourcePlugin):
+    """
+    Create an image of boot partition, copying over files
+    listed in IMAGE_BOOT_FILES bitbake variable.
+    """
+
+    name = 'bootimg-partition'
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             native_sysroot):
+        """
+        Called before do_prepare_partition(), create u-boot specific boot config
+        """
+        hdddir = "%s/boot.%d" % (cr_workdir, part.lineno)
+        install_cmd = "install -d %s" % hdddir
+        exec_cmd(install_cmd)
+
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+        boot_files = None
+        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), (None, None)):
+            if fmt:
+                var = fmt % id
+            else:
+                var = ""
+
+            boot_files = get_bitbake_var("IMAGE_BOOT_FILES" + var)
+            if boot_files is not None:
+                break
+
+        if boot_files is None:
+            raise WicError('No boot files defined, IMAGE_BOOT_FILES unset for entry #%d' % part.lineno)
+
+        logger.debug('Boot files: %s', boot_files)
+
+        # list of tuples (src_name, dst_name)
+        deploy_files = []
+        for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
+            if ';' in src_entry:
+                dst_entry = tuple(src_entry.split(';'))
+                if not dst_entry[0] or not dst_entry[1]:
+                    raise WicError('Malformed boot file entry: %s' % src_entry)
+            else:
+                dst_entry = (src_entry, src_entry)
+
+            logger.debug('Destination entry: %r', dst_entry)
+            deploy_files.append(dst_entry)
+
+        cls.install_task = [];
+        for deploy_entry in deploy_files:
+            src, dst = deploy_entry
+            if '*' in src:
+                # by default install files under their basename
+                entry_name_fn = os.path.basename
+                if dst != src:
+                    # unless a target name was given, then treat name
+                    # as a directory and append a basename
+                    entry_name_fn = lambda name: \
+                                    os.path.join(dst,
+                                                 os.path.basename(name))
+
+                srcs = glob(os.path.join(kernel_dir, src))
+
+                logger.debug('Globbed sources: %s', ', '.join(srcs))
+                for entry in srcs:
+                    src = os.path.relpath(entry, kernel_dir)
+                    entry_dst_name = entry_name_fn(entry)
+                    cls.install_task.append((src, entry_dst_name))
+            else:
+                cls.install_task.append((src, dst))
+
+        if source_params.get('loader') != "u-boot":
+            return
+
+        configfile = cr.ks.bootloader.configfile
+        custom_cfg = None
+        if configfile:
+            custom_cfg = get_custom_config(configfile)
+            if custom_cfg:
+                # Use a custom configuration for extlinux.conf
+                extlinux_conf = custom_cfg
+                logger.debug("Using custom configuration file "
+                             "%s for extlinux.cfg", configfile)
+            else:
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s." % configfile)
+
+        if not custom_cfg:
+            # The kernel types supported by the sysboot of u-boot
+            kernel_types = ["zImage", "Image", "fitImage", "uImage", "vmlinux"]
+            has_dtb = False
+            fdt_dir = '/'
+            kernel_name = None
+
+            # Find the kernel image name, from the highest precedence to lowest
+            for image in kernel_types:
+                for task in cls.install_task:
+                    src, dst = task
+                    if re.match(image, src):
+                        kernel_name = os.path.join('/', dst)
+                        break
+                if kernel_name:
+                    break
+
+            for task in cls.install_task:
+                src, dst = task
+                # We suppose that all the dtb are in the same directory
+                if re.search(r'\.dtb', src) and fdt_dir == '/':
+                    has_dtb = True
+                    fdt_dir = os.path.join(fdt_dir, os.path.dirname(dst))
+                    break
+
+            if not kernel_name:
+                raise WicError('No kernel file founded')
+
+            # Compose the extlinux.conf
+            extlinux_conf = "default Yocto\n"
+            extlinux_conf += "label Yocto\n"
+            extlinux_conf += "   kernel %s\n" % kernel_name
+            if has_dtb:
+                extlinux_conf += "   fdtdir %s\n" % fdt_dir
+            bootloader = cr.ks.bootloader
+            extlinux_conf += "append root=%s rootwait %s\n" \
+                             % (cr.rootdev, bootloader.append if bootloader.append else '')
+
+        install_cmd = "install -d %s/extlinux/" % hdddir
+        exec_cmd(install_cmd)
+        cfg = open("%s/extlinux/extlinux.conf" % hdddir, "w")
+        cfg.write(extlinux_conf)
+        cfg.close()
+
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, does the following:
+        - sets up a vfat partition
+        - copies all files listed in IMAGE_BOOT_FILES variable
+        """
+        hdddir = "%s/boot.%d" % (cr_workdir, part.lineno)
+
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+        logger.debug('Kernel dir: %s', bootimg_dir)
+
+
+        for task in cls.install_task:
+            src_path, dst_path = task
+            logger.debug('Install %s as %s', src_path, dst_path)
+            install_cmd = "install -m 0644 -D %s %s" \
+                          % (os.path.join(kernel_dir, src_path),
+                             os.path.join(hdddir, dst_path))
+            exec_cmd(install_cmd)
+
+        logger.debug('Prepare boot partition using rootfs in %s', hdddir)
+        part.prepare_rootfs(cr_workdir, oe_builddir, hdddir,
+                            native_sysroot, False)
diff --git a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-pcbios.py b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-pcbios.py
new file mode 100644
index 0000000..d599112
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-pcbios.py
@@ -0,0 +1,207 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2014, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'bootimg-pcbios' source plugin class for 'wic'
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import logging
+import os
+
+from wic import WicError
+from wic.engine import get_custom_config
+from wic.pluginbase import SourcePlugin
+from wic.misc import (exec_cmd, exec_native_cmd,
+                      get_bitbake_var, BOOTDD_EXTRA_SPACE)
+
+logger = logging.getLogger('wic')
+
+class BootimgPcbiosPlugin(SourcePlugin):
+    """
+    Create MBR boot partition and install syslinux on it.
+    """
+
+    name = 'bootimg-pcbios'
+
+    @classmethod
+    def _get_bootimg_dir(cls, bootimg_dir, dirname):
+        """
+        Check if dirname exists in default bootimg_dir or in STAGING_DIR.
+        """
+        for result in (bootimg_dir, get_bitbake_var("STAGING_DATADIR")):
+            if os.path.exists("%s/%s" % (result, dirname)):
+                return result
+
+        raise WicError("Couldn't find correct bootimg_dir, exiting")
+
+    @classmethod
+    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.  In this case, we install the MBR.
+        """
+        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
+        mbrfile = "%s/syslinux/" % bootimg_dir
+        if creator.ptable_format == 'msdos':
+            mbrfile += "mbr.bin"
+        elif creator.ptable_format == 'gpt':
+            mbrfile += "gptmbr.bin"
+        else:
+            raise WicError("Unsupported partition table: %s" %
+                           creator.ptable_format)
+
+        if not os.path.exists(mbrfile):
+            raise WicError("Couldn't find %s.  If using the -e option, do you "
+                           "have the right MACHINE set in local.conf?  If not, "
+                           "is the bootimg_dir path correct?" % mbrfile)
+
+        full_path = creator._full_path(workdir, disk_name, "direct")
+        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
+                     disk_name, full_path, disk.min_size)
+
+        dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
+        exec_cmd(dd_cmd, native_sysroot)
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(), creates syslinux config
+        """
+        hdddir = "%s/hdd/boot" % cr_workdir
+
+        install_cmd = "install -d %s" % hdddir
+        exec_cmd(install_cmd)
+
+        bootloader = creator.ks.bootloader
+
+        custom_cfg = None
+        if bootloader.configfile:
+            custom_cfg = get_custom_config(bootloader.configfile)
+            if custom_cfg:
+                # Use a custom configuration for grub
+                syslinux_conf = custom_cfg
+                logger.debug("Using custom configuration file %s "
+                             "for syslinux.cfg", bootloader.configfile)
+            else:
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s." % bootloader.configfile)
+
+        if not custom_cfg:
+            # Create syslinux configuration using parameters from wks file
+            splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
+            if os.path.exists(splash):
+                splashline = "menu background splash.jpg"
+            else:
+                splashline = ""
+
+            syslinux_conf = ""
+            syslinux_conf += "PROMPT 0\n"
+            syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
+            syslinux_conf += "\n"
+            syslinux_conf += "ALLOWOPTIONS 1\n"
+            syslinux_conf += "SERIAL 0 115200\n"
+            syslinux_conf += "\n"
+            if splashline:
+                syslinux_conf += "%s\n" % splashline
+            syslinux_conf += "DEFAULT boot\n"
+            syslinux_conf += "LABEL boot\n"
+
+            kernel = "/vmlinuz"
+            syslinux_conf += "KERNEL " + kernel + "\n"
+
+            syslinux_conf += "APPEND label=boot root=%s %s\n" % \
+                             (creator.rootdev, bootloader.append)
+
+        logger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg",
+                     cr_workdir)
+        cfg = open("%s/hdd/boot/syslinux.cfg" % cr_workdir, "w")
+        cfg.write(syslinux_conf)
+        cfg.close()
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, prepare content for legacy bios boot partition.
+        """
+        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
+
+        staging_kernel_dir = kernel_dir
+
+        hdddir = "%s/hdd/boot" % cr_workdir
+
+        cmds = ("install -m 0644 %s/bzImage %s/vmlinuz" %
+                (staging_kernel_dir, hdddir),
+                "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
+                (bootimg_dir, hdddir),
+                "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c32" %
+                (bootimg_dir, hdddir),
+                "install -m 444 %s/syslinux/libcom32.c32 %s/libcom32.c32" %
+                (bootimg_dir, hdddir),
+                "install -m 444 %s/syslinux/libutil.c32 %s/libutil.c32" %
+                (bootimg_dir, hdddir))
+
+        for install_cmd in cmds:
+            exec_cmd(install_cmd)
+
+        du_cmd = "du -bks %s" % hdddir
+        out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        extra_blocks = part.get_extra_block_count(blocks)
+
+        if extra_blocks < BOOTDD_EXTRA_SPACE:
+            extra_blocks = BOOTDD_EXTRA_SPACE
+
+        blocks += extra_blocks
+
+        logger.debug("Added %d extra blocks to %s to get to %d total blocks",
+                     extra_blocks, part.mountpoint, blocks)
+
+        # dosfs image, created by mkdosfs
+        bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
+
+        dosfs_cmd = "mkdosfs -n boot -i %s -S 512 -C %s %d" % \
+                    (part.fsuuid, bootimg, blocks)
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
+
+        syslinux_cmd = "syslinux %s" % bootimg
+        exec_native_cmd(syslinux_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % bootimg
+        exec_cmd(chmod_cmd)
+
+        du_cmd = "du -Lbks %s" % bootimg
+        out = exec_cmd(du_cmd)
+        bootimg_size = out.split()[0]
+
+        part.size = int(bootimg_size)
+        part.source_file = bootimg
diff --git a/meta/recipes-support/wic/files/wic/plugins/source/isoimage-isohybrid.py b/meta/recipes-support/wic/files/wic/plugins/source/isoimage-isohybrid.py
new file mode 100644
index 0000000..0d4f50d
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/plugins/source/isoimage-isohybrid.py
@@ -0,0 +1,443 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'isoimage-isohybrid' source plugin class for 'wic'
+#
+# AUTHORS
+# Mihaly Varga <mihaly.varga (at] ni.com>
+
+import glob
+import logging
+import os
+import re
+import shutil
+
+from wic import WicError
+from wic.engine import get_custom_config
+from wic.pluginbase import SourcePlugin
+from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
+
+logger = logging.getLogger('wic')
+
+class IsoImagePlugin(SourcePlugin):
+    """
+    Create a bootable ISO image
+
+    This plugin creates a hybrid, legacy and EFI bootable ISO image. The
+    generated image can be used on optical media as well as USB media.
+
+    Legacy boot uses syslinux and EFI boot uses grub or gummiboot (not
+    implemented yet) as bootloader. The plugin creates the directories required
+    by bootloaders and populates them by creating and configuring the
+    bootloader files.
+
+    Example kickstart file:
+    part /boot --source isoimage-isohybrid --sourceparams="loader=grub-efi, \\
+    image_name= IsoImage" --ondisk cd --label LIVECD
+    bootloader  --timeout=10  --append=" "
+
+    In --sourceparams "loader" specifies the bootloader used for booting in EFI
+    mode, while "image_name" specifies the name of the generated image. In the
+    example above, wic creates an ISO image named IsoImage-cd.direct (default
+    extension added by direct imeger plugin) and a file named IsoImage-cd.iso
+    """
+
+    name = 'isoimage-isohybrid'
+
+    @classmethod
+    def do_configure_syslinux(cls, creator, cr_workdir):
+        """
+        Create loader-specific (syslinux) config
+        """
+        splash = os.path.join(cr_workdir, "ISO/boot/splash.jpg")
+        if os.path.exists(splash):
+            splashline = "menu background splash.jpg"
+        else:
+            splashline = ""
+
+        bootloader = creator.ks.bootloader
+
+        syslinux_conf = ""
+        syslinux_conf += "PROMPT 0\n"
+        syslinux_conf += "TIMEOUT %s \n" % (bootloader.timeout or 10)
+        syslinux_conf += "\n"
+        syslinux_conf += "ALLOWOPTIONS 1\n"
+        syslinux_conf += "SERIAL 0 115200\n"
+        syslinux_conf += "\n"
+        if splashline:
+            syslinux_conf += "%s\n" % splashline
+        syslinux_conf += "DEFAULT boot\n"
+        syslinux_conf += "LABEL boot\n"
+
+        kernel = "/bzImage"
+        syslinux_conf += "KERNEL " + kernel + "\n"
+        syslinux_conf += "APPEND initrd=/initrd LABEL=boot %s\n" \
+                             % bootloader.append
+
+        logger.debug("Writing syslinux config %s/ISO/isolinux/isolinux.cfg",
+                     cr_workdir)
+
+        with open("%s/ISO/isolinux/isolinux.cfg" % cr_workdir, "w") as cfg:
+            cfg.write(syslinux_conf)
+
+    @classmethod
+    def do_configure_grubefi(cls, part, creator, target_dir):
+        """
+        Create loader-specific (grub-efi) config
+        """
+        configfile = creator.ks.bootloader.configfile
+        if configfile:
+            grubefi_conf = get_custom_config(configfile)
+            if grubefi_conf:
+                logger.debug("Using custom configuration file %s for grub.cfg",
+                             configfile)
+            else:
+                raise WicError("configfile is specified "
+                               "but failed to get it from %s", configfile)
+        else:
+            splash = os.path.join(target_dir, "splash.jpg")
+            if os.path.exists(splash):
+                splashline = "menu background splash.jpg"
+            else:
+                splashline = ""
+
+            bootloader = creator.ks.bootloader
+
+            grubefi_conf = ""
+            grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
+            grubefi_conf += "--parity=no --stop=1\n"
+            grubefi_conf += "default=boot\n"
+            grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
+            grubefi_conf += "\n"
+            grubefi_conf += "search --set=root --label %s " % part.label
+            grubefi_conf += "\n"
+            grubefi_conf += "menuentry 'boot'{\n"
+
+            kernel = "/bzImage"
+
+            grubefi_conf += "linux %s rootwait %s\n" \
+                            % (kernel, bootloader.append)
+            grubefi_conf += "initrd /initrd \n"
+            grubefi_conf += "}\n"
+
+            if splashline:
+                grubefi_conf += "%s\n" % splashline
+
+        cfg_path = os.path.join(target_dir, "grub.cfg")
+        logger.debug("Writing grubefi config %s", cfg_path)
+
+        with open(cfg_path, "w") as cfg:
+            cfg.write(grubefi_conf)
+
+    @staticmethod
+    def _build_initramfs_path(rootfs_dir, cr_workdir):
+        """
+        Create path for initramfs image
+        """
+
+        initrd = get_bitbake_var("INITRD_LIVE") or get_bitbake_var("INITRD")
+        if not initrd:
+            initrd_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not initrd_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting.")
+
+            image_name = get_bitbake_var("IMAGE_BASENAME")
+            if not image_name:
+                raise WicError("Couldn't find IMAGE_BASENAME, exiting.")
+
+            image_type = get_bitbake_var("INITRAMFS_FSTYPES")
+            if not image_type:
+                raise WicError("Couldn't find INITRAMFS_FSTYPES, exiting.")
+
+            machine = os.path.basename(initrd_dir)
+
+            pattern = '%s/%s*%s.%s' % (initrd_dir, image_name, machine, image_type)
+            files = glob.glob(pattern)
+            if files:
+                initrd = files[0]
+
+        if not initrd or not os.path.exists(initrd):
+            # Create initrd from rootfs directory
+            initrd = "%s/initrd.cpio.gz" % cr_workdir
+            initrd_dir = "%s/INITRD" % cr_workdir
+            shutil.copytree("%s" % rootfs_dir, \
+                            "%s" % initrd_dir, symlinks=True)
+
+            if os.path.isfile("%s/init" % rootfs_dir):
+                shutil.copy2("%s/init" % rootfs_dir, "%s/init" % initrd_dir)
+            elif os.path.lexists("%s/init" % rootfs_dir):
+                os.symlink(os.readlink("%s/init" % rootfs_dir), \
+                            "%s/init" % initrd_dir)
+            elif os.path.isfile("%s/sbin/init" % rootfs_dir):
+                shutil.copy2("%s/sbin/init" % rootfs_dir, \
+                            "%s" % initrd_dir)
+            elif os.path.lexists("%s/sbin/init" % rootfs_dir):
+                os.symlink(os.readlink("%s/sbin/init" % rootfs_dir), \
+                            "%s/init" % initrd_dir)
+            else:
+                raise WicError("Couldn't find or build initrd, exiting.")
+
+            exec_cmd("cd %s && find . | cpio -o -H newc -R +0:+0 >./initrd.cpio " \
+                    % initrd_dir, as_shell=True)
+            exec_cmd("gzip -f -9 -c %s/initrd.cpio > %s" \
+                    % (cr_workdir, initrd), as_shell=True)
+            shutil.rmtree(initrd_dir)
+
+        return initrd
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(), creates loader-specific config
+        """
+        isodir = "%s/ISO/" % cr_workdir
+
+        if os.path.exists(isodir):
+            shutil.rmtree(isodir)
+
+        install_cmd = "install -d %s " % isodir
+        exec_cmd(install_cmd)
+
+        # Overwrite the name of the created image
+        logger.debug(source_params)
+        if 'image_name' in source_params and \
+                    source_params['image_name'].strip():
+            creator.name = source_params['image_name'].strip()
+            logger.debug("The name of the image is: %s", creator.name)
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, prepare content for a bootable ISO image.
+        """
+
+        isodir = "%s/ISO" % cr_workdir
+
+        if part.rootfs_dir is None:
+            if not 'ROOTFS_DIR' in rootfs_dir:
+                raise WicError("Couldn't find --rootfs-dir, exiting.")
+            rootfs_dir = rootfs_dir['ROOTFS_DIR']
+        else:
+            if part.rootfs_dir in rootfs_dir:
+                rootfs_dir = rootfs_dir[part.rootfs_dir]
+            elif part.rootfs_dir:
+                rootfs_dir = part.rootfs_dir
+            else:
+                raise WicError("Couldn't find --rootfs-dir=%s connection "
+                               "or it is not a valid path, exiting." %
+                               part.rootfs_dir)
+
+        if not os.path.isdir(rootfs_dir):
+            rootfs_dir = get_bitbake_var("IMAGE_ROOTFS")
+        if not os.path.isdir(rootfs_dir):
+            raise WicError("Couldn't find IMAGE_ROOTFS, exiting.")
+
+        part.rootfs_dir = rootfs_dir
+        deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+        img_iso_dir = get_bitbake_var("ISODIR")
+
+        # Remove the temporary file created by part.prepare_rootfs()
+        if os.path.isfile(part.source_file):
+            os.remove(part.source_file)
+
+        # Support using a different initrd other than default
+        if source_params.get('initrd'):
+            initrd = source_params['initrd']
+            if not deploy_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+            cp_cmd = "cp %s/%s %s" % (deploy_dir, initrd, cr_workdir)
+            exec_cmd(cp_cmd)
+        else:
+            # Prepare initial ramdisk
+            initrd = "%s/initrd" % deploy_dir
+            if not os.path.isfile(initrd):
+                initrd = "%s/initrd" % img_iso_dir
+            if not os.path.isfile(initrd):
+                initrd = cls._build_initramfs_path(rootfs_dir, cr_workdir)
+
+        install_cmd = "install -m 0644 %s %s/initrd" % (initrd, isodir)
+        exec_cmd(install_cmd)
+
+        # Remove the temporary file created by _build_initramfs_path function
+        if os.path.isfile("%s/initrd.cpio.gz" % cr_workdir):
+            os.remove("%s/initrd.cpio.gz" % cr_workdir)
+
+        # Install bzImage
+        install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
+                      (kernel_dir, isodir)
+        exec_cmd(install_cmd)
+
+        #Create bootloader for efi boot
+        try:
+            target_dir = "%s/EFI/BOOT" % isodir
+            if os.path.exists(target_dir):
+                shutil.rmtree(target_dir)
+
+            os.makedirs(target_dir)
+
+            if source_params['loader'] == 'grub-efi':
+                # Builds bootx64.efi/bootia32.efi if ISODIR didn't exist or
+                # didn't contains it
+                target_arch = get_bitbake_var("TARGET_SYS")
+                if not target_arch:
+                    raise WicError("Coludn't find target architecture")
+
+                if re.match("x86_64", target_arch):
+                    grub_src_image = "grub-efi-bootx64.efi"
+                    grub_dest_image = "bootx64.efi"
+                elif re.match('i.86', target_arch):
+                    grub_src_image = "grub-efi-bootia32.efi"
+                    grub_dest_image = "bootia32.efi"
+                else:
+                    raise WicError("grub-efi is incompatible with target %s" %
+                                   target_arch)
+
+                grub_target = os.path.join(target_dir, grub_dest_image)
+                if not os.path.isfile(grub_target):
+                    grub_src = os.path.join(deploy_dir, grub_src_image)
+                    if not os.path.exists(grub_src):
+                        raise WicError("Grub loader %s is not found in %s. "
+                                       "Please build grub-efi first" % (grub_image, deploy_dir))
+                    shutil.copy(grub_src, grub_target)
+
+                if not os.path.isfile(os.path.join(target_dir, "boot.cfg")):
+                    cls.do_configure_grubefi(part, creator, target_dir)
+
+            else:
+                raise WicError("unrecognized bootimg-efi loader: %s" %
+                               source_params['loader'])
+        except KeyError:
+            raise WicError("bootimg-efi requires a loader, none specified")
+
+        # Create efi.img that contains bootloader files for EFI booting
+        # if ISODIR didn't exist or didn't contains it
+        if os.path.isfile("%s/efi.img" % img_iso_dir):
+            install_cmd = "install -m 0644 %s/efi.img %s/efi.img" % \
+                (img_iso_dir, isodir)
+            exec_cmd(install_cmd)
+        else:
+            du_cmd = "du -bks %s/EFI" % isodir
+            out = exec_cmd(du_cmd)
+            blocks = int(out.split()[0])
+            # Add some extra space for file system overhead
+            blocks += 100
+            logger.debug("Added 100 extra blocks to %s to get to %d "
+                         "total blocks", part.mountpoint, blocks)
+
+            # dosfs image for EFI boot
+            bootimg = "%s/efi.img" % isodir
+
+            dosfs_cmd = 'mkfs.vfat -n "EFIimg" -S 512 -C %s %d' \
+                        % (bootimg, blocks)
+            exec_native_cmd(dosfs_cmd, native_sysroot)
+
+            mmd_cmd = "mmd -i %s ::/EFI" % bootimg
+            exec_native_cmd(mmd_cmd, native_sysroot)
+
+            mcopy_cmd = "mcopy -i %s -s %s/EFI/* ::/EFI/" \
+                        % (bootimg, isodir)
+            exec_native_cmd(mcopy_cmd, native_sysroot)
+
+            chmod_cmd = "chmod 644 %s" % bootimg
+            exec_cmd(chmod_cmd)
+
+        # Prepare files for legacy boot
+        syslinux_dir = get_bitbake_var("STAGING_DATADIR")
+        if not syslinux_dir:
+            raise WicError("Couldn't find STAGING_DATADIR, exiting.")
+
+        if os.path.exists("%s/isolinux" % isodir):
+            shutil.rmtree("%s/isolinux" % isodir)
+
+        install_cmd = "install -d %s/isolinux" % isodir
+        exec_cmd(install_cmd)
+
+        cls.do_configure_syslinux(creator, cr_workdir)
+
+        install_cmd = "install -m 444 %s/syslinux/ldlinux.sys " % syslinux_dir
+        install_cmd += "%s/isolinux/ldlinux.sys" % isodir
+        exec_cmd(install_cmd)
+
+        install_cmd = "install -m 444 %s/syslinux/isohdpfx.bin " % syslinux_dir
+        install_cmd += "%s/isolinux/isohdpfx.bin" % isodir
+        exec_cmd(install_cmd)
+
+        install_cmd = "install -m 644 %s/syslinux/isolinux.bin " % syslinux_dir
+        install_cmd += "%s/isolinux/isolinux.bin" % isodir
+        exec_cmd(install_cmd)
+
+        install_cmd = "install -m 644 %s/syslinux/ldlinux.c32 " % syslinux_dir
+        install_cmd += "%s/isolinux/ldlinux.c32" % isodir
+        exec_cmd(install_cmd)
+
+        #create ISO image
+        iso_img = "%s/tempiso_img.iso" % cr_workdir
+        iso_bootimg = "isolinux/isolinux.bin"
+        iso_bootcat = "isolinux/boot.cat"
+        efi_img = "efi.img"
+
+        mkisofs_cmd = "mkisofs -V %s " % part.label
+        mkisofs_cmd += "-o %s -U " % iso_img
+        mkisofs_cmd += "-J -joliet-long -r -iso-level 2 -b %s " % iso_bootimg
+        mkisofs_cmd += "-c %s -no-emul-boot -boot-load-size 4 " % iso_bootcat
+        mkisofs_cmd += "-boot-info-table -eltorito-alt-boot "
+        mkisofs_cmd += "-eltorito-platform 0xEF -eltorito-boot %s " % efi_img
+        mkisofs_cmd += "-no-emul-boot %s " % isodir
+
+        logger.debug("running command: %s", mkisofs_cmd)
+        exec_native_cmd(mkisofs_cmd, native_sysroot)
+
+        shutil.rmtree(isodir)
+
+        du_cmd = "du -Lbks %s" % iso_img
+        out = exec_cmd(du_cmd)
+        isoimg_size = int(out.split()[0])
+
+        part.size = isoimg_size
+        part.source_file = iso_img
+
+    @classmethod
+    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.  In this case, we insert/modify the MBR using isohybrid
+        utility for booting via BIOS from disk storage devices.
+        """
+
+        iso_img = "%s.p1" % disk.path
+        full_path = creator._full_path(workdir, disk_name, "direct")
+        full_path_iso = creator._full_path(workdir, disk_name, "iso")
+
+        isohybrid_cmd = "isohybrid -u %s" % iso_img
+        logger.debug("running command: %s", isohybrid_cmd)
+        exec_native_cmd(isohybrid_cmd, native_sysroot)
+
+        # Replace the image created by direct plugin with the one created by
+        # mkisofs command. This is necessary because the iso image created by
+        # mkisofs has a very specific MBR is system area of the ISO image, and
+        # direct plugin adds and configures an another MBR.
+        logger.debug("Replaceing the image created by direct plugin\n")
+        os.remove(disk.path)
+        shutil.copy2(iso_img, full_path_iso)
+        shutil.copy2(full_path_iso, full_path)
diff --git a/meta/recipes-support/wic/files/wic/plugins/source/rawcopy.py b/meta/recipes-support/wic/files/wic/plugins/source/rawcopy.py
new file mode 100644
index 0000000..e86398a
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/plugins/source/rawcopy.py
@@ -0,0 +1,91 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+
+import logging
+import os
+
+from wic import WicError
+from wic.pluginbase import SourcePlugin
+from wic.misc import exec_cmd, get_bitbake_var
+from wic.filemap import sparse_copy
+
+logger = logging.getLogger('wic')
+
+class RawCopyPlugin(SourcePlugin):
+    """
+    Populate partition content from raw image file.
+    """
+
+    name = 'rawcopy'
+
+    @staticmethod
+    def do_image_label(fstype, dst, label):
+        if fstype.startswith('ext'):
+            cmd = 'tune2fs -L %s %s' % (label, dst)
+        elif fstype in ('msdos', 'vfat'):
+            cmd = 'dosfslabel %s %s' % (dst, label)
+        elif fstype == 'btrfs':
+            cmd = 'btrfs filesystem label %s %s' % (dst, label)
+        elif fstype == 'swap':
+            cmd = 'mkswap -L %s %s' % (label, dst)
+        elif fstype == 'squashfs':
+            raise WicError("It's not possible to update a squashfs "
+                           "filesystem label '%s'" % (label))
+        else:
+            raise WicError("Cannot update filesystem label: "
+                           "Unknown fstype: '%s'" % (fstype))
+
+        exec_cmd(cmd)
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+
+        logger.debug('Kernel dir: %s', kernel_dir)
+
+        if 'file' not in source_params:
+            raise WicError("No file specified")
+
+        src = os.path.join(kernel_dir, source_params['file'])
+        dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
+
+        if 'skip' in source_params:
+            sparse_copy(src, dst, skip=int(source_params['skip']))
+        else:
+            sparse_copy(src, dst)
+
+        # get the size in the right units for kickstart (kB)
+        du_cmd = "du -Lbks %s" % dst
+        out = exec_cmd(du_cmd)
+        filesize = int(out.split()[0])
+
+        if filesize > part.size:
+            part.size = filesize
+
+        if part.label:
+            RawCopyPlugin.do_image_label(part.fstype, dst, part.label)
+
+        part.source_file = dst
diff --git a/meta/recipes-support/wic/files/wic/plugins/source/rootfs.py b/meta/recipes-support/wic/files/wic/plugins/source/rootfs.py
new file mode 100644
index 0000000..aec720f
--- /dev/null
+++ b/meta/recipes-support/wic/files/wic/plugins/source/rootfs.py
@@ -0,0 +1,126 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2014, Intel Corporation.
+# All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This implements the 'rootfs' source plugin class for 'wic'
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+# Joao Henrique Ferreira de Freitas <joaohf (at] gmail.com>
+#
+
+import logging
+import os
+import shutil
+import sys
+
+from oe.path import copyhardlinktree
+
+from wic import WicError
+from wic.pluginbase import SourcePlugin
+from wic.misc import get_bitbake_var
+
+logger = logging.getLogger('wic')
+
+class RootfsPlugin(SourcePlugin):
+    """
+    Populate partition content from a rootfs directory.
+    """
+
+    name = 'rootfs'
+
+    @staticmethod
+    def __get_rootfs_dir(rootfs_dir):
+        if os.path.isdir(rootfs_dir):
+            return os.path.realpath(rootfs_dir)
+
+        image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
+        if not os.path.isdir(image_rootfs_dir):
+            raise WicError("No valid artifact IMAGE_ROOTFS from image "
+                           "named %s has been found at %s, exiting." %
+                           (rootfs_dir, image_rootfs_dir))
+
+        return os.path.realpath(image_rootfs_dir)
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             krootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, prepare content for legacy bios boot partition.
+        """
+        if part.rootfs_dir is None:
+            if not 'ROOTFS_DIR' in krootfs_dir:
+                raise WicError("Couldn't find --rootfs-dir, exiting")
+
+            rootfs_dir = krootfs_dir['ROOTFS_DIR']
+        else:
+            if part.rootfs_dir in krootfs_dir:
+                rootfs_dir = krootfs_dir[part.rootfs_dir]
+            elif part.rootfs_dir:
+                rootfs_dir = part.rootfs_dir
+            else:
+                raise WicError("Couldn't find --rootfs-dir=%s connection or "
+                               "it is not a valid path, exiting" % part.rootfs_dir)
+
+        part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
+
+        new_rootfs = None
+        # Handle excluded paths.
+        if part.exclude_path is not None:
+            # We need a new rootfs directory we can delete files from. Copy to
+            # workdir.
+            new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
+
+            if os.path.lexists(new_rootfs):
+                shutil.rmtree(os.path.join(new_rootfs))
+
+            copyhardlinktree(part.rootfs_dir, new_rootfs)
+
+            for orig_path in part.exclude_path:
+                path = orig_path
+                if os.path.isabs(path):
+                    logger.error("Must be relative: --exclude-path=%s" % orig_path)
+                    sys.exit(1)
+
+                full_path = os.path.realpath(os.path.join(new_rootfs, path))
+
+                # Disallow climbing outside of parent directory using '..',
+                # because doing so could be quite disastrous (we will delete the
+                # directory).
+                if not full_path.startswith(new_rootfs):
+                    logger.error("'%s' points to a path outside the rootfs" % orig_path)
+                    sys.exit(1)
+
+                if path.endswith(os.sep):
+                    # Delete content only.
+                    for entry in os.listdir(full_path):
+                        full_entry = os.path.join(full_path, entry)
+                        if os.path.isdir(full_entry) and not os.path.islink(full_entry):
+                            shutil.rmtree(full_entry)
+                        else:
+                            os.remove(full_entry)
+                else:
+                    # Delete whole directory.
+                    shutil.rmtree(full_path)
+
+        part.prepare_rootfs(cr_workdir, oe_builddir,
+                            new_rootfs or part.rootfs_dir, native_sysroot)
diff --git a/scripts/lib/wic/__init__.py b/scripts/lib/wic/__init__.py
deleted file mode 100644
index 85876b1..0000000
--- a/scripts/lib/wic/__init__.py
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2007 Red Hat, Inc.
-# Copyright (c) 2011 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-class WicError(Exception):
-    pass
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
deleted file mode 100644
index 850cec3..0000000
--- a/scripts/lib/wic/engine.py
+++ /dev/null
@@ -1,578 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-
-# This module implements the image creation engine used by 'wic' to
-# create images.  The engine parses through the OpenEmbedded kickstart
-# (wks) file specified and generates images that can then be directly
-# written onto media.
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-#
-
-import logging
-import os
-import tempfile
-import json
-import subprocess
-
-from collections import namedtuple, OrderedDict
-from distutils.spawn import find_executable
-
-from wic import WicError
-from wic.filemap import sparse_copy
-from wic.pluginbase import PluginMgr
-from wic.misc import get_bitbake_var, exec_cmd
-
-logger = logging.getLogger('wic')
-
-def verify_build_env():
-    """
-    Verify that the build environment is sane.
-
-    Returns True if it is, false otherwise
-    """
-    if not os.environ.get("BUILDDIR"):
-        raise WicError("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
-
-    return True
-
-
-CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
-SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
-WIC_DIR = "wic"
-
-def build_canned_image_list(path):
-    layers_path = get_bitbake_var("BBLAYERS")
-    canned_wks_layer_dirs = []
-
-    if layers_path is not None:
-        for layer_path in layers_path.split():
-            for wks_path in (WIC_DIR, SCRIPTS_CANNED_IMAGE_DIR):
-                cpath = os.path.join(layer_path, wks_path)
-                if os.path.isdir(cpath):
-                    canned_wks_layer_dirs.append(cpath)
-
-    cpath = os.path.join(path, CANNED_IMAGE_DIR)
-    canned_wks_layer_dirs.append(cpath)
-
-    return canned_wks_layer_dirs
-
-def find_canned_image(scripts_path, wks_file):
-    """
-    Find a .wks file with the given name in the canned files dir.
-
-    Return False if not found
-    """
-    layers_canned_wks_dir = build_canned_image_list(scripts_path)
-
-    for canned_wks_dir in layers_canned_wks_dir:
-        for root, dirs, files in os.walk(canned_wks_dir):
-            for fname in files:
-                if fname.endswith("~") or fname.endswith("#"):
-                    continue
-                if fname.endswith(".wks") and wks_file + ".wks" == fname:
-                    fullpath = os.path.join(canned_wks_dir, fname)
-                    return fullpath
-    return None
-
-
-def list_canned_images(scripts_path):
-    """
-    List the .wks files in the canned image dir, minus the extension.
-    """
-    layers_canned_wks_dir = build_canned_image_list(scripts_path)
-
-    for canned_wks_dir in layers_canned_wks_dir:
-        for root, dirs, files in os.walk(canned_wks_dir):
-            for fname in files:
-                if fname.endswith("~") or fname.endswith("#"):
-                    continue
-                if fname.endswith(".wks"):
-                    fullpath = os.path.join(canned_wks_dir, fname)
-                    with open(fullpath) as wks:
-                        for line in wks:
-                            desc = ""
-                            idx = line.find("short-description:")
-                            if idx != -1:
-                                desc = line[idx + len("short-description:"):].strip()
-                                break
-                    basename = os.path.splitext(fname)[0]
-                    print("  %s\t\t%s" % (basename.ljust(30), desc))
-
-
-def list_canned_image_help(scripts_path, fullpath):
-    """
-    List the help and params in the specified canned image.
-    """
-    found = False
-    with open(fullpath) as wks:
-        for line in wks:
-            if not found:
-                idx = line.find("long-description:")
-                if idx != -1:
-                    print()
-                    print(line[idx + len("long-description:"):].strip())
-                    found = True
-                continue
-            if not line.strip():
-                break
-            idx = line.find("#")
-            if idx != -1:
-                print(line[idx + len("#:"):].rstrip())
-            else:
-                break
-
-
-def list_source_plugins():
-    """
-    List the available source plugins i.e. plugins available for --source.
-    """
-    plugins = PluginMgr.get_plugins('source')
-
-    for plugin in plugins:
-        print("  %s" % plugin)
-
-
-def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-               native_sysroot, options):
-    """
-    Create image
-
-    wks_file - user-defined OE kickstart file
-    rootfs_dir - absolute path to the build's /rootfs dir
-    bootimg_dir - absolute path to the build's boot artifacts directory
-    kernel_dir - absolute path to the build's kernel directory
-    native_sysroot - absolute path to the build's native sysroots dir
-    image_output_dir - dirname to create for image
-    options - wic command line options (debug, bmap, etc)
-
-    Normally, the values for the build artifacts values are determined
-    by 'wic -e' from the output of the 'bitbake -e' command given an
-    image name e.g. 'core-image-minimal' and a given machine set in
-    local.conf.  If that's the case, the variables get the following
-    values from the output of 'bitbake -e':
-
-    rootfs_dir:        IMAGE_ROOTFS
-    kernel_dir:        DEPLOY_DIR_IMAGE
-    native_sysroot:    STAGING_DIR_NATIVE
-
-    In the above case, bootimg_dir remains unset and the
-    plugin-specific image creation code is responsible for finding the
-    bootimg artifacts.
-
-    In the case where the values are passed in explicitly i.e 'wic -e'
-    is not used but rather the individual 'wic' options are used to
-    explicitly specify these values.
-    """
-    try:
-        oe_builddir = os.environ["BUILDDIR"]
-    except KeyError:
-        raise WicError("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
-
-    if not os.path.exists(options.outdir):
-        os.makedirs(options.outdir)
-
-    pname = 'direct'
-    plugin_class = PluginMgr.get_plugins('imager').get(pname)
-    if not plugin_class:
-        raise WicError('Unknown plugin: %s' % pname)
-
-    plugin = plugin_class(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-                          native_sysroot, oe_builddir, options)
-
-    plugin.do_create()
-
-    logger.info("The image(s) were created using OE kickstart file:\n  %s", wks_file)
-
-
-def wic_list(args, scripts_path):
-    """
-    Print the list of images or source plugins.
-    """
-    if args.list_type is None:
-        return False
-
-    if args.list_type == "images":
-
-        list_canned_images(scripts_path)
-        return True
-    elif args.list_type == "source-plugins":
-        list_source_plugins()
-        return True
-    elif len(args.help_for) == 1 and args.help_for[0] == 'help':
-        wks_file = args.list_type
-        fullpath = find_canned_image(scripts_path, wks_file)
-        if not fullpath:
-            raise WicError("No image named %s found, exiting. "
-                           "(Use 'wic list images' to list available images, "
-                           "or specify a fully-qualified OE kickstart (.wks) "
-                           "filename)" % wks_file)
-
-        list_canned_image_help(scripts_path, fullpath)
-        return True
-
-    return False
-
-
-class Disk:
-    def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
-        self.imagepath = imagepath
-        self.native_sysroot = native_sysroot
-        self.fstypes = fstypes
-        self._partitions = None
-        self._partimages = {}
-        self._lsector_size = None
-        self._psector_size = None
-        self._ptable_format = None
-
-        # find parted
-        self.paths = "/bin:/usr/bin:/usr/sbin:/sbin/"
-        if native_sysroot:
-            for path in self.paths.split(':'):
-                self.paths = "%s%s:%s" % (native_sysroot, path, self.paths)
-
-        self.parted = find_executable("parted", self.paths)
-        if not self.parted:
-            raise WicError("Can't find executable parted")
-
-        self.partitions = self.get_partitions()
-
-    def __del__(self):
-        for path in self._partimages.values():
-            os.unlink(path)
-
-    def get_partitions(self):
-        if self._partitions is None:
-            self._partitions = OrderedDict()
-            out = exec_cmd("%s -sm %s unit B print" % (self.parted, self.imagepath))
-            parttype = namedtuple("Part", "pnum start end size fstype")
-            splitted = out.splitlines()
-            lsector_size, psector_size, self._ptable_format = splitted[1].split(":")[3:6]
-            self._lsector_size = int(lsector_size)
-            self._psector_size = int(psector_size)
-            for line in splitted[2:]:
-                pnum, start, end, size, fstype = line.split(':')[:5]
-                partition = parttype(int(pnum), int(start[:-1]), int(end[:-1]),
-                                     int(size[:-1]), fstype)
-                self._partitions[pnum] = partition
-
-        return self._partitions
-
-    def __getattr__(self, name):
-        """Get path to the executable in a lazy way."""
-        if name in ("mdir", "mcopy", "mdel", "mdeltree", "sfdisk", "e2fsck",
-                    "resize2fs", "mkswap", "mkdosfs", "debugfs"):
-            aname = "_%s" % name
-            if aname not in self.__dict__:
-                setattr(self, aname, find_executable(name, self.paths))
-                if aname not in self.__dict__ or self.__dict__[aname] is None:
-                    raise WicError("Can't find executable '{}'".format(name))
-            return self.__dict__[aname]
-        return self.__dict__[name]
-
-    def _get_part_image(self, pnum):
-        if pnum not in self.partitions:
-            raise WicError("Partition %s is not in the image")
-        part = self.partitions[pnum]
-        # check if fstype is supported
-        for fstype in self.fstypes:
-            if part.fstype.startswith(fstype):
-                break
-        else:
-            raise WicError("Not supported fstype: {}".format(part.fstype))
-        if pnum not in self._partimages:
-            tmpf = tempfile.NamedTemporaryFile(prefix="wic-part")
-            dst_fname = tmpf.name
-            tmpf.close()
-            sparse_copy(self.imagepath, dst_fname, skip=part.start, length=part.size)
-            self._partimages[pnum] = dst_fname
-
-        return self._partimages[pnum]
-
-    def _put_part_image(self, pnum):
-        """Put partition image into partitioned image."""
-        sparse_copy(self._partimages[pnum], self.imagepath,
-                    seek=self.partitions[pnum].start)
-
-    def dir(self, pnum, path):
-        if self.partitions[pnum].fstype.startswith('ext'):
-            return exec_cmd("{} {} -R 'ls -l {}'".format(self.debugfs,
-                                                         self._get_part_image(pnum),
-                                                         path), as_shell=True)
-        else: # fat
-            return exec_cmd("{} -i {} ::{}".format(self.mdir,
-                                                   self._get_part_image(pnum),
-                                                   path))
-
-    def copy(self, src, pnum, path):
-        """Copy partition image into wic image."""
-        if self.partitions[pnum].fstype.startswith('ext'):
-            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
-                      format(path, src, os.path.basename(src),
-                             self.debugfs, self._get_part_image(pnum))
-        else: # fat
-            cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
-                                                  self._get_part_image(pnum),
-                                                  src, path)
-        exec_cmd(cmd, as_shell=True)
-        self._put_part_image(pnum)
-
-    def remove(self, pnum, path):
-        """Remove files/dirs from the partition."""
-        partimg = self._get_part_image(pnum)
-        if self.partitions[pnum].fstype.startswith('ext'):
-            cmd = "{} {} -wR 'rm {}'".format(self.debugfs,
-                                                self._get_part_image(pnum),
-                                                path)
-            out = exec_cmd(cmd , as_shell=True)
-            for line in out.splitlines():
-                if line.startswith("rm:"):
-                    if "file is a directory" in line:
-                        # Try rmdir to see if this is an empty directory. This won't delete
-                        # any non empty directory so let user know about any error that this might
-                        # generate.
-                        print(exec_cmd("{} {} -wR 'rmdir {}'".format(self.debugfs,
-                                                    self._get_part_image(pnum),
-                                                    path), as_shell=True))
-                    else:
-                        raise WicError("Could not complete operation: wic %s" % str(line))
-        else: # fat
-            cmd = "{} -i {} ::{}".format(self.mdel, partimg, path)
-            try:
-                exec_cmd(cmd)
-            except WicError as err:
-                if "not found" in str(err) or "non empty" in str(err):
-                    # mdel outputs 'File ... not found' or 'directory .. non empty"
-                    # try to use mdeltree as path could be a directory
-                    cmd = "{} -i {} ::{}".format(self.mdeltree,
-                                                 partimg, path)
-                    exec_cmd(cmd)
-                else:
-                    raise err
-        self._put_part_image(pnum)
-
-    def write(self, target, expand):
-        """Write disk image to the media or file."""
-        def write_sfdisk_script(outf, parts):
-            for key, val in parts['partitiontable'].items():
-                if key in ("partitions", "device", "firstlba", "lastlba"):
-                    continue
-                if key == "id":
-                    key = "label-id"
-                outf.write("{}: {}\n".format(key, val))
-            outf.write("\n")
-            for part in parts['partitiontable']['partitions']:
-                line = ''
-                for name in ('attrs', 'name', 'size', 'type', 'uuid'):
-                    if name == 'size' and part['type'] == 'f':
-                        # don't write size for extended partition
-                        continue
-                    val = part.get(name)
-                    if val:
-                        line += '{}={}, '.format(name, val)
-                if line:
-                    line = line[:-2] # strip ', '
-                if part.get('bootable'):
-                    line += ' ,bootable'
-                outf.write("{}\n".format(line))
-            outf.flush()
-
-        def read_ptable(path):
-            out = exec_cmd("{} -dJ {}".format(self.sfdisk, path))
-            return json.loads(out)
-
-        def write_ptable(parts, target):
-            with tempfile.NamedTemporaryFile(prefix="wic-sfdisk-", mode='w') as outf:
-                write_sfdisk_script(outf, parts)
-                cmd = "{} --no-reread {} < {} ".format(self.sfdisk, target, outf.name)
-                exec_cmd(cmd, as_shell=True)
-
-        if expand is None:
-            sparse_copy(self.imagepath, target)
-        else:
-            # copy first sectors that may contain bootloader
-            sparse_copy(self.imagepath, target, length=2048 * self._lsector_size)
-
-            # copy source partition table to the target
-            parts = read_ptable(self.imagepath)
-            write_ptable(parts, target)
-
-            # get size of unpartitioned space
-            free = None
-            for line in exec_cmd("{} -F {}".format(self.sfdisk, target)).splitlines():
-                if line.startswith("Unpartitioned space ") and line.endswith("sectors"):
-                    free = int(line.split()[-2])
-                    # Align free space to a 2048 sector boundary. YOCTO #12840.
-                    free = free - (free % 2048)
-            if free is None:
-                raise WicError("Can't get size of unpartitioned space")
-
-            # calculate expanded partitions sizes
-            sizes = {}
-            num_auto_resize = 0
-            for num, part in enumerate(parts['partitiontable']['partitions'], 1):
-                if num in expand:
-                    if expand[num] != 0: # don't resize partition if size is set to 0
-                        sectors = expand[num] // self._lsector_size
-                        free -= sectors - part['size']
-                        part['size'] = sectors
-                        sizes[num] = sectors
-                elif part['type'] != 'f':
-                    sizes[num] = -1
-                    num_auto_resize += 1
-
-            for num, part in enumerate(parts['partitiontable']['partitions'], 1):
-                if sizes.get(num) == -1:
-                    part['size'] += free // num_auto_resize
-
-            # write resized partition table to the target
-            write_ptable(parts, target)
-
-            # read resized partition table
-            parts = read_ptable(target)
-
-            # copy partitions content
-            for num, part in enumerate(parts['partitiontable']['partitions'], 1):
-                pnum = str(num)
-                fstype = self.partitions[pnum].fstype
-
-                # copy unchanged partition
-                if part['size'] == self.partitions[pnum].size // self._lsector_size:
-                    logger.info("copying unchanged partition {}".format(pnum))
-                    sparse_copy(self._get_part_image(pnum), target, seek=part['start'] * self._lsector_size)
-                    continue
-
-                # resize or re-create partitions
-                if fstype.startswith('ext') or fstype.startswith('fat') or \
-                   fstype.startswith('linux-swap'):
-
-                    partfname = None
-                    with tempfile.NamedTemporaryFile(prefix="wic-part{}-".format(pnum)) as partf:
-                        partfname = partf.name
-
-                    if fstype.startswith('ext'):
-                        logger.info("resizing ext partition {}".format(pnum))
-                        partimg = self._get_part_image(pnum)
-                        sparse_copy(partimg, partfname)
-                        exec_cmd("{} -pf {}".format(self.e2fsck, partfname))
-                        exec_cmd("{} {} {}s".format(\
-                                 self.resize2fs, partfname, part['size']))
-                    elif fstype.startswith('fat'):
-                        logger.info("copying content of the fat partition {}".format(pnum))
-                        with tempfile.TemporaryDirectory(prefix='wic-fatdir-') as tmpdir:
-                            # copy content to the temporary directory
-                            cmd = "{} -snompi {} :: {}".format(self.mcopy,
-                                                               self._get_part_image(pnum),
-                                                               tmpdir)
-                            exec_cmd(cmd)
-                            # create new msdos partition
-                            label = part.get("name")
-                            label_str = "-n {}".format(label) if label else ''
-
-                            cmd = "{} {} -C {} {}".format(self.mkdosfs, label_str, partfname,
-                                                          part['size'])
-                            exec_cmd(cmd)
-                            # copy content from the temporary directory to the new partition
-                            cmd = "{} -snompi {} {}/* ::".format(self.mcopy, partfname, tmpdir)
-                            exec_cmd(cmd, as_shell=True)
-                    elif fstype.startswith('linux-swap'):
-                        logger.info("creating swap partition {}".format(pnum))
-                        label = part.get("name")
-                        label_str = "-L {}".format(label) if label else ''
-                        uuid = part.get("uuid")
-                        uuid_str = "-U {}".format(uuid) if uuid else ''
-                        with open(partfname, 'w') as sparse:
-                            os.ftruncate(sparse.fileno(), part['size'] * self._lsector_size)
-                        exec_cmd("{} {} {} {}".format(self.mkswap, label_str, uuid_str, partfname))
-                    sparse_copy(partfname, target, seek=part['start'] * self._lsector_size)
-                    os.unlink(partfname)
-                elif part['type'] != 'f':
-                    logger.warning("skipping partition {}: unsupported fstype {}".format(pnum, fstype))
-
-def wic_ls(args, native_sysroot):
-    """List contents of partitioned image or vfat partition."""
-    disk = Disk(args.path.image, native_sysroot)
-    if not args.path.part:
-        if disk.partitions:
-            print('Num     Start        End          Size      Fstype')
-            for part in disk.partitions.values():
-                print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
-                          part.pnum, part.start, part.end,
-                          part.size, part.fstype))
-    else:
-        path = args.path.path or '/'
-        print(disk.dir(args.path.part, path))
-
-def wic_cp(args, native_sysroot):
-    """
-    Copy local file or directory to the vfat partition of
-    partitioned image.
-    """
-    disk = Disk(args.dest.image, native_sysroot)
-    disk.copy(args.src, args.dest.part, args.dest.path)
-
-def wic_rm(args, native_sysroot):
-    """
-    Remove files or directories from the vfat partition of
-    partitioned image.
-    """
-    disk = Disk(args.path.image, native_sysroot)
-    disk.remove(args.path.part, args.path.path)
-
-def wic_write(args, native_sysroot):
-    """
-    Write image to a target device.
-    """
-    disk = Disk(args.image, native_sysroot, ('fat', 'ext', 'swap'))
-    disk.write(args.target, args.expand)
-
-def find_canned(scripts_path, file_name):
-    """
-    Find a file either by its path or by name in the canned files dir.
-
-    Return None if not found
-    """
-    if os.path.exists(file_name):
-        return file_name
-
-    layers_canned_wks_dir = build_canned_image_list(scripts_path)
-    for canned_wks_dir in layers_canned_wks_dir:
-        for root, dirs, files in os.walk(canned_wks_dir):
-            for fname in files:
-                if fname == file_name:
-                    fullpath = os.path.join(canned_wks_dir, fname)
-                    return fullpath
-
-def get_custom_config(boot_file):
-    """
-    Get the custom configuration to be used for the bootloader.
-
-    Return None if the file can't be found.
-    """
-    # Get the scripts path of poky
-    scripts_path = os.path.abspath("%s/../.." % os.path.dirname(__file__))
-
-    cfg_file = find_canned(scripts_path, boot_file)
-    if cfg_file:
-        with open(cfg_file, "r") as f:
-            config = f.read()
-        return config
diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
deleted file mode 100644
index a72fa09..0000000
--- a/scripts/lib/wic/filemap.py
+++ /dev/null
@@ -1,600 +0,0 @@
-# Copyright (c) 2012 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License, version 2,
-# as published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-
-"""
-This module implements python implements a way to get file block. Two methods
-are supported - the FIEMAP ioctl and the 'SEEK_HOLE / SEEK_DATA' features of
-the file seek syscall. The former is implemented by the 'FilemapFiemap' class,
-the latter is implemented by the 'FilemapSeek' class. Both classes provide the
-same API. The 'filemap' function automatically selects which class can be used
-and returns an instance of the class.
-"""
-
-# Disable the following pylint recommendations:
-#   * Too many instance attributes (R0902)
-# pylint: disable=R0902
-
-import os
-import struct
-import array
-import fcntl
-import tempfile
-import logging
-
-def get_block_size(file_obj):
-    """
-    Returns block size for file object 'file_obj'. Errors are indicated by the
-    'IOError' exception.
-    """
-    # Get the block size of the host file-system for the image file by calling
-    # the FIGETBSZ ioctl (number 2).
-    binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
-    bsize = struct.unpack('I', binary_data)[0]
-    if not bsize:
-        import os
-        stat = os.fstat(file_obj.fileno())
-        if hasattr(stat, 'st_blksize'):
-            bsize = stat.st_blksize
-        else:
-            raise IOError("Unable to determine block size")
-    return bsize
-
-class ErrorNotSupp(Exception):
-    """
-    An exception of this type is raised when the 'FIEMAP' or 'SEEK_HOLE' feature
-    is not supported either by the kernel or the file-system.
-    """
-    pass
-
-class Error(Exception):
-    """A class for all the other exceptions raised by this module."""
-    pass
-
-
-class _FilemapBase(object):
-    """
-    This is a base class for a couple of other classes in this module. This
-    class simply performs the common parts of the initialization process: opens
-    the image file, gets its size, etc. The 'log' parameter is the logger object
-    to use for printing messages.
-    """
-
-    def __init__(self, image, log=None):
-        """
-        Initialize a class instance. The 'image' argument is full path to the
-        file or file object to operate on.
-        """
-
-        self._log = log
-        if self._log is None:
-            self._log = logging.getLogger(__name__)
-
-        self._f_image_needs_close = False
-
-        if hasattr(image, "fileno"):
-            self._f_image = image
-            self._image_path = image.name
-        else:
-            self._image_path = image
-            self._open_image_file()
-
-        try:
-            self.image_size = os.fstat(self._f_image.fileno()).st_size
-        except IOError as err:
-            raise Error("cannot get information about file '%s': %s"
-                        % (self._f_image.name, err))
-
-        try:
-            self.block_size = get_block_size(self._f_image)
-        except IOError as err:
-            raise Error("cannot get block size for '%s': %s"
-                        % (self._image_path, err))
-
-        self.blocks_cnt = self.image_size + self.block_size - 1
-        self.blocks_cnt //= self.block_size
-
-        try:
-            self._f_image.flush()
-        except IOError as err:
-            raise Error("cannot flush image file '%s': %s"
-                        % (self._image_path, err))
-
-        try:
-            os.fsync(self._f_image.fileno()),
-        except OSError as err:
-            raise Error("cannot synchronize image file '%s': %s "
-                        % (self._image_path, err.strerror))
-
-        self._log.debug("opened image \"%s\"" % self._image_path)
-        self._log.debug("block size %d, blocks count %d, image size %d"
-                        % (self.block_size, self.blocks_cnt, self.image_size))
-
-    def __del__(self):
-        """The class destructor which just closes the image file."""
-        if self._f_image_needs_close:
-            self._f_image.close()
-
-    def _open_image_file(self):
-        """Open the image file."""
-        try:
-            self._f_image = open(self._image_path, 'rb')
-        except IOError as err:
-            raise Error("cannot open image file '%s': %s"
-                        % (self._image_path, err))
-
-        self._f_image_needs_close = True
-
-    def block_is_mapped(self, block): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. It returns
-        'True' if block number 'block' of the image file is mapped and 'False'
-        otherwise.
-        """
-
-        raise Error("the method is not implemented")
-
-    def block_is_unmapped(self, block): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. It returns
-        'True' if block number 'block' of the image file is not mapped (hole)
-        and 'False' otherwise.
-        """
-
-        raise Error("the method is not implemented")
-
-    def get_mapped_ranges(self, start, count): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. This is a
-        generator which yields ranges of mapped blocks in the file. The ranges
-        are tuples of 2 elements: [first, last], where 'first' is the first
-        mapped block and 'last' is the last mapped block.
-
-        The ranges are yielded for the area of the file of size 'count' blocks,
-        starting from block 'start'.
-        """
-
-        raise Error("the method is not implemented")
-
-    def get_unmapped_ranges(self, start, count): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. Just like
-        'get_mapped_ranges()', but yields unmapped block ranges instead
-        (holes).
-        """
-
-        raise Error("the method is not implemented")
-
-
-# The 'SEEK_HOLE' and 'SEEK_DATA' options of the file seek system call
-_SEEK_DATA = 3
-_SEEK_HOLE = 4
-
-def _lseek(file_obj, offset, whence):
-    """This is a helper function which invokes 'os.lseek' for file object
-    'file_obj' and with specified 'offset' and 'whence'. The 'whence'
-    argument is supposed to be either '_SEEK_DATA' or '_SEEK_HOLE'. When
-    there is no more data or hole starting from 'offset', this function
-    returns '-1'.  Otherwise the data or hole position is returned."""
-
-    try:
-        return os.lseek(file_obj.fileno(), offset, whence)
-    except OSError as err:
-        # The 'lseek' system call returns the ENXIO if there is no data or
-        # hole starting from the specified offset.
-        if err.errno == os.errno.ENXIO:
-            return -1
-        elif err.errno == os.errno.EINVAL:
-            raise ErrorNotSupp("the kernel or file-system does not support "
-                               "\"SEEK_HOLE\" and \"SEEK_DATA\"")
-        else:
-            raise
-
-class FilemapSeek(_FilemapBase):
-    """
-    This class uses the 'SEEK_HOLE' and 'SEEK_DATA' to find file block mapping.
-    Unfortunately, the current implementation requires the caller to have write
-    access to the image file.
-    """
-
-    def __init__(self, image, log=None):
-        """Refer the '_FilemapBase' class for the documentation."""
-
-        # Call the base class constructor first
-        _FilemapBase.__init__(self, image, log)
-        self._log.debug("FilemapSeek: initializing")
-
-        self._probe_seek_hole()
-
-    def _probe_seek_hole(self):
-        """
-        Check whether the system implements 'SEEK_HOLE' and 'SEEK_DATA'.
-        Unfortunately, there seems to be no clean way for detecting this,
-        because often the system just fakes them by just assuming that all
-        files are fully mapped, so 'SEEK_HOLE' always returns EOF and
-        'SEEK_DATA' always returns the requested offset.
-
-        I could not invent a better way of detecting the fake 'SEEK_HOLE'
-        implementation than just to create a temporary file in the same
-        directory where the image file resides. It would be nice to change this
-        to something better.
-        """
-
-        directory = os.path.dirname(self._image_path)
-
-        try:
-            tmp_obj = tempfile.TemporaryFile("w+", dir=directory)
-        except IOError as err:
-            raise ErrorNotSupp("cannot create a temporary in \"%s\": %s" \
-                              % (directory, err))
-
-        try:
-            os.ftruncate(tmp_obj.fileno(), self.block_size)
-        except OSError as err:
-            raise ErrorNotSupp("cannot truncate temporary file in \"%s\": %s"
-                               % (directory, err))
-
-        offs = _lseek(tmp_obj, 0, _SEEK_HOLE)
-        if offs != 0:
-            # We are dealing with the stub 'SEEK_HOLE' implementation which
-            # always returns EOF.
-            self._log.debug("lseek(0, SEEK_HOLE) returned %d" % offs)
-            raise ErrorNotSupp("the file-system does not support "
-                               "\"SEEK_HOLE\" and \"SEEK_DATA\" but only "
-                               "provides a stub implementation")
-
-        tmp_obj.close()
-
-    def block_is_mapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        offs = _lseek(self._f_image, block * self.block_size, _SEEK_DATA)
-        if offs == -1:
-            result = False
-        else:
-            result = (offs // self.block_size == block)
-
-        self._log.debug("FilemapSeek: block_is_mapped(%d) returns %s"
-                        % (block, result))
-        return result
-
-    def block_is_unmapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        return not self.block_is_mapped(block)
-
-    def _get_ranges(self, start, count, whence1, whence2):
-        """
-        This function implements 'get_mapped_ranges()' and
-        'get_unmapped_ranges()' depending on what is passed in the 'whence1'
-        and 'whence2' arguments.
-        """
-
-        assert whence1 != whence2
-        end = start * self.block_size
-        limit = end + count * self.block_size
-
-        while True:
-            start = _lseek(self._f_image, end, whence1)
-            if start == -1 or start >= limit or start == self.image_size:
-                break
-
-            end = _lseek(self._f_image, start, whence2)
-            if end == -1 or end == self.image_size:
-                end = self.blocks_cnt * self.block_size
-            if end > limit:
-                end = limit
-
-            start_blk = start // self.block_size
-            end_blk = end // self.block_size - 1
-            self._log.debug("FilemapSeek: yielding range (%d, %d)"
-                            % (start_blk, end_blk))
-            yield (start_blk, end_blk)
-
-    def get_mapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapSeek: get_mapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        return self._get_ranges(start, count, _SEEK_DATA, _SEEK_HOLE)
-
-    def get_unmapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapSeek: get_unmapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        return self._get_ranges(start, count, _SEEK_HOLE, _SEEK_DATA)
-
-
-# Below goes the FIEMAP ioctl implementation, which is not very readable
-# because it deals with the rather complex FIEMAP ioctl. To understand the
-# code, you need to know the FIEMAP interface, which is documented in the
-# "Documentation/filesystems/fiemap.txt" file in the Linux kernel sources.
-
-# Format string for 'struct fiemap'
-_FIEMAP_FORMAT = "=QQLLLL"
-# sizeof(struct fiemap)
-_FIEMAP_SIZE = struct.calcsize(_FIEMAP_FORMAT)
-# Format string for 'struct fiemap_extent'
-_FIEMAP_EXTENT_FORMAT = "=QQQQQLLLL"
-# sizeof(struct fiemap_extent)
-_FIEMAP_EXTENT_SIZE = struct.calcsize(_FIEMAP_EXTENT_FORMAT)
-# The FIEMAP ioctl number
-_FIEMAP_IOCTL = 0xC020660B
-# This FIEMAP ioctl flag which instructs the kernel to sync the file before
-# reading the block map
-_FIEMAP_FLAG_SYNC = 0x00000001
-# Size of the buffer for 'struct fiemap_extent' elements which will be used
-# when invoking the FIEMAP ioctl. The larger is the buffer, the less times the
-# FIEMAP ioctl will be invoked.
-_FIEMAP_BUFFER_SIZE = 256 * 1024
-
-class FilemapFiemap(_FilemapBase):
-    """
-    This class provides API to the FIEMAP ioctl. Namely, it allows to iterate
-    over all mapped blocks and over all holes.
-
-    This class synchronizes the image file every time it invokes the FIEMAP
-    ioctl in order to work-around early FIEMAP implementation kernel bugs.
-    """
-
-    def __init__(self, image, log=None):
-        """
-        Initialize a class instance. The 'image' argument is full the file
-        object to operate on.
-        """
-
-        # Call the base class constructor first
-        _FilemapBase.__init__(self, image, log)
-        self._log.debug("FilemapFiemap: initializing")
-
-        self._buf_size = _FIEMAP_BUFFER_SIZE
-
-        # Calculate how many 'struct fiemap_extent' elements fit the buffer
-        self._buf_size -= _FIEMAP_SIZE
-        self._fiemap_extent_cnt = self._buf_size // _FIEMAP_EXTENT_SIZE
-        assert self._fiemap_extent_cnt > 0
-        self._buf_size = self._fiemap_extent_cnt * _FIEMAP_EXTENT_SIZE
-        self._buf_size += _FIEMAP_SIZE
-
-        # Allocate a mutable buffer for the FIEMAP ioctl
-        self._buf = array.array('B', [0] * self._buf_size)
-
-        # Check if the FIEMAP ioctl is supported
-        self.block_is_mapped(0)
-
-    def _invoke_fiemap(self, block, count):
-        """
-        Invoke the FIEMAP ioctl for 'count' blocks of the file starting from
-        block number 'block'.
-
-        The full result of the operation is stored in 'self._buf' on exit.
-        Returns the unpacked 'struct fiemap' data structure in form of a python
-        list (just like 'struct.upack()').
-        """
-
-        if self.blocks_cnt != 0 and (block < 0 or block >= self.blocks_cnt):
-            raise Error("bad block number %d, should be within [0, %d]"
-                        % (block, self.blocks_cnt))
-
-        # Initialize the 'struct fiemap' part of the buffer. We use the
-        # '_FIEMAP_FLAG_SYNC' flag in order to make sure the file is
-        # synchronized. The reason for this is that early FIEMAP
-        # implementations had many bugs related to cached dirty data, and
-        # synchronizing the file is a necessary work-around.
-        struct.pack_into(_FIEMAP_FORMAT, self._buf, 0, block * self.block_size,
-                         count * self.block_size, _FIEMAP_FLAG_SYNC, 0,
-                         self._fiemap_extent_cnt, 0)
-
-        try:
-            fcntl.ioctl(self._f_image, _FIEMAP_IOCTL, self._buf, 1)
-        except IOError as err:
-            # Note, the FIEMAP ioctl is supported by the Linux kernel starting
-            # from version 2.6.28 (year 2008).
-            if err.errno == os.errno.EOPNOTSUPP:
-                errstr = "FilemapFiemap: the FIEMAP ioctl is not supported " \
-                         "by the file-system"
-                self._log.debug(errstr)
-                raise ErrorNotSupp(errstr)
-            if err.errno == os.errno.ENOTTY:
-                errstr = "FilemapFiemap: the FIEMAP ioctl is not supported " \
-                         "by the kernel"
-                self._log.debug(errstr)
-                raise ErrorNotSupp(errstr)
-            raise Error("the FIEMAP ioctl failed for '%s': %s"
-                        % (self._image_path, err))
-
-        return struct.unpack(_FIEMAP_FORMAT, self._buf[:_FIEMAP_SIZE])
-
-    def block_is_mapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        struct_fiemap = self._invoke_fiemap(block, 1)
-
-        # The 3rd element of 'struct_fiemap' is the 'fm_mapped_extents' field.
-        # If it contains zero, the block is not mapped, otherwise it is
-        # mapped.
-        result = bool(struct_fiemap[3])
-        self._log.debug("FilemapFiemap: block_is_mapped(%d) returns %s"
-                        % (block, result))
-        return result
-
-    def block_is_unmapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        return not self.block_is_mapped(block)
-
-    def _unpack_fiemap_extent(self, index):
-        """
-        Unpack a 'struct fiemap_extent' structure object number 'index' from
-        the internal 'self._buf' buffer.
-        """
-
-        offset = _FIEMAP_SIZE + _FIEMAP_EXTENT_SIZE * index
-        return struct.unpack(_FIEMAP_EXTENT_FORMAT,
-                             self._buf[offset : offset + _FIEMAP_EXTENT_SIZE])
-
-    def _do_get_mapped_ranges(self, start, count):
-        """
-        Implements most the functionality for the  'get_mapped_ranges()'
-        generator: invokes the FIEMAP ioctl, walks through the mapped extents
-        and yields mapped block ranges. However, the ranges may be consecutive
-        (e.g., (1, 100), (100, 200)) and 'get_mapped_ranges()' simply merges
-        them.
-        """
-
-        block = start
-        while block < start + count:
-            struct_fiemap = self._invoke_fiemap(block, count)
-
-            mapped_extents = struct_fiemap[3]
-            if mapped_extents == 0:
-                # No more mapped blocks
-                return
-
-            extent = 0
-            while extent < mapped_extents:
-                fiemap_extent = self._unpack_fiemap_extent(extent)
-
-                # Start of the extent
-                extent_start = fiemap_extent[0]
-                # Starting block number of the extent
-                extent_block = extent_start // self.block_size
-                # Length of the extent
-                extent_len = fiemap_extent[2]
-                # Count of blocks in the extent
-                extent_count = extent_len // self.block_size
-
-                # Extent length and offset have to be block-aligned
-                assert extent_start % self.block_size == 0
-                assert extent_len % self.block_size == 0
-
-                if extent_block > start + count - 1:
-                    return
-
-                first = max(extent_block, block)
-                last = min(extent_block + extent_count, start + count) - 1
-                yield (first, last)
-
-                extent += 1
-
-            block = extent_block + extent_count
-
-    def get_mapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapFiemap: get_mapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        iterator = self._do_get_mapped_ranges(start, count)
-        first_prev, last_prev = next(iterator)
-
-        for first, last in iterator:
-            if last_prev == first - 1:
-                last_prev = last
-            else:
-                self._log.debug("FilemapFiemap: yielding range (%d, %d)"
-                                % (first_prev, last_prev))
-                yield (first_prev, last_prev)
-                first_prev, last_prev = first, last
-
-        self._log.debug("FilemapFiemap: yielding range (%d, %d)"
-                        % (first_prev, last_prev))
-        yield (first_prev, last_prev)
-
-    def get_unmapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapFiemap: get_unmapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        hole_first = start
-        for first, last in self._do_get_mapped_ranges(start, count):
-            if first > hole_first:
-                self._log.debug("FilemapFiemap: yielding range (%d, %d)"
-                                % (hole_first, first - 1))
-                yield (hole_first, first - 1)
-
-            hole_first = last + 1
-
-        if hole_first < start + count:
-            self._log.debug("FilemapFiemap: yielding range (%d, %d)"
-                            % (hole_first, start + count - 1))
-            yield (hole_first, start + count - 1)
-
-def filemap(image, log=None):
-    """
-    Create and return an instance of a Filemap class - 'FilemapFiemap' or
-    'FilemapSeek', depending on what the system we run on supports. If the
-    FIEMAP ioctl is supported, an instance of the 'FilemapFiemap' class is
-    returned. Otherwise, if 'SEEK_HOLE' is supported an instance of the
-    'FilemapSeek' class is returned. If none of these are supported, the
-    function generates an 'Error' type exception.
-    """
-
-    try:
-        return FilemapFiemap(image, log)
-    except ErrorNotSupp:
-        return FilemapSeek(image, log)
-
-def sparse_copy(src_fname, dst_fname, skip=0, seek=0,
-                length=0, api=None):
-    """
-    Efficiently copy sparse file to or into another file.
-
-    src_fname: path to source file
-    dst_fname: path to destination file
-    skip: skip N bytes at thestart of src
-    seek: seek N bytes from the start of dst
-    length: read N bytes from src and write them to dst
-    api: FilemapFiemap or FilemapSeek object
-    """
-    if not api:
-        api = filemap
-    fmap = api(src_fname)
-    try:
-        dst_file = open(dst_fname, 'r+b')
-    except IOError:
-        dst_file = open(dst_fname, 'wb')
-        if length:
-            dst_size = length + seek
-        else:
-            dst_size = os.path.getsize(src_fname) + seek - skip
-        dst_file.truncate(dst_size)
-
-    written = 0
-    for first, last in fmap.get_mapped_ranges(0, fmap.blocks_cnt):
-        start = first * fmap.block_size
-        end = (last + 1) * fmap.block_size
-
-        if skip >= end:
-            continue
-
-        if start < skip < end:
-            start = skip
-
-        fmap._f_image.seek(start, os.SEEK_SET)
-
-        written += start - skip - written
-        if length and written >= length:
-            dst_file.seek(seek + length, os.SEEK_SET)
-            dst_file.close()
-            return
-
-        dst_file.seek(seek + start - skip, os.SEEK_SET)
-
-        chunk_size = 1024 * 1024
-        to_read = end - start
-        read = 0
-
-        while read < to_read:
-            if read + chunk_size > to_read:
-                chunk_size = to_read - read
-            size = chunk_size
-            if length and written + size > length:
-                size = length - written
-            chunk = fmap._f_image.read(size)
-            dst_file.write(chunk)
-            read += size
-            written += size
-            if written == length:
-                dst_file.close()
-                return
-    dst_file.close()
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
deleted file mode 100644
index 842b868..0000000
--- a/scripts/lib/wic/help.py
+++ /dev/null
@@ -1,1055 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-# This module implements some basic help invocation functions along
-# with the bulk of the help topic text for the OE Core Image Tools.
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-#
-
-import subprocess
-import logging
-
-from wic.pluginbase import PluginMgr, PLUGIN_TYPES
-
-logger = logging.getLogger('wic')
-
-def subcommand_error(args):
-    logger.info("invalid subcommand %s", args[0])
-
-
-def display_help(subcommand, subcommands):
-    """
-    Display help for subcommand.
-    """
-    if subcommand not in subcommands:
-        return False
-
-    hlp = subcommands.get(subcommand, subcommand_error)[2]
-    if callable(hlp):
-        hlp = hlp()
-    pager = subprocess.Popen('less', stdin=subprocess.PIPE)
-    pager.communicate(hlp.encode('utf-8'))
-
-    return True
-
-
-def wic_help(args, usage_str, subcommands):
-    """
-    Subcommand help dispatcher.
-    """
-    if args.help_topic == None or not display_help(args.help_topic, subcommands):
-        print(usage_str)
-
-
-def get_wic_plugins_help():
-    """
-    Combine wic_plugins_help with the help for every known
-    source plugin.
-    """
-    result = wic_plugins_help
-    for plugin_type in PLUGIN_TYPES:
-        result += '\n\n%s PLUGINS\n\n' % plugin_type.upper()
-        for name, plugin in PluginMgr.get_plugins(plugin_type).items():
-            result += "\n %s plugin:\n" % name
-            if plugin.__doc__:
-                result += plugin.__doc__
-            else:
-                result += "\n    %s is missing docstring\n" % plugin
-    return result
-
-
-def invoke_subcommand(args, parser, main_command_usage, subcommands):
-    """
-    Dispatch to subcommand handler borrowed from combo-layer.
-    Should use argparse, but has to work in 2.6.
-    """
-    if not args.command:
-        logger.error("No subcommand specified, exiting")
-        parser.print_help()
-        return 1
-    elif args.command == "help":
-        wic_help(args, main_command_usage, subcommands)
-    elif args.command not in subcommands:
-        logger.error("Unsupported subcommand %s, exiting\n", args.command)
-        parser.print_help()
-        return 1
-    else:
-        subcmd = subcommands.get(args.command, subcommand_error)
-        usage = subcmd[1]
-        subcmd[0](args, usage)
-
-
-##
-# wic help and usage strings
-##
-
-wic_usage = """
-
- Create a customized OpenEmbedded image
-
- usage: wic [--version] | [--help] | [COMMAND [ARGS]]
-
- Current 'wic' commands are:
-    help              Show help for command or one of the topics (see below)
-    create            Create a new OpenEmbedded image
-    list              List available canned images and source plugins
-
- Help topics:
-    overview          wic overview - General overview of wic
-    plugins           wic plugins - Overview and API
-    kickstart         wic kickstart - wic kickstart reference
-"""
-
-wic_help_usage = """
-
- usage: wic help <subcommand>
-
- This command displays detailed help for the specified subcommand.
-"""
-
-wic_create_usage = """
-
- Create a new OpenEmbedded image
-
- usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
-            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
-            [-r, --rootfs-dir] [-b, --bootimg-dir]
-            [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
-            [-c, --compress-with] [-m, --bmap]
-
- This command creates an OpenEmbedded image based on the 'OE kickstart
- commands' found in the <wks file>.
-
- The -o option can be used to place the image in a directory with a
- different name and location.
-
- See 'wic help create' for more detailed instructions.
-"""
-
-wic_create_help = """
-
-NAME
-    wic create - Create a new OpenEmbedded image
-
-SYNOPSIS
-    wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
-        [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
-        [-r, --rootfs-dir] [-b, --bootimg-dir]
-        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
-        [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
-
-DESCRIPTION
-    This command creates an OpenEmbedded image based on the 'OE
-    kickstart commands' found in the <wks file>.
-
-    In order to do this, wic needs to know the locations of the
-    various build artifacts required to build the image.
-
-    Users can explicitly specify the build artifact locations using
-    the -r, -b, -k, and -n options.  See below for details on where
-    the corresponding artifacts are typically found in a normal
-    OpenEmbedded build.
-
-    Alternatively, users can use the -e option to have 'wic' determine
-    those locations for a given image.  If the -e option is used, the
-    user needs to have set the appropriate MACHINE variable in
-    local.conf, and have sourced the build environment.
-
-    The -e option is used to specify the name of the image to use the
-    artifacts from e.g. core-image-sato.
-
-    The -r option is used to specify the path to the /rootfs dir to
-    use as the .wks rootfs source.
-
-    The -b option is used to specify the path to the dir containing
-    the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the
-    .wks bootimg source.
-
-    The -k option is used to specify the path to the dir containing
-    the kernel to use in the .wks bootimg.
-
-    The -n option is used to specify the path to the native sysroot
-    containing the tools to use to build the image.
-
-    The -f option is used to build rootfs by running "bitbake <image>"
-
-    The -s option is used to skip the build check.  The build check is
-    a simple sanity check used to determine whether the user has
-    sourced the build environment so that the -e option can operate
-    correctly.  If the user has specified the build artifact locations
-    explicitly, 'wic' assumes the user knows what he or she is doing
-    and skips the build check.
-
-    The -D option is used to display debug information detailing
-    exactly what happens behind the scenes when a create request is
-    fulfilled (or not, as the case may be).  It enumerates and
-    displays the command sequence used, and should be included in any
-    bug report describing unexpected results.
-
-    When 'wic -e' is used, the locations for the build artifacts
-    values are determined by 'wic -e' from the output of the 'bitbake
-    -e' command given an image name e.g. 'core-image-minimal' and a
-    given machine set in local.conf.  In that case, the image is
-    created as if the following 'bitbake -e' variables were used:
-
-    -r:        IMAGE_ROOTFS
-    -k:        STAGING_KERNEL_DIR
-    -n:        STAGING_DIR_NATIVE
-    -b:        empty (plugin-specific handlers must determine this)
-
-    If 'wic -e' is not used, the user needs to select the appropriate
-    value for -b (as well as -r, -k, and -n).
-
-    The -o option can be used to place the image in a directory with a
-    different name and location.
-
-    The -c option is used to specify compressor utility to compress
-    an image. gzip, bzip2 and xz compressors are supported.
-
-    The -m option is used to produce .bmap file for the image. This file
-    can be used to flash image using bmaptool utility.
-
-    The --no-fstab-update option is used to doesn't change fstab file. When
-    using this option the final fstab file will be same that in rootfs and
-    wic doesn't update file, e.g adding a new mount point. User can control
-    the fstab file content in base-files recipe.
-"""
-
-wic_list_usage = """
-
- List available OpenEmbedded images and source plugins
-
- usage: wic list images
-        wic list <image> help
-        wic list source-plugins
-
- This command enumerates the set of available canned images as well as
- help for those images.  It also can be used to list of available source
- plugins.
-
- The first form enumerates all the available 'canned' images.
-
- The second form lists the detailed help information for a specific
- 'canned' image.
-
- The third form enumerates all the available --sources (source
- plugins).
-
- See 'wic help list' for more details.
-"""
-
-wic_list_help = """
-
-NAME
-    wic list - List available OpenEmbedded images and source plugins
-
-SYNOPSIS
-    wic list images
-    wic list <image> help
-    wic list source-plugins
-
-DESCRIPTION
-    This command enumerates the set of available canned images as well
-    as help for those images.  It also can be used to list available
-    source plugins.
-
-    The first form enumerates all the available 'canned' images.
-    These are actually just the set of .wks files that have been moved
-    into the /scripts/lib/wic/canned-wks directory).
-
-    The second form lists the detailed help information for a specific
-    'canned' image.
-
-    The third form enumerates all the available --sources (source
-    plugins).  The contents of a given partition are driven by code
-    defined in 'source plugins'.  Users specify a specific plugin via
-    the --source parameter of the partition .wks command.  Normally
-    this is the 'rootfs' plugin but can be any of the more specialized
-    sources listed by the 'list source-plugins' command.  Users can
-    also add their own source plugins - see 'wic help plugins' for
-    details.
-"""
-
-wic_ls_usage = """
-
- List content of a partitioned image
-
- usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>]
-
- This command  outputs either list of image partitions or directory contents
- of vfat and ext* partitions.
-
- See 'wic help ls' for more detailed instructions.
-
-"""
-
-wic_ls_help = """
-
-NAME
-    wic ls - List contents of partitioned image or partition
-
-SYNOPSIS
-    wic ls <image>
-    wic ls <image>:<vfat or ext* partition>
-    wic ls <image>:<vfat or ext* partition><path>
-    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path>
-
-DESCRIPTION
-    This command lists either partitions of the image or directory contents
-    of vfat or ext* partitions.
-
-    The first form it lists partitions of the image.
-    For example:
-        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
-        Num     Start        End          Size      Fstype
-        1        1048576     24438783     23390208  fat16
-        2       25165824     50315263     25149440  ext4
-
-    Second and third form list directory content of the partition:
-        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
-        Volume in drive : is boot
-         Volume Serial Number is 2DF2-5F02
-        Directory for ::/
-
-        efi          <DIR>     2017-05-11  10:54
-        startup  nsh        26 2017-05-11  10:54
-        vmlinuz        6922288 2017-05-11  10:54
-                3 files           6 922 314 bytes
-                                 15 818 752 bytes free
-
-
-        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/EFI/boot/
-        Volume in drive : is boot
-         Volume Serial Number is 2DF2-5F02
-        Directory for ::/EFI/boot
-
-        .            <DIR>     2017-05-11  10:54
-        ..           <DIR>     2017-05-11  10:54
-        grub     cfg       679 2017-05-11  10:54
-        bootx64  efi    571392 2017-05-11  10:54
-                4 files             572 071 bytes
-                                 15 818 752 bytes free
-
-    The -n option is used to specify the path to the native sysroot
-    containing the tools(parted and mtools) to use.
-
-"""
-
-wic_cp_usage = """
-
- Copy files and directories to the vfat or ext* partition
-
- usage: wic cp <src> <image>:<partition>[<path>] [--native-sysroot <path>]
-
- This command  copies local files or directories to the vfat or ext* partitions
-of partitioned  image.
-
- See 'wic help cp' for more detailed instructions.
-
-"""
-
-wic_cp_help = """
-
-NAME
-    wic cp - copy files and directories to the vfat or ext* partitions
-
-SYNOPSIS
-    wic cp <src> <image>:<partition>
-    wic cp <src> <image>:<partition><path>
-    wic cp <src> <image>:<partition><path> --native-sysroot <path>
-
-DESCRIPTION
-    This command copies files and directories to the vfat or ext* partition of
-    the partitioned image.
-
-    The first form of it copies file or directory to the root directory of
-    the partition:
-        $ wic cp test.wks tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
-        $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
-        Volume in drive : is boot
-         Volume Serial Number is DB4C-FD4C
-        Directory for ::/
-
-        efi          <DIR>     2017-05-24  18:15
-        loader       <DIR>     2017-05-24  18:15
-        startup  nsh        26 2017-05-24  18:15
-        vmlinuz        6926384 2017-05-24  18:15
-        test     wks       628 2017-05-24  21:22
-                5 files           6 927 038 bytes
-                                 15 677 440 bytes free
-
-    The second form of the command copies file or directory to the specified directory
-    on the partition:
-       $ wic cp test tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
-       $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
-       Volume in drive : is boot
-        Volume Serial Number is DB4C-FD4C
-       Directory for ::/efi
-
-       .            <DIR>     2017-05-24  18:15
-       ..           <DIR>     2017-05-24  18:15
-       boot         <DIR>     2017-05-24  18:15
-       test         <DIR>     2017-05-24  21:27
-               4 files                   0 bytes
-                                15 675 392 bytes free
-
-    The -n option is used to specify the path to the native sysroot
-    containing the tools(parted and mtools) to use.
-"""
-
-wic_rm_usage = """
-
- Remove files or directories from the vfat or ext* partitions
-
- usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
-
- This command  removes files or directories from the vfat or ext* partitions of
- the partitioned image.
-
- See 'wic help rm' for more detailed instructions.
-
-"""
-
-wic_rm_help = """
-
-NAME
-    wic rm - remove files or directories from the vfat or ext* partitions
-
-SYNOPSIS
-    wic rm <src> <image>:<partition><path>
-    wic rm <src> <image>:<partition><path> --native-sysroot <path>
-
-DESCRIPTION
-    This command removes files or directories from the vfat or ext* partition of the
-    partitioned image:
-
-        $ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
-        Volume in drive : is boot
-         Volume Serial Number is 11D0-DE21
-        Directory for ::/
-
-        libcom32 c32    186500 2017-06-02  15:15
-        libutil  c32     24148 2017-06-02  15:15
-        syslinux cfg       209 2017-06-02  15:15
-        vesamenu c32     27104 2017-06-02  15:15
-        vmlinuz        6926384 2017-06-02  15:15
-                5 files           7 164 345 bytes
-                                 16 582 656 bytes free
-
-        $ wic rm ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/libutil.c32
-
-        $ wic ls ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
-        Volume in drive : is boot
-         Volume Serial Number is 11D0-DE21
-        Directory for ::/
-
-        libcom32 c32    186500 2017-06-02  15:15
-        syslinux cfg       209 2017-06-02  15:15
-        vesamenu c32     27104 2017-06-02  15:15
-        vmlinuz        6926384 2017-06-02  15:15
-                4 files           7 140 197 bytes
-                                 16 607 232 bytes free
-
-    The -n option is used to specify the path to the native sysroot
-    containing the tools(parted and mtools) to use.
-"""
-
-wic_write_usage = """
-
- Write image to a device
-
- usage: wic write <image> <target device> [--expand [rules]] [--native-sysroot <path>]
-
- This command writes partitioned image to a target device (USB stick, SD card etc).
-
- See 'wic help write' for more detailed instructions.
-
-"""
-
-wic_write_help = """
-
-NAME
-    wic write - write an image to a device
-
-SYNOPSIS
-    wic write <image> <target>
-    wic write <image> <target> --expand auto
-    wic write <image> <target> --expand 1:100M-2:300M
-    wic write <image> <target> --native-sysroot <path>
-
-DESCRIPTION
-    This command writes an image to a target device (USB stick, SD card etc)
-
-        $ wic write ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic /dev/sdb
-
-    The --expand option is used to resize image partitions.
-    --expand auto expands partitions to occupy all free space available on the target device.
-    It's also possible to specify expansion rules in a format
-    <partition>:<size>[-<partition>:<size>...] for one or more partitions.
-    Specifying size 0 will keep partition unmodified.
-    Note: Resizing boot partition can result in non-bootable image for non-EFI images. It is
-    recommended to use size 0 for boot partition to keep image bootable.
-
-    The --native-sysroot option is used to specify the path to the native sysroot
-    containing the tools(parted, resize2fs) to use.
-"""
-
-wic_plugins_help = """
-
-NAME
-    wic plugins - Overview and API
-
-DESCRIPTION
-    plugins allow wic functionality to be extended and specialized by
-    users.  This section documents the plugin interface, which is
-    currently restricted to 'source' plugins.
-
-    'Source' plugins provide a mechanism to customize various aspects
-    of the image generation process in wic, mainly the contents of
-    partitions.
-
-    Source plugins provide a mechanism for mapping values specified in
-    .wks files using the --source keyword to a particular plugin
-    implementation that populates a corresponding partition.
-
-    A source plugin is created as a subclass of SourcePlugin (see
-    scripts/lib/wic/pluginbase.py) and the plugin file containing it
-    is added to scripts/lib/wic/plugins/source/ to make the plugin
-    implementation available to the wic implementation.
-
-    Source plugins can also be implemented and added by external
-    layers - any plugins found in a scripts/lib/wic/plugins/source/
-    directory in an external layer will also be made available.
-
-    When the wic implementation needs to invoke a partition-specific
-    implementation, it looks for the plugin that has the same name as
-    the --source param given to that partition.  For example, if the
-    partition is set up like this:
-
-      part /boot --source bootimg-pcbios   ...
-
-    then the methods defined as class members of the plugin having the
-    matching bootimg-pcbios .name class member would be used.
-
-    To be more concrete, here's the plugin definition that would match
-    a '--source bootimg-pcbios' usage, along with an example method
-    that would be called by the wic implementation when it needed to
-    invoke an implementation-specific partition-preparation function:
-
-    class BootimgPcbiosPlugin(SourcePlugin):
-        name = 'bootimg-pcbios'
-
-    @classmethod
-        def do_prepare_partition(self, part, ...)
-
-    If the subclass itself doesn't implement a function, a 'default'
-    version in a superclass will be located and used, which is why all
-    plugins must be derived from SourcePlugin.
-
-    The SourcePlugin class defines the following methods, which is the
-    current set of methods that can be implemented/overridden by
-    --source plugins.  Any methods not implemented by a SourcePlugin
-    subclass inherit the implementations present in the SourcePlugin
-    class (see the SourcePlugin source for details):
-
-      do_prepare_partition()
-          Called to do the actual content population for a
-          partition. In other words, it 'prepares' the final partition
-          image which will be incorporated into the disk image.
-
-      do_post_partition()
-          Called after the partition is created. It is useful to add post
-          operations e.g. signing the partition.
-
-      do_configure_partition()
-          Called before do_prepare_partition(), typically used to
-          create custom configuration files for a partition, for
-          example syslinux or grub config files.
-
-      do_install_disk()
-          Called after all partitions have been prepared and assembled
-          into a disk image.  This provides a hook to allow
-          finalization of a disk image, for example to write an MBR to
-          it.
-
-      do_stage_partition()
-          Special content-staging hook called before
-          do_prepare_partition(), normally empty.
-
-          Typically, a partition will just use the passed-in
-          parameters, for example the unmodified value of bootimg_dir.
-          In some cases however, things may need to be more tailored.
-          As an example, certain files may additionally need to be
-          take from bootimg_dir + /boot.  This hook allows those files
-          to be staged in a customized fashion.  Note that
-          get_bitbake_var() allows you to access non-standard
-          variables that you might want to use for these types of
-          situations.
-
-    This scheme is extensible - adding more hooks is a simple matter
-    of adding more plugin methods to SourcePlugin and derived classes.
-    Please see the implementation for details.
-"""
-
-wic_overview_help = """
-
-NAME
-    wic overview - General overview of wic
-
-DESCRIPTION
-    The 'wic' command generates partitioned images from existing
-    OpenEmbedded build artifacts.  Image generation is driven by
-    partitioning commands contained in an 'Openembedded kickstart'
-    (.wks) file (see 'wic help kickstart') specified either directly
-    on the command-line or as one of a selection of canned .wks files
-    (see 'wic list images').  When applied to a given set of build
-    artifacts, the result is an image or set of images that can be
-    directly written onto media and used on a particular system.
-
-    The 'wic' command and the infrastructure it's based on is by
-    definition incomplete - its purpose is to allow the generation of
-    customized images, and as such was designed to be completely
-    extensible via a plugin interface (see 'wic help plugins').
-
-  Background and Motivation
-
-    wic is meant to be a completely independent standalone utility
-    that initially provides easier-to-use and more flexible
-    replacements for a couple bits of existing functionality in
-    oe-core: directdisk.bbclass and mkefidisk.sh.  The difference
-    between wic and those examples is that with wic the functionality
-    of those scripts is implemented by a general-purpose partitioning
-    'language' based on Redhat kickstart syntax).
-
-    The initial motivation and design considerations that lead to the
-    current tool are described exhaustively in Yocto Bug #3847
-    (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3847).
-
-  Implementation and Examples
-
-    wic can be used in two different modes, depending on how much
-    control the user needs in specifying the Openembedded build
-    artifacts that will be used in creating the image: 'raw' and
-    'cooked'.
-
-    If used in 'raw' mode, artifacts are explicitly specified via
-    command-line arguments (see example below).
-
-    The more easily usable 'cooked' mode uses the current MACHINE
-    setting and a specified image name to automatically locate the
-    artifacts used to create the image.
-
-    OE kickstart files (.wks) can of course be specified directly on
-    the command-line, but the user can also choose from a set of
-    'canned' .wks files available via the 'wic list images' command
-    (example below).
-
-    In any case, the prerequisite for generating any image is to have
-    the build artifacts already available.  The below examples assume
-    the user has already build a 'core-image-minimal' for a specific
-    machine (future versions won't require this redundant step, but
-    for now that's typically how build artifacts get generated).
-
-    The other prerequisite is to source the build environment:
-
-      $ source oe-init-build-env
-
-    To start out with, we'll generate an image from one of the canned
-    .wks files.  The following generates a list of availailable
-    images:
-
-      $ wic list images
-        mkefidisk             Create an EFI disk image
-        directdisk            Create a 'pcbios' direct disk image
-
-    You can get more information about any of the available images by
-    typing 'wic list xxx help', where 'xxx' is one of the image names:
-
-      $ wic list mkefidisk help
-
-    Creates a partitioned EFI disk image that the user can directly dd
-    to boot media.
-
-    At any time, you can get help on the 'wic' command or any
-    subcommand (currently 'list' and 'create').  For instance, to get
-    the description of 'wic create' command and its parameters:
-
-      $ wic create
-
-       Usage:
-
-       Create a new OpenEmbedded image
-
-       usage: wic create <wks file or image name> [-o <DIRNAME> | ...]
-            [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
-            [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
-            [-r, --rootfs-dir] [-b, --bootimg-dir] [-k, --kernel-dir]
-            [-n, --native-sysroot] [-f, --build-rootfs]
-
-       This command creates an OpenEmbedded image based on the 'OE
-       kickstart commands' found in the <wks file>.
-
-       The -o option can be used to place the image in a directory
-       with a different name and location.
-
-       See 'wic help create' for more detailed instructions.
-       ...
-
-    As mentioned in the command, you can get even more detailed
-    information by adding 'help' to the above:
-
-      $ wic help create
-
-    So, the easiest way to create an image is to use the -e option
-    with a canned .wks file.  To use the -e option, you need to
-    specify the image used to generate the artifacts and you actually
-    need to have the MACHINE used to build them specified in your
-    local.conf (these requirements aren't necessary if you aren't
-    using the -e options.)  Below, we generate a directdisk image,
-    pointing the process at the core-image-minimal artifacts for the
-    current MACHINE:
-
-      $ wic create directdisk -e core-image-minimal
-
-      Checking basic build environment...
-      Done.
-
-      Creating image(s)...
-
-      Info: The new image(s) can be found here:
-      /var/tmp/wic/build/directdisk-201309252350-sda.direct
-
-      The following build artifacts were used to create the image(s):
-
-      ROOTFS_DIR:      ...
-      BOOTIMG_DIR:     ...
-      KERNEL_DIR:      ...
-      NATIVE_SYSROOT:  ...
-
-      The image(s) were created using OE kickstart file:
-        .../scripts/lib/wic/canned-wks/directdisk.wks
-
-    The output shows the name and location of the image created, and
-    so that you know exactly what was used to generate the image, each
-    of the artifacts and the kickstart file used.
-
-    Similarly, you can create a 'mkefidisk' image in the same way
-    (notice that this example uses a different machine - because it's
-    using the -e option, you need to change the MACHINE in your
-    local.conf):
-
-      $ wic create mkefidisk -e core-image-minimal
-      Checking basic build environment...
-      Done.
-
-      Creating image(s)...
-
-      Info: The new image(s) can be found here:
-         /var/tmp/wic/build/mkefidisk-201309260027-sda.direct
-
-      ...
-
-    Here's an example that doesn't take the easy way out and manually
-    specifies each build artifact, along with a non-canned .wks file,
-    and also uses the -o option to have wic create the output
-    somewhere other than the default /var/tmp/wic:
-
-      $ wic create ./test.wks -o ./out --rootfs-dir
-      tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
-      --bootimg-dir tmp/sysroots/qemux86-64/usr/share
-      --kernel-dir tmp/deploy/images/qemux86-64
-      --native-sysroot tmp/sysroots/x86_64-linux
-
-     Creating image(s)...
-
-     Info: The new image(s) can be found here:
-           out/build/test-201507211313-sda.direct
-
-     The following build artifacts were used to create the image(s):
-       ROOTFS_DIR:                   tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs
-       BOOTIMG_DIR:                  tmp/sysroots/qemux86-64/usr/share
-       KERNEL_DIR:                   tmp/deploy/images/qemux86-64
-       NATIVE_SYSROOT:               tmp/sysroots/x86_64-linux
-
-     The image(s) were created using OE kickstart file:
-     ./test.wks
-
-     Here is a content of test.wks:
-
-     part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
-     part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
-
-     bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
-
-
-    Finally, here's an example of the actual partition language
-    commands used to generate the mkefidisk image i.e. these are the
-    contents of the mkefidisk.wks OE kickstart file:
-
-      # short-description: Create an EFI disk image
-      # long-description: Creates a partitioned EFI disk image that the user
-      # can directly dd to boot media.
-
-      part /boot --source bootimg-efi --ondisk sda --fstype=efi --active
-
-      part / --source rootfs --ondisk sda --fstype=ext3 --label platform
-
-      part swap --ondisk sda --size 44 --label swap1 --fstype=swap
-
-      bootloader  --timeout=10  --append="rootwait console=ttyPCH0,115200"
-
-    You can get a complete listing and description of all the
-    kickstart commands available for use in .wks files from 'wic help
-    kickstart'.
-"""
-
-wic_kickstart_help = """
-
-NAME
-    wic kickstart - wic kickstart reference
-
-DESCRIPTION
-    This section provides the definitive reference to the wic
-    kickstart language.  It also provides documentation on the list of
-    --source plugins available for use from the 'part' command (see
-    the 'Platform-specific Plugins' section below).
-
-    The current wic implementation supports only the basic kickstart
-    partitioning commands: partition (or part for short) and
-    bootloader.
-
-    The following is a listing of the commands, their syntax, and
-    meanings. The commands are based on the Fedora kickstart
-    documentation but with modifications to reflect wic capabilities.
-
-      http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
-      http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader
-
-  Commands
-
-    * 'part' or 'partition'
-
-       This command creates a partition on the system and uses the
-       following syntax:
-
-         part [<mountpoint>]
-
-       The <mountpoint> is where the partition will be mounted and
-       must take of one of the following forms:
-
-         /<path>: For example: /, /usr, or /home
-
-         swap: The partition will be used as swap space.
-
-       If a <mountpoint> is not specified the partition will be created
-       but will not be mounted.
-
-       Partitions with a <mountpoint> specified will be automatically mounted.
-       This is achieved by wic adding entries to the fstab during image
-       generation. In order for a valid fstab to be generated one of the
-       --ondrive, --ondisk or --use-uuid partition options must be used for
-       each partition that specifies a mountpoint.  Note that with --use-uuid
-       and non-root <mountpoint>, including swap, the mount program must
-       understand the PARTUUID syntax.  This currently excludes the busybox
-       versions of these applications.
-
-
-       The following are supported 'part' options:
-
-         --size: The minimum partition size. Specify an integer value
-                 such as 500. Multipliers k, M ang G can be used. If
-                 not specified, the size is in MB.
-                 You do not need this option if you use --source.
-
-         --fixed-size: Exact partition size. Value format is the same
-                       as for --size option. This option cannot be
-                       specified along with --size. If partition data
-                       is larger than --fixed-size and error will be
-                       raised when assembling disk image.
-
-         --source: This option is a wic-specific option that names the
-                   source of the data that will populate the
-                   partition.  The most common value for this option
-                   is 'rootfs', but can be any value which maps to a
-                   valid 'source plugin' (see 'wic help plugins').
-
-                   If '--source rootfs' is used, it tells the wic
-                   command to create a partition as large as needed
-                   and to fill it with the contents of the root
-                   filesystem pointed to by the '-r' wic command-line
-                   option (or the equivalent rootfs derived from the
-                   '-e' command-line option).  The filesystem type
-                   that will be used to create the partition is driven
-                   by the value of the --fstype option specified for
-                   the partition (see --fstype below).
-
-                   If --source <plugin-name>' is used, it tells the
-                   wic command to create a partition as large as
-                   needed and to fill with the contents of the
-                   partition that will be generated by the specified
-                   plugin name using the data pointed to by the '-r'
-                   wic command-line option (or the equivalent rootfs
-                   derived from the '-e' command-line option).
-                   Exactly what those contents and filesystem type end
-                   up being are dependent on the given plugin
-                   implementation.
-
-                   If --source option is not used, the wic command
-                   will create empty partition. --size parameter has
-                   to be used to specify size of empty partition.
-
-         --ondisk or --ondrive: Forces the partition to be created on
-                                a particular disk.
-
-         --fstype: Sets the file system type for the partition.  These
-           apply to partitions created using '--source rootfs' (see
-           --source above).  Valid values are:
-
-             vfat
-             msdos
-             ext2
-             ext3
-             ext4
-             btrfs
-             squashfs
-             swap
-
-         --fsoptions: Specifies a free-form string of options to be
-                      used when mounting the filesystem. This string
-                      will be copied into the /etc/fstab file of the
-                      installed system and should be enclosed in
-                      quotes.  If not specified, the default string is
-                      "defaults".
-
-         --label label: Specifies the label to give to the filesystem
-                        to be made on the partition. If the given
-                        label is already in use by another filesystem,
-                        a new label is created for the partition.
-
-         --active: Marks the partition as active.
-
-         --align (in KBytes): This option is specific to wic and says
-                              to start a partition on an x KBytes
-                              boundary.
-
-         --no-table: This option is specific to wic. Space will be
-                     reserved for the partition and it will be
-                     populated but it will not be added to the
-                     partition table. It may be useful for
-                     bootloaders.
-
-         --exclude-path: This option is specific to wic. It excludes the given
-                         relative path from the resulting image. If the path
-                         ends with a slash, only the content of the directory
-                         is omitted, not the directory itself. This option only
-                         has an effect with the rootfs source plugin.
-
-         --extra-space: This option is specific to wic. It adds extra
-                        space after the space filled by the content
-                        of the partition. The final size can go
-                        beyond the size specified by --size.
-                        By default, 10MB. This option cannot be used
-                        with --fixed-size option.
-
-         --overhead-factor: This option is specific to wic. The
-                            size of the partition is multiplied by
-                            this factor. It has to be greater than or
-                            equal to 1. The default value is 1.3.
-                            This option cannot be used with --fixed-size
-                            option.
-
-         --part-name: This option is specific to wic. It specifies name for GPT partitions.
-
-         --part-type: This option is specific to wic. It specifies partition
-                      type GUID for GPT partitions.
-                      List of partition type GUIDS can be found here:
-                      http://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
-
-         --use-uuid: This option is specific to wic. It makes wic to generate
-                     random globally unique identifier (GUID) for the partition
-                     and use it in bootloader configuration to specify root partition.
-
-         --uuid: This option is specific to wic. It specifies partition UUID.
-                 It's useful if preconfigured partition UUID is added to kernel command line
-                 in bootloader configuration before running wic. In this case .wks file can
-                 be generated or modified to set preconfigured parition UUID using this option.
-
-         --fsuuid: This option is specific to wic. It specifies filesystem UUID.
-                   It's useful if preconfigured filesystem UUID is added to kernel command line
-                   in bootloader configuration before running wic. In this case .wks file can
-                   be generated or modified to set preconfigured filesystem UUID using this option.
-
-         --system-id: This option is specific to wic. It specifies partition system id. It's useful
-                      for the harware that requires non-default partition system ids. The parameter
-                      in one byte long hex number either with 0x prefix or without it.
-
-         --mkfs-extraopts: This option specifies extra options to pass to mkfs utility.
-                           NOTE, that wic uses default options for some filesystems, for example
-                           '-S 512' for mkfs.fat or '-F -i 8192' for mkfs.ext. Those options will
-                           not take effect when --mkfs-extraopts is used. This should be taken into
-                           account when using --mkfs-extraopts.
-
-    * bootloader
-
-      This command allows the user to specify various bootloader
-      options.  The following are supported 'bootloader' options:
-
-        --timeout: Specifies the number of seconds before the
-                   bootloader times out and boots the default option.
-
-        --append: Specifies kernel parameters. These will be added to
-                  bootloader command-line - for example, the syslinux
-                  APPEND or grub kernel command line.
-
-        --configfile: Specifies a user defined configuration file for
-                      the bootloader. This file must be located in the
-                      canned-wks folder or could be the full path to the
-                      file. Using this option will override any other
-                      bootloader option.
-
-      Note that bootloader functionality and boot partitions are
-      implemented by the various --source plugins that implement
-      bootloader functionality; the bootloader command essentially
-      provides a means of modifying bootloader configuration.
-
-    * include
-
-      This command allows the user to include the content of .wks file
-      into original .wks file.
-
-      Command uses the following syntax:
-
-         include <file>
-
-      The <file> is either path to the file or its name. If name is
-      specified wic will try to find file in the directories with canned
-      .wks files.
-
-"""
-
-wic_help_help = """
-NAME
-    wic help - display a help topic
-
-DESCRIPTION
-    Specify a help topic to display it. Topics are shown above.
-"""
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
deleted file mode 100644
index e590b2f..0000000
--- a/scripts/lib/wic/ksparser.py
+++ /dev/null
@@ -1,235 +0,0 @@
-#!/usr/bin/env python -tt
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2016 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-#
-# DESCRIPTION
-# This module provides parser for kickstart format
-#
-# AUTHORS
-# Ed Bartosh <ed.bartosh> (at] linux.intel.com>
-
-"""Kickstart parser module."""
-
-import os
-import shlex
-import logging
-
-from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
-
-from wic.engine import find_canned
-from wic.partition import Partition
-
-logger = logging.getLogger('wic')
-
-class KickStartError(Exception):
-    """Custom exception."""
-    pass
-
-class KickStartParser(ArgumentParser):
-    """
-    This class overwrites error method to throw exception
-    instead of producing usage message(default argparse behavior).
-    """
-    def error(self, message):
-        raise ArgumentError(None, message)
-
-def sizetype(arg):
-    """
-    Custom type for ArgumentParser
-    Converts size string in <num>[K|k|M|G] format into the integer value
-    """
-    if arg.isdigit():
-        return int(arg) * 1024
-
-    if not arg[:-1].isdigit():
-        raise ArgumentTypeError("Invalid size: %r" % arg)
-
-    size = int(arg[:-1])
-    if arg.endswith("k") or arg.endswith("K"):
-        return size
-    if arg.endswith("M"):
-        return size * 1024
-    if arg.endswith("G"):
-        return size * 1024 * 1024
-
-    raise ArgumentTypeError("Invalid size: %r" % arg)
-
-def overheadtype(arg):
-    """
-    Custom type for ArgumentParser
-    Converts overhead string to float and checks if it's bigger than 1.0
-    """
-    try:
-        result = float(arg)
-    except ValueError:
-        raise ArgumentTypeError("Invalid value: %r" % arg)
-
-    if result < 1.0:
-        raise ArgumentTypeError("Overhead factor should be > 1.0" % arg)
-
-    return result
-
-def cannedpathtype(arg):
-    """
-    Custom type for ArgumentParser
-    Tries to find file in the list of canned wks paths
-    """
-    scripts_path = os.path.abspath(os.path.dirname(__file__) + '../../..')
-    result = find_canned(scripts_path, arg)
-    if not result:
-        raise ArgumentTypeError("file not found: %s" % arg)
-    return result
-
-def systemidtype(arg):
-    """
-    Custom type for ArgumentParser
-    Checks if the argument sutisfies system id requirements,
-    i.e. if it's one byte long integer > 0
-    """
-    error = "Invalid system type: %s. must be hex "\
-            "between 0x1 and 0xFF" % arg
-    try:
-        result = int(arg, 16)
-    except ValueError:
-        raise ArgumentTypeError(error)
-
-    if result <= 0 or result > 0xff:
-        raise ArgumentTypeError(error)
-
-    return arg
-
-class KickStart():
-    """Kickstart parser implementation."""
-
-    DEFAULT_EXTRA_SPACE = 10*1024
-    DEFAULT_OVERHEAD_FACTOR = 1.3
-
-    def __init__(self, confpath):
-
-        self.partitions = []
-        self.bootloader = None
-        self.lineno = 0
-        self.partnum = 0
-
-        parser = KickStartParser()
-        subparsers = parser.add_subparsers()
-
-        part = subparsers.add_parser('part')
-        part.add_argument('mountpoint', nargs='?')
-        part.add_argument('--active', action='store_true')
-        part.add_argument('--align', type=int)
-        part.add_argument('--exclude-path', nargs='+')
-        part.add_argument("--extra-space", type=sizetype)
-        part.add_argument('--fsoptions', dest='fsopts')
-        part.add_argument('--fstype', default='vfat',
-                          choices=('ext2', 'ext3', 'ext4', 'btrfs',
-                                   'squashfs', 'vfat', 'msdos', 'swap'))
-        part.add_argument('--mkfs-extraopts', default='')
-        part.add_argument('--label')
-        part.add_argument('--no-table', action='store_true')
-        part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
-        part.add_argument("--overhead-factor", type=overheadtype)
-        part.add_argument('--part-name')
-        part.add_argument('--part-type')
-        part.add_argument('--rootfs-dir')
-
-        # --size and --fixed-size cannot be specified together; options
-        # ----extra-space and --overhead-factor should also raise a parser
-        # --error, but since nesting mutually exclusive groups does not work,
-        # ----extra-space/--overhead-factor are handled later
-        sizeexcl = part.add_mutually_exclusive_group()
-        sizeexcl.add_argument('--size', type=sizetype, default=0)
-        sizeexcl.add_argument('--fixed-size', type=sizetype, default=0)
-
-        part.add_argument('--source')
-        part.add_argument('--sourceparams')
-        part.add_argument('--system-id', type=systemidtype)
-        part.add_argument('--use-uuid', action='store_true')
-        part.add_argument('--uuid')
-        part.add_argument('--fsuuid')
-
-        bootloader = subparsers.add_parser('bootloader')
-        bootloader.add_argument('--append')
-        bootloader.add_argument('--configfile')
-        bootloader.add_argument('--ptable', choices=('msdos', 'gpt'),
-                                default='msdos')
-        bootloader.add_argument('--timeout', type=int)
-        bootloader.add_argument('--source')
-
-        include = subparsers.add_parser('include')
-        include.add_argument('path', type=cannedpathtype)
-
-        self._parse(parser, confpath)
-        if not self.bootloader:
-            logger.warning('bootloader config not specified, using defaults\n')
-            self.bootloader = bootloader.parse_args([])
-
-    def _parse(self, parser, confpath):
-        """
-        Parse file in .wks format using provided parser.
-        """
-        with open(confpath) as conf:
-            lineno = 0
-            for line in conf:
-                line = line.strip()
-                lineno += 1
-                if line and line[0] != '#':
-                    try:
-                        line_args = shlex.split(line)
-                        parsed = parser.parse_args(line_args)
-                    except ArgumentError as err:
-                        raise KickStartError('%s:%d: %s' % \
-                                             (confpath, lineno, err))
-                    if line.startswith('part'):
-                        # SquashFS does not support UUID
-                        if parsed.fstype == 'squashfs' and parsed.use_uuid:
-                            err = "%s:%d: SquashFS does not support UUID" \
-                                  % (confpath, lineno)
-                            raise KickStartError(err)
-                        # using ArgumentParser one cannot easily tell if option
-                        # was passed as argument, if said option has a default
-                        # value; --overhead-factor/--extra-space cannot be used
-                        # with --fixed-size, so at least detect when these were
-                        # passed with non-0 values ...
-                        if parsed.fixed_size:
-                            if parsed.overhead_factor or parsed.extra_space:
-                                err = "%s:%d: arguments --overhead-factor and --extra-space not "\
-                                      "allowed with argument --fixed-size" \
-                                      % (confpath, lineno)
-                                raise KickStartError(err)
-                        else:
-                            # ... and provide defaults if not using
-                            # --fixed-size iff given option was not used
-                            # (again, one cannot tell if option was passed but
-                            # with value equal to 0)
-                            if '--overhead-factor' not in line_args:
-                                parsed.overhead_factor = self.DEFAULT_OVERHEAD_FACTOR
-                            if '--extra-space' not in line_args:
-                                parsed.extra_space = self.DEFAULT_EXTRA_SPACE
-
-                        self.partnum += 1
-                        self.partitions.append(Partition(parsed, self.partnum))
-                    elif line.startswith('include'):
-                        self._parse(parser, parsed.path)
-                    elif line.startswith('bootloader'):
-                        if not self.bootloader:
-                            self.bootloader = parsed
-                        else:
-                            err = "%s:%d: more than one bootloader specified" \
-                                      % (confpath, lineno)
-                            raise KickStartError(err)
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
deleted file mode 100644
index ee888b4..0000000
--- a/scripts/lib/wic/misc.py
+++ /dev/null
@@ -1,263 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-# This module provides a place to collect various wic-related utils
-# for the OpenEmbedded Image Tools.
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-#
-"""Miscellaneous functions."""
-
-import logging
-import os
-import re
-import subprocess
-
-from collections import defaultdict
-from distutils import spawn
-
-from wic import WicError
-
-logger = logging.getLogger('wic')
-
-# executable -> recipe pairs for exec_native_cmd
-NATIVE_RECIPES = {"bmaptool": "bmap-tools",
-                  "grub-mkimage": "grub-efi",
-                  "isohybrid": "syslinux",
-                  "mcopy": "mtools",
-                  "mdel" : "mtools",
-                  "mdeltree" : "mtools",
-                  "mdir" : "mtools",
-                  "mkdosfs": "dosfstools",
-                  "mkisofs": "cdrtools",
-                  "mkfs.btrfs": "btrfs-tools",
-                  "mkfs.ext2": "e2fsprogs",
-                  "mkfs.ext3": "e2fsprogs",
-                  "mkfs.ext4": "e2fsprogs",
-                  "mkfs.vfat": "dosfstools",
-                  "mksquashfs": "squashfs-tools",
-                  "mkswap": "util-linux",
-                  "mmd": "mtools",
-                  "parted": "parted",
-                  "sfdisk": "util-linux",
-                  "sgdisk": "gptfdisk",
-                  "syslinux": "syslinux"
-                 }
-
-def runtool(cmdln_or_args):
-    """ wrapper for most of the subprocess calls
-    input:
-        cmdln_or_args: can be both args and cmdln str (shell=True)
-    return:
-        rc, output
-    """
-    if isinstance(cmdln_or_args, list):
-        cmd = cmdln_or_args[0]
-        shell = False
-    else:
-        import shlex
-        cmd = shlex.split(cmdln_or_args)[0]
-        shell = True
-
-    sout = subprocess.PIPE
-    serr = subprocess.STDOUT
-
-    try:
-        process = subprocess.Popen(cmdln_or_args, stdout=sout,
-                                   stderr=serr, shell=shell)
-        sout, serr = process.communicate()
-        # combine stdout and stderr, filter None out and decode
-        out = ''.join([out.decode('utf-8') for out in [sout, serr] if out])
-    except OSError as err:
-        if err.errno == 2:
-            # [Errno 2] No such file or directory
-            raise WicError('Cannot run command: %s, lost dependency?' % cmd)
-        else:
-            raise # relay
-
-    return process.returncode, out
-
-def _exec_cmd(cmd_and_args, as_shell=False):
-    """
-    Execute command, catching stderr, stdout
-
-    Need to execute as_shell if the command uses wildcards
-    """
-    logger.debug("_exec_cmd: %s", cmd_and_args)
-    args = cmd_and_args.split()
-    logger.debug(args)
-
-    if as_shell:
-        ret, out = runtool(cmd_and_args)
-    else:
-        ret, out = runtool(args)
-    out = out.strip()
-    if ret != 0:
-        raise WicError("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
-                       (cmd_and_args, ret, out))
-
-    logger.debug("_exec_cmd: output for %s (rc = %d): %s",
-                 cmd_and_args, ret, out)
-
-    return ret, out
-
-
-def exec_cmd(cmd_and_args, as_shell=False):
-    """
-    Execute command, return output
-    """
-    return _exec_cmd(cmd_and_args, as_shell)[1]
-
-
-def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
-    """
-    Execute native command, catching stderr, stdout
-
-    Need to execute as_shell if the command uses wildcards
-
-    Always need to execute native commands as_shell
-    """
-    # The reason -1 is used is because there may be "export" commands.
-    args = cmd_and_args.split(';')[-1].split()
-    logger.debug(args)
-
-    if pseudo:
-        cmd_and_args = pseudo + cmd_and_args
-
-    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
-                   (native_sysroot, native_sysroot, native_sysroot)
-
-    native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
-                   (native_paths, cmd_and_args)
-    logger.debug("exec_native_cmd: %s", native_cmd_and_args)
-
-    # If the command isn't in the native sysroot say we failed.
-    if spawn.find_executable(args[0], native_paths):
-        ret, out = _exec_cmd(native_cmd_and_args, True)
-    else:
-        ret = 127
-        out = "can't find native executable %s in %s" % (args[0], native_paths)
-
-    prog = args[0]
-    # shell command-not-found
-    if ret == 127 \
-       or (pseudo and ret == 1 and out == "Can't find '%s' in $PATH." % prog):
-        msg = "A native program %s required to build the image "\
-              "was not found (see details above).\n\n" % prog
-        recipe = NATIVE_RECIPES.get(prog)
-        if recipe:
-            msg += "Please make sure wic-tools have %s-native in its DEPENDS, "\
-                   "build it with 'bitbake wic-tools' and try again.\n" % recipe
-        else:
-            msg += "Wic failed to find a recipe to build native %s. Please "\
-                   "file a bug against wic.\n" % prog
-        raise WicError(msg)
-
-    return ret, out
-
-BOOTDD_EXTRA_SPACE = 16384
-
-class BitbakeVars(defaultdict):
-    """
-    Container for Bitbake variables.
-    """
-    def __init__(self):
-        defaultdict.__init__(self, dict)
-
-        # default_image and vars_dir attributes should be set from outside
-        self.default_image = None
-        self.vars_dir = None
-
-    def _parse_line(self, line, image, matcher=re.compile(r"^([a-zA-Z0-9\-_+./~]+)=(.*)")):
-        """
-        Parse one line from bitbake -e output or from .env file.
-        Put result key-value pair into the storage.
-        """
-        if "=" not in line:
-            return
-        match = matcher.match(line)
-        if not match:
-            return
-        key, val = match.groups()
-        self[image][key] = val.strip('"')
-
-    def get_var(self, var, image=None, cache=True):
-        """
-        Get bitbake variable from 'bitbake -e' output or from .env file.
-        This is a lazy method, i.e. it runs bitbake or parses file only when
-        only when variable is requested. It also caches results.
-        """
-        if not image:
-            image = self.default_image
-
-        if image not in self:
-            if image and self.vars_dir:
-                fname = os.path.join(self.vars_dir, image + '.env')
-                if os.path.isfile(fname):
-                    # parse .env file
-                    with open(fname) as varsfile:
-                        for line in varsfile:
-                            self._parse_line(line, image)
-                else:
-                    print("Couldn't get bitbake variable from %s." % fname)
-                    print("File %s doesn't exist." % fname)
-                    return
-            else:
-                # Get bitbake -e output
-                cmd = "bitbake -e"
-                if image:
-                    cmd += " %s" % image
-
-                log_level = logger.getEffectiveLevel()
-                logger.setLevel(logging.INFO)
-                ret, lines = _exec_cmd(cmd)
-                logger.setLevel(log_level)
-
-                if ret:
-                    logger.error("Couldn't get '%s' output.", cmd)
-                    logger.error("Bitbake failed with error:\n%s\n", lines)
-                    return
-
-                # Parse bitbake -e output
-                for line in lines.split('\n'):
-                    self._parse_line(line, image)
-
-            # Make first image a default set of variables
-            if cache:
-                images = [key for key in self if key]
-                if len(images) == 1:
-                    self[None] = self[image]
-
-        result = self[image].get(var)
-        if not cache:
-            self.pop(image, None)
-
-        return result
-
-# Create BB_VARS singleton
-BB_VARS = BitbakeVars()
-
-def get_bitbake_var(var, image=None, cache=True):
-    """
-    Provide old get_bitbake_var API by wrapping
-    get_var method of BB_VARS singleton.
-    """
-    return BB_VARS.get_var(var, image, cache)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
deleted file mode 100644
index 5054779..0000000
--- a/scripts/lib/wic/partition.py
+++ /dev/null
@@ -1,424 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2013-2016 Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-# This module provides the OpenEmbedded partition object definitions.
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-# Ed Bartosh <ed.bartosh> (at] linux.intel.com>
-
-import logging
-import os
-import uuid
-
-from wic import WicError
-from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
-from wic.pluginbase import PluginMgr
-
-logger = logging.getLogger('wic')
-
-class Partition():
-
-    def __init__(self, args, lineno):
-        self.args = args
-        self.active = args.active
-        self.align = args.align
-        self.disk = args.disk
-        self.device = None
-        self.extra_space = args.extra_space
-        self.exclude_path = args.exclude_path
-        self.fsopts = args.fsopts
-        self.fstype = args.fstype
-        self.label = args.label
-        self.mkfs_extraopts = args.mkfs_extraopts
-        self.mountpoint = args.mountpoint
-        self.no_table = args.no_table
-        self.num = None
-        self.overhead_factor = args.overhead_factor
-        self.part_name = args.part_name
-        self.part_type = args.part_type
-        self.rootfs_dir = args.rootfs_dir
-        self.size = args.size
-        self.fixed_size = args.fixed_size
-        self.source = args.source
-        self.sourceparams = args.sourceparams
-        self.system_id = args.system_id
-        self.use_uuid = args.use_uuid
-        self.uuid = args.uuid
-        self.fsuuid = args.fsuuid
-
-        self.lineno = lineno
-        self.source_file = ""
-
-    def get_extra_block_count(self, current_blocks):
-        """
-        The --size param is reflected in self.size (in kB), and we already
-        have current_blocks (1k) blocks, calculate and return the
-        number of (1k) blocks we need to add to get to --size, 0 if
-        we're already there or beyond.
-        """
-        logger.debug("Requested partition size for %s: %d",
-                     self.mountpoint, self.size)
-
-        if not self.size:
-            return 0
-
-        requested_blocks = self.size
-
-        logger.debug("Requested blocks %d, current_blocks %d",
-                     requested_blocks, current_blocks)
-
-        if requested_blocks > current_blocks:
-            return requested_blocks - current_blocks
-        else:
-            return 0
-
-    def get_rootfs_size(self, actual_rootfs_size=0):
-        """
-        Calculate the required size of rootfs taking into consideration
-        --size/--fixed-size flags as well as overhead and extra space, as
-        specified in kickstart file. Raises an error if the
-        `actual_rootfs_size` is larger than fixed-size rootfs.
-
-        """
-        if self.fixed_size:
-            rootfs_size = self.fixed_size
-            if actual_rootfs_size > rootfs_size:
-                raise WicError("Actual rootfs size (%d kB) is larger than "
-                               "allowed size %d kB" %
-                               (actual_rootfs_size, rootfs_size))
-        else:
-            extra_blocks = self.get_extra_block_count(actual_rootfs_size)
-            if extra_blocks < self.extra_space:
-                extra_blocks = self.extra_space
-
-            rootfs_size = actual_rootfs_size + extra_blocks
-            rootfs_size *= self.overhead_factor
-
-            logger.debug("Added %d extra blocks to %s to get to %d total blocks",
-                         extra_blocks, self.mountpoint, rootfs_size)
-
-        return rootfs_size
-
-    @property
-    def disk_size(self):
-        """
-        Obtain on-disk size of partition taking into consideration
-        --size/--fixed-size options.
-
-        """
-        return self.fixed_size if self.fixed_size else self.size
-
-    def prepare(self, creator, cr_workdir, oe_builddir, rootfs_dir,
-                bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Prepare content for individual partitions, depending on
-        partition command parameters.
-        """
-        if not self.source:
-            if not self.size and not self.fixed_size:
-                raise WicError("The %s partition has a size of zero. Please "
-                               "specify a non-zero --size/--fixed-size for that "
-                               "partition." % self.mountpoint)
-
-            if self.fstype == "swap":
-                self.prepare_swap_partition(cr_workdir, oe_builddir,
-                                            native_sysroot)
-                self.source_file = "%s/fs.%s" % (cr_workdir, self.fstype)
-            else:
-                if self.fstype == 'squashfs':
-                    raise WicError("It's not possible to create empty squashfs "
-                                   "partition '%s'" % (self.mountpoint))
-
-                rootfs = "%s/fs_%s.%s.%s" % (cr_workdir, self.label,
-                                             self.lineno, self.fstype)
-                if os.path.isfile(rootfs):
-                    os.remove(rootfs)
-
-                prefix = "ext" if self.fstype.startswith("ext") else self.fstype
-                method = getattr(self, "prepare_empty_partition_" + prefix)
-                method(rootfs, oe_builddir, native_sysroot)
-                self.source_file = rootfs
-            return
-
-        plugins = PluginMgr.get_plugins('source')
-
-        if self.source not in plugins:
-            raise WicError("The '%s' --source specified for %s doesn't exist.\n\t"
-                           "See 'wic list source-plugins' for a list of available"
-                           " --sources.\n\tSee 'wic help source-plugins' for "
-                           "details on adding a new source plugin." %
-                           (self.source, self.mountpoint))
-
-        srcparams_dict = {}
-        if self.sourceparams:
-            # Split sourceparams string of the form key1=val1[,key2=val2,...]
-            # into a dict.  Also accepts valueless keys i.e. without =
-            splitted = self.sourceparams.split(',')
-            srcparams_dict = dict(par.split('=') for par in splitted if par)
-
-        plugin = PluginMgr.get_plugins('source')[self.source]
-        plugin.do_configure_partition(self, srcparams_dict, creator,
-                                      cr_workdir, oe_builddir, bootimg_dir,
-                                      kernel_dir, native_sysroot)
-        plugin.do_stage_partition(self, srcparams_dict, creator,
-                                  cr_workdir, oe_builddir, bootimg_dir,
-                                  kernel_dir, native_sysroot)
-        plugin.do_prepare_partition(self, srcparams_dict, creator,
-                                    cr_workdir, oe_builddir, bootimg_dir,
-                                    kernel_dir, rootfs_dir, native_sysroot)
-        plugin.do_post_partition(self, srcparams_dict, creator,
-                                    cr_workdir, oe_builddir, bootimg_dir,
-                                    kernel_dir, rootfs_dir, native_sysroot)
-
-        # further processing required Partition.size to be an integer, make
-        # sure that it is one
-        if not isinstance(self.size, int):
-            raise WicError("Partition %s internal size is not an integer. "
-                           "This a bug in source plugin %s and needs to be fixed." %
-                           (self.mountpoint, self.source))
-
-        if self.fixed_size and self.size > self.fixed_size:
-            raise WicError("File system image of partition %s is "
-                           "larger (%d kB) than its allowed size %d kB" %
-                           (self.mountpoint, self.size, self.fixed_size))
-
-    def prepare_rootfs(self, cr_workdir, oe_builddir, rootfs_dir,
-                       native_sysroot, real_rootfs = True):
-        """
-        Prepare content for a rootfs partition i.e. create a partition
-        and fill it from a /rootfs dir.
-
-        Currently handles ext2/3/4, btrfs, vfat and squashfs.
-        """
-        p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
-        p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
-                                         "%s/../pseudo" %  rootfs_dir)
-        p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
-        p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
-        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
-        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % p_localstatedir
-        pseudo += "export PSEUDO_PASSWD=%s;" % p_passwd
-        pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
-        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
-
-        rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
-                                         self.lineno, self.fstype)
-        if os.path.isfile(rootfs):
-            os.remove(rootfs)
-
-        # Get rootfs size from bitbake variable if it's not set in .ks file
-        if not self.size and real_rootfs:
-            # Bitbake variable ROOTFS_SIZE is calculated in
-            # Image._get_rootfs_size method from meta/lib/oe/image.py
-            # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
-            # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
-            rsize_bb = get_bitbake_var('ROOTFS_SIZE')
-            if rsize_bb:
-                logger.warning('overhead-factor was specified, but size was not,'
-                               ' so bitbake variables will be used for the size.'
-                               ' In this case both IMAGE_OVERHEAD_FACTOR and '
-                               '--overhead-factor will be applied')
-                self.size = int(round(float(rsize_bb)))
-
-        prefix = "ext" if self.fstype.startswith("ext") else self.fstype
-        method = getattr(self, "prepare_rootfs_" + prefix)
-        method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
-        self.source_file = rootfs
-
-        # get the rootfs size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % rootfs
-        out = exec_cmd(du_cmd)
-        self.size = int(out.split()[0])
-
-    def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_dir,
-                           native_sysroot, pseudo):
-        """
-        Prepare content for an ext2/3/4 rootfs partition.
-        """
-        du_cmd = "du -ks %s" % rootfs_dir
-        out = exec_cmd(du_cmd)
-        actual_rootfs_size = int(out.split()[0])
-
-        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
-
-        with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
-
-        extraopts = self.mkfs_extraopts or "-F -i 8192"
-
-        label_str = ""
-        if self.label:
-            label_str = "-L %s" % self.label
-
-        mkfs_cmd = "mkfs.%s %s %s %s -U %s -d %s" % \
-            (self.fstype, extraopts, rootfs, label_str, self.fsuuid, rootfs_dir)
-        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
-
-        mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
-        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
-
-    def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
-                             native_sysroot, pseudo):
-        """
-        Prepare content for a btrfs rootfs partition.
-        """
-        du_cmd = "du -ks %s" % rootfs_dir
-        out = exec_cmd(du_cmd)
-        actual_rootfs_size = int(out.split()[0])
-
-        rootfs_size = self.get_rootfs_size(actual_rootfs_size)
-
-        with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
-
-        label_str = ""
-        if self.label:
-            label_str = "-L %s" % self.label
-
-        mkfs_cmd = "mkfs.%s -b %d -r %s %s %s -U %s %s" % \
-            (self.fstype, rootfs_size * 1024, rootfs_dir, label_str,
-             self.mkfs_extraopts, self.fsuuid, rootfs)
-        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
-
-    def prepare_rootfs_msdos(self, rootfs, oe_builddir, rootfs_dir,
-                             native_sysroot, pseudo):
-        """
-        Prepare content for a msdos/vfat rootfs partition.
-        """
-        du_cmd = "du -bks %s" % rootfs_dir
-        out = exec_cmd(du_cmd)
-        blocks = int(out.split()[0])
-
-        rootfs_size = self.get_rootfs_size(blocks)
-
-        label_str = "-n boot"
-        if self.label:
-            label_str = "-n %s" % self.label
-
-        size_str = ""
-        if self.fstype == 'msdos':
-            size_str = "-F 16" # FAT 16
-
-        extraopts = self.mkfs_extraopts or '-S 512'
-
-        dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
-                    (label_str, self.fsuuid, size_str, extraopts, rootfs,
-                     max(8250, rootfs_size))
-        exec_native_cmd(dosfs_cmd, native_sysroot)
-
-        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
-        exec_native_cmd(mcopy_cmd, native_sysroot)
-
-        chmod_cmd = "chmod 644 %s" % rootfs
-        exec_cmd(chmod_cmd)
-
-    prepare_rootfs_vfat = prepare_rootfs_msdos
-
-    def prepare_rootfs_squashfs(self, rootfs, oe_builddir, rootfs_dir,
-                                native_sysroot, pseudo):
-        """
-        Prepare content for a squashfs rootfs partition.
-        """
-        extraopts = self.mkfs_extraopts or '-noappend'
-        squashfs_cmd = "mksquashfs %s %s %s" % \
-                       (rootfs_dir, rootfs, extraopts)
-        exec_native_cmd(squashfs_cmd, native_sysroot, pseudo=pseudo)
-
-    def prepare_empty_partition_ext(self, rootfs, oe_builddir,
-                                    native_sysroot):
-        """
-        Prepare an empty ext2/3/4 partition.
-        """
-        size = self.disk_size
-        with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), size * 1024)
-
-        extraopts = self.mkfs_extraopts or "-i 8192"
-
-        label_str = ""
-        if self.label:
-            label_str = "-L %s" % self.label
-
-        mkfs_cmd = "mkfs.%s -F %s %s -U %s %s" % \
-            (self.fstype, extraopts, label_str, self.fsuuid, rootfs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
-
-    def prepare_empty_partition_btrfs(self, rootfs, oe_builddir,
-                                      native_sysroot):
-        """
-        Prepare an empty btrfs partition.
-        """
-        size = self.disk_size
-        with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), size * 1024)
-
-        label_str = ""
-        if self.label:
-            label_str = "-L %s" % self.label
-
-        mkfs_cmd = "mkfs.%s -b %d %s -U %s %s %s" % \
-                   (self.fstype, self.size * 1024, label_str, self.fsuuid,
-                    self.mkfs_extraopts, rootfs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
-
-    def prepare_empty_partition_msdos(self, rootfs, oe_builddir,
-                                      native_sysroot):
-        """
-        Prepare an empty vfat partition.
-        """
-        blocks = self.disk_size
-
-        label_str = "-n boot"
-        if self.label:
-            label_str = "-n %s" % self.label
-
-        size_str = ""
-        if self.fstype == 'msdos':
-            size_str = "-F 16" # FAT 16
-
-        extraopts = self.mkfs_extraopts or '-S 512'
-
-        dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
-                    (label_str, self.fsuuid, extraopts, size_str, rootfs,
-                     blocks)
-
-        exec_native_cmd(dosfs_cmd, native_sysroot)
-
-        chmod_cmd = "chmod 644 %s" % rootfs
-        exec_cmd(chmod_cmd)
-
-    prepare_empty_partition_vfat = prepare_empty_partition_msdos
-
-    def prepare_swap_partition(self, cr_workdir, oe_builddir, native_sysroot):
-        """
-        Prepare a swap partition.
-        """
-        path = "%s/fs.%s" % (cr_workdir, self.fstype)
-
-        with open(path, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), self.size * 1024)
-
-        label_str = ""
-        if self.label:
-            label_str = "-L %s" % self.label
-
-        mkswap_cmd = "mkswap %s -U %s %s" % (label_str, self.fsuuid, path)
-        exec_native_cmd(mkswap_cmd, native_sysroot)
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
deleted file mode 100644
index 686d2fe..0000000
--- a/scripts/lib/wic/pluginbase.py
+++ /dev/null
@@ -1,149 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2011 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-__all__ = ['ImagerPlugin', 'SourcePlugin']
-
-import os
-import logging
-
-from collections import defaultdict
-from importlib.machinery import SourceFileLoader
-
-from wic import WicError
-from wic.misc import get_bitbake_var
-
-PLUGIN_TYPES = ["imager", "source"]
-
-SCRIPTS_PLUGIN_DIR = "scripts/lib/wic/plugins"
-
-logger = logging.getLogger('wic')
-
-PLUGINS = defaultdict(dict)
-
-class PluginMgr:
-    _plugin_dirs = []
-
-    @classmethod
-    def get_plugins(cls, ptype):
-        """Get dictionary of <plugin_name>:<class> pairs."""
-        if ptype not in PLUGIN_TYPES:
-            raise WicError('%s is not valid plugin type' % ptype)
-
-        # collect plugin directories
-        if not cls._plugin_dirs:
-            cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
-            layers = get_bitbake_var("BBLAYERS") or ''
-            for layer_path in layers.split():
-                path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR)
-                path = os.path.abspath(os.path.expanduser(path))
-                if path not in cls._plugin_dirs and os.path.isdir(path):
-                    cls._plugin_dirs.insert(0, path)
-
-        if ptype not in PLUGINS:
-            # load all ptype plugins
-            for pdir in cls._plugin_dirs:
-                ppath = os.path.join(pdir, ptype)
-                if os.path.isdir(ppath):
-                    for fname in os.listdir(ppath):
-                        if fname.endswith('.py'):
-                            mname = fname[:-3]
-                            mpath = os.path.join(ppath, fname)
-                            logger.debug("loading plugin module %s", mpath)
-                            SourceFileLoader(mname, mpath).load_module()
-
-        return PLUGINS.get(ptype)
-
-class PluginMeta(type):
-    def __new__(cls, name, bases, attrs):
-        class_type = type.__new__(cls, name, bases, attrs)
-        if 'name' in attrs:
-            PLUGINS[class_type.wic_plugin_type][attrs['name']] = class_type
-
-        return class_type
-
-class ImagerPlugin(metaclass=PluginMeta):
-    wic_plugin_type = "imager"
-
-    def do_create(self):
-        raise WicError("Method %s.do_create is not implemented" %
-                       self.__class__.__name__)
-
-class SourcePlugin(metaclass=PluginMeta):
-    wic_plugin_type = "source"
-    """
-    The methods that can be implemented by --source plugins.
-
-    Any methods not implemented in a subclass inherit these.
-    """
-
-    @classmethod
-    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
-                        bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Called after all partitions have been prepared and assembled into a
-        disk image.  This provides a hook to allow finalization of a
-        disk image e.g. to write an MBR to it.
-        """
-        logger.debug("SourcePlugin: do_install_disk: disk: %s", disk_name)
-
-    @classmethod
-    def do_stage_partition(cls, part, source_params, creator, cr_workdir,
-                           oe_builddir, bootimg_dir, kernel_dir,
-                           native_sysroot):
-        """
-        Special content staging hook called before do_prepare_partition(),
-        normally empty.
-
-        Typically, a partition will just use the passed-in parame e.g
-        straight bootimg_dir, etc, but in some cases, things need to
-        be more tailored e.g. to use a deploy dir + /boot, etc.  This
-        hook allows those files to be staged in a customized fashion.
-        Not that get_bitbake_var() allows you to acces non-standard
-        variables that you might want to use for this.
-        """
-        logger.debug("SourcePlugin: do_stage_partition: part: %s", part)
-
-    @classmethod
-    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
-        """
-        Called before do_prepare_partition(), typically used to create
-        custom configuration files for a partition, for example
-        syslinux or grub config files.
-        """
-        logger.debug("SourcePlugin: do_configure_partition: part: %s", part)
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir, rootfs_dir,
-                             native_sysroot):
-        """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        """
-        logger.debug("SourcePlugin: do_prepare_partition: part: %s", part)
-
-    @classmethod
-    def do_post_partition(cls, part, source_params, creator, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir, rootfs_dir,
-                             native_sysroot):
-        """
-        Called after the partition is created. It is useful to add post
-        operations e.g. security signing the partition.
-        """
-        logger.debug("SourcePlugin: do_post_partition: part: %s", part)
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
deleted file mode 100644
index 81583e9..0000000
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ /dev/null
@@ -1,611 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-# This implements the 'direct' imager plugin class for 'wic'
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-#
-
-import logging
-import os
-import random
-import shutil
-import tempfile
-import uuid
-
-from time import strftime
-
-from oe.path import copyhardlinktree
-
-from wic import WicError
-from wic.filemap import sparse_copy
-from wic.ksparser import KickStart, KickStartError
-from wic.pluginbase import PluginMgr, ImagerPlugin
-from wic.misc import get_bitbake_var, exec_cmd, exec_native_cmd
-
-logger = logging.getLogger('wic')
-
-class DirectPlugin(ImagerPlugin):
-    """
-    Install a system into a file containing a partitioned disk image.
-
-    An image file is formatted with a partition table, each partition
-    created from a rootfs or other OpenEmbedded build artifact and dd'ed
-    into the virtual disk. The disk image can subsequently be dd'ed onto
-    media and used on actual hardware.
-    """
-    name = 'direct'
-
-    def __init__(self, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-                 native_sysroot, oe_builddir, options):
-        try:
-            self.ks = KickStart(wks_file)
-        except KickStartError as err:
-            raise WicError(str(err))
-
-        # parse possible 'rootfs=name' items
-        self.rootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
-        self.replaced_rootfs_paths = {}
-        self.bootimg_dir = bootimg_dir
-        self.kernel_dir = kernel_dir
-        self.native_sysroot = native_sysroot
-        self.oe_builddir = oe_builddir
-
-        self.outdir = options.outdir
-        self.compressor = options.compressor
-        self.bmap = options.bmap
-        self.no_fstab_update = options.no_fstab_update
-
-        self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
-                               strftime("%Y%m%d%H%M"))
-        self.workdir = tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
-        self._image = None
-        self.ptable_format = self.ks.bootloader.ptable
-        self.parts = self.ks.partitions
-
-        # as a convenience, set source to the boot partition source
-        # instead of forcing it to be set via bootloader --source
-        for part in self.parts:
-            if not self.ks.bootloader.source and part.mountpoint == "/boot":
-                self.ks.bootloader.source = part.source
-                break
-
-        image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
-        self._image = PartitionedImage(image_path, self.ptable_format,
-                                       self.parts, self.native_sysroot)
-
-    def do_create(self):
-        """
-        Plugin entry point.
-        """
-        try:
-            self.create()
-            self.assemble()
-            self.finalize()
-            self.print_info()
-        finally:
-            self.cleanup()
-
-    def _write_fstab(self, image_rootfs):
-        """overriden to generate fstab (temporarily) in rootfs. This is called
-        from _create, make sure it doesn't get called from
-        BaseImage.create()
-        """
-        if not image_rootfs:
-            return
-
-        fstab_path = image_rootfs + "/etc/fstab"
-        if not os.path.isfile(fstab_path):
-            return
-
-        with open(fstab_path) as fstab:
-            fstab_lines = fstab.readlines()
-
-        if self._update_fstab(fstab_lines, self.parts):
-            # copy rootfs dir to workdir to update fstab
-            # as rootfs can be used by other tasks and can't be modified
-            new_pseudo = os.path.realpath(os.path.join(self.workdir, "pseudo"))
-            from_dir = os.path.join(os.path.join(image_rootfs, ".."), "pseudo")
-            from_dir = os.path.realpath(from_dir)
-            copyhardlinktree(from_dir, new_pseudo)
-            new_rootfs = os.path.realpath(os.path.join(self.workdir, "rootfs_copy"))
-            copyhardlinktree(image_rootfs, new_rootfs)
-            fstab_path = os.path.join(new_rootfs, 'etc/fstab')
-
-            os.unlink(fstab_path)
-
-            with open(fstab_path, "w") as fstab:
-                fstab.writelines(fstab_lines)
-
-            return new_rootfs
-
-    def _update_fstab(self, fstab_lines, parts):
-        """Assume partition order same as in wks"""
-        updated = False
-        for part in parts:
-            if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/":
-                continue
-
-            if part.use_uuid:
-                if part.fsuuid:
-                    # FAT UUID is different from others
-                    if len(part.fsuuid) == 10:
-                        device_name = "UUID=%s-%s" % \
-                                       (part.fsuuid[2:6], part.fsuuid[6:])
-                    else:
-                        device_name = "UUID=%s" % part.fsuuid
-                else:
-                    device_name = "PARTUUID=%s" % part.uuid
-            else:
-                # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-                prefix = 'p' if  part.disk.startswith('mmcblk') else ''
-                device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
-
-            opts = part.fsopts if part.fsopts else "defaults"
-            line = "\t".join([device_name, part.mountpoint, part.fstype,
-                              opts, "0", "0"]) + "\n"
-
-            fstab_lines.append(line)
-            updated = True
-
-        return updated
-
-    def _full_path(self, path, name, extention):
-        """ Construct full file path to a file we generate. """
-        return os.path.join(path, "%s-%s.%s" % (self.name, name, extention))
-
-    #
-    # Actual implemention
-    #
-    def create(self):
-        """
-        For 'wic', we already have our build artifacts - we just create
-        filesystems from the artifacts directly and combine them into
-        a partitioned image.
-        """
-        if self.no_fstab_update:
-            new_rootfs = None
-        else:
-            new_rootfs = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
-        if new_rootfs:
-            # rootfs was copied to update fstab
-            self.replaced_rootfs_paths[new_rootfs] = self.rootfs_dir['ROOTFS_DIR']
-            self.rootfs_dir['ROOTFS_DIR'] = new_rootfs
-
-        for part in self.parts:
-            # get rootfs size from bitbake variable if it's not set in .ks file
-            if not part.size:
-                # and if rootfs name is specified for the partition
-                image_name = self.rootfs_dir.get(part.rootfs_dir)
-                if image_name and os.path.sep not in image_name:
-                    # Bitbake variable ROOTFS_SIZE is calculated in
-                    # Image._get_rootfs_size method from meta/lib/oe/image.py
-                    # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
-                    # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
-                    rsize_bb = get_bitbake_var('ROOTFS_SIZE', image_name)
-                    if rsize_bb:
-                        part.size = int(round(float(rsize_bb)))
-
-        self._image.prepare(self)
-        self._image.layout_partitions()
-        self._image.create()
-
-    def assemble(self):
-        """
-        Assemble partitions into disk image
-        """
-        self._image.assemble()
-
-    def finalize(self):
-        """
-        Finalize the disk image.
-
-        For example, prepare the image to be bootable by e.g.
-        creating and installing a bootloader configuration.
-        """
-        source_plugin = self.ks.bootloader.source
-        disk_name = self.parts[0].disk
-        if source_plugin:
-            plugin = PluginMgr.get_plugins('source')[source_plugin]
-            plugin.do_install_disk(self._image, disk_name, self, self.workdir,
-                                   self.oe_builddir, self.bootimg_dir,
-                                   self.kernel_dir, self.native_sysroot)
-
-        full_path = self._image.path
-        # Generate .bmap
-        if self.bmap:
-            logger.debug("Generating bmap file for %s", disk_name)
-            python = os.path.join(self.native_sysroot, 'usr/bin/python3-native/python3')
-            bmaptool = os.path.join(self.native_sysroot, 'usr/bin/bmaptool')
-            exec_native_cmd("%s %s create %s -o %s.bmap" % \
-                            (python, bmaptool, full_path, full_path), self.native_sysroot)
-        # Compress the image
-        if self.compressor:
-            logger.debug("Compressing disk %s with %s", disk_name, self.compressor)
-            exec_cmd("%s %s" % (self.compressor, full_path))
-
-    def print_info(self):
-        """
-        Print the image(s) and artifacts used, for the user.
-        """
-        msg = "The new image(s) can be found here:\n"
-
-        extension = "direct" + {"gzip": ".gz",
-                                "bzip2": ".bz2",
-                                "xz": ".xz",
-                                None: ""}.get(self.compressor)
-        full_path = self._full_path(self.outdir, self.parts[0].disk, extension)
-        msg += '  %s\n\n' % full_path
-
-        msg += 'The following build artifacts were used to create the image(s):\n'
-        for part in self.parts:
-            if part.rootfs_dir is None:
-                continue
-            if part.mountpoint == '/':
-                suffix = ':'
-            else:
-                suffix = '["%s"]:' % (part.mountpoint or part.label)
-            rootdir = part.rootfs_dir
-            if rootdir in self.replaced_rootfs_paths:
-                rootdir = self.replaced_rootfs_paths[rootdir]
-            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), rootdir)
-
-        msg += '  BOOTIMG_DIR:                  %s\n' % self.bootimg_dir
-        msg += '  KERNEL_DIR:                   %s\n' % self.kernel_dir
-        msg += '  NATIVE_SYSROOT:               %s\n' % self.native_sysroot
-
-        logger.info(msg)
-
-    @property
-    def rootdev(self):
-        """
-        Get root device name to use as a 'root' parameter
-        in kernel command line.
-
-        Assume partition order same as in wks
-        """
-        for part in self.parts:
-            if part.mountpoint == "/":
-                if part.uuid:
-                    return "PARTUUID=%s" % part.uuid
-                else:
-                    suffix = 'p' if part.disk.startswith('mmcblk') else ''
-                    return "/dev/%s%s%-d" % (part.disk, suffix, part.realnum)
-
-    def cleanup(self):
-        if self._image:
-            self._image.cleanup()
-
-        # Move results to the output dir
-        if not os.path.exists(self.outdir):
-            os.makedirs(self.outdir)
-
-        for fname in os.listdir(self.workdir):
-            path = os.path.join(self.workdir, fname)
-            if os.path.isfile(path):
-                shutil.move(path, os.path.join(self.outdir, fname))
-
-        # remove work directory
-        shutil.rmtree(self.workdir, ignore_errors=True)
-
-# Overhead of the MBR partitioning scheme (just one sector)
-MBR_OVERHEAD = 1
-
-# Overhead of the GPT partitioning scheme
-GPT_OVERHEAD = 34
-
-# Size of a sector in bytes
-SECTOR_SIZE = 512
-
-class PartitionedImage():
-    """
-    Partitioned image in a file.
-    """
-
-    def __init__(self, path, ptable_format, partitions, native_sysroot=None):
-        self.path = path  # Path to the image file
-        self.numpart = 0  # Number of allocated partitions
-        self.realpart = 0 # Number of partitions in the partition table
-        self.offset = 0   # Offset of next partition (in sectors)
-        self.min_size = 0 # Minimum required disk size to fit
-                          # all partitions (in bytes)
-        self.ptable_format = ptable_format  # Partition table format
-        # Disk system identifier
-        self.identifier = random.SystemRandom().randint(1, 0xffffffff)
-
-        self.partitions = partitions
-        self.partimages = []
-        # Size of a sector used in calculations
-        self.sector_size = SECTOR_SIZE
-        self.native_sysroot = native_sysroot
-
-        # calculate the real partition number, accounting for partitions not
-        # in the partition table and logical partitions
-        realnum = 0
-        for part in self.partitions:
-            if part.no_table:
-                part.realnum = 0
-            else:
-                realnum += 1
-                if self.ptable_format == 'msdos' and realnum > 3 and len(partitions) > 4:
-                    part.realnum = realnum + 1
-                    continue
-                part.realnum = realnum
-
-        # generate parition and filesystem UUIDs
-        for part in self.partitions:
-            if not part.uuid and part.use_uuid:
-                if self.ptable_format == 'gpt':
-                    part.uuid = str(uuid.uuid4())
-                else: # msdos partition table
-                    part.uuid = '%08x-%02d' % (self.identifier, part.realnum)
-            if not part.fsuuid:
-                if part.fstype == 'vfat' or part.fstype == 'msdos':
-                    part.fsuuid = '0x' + str(uuid.uuid4())[:8].upper()
-                else:
-                    part.fsuuid = str(uuid.uuid4())
-
-    def prepare(self, imager):
-        """Prepare an image. Call prepare method of all image partitions."""
-        for part in self.partitions:
-            # need to create the filesystems in order to get their
-            # sizes before we can add them and do the layout.
-            part.prepare(imager, imager.workdir, imager.oe_builddir,
-                         imager.rootfs_dir, imager.bootimg_dir,
-                         imager.kernel_dir, imager.native_sysroot)
-
-            # Converting kB to sectors for parted
-            part.size_sec = part.disk_size * 1024 // self.sector_size
-
-    def layout_partitions(self):
-        """ Layout the partitions, meaning calculate the position of every
-        partition on the disk. The 'ptable_format' parameter defines the
-        partition table format and may be "msdos". """
-
-        logger.debug("Assigning %s partitions to disks", self.ptable_format)
-
-        # The number of primary and logical partitions. Extended partition and
-        # partitions not listed in the table are not included.
-        num_real_partitions = len([p for p in self.partitions if not p.no_table])
-
-        # Go through partitions in the order they are added in .ks file
-        for num in range(len(self.partitions)):
-            part = self.partitions[num]
-
-            if self.ptable_format == 'msdos' and part.part_name:
-                raise WicError("setting custom partition name is not " \
-                               "implemented for msdos partitions")
-
-            if self.ptable_format == 'msdos' and part.part_type:
-                # The --part-type can also be implemented for MBR partitions,
-                # in which case it would map to the 1-byte "partition type"
-                # filed at offset 3 of the partition entry.
-                raise WicError("setting custom partition type is not " \
-                               "implemented for msdos partitions")
-
-            # Get the disk where the partition is located
-            self.numpart += 1
-            if not part.no_table:
-                self.realpart += 1
-
-            if self.numpart == 1:
-                if self.ptable_format == "msdos":
-                    overhead = MBR_OVERHEAD
-                elif self.ptable_format == "gpt":
-                    overhead = GPT_OVERHEAD
-
-                # Skip one sector required for the partitioning scheme overhead
-                self.offset += overhead
-
-            if self.realpart > 3 and num_real_partitions > 4:
-                # Reserve a sector for EBR for every logical partition
-                # before alignment is performed.
-                if self.ptable_format == "msdos":
-                    self.offset += 1
-
-            if part.align:
-                # If not first partition and we do have alignment set we need
-                # to align the partition.
-                # FIXME: This leaves a empty spaces to the disk. To fill the
-                # gaps we could enlargea the previous partition?
-
-                # Calc how much the alignment is off.
-                align_sectors = self.offset % (part.align * 1024 // self.sector_size)
-
-                if align_sectors:
-                    # If partition is not aligned as required, we need
-                    # to move forward to the next alignment point
-                    align_sectors = (part.align * 1024 // self.sector_size) - align_sectors
-
-                    logger.debug("Realignment for %s%s with %s sectors, original"
-                                 " offset %s, target alignment is %sK.",
-                                 part.disk, self.numpart, align_sectors,
-                                 self.offset, part.align)
-
-                    # increase the offset so we actually start the partition on right alignment
-                    self.offset += align_sectors
-
-            part.start = self.offset
-            self.offset += part.size_sec
-
-            part.type = 'primary'
-            if not part.no_table:
-                part.num = self.realpart
-            else:
-                part.num = 0
-
-            if self.ptable_format == "msdos":
-                # only count the partitions that are in partition table
-                if num_real_partitions > 4:
-                    if self.realpart > 3:
-                        part.type = 'logical'
-                        part.num = self.realpart + 1
-
-            logger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
-                         "sectors (%d bytes).", part.mountpoint, part.disk,
-                         part.num, part.start, self.offset - 1, part.size_sec,
-                         part.size_sec * self.sector_size)
-
-        # Once all the partitions have been layed out, we can calculate the
-        # minumim disk size
-        self.min_size = self.offset
-        if self.ptable_format == "gpt":
-            self.min_size += GPT_OVERHEAD
-
-        self.min_size *= self.sector_size
-
-    def _create_partition(self, device, parttype, fstype, start, size):
-        """ Create a partition on an image described by the 'device' object. """
-
-        # Start is included to the size so we need to substract one from the end.
-        end = start + size - 1
-        logger.debug("Added '%s' partition, sectors %d-%d, size %d sectors",
-                     parttype, start, end, size)
-
-        cmd = "parted -s %s unit s mkpart %s" % (device, parttype)
-        if fstype:
-            cmd += " %s" % fstype
-        cmd += " %d %d" % (start, end)
-
-        return exec_native_cmd(cmd, self.native_sysroot)
-
-    def create(self):
-        logger.debug("Creating sparse file %s", self.path)
-        with open(self.path, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), self.min_size)
-
-        logger.debug("Initializing partition table for %s", self.path)
-        exec_native_cmd("parted -s %s mklabel %s" %
-                        (self.path, self.ptable_format), self.native_sysroot)
-
-        logger.debug("Set disk identifier %x", self.identifier)
-        with open(self.path, 'r+b') as img:
-            img.seek(0x1B8)
-            img.write(self.identifier.to_bytes(4, 'little'))
-
-        logger.debug("Creating partitions")
-
-        for part in self.partitions:
-            if part.num == 0:
-                continue
-
-            if self.ptable_format == "msdos" and part.num == 5:
-                # Create an extended partition (note: extended
-                # partition is described in MBR and contains all
-                # logical partitions). The logical partitions save a
-                # sector for an EBR just before the start of a
-                # partition. The extended partition must start one
-                # sector before the start of the first logical
-                # partition. This way the first EBR is inside of the
-                # extended partition. Since the extended partitions
-                # starts a sector before the first logical partition,
-                # add a sector at the back, so that there is enough
-                # room for all logical partitions.
-                self._create_partition(self.path, "extended",
-                                       None, part.start - 1,
-                                       self.offset - part.start + 1)
-
-            if part.fstype == "swap":
-                parted_fs_type = "linux-swap"
-            elif part.fstype == "vfat":
-                parted_fs_type = "fat32"
-            elif part.fstype == "msdos":
-                parted_fs_type = "fat16"
-                if not part.system_id:
-                    part.system_id = '0x6' # FAT16
-            else:
-                # Type for ext2/ext3/ext4/btrfs
-                parted_fs_type = "ext2"
-
-            # Boot ROM of OMAP boards require vfat boot partition to have an
-            # even number of sectors.
-            if part.mountpoint == "/boot" and part.fstype in ["vfat", "msdos"] \
-               and part.size_sec % 2:
-                logger.debug("Subtracting one sector from '%s' partition to "
-                             "get even number of sectors for the partition",
-                             part.mountpoint)
-                part.size_sec -= 1
-
-            self._create_partition(self.path, part.type,
-                                   parted_fs_type, part.start, part.size_sec)
-
-            if part.part_name:
-                logger.debug("partition %d: set name to %s",
-                             part.num, part.part_name)
-                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
-                                         (part.num, part.part_name,
-                                          self.path), self.native_sysroot)
-
-            if part.part_type:
-                logger.debug("partition %d: set type UID to %s",
-                             part.num, part.part_type)
-                exec_native_cmd("sgdisk --typecode=%d:%s %s" % \
-                                         (part.num, part.part_type,
-                                          self.path), self.native_sysroot)
-
-            if part.uuid and self.ptable_format == "gpt":
-                logger.debug("partition %d: set UUID to %s",
-                             part.num, part.uuid)
-                exec_native_cmd("sgdisk --partition-guid=%d:%s %s" % \
-                                (part.num, part.uuid, self.path),
-                                self.native_sysroot)
-
-            if part.label and self.ptable_format == "gpt":
-                logger.debug("partition %d: set name to %s",
-                             part.num, part.label)
-                exec_native_cmd("parted -s %s name %d %s" % \
-                                (self.path, part.num, part.label),
-                                self.native_sysroot)
-
-            if part.active:
-                flag_name = "legacy_boot" if self.ptable_format == 'gpt' else "boot"
-                logger.debug("Set '%s' flag for partition '%s' on disk '%s'",
-                             flag_name, part.num, self.path)
-                exec_native_cmd("parted -s %s set %d %s on" % \
-                                (self.path, part.num, flag_name),
-                                self.native_sysroot)
-            if part.system_id:
-                exec_native_cmd("sfdisk --part-type %s %s %s" % \
-                                (self.path, part.num, part.system_id),
-                                self.native_sysroot)
-
-    def cleanup(self):
-        # remove partition images
-        for image in set(self.partimages):
-            os.remove(image)
-
-    def assemble(self):
-        logger.debug("Installing partitions")
-
-        for part in self.partitions:
-            source = part.source_file
-            if source:
-                # install source_file contents into a partition
-                sparse_copy(source, self.path, seek=part.start * self.sector_size)
-
-                logger.debug("Installed %s in partition %d, sectors %d-%d, "
-                             "size %d sectors", source, part.num, part.start,
-                             part.start + part.size_sec - 1, part.size_sec)
-
-                partimage = self.path + '.p%d' % part.num
-                os.rename(source, partimage)
-                self.partimages.append(partimage)
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
deleted file mode 100644
index 0eb86a0..0000000
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ /dev/null
@@ -1,274 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2014, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-# This implements the 'bootimg-efi' source plugin class for 'wic'
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-#
-
-import logging
-import os
-import shutil
-
-from wic import WicError
-from wic.engine import get_custom_config
-from wic.pluginbase import SourcePlugin
-from wic.misc import (exec_cmd, exec_native_cmd,
-                      get_bitbake_var, BOOTDD_EXTRA_SPACE)
-
-logger = logging.getLogger('wic')
-
-class BootimgEFIPlugin(SourcePlugin):
-    """
-    Create EFI boot partition.
-    This plugin supports GRUB 2 and systemd-boot bootloaders.
-    """
-
-    name = 'bootimg-efi'
-
-    @classmethod
-    def do_configure_grubefi(cls, hdddir, creator, cr_workdir, source_params):
-        """
-        Create loader-specific (grub-efi) config
-        """
-        configfile = creator.ks.bootloader.configfile
-        custom_cfg = None
-        if configfile:
-            custom_cfg = get_custom_config(configfile)
-            if custom_cfg:
-                # Use a custom configuration for grub
-                grubefi_conf = custom_cfg
-                logger.debug("Using custom configuration file "
-                             "%s for grub.cfg", configfile)
-            else:
-                raise WicError("configfile is specified but failed to "
-                               "get it from %s." % configfile)
-
-        initrd = source_params.get('initrd')
-
-        if initrd:
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not bootimg_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-
-            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
-            exec_cmd(cp_cmd, True)
-        else:
-            logger.debug("Ignoring missing initrd")
-
-        if not custom_cfg:
-            # Create grub configuration using parameters from wks file
-            bootloader = creator.ks.bootloader
-
-            grubefi_conf = ""
-            grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
-            grubefi_conf += "default=boot\n"
-            grubefi_conf += "timeout=%s\n" % bootloader.timeout
-            grubefi_conf += "menuentry 'boot'{\n"
-
-            kernel = "/bzImage"
-
-            grubefi_conf += "linux %s root=%s rootwait %s\n" \
-                % (kernel, creator.rootdev, bootloader.append)
-
-            if initrd:
-               grubefi_conf += "initrd /%s\n" % initrd
-
-            grubefi_conf += "}\n"
-
-        logger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg",
-                     cr_workdir)
-        cfg = open("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir, "w")
-        cfg.write(grubefi_conf)
-        cfg.close()
-
-    @classmethod
-    def do_configure_systemdboot(cls, hdddir, creator, cr_workdir, source_params):
-        """
-        Create loader-specific systemd-boot/gummiboot config
-        """
-        install_cmd = "install -d %s/loader" % hdddir
-        exec_cmd(install_cmd)
-
-        install_cmd = "install -d %s/loader/entries" % hdddir
-        exec_cmd(install_cmd)
-
-        bootloader = creator.ks.bootloader
-
-        loader_conf = ""
-        loader_conf += "default boot\n"
-        loader_conf += "timeout %d\n" % bootloader.timeout
-
-        initrd = source_params.get('initrd')
-
-        if initrd:
-            # obviously we need to have a common common deploy var
-            bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not bootimg_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-
-            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
-            exec_cmd(cp_cmd, True)
-        else:
-            logger.debug("Ignoring missing initrd")
-
-        logger.debug("Writing systemd-boot config "
-                     "%s/hdd/boot/loader/loader.conf", cr_workdir)
-        cfg = open("%s/hdd/boot/loader/loader.conf" % cr_workdir, "w")
-        cfg.write(loader_conf)
-        cfg.close()
-
-        configfile = creator.ks.bootloader.configfile
-        custom_cfg = None
-        if configfile:
-            custom_cfg = get_custom_config(configfile)
-            if custom_cfg:
-                # Use a custom configuration for systemd-boot
-                boot_conf = custom_cfg
-                logger.debug("Using custom configuration file "
-                             "%s for systemd-boots's boot.conf", configfile)
-            else:
-                raise WicError("configfile is specified but failed to "
-                               "get it from %s.", configfile)
-
-        if not custom_cfg:
-            # Create systemd-boot configuration using parameters from wks file
-            kernel = "/bzImage"
-
-            boot_conf = ""
-            boot_conf += "title boot\n"
-            boot_conf += "linux %s\n" % kernel
-            boot_conf += "options LABEL=Boot root=%s %s\n" % \
-                             (creator.rootdev, bootloader.append)
-
-            if initrd:
-                boot_conf += "initrd /%s\n" % initrd
-
-        logger.debug("Writing systemd-boot config "
-                     "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
-        cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
-        cfg.write(boot_conf)
-        cfg.close()
-
-
-    @classmethod
-    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
-        """
-        Called before do_prepare_partition(), creates loader-specific config
-        """
-        hdddir = "%s/hdd/boot" % cr_workdir
-
-        install_cmd = "install -d %s/EFI/BOOT" % hdddir
-        exec_cmd(install_cmd)
-
-        try:
-            if source_params['loader'] == 'grub-efi':
-                cls.do_configure_grubefi(hdddir, creator, cr_workdir, source_params)
-            elif source_params['loader'] == 'systemd-boot':
-                cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
-            else:
-                raise WicError("unrecognized bootimg-efi loader: %s" % source_params['loader'])
-        except KeyError:
-            raise WicError("bootimg-efi requires a loader, none specified")
-
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
-        """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        In this case, prepare content for an EFI (grub) boot partition.
-        """
-        if not kernel_dir:
-            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not kernel_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-
-        staging_kernel_dir = kernel_dir
-
-        hdddir = "%s/hdd/boot" % cr_workdir
-
-        install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
-            (staging_kernel_dir, hdddir)
-        exec_cmd(install_cmd)
-
-
-        try:
-            if source_params['loader'] == 'grub-efi':
-                shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
-                                "%s/grub.cfg" % cr_workdir)
-                for mod in [x for x in os.listdir(kernel_dir) if x.startswith("grub-efi-")]:
-                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[9:])
-                    exec_cmd(cp_cmd, True)
-                shutil.move("%s/grub.cfg" % cr_workdir,
-                            "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
-            elif source_params['loader'] == 'systemd-boot':
-                for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
-                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
-                    exec_cmd(cp_cmd, True)
-            else:
-                raise WicError("unrecognized bootimg-efi loader: %s" %
-                               source_params['loader'])
-        except KeyError:
-            raise WicError("bootimg-efi requires a loader, none specified")
-
-        startup = os.path.join(kernel_dir, "startup.nsh")
-        if os.path.exists(startup):
-            cp_cmd = "cp %s %s/" % (startup, hdddir)
-            exec_cmd(cp_cmd, True)
-
-        du_cmd = "du -bks %s" % hdddir
-        out = exec_cmd(du_cmd)
-        blocks = int(out.split()[0])
-
-        extra_blocks = part.get_extra_block_count(blocks)
-
-        if extra_blocks < BOOTDD_EXTRA_SPACE:
-            extra_blocks = BOOTDD_EXTRA_SPACE
-
-        blocks += extra_blocks
-
-        logger.debug("Added %d extra blocks to %s to get to %d total blocks",
-                     extra_blocks, part.mountpoint, blocks)
-
-        # dosfs image, created by mkdosfs
-        bootimg = "%s/boot.img" % cr_workdir
-
-        dosfs_cmd = "mkdosfs -n efi -i %s -C %s %d" % \
-                    (part.fsuuid, bootimg, blocks)
-        exec_native_cmd(dosfs_cmd, native_sysroot)
-
-        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-        exec_native_cmd(mcopy_cmd, native_sysroot)
-
-        chmod_cmd = "chmod 644 %s" % bootimg
-        exec_cmd(chmod_cmd)
-
-        du_cmd = "du -Lbks %s" % bootimg
-        out = exec_cmd(du_cmd)
-        bootimg_size = out.split()[0]
-
-        part.size = int(bootimg_size)
-        part.source_file = bootimg
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
deleted file mode 100644
index ddc880b..0000000
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ /dev/null
@@ -1,207 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-# This implements the 'bootimg-partition' source plugin class for
-# 'wic'. The plugin creates an image of boot partition, copying over
-# files listed in IMAGE_BOOT_FILES bitbake variable.
-#
-# AUTHORS
-# Maciej Borzecki <maciej.borzecki (at] open-rnd.pl>
-#
-
-import logging
-import os
-import re
-
-from glob import glob
-
-from wic import WicError
-from wic.engine import get_custom_config
-from wic.pluginbase import SourcePlugin
-from wic.misc import exec_cmd, get_bitbake_var
-
-logger = logging.getLogger('wic')
-
-class BootimgPartitionPlugin(SourcePlugin):
-    """
-    Create an image of boot partition, copying over files
-    listed in IMAGE_BOOT_FILES bitbake variable.
-    """
-
-    name = 'bootimg-partition'
-
-    @classmethod
-    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             native_sysroot):
-        """
-        Called before do_prepare_partition(), create u-boot specific boot config
-        """
-        hdddir = "%s/boot.%d" % (cr_workdir, part.lineno)
-        install_cmd = "install -d %s" % hdddir
-        exec_cmd(install_cmd)
-
-        if not kernel_dir:
-            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not kernel_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-
-        boot_files = None
-        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s", part.label), (None, None)):
-            if fmt:
-                var = fmt % id
-            else:
-                var = ""
-
-            boot_files = get_bitbake_var("IMAGE_BOOT_FILES" + var)
-            if boot_files is not None:
-                break
-
-        if boot_files is None:
-            raise WicError('No boot files defined, IMAGE_BOOT_FILES unset for entry #%d' % part.lineno)
-
-        logger.debug('Boot files: %s', boot_files)
-
-        # list of tuples (src_name, dst_name)
-        deploy_files = []
-        for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
-            if ';' in src_entry:
-                dst_entry = tuple(src_entry.split(';'))
-                if not dst_entry[0] or not dst_entry[1]:
-                    raise WicError('Malformed boot file entry: %s' % src_entry)
-            else:
-                dst_entry = (src_entry, src_entry)
-
-            logger.debug('Destination entry: %r', dst_entry)
-            deploy_files.append(dst_entry)
-
-        cls.install_task = [];
-        for deploy_entry in deploy_files:
-            src, dst = deploy_entry
-            if '*' in src:
-                # by default install files under their basename
-                entry_name_fn = os.path.basename
-                if dst != src:
-                    # unless a target name was given, then treat name
-                    # as a directory and append a basename
-                    entry_name_fn = lambda name: \
-                                    os.path.join(dst,
-                                                 os.path.basename(name))
-
-                srcs = glob(os.path.join(kernel_dir, src))
-
-                logger.debug('Globbed sources: %s', ', '.join(srcs))
-                for entry in srcs:
-                    src = os.path.relpath(entry, kernel_dir)
-                    entry_dst_name = entry_name_fn(entry)
-                    cls.install_task.append((src, entry_dst_name))
-            else:
-                cls.install_task.append((src, dst))
-
-        if source_params.get('loader') != "u-boot":
-            return
-
-        configfile = cr.ks.bootloader.configfile
-        custom_cfg = None
-        if configfile:
-            custom_cfg = get_custom_config(configfile)
-            if custom_cfg:
-                # Use a custom configuration for extlinux.conf
-                extlinux_conf = custom_cfg
-                logger.debug("Using custom configuration file "
-                             "%s for extlinux.cfg", configfile)
-            else:
-                raise WicError("configfile is specified but failed to "
-                               "get it from %s." % configfile)
-
-        if not custom_cfg:
-            # The kernel types supported by the sysboot of u-boot
-            kernel_types = ["zImage", "Image", "fitImage", "uImage", "vmlinux"]
-            has_dtb = False
-            fdt_dir = '/'
-            kernel_name = None
-
-            # Find the kernel image name, from the highest precedence to lowest
-            for image in kernel_types:
-                for task in cls.install_task:
-                    src, dst = task
-                    if re.match(image, src):
-                        kernel_name = os.path.join('/', dst)
-                        break
-                if kernel_name:
-                    break
-
-            for task in cls.install_task:
-                src, dst = task
-                # We suppose that all the dtb are in the same directory
-                if re.search(r'\.dtb', src) and fdt_dir == '/':
-                    has_dtb = True
-                    fdt_dir = os.path.join(fdt_dir, os.path.dirname(dst))
-                    break
-
-            if not kernel_name:
-                raise WicError('No kernel file founded')
-
-            # Compose the extlinux.conf
-            extlinux_conf = "default Yocto\n"
-            extlinux_conf += "label Yocto\n"
-            extlinux_conf += "   kernel %s\n" % kernel_name
-            if has_dtb:
-                extlinux_conf += "   fdtdir %s\n" % fdt_dir
-            bootloader = cr.ks.bootloader
-            extlinux_conf += "append root=%s rootwait %s\n" \
-                             % (cr.rootdev, bootloader.append if bootloader.append else '')
-
-        install_cmd = "install -d %s/extlinux/" % hdddir
-        exec_cmd(install_cmd)
-        cfg = open("%s/extlinux/extlinux.conf" % hdddir, "w")
-        cfg.write(extlinux_conf)
-        cfg.close()
-
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
-        """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        In this case, does the following:
-        - sets up a vfat partition
-        - copies all files listed in IMAGE_BOOT_FILES variable
-        """
-        hdddir = "%s/boot.%d" % (cr_workdir, part.lineno)
-
-        if not kernel_dir:
-            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not kernel_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-
-        logger.debug('Kernel dir: %s', bootimg_dir)
-
-
-        for task in cls.install_task:
-            src_path, dst_path = task
-            logger.debug('Install %s as %s', src_path, dst_path)
-            install_cmd = "install -m 0644 -D %s %s" \
-                          % (os.path.join(kernel_dir, src_path),
-                             os.path.join(hdddir, dst_path))
-            exec_cmd(install_cmd)
-
-        logger.debug('Prepare boot partition using rootfs in %s', hdddir)
-        part.prepare_rootfs(cr_workdir, oe_builddir, hdddir,
-                            native_sysroot, False)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
deleted file mode 100644
index d599112..0000000
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ /dev/null
@@ -1,207 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2014, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-# This implements the 'bootimg-pcbios' source plugin class for 'wic'
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-#
-
-import logging
-import os
-
-from wic import WicError
-from wic.engine import get_custom_config
-from wic.pluginbase import SourcePlugin
-from wic.misc import (exec_cmd, exec_native_cmd,
-                      get_bitbake_var, BOOTDD_EXTRA_SPACE)
-
-logger = logging.getLogger('wic')
-
-class BootimgPcbiosPlugin(SourcePlugin):
-    """
-    Create MBR boot partition and install syslinux on it.
-    """
-
-    name = 'bootimg-pcbios'
-
-    @classmethod
-    def _get_bootimg_dir(cls, bootimg_dir, dirname):
-        """
-        Check if dirname exists in default bootimg_dir or in STAGING_DIR.
-        """
-        for result in (bootimg_dir, get_bitbake_var("STAGING_DATADIR")):
-            if os.path.exists("%s/%s" % (result, dirname)):
-                return result
-
-        raise WicError("Couldn't find correct bootimg_dir, exiting")
-
-    @classmethod
-    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
-                        bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Called after all partitions have been prepared and assembled into a
-        disk image.  In this case, we install the MBR.
-        """
-        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
-        mbrfile = "%s/syslinux/" % bootimg_dir
-        if creator.ptable_format == 'msdos':
-            mbrfile += "mbr.bin"
-        elif creator.ptable_format == 'gpt':
-            mbrfile += "gptmbr.bin"
-        else:
-            raise WicError("Unsupported partition table: %s" %
-                           creator.ptable_format)
-
-        if not os.path.exists(mbrfile):
-            raise WicError("Couldn't find %s.  If using the -e option, do you "
-                           "have the right MACHINE set in local.conf?  If not, "
-                           "is the bootimg_dir path correct?" % mbrfile)
-
-        full_path = creator._full_path(workdir, disk_name, "direct")
-        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
-                     disk_name, full_path, disk.min_size)
-
-        dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
-        exec_cmd(dd_cmd, native_sysroot)
-
-    @classmethod
-    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
-        """
-        Called before do_prepare_partition(), creates syslinux config
-        """
-        hdddir = "%s/hdd/boot" % cr_workdir
-
-        install_cmd = "install -d %s" % hdddir
-        exec_cmd(install_cmd)
-
-        bootloader = creator.ks.bootloader
-
-        custom_cfg = None
-        if bootloader.configfile:
-            custom_cfg = get_custom_config(bootloader.configfile)
-            if custom_cfg:
-                # Use a custom configuration for grub
-                syslinux_conf = custom_cfg
-                logger.debug("Using custom configuration file %s "
-                             "for syslinux.cfg", bootloader.configfile)
-            else:
-                raise WicError("configfile is specified but failed to "
-                               "get it from %s." % bootloader.configfile)
-
-        if not custom_cfg:
-            # Create syslinux configuration using parameters from wks file
-            splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
-            if os.path.exists(splash):
-                splashline = "menu background splash.jpg"
-            else:
-                splashline = ""
-
-            syslinux_conf = ""
-            syslinux_conf += "PROMPT 0\n"
-            syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
-            syslinux_conf += "\n"
-            syslinux_conf += "ALLOWOPTIONS 1\n"
-            syslinux_conf += "SERIAL 0 115200\n"
-            syslinux_conf += "\n"
-            if splashline:
-                syslinux_conf += "%s\n" % splashline
-            syslinux_conf += "DEFAULT boot\n"
-            syslinux_conf += "LABEL boot\n"
-
-            kernel = "/vmlinuz"
-            syslinux_conf += "KERNEL " + kernel + "\n"
-
-            syslinux_conf += "APPEND label=boot root=%s %s\n" % \
-                             (creator.rootdev, bootloader.append)
-
-        logger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg",
-                     cr_workdir)
-        cfg = open("%s/hdd/boot/syslinux.cfg" % cr_workdir, "w")
-        cfg.write(syslinux_conf)
-        cfg.close()
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
-        """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        In this case, prepare content for legacy bios boot partition.
-        """
-        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
-
-        staging_kernel_dir = kernel_dir
-
-        hdddir = "%s/hdd/boot" % cr_workdir
-
-        cmds = ("install -m 0644 %s/bzImage %s/vmlinuz" %
-                (staging_kernel_dir, hdddir),
-                "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
-                (bootimg_dir, hdddir),
-                "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c32" %
-                (bootimg_dir, hdddir),
-                "install -m 444 %s/syslinux/libcom32.c32 %s/libcom32.c32" %
-                (bootimg_dir, hdddir),
-                "install -m 444 %s/syslinux/libutil.c32 %s/libutil.c32" %
-                (bootimg_dir, hdddir))
-
-        for install_cmd in cmds:
-            exec_cmd(install_cmd)
-
-        du_cmd = "du -bks %s" % hdddir
-        out = exec_cmd(du_cmd)
-        blocks = int(out.split()[0])
-
-        extra_blocks = part.get_extra_block_count(blocks)
-
-        if extra_blocks < BOOTDD_EXTRA_SPACE:
-            extra_blocks = BOOTDD_EXTRA_SPACE
-
-        blocks += extra_blocks
-
-        logger.debug("Added %d extra blocks to %s to get to %d total blocks",
-                     extra_blocks, part.mountpoint, blocks)
-
-        # dosfs image, created by mkdosfs
-        bootimg = "%s/boot%s.img" % (cr_workdir, part.lineno)
-
-        dosfs_cmd = "mkdosfs -n boot -i %s -S 512 -C %s %d" % \
-                    (part.fsuuid, bootimg, blocks)
-        exec_native_cmd(dosfs_cmd, native_sysroot)
-
-        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-        exec_native_cmd(mcopy_cmd, native_sysroot)
-
-        syslinux_cmd = "syslinux %s" % bootimg
-        exec_native_cmd(syslinux_cmd, native_sysroot)
-
-        chmod_cmd = "chmod 644 %s" % bootimg
-        exec_cmd(chmod_cmd)
-
-        du_cmd = "du -Lbks %s" % bootimg
-        out = exec_cmd(du_cmd)
-        bootimg_size = out.split()[0]
-
-        part.size = int(bootimg_size)
-        part.source_file = bootimg
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
deleted file mode 100644
index 0d4f50d..0000000
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ /dev/null
@@ -1,443 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-# This implements the 'isoimage-isohybrid' source plugin class for 'wic'
-#
-# AUTHORS
-# Mihaly Varga <mihaly.varga (at] ni.com>
-
-import glob
-import logging
-import os
-import re
-import shutil
-
-from wic import WicError
-from wic.engine import get_custom_config
-from wic.pluginbase import SourcePlugin
-from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
-
-logger = logging.getLogger('wic')
-
-class IsoImagePlugin(SourcePlugin):
-    """
-    Create a bootable ISO image
-
-    This plugin creates a hybrid, legacy and EFI bootable ISO image. The
-    generated image can be used on optical media as well as USB media.
-
-    Legacy boot uses syslinux and EFI boot uses grub or gummiboot (not
-    implemented yet) as bootloader. The plugin creates the directories required
-    by bootloaders and populates them by creating and configuring the
-    bootloader files.
-
-    Example kickstart file:
-    part /boot --source isoimage-isohybrid --sourceparams="loader=grub-efi, \\
-    image_name= IsoImage" --ondisk cd --label LIVECD
-    bootloader  --timeout=10  --append=" "
-
-    In --sourceparams "loader" specifies the bootloader used for booting in EFI
-    mode, while "image_name" specifies the name of the generated image. In the
-    example above, wic creates an ISO image named IsoImage-cd.direct (default
-    extension added by direct imeger plugin) and a file named IsoImage-cd.iso
-    """
-
-    name = 'isoimage-isohybrid'
-
-    @classmethod
-    def do_configure_syslinux(cls, creator, cr_workdir):
-        """
-        Create loader-specific (syslinux) config
-        """
-        splash = os.path.join(cr_workdir, "ISO/boot/splash.jpg")
-        if os.path.exists(splash):
-            splashline = "menu background splash.jpg"
-        else:
-            splashline = ""
-
-        bootloader = creator.ks.bootloader
-
-        syslinux_conf = ""
-        syslinux_conf += "PROMPT 0\n"
-        syslinux_conf += "TIMEOUT %s \n" % (bootloader.timeout or 10)
-        syslinux_conf += "\n"
-        syslinux_conf += "ALLOWOPTIONS 1\n"
-        syslinux_conf += "SERIAL 0 115200\n"
-        syslinux_conf += "\n"
-        if splashline:
-            syslinux_conf += "%s\n" % splashline
-        syslinux_conf += "DEFAULT boot\n"
-        syslinux_conf += "LABEL boot\n"
-
-        kernel = "/bzImage"
-        syslinux_conf += "KERNEL " + kernel + "\n"
-        syslinux_conf += "APPEND initrd=/initrd LABEL=boot %s\n" \
-                             % bootloader.append
-
-        logger.debug("Writing syslinux config %s/ISO/isolinux/isolinux.cfg",
-                     cr_workdir)
-
-        with open("%s/ISO/isolinux/isolinux.cfg" % cr_workdir, "w") as cfg:
-            cfg.write(syslinux_conf)
-
-    @classmethod
-    def do_configure_grubefi(cls, part, creator, target_dir):
-        """
-        Create loader-specific (grub-efi) config
-        """
-        configfile = creator.ks.bootloader.configfile
-        if configfile:
-            grubefi_conf = get_custom_config(configfile)
-            if grubefi_conf:
-                logger.debug("Using custom configuration file %s for grub.cfg",
-                             configfile)
-            else:
-                raise WicError("configfile is specified "
-                               "but failed to get it from %s", configfile)
-        else:
-            splash = os.path.join(target_dir, "splash.jpg")
-            if os.path.exists(splash):
-                splashline = "menu background splash.jpg"
-            else:
-                splashline = ""
-
-            bootloader = creator.ks.bootloader
-
-            grubefi_conf = ""
-            grubefi_conf += "serial --unit=0 --speed=115200 --word=8 "
-            grubefi_conf += "--parity=no --stop=1\n"
-            grubefi_conf += "default=boot\n"
-            grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
-            grubefi_conf += "\n"
-            grubefi_conf += "search --set=root --label %s " % part.label
-            grubefi_conf += "\n"
-            grubefi_conf += "menuentry 'boot'{\n"
-
-            kernel = "/bzImage"
-
-            grubefi_conf += "linux %s rootwait %s\n" \
-                            % (kernel, bootloader.append)
-            grubefi_conf += "initrd /initrd \n"
-            grubefi_conf += "}\n"
-
-            if splashline:
-                grubefi_conf += "%s\n" % splashline
-
-        cfg_path = os.path.join(target_dir, "grub.cfg")
-        logger.debug("Writing grubefi config %s", cfg_path)
-
-        with open(cfg_path, "w") as cfg:
-            cfg.write(grubefi_conf)
-
-    @staticmethod
-    def _build_initramfs_path(rootfs_dir, cr_workdir):
-        """
-        Create path for initramfs image
-        """
-
-        initrd = get_bitbake_var("INITRD_LIVE") or get_bitbake_var("INITRD")
-        if not initrd:
-            initrd_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not initrd_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting.")
-
-            image_name = get_bitbake_var("IMAGE_BASENAME")
-            if not image_name:
-                raise WicError("Couldn't find IMAGE_BASENAME, exiting.")
-
-            image_type = get_bitbake_var("INITRAMFS_FSTYPES")
-            if not image_type:
-                raise WicError("Couldn't find INITRAMFS_FSTYPES, exiting.")
-
-            machine = os.path.basename(initrd_dir)
-
-            pattern = '%s/%s*%s.%s' % (initrd_dir, image_name, machine, image_type)
-            files = glob.glob(pattern)
-            if files:
-                initrd = files[0]
-
-        if not initrd or not os.path.exists(initrd):
-            # Create initrd from rootfs directory
-            initrd = "%s/initrd.cpio.gz" % cr_workdir
-            initrd_dir = "%s/INITRD" % cr_workdir
-            shutil.copytree("%s" % rootfs_dir, \
-                            "%s" % initrd_dir, symlinks=True)
-
-            if os.path.isfile("%s/init" % rootfs_dir):
-                shutil.copy2("%s/init" % rootfs_dir, "%s/init" % initrd_dir)
-            elif os.path.lexists("%s/init" % rootfs_dir):
-                os.symlink(os.readlink("%s/init" % rootfs_dir), \
-                            "%s/init" % initrd_dir)
-            elif os.path.isfile("%s/sbin/init" % rootfs_dir):
-                shutil.copy2("%s/sbin/init" % rootfs_dir, \
-                            "%s" % initrd_dir)
-            elif os.path.lexists("%s/sbin/init" % rootfs_dir):
-                os.symlink(os.readlink("%s/sbin/init" % rootfs_dir), \
-                            "%s/init" % initrd_dir)
-            else:
-                raise WicError("Couldn't find or build initrd, exiting.")
-
-            exec_cmd("cd %s && find . | cpio -o -H newc -R +0:+0 >./initrd.cpio " \
-                    % initrd_dir, as_shell=True)
-            exec_cmd("gzip -f -9 -c %s/initrd.cpio > %s" \
-                    % (cr_workdir, initrd), as_shell=True)
-            shutil.rmtree(initrd_dir)
-
-        return initrd
-
-    @classmethod
-    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
-                               oe_builddir, bootimg_dir, kernel_dir,
-                               native_sysroot):
-        """
-        Called before do_prepare_partition(), creates loader-specific config
-        """
-        isodir = "%s/ISO/" % cr_workdir
-
-        if os.path.exists(isodir):
-            shutil.rmtree(isodir)
-
-        install_cmd = "install -d %s " % isodir
-        exec_cmd(install_cmd)
-
-        # Overwrite the name of the created image
-        logger.debug(source_params)
-        if 'image_name' in source_params and \
-                    source_params['image_name'].strip():
-            creator.name = source_params['image_name'].strip()
-            logger.debug("The name of the image is: %s", creator.name)
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
-        """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        In this case, prepare content for a bootable ISO image.
-        """
-
-        isodir = "%s/ISO" % cr_workdir
-
-        if part.rootfs_dir is None:
-            if not 'ROOTFS_DIR' in rootfs_dir:
-                raise WicError("Couldn't find --rootfs-dir, exiting.")
-            rootfs_dir = rootfs_dir['ROOTFS_DIR']
-        else:
-            if part.rootfs_dir in rootfs_dir:
-                rootfs_dir = rootfs_dir[part.rootfs_dir]
-            elif part.rootfs_dir:
-                rootfs_dir = part.rootfs_dir
-            else:
-                raise WicError("Couldn't find --rootfs-dir=%s connection "
-                               "or it is not a valid path, exiting." %
-                               part.rootfs_dir)
-
-        if not os.path.isdir(rootfs_dir):
-            rootfs_dir = get_bitbake_var("IMAGE_ROOTFS")
-        if not os.path.isdir(rootfs_dir):
-            raise WicError("Couldn't find IMAGE_ROOTFS, exiting.")
-
-        part.rootfs_dir = rootfs_dir
-        deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-        img_iso_dir = get_bitbake_var("ISODIR")
-
-        # Remove the temporary file created by part.prepare_rootfs()
-        if os.path.isfile(part.source_file):
-            os.remove(part.source_file)
-
-        # Support using a different initrd other than default
-        if source_params.get('initrd'):
-            initrd = source_params['initrd']
-            if not deploy_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-            cp_cmd = "cp %s/%s %s" % (deploy_dir, initrd, cr_workdir)
-            exec_cmd(cp_cmd)
-        else:
-            # Prepare initial ramdisk
-            initrd = "%s/initrd" % deploy_dir
-            if not os.path.isfile(initrd):
-                initrd = "%s/initrd" % img_iso_dir
-            if not os.path.isfile(initrd):
-                initrd = cls._build_initramfs_path(rootfs_dir, cr_workdir)
-
-        install_cmd = "install -m 0644 %s %s/initrd" % (initrd, isodir)
-        exec_cmd(install_cmd)
-
-        # Remove the temporary file created by _build_initramfs_path function
-        if os.path.isfile("%s/initrd.cpio.gz" % cr_workdir):
-            os.remove("%s/initrd.cpio.gz" % cr_workdir)
-
-        # Install bzImage
-        install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
-                      (kernel_dir, isodir)
-        exec_cmd(install_cmd)
-
-        #Create bootloader for efi boot
-        try:
-            target_dir = "%s/EFI/BOOT" % isodir
-            if os.path.exists(target_dir):
-                shutil.rmtree(target_dir)
-
-            os.makedirs(target_dir)
-
-            if source_params['loader'] == 'grub-efi':
-                # Builds bootx64.efi/bootia32.efi if ISODIR didn't exist or
-                # didn't contains it
-                target_arch = get_bitbake_var("TARGET_SYS")
-                if not target_arch:
-                    raise WicError("Coludn't find target architecture")
-
-                if re.match("x86_64", target_arch):
-                    grub_src_image = "grub-efi-bootx64.efi"
-                    grub_dest_image = "bootx64.efi"
-                elif re.match('i.86', target_arch):
-                    grub_src_image = "grub-efi-bootia32.efi"
-                    grub_dest_image = "bootia32.efi"
-                else:
-                    raise WicError("grub-efi is incompatible with target %s" %
-                                   target_arch)
-
-                grub_target = os.path.join(target_dir, grub_dest_image)
-                if not os.path.isfile(grub_target):
-                    grub_src = os.path.join(deploy_dir, grub_src_image)
-                    if not os.path.exists(grub_src):
-                        raise WicError("Grub loader %s is not found in %s. "
-                                       "Please build grub-efi first" % (grub_image, deploy_dir))
-                    shutil.copy(grub_src, grub_target)
-
-                if not os.path.isfile(os.path.join(target_dir, "boot.cfg")):
-                    cls.do_configure_grubefi(part, creator, target_dir)
-
-            else:
-                raise WicError("unrecognized bootimg-efi loader: %s" %
-                               source_params['loader'])
-        except KeyError:
-            raise WicError("bootimg-efi requires a loader, none specified")
-
-        # Create efi.img that contains bootloader files for EFI booting
-        # if ISODIR didn't exist or didn't contains it
-        if os.path.isfile("%s/efi.img" % img_iso_dir):
-            install_cmd = "install -m 0644 %s/efi.img %s/efi.img" % \
-                (img_iso_dir, isodir)
-            exec_cmd(install_cmd)
-        else:
-            du_cmd = "du -bks %s/EFI" % isodir
-            out = exec_cmd(du_cmd)
-            blocks = int(out.split()[0])
-            # Add some extra space for file system overhead
-            blocks += 100
-            logger.debug("Added 100 extra blocks to %s to get to %d "
-                         "total blocks", part.mountpoint, blocks)
-
-            # dosfs image for EFI boot
-            bootimg = "%s/efi.img" % isodir
-
-            dosfs_cmd = 'mkfs.vfat -n "EFIimg" -S 512 -C %s %d' \
-                        % (bootimg, blocks)
-            exec_native_cmd(dosfs_cmd, native_sysroot)
-
-            mmd_cmd = "mmd -i %s ::/EFI" % bootimg
-            exec_native_cmd(mmd_cmd, native_sysroot)
-
-            mcopy_cmd = "mcopy -i %s -s %s/EFI/* ::/EFI/" \
-                        % (bootimg, isodir)
-            exec_native_cmd(mcopy_cmd, native_sysroot)
-
-            chmod_cmd = "chmod 644 %s" % bootimg
-            exec_cmd(chmod_cmd)
-
-        # Prepare files for legacy boot
-        syslinux_dir = get_bitbake_var("STAGING_DATADIR")
-        if not syslinux_dir:
-            raise WicError("Couldn't find STAGING_DATADIR, exiting.")
-
-        if os.path.exists("%s/isolinux" % isodir):
-            shutil.rmtree("%s/isolinux" % isodir)
-
-        install_cmd = "install -d %s/isolinux" % isodir
-        exec_cmd(install_cmd)
-
-        cls.do_configure_syslinux(creator, cr_workdir)
-
-        install_cmd = "install -m 444 %s/syslinux/ldlinux.sys " % syslinux_dir
-        install_cmd += "%s/isolinux/ldlinux.sys" % isodir
-        exec_cmd(install_cmd)
-
-        install_cmd = "install -m 444 %s/syslinux/isohdpfx.bin " % syslinux_dir
-        install_cmd += "%s/isolinux/isohdpfx.bin" % isodir
-        exec_cmd(install_cmd)
-
-        install_cmd = "install -m 644 %s/syslinux/isolinux.bin " % syslinux_dir
-        install_cmd += "%s/isolinux/isolinux.bin" % isodir
-        exec_cmd(install_cmd)
-
-        install_cmd = "install -m 644 %s/syslinux/ldlinux.c32 " % syslinux_dir
-        install_cmd += "%s/isolinux/ldlinux.c32" % isodir
-        exec_cmd(install_cmd)
-
-        #create ISO image
-        iso_img = "%s/tempiso_img.iso" % cr_workdir
-        iso_bootimg = "isolinux/isolinux.bin"
-        iso_bootcat = "isolinux/boot.cat"
-        efi_img = "efi.img"
-
-        mkisofs_cmd = "mkisofs -V %s " % part.label
-        mkisofs_cmd += "-o %s -U " % iso_img
-        mkisofs_cmd += "-J -joliet-long -r -iso-level 2 -b %s " % iso_bootimg
-        mkisofs_cmd += "-c %s -no-emul-boot -boot-load-size 4 " % iso_bootcat
-        mkisofs_cmd += "-boot-info-table -eltorito-alt-boot "
-        mkisofs_cmd += "-eltorito-platform 0xEF -eltorito-boot %s " % efi_img
-        mkisofs_cmd += "-no-emul-boot %s " % isodir
-
-        logger.debug("running command: %s", mkisofs_cmd)
-        exec_native_cmd(mkisofs_cmd, native_sysroot)
-
-        shutil.rmtree(isodir)
-
-        du_cmd = "du -Lbks %s" % iso_img
-        out = exec_cmd(du_cmd)
-        isoimg_size = int(out.split()[0])
-
-        part.size = isoimg_size
-        part.source_file = iso_img
-
-    @classmethod
-    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
-                        bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Called after all partitions have been prepared and assembled into a
-        disk image.  In this case, we insert/modify the MBR using isohybrid
-        utility for booting via BIOS from disk storage devices.
-        """
-
-        iso_img = "%s.p1" % disk.path
-        full_path = creator._full_path(workdir, disk_name, "direct")
-        full_path_iso = creator._full_path(workdir, disk_name, "iso")
-
-        isohybrid_cmd = "isohybrid -u %s" % iso_img
-        logger.debug("running command: %s", isohybrid_cmd)
-        exec_native_cmd(isohybrid_cmd, native_sysroot)
-
-        # Replace the image created by direct plugin with the one created by
-        # mkisofs command. This is necessary because the iso image created by
-        # mkisofs has a very specific MBR is system area of the ISO image, and
-        # direct plugin adds and configures an another MBR.
-        logger.debug("Replaceing the image created by direct plugin\n")
-        os.remove(disk.path)
-        shutil.copy2(iso_img, full_path_iso)
-        shutil.copy2(full_path_iso, full_path)
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
deleted file mode 100644
index e86398a..0000000
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ /dev/null
@@ -1,91 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-
-import logging
-import os
-
-from wic import WicError
-from wic.pluginbase import SourcePlugin
-from wic.misc import exec_cmd, get_bitbake_var
-from wic.filemap import sparse_copy
-
-logger = logging.getLogger('wic')
-
-class RawCopyPlugin(SourcePlugin):
-    """
-    Populate partition content from raw image file.
-    """
-
-    name = 'rawcopy'
-
-    @staticmethod
-    def do_image_label(fstype, dst, label):
-        if fstype.startswith('ext'):
-            cmd = 'tune2fs -L %s %s' % (label, dst)
-        elif fstype in ('msdos', 'vfat'):
-            cmd = 'dosfslabel %s %s' % (dst, label)
-        elif fstype == 'btrfs':
-            cmd = 'btrfs filesystem label %s %s' % (dst, label)
-        elif fstype == 'swap':
-            cmd = 'mkswap -L %s %s' % (label, dst)
-        elif fstype == 'squashfs':
-            raise WicError("It's not possible to update a squashfs "
-                           "filesystem label '%s'" % (label))
-        else:
-            raise WicError("Cannot update filesystem label: "
-                           "Unknown fstype: '%s'" % (fstype))
-
-        exec_cmd(cmd)
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
-        """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        """
-        if not kernel_dir:
-            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
-            if not kernel_dir:
-                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
-
-        logger.debug('Kernel dir: %s', kernel_dir)
-
-        if 'file' not in source_params:
-            raise WicError("No file specified")
-
-        src = os.path.join(kernel_dir, source_params['file'])
-        dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
-
-        if 'skip' in source_params:
-            sparse_copy(src, dst, skip=int(source_params['skip']))
-        else:
-            sparse_copy(src, dst)
-
-        # get the size in the right units for kickstart (kB)
-        du_cmd = "du -Lbks %s" % dst
-        out = exec_cmd(du_cmd)
-        filesize = int(out.split()[0])
-
-        if filesize > part.size:
-            part.size = filesize
-
-        if part.label:
-            RawCopyPlugin.do_image_label(part.fstype, dst, part.label)
-
-        part.source_file = dst
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
deleted file mode 100644
index aec720f..0000000
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ /dev/null
@@ -1,126 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2014, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION
-# This implements the 'rootfs' source plugin class for 'wic'
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-# Joao Henrique Ferreira de Freitas <joaohf (at] gmail.com>
-#
-
-import logging
-import os
-import shutil
-import sys
-
-from oe.path import copyhardlinktree
-
-from wic import WicError
-from wic.pluginbase import SourcePlugin
-from wic.misc import get_bitbake_var
-
-logger = logging.getLogger('wic')
-
-class RootfsPlugin(SourcePlugin):
-    """
-    Populate partition content from a rootfs directory.
-    """
-
-    name = 'rootfs'
-
-    @staticmethod
-    def __get_rootfs_dir(rootfs_dir):
-        if os.path.isdir(rootfs_dir):
-            return os.path.realpath(rootfs_dir)
-
-        image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
-        if not os.path.isdir(image_rootfs_dir):
-            raise WicError("No valid artifact IMAGE_ROOTFS from image "
-                           "named %s has been found at %s, exiting." %
-                           (rootfs_dir, image_rootfs_dir))
-
-        return os.path.realpath(image_rootfs_dir)
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             krootfs_dir, native_sysroot):
-        """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        In this case, prepare content for legacy bios boot partition.
-        """
-        if part.rootfs_dir is None:
-            if not 'ROOTFS_DIR' in krootfs_dir:
-                raise WicError("Couldn't find --rootfs-dir, exiting")
-
-            rootfs_dir = krootfs_dir['ROOTFS_DIR']
-        else:
-            if part.rootfs_dir in krootfs_dir:
-                rootfs_dir = krootfs_dir[part.rootfs_dir]
-            elif part.rootfs_dir:
-                rootfs_dir = part.rootfs_dir
-            else:
-                raise WicError("Couldn't find --rootfs-dir=%s connection or "
-                               "it is not a valid path, exiting" % part.rootfs_dir)
-
-        part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
-
-        new_rootfs = None
-        # Handle excluded paths.
-        if part.exclude_path is not None:
-            # We need a new rootfs directory we can delete files from. Copy to
-            # workdir.
-            new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
-
-            if os.path.lexists(new_rootfs):
-                shutil.rmtree(os.path.join(new_rootfs))
-
-            copyhardlinktree(part.rootfs_dir, new_rootfs)
-
-            for orig_path in part.exclude_path:
-                path = orig_path
-                if os.path.isabs(path):
-                    logger.error("Must be relative: --exclude-path=%s" % orig_path)
-                    sys.exit(1)
-
-                full_path = os.path.realpath(os.path.join(new_rootfs, path))
-
-                # Disallow climbing outside of parent directory using '..',
-                # because doing so could be quite disastrous (we will delete the
-                # directory).
-                if not full_path.startswith(new_rootfs):
-                    logger.error("'%s' points to a path outside the rootfs" % orig_path)
-                    sys.exit(1)
-
-                if path.endswith(os.sep):
-                    # Delete content only.
-                    for entry in os.listdir(full_path):
-                        full_entry = os.path.join(full_path, entry)
-                        if os.path.isdir(full_entry) and not os.path.islink(full_entry):
-                            shutil.rmtree(full_entry)
-                        else:
-                            os.remove(full_entry)
-                else:
-                    # Delete whole directory.
-                    shutil.rmtree(full_path)
-
-        part.prepare_rootfs(cr_workdir, oe_builddir,
-                            new_rootfs or part.rootfs_dir, native_sysroot)
diff --git a/scripts/wic b/scripts/wic
deleted file mode 100755
index 7392bc4..0000000
--- a/scripts/wic
+++ /dev/null
@@ -1,542 +0,0 @@
-#!/usr/bin/env python3
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# DESCRIPTION 'wic' is the OpenEmbedded Image Creator that users can
-# use to generate bootable images.  Invoking it without any arguments
-# will display help screens for the 'wic' command and list the
-# available 'wic' subcommands.  Invoking a subcommand without any
-# arguments will likewise display help screens for the specified
-# subcommand.  Please use that interface for detailed help.
-#
-# AUTHORS
-# Tom Zanussi <tom.zanussi (at] linux.intel.com>
-#
-__version__ = "0.2.0"
-
-# Python Standard Library modules
-import os
-import sys
-import argparse
-import logging
-
-from collections import namedtuple
-from distutils import spawn
-
-# External modules
-scripts_path = os.path.dirname(os.path.realpath(__file__))
-lib_path = scripts_path + '/lib'
-sys.path.insert(0, lib_path)
-import scriptpath
-scriptpath.add_oe_lib_path()
-
-# Check whether wic is running within eSDK environment
-sdkroot = scripts_path
-if os.environ.get('SDKTARGETSYSROOT'):
-    while sdkroot != '' and sdkroot != os.sep:
-        if os.path.exists(os.path.join(sdkroot, '.devtoolbase')):
-            # Set BUILDDIR for wic to work within eSDK
-            os.environ['BUILDDIR'] = sdkroot
-            # .devtoolbase only exists within eSDK
-            # If found, initialize bitbake path for eSDK environment and append to PATH
-            sdkroot = os.path.join(os.path.dirname(scripts_path), 'bitbake', 'bin')
-            os.environ['PATH'] += ":" + sdkroot
-            break
-        sdkroot = os.path.dirname(sdkroot)
-
-bitbake_exe = spawn.find_executable('bitbake')
-if bitbake_exe:
-    bitbake_path = scriptpath.add_bitbake_lib_path()
-    from bb import cookerdata
-    from bb.main import bitbake_main, BitBakeConfigParameters
-else:
-    bitbake_main = None
-
-from wic import WicError
-from wic.misc import get_bitbake_var, BB_VARS
-from wic import engine
-from wic import help as hlp
-
-
-def wic_logger():
-    """Create and convfigure wic logger."""
-    logger = logging.getLogger('wic')
-    logger.setLevel(logging.INFO)
-
-    handler = logging.StreamHandler()
-
-    formatter = logging.Formatter('%(levelname)s: %(message)s')
-    handler.setFormatter(formatter)
-
-    logger.addHandler(handler)
-
-    return logger
-
-logger = wic_logger()
-
-def rootfs_dir_to_args(krootfs_dir):
-    """
-    Get a rootfs_dir dict and serialize to string
-    """
-    rootfs_dir = ''
-    for key, val in krootfs_dir.items():
-        rootfs_dir += ' '
-        rootfs_dir += '='.join([key, val])
-    return rootfs_dir.strip()
-
-
-class RootfsArgAction(argparse.Action):
-    def __init__(self, **kwargs):
-        super().__init__(**kwargs)
-
-    def __call__(self, parser, namespace, value, option_string=None):
-        if not "rootfs_dir" in vars(namespace) or \
-           not type(namespace.__dict__['rootfs_dir']) is dict:
-            namespace.__dict__['rootfs_dir'] = {}
-
-        if '=' in value:
-            (key, rootfs_dir) = value.split('=')
-        else:
-            key = 'ROOTFS_DIR'
-            rootfs_dir = value
-
-        namespace.__dict__['rootfs_dir'][key] = rootfs_dir
-
-
-def wic_create_subcommand(options, usage_str):
-    """
-    Command-line handling for image creation.  The real work is done
-    by image.engine.wic_create()
-    """
-    if options.build_rootfs and not bitbake_main:
-        raise WicError("Can't build rootfs as bitbake is not in the $PATH")
-
-    if not options.image_name:
-        missed = []
-        for val, opt in [(options.rootfs_dir, 'rootfs-dir'),
-                         (options.bootimg_dir, 'bootimg-dir'),
-                         (options.kernel_dir, 'kernel-dir'),
-                         (options.native_sysroot, 'native-sysroot')]:
-            if not val:
-                missed.append(opt)
-        if missed:
-            raise WicError("The following build artifacts are not specified: %s" %
-                           ", ".join(missed))
-
-    if options.image_name:
-        BB_VARS.default_image = options.image_name
-    else:
-        options.build_check = False
-
-    if options.vars_dir:
-        BB_VARS.vars_dir = options.vars_dir
-
-    if options.build_check and not engine.verify_build_env():
-        raise WicError("Couldn't verify build environment, exiting")
-
-    if options.debug:
-        logger.setLevel(logging.DEBUG)
-
-    if options.image_name:
-        if options.build_rootfs:
-            argv = ["bitbake", options.image_name]
-            if options.debug:
-                argv.append("--debug")
-
-            logger.info("Building rootfs...\n")
-            if bitbake_main(BitBakeConfigParameters(argv),
-                            cookerdata.CookerConfiguration()):
-                raise WicError("bitbake exited with error")
-
-        rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
-        kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
-        bootimg_dir = get_bitbake_var("STAGING_DATADIR", options.image_name)
-
-        native_sysroot = options.native_sysroot
-        if options.vars_dir and not native_sysroot:
-            native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", options.image_name)
-    else:
-        if options.build_rootfs:
-            raise WicError("Image name is not specified, exiting. "
-                           "(Use -e/--image-name to specify it)")
-        native_sysroot = options.native_sysroot
-
-    if not options.vars_dir and (not native_sysroot or not os.path.isdir(native_sysroot)):
-        logger.info("Building wic-tools...\n")
-        if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
-                        cookerdata.CookerConfiguration()):
-            raise WicError("bitbake wic-tools failed")
-        native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
-
-    if not native_sysroot:
-        raise WicError("Unable to find the location of the native tools sysroot")
-
-    wks_file = options.wks_file
-
-    if not wks_file.endswith(".wks"):
-        wks_file = engine.find_canned_image(scripts_path, wks_file)
-        if not wks_file:
-            raise WicError("No image named %s found, exiting.  (Use 'wic list images' "
-                           "to list available images, or specify a fully-qualified OE "
-                           "kickstart (.wks) filename)" % options.wks_file)
-
-    if not options.image_name:
-        rootfs_dir = ''
-        if 'ROOTFS_DIR' in options.rootfs_dir:
-            rootfs_dir = options.rootfs_dir['ROOTFS_DIR']
-        bootimg_dir = options.bootimg_dir
-        kernel_dir = options.kernel_dir
-        native_sysroot = options.native_sysroot
-        if rootfs_dir and not os.path.isdir(rootfs_dir):
-            raise WicError("--rootfs-dir (-r) not found, exiting")
-        if not os.path.isdir(bootimg_dir):
-            raise WicError("--bootimg-dir (-b) not found, exiting")
-        if not os.path.isdir(kernel_dir):
-            raise WicError("--kernel-dir (-k) not found, exiting")
-        if not os.path.isdir(native_sysroot):
-            raise WicError("--native-sysroot (-n) not found, exiting")
-    else:
-        not_found = not_found_dir = ""
-        if not os.path.isdir(rootfs_dir):
-            (not_found, not_found_dir) = ("rootfs-dir", rootfs_dir)
-        elif not os.path.isdir(kernel_dir):
-            (not_found, not_found_dir) = ("kernel-dir", kernel_dir)
-        elif not os.path.isdir(native_sysroot):
-            (not_found, not_found_dir) = ("native-sysroot", native_sysroot)
-        if not_found:
-            if not not_found_dir:
-                not_found_dir = "Completely missing artifact - wrong image (.wks) used?"
-            logger.info("Build artifacts not found, exiting.")
-            logger.info("  (Please check that the build artifacts for the machine")
-            logger.info("   selected in local.conf actually exist and that they")
-            logger.info("   are the correct artifacts for the image (.wks file)).\n")
-            raise WicError("The artifact that couldn't be found was %s:\n  %s", not_found, not_found_dir)
-
-    krootfs_dir = options.rootfs_dir
-    if krootfs_dir is None:
-        krootfs_dir = {}
-        krootfs_dir['ROOTFS_DIR'] = rootfs_dir
-
-    rootfs_dir = rootfs_dir_to_args(krootfs_dir)
-
-    logger.info("Creating image(s)...\n")
-    engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-                      native_sysroot, options)
-
-
-def wic_list_subcommand(args, usage_str):
-    """
-    Command-line handling for listing available images.
-    The real work is done by image.engine.wic_list()
-    """
-    if not engine.wic_list(args, scripts_path):
-        raise WicError("Bad list arguments, exiting")
-
-
-def wic_ls_subcommand(args, usage_str):
-    """
-    Command-line handling for list content of images.
-    The real work is done by engine.wic_ls()
-    """
-    engine.wic_ls(args, args.native_sysroot)
-
-def wic_cp_subcommand(args, usage_str):
-    """
-    Command-line handling for copying files/dirs to images.
-    The real work is done by engine.wic_cp()
-    """
-    engine.wic_cp(args, args.native_sysroot)
-
-def wic_rm_subcommand(args, usage_str):
-    """
-    Command-line handling for removing files/dirs from images.
-    The real work is done by engine.wic_rm()
-    """
-    engine.wic_rm(args, args.native_sysroot)
-
-def wic_write_subcommand(args, usage_str):
-    """
-    Command-line handling for writing images.
-    The real work is done by engine.wic_write()
-    """
-    engine.wic_write(args, args.native_sysroot)
-
-def wic_help_subcommand(args, usage_str):
-    """
-    Command-line handling for help subcommand to keep the current
-    structure of the function definitions.
-    """
-    pass
-
-
-def wic_help_topic_subcommand(usage_str, help_str):
-    """
-    Display function for help 'sub-subcommands'.
-    """
-    print(help_str)
-    return
-
-
-wic_help_topic_usage = """
-"""
-
-helptopics = {
-    "plugins":   [wic_help_topic_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_plugins_help],
-    "overview":  [wic_help_topic_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_overview_help],
-    "kickstart": [wic_help_topic_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_kickstart_help],
-    "create":    [wic_help_topic_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_create_help],
-    "ls":        [wic_help_topic_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_ls_help],
-    "cp":        [wic_help_topic_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_cp_help],
-    "rm":        [wic_help_topic_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_rm_help],
-    "write":     [wic_help_topic_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_write_help],
-    "list":      [wic_help_topic_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_list_help]
-}
-
-
-def wic_init_parser_create(subparser):
-    subparser.add_argument("wks_file")
-
-    subparser.add_argument("-o", "--outdir", dest="outdir", default='.',
-                      help="name of directory to create image in")
-    subparser.add_argument("-e", "--image-name", dest="image_name",
-                      help="name of the image to use the artifacts from "
-                           "e.g. core-image-sato")
-    subparser.add_argument("-r", "--rootfs-dir", action=RootfsArgAction,
-                      help="path to the /rootfs dir to use as the "
-                           ".wks rootfs source")
-    subparser.add_argument("-b", "--bootimg-dir", dest="bootimg_dir",
-                      help="path to the dir containing the boot artifacts "
-                           "(e.g. /EFI or /syslinux dirs) to use as the "
-                           ".wks bootimg source")
-    subparser.add_argument("-k", "--kernel-dir", dest="kernel_dir",
-                      help="path to the dir containing the kernel to use "
-                           "in the .wks bootimg")
-    subparser.add_argument("-n", "--native-sysroot", dest="native_sysroot",
-                      help="path to the native sysroot containing the tools "
-                           "to use to build the image")
-    subparser.add_argument("-s", "--skip-build-check", dest="build_check",
-                      action="store_false", default=True, help="skip the build check")
-    subparser.add_argument("-f", "--build-rootfs", action="store_true", help="build rootfs")
-    subparser.add_argument("-c", "--compress-with", choices=("gzip", "bzip2", "xz"),
-                      dest='compressor',
-                      help="compress image with specified compressor")
-    subparser.add_argument("-m", "--bmap", action="store_true", help="generate .bmap")
-    subparser.add_argument("--no-fstab-update" ,action="store_true",
-                      help="Do not change fstab file.")
-    subparser.add_argument("-v", "--vars", dest='vars_dir',
-                      help="directory with <image>.env files that store "
-                           "bitbake variables")
-    subparser.add_argument("-D", "--debug", dest="debug", action="store_true",
-                      default=False, help="output debug information")
-    return
-
-
-def wic_init_parser_list(subparser):
-    subparser.add_argument("list_type",
-                        help="can be 'images' or 'source-plugins' "
-                             "to obtain a list. "
-                             "If value is a valid .wks image file")
-    subparser.add_argument("help_for", default=[], nargs='*',
-                        help="If 'list_type' is a valid .wks image file "
-                             "this value can be 'help' to show the help information "
-                             "defined inside the .wks file")
-    return
-
-def imgtype(arg):
-    """
-    Custom type for ArgumentParser
-    Converts path spec to named tuple: (image, partition, path)
-    """
-    image = arg
-    part = path = None
-    if ':' in image:
-        image, part = image.split(':')
-        if '/' in part:
-            part, path = part.split('/', 1)
-        if not path:
-            path = '/'
-
-    if not os.path.isfile(image):
-        err = "%s is not a regular file or symlink" % image
-        raise argparse.ArgumentTypeError(err)
-
-    return namedtuple('ImgType', 'image part path')(image, part, path)
-
-def wic_init_parser_ls(subparser):
-    subparser.add_argument("path", type=imgtype,
-                        help="image spec: <image>[:<vfat partition>[<path>]]")
-    subparser.add_argument("-n", "--native-sysroot",
-                        help="path to the native sysroot containing the tools")
-
-def imgpathtype(arg):
-    img = imgtype(arg)
-    if img.part is None:
-        raise argparse.ArgumentTypeError("partition number is not specified")
-    return img
-
-def wic_init_parser_cp(subparser):
-    subparser.add_argument("src",
-                        help="source spec")
-    subparser.add_argument("dest", type=imgpathtype,
-                        help="image spec: <image>:<vfat partition>[<path>]")
-    subparser.add_argument("-n", "--native-sysroot",
-                        help="path to the native sysroot containing the tools")
-
-def wic_init_parser_rm(subparser):
-    subparser.add_argument("path", type=imgpathtype,
-                        help="path: <image>:<vfat partition><path>")
-    subparser.add_argument("-n", "--native-sysroot",
-                        help="path to the native sysroot containing the tools")
-
-def expandtype(rules):
-    """
-    Custom type for ArgumentParser
-    Converts expand rules to the dictionary {<partition>: size}
-    """
-    if rules == 'auto':
-        return {}
-    result = {}
-    for rule in rules.split('-'):
-        try:
-            part, size = rule.split(':')
-        except ValueError:
-            raise argparse.ArgumentTypeError("Incorrect rule format: %s" % rule)
-
-        if not part.isdigit():
-            raise argparse.ArgumentTypeError("Rule '%s': partition number must be integer" % rule)
-
-        # validate size
-        multiplier = 1
-        for suffix, mult in [('K', 1024), ('M', 1024 * 1024), ('G', 1024 * 1024 * 1024)]:
-            if size.upper().endswith(suffix):
-                multiplier = mult
-                size = size[:-1]
-                break
-        if not size.isdigit():
-            raise argparse.ArgumentTypeError("Rule '%s': size must be integer" % rule)
-
-        result[int(part)] = int(size) * multiplier
-
-    return result
-
-def wic_init_parser_write(subparser):
-    subparser.add_argument("image",
-                        help="path to the wic image")
-    subparser.add_argument("target",
-                        help="target file or device")
-    subparser.add_argument("-e", "--expand", type=expandtype,
-                        help="expand rules: auto or <partition>:<size>[,<partition>:<size>]")
-    subparser.add_argument("-n", "--native-sysroot",
-                        help="path to the native sysroot containing the tools")
-
-def wic_init_parser_help(subparser):
-    helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
-    for helptopic in helptopics:
-        helpparsers.add_parser(helptopic, help=helptopics[helptopic][2])
-    return
-
-
-subcommands = {
-    "create":    [wic_create_subcommand,
-                  hlp.wic_create_usage,
-                  hlp.wic_create_help,
-                  wic_init_parser_create],
-    "list":      [wic_list_subcommand,
-                  hlp.wic_list_usage,
-                  hlp.wic_list_help,
-                  wic_init_parser_list],
-    "ls":        [wic_ls_subcommand,
-                  hlp.wic_ls_usage,
-                  hlp.wic_ls_help,
-                  wic_init_parser_ls],
-    "cp":        [wic_cp_subcommand,
-                  hlp.wic_cp_usage,
-                  hlp.wic_cp_help,
-                  wic_init_parser_cp],
-    "rm":        [wic_rm_subcommand,
-                  hlp.wic_rm_usage,
-                  hlp.wic_rm_help,
-                  wic_init_parser_rm],
-    "write":     [wic_write_subcommand,
-                  hlp.wic_write_usage,
-                  hlp.wic_write_help,
-                  wic_init_parser_write],
-    "help":      [wic_help_subcommand,
-                  wic_help_topic_usage,
-                  hlp.wic_help_help,
-                  wic_init_parser_help]
-}
-
-
-def init_parser(parser):
-    parser.add_argument("--version", action="version",
-        version="%(prog)s {version}".format(version=__version__))
-    subparsers = parser.add_subparsers(dest='command', help=hlp.wic_usage)
-    for subcmd in subcommands:
-        subparser = subparsers.add_parser(subcmd, help=subcommands[subcmd][2])
-        subcommands[subcmd][3](subparser)
-
-
-def main(argv):
-    parser = argparse.ArgumentParser(
-        description="wic version %s" % __version__)
-
-    init_parser(parser)
-
-    args = parser.parse_args(argv)
-
-    if "command" in vars(args):
-        if args.command == "help":
-            if args.help_topic is None:
-                parser.print_help()
-                print()
-                print("Please specify a help topic")
-            elif args.help_topic in helptopics:
-                hlpt = helptopics[args.help_topic]
-                hlpt[0](hlpt[1], hlpt[2])
-            return 0
-
-    return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
-
-
-if __name__ == "__main__":
-    try:
-        sys.exit(main(sys.argv[1:]))
-    except WicError as err:
-        print()
-        logger.error(err)
-        sys.exit(1)
-- 
2.7.4


