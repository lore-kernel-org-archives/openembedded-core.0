Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3BCA9615AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 15:21:57 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so199380wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XwD3Q2mjk7Zq125O6BA86idzFv3s+bF7ex0d75vmh28=;
	b=hoP/3viFpORmjDZDvDfAuqx4FPrHC3cLTsQAUQI0TqWi4B1mff4d/YFPVFG+pjZ+Qc
	hqQKaElTEpjVYbkcioDQgdcaVSpz/Gqn86BgW8jlzOlhc4EsJi65tE1xRzQXegXSiOUA
	DubSPZ1mNaUCLKsVFqKZTR97BWnoyrfsiqfZarK4q1glc84BspB/FPejV5JtcsnLPlPc
	4B/cNZ2VIdnXxDo1OHZr6IuwfNalRXVi4LpePu2Ha0+iqdXbYP2lyqEgjp3ApVkXxauO
	0JhVTubDau/aQN3YrEpETUG0est2XmETUbI8pv5BR2VCqCNEb6+Eb2ENxTmRaWUnuBRJ
	iMgA==
X-Gm-Message-State: ALoCoQkfOWQb7S72KfnxYr9Put/FEVTrMZ9KD7SaYGxx9pfVTjncpKjtoSj02tt6sjxxjjgavgU6
X-Received: by 10.180.221.38 with SMTP id qb6mr6286243wic.8.1385047316330;
	Thu, 21 Nov 2013 07:21:56 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f15sm6386517wik.6.2013.11.21.07.21.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 07:21:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2013 15:21:39 +0000
Message-Id: <1385047299-2597-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] packagegroup-core-tools-profile: add systemd-analyze
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
X-List-Received-Date: Thu, 21 Nov 2013 15:21:57 -0000

If the systemd DISTRO_FEATURE is enabled, then recommend systemd-analyze for
profiling boot performance.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 9eb1458..4a97c24 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -17,6 +17,7 @@ RREPLACES_${PN} = "task-core-tools-profile"
 RCONFLICTS_${PN} = "task-core-tools-profile"
 
 PROFILE_TOOLS_X = "${@base_contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
+PROFILE_TOOLS_SYSTEMD = "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"
 
 RRECOMMENDS_${PN} = "\
     perf \
@@ -24,6 +25,7 @@ RRECOMMENDS_${PN} = "\
     kernel-module-oprofile \
     blktrace \
     ${PROFILE_TOOLS_X} \
+    ${PROFILE_TOOLS_SYSTEMD} \
     "
 
 PROFILETOOLS = "\
-- 
1.7.10.4


