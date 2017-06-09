Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id D9BEF78296
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:04:13 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id i7so32709617ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gazr3NpFpQl+yq0isK8OLTayTdwdfj8IlmV+2UAlD3A=;
	b=OqFniovI6eO+n6NxnZGKr95ZdebNgTrb/yODh/DK0ErAugzMBz0YoAcT5yM0phsT3n
	XLE83jUdFNxBTCyqFSeXaKiFIpV0ns2p2/sn6X9jOevKuFlZ88+v5O3dKCT9ZHDaoDLb
	lLok7N7GXQrCwudEo3Cuu2lhRzaHsTt90sJ8/KcKAcWf/z0xwqk5CeVDYTZ+K/v3P56i
	xjyXSfdC/0MXU0yBB44+vOibnov1Nfb4F2eCKNVpGtbNDkH/PTVcfy6A5Md/ETyGNCmp
	JOKYjbzNNJDUglwqkL4pU9BIK7rTJpFAkBa4Sp1AU3Q1ykUd49YiJDaXe7auuki/EwAy
	A5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=gazr3NpFpQl+yq0isK8OLTayTdwdfj8IlmV+2UAlD3A=;
	b=rT+6kfkrMQHCGgyV57u8CHgfjUe+3S9oo7h4viDFknIRfJlW7a8aytGHF0rN8suy3w
	GV2pcqBCAuyYTau/TDm9pmTcWhISK6NSBPFLhcUlw8S+GN7eiXrP/DpeOT4FJP61tVbe
	GtmRZgdOoENoK7yoOUS6tKcHlLofpfVoDTVibaInx3gN/jb8XAT0cwHcy5UcaQGJ3xkY
	zsxwtdLSmAnRrVY+tvmDXmUzoMBx5vJ2zDqJA/+xjHu77Tj4odsT427sxPBq8ZyqY/Tn
	XqbnOewi6ivD/az19CykJpthrED4Yh5sQcmHyT14jmY+tzC7Ov6OLkS9ug0nQ3aEmUGU
	Sa2g==
X-Gm-Message-State: AODbwcAEU1o4m967WZyFPnc95gxC+Pa3XO0CUE7rcRIEOiKi5WYbPFG3
	wzQsmZuZRt/KHkYq2Zw=
X-Received: by 10.107.27.75 with SMTP id b72mr23586033iob.209.1497013454163;
	Fri, 09 Jun 2017 06:04:14 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C0DE.dip0.t-ipconnect.de.
	[93.232.192.222])
	by smtp.gmail.com with ESMTPSA id e81sm861643ite.6.2017.06.09.06.04.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Jun 2017 06:04:12 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 15:04:03 +0200
Message-Id: <9dfd9eff13b3831c7e88c97318f97d2daeac9a78.1497013310.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
References: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Fri, 09 Jun 2017 13:04:14 -0000

As discussed in "[Openembedded-architecture] Yocto Compatible 2.0 +
signature changes", changes in .bbappend must depend on some explicit
configuration change, typically selecting a distro feature.

For _append and _remove, adding an override that is set only when the
corresponding entry is in DISTRO_FEATURES achieves that:

In local.conf:
  DISTRO_FEATURES_append = " my-distro-feature"

In layer.conf:
  DISTRO_FEATURES_OVERRIDES += "my-distro-feature"

In a .bbappend:
  do_install_append_df-my-distro-feature () {
       ...
  }

The subset of DISTRO_FEATURES that are made available as overrides
must be configured explicitly because using them this way should
be a conscious decision.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/conf/bitbake.conf | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3ad905c..fce1882 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -713,7 +713,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}${DISTROFEATURESOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
 OVERRIDES[vardepsexclude] = "MACHINEOVERRIDES"
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
@@ -722,6 +722,21 @@ MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
 
 FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
 
+# Turns certain DISTRO_FEATURES into overrides of the same name
+# or (optionally) some other name. Ensures that these special
+# distro features remain set also for native and nativesdk
+# recipes, so that these overrides can also be used there.
+#
+# Beware that this part of OVERRIDES changes during parsing, so usage
+# of these overrides should be limited to .bb and .bbappend files,
+# because then DISTRO_FEATURES is final.
+DISTRO_FEATURES_OVERRIDES ??= ""
+DISTRO_FEATURES_OVERRIDES[doc] = "A space-separated list of <feature> entries. \
+Each entry is added to OVERRIDES as df-<feature> if <feature> is in DISTRO_FEATURES."
+DISTRO_FEATURES_FILTER_NATIVE_append = " ${DISTRO_FEATURES_OVERRIDES}"
+DISTRO_FEATURES_FILTER_NATIVESDK_append = " ${DISTRO_FEATURES_OVERRIDES}"
+DISTROFEATURESOVERRIDES = "${@ ''.join([':df-' + x for x in (set(d.getVar('DISTRO_FEATURES_OVERRIDES').split()) & set((d.getVar('DISTRO_FEATURES') or '').split()))]) }"
+
 ##################################################################
 # Include the rest of the config files.
 ##################################################################
-- 
git-series 0.9.1

