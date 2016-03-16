Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 238EE7002B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 16:48:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2GGmRMh028136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2016 09:48:27 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Mar 2016 09:48:27 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Mar 2016 12:48:20 -0400
Message-ID: <21274a3a09fd4d5ab7bab7b68cf44d08a503c889.1458146315.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1458146315.git.bruce.ashfield@windriver.com>
References: <cover.1458146315.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/4.1: Intel Broxton and Sunrisepoint-H: pinctrl and drm
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
X-List-Received-Date: Wed, 16 Mar 2016 16:48:28 -0000
Content-Type: text/plain

Integrating the following mainline commits:

  9073fd86a770 pinctrl: intel: Add Intel Broxton pin controller support
  e27702b5f5bd pinctrl: intel: Allow requesting pins which are in ACPI mode as GPIOs
  3466e9acff01 pinctrl: intel: Add support for multiple GPIO chips sharing the interrupt
  5577b683671b pinctrl: intel: Fix compilation warning when !CONFIG_PM_SLEEP
  bd4a97523251 pinctrl: make pinctrl_register() return proper error code
  08422ac780d5 pinctrl: intel: sunrisepoint: Add Intel Sunrisepoint-H support
  e6556d6f8924 drm/i915/audio: add codec wakeup override enabled/disable callback
  4a4d5aab97cc ALSA: hda - Add hduadio support to DEVTABLE

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 7a24b98151a3..bd4fbbd33d1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "3216ec88ce3221d8f4744c84b6314458163493d9"
+SRCREV_machine ?= "fe96b2fe1c896675ef3b62d2aae9ec2082a48899"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 76fdf0dae4e0..1002b29ae7bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
+SRCREV_machine ?= "9073fd86a770707cceb817867460db72eaa9f107"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 4c16873a27a5..ff82047c5488 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6b5ee65b1f353c9b6a61402bfa6919f8f7a1969b"
-SRCREV_machine_qemuarm64 ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
-SRCREV_machine_qemumips ?= "fb0ec85bc42dc0893440e825cbdb709c15bc1704"
-SRCREV_machine_qemuppc ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
-SRCREV_machine_qemux86 ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
-SRCREV_machine_qemux86-64 ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
-SRCREV_machine_qemumips64 ?= "b9ee3a1ff68fbb978864203735b4d0e200ee50f4"
-SRCREV_machine ?= "24e2e14aa446f6e4e127f2a0a004a72c430f337e"
+SRCREV_machine_qemuarm ?= "3c2c6e8e8b528b9be1e034975623fd98e51bfc52"
+SRCREV_machine_qemuarm64 ?= "9073fd86a770707cceb817867460db72eaa9f107"
+SRCREV_machine_qemumips ?= "bee0b4b4981c34ea515758d0da3ad68012b8d0bf"
+SRCREV_machine_qemuppc ?= "9073fd86a770707cceb817867460db72eaa9f107"
+SRCREV_machine_qemux86 ?= "9073fd86a770707cceb817867460db72eaa9f107"
+SRCREV_machine_qemux86-64 ?= "9073fd86a770707cceb817867460db72eaa9f107"
+SRCREV_machine_qemumips64 ?= "600bca3cd7994a86ce1899132d1665ae0290c67a"
+SRCREV_machine ?= "9073fd86a770707cceb817867460db72eaa9f107"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


