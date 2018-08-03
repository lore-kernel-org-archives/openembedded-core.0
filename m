Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id EC4CD78E49
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 14:10:32 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id v71-v6so8535140itb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pvE6yGrJFaUWOGWNwKy/57wMCtIx40umGlzY5iCMXsc=;
	b=M98D6fKCxduRLL3QFJDYUYH1+Z3YdrWmAtOYTp6OD1fje6k+JpAOuG6dbmK2IHQetj
	Vo2huKlPZcFabFxthjoCKJixbbMX/kklZM0hvKen/uephf33SdTsFYnN3OxVLjUpYSPa
	n1t/DpXHMCSFgUdXKAY3VkQJEkeL8nZkiqaBt7LiianfBBP/MxmeHg0NqzHhz5HmYD2o
	SHLdOjJLAqRCB0UW2yxqZdK4H//emKRoNZlMIs7jrYsZdwjQgcj0m1fBIV3rNmOld0JF
	k2FmU0RB83KYmxsHiq8WOVhLYVdRRtDb0tXqKAfLibNxGIKSNLGPd+HsL6/3I03QRbm8
	EsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pvE6yGrJFaUWOGWNwKy/57wMCtIx40umGlzY5iCMXsc=;
	b=JXzoNmQUPI6u66EH5hF5+SCy3we0acUdjVbM1iNY7AYEt+XjX1KUeJfjvw8O3TXmYj
	i/IGo+eoGNqFUzhA9O+6kS+aobjZ+enPH7iYeFtt/tGcHPSCY2jHlmiW7lkCHUpB6SyZ
	+qv9km2KYsCP7WwXmWs+id/YM1t1cB9O5rCoCbL+Yv23ORQmZfdeFBi2W461/7SXNLyv
	ig3uxk1RhSEdMxLoP1GHlB4yAHujIOeXEuXwaq46XaVH9DvSjnDobKFNIrIkNoEukfBH
	fSOXmQgxrJeWxhCWPxiEqD7lVyAyNkjdIqTefxyCb3dEal649mHAWrEmeorwC8WJOecX
	lhFQ==
X-Gm-Message-State: AOUpUlHXJ17J0efmH7jYbme+xn61xt3mnAoKigpdLgoOGSPyvgrXBUT+
	4v0ceJppHxmoxazBNuWSTRXVLzJv
X-Google-Smtp-Source: AAOMgpeD1todCOcYsjBeTlZVwi1Ykh9Pm/sC1IvhXiLMHN3N4/wx4tj8muUNrayRg33412BZwHxzFg==
X-Received: by 2002:a02:e44:: with SMTP id 65-v6mr3636873jae.7.1533305433776; 
	Fri, 03 Aug 2018 07:10:33 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	u139-v6sm2964748ita.1.2018.08.03.07.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Aug 2018 07:10:33 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri,  3 Aug 2018 09:10:30 -0500
Message-Id: <20180803141030.7483-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803134831.16694-1-JPEWhacker@gmail.com>
References: <20180803134831.16694-1-JPEWhacker@gmail.com>
Cc: Tanu Kaskinen <tanuk@iki.fi>
Subject: [PATCH v3] alsa-lib: Cleanup packaging
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
X-List-Received-Date: Fri, 03 Aug 2018 14:10:33 -0000

Cleans up the packaging by moving libasound.so.2 back into the alsa-lib
package which was previously empty.

Previously, it was difficult to create an image that had libasound.so.2,
then create an SDK from that image that had the proper development
files, because the only way to get libasound.so.2 was to do:

 IMAGE_INSTALL += "libasound"

This however caused a problem because all of the development files that
would be desired in the SDK were located in alsa-lib-dev, which wouldn't
be included because alsa-lib wasn't included, and it was impossible to
include alsa-lib because it was an empty package that was culled.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
index 6364e9eafaa..25e7a3c6b72 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
@@ -18,19 +18,18 @@ EXTRA_OECONF += " \
     --disable-python \
 "
 
-PACKAGES =+ "alsa-server libasound alsa-conf alsa-doc"
+PACKAGES =+ "alsa-server alsa-conf alsa-doc"
 
-FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
 
-RDEPENDS_libasound = "alsa-conf"
-
-# alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
-# alsa-lib package doesn't exist. libasound is the real library package.
-RDEPENDS_${PN}-dev = "libasound"
+RDEPENDS_${PN}_class-target = "alsa-conf"
 
 # upgrade path
+RPROVIDES_${PN} = "libasound"
+RREPLACES_${PN} = "libasound"
+RCONFLICTS_${PN} = "libasound"
+
 RPROVIDES_${PN}-dev = "alsa-dev"
 RREPLACES_${PN}-dev = "alsa-dev"
 RCONFLICTS_${PN}-dev = "alsa-dev"
-- 
2.17.1


