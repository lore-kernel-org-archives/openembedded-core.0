Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C14B7CB37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d17so15433445wre.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9t2UIfQ/V3V/DIj6iqpyk+yvuS/lHyGySjO5ctdkMII=;
	b=JILoicVQr/bBbK/VMHBkUxzXQV7Eb+iNX9IN6BYuKF0RLg0sW6gtXkcAHvSiY6dnJx
	RoMqEcwbQThpkxGnNJOybfA0gFCPxrKoLuwGkAbTDWOocqUsVPohctp/JUMuZugA3FHB
	myNdmFr9+moHEAhJnnbvJ8lDDLthEF/O4xjfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9t2UIfQ/V3V/DIj6iqpyk+yvuS/lHyGySjO5ctdkMII=;
	b=JVriZhcnA8kjJiKDwqJP9ExpXd9ELAhYDO8HhwszslXoLvl8mGdCdIduXtEW2rXR8S
	E4/1CigYtxOpVwtkvIpYutoWohmw9dq3RsKLTgY7FIlr9huceLnpX9g2kZ9JTUTWNHEO
	sPePjbX3JhFFYmOTWYzHUcLkbEkJUl6UIZPD36WLSl6JNOn+3t61813edW6fnKKYBgh2
	v7eZtmCItjnKnGxA7RRX+mtRQxwMxBA4OcF//h30EosIdotz8MDoiASiTp2kor+NvdOQ
	8HOnGA3E48sQiX+VS2FmDsB6kCBGaipFOfhBYqzNz0Pa08u+LWP0+Il2fFPWpNslbDgJ
	VGzw==
X-Gm-Message-State: AHQUAubmsO/U2gRvEjj9BEBN22h0eZ1UzIkzLNahCLIWBuJQsNUjrYhw
	NMvih3JBicKwU5mTY9E+qAfF2qwIkfs=
X-Google-Smtp-Source: AHgI3IZnefIsJZ5RDazgfGf4V1wFIslOUkitt/uTrCpERI1/+CvFNnF6VyqCEWKcHO5QynYPkCcxGQ==
X-Received: by 2002:a1c:ab87:: with SMTP id
	u129mr10358070wme.104.1550752896909; 
	Thu, 21 Feb 2019 04:41:36 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:21 +0000
Message-Id: <20190221124130.25733-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 05/14] less: upgrade 530 -> 549
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:36 -0000
Content-Transfer-Encoding: 8bit

The license checksum changed due to a change in copyright years.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/less/{less_530.bb => less_549.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/less/{less_530.bb => less_549.bb} (82%)

diff --git a/meta/recipes-extended/less/less_530.bb b/meta/recipes-extended/less/less_549.bb
similarity index 82%
rename from meta/recipes-extended/less/less_530.bb
rename to meta/recipes-extended/less/less_549.bb
index c07b1217449..140c89fcb0b 100644
--- a/meta/recipes-extended/less/less_530.bb
+++ b/meta/recipes-extended/less/less_549.bb
@@ -21,14 +21,15 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv3+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE;md5=2ef3e4b8dafc85612bc5254b8081e234"
+                    file://LICENSE;md5=ba01d0cab7f62f7f2204c7780ff6a87d \
+                    "
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
 	  "
 
-SRC_URI[md5sum] = "6a39bccf420c946b0fd7ffc64961315b"
-SRC_URI[sha256sum] = "503f91ab0af4846f34f0444ab71c4b286123f0044a4964f1ae781486c617f2e2"
+SRC_URI[md5sum] = "d12863d348077739a4d3bc67ad9b7f00"
+SRC_URI[sha256sum] = "eec42357903faabfb294ffcc41ff08cbb29db54db46568cd8d0ed15a0482e19d"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.20.1


