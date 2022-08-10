Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A055C48BEA
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 19:45:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.2794.1660160720333171349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MNpC1sDW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id k17so1459083wmr.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=V4OziLdN+lltE6nMAIvHEeCJulF7NciKLegnVZ9774A=;
        b=MNpC1sDWTnuyGvSX/xbR3dycD5MoSno715WZ3BgEN3EPCmkCn5FPFsWokSP2Uh2Hnx
         8t+QnH19n2hQdRIgHR0XdkUcejq88mN6ZBjh9QP6lTtYz81mtj9zLNSWvnT0iCgqGH3Z
         lBePWaNqRsBOI4nHS3vD+MBYU2joFM211SBaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=V4OziLdN+lltE6nMAIvHEeCJulF7NciKLegnVZ9774A=;
        b=FyvxuS/2DcP3I0a+GM0l3Jh1jXC7BYyjqTPAp6xyXAiKdnNz4AiSXNS+BRB9D2uVNs
         8qzFsT2bqTRCLSz+hDoCClXk+AmT5y03lOn4bheeqKpIZ7pel1PAarzFsHSox+RuHL7H
         RL47qwDdwuHMO2QqVEd7Gpv559YXWDoJYXAMe0GBQbAMuuIBhhNRW1ayeaxAaMWwyF4Q
         G2F2xwv93idxkiFveaEhsCIc+6FLGiZCYQR6eo03ZPw3NGfjUTE9HBWYFeTDb+ZRB+Lv
         fUOFvigGRW/Hv17VOXqYtyDr37sjqQ5RFXrrE0UFrV0lntCKHl0tLbDvKAS8hZfpJI4+
         kooA==
X-Gm-Message-State: ACgBeo0xFseBDG/GSVjlDiH0I6hMMOyOGG/CKERvtTxxql3NQ8tgt4oO
	BlaG63V8z4ee+lM5cQT6d50AjyezcstHnw==
X-Google-Smtp-Source: 
 AA6agR6QzRBy0XRzBGzgaur5RcmZwu317AsT3YfZhL4wTVZS7Ej4iRTKk+m6H7cTwVPe374Kcsb6pw==
X-Received: by 2002:a05:600c:3b15:b0:3a5:49e:81a6 with SMTP id
 m21-20020a05600c3b1500b003a5049e81a6mr3416186wms.49.1660160716944;
        Wed, 10 Aug 2022 12:45:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bdb5:cbd6:cc51:991])
        by smtp.gmail.com with ESMTPSA id
 l21-20020a1ced15000000b0039747cf8354sm3240823wmh.39.2022.08.10.12.45.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 12:45:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] lib: Add copyright statements to files without one
Date: Wed, 10 Aug 2022 20:45:10 +0100
Message-Id: <20220810194510.484900-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
References: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 19:45:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169206

