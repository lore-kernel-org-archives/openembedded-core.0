Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9200.1631789477412669308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 03:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA2C86D
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 03:51:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84CA63F59C
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 03:51:15 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ffmpeg: fix LICENSE
Date: Thu, 16 Sep 2021 11:51:11 +0100
Message-Id: <20210916105111.1013685-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Expat isn't a license name we have, use MIT instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_4.4.bb
index f822ba9ab78..fc1834c00b2 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "FFmpeg is the leading multimedia framewo=
rk, able to decode, encod
 HOMEPAGE =3D "https://www.ffmpeg.org/"
 SECTION =3D "libs"
=20
-LICENSE =3D "GPLv2+ & LGPLv2.1+ & ISC & Expat & BSD-2-Clause & BSD-3-Cla=
use & IJG"
+LICENSE =3D "GPLv2+ & LGPLv2.1+ & ISC & MIT & BSD-2-Clause & BSD-3-Claus=
e & IJG"
 LICENSE:${PN} =3D "GPLv2+"
 LICENSE:libavcodec =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GP=
Lv2+', 'LGPLv2.1+', d)}"
 LICENSE:libavdevice =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'G=
PLv2+', 'LGPLv2.1+', d)}"
--=20
2.25.1

