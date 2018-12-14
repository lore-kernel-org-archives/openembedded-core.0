Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA7E7BDB7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:45 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k19-v6so5607606lji.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RfXz4JuIJqTva/u/4dKZSf+m/UzAs9pcgHYK2jcp3eY=;
	b=NMFuDfRqD0jTVXhV2d6H6iTKTIJ+lJ5hD4TuW+uo7N2LxIAYAAxnQPqJBEZOszsGCw
	T/yDgqcEqjlwyeozgZwTQXB3g7gUarFz0A+4sHvOP5oSJt2Wg6/QDnbjMkRGNAc3e9ux
	xN9zSxrKBngr9aoIgN2mfL8HsjDDt/lXQoahSEphCBPX+Jc1TWeB28nz3P0QwL60+SS7
	3fmCaLrZuhYi24RrmTxlyYwc8ym9fYfDzDo4rB8oetaeLIWRlNIUT2Bhah37PNHrjSZn
	kxRhkQcCyWZVmt7JkibONuUKQlipkkP6KSV3JuwTlpIXWYoBU7iUM5nAUzY4qTRAQeNJ
	301Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RfXz4JuIJqTva/u/4dKZSf+m/UzAs9pcgHYK2jcp3eY=;
	b=Fsjhp3cAmjYoV+KBr3vIec/MRPAe6gpUyqdltLom4poBGWp42njaDWscd23MZISlna
	RofrGFZxDaiIYL1IDAkmFzBeJ5iChWikAU8UgXmDyEPAeG1yPMR6RkeHalcprZnT8tD0
	fBw3LYiGRKaYgWgKcZAAoVqGU1xmrWDF5qG7Dnad4b2dhYrsg5v/uQN0ZuBlo2mt701E
	kubsB974k1GR/3ztCjCCEW0MxfdD6Lf2fOEjQ/zAybdvdQhHcfUhB63u8HZ/NTen7aj8
	ZrkFbYOfaQIwdyvJy8Tqz7z5hjodBlxsio8AAgVDsVeCxH01AXCDHl60k/r91kKAwbEK
	j1QQ==
X-Gm-Message-State: AA+aEWZT02tpvtQNT0+ejEawApe+kIvmMhCkXShCNiBLMAzQEjqFvarR
	+HjWDz/Y9hqziBP6jTRLMvj/uVZA
X-Google-Smtp-Source: AFSGD/W9y7gQUAp+pNjEucAnQb7GXCEWHPOhHcftH/qeT39eYOR1LCty4R2rHt+Jpv+68fvI2bCaHA==
X-Received: by 2002:a2e:841:: with SMTP id g1-v6mr2599259ljd.21.1544810146002; 
	Fri, 14 Dec 2018 09:55:46 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:45 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:32 +0200
Message-Id: <1544810082-22164-4-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 03/13] tune-power[5-7].inc: Disable QEMU usermode usage
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:46 -0000

The QEMU usermode fails with invalid instruction error when
used with those tunes.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/conf/machine/include/tune-power5.inc | 3 +++
 meta/conf/machine/include/tune-power6.inc | 3 +++
 meta/conf/machine/include/tune-power7.inc | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meta/conf/machine/include/tune-power5.inc b/meta/conf/machine/include/tune-power5.inc
index ab7aa6f..39501bd 100644
--- a/meta/conf/machine/include/tune-power5.inc
+++ b/meta/conf/machine/include/tune-power5.inc
@@ -19,3 +19,6 @@ PACKAGE_EXTRA_ARCHS_tune-ppc64p5 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p
 # glibc configure options to get power5 specific library
 GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
 GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
+
+# QEMU usermode fails with invalid instruction error
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/tune-power6.inc b/meta/conf/machine/include/tune-power6.inc
index 7075157..1d5e8ec 100644
--- a/meta/conf/machine/include/tune-power6.inc
+++ b/meta/conf/machine/include/tune-power6.inc
@@ -19,3 +19,6 @@ PACKAGE_EXTRA_ARCHS_tune-ppc64p6 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p
 # glibc configure options to get power6 specific library
 GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
 GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
+
+# QEMU usermode fails with invalid instruction error
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/tune-power7.inc b/meta/conf/machine/include/tune-power7.inc
index 8189317..8f3f037 100644
--- a/meta/conf/machine/include/tune-power7.inc
+++ b/meta/conf/machine/include/tune-power7.inc
@@ -19,3 +19,6 @@ PACKAGE_EXTRA_ARCHS_tune-ppc64p7 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p
 # glibc configure options to get power7 specific library
 GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
 GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
+
+# QEMU usermode fails with invalid instruction error
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' qemu-usermode', '', d)}"
-- 
2.7.4