Where there isn't a copyright statement, add one to make it explicit.
Also add license identifiers as MIT if there isn't one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/bblayers/buildconf.py                      | 2 ++
 meta/lib/bblayers/create.py                         | 2 ++
 meta/lib/bblayers/makesetup.py                      | 2 ++
 meta/lib/buildstats.py                              | 2 ++
 meta/lib/oe/__init__.py                             | 2 ++
 meta/lib/oe/cachedpath.py                           | 2 ++
 meta/lib/oe/classextend.py                          | 2 ++
 meta/lib/oe/classutils.py                           | 2 ++
 meta/lib/oe/copy_buildsystem.py                     | 2 ++
 meta/lib/oe/cve_check.py                            | 6 ++++++
 meta/lib/oe/data.py                                 | 2 ++
 meta/lib/oe/distro_check.py                         | 2 ++
 meta/lib/oe/elf.py                                  | 2 ++
 meta/lib/oe/gpg_sign.py                             | 2 ++
 meta/lib/oe/license.py                              | 2 ++
 meta/lib/oe/lsb.py                                  | 2 ++
 meta/lib/oe/maketype.py                             | 2 ++
 meta/lib/oe/manifest.py                             | 2 ++
 meta/lib/oe/npm_registry.py                         | 6 ++++++
 meta/lib/oe/overlayfs.py                            | 2 ++
 meta/lib/oe/package.py                              | 2 ++
 meta/lib/oe/package_manager/__init__.py             | 2 ++
 meta/lib/oe/package_manager/deb/__init__.py         | 2 ++
 meta/lib/oe/package_manager/deb/manifest.py         | 2 ++
 meta/lib/oe/package_manager/deb/rootfs.py           | 2 ++
 meta/lib/oe/package_manager/deb/sdk.py              | 2 ++
 meta/lib/oe/package_manager/ipk/__init__.py         | 2 ++
 meta/lib/oe/package_manager/ipk/manifest.py         | 2 ++
 meta/lib/oe/package_manager/ipk/rootfs.py           | 2 ++
 meta/lib/oe/package_manager/ipk/sdk.py              | 2 ++
 meta/lib/oe/package_manager/rpm/__init__.py         | 2 ++
 meta/lib/oe/package_manager/rpm/manifest.py         | 2 ++
 meta/lib/oe/package_manager/rpm/rootfs.py           | 2 ++
 meta/lib/oe/package_manager/rpm/sdk.py              | 2 ++
 meta/lib/oe/packagedata.py                          | 2 ++
 meta/lib/oe/packagegroup.py                         | 2 ++
 meta/lib/oe/patch.py                                | 2 ++
 meta/lib/oe/path.py                                 | 2 ++
 meta/lib/oe/prservice.py                            | 2 ++
 meta/lib/oe/qa.py                                   | 2 ++
 meta/lib/oe/reproducible.py                         | 2 ++
 meta/lib/oe/rootfs.py                               | 2 ++
 meta/lib/oe/rust.py                                 | 6 ++++++
 meta/lib/oe/sbom.py                                 | 2 ++
 meta/lib/oe/sdk.py                                  | 2 ++
 meta/lib/oe/spdx.py                                 | 2 ++
 meta/lib/oe/sstatesig.py                            | 2 ++
 meta/lib/oe/terminal.py                             | 2 ++
 meta/lib/oe/types.py                                | 2 ++
 meta/lib/oe/useradd.py                              | 2 ++
 meta/lib/oe/utils.py                                | 2 ++
 meta/lib/oeqa/controllers/__init__.py               | 2 ++
 meta/lib/oeqa/controllers/testtargetloader.py       | 2 ++
 meta/lib/oeqa/core/utils/concurrencytest.py         | 2 ++
 meta/lib/oeqa/runtime/cases/_qemutiny.py            | 2 ++
 meta/lib/oeqa/runtime/cases/apt.py                  | 2 ++
 meta/lib/oeqa/runtime/cases/boot.py                 | 2 ++
 meta/lib/oeqa/runtime/cases/buildcpio.py            | 2 ++
 meta/lib/oeqa/runtime/cases/buildgalculator.py      | 2 ++
 meta/lib/oeqa/runtime/cases/buildlzip.py            | 2 ++
 meta/lib/oeqa/runtime/cases/connman.py              | 2 ++
 meta/lib/oeqa/runtime/cases/date.py                 | 2 ++
 meta/lib/oeqa/runtime/cases/df.py                   | 2 ++
 meta/lib/oeqa/runtime/cases/dnf.py                  | 2 ++
 meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py  | 5 +++++
 meta/lib/oeqa/runtime/cases/gcc.py                  | 2 ++
 meta/lib/oeqa/runtime/cases/gi.py                   | 2 ++
 meta/lib/oeqa/runtime/cases/go.py                   | 2 ++
 meta/lib/oeqa/runtime/cases/gstreamer.py            | 2 ++
 meta/lib/oeqa/runtime/cases/kernelmodule.py         | 2 ++
 meta/lib/oeqa/runtime/cases/ksample.py              | 2 ++
 meta/lib/oeqa/runtime/cases/ldd.py                  | 2 ++
 meta/lib/oeqa/runtime/cases/logrotate.py            | 2 ++
 meta/lib/oeqa/runtime/cases/multilib.py             | 2 ++
 meta/lib/oeqa/runtime/cases/oe_syslog.py            | 2 ++
 meta/lib/oeqa/runtime/cases/opkg.py                 | 2 ++
 meta/lib/oeqa/runtime/cases/pam.py                  | 2 ++
 meta/lib/oeqa/runtime/cases/parselogs.py            | 2 ++
 meta/lib/oeqa/runtime/cases/perl.py                 | 2 ++
 meta/lib/oeqa/runtime/cases/ping.py                 | 2 ++
 meta/lib/oeqa/runtime/cases/ptest.py                | 2 ++
 meta/lib/oeqa/runtime/cases/python.py               | 2 ++
 meta/lib/oeqa/runtime/cases/rpm.py                  | 2 ++
 meta/lib/oeqa/runtime/cases/rt.py                   | 2 ++
 meta/lib/oeqa/runtime/cases/rtc.py                  | 5 +++++
 meta/lib/oeqa/runtime/cases/runlevel.py             | 5 +++++
 meta/lib/oeqa/runtime/cases/rust.py                 | 2 ++
 meta/lib/oeqa/runtime/cases/scons.py                | 2 ++
 meta/lib/oeqa/runtime/cases/scp.py                  | 2 ++
 meta/lib/oeqa/runtime/cases/skeletoninit.py         | 2 ++
 meta/lib/oeqa/runtime/cases/ssh.py                  | 2 ++
 meta/lib/oeqa/runtime/cases/stap.py                 | 2 ++
 meta/lib/oeqa/runtime/cases/storage.py              | 2 ++
 meta/lib/oeqa/runtime/cases/suspend.py              | 5 +++++
 meta/lib/oeqa/runtime/cases/systemd.py              | 2 ++
 meta/lib/oeqa/runtime/cases/terminal.py             | 5 +++++
 meta/lib/oeqa/runtime/cases/usb_hid.py              | 5 +++++
 meta/lib/oeqa/runtime/cases/weston.py               | 2 ++
 meta/lib/oeqa/runtime/cases/x32lib.py               | 2 ++
 meta/lib/oeqa/runtime/cases/xorg.py                 | 2 ++
 meta/lib/oeqa/sdk/buildtools-cases/build.py         | 2 ++
 meta/lib/oeqa/sdk/buildtools-cases/gcc.py           | 2 ++
 meta/lib/oeqa/sdk/buildtools-cases/https.py         | 2 ++
 meta/lib/oeqa/sdk/buildtools-cases/sanity.py        | 2 ++
 meta/lib/oeqa/sdk/buildtools-docs-cases/build.py    | 2 ++
 meta/lib/oeqa/sdk/cases/assimp.py                   | 2 ++
 meta/lib/oeqa/sdk/cases/buildcpio.py                | 2 ++
 meta/lib/oeqa/sdk/cases/buildepoxy.py               | 2 ++
 meta/lib/oeqa/sdk/cases/buildgalculator.py          | 2 ++
 meta/lib/oeqa/sdk/cases/buildlzip.py                | 2 ++
 meta/lib/oeqa/sdk/cases/gcc.py                      | 2 ++
 meta/lib/oeqa/sdk/cases/perl.py                     | 2 ++
 meta/lib/oeqa/sdk/cases/python.py                   | 2 ++
 meta/lib/oeqa/sdk/cases/rust.py                     | 2 ++
 meta/lib/oeqa/sdk/testmetaidesupport.py             | 2 ++
 meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py | 2 ++
 meta/lib/oeqa/selftest/cases/archiver.py            | 2 ++
 meta/lib/oeqa/selftest/cases/bblayers.py            | 2 ++
 meta/lib/oeqa/selftest/cases/bblogging.py           | 2 ++
 meta/lib/oeqa/selftest/cases/bbtests.py             | 2 ++
 meta/lib/oeqa/selftest/cases/binutils.py            | 4 ++++
 meta/lib/oeqa/selftest/cases/buildhistory.py        | 2 ++
 meta/lib/oeqa/selftest/cases/buildoptions.py        | 2 ++
 meta/lib/oeqa/selftest/cases/containerimage.py      | 2 ++
 meta/lib/oeqa/selftest/cases/cve_check.py           | 6 ++++++
 meta/lib/oeqa/selftest/cases/devtool.py             | 2 ++
 meta/lib/oeqa/selftest/cases/distrodata.py          | 2 ++
 meta/lib/oeqa/selftest/cases/eSDK.py                | 2 ++
 meta/lib/oeqa/selftest/cases/fetch.py               | 2 ++
 meta/lib/oeqa/selftest/cases/fitimage.py            | 2 ++
 meta/lib/oeqa/selftest/cases/gcc.py                 | 4 ++++
 meta/lib/oeqa/selftest/cases/gdbserver.py           | 3 +++
 meta/lib/oeqa/selftest/cases/glibc.py               | 4 ++++
 meta/lib/oeqa/selftest/cases/gotoolchain.py         | 2 ++
 meta/lib/oeqa/selftest/cases/image_typedep.py       | 2 ++
 meta/lib/oeqa/selftest/cases/imagefeatures.py       | 2 ++
 meta/lib/oeqa/selftest/cases/incompatible_lic.py    | 5 +++++
 meta/lib/oeqa/selftest/cases/intercept.py           | 6 ++++++
 meta/lib/oeqa/selftest/cases/kerneldevelopment.py   | 6 ++++++
 meta/lib/oeqa/selftest/cases/layerappend.py         | 2 ++
 meta/lib/oeqa/selftest/cases/liboe.py               | 2 ++
 meta/lib/oeqa/selftest/cases/lic_checksum.py        | 2 ++
 meta/lib/oeqa/selftest/cases/manifest.py            | 2 ++
 meta/lib/oeqa/selftest/cases/meta_ide.py            | 2 ++
 meta/lib/oeqa/selftest/cases/multiconfig.py         | 2 ++
 meta/lib/oeqa/selftest/cases/newlib.py              | 2 ++
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py  | 2 ++
 meta/lib/oeqa/selftest/cases/oelib/elf.py           | 2 ++
 meta/lib/oeqa/selftest/cases/oelib/license.py       | 2 ++
 meta/lib/oeqa/selftest/cases/oelib/path.py          | 2 ++
 meta/lib/oeqa/selftest/cases/oelib/types.py         | 2 ++
 meta/lib/oeqa/selftest/cases/oelib/utils.py         | 2 ++
 meta/lib/oeqa/selftest/cases/oescripts.py           | 2 ++
 meta/lib/oeqa/selftest/cases/overlayfs.py           | 2 ++
 meta/lib/oeqa/selftest/cases/package.py             | 2 ++
 meta/lib/oeqa/selftest/cases/pkgdata.py             | 2 ++
 meta/lib/oeqa/selftest/cases/prservice.py           | 2 ++
 meta/lib/oeqa/selftest/cases/pseudo.py              | 2 ++
 meta/lib/oeqa/selftest/cases/recipetool.py          | 2 ++
 meta/lib/oeqa/selftest/cases/recipeutils.py         | 2 ++
 meta/lib/oeqa/selftest/cases/resulttooltests.py     | 2 ++
 meta/lib/oeqa/selftest/cases/runcmd.py              | 2 ++
 meta/lib/oeqa/selftest/cases/runtime_test.py        | 2 ++
 meta/lib/oeqa/selftest/cases/selftest.py            | 2 ++
 meta/lib/oeqa/selftest/cases/signing.py             | 2 ++
 meta/lib/oeqa/selftest/cases/sstate.py              | 2 ++
 meta/lib/oeqa/selftest/cases/sstatetests.py         | 2 ++
 meta/lib/oeqa/selftest/cases/sysroot.py             | 2 ++
 meta/lib/oeqa/selftest/cases/tinfoil.py             | 2 ++
 meta/lib/oeqa/selftest/cases/wrapper.py             | 5 +++++
 meta/lib/oeqa/utils/__init__.py                     | 2 ++
 meta/lib/oeqa/utils/dump.py                         | 2 ++
 meta/lib/oeqa/utils/ftools.py                       | 2 ++
 meta/lib/oeqa/utils/httpserver.py                   | 2 ++
 meta/lib/oeqa/utils/logparser.py                    | 2 ++
 meta/lib/oeqa/utils/network.py                      | 2 ++
 meta/lib/oeqa/utils/nfs.py                          | 4 ++++
 meta/lib/oeqa/utils/package_manager.py              | 2 ++
 meta/lib/oeqa/utils/subprocesstweak.py              | 2 ++
 meta/lib/rootfspostcommands.py                      | 2 ++
 180 files changed, 417 insertions(+)

