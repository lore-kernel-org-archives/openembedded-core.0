Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9F55A771B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 02:18:05 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id uo6so14794556pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 18:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b3dODbUCDyZao7CI7cRnEwop6efA5VkbVTiiXht11Ic=;
	b=JWhe6EvAK9NHuKQ+5SPFk/qHzcq4Euner/BXwMIdO+wP090+DB8RLTrfBMS0yzkV2D
	VaphtPspGOj4W5QE2PPUUeYuX4jx+ZF/CLGWuNrbfbNZYnlWF0SBbhK8N9gIWn3LgBxn
	9ol7lTB5mOIhtnkwfVL6lvjM06/CLQhPvdDtAH6rT7cagjpBmK/c6o8Ebbf1Cv5jWHtm
	vvuYK0Rtlvz6V4wmcuz2dpP7NAWA29XnwrGPmNUyZD94kmWJZISfQ4SWG4+7cCpjU8Cy
	yUvV4tKrBCWjc26gAex9SlHQ1l2LQvEljtA1QTGSeWKHQkahYenytd6pG/Hw7YwJ03ZF
	8Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b3dODbUCDyZao7CI7cRnEwop6efA5VkbVTiiXht11Ic=;
	b=WwfgGg5X+g/cae++mwYI7VhfSwpMO+Lnj+sYOcpF57dfwZDMjChaiGonF0+wFnb2LN
	cQQYURbkCP1vTfOhzikRfVsEaz5b6s5s5DUyIkdS/jUi8PuorIMaTtG1wtwz9pNqnB+R
	/CIo5jRRnh1UVqPjo96M/ohUVQRw4uZ3x0KW5rpP2pO+71nlDe5pAI1IzHArHR1U2IP5
	4kq6UJaxPk5QqM+6SomAFtglo9mRfjd2X/5CbFbMmSlquiZP4WXTpX5d56Swnpkdt+M4
	UM25aP5R1blWFIp+ZiwPTGQCs8hXysb8MCQ3omlfgjDb1bbSsUQ+OobT3gd+0XGDOQTn
	Obhg==
X-Gm-Message-State: AG10YOS26wCLpo8H/Tl5ySUbMS5qvPoNOL+UhaD7tmhI4IjDkMdiitIKrCSCErEVlY3TPw==
X-Received: by 10.66.255.39 with SMTP id an7mr759232pad.101.1453947486117;
	Wed, 27 Jan 2016 18:18:06 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	x81sm11844509pfa.72.2016.01.27.18.18.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 18:18:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 18:17:59 -0800
Message-Id: <1453947479-9270-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1453947479-9270-1-git-send-email-akuster808@gmail.com>
References: <1453947479-9270-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][master, jethro, fido] 2/2] tzdata: update to 2016a
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
X-List-Received-Date: Thu, 28 Jan 2016 02:18:05 -0000

From: Armin Kuster <akuster@mvista.com>

Changed LIC_CHKSUM_FILES to a new LICENSE  file.
Add BSD-3-clause to licenses

Changes affecting future time stamps

America/Cayman will not observe daylight saving this year after all.
Revert our guess that it would.  (Thanks to Matt Johnson.)

Asia/Chita switches from +0800 to +0900 on 2016-03-27 at 02:00.
(Thanks to Alexander Krivenyshev.)

Asia/Tehran now has DST predictions for the year 2038 and later,
to be March 21 00:00 to September 21 00:00.  This is likely better
than predicting no DST, albeit off by a day every now and then.

Changes affecting past and future time stamps

America/Metlakatla switched from PST all year to AKST/AKDT on
2015-11-01 at 02:00.  (Thanks to Steffen Thorsen.)

America/Santa_Isabel has been removed, and replaced with a
backward compatibility link to America/Tijuana.  Its contents were
apparently based on a misreading of Mexican legislation.

Changes affecting past time stamps
Asia/Karachi's two transition times in 2002 were off by a minute.
(Thanks to Matt Johnson.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../tzdata/{tzdata_2015g.bb => tzdata_2016a.bb}                | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2015g.bb => tzdata_2016a.bb} (96%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2015g.bb b/meta/recipes-extended/tzdata/tzdata_2016a.bb
similarity index 96%
rename from meta/recipes-extended/tzdata/tzdata_2015g.bb
rename to meta/recipes-extended/tzdata/tzdata_2016a.bb
index ec6e236..cacc480 100644
--- a/meta/recipes-extended/tzdata/tzdata_2015g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016a.bb
@@ -1,15 +1,15 @@
 SUMMARY = "Timezone data"
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
-LICENSE = "PD & BSD"
-LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=996a9811747aa48db91ed239e5b355a1 \
-                    file://README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
+LICENSE = "PD & BSD & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
+
 DEPENDS = "tzcode-native"
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "8d46e8b225b9a04c75f5c39636435ad6"
-SRC_URI[tzdata.sha256sum] = "b923cdbf078491696b17bc8d069c74bce73fabc5774629da2f410c9b31576161"
+SRC_URI[tzdata.md5sum] = "0d3123eb1b453ec0620822bd65be4c42"
+SRC_URI[tzdata.sha256sum] = "5efa6b324e64ef921ef700ac3273a51895f672684a30e342f68e47871c6a8cd1"
 
 inherit allarch
 
-- 
2.3.5


