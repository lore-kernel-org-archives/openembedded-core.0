Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C9E2671B47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 13:43:15 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id g23so114987275wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 05:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=W4ujPQ9D2PCk+rhwldD6FnFR6HYMqwn2Xdvyef0dSTc=;
	b=qMhqX/je1sDOYX7a5OsdVY4MtRKy5W865Eq7smL4NxfqP6Jby741oYa3YPVgSoxoMY
	fDBzSE+lcM8Ce6vYEx0wZIfU++aUlibFUuvoI3ZNjlznN6eDeLsPsCywn6YWMQyaiuUv
	UA3uN27piwiXRDEwQ1OO4ZvYObcM5Wsrtk/qNRHY0yHURmdSVVK3IGbUdtEF06eva+wN
	9hzv4XPcefZCOjhG/qcJcC7O1Qjf9TmjqtXXT2FGJr4wcOyhnP+WZJlqsIE3iD51A2LQ
	1WiVTu86kL6xQpAnmpm48ntxibjItaKK8WVMTSOft4jkQpnLhCWWeCvnePfUnQte5pLb
	w2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=W4ujPQ9D2PCk+rhwldD6FnFR6HYMqwn2Xdvyef0dSTc=;
	b=Xq2P7YeBi/FCP+kFpQ7sFgogwE33aj5d8RA9wVNPvXoSPeecEg0dyAPnkPd0MGCO98
	YYYVu9p+g2+9dDRKrSaP96wFCPPaoo6tdoIfICeg9ogNEstAkI8DkMg04QgBxdrrkfMs
	lo1wvXBCuV+YaJujKqw5nzQXlbNpc4VbA/LuR2XYEbyXETqHAoDMqt1Cr9cS+eWcML+3
	0PmNHRZ39FWR+nVmQh7YfJuH9SqaTPRBSORh92aU75TLBqmEMb75yaoUN7YH8Fumcp5D
	HApgTx3ZXa8oYNNl3uJRZ1pWwFjRPhNXREZRgw2ctNB6WhkDFnu0HKR551Wo9NGJDbuR
	Vc0g==
X-Gm-Message-State: AKaTC02gRqc/S3LnLJU6Ru8Y7asiVA84GMHQnCtk+wLjOSYAEzYmibX/ez7+PCVoKT/wLoYU
X-Received: by 10.28.185.78 with SMTP id j75mr2457608wmf.14.1479994996560;
	Thu, 24 Nov 2016 05:43:16 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c81sm8246363wmf.22.2016.11.24.05.43.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 05:43:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 13:43:11 +0000
Message-Id: <1479994991-10811-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1479994991-10811-1-git-send-email-ross.burton@intel.com>
References: <1479994991-10811-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] Revert "classes/populate_sdk_ext: require uninative"
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
X-List-Received-Date: Thu, 24 Nov 2016 13:43:17 -0000

The change to move C++ ABI tweaks to bitbake.conf should make this redundant, so
revert it.

This reverts commit c56cd49a12645e82d0a16bb94be16ac509f8813c.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 0e3656b..3c3a73c 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -114,6 +114,10 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
             f.write('SSTATE_MIRRORS_forcevariable = ""\n')
             # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
             f.write('TMPDIR_forcevariable = "${TOPDIR}/tmp"\n')
+            # Drop uninative if the build isn't using it (or else NATIVELSBSTRING will
+            # be different and we won't be able to find our native sstate)
+            if not bb.data.inherits_class('uninative', d):
+                f.write('INHERIT_remove = "uninative"\n')
 
         # Unfortunately the default SDKPATH (or even a custom value) may contain characters that bitbake
         # will not allow in its COREBASE path, so we need to rename the directory temporarily
@@ -609,9 +613,6 @@ fakeroot python do_populate_sdk_ext() {
     if d.getVar('SDK_ARCH', True) != d.getVar('BUILD_ARCH', True):
         bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH', True), d.getVar('BUILD_ARCH', True)))
 
-    if not bb.data.inherits_class('uninative', d):
-        bb.fatal('The extensible SDK requires uninative to be enabled. Enabling this is straightforward - just add the following to your configuration:\n\nrequire meta/conf/distro/include/yocto-uninative.inc\nINHERIT += "uninative"\n')
-
     d.setVar('SDK_INSTALL_TARGETS', get_sdk_install_targets(d))
     buildtools_fn = get_current_buildtools(d)
     d.setVar('SDK_REQUIRED_UTILITIES', get_sdk_required_utilities(buildtools_fn, d))
-- 
2.8.1


