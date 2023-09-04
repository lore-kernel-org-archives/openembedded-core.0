Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEF5C83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 16:03:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.544.1693843419512957107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 09:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2639D1474;
	Mon,  4 Sep 2023 09:04:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EF783F740;
	Mon,  4 Sep 2023 09:03:38 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] cve-extra-exclusions: remove BlueZ issues
Date: Mon,  4 Sep 2023 17:03:35 +0100
Message-Id: <20230904160335.376303-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230904160335.376303-1-ross.burton@arm.com>
References: <20230904160335.376303-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 16:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187191

From: Ross Burton <ross.burton@arm.com>

These BlueZ issues were mislabelled as Linux issues, but now that the
CPE data is accurate this ignore can be removed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
index 84217e4acde..51926f342a1 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -74,11 +74,6 @@ CVE_STATUS_KERNEL_HISTORIC =3D "CVE-1999-0524 CVE-1999=
-0656 CVE-2006-2932 CVE-2007
 CVE_STATUS_KERNEL_HISTORIC[status] =3D "ignored"
=20
=20
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3563
-# https://nvd.nist.gov/vuln/detail/CVE-2022-3637
-CVE_STATUS[CVE-2022-3563] =3D "cpe-incorrect: This issue do not affect t=
he kernel, patchs listed on CVE pages links to https://git.kernel.org/pub=
/scm/bluetooth/bluez.git"
-CVE_STATUS[CVE-2022-3637] =3D "cpe-incorrect: This issue do not affect t=
he kernel, patchs listed on CVE pages links to https://git.kernel.org/pub=
/scm/bluetooth/bluez.git"
-
 # qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/C=
VE-2021-20255
 CVE_STATUS[CVE-2021-20255] =3D "upstream-wontfix: \
 There was a proposed patch https://lists.gnu.org/archive/html/qemu-devel=
/2021-02/msg06098.html \
--=20
2.34.1


