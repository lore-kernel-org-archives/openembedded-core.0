Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 277D4605AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 18:08:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gS9Q5sMCz4f
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 19:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584295722;
	bh=eQL9v/kW94VRJPKs8RzBmGSid61LblpE+dgyMNY6rTo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cgkWPDSrsMb/YeqthvM3eMD/sBNBNBOlJJ65zWYLJQZfhoFm33QhJiZupWs4A1Kz6
	Kh3pUoDedmlTxOVv+MRevn3yj3vUntR/B4bQikwOLrrKR3W5BYsMYtPNVHb9rLLOSd
	ZV03mIueVOkWTmhQy4cW2OPfC4zPHnSJP+kLTj/1hQKr8ITVbjzoiEzJ6TJbu4Q5Ux
	bmRVlsWkt6+EAc12mN5H7FqLabp1a03tUaRI5uKkJbfT6dvFzeUJY5EmZtXnhp1Pri
	X0Q16tBTyoM15QdFDpYn9V8tLGIxEUcZkXoGW5goHKX06OkUQqtNGcPBYsAbse/bCA
	WXDQ49c97sIcfVHFDIlWIBgDnryjfpCs+D+OYFmnirbYSv8sDoObltk0jrlzOPDbCM
	ssFEHExqdx6Uw83y7gnYY6AhkPAXFOgWOYDcfQWJmXs3IRtkSpPvNlBD2J/D40adZE
	yh5wWtsBgUUakyrz83Lqli/BMgNaIEVWm9xinHdJ37YkH4yyKtXLC0BhikXIvPRtTi
	4yyjwJS8YEwFGC5IzBH+ccMd2uZSwtRqPYZVCMaXnvbvGejQ+86+buPPmD1JGyH9RJ
	7/dYGpwDdA0Twfjn8Loe+Bkvvu+MR4Dl1+L5vQn1+AUe23Bhm4IEDIXOwn0rvL+j/Q
	dMBlfTTFUy01mDT217V7Gw+0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 20:08:41 +0200
Message-Id: <20200315180841.3730-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200315180841.3730-1-bunk@stusta.de>
References: <20200315180841.3730-1-bunk@stusta.de>
Subject: [warrior][PATCH 2/2] openssl10: Upgrade 1.0.2r -> 1.0.2u
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
X-List-Received-Date: Sun, 15 Mar 2020 18:08:42 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../openssl/{openssl10_1.0.2r.bb => openssl10_1.0.2u.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl10_1.0.2r.bb => openssl10_1.0.2u.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2u.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
rename to meta/recipes-connectivity/openssl/openssl10_1.0.2u.bb
index 7e2b884856..c5a00066ba 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2r.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2u.bb
@@ -53,8 +53,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "0d2baaf04c56d542f6cc757b9c2a2aac"
-SRC_URI[sha256sum] = "ae51d08bba8a83958e894946f15303ff894d75c2b8bbd44a852b64e3fe11d0d6"
+SRC_URI[md5sum] = "cdc2638f789ecc2db2c91488265686c1"
+SRC_URI[sha256sum] = "ecd0c6ffb493dd06707d38b14bb4d8c2288bb7033735606569d8f90f89669d16"
 
 S = "${WORKDIR}/openssl-${PV}"
 
-- 
2.17.1