diff --git a/meta/lib/bblayers/buildconf.py b/meta/lib/bblayers/buildconf.py
index ece8836d5a3..e07fc534e1f 100644
--- a/meta/lib/bblayers/buildconf.py
+++ b/meta/lib/bblayers/buildconf.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index 7ddb777dc72..0aeb5d5f7b5 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index b7f62900f48..a6652e540a3 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 99a8303d5e2..1ffe679801c 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Implements system state sampling. Called by buildstats.bbclass.
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 4e7c09da04c..92f002d8726 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
index 254257a83f4..0138b791d4b 100644
--- a/meta/lib/oe/cachedpath.py
+++ b/meta/lib/oe/cachedpath.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Based on standard python library functions but avoid
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index e08d788b755..2013b29711b 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
index 08bb66b3652..ec3f6ad720f 100644
--- a/meta/lib/oe/classutils.py
+++ b/meta/lib/oe/classutils.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 79642fd76ae..a0d829054e1 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # This class should provide easy access to the different aspects of the
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index aa064977277..f3c4701ae2b 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -1,3 +1,9 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
 import collections
 import re
 import itertools
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 602130a9046..37121cfad2b 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 4b2a9bec01b..3494520f40d 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index 46c884a7758..fb07995b3e4 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index aa9bb49f2c8..613dab85611 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 99cfa5f7339..d9c8d94da47 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 """Code for parsing OpenEmbedded license strings"""
diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 43e46380d7b..3ec03e5042b 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/maketype.py b/meta/lib/oe/maketype.py
index d36082c5351..7a83bdf602c 100644
--- a/meta/lib/oe/maketype.py
+++ b/meta/lib/oe/maketype.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 """OpenEmbedded variable typing support
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 1a058dcd734..61f18adc4ac 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/npm_registry.py b/meta/lib/oe/npm_registry.py
index 96c0affb457..db581e280e2 100644
--- a/meta/lib/oe/npm_registry.py
+++ b/meta/lib/oe/npm_registry.py
@@ -1,3 +1,9 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
 import bb
 import json
 import subprocess
diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
index b5d5e88e804..8d7a047125a 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # This file contains common functions for overlayfs and its QA check
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 7d387ee81d5..4aa40d70eec 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index d3b45705ec4..a6bf2fe219d 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index b96ea0bad46..c672454072a 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/deb/manifest.py b/meta/lib/oe/package_manager/deb/manifest.py
index d8eab24a06c..72983bae98f 100644
--- a/meta/lib/oe/package_manager/deb/manifest.py
+++ b/meta/lib/oe/package_manager/deb/manifest.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index 8fbaca11d6c..1e25b64ed99 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index f4b0b6510a4..653e42ab3c0 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 7cbea0fa802..caca522fd69 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/ipk/manifest.py b/meta/lib/oe/package_manager/ipk/manifest.py
index ae451c5c70d..469e14c3c6b 100644
--- a/meta/lib/oe/package_manager/ipk/manifest.py
+++ b/meta/lib/oe/package_manager/ipk/manifest.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index 10a831994ee..1f74f7e39a9 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index e2ca415c8ec..6a1f167fb77 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index d97dab32938..18ec5c895de 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/rpm/manifest.py b/meta/lib/oe/package_manager/rpm/manifest.py
index e6604b301f4..6ee7c329f0c 100644
--- a/meta/lib/oe/package_manager/rpm/manifest.py
+++ b/meta/lib/oe/package_manager/rpm/manifest.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index 00d07cd9cc4..d4c415f68ca 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index c5f232431fb..0726a18b916 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 212f048bc60..b2ed8b5a3d8 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
index 8fcaecde822..7b7594751ad 100644
--- a/meta/lib/oe/packagegroup.py
+++ b/meta/lib/oe/packagegroup.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 4ec9caed450..b2dc8d0a90e 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index c8d8ad05b97..0dc8f172d5c 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 339f7aebcaf..2f2a0c128af 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 89acd3ead0a..b4cbc500455 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 2e815df1907..04a1810d4f2 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 import os
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9e6b411fb69..0b9911e3a63 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 from abc import ABCMeta, abstractmethod
diff --git a/meta/lib/oe/rust.py b/meta/lib/oe/rust.py
index ec70b348054..1dc9cf150dd 100644
--- a/meta/lib/oe/rust.py
+++ b/meta/lib/oe/rust.py
@@ -1,3 +1,9 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
 # Handle mismatches between `uname -m`-style output and Rust's arch names
 def arch_to_rust_arch(arch):
     if arch == "ppc64le":
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 52bf51440e9..bbf466bbad4 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 27347667e84..81fcf153717 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 6d56ed90df2..c74ea688784 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index de652449320..fad10af5398 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 import bb.siggen
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index de8dcebf94a..71ffc87019f 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 import logging
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index bbbabafbf65..b929afb1f3f 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
index 3caa3f851ad..54aa86feb53 100644
--- a/meta/lib/oe/useradd.py
+++ b/meta/lib/oe/useradd.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 import argparse
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 1ee947d584f..69ca8987f3d 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oeqa/controllers/__init__.py b/meta/lib/oeqa/controllers/__init__.py
index cc3836c4bff..0fc905be9a0 100644
--- a/meta/lib/oeqa/controllers/__init__.py
+++ b/meta/lib/oeqa/controllers/__init__.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Enable other layers to have modules in the same named directory
diff --git a/meta/lib/oeqa/controllers/testtargetloader.py b/meta/lib/oeqa/controllers/testtargetloader.py
index 23101c73717..209ff7061a3 100644
--- a/meta/lib/oeqa/controllers/testtargetloader.py
+++ b/meta/lib/oeqa/controllers/testtargetloader.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 161a2f6e904..383479c9597 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Modified for use in OE by Richard Purdie, 2018
diff --git a/meta/lib/oeqa/runtime/cases/_qemutiny.py b/meta/lib/oeqa/runtime/cases/_qemutiny.py
index 6886e365027..14ff8b98b22 100644
--- a/meta/lib/oeqa/runtime/cases/_qemutiny.py
+++ b/meta/lib/oeqa/runtime/cases/_qemutiny.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 574a34f1480..4e09374adde 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/boot.py b/meta/lib/oeqa/runtime/cases/boot.py
index e1ad88a1744..dcee3311f78 100644
--- a/meta/lib/oeqa/runtime/cases/boot.py
+++ b/meta/lib/oeqa/runtime/cases/boot.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index e29bf16ccb0..bd3b46d9ef0 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/buildgalculator.py b/meta/lib/oeqa/runtime/cases/buildgalculator.py
index e5cc3e28885..2cfb3243dc7 100644
--- a/meta/lib/oeqa/runtime/cases/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/cases/buildgalculator.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/buildlzip.py b/meta/lib/oeqa/runtime/cases/buildlzip.py
index bc70b414612..44f4f1be718 100644
--- a/meta/lib/oeqa/runtime/cases/buildlzip.py
+++ b/meta/lib/oeqa/runtime/cases/buildlzip.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/connman.py b/meta/lib/oeqa/runtime/cases/connman.py
index f0d15fac9b2..a488752e3fe 100644
--- a/meta/lib/oeqa/runtime/cases/connman.py
+++ b/meta/lib/oeqa/runtime/cases/connman.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index bd6537400e2..a2523de67ab 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index bb155c9cf98..43e0ebf9eaa 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index f40c63026e5..a8e23e596e9 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
index b93ee299415..eac8f2d082b 100644
--- a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
+++ b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
@@ -1,3 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfQemu
diff --git a/meta/lib/oeqa/runtime/cases/gcc.py b/meta/lib/oeqa/runtime/cases/gcc.py
index 1b6e431bf4b..17b1483e8d3 100644
--- a/meta/lib/oeqa/runtime/cases/gcc.py
+++ b/meta/lib/oeqa/runtime/cases/gcc.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/gi.py b/meta/lib/oeqa/runtime/cases/gi.py
index 42bd100a319..78c7ddda2c1 100644
--- a/meta/lib/oeqa/runtime/cases/gi.py
+++ b/meta/lib/oeqa/runtime/cases/gi.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index 89ba2c3ecb2..7514d108f1a 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/gstreamer.py b/meta/lib/oeqa/runtime/cases/gstreamer.py
index f735f82e3b5..2295769cfd2 100644
--- a/meta/lib/oeqa/runtime/cases/gstreamer.py
+++ b/meta/lib/oeqa/runtime/cases/gstreamer.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/kernelmodule.py b/meta/lib/oeqa/runtime/cases/kernelmodule.py
index 47fd2f850c0..9c42fcc5866 100644
--- a/meta/lib/oeqa/runtime/cases/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/cases/kernelmodule.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index c69e3fe4ac3..b6848762e36 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/ldd.py b/meta/lib/oeqa/runtime/cases/ldd.py
index 9c2caa8f65e..f6841c66753 100644
--- a/meta/lib/oeqa/runtime/cases/ldd.py
+++ b/meta/lib/oeqa/runtime/cases/ldd.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 2bff08f9da3..6ad980cb6ad 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 0d1b9ae2c91..68556e45c5a 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 150b70d9f03..cad0c88d26b 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
index 9cfee1cd886..a29c93e59a2 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
index a482ded9459..b3e8b56c3c2 100644
--- a/meta/lib/oeqa/runtime/cases/pam.py
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 1f9365f3a86..15dda7947f4 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/perl.py b/meta/lib/oeqa/runtime/cases/perl.py
index 2c6b3b78468..f11b300836c 100644
--- a/meta/lib/oeqa/runtime/cases/perl.py
+++ b/meta/lib/oeqa/runtime/cases/perl.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index 498f80d0a50..967b44175f0 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index 00742da2b52..3ef90221887 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/python.py b/meta/lib/oeqa/runtime/cases/python.py
index ec54f1e1db1..5d6d133480e 100644
--- a/meta/lib/oeqa/runtime/cases/python.py
+++ b/meta/lib/oeqa/runtime/cases/python.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index a4339116bf7..e3cd818b2bc 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/rt.py b/meta/lib/oeqa/runtime/cases/rt.py
index 849ac1914e8..15ab4dbbbb4 100644
--- a/meta/lib/oeqa/runtime/cases/rt.py
+++ b/meta/lib/oeqa/runtime/cases/rt.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
index c4e66813249..223cf7b95d9 100644
--- a/meta/lib/oeqa/runtime/cases/rtc.py
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -1,3 +1,8 @@
+\#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
diff --git a/meta/lib/oeqa/runtime/cases/runlevel.py b/meta/lib/oeqa/runtime/cases/runlevel.py
index 3a4df8ace14..6734b0f5eda 100644
--- a/meta/lib/oeqa/runtime/cases/runlevel.py
+++ b/meta/lib/oeqa/runtime/cases/runlevel.py
@@ -1,3 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 
diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
index b3d6cf7f37f..55b280d61d8 100644
--- a/meta/lib/oeqa/runtime/cases/rust.py
+++ b/meta/lib/oeqa/runtime/cases/rust.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/scons.py b/meta/lib/oeqa/runtime/cases/scons.py
index 3c7c7f7270a..4a8d4d40baa 100644
--- a/meta/lib/oeqa/runtime/cases/scons.py
+++ b/meta/lib/oeqa/runtime/cases/scons.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index f2bbc947d6a..ee97b8ef66c 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/skeletoninit.py b/meta/lib/oeqa/runtime/cases/skeletoninit.py
index a12f1e9aaee..75951beda96 100644
--- a/meta/lib/oeqa/runtime/cases/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/cases/skeletoninit.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index e31224b3afd..13aac543969 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index 480eaabf2db..3be41621088 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/storage.py b/meta/lib/oeqa/runtime/cases/storage.py
index 972ef8210c0..b05622fea83 100644
--- a/meta/lib/oeqa/runtime/cases/storage.py
+++ b/meta/lib/oeqa/runtime/cases/storage.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/suspend.py b/meta/lib/oeqa/runtime/cases/suspend.py
index 0382d48f458..a625cc59019 100644
--- a/meta/lib/oeqa/runtime/cases/suspend.py
+++ b/meta/lib/oeqa/runtime/cases/suspend.py
@@ -1,3 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfQemu
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 7c44abe8ed8..720b4b517ae 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
index 8fcca99f474..96ba3c31954 100644
--- a/meta/lib/oeqa/runtime/cases/terminal.py
+++ b/meta/lib/oeqa/runtime/cases/terminal.py
@@ -1,3 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
diff --git a/meta/lib/oeqa/runtime/cases/usb_hid.py b/meta/lib/oeqa/runtime/cases/usb_hid.py
index 8743174370d..6f23d2ff518 100644
--- a/meta/lib/oeqa/runtime/cases/usb_hid.py
+++ b/meta/lib/oeqa/runtime/cases/usb_hid.py
@@ -1,3 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfQemu
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index 1fd471e611a..ee4d336482e 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/x32lib.py b/meta/lib/oeqa/runtime/cases/x32lib.py
index f419c8f1817..014da4b386c 100644
--- a/meta/lib/oeqa/runtime/cases/x32lib.py
+++ b/meta/lib/oeqa/runtime/cases/x32lib.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/runtime/cases/xorg.py b/meta/lib/oeqa/runtime/cases/xorg.py
index d6845587c29..09afb1e3d1b 100644
--- a/meta/lib/oeqa/runtime/cases/xorg.py
+++ b/meta/lib/oeqa/runtime/cases/xorg.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/build.py b/meta/lib/oeqa/sdk/buildtools-cases/build.py
index aee2e5a8c06..c85c32496b3 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/build.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/build.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/gcc.py b/meta/lib/oeqa/sdk/buildtools-cases/gcc.py
index 36ba15b1340..a62c4d0bc4f 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/gcc.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/gcc.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/https.py b/meta/lib/oeqa/sdk/buildtools-cases/https.py
index 35e549eb406..4525e3d7583 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/https.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/https.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py b/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
index 64baaa8f84f..b9dfa39a061 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/sanity.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
index 5b0eca046fa..6e3ee94292b 100644
--- a/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
+++ b/meta/lib/oeqa/sdk/buildtools-docs-cases/build.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index f166758e498..aa6541c6f6d 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index e7fc211a479..c42c670add0 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index ad08b777f23..ee515be1888 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 58ade920c9d..178f07472d5 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index 49ae756bf3c..b4b7d85b882 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index eb08eadd28f..fc28b9c3d43 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index 14d76d820f6..8eab4442e85 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index d43354c32a6..5ea992b9f33 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 1075d37b49e..31036f0f14a 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/sdk/testmetaidesupport.py b/meta/lib/oeqa/sdk/testmetaidesupport.py
index 2ff76fd8e08..00ef30e82e9 100644
--- a/meta/lib/oeqa/sdk/testmetaidesupport.py
+++ b/meta/lib/oeqa/sdk/testmetaidesupport.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
index bff6e7740c5..5f1c8df2d49 100644
--- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 75195241b79..ffdea832be3 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 1f5c5763568..3670d7b4378 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/bblogging.py b/meta/lib/oeqa/selftest/cases/bblogging.py
index 317e68b82f7..1534a36a85b 100644
--- a/meta/lib/oeqa/selftest/cases/bblogging.py
+++ b/meta/lib/oeqa/selftest/cases/bblogging.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 89267c71455..d97bda13c29 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 3b0b44b3908..bf6fdca0d99 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -1,4 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
+#
 import os
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
diff --git a/meta/lib/oeqa/selftest/cases/buildhistory.py b/meta/lib/oeqa/selftest/cases/buildhistory.py
index d865da6252d..2d559949160 100644
--- a/meta/lib/oeqa/selftest/cases/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/buildhistory.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index ad604d6ae26..ee3e28d74bf 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index e0aea1a1efc..23c0a1408a3 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index d0b22137039..ac47af1990b 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -1,3 +1,9 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
 import json
 import os
 from oeqa.selftest.case import OESelftestTestCase
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index bde345f6bd4..ec08ac6d600 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index b80d091c1c6..b5554a6c3c3 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index 3ea0f663575..9f5de2cde7f 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index be14272e635..3d01cf69f2c 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index d732a9020d5..14267dbaaa3 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index b9ea03ae62d..6b9022e4619 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -1,4 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
+#
 import os
 from oeqa.core.decorator import OETestTag
 from oeqa.core.case import OEPTestResultTestCase
diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index 2c733a13427..3124902543c 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -1,3 +1,6 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 import os
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 6fc98e9cb47..a446543a171 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -1,4 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
+#
 import os
 import contextlib
 from oeqa.core.decorator import OETestTag
diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index 978898b86f1..74c1c481173 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
index 5b182a8f940..17c98baf143 100644
--- a/meta/lib/oeqa/selftest/cases/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 7deafef6b2c..d3fd52851c0 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 6279d742459..c58d7003be7 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -1,3 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
diff --git a/meta/lib/oeqa/selftest/cases/intercept.py b/meta/lib/oeqa/selftest/cases/intercept.py
index f12874dc7d1..12583c3099d 100644
--- a/meta/lib/oeqa/selftest/cases/intercept.py
+++ b/meta/lib/oeqa/selftest/cases/intercept.py
@@ -1,3 +1,9 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
diff --git a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
index b1623a18854..4325f385987 100644
--- a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
+++ b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
@@ -1,3 +1,9 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, get_bb_var
diff --git a/meta/lib/oeqa/selftest/cases/layerappend.py b/meta/lib/oeqa/selftest/cases/layerappend.py
index 8fb1e6c5304..379ed589ad9 100644
--- a/meta/lib/oeqa/selftest/cases/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index afe8f8809f7..fab69291981 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index 8f1226e6a5f..5897a396d93 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 0a04c13a856..07a6c804896 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index ce7bba401d6..bae98359e54 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/selftest/cases/multiconfig.py
index 83cbd1345da..f509cbf607f 100644
--- a/meta/lib/oeqa/selftest/cases/multiconfig.py
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/newlib.py b/meta/lib/oeqa/selftest/cases/newlib.py
index 999e3e78b08..fe57aa51f23 100644
--- a/meta/lib/oeqa/selftest/cases/newlib.py
+++ b/meta/lib/oeqa/selftest/cases/newlib.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 33bd6df2f3f..c3c15d83c0f 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/elf.py b/meta/lib/oeqa/selftest/cases/oelib/elf.py
index 5a5f9b4fdf6..7bf550b6fdb 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/elf.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/elf.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
index 3b359396b67..5eea12e7619 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index a1cfa08c09f..b963e447e37 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/types.py b/meta/lib/oeqa/selftest/cases/oelib/types.py
index 7eb49e6f95a..58318b18b21 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/types.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/types.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index bbf67bf9c9b..0cb46425a02 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index d3a789a6a77..ea08d9aff88 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 96beb8b869b..bff22f21b60 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 51d835259e4..2d1b48a15df 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 87d069de65a..d786c33018d 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 10158ca7c2e..cb95503c2cb 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/pseudo.py b/meta/lib/oeqa/selftest/cases/pseudo.py
index 33593d5ce9d..3ef87860226 100644
--- a/meta/lib/oeqa/selftest/cases/pseudo.py
+++ b/meta/lib/oeqa/selftest/cases/pseudo.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 510dae6badf..25b06cdcf02 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
index 74b2098ae8b..6334f1c91a7 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index dac5c468011..c2e76f1a440 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index e9612389fec..6fd96b84850 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 857737f730c..7c3faefeaea 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/selftest.py b/meta/lib/oeqa/selftest/cases/selftest.py
index 7268e259395..a80a8651a5b 100644
--- a/meta/lib/oeqa/selftest/cases/selftest.py
+++ b/meta/lib/oeqa/selftest/cases/selftest.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 6f3d4aeae99..322e753ed3b 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/sstate.py b/meta/lib/oeqa/selftest/cases/sstate.py
index 176766331ad..e73bb948841 100644
--- a/meta/lib/oeqa/selftest/cases/sstate.py
+++ b/meta/lib/oeqa/selftest/cases/sstate.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 0ba1d866967..ae766f91bd8 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index 294ba4a4a06..ef854f6feeb 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index c81d56d82b0..0a66615fd1b 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/selftest/cases/wrapper.py b/meta/lib/oeqa/selftest/cases/wrapper.py
index 6de63310c09..f2be44262c5 100644
--- a/meta/lib/oeqa/selftest/cases/wrapper.py
+++ b/meta/lib/oeqa/selftest/cases/wrapper.py
@@ -1,3 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 6d1ec4cb99b..fbc7f7d525d 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 # Enable other layers to have modules in the same named directory
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 95a79a571c9..bcee03b5768 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index 3093419cc70..a50aaa84c29 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 58d3c3b3f87..8ce1dd42f49 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 879aefca338..7cb79a8402a 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/utils/network.py b/meta/lib/oeqa/utils/network.py
index 59d01723a1e..da4ffda9a99 100644
--- a/meta/lib/oeqa/utils/network.py
+++ b/meta/lib/oeqa/utils/network.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
index a37686c9142..c1218656ce2 100644
--- a/meta/lib/oeqa/utils/nfs.py
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -1,4 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
+#
 import os
 import sys
 import tempfile
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index 6b67f22fdd4..db799b64d64 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/meta/lib/oeqa/utils/subprocesstweak.py b/meta/lib/oeqa/utils/subprocesstweak.py
index b47975a4bc0..3e43ed547bd 100644
--- a/meta/lib/oeqa/utils/subprocesstweak.py
+++ b/meta/lib/oeqa/utils/subprocesstweak.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 import subprocess
diff --git a/meta/lib/rootfspostcommands.py b/meta/lib/rootfspostcommands.py
index fdb9f5b8509..b5a51295e26 100644
--- a/meta/lib/rootfspostcommands.py
+++ b/meta/lib/rootfspostcommands.py
@@ -1,4 +1,6 @@
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-- 
2.34.1


