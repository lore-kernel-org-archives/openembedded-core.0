Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.73.1622564514405172971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 09:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05FE211B3
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jun 2021 09:21:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4DE53F719
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jun 2021 09:21:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] core-image-weston: remove Clutter examples
Date: Tue,  1 Jun 2021 17:21:43 +0100
Message-Id: <20210601162144.2379642-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601162144.2379642-1-ross.burton@arm.com>
References: <20210601162144.2379642-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The Clutter examples are pretty, but Clutter is dead so we should stop
using it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/images/core-image-weston.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/rec=
ipes-graphics/images/core-image-weston.bb
index e82e4fbb3f..62305cc1ce 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -6,7 +6,7 @@ LICENSE =3D "MIT"
=20
 inherit core-image
=20
-CORE_IMAGE_BASE_INSTALL +=3D "gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL +=3D "gtk+3-demo"
 CORE_IMAGE_BASE_INSTALL +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x=
11', 'weston-xwayland matchbox-terminal', '', d)}"
=20
 QB_MEM =3D "-m 512"
--=20
2.25.1

