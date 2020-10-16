Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11487.1602840087042982749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72C2B113E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:21:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 098863F719
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:21:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] waf: add ${B} to do_configure[cleandirs]
Date: Fri, 16 Oct 2020 10:21:22 +0100
Message-Id: <20201016092122.2002294-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016092122.2002294-1-ross.burton@arm.com>
References: <20201016092122.2002294-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

As waf is always out-of-tree, we can delete ${B} before every build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/waf.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 8fa5063645..188119f356 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -6,6 +6,7 @@ DISABLE_STATIC =3D ""
 WAF_PYTHON ?=3D "python3"
=20
 B =3D "${WORKDIR}/build"
+do_configure[cleandirs] +=3D "${B}"
=20
 EXTRA_OECONF_append =3D " ${PACKAGECONFIG_CONFARGS}"
=20
--=20
2.25.1

