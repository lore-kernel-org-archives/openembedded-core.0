Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30181.1620643724914204395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 03:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ECA31688
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:48:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A53113F719
	for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:48:43 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libnotify: whitelist CVE-2013-7381 (specific to the NodeJS bindings)
Date: Mon, 10 May 2021 11:48:39 +0100
Message-Id: <20210510104840.515815-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510104840.515815-1-ross.burton@arm.com>
References: <20210510104840.515815-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb b/meta/recip=
es-gnome/libnotify/libnotify_0.7.9.bb
index 1ff4b2e15fe..bbbd72193e2 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -30,3 +30,6 @@ PROVIDES +=3D "libnotify3"
 RPROVIDES_${PN} +=3D "libnotify3"
 RCONFLICTS_${PN} +=3D "libnotify3"
 RREPLACES_${PN} +=3D "libnotify3"
+
+# -7381 is specific to the NodeJS bindings
+CVE_CHECK_WHITELIST +=3D "CVE-2013-7381"
--=20
2.25.1

