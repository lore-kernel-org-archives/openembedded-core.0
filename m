Return-Path: <prvs=69896df8b5=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA8F60119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 13:30:33 +0000 (UTC)
X-AuditID: 0a00029b-f79876d000000e4a-4e-57751ef839f1
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	EB.8E.03658.9FE15775; Thu, 30 Jun 2016 08:30:33 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Thu, 30 Jun 2016 08:30:32 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] pusleaudio: Fix missing libcheck dependency
Thread-Index: AQHR0tOTCivAB1qk+E+KxkfQeIFMnQ==
Date: Thu, 30 Jun 2016 13:30:32 +0000
Message-ID: <1467293398-12667-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.137]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsWyRiBPQ/enXGm4wfar4hZ3fr5jd2D0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd0bvRbmCP+wV+571MDcwvmXrYuTkkBAwkdi4ZwuULSZx4d56
	IJuLQ0jgKKPEi4XfWCGcWYwSnW/vMYNUsQkYSZy7vokRxBYRiJZYOmMmO4jNLGAg8W7zRlYQ
	W1jARmLi72csEDWOEj+aNwL1cgDZehJP7gSAhFkEVCWmtHxlAQnzCnhKTDkUDxJmBLrh+6k1
	TBATxSVuPZnPBHGbgMSSPeeZIWxRiZeP/7GCtEoIyEn83+IBUa4ncWPqFDYIW1ti2cLXYOW8
	AoISJ2c+YZnAKDILydRZSFpmIWmZhaRlASPLKka+XCO91OLisvySVL3k/NxNjMBA52Jgmr2D
	cc8Eh0OMAhyMSjy8F8xKwoVYE8uKK3MPMUpzsCiJ86oIKYULCaQnlqRmp6YWpBbFF5XmpBYf
	YmTi4DzEKMHBJSVSnJqXklqUWFqSEQ+Kp/hiYERJNTCybGp6t55rBu+FCrE5WxpsArp8w1O2
	RCyKvNm6pEB0v6TjqaDdh5YW7yw5/vBii5lJUNrUzN+J74vfSjcemns7zfeV1j7HvK2Te+/E
	HBM9kaMr+HHSRSfbvRqB7PVKi2Oy+LU3zW5ZGXeEJf/Np+dCPYs6DTkfbVO/s+6DuN/mHfHf
	qo/o7+FVYinOSDTUYi4qTgQAGbaYBHACAAA=
Subject: [PATCH] pusleaudio: Fix missing libcheck dependency
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
X-List-Received-Date: Thu, 30 Jun 2016 13:30:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc
index 8a28ca7..f2a1aa8 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://GPL;md5=3D4325afd396febcb659c3=
6b49533135d4 \
                     file://LGPL;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/pulsecore/resampler.h;beginline=3D4;endline=
=3D21;md5=3D09794012ae16912c0270f3280cc8ff84"
=20
-DEPENDS =3D "libatomic-ops libsndfile1 libtool intltool-native"
+DEPENDS =3D "libatomic-ops libsndfile1 libtool intltool-native libcheck"
 # optional
 DEPENDS +=3D "udev alsa-lib glib-2.0 gconf"
 DEPENDS +=3D "json-c gdbm speexdsp libxml-parser-perl-native libcap"
--=20
2.5.5

