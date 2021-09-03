Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4214.1630675506386042163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAD9AD6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 768CD3F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:09 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/14] ffmpeg: update LICENSE
Date: Fri,  3 Sep 2021 14:24:57 +0100
Message-Id: <20210903132459.2560051-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, ffmpeg comprises of several licenses which are
BSD-like.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_4.4.bb
index e19077541ec..f822ba9ab78 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "FFmpeg is the leading multimedia framewo=
rk, able to decode, encod
 HOMEPAGE =3D "https://www.ffmpeg.org/"
 SECTION =3D "libs"
=20
-LICENSE =3D "BSD & GPLv2+ & LGPLv2.1+ & MIT"
+LICENSE =3D "GPLv2+ & LGPLv2.1+ & ISC & Expat & BSD-2-Clause & BSD-3-Cla=
use & IJG"
 LICENSE:${PN} =3D "GPLv2+"
 LICENSE:libavcodec =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GP=
Lv2+', 'LGPLv2.1+', d)}"
 LICENSE:libavdevice =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'G=
PLv2+', 'LGPLv2.1+', d)}"
--=20
2.25.1

