Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id BD83C762A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 18:41:43 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so102523257pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 11:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GYMONrtPm0KNHchmb3XzYEpmyU39ZlywOJIiaL047lM=;
	b=e0rXTfGS3eR+xaQ1Tm2LN8JFMrpT530TLPM8sYD9rFOSDb7mMqZ0QNsovCMHgLcbEQ
	y+5rDZ8q6xxPsr8OmYBVTrphaOvFzhh28D3UmNQOoOIIOggvB+UXU/2P642CZzJvz/S5
	cXZtNDrdKMPCjt6YEVd0RWBReaQYpPVDybJiSnCwtBqcETGBTKWgCqyVO3mnAMI3FStJ
	UN31I7/ShT9XO59ncqnUMH946u45BODgdltRxirczYyrM4z4FO2DxNBZoGa7e+A/mT4y
	bDtJKqInYYDsBMMmEvYmUw8g6/1mZQfq1Xu6vRVAga+8tM4WcRCRaTsWsKogzvqvLKcX
	e6Hg==
X-Received: by 10.68.230.33 with SMTP id sv1mr49213494pbc.160.1441651303458;
	Mon, 07 Sep 2015 11:41:43 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id if9sm560008pbc.89.2015.09.07.11.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Sep 2015 11:41:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 39E98FC07A4; Mon,  7 Sep 2015 11:41:37 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 11:41:33 -0700
Message-Id: <1441651293-27752-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] bind: update to 9.10.2-p4
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
X-List-Received-Date: Mon, 07 Sep 2015 18:41:44 -0000

fixes two secruity issues:
CVE-2015-5722 and CVE-2015-5986.

see release notes for more information.
ftp://ftp.isc.org/isc/bind9/9.10.2-P4/RELEASE-NOTES.bind-9.10.2-P4.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../bind/{bind_9.10.2-P3.bb => bind_9.10.2-P4.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.2-P3.bb => bind_9.10.2-P4.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
rename to meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
index 151eec0..66616b8 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P4.bb
@@ -21,8 +21,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            "
 
-SRC_URI[md5sum] = "a810d5d65fbdcf28dcda80d646913c3a"
-SRC_URI[sha256sum] = "78079a66dda455ffecfe93ef72d1ffc947f17b1c453d55ec06b860b49a5e1d4a"
+SRC_URI[md5sum] = "8b1f5064837756c938eadc1537dec5c7"
+SRC_URI[sha256sum] = "c00b21ec1def212957f28efe9d10aac52d6ec515e84fbf2c42143f5d71429cb8"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
-- 
1.9.1


