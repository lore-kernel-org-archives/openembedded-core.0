Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id CEDE27F0D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:35 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y10so309061plp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KIypmHm8Z54QEM2fpfii5FzVMtjCWIOvJGaoicL6sH4=;
	b=RomBSou3po2X30fERoNmEt+UUUXLNa5ZDi3PvTYjk0dCjSvDqphEbfHwHVdCcN9i05
	ddDZQnSGi1PxNSjKQWoHLMv0dWdsf4m1H/binHI2v7+ouHjT+g+GSxTCTqu9fqs8A9yf
	8pqfLk+qK9y3LvnwPwZJvsE77K4EjhP43/RMwElt6ZW5sKPjgzYeLlYSMogV/Ns+VENE
	DwWJE4b6fUnsPiLMinWqdNBCn4nXNqUB3nP13mrQLA6hYsIgU7YdZRTX/oPE1MC6RWL5
	j3EQxYT8MTyS3OtFQ9shK3c7l839gpc7tgQsDAjE3EWONufakYswH1uHskbhVyZINHFJ
	7PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KIypmHm8Z54QEM2fpfii5FzVMtjCWIOvJGaoicL6sH4=;
	b=adrOUMtUCjF5Zs5JxYda5LWmZvDE+Z+lKoa6KP0lH7gdi3dH8yRrUAdZ8OeMggCeTP
	e/eYahZpBfZe9DuNqYfBFLgomt/WEP5GUC6tr0b5cLIDkfYjofrZgrFf458h4qud/9XD
	/YrG4iWH2DqJ3CkikU76jIAaUnhqe48ZrAPHMx2Xd9T/8O+ND2ntuXPY3q05a/bmHDKw
	7d/bc0sw4G4WQ/nLnHhszF9apsyXeD92uYKmQvc77efWThuuju7uC4iTZGhcByJNEe1U
	gQnHkWE3c1aOj6NCUDxkHoUGPAxmpkCJiWvq9BBAJlBzeyKnn9sqJmEEek5si+j3Iy1t
	TH3Q==
X-Gm-Message-State: APjAAAXsdQLezxVOu/AzY73a+GPwVblsnKtXfwzwWkpaRN603KV/D8zH
	d06CN8TayTK8Ruhl2neU65XI4uCr3V8=
X-Google-Smtp-Source: APXvYqw0zCPFSv3XXOF8XipUaEIPTynP2tX+dmGs+23BPhLFy9P0STwBDzeAK2MLjp/TWR3MJQ5edA==
X-Received: by 2002:a17:902:ac8a:: with SMTP id
	h10mr816911plr.170.1569294816110; 
	Mon, 23 Sep 2019 20:13:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:09 -0700
Message-Id: <b24447b40e4988e337bdd4b5cf194df0827f9887.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 13/24] bind: upgrade 9.11.5 -> 9.11.5-P4
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:35 -0000

From: Adrian Bunk <bunk@stusta.de>

Source: OE.org
MR: 99751, 99752, 99753
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-connectivity/bind?h=warrior&id=5d286da0fbe1a7ded2f84eec990e49d221bdeab4
ChangeID: ce3719ea11bd03af3baeca51a22115badf84be01
Description:

Bugfix-only compared to 9.11.5, mostly CVE fixes.

COPYRIGHT checksum changed due to 2018 -> 2019.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Included cves:
CVE-2018-5744
CVE-2018-5745
CVE-2019-6465
]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-connectivity/bind/{bind_9.11.5.bb => bind_9.11.5-P4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.5.bb => bind_9.11.5-P4.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5.bb b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.11.5.bb
rename to meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
index 21e979f..432bad0 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5-P4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6ba7c9fe0c888a943c79c93e6de744fb"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8f17f64e47e83b60cd920a1e4b54419e"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -22,8 +22,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-avoid-start-failure-with-bind-user.patch \
 "
 
-SRC_URI[md5sum] = "17a0d02102117c9a221e857cf2cc8157"
-SRC_URI[sha256sum] = "a4cae11dad954bdd4eb592178f875bfec09fcc7e29fe0f6b7a4e5b5c6bc61322"
+SRC_URI[md5sum] = "8ddab4b61fa4516fe404679c74e37960"
+SRC_URI[sha256sum] = "7e8c08192bcbaeb6e9f2391a70e67583b027b90e8c4bc1605da6eb126edde434"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
-- 
2.7.4


