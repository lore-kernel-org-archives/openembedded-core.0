Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A75A476536
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 14:36:44 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so31583925wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 07:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=nHMdxSu/6AXTEiHG+VMZc4Q50qe0aBkuUqE0CSve5fM=;
	b=kqhYmzPxRnXCaiyceWAwr6MQE5vJJojP8NooJ45k72/Htr+bRVtEsekV45nB12o61U
	P2OpPQcbx6TwNBqdMQaflys6S+tSxu3lNVkUHwrN8hlwLuy2KsF/uzpRM+MbaaXdz/qe
	6ZCSGhgGnXEf9f9SZunEIMKDFC+wkkM6xi+nLViuXBQMM6CHy5BUYjCAckmgnqOsAw67
	wV9BikU+bK+JJw/ZaVAoOYeuPgZx5gfj5y6gh1sqNx7DmbY8cUuiXFwJCf/eK6/VpGG2
	Pl5g7Y2c1Fo5CdC8z68UF31QrFW06YUbu0u5/I3QB/z3/ioK0jPRMErguiA+jDkO1PQv
	8YxQ==
X-Received: by 10.180.106.98 with SMTP id gt2mr4552522wib.31.1444315004177;
	Thu, 08 Oct 2015 07:36:44 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id g5sm7507878wix.13.2015.10.08.07.36.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Oct 2015 07:36:43 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
Date: Thu, 8 Oct 2015 16:36:42 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Thu, 08 Oct 2015 14:36:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This updates libusb1 from 1.0.19 to 1.0.20

2015-09-13: v1.0.20
* Add Haiku support
* Fix multiple memory and resource leaks (#16, #52, #76, #81)
* Fix possible deadlock when executing transfer callback
* New libusb_free_pollfds() API
* Darwin: Fix devices not being detected on OS X 10.8 (#48)
* Linux: Allow larger isochronous transfer submission (#23)
* Windows: Fix broken builds Cygwin/MinGW builds and compiler warnings
* Windows: Fix broken bus number lookup
* Windows: Improve submission of control requests for composite devices
* Examples: Add two-stage load support to fxload (#12)
* Correctly report cancellations due to timeouts
* Improve efficiency of event handling
* Improve speed of transfer submission in multi-threaded environments
* Various other bug fixes and improvements
The (#xx) numbers are libusb issue numbers, see ie:
https://github.com/libusb/libusb/issues/16

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-support/libusb/{libusb1_1.0.19.bb =3D> libusb1_1.0.20.bb} =
| 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.19.bb =3D> =
libusb1_1.0.20.bb} (85%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.19.bb =
b/meta/recipes-support/libusb/libusb1_1.0.20.bb
similarity index 85%
rename from meta/recipes-support/libusb/libusb1_1.0.19.bb
rename to meta/recipes-support/libusb/libusb1_1.0.20.bb
index a20e1fc..21b8b45 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.19.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.20.bb
@@ -11,8 +11,8 @@ BBCLASSEXTEND =3D "native nativesdk"
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
           "
=20
-SRC_URI[md5sum] =3D "f9e2bb5879968467e5ca756cb4e1fa7e"
-SRC_URI[sha256sum] =3D =
"6c502c816002f90d4f76050a6429c3a7e0d84204222cbff2dce95dd773ba6840"
+SRC_URI[md5sum] =3D "1d4eb194eaaa2bcfbba28102768c7dbf"
+SRC_URI[sha256sum] =3D =
"cb057190ba0a961768224e4dc6883104c6f945b2bf2ef90d7da39e7c1834f7ff"
=20
 S =3D "${WORKDIR}/libusb-${PV}"
=20
--=20
2.4.3

--=20
Jens Rehsack - rehsack@gmail.com


