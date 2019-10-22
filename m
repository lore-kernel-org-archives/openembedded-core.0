Return-Path: <crg7475@mailbox.org>
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8507F690
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 15:06:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2a.mailbox.org (Postfix) with ESMTPS id 2CD56A2684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	message-id:date:date:subject:subject:from:from:received; s=
	mail20150812; t=1571756377; bh=oyeqiMUJhyT1hCVti3X+x0VaGVYJZnYWT
	iJ9GFwYsU0=; b=YV3ukuZXfc2u7337lHlvAJZsd9rl0GRm7FN7K3747vdERnDNn
	XrhRC1hgCrjzw1P5yNlGxcCNI2M/r+XY3cI+PP2etxR7zAKg05nk+TTC9ywZu3lC
	CSI5+O+fksr81vEW2Pj7RSg14N+m1bcXQeeF0b4hrkMicH93Fpbq6HNrtNjTnqsn
	NX9PN1b5W1/U5aKxKjVxQgT9UhaCTOcsDu3gS3cOy8pq0i3Iw7oEO/ZPxiqKnPH8
	dxT429zs+d9SKGzPxDfBuQ+Tq1gWPWy3v5WE1E9RQFKi09SXBjhHJL+68u7fnuGM
	XrWaR5oxg19kBrwQXH4oNZoymeMO/WDbbtTeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1571756379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc; bh=G4p4QVwhCla8C2cHqcVC32q714T3A9MSpx6Vo3byBZ4=;
	b=qfuLZdjUHbq53eNibYwFOIwmIybtw0VRO/cNg8rUbMBAR6/te8VALpJVjU9h4ZLREIMEfc
	JKGe1wbhMfW5PfdQ0/9ariCVAFuvYufngO1Rj6rln8V2fhctPOQLl1u6rfCI42iwIX6lU3
	1RjHQRjjx49J1ntVojqQrze5wNQ/YTg6GpAR+5aTb94fU+/2p2apVHRAwHenZYg4N+nH5H
	csGUR9EIcPm/VM5+gjTR3c0v+nCDj+nkaIbfa4EYIhmoyXwMoM58zFvTE5toz2Z0Ks1SyY
	nAgQyAP1HqNKF2A2EhP8FoaL0Pq9XJF1D2ZmwzUCtSUCvl2t42kfgUsRbrrqdA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id JEMjWgGpy6L3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:37 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:16 +0200
Message-Id: <20191022145927.1241-1-crg7475@mailbox.org>
Subject: [PATCH 01/12] gstreamer1.0: upgrade to version 1.16.1
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
X-List-Received-Date: Tue, 22 Oct 2019 15:06:27 -0000

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../{gstreamer1.0_1.16.0.bb => gstreamer1.0_1.16.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.0.bb => gstreamer1.0_1.16.1.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
index da2d14cd99..d77c8aa198 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
@@ -27,8 +27,8 @@ SRC_URI = " \
     file://add-a-target-to-compile-tests.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "862b7e4263d946bc2ef31b3c582e5587"
-SRC_URI[sha256sum] = "0e8e2f7118be437cba879353970cf83c2acced825ecb9275ba05d9186ef07c00"
+SRC_URI[md5sum] = "c505fb818b36988daaa846e9e63eabe8"
+SRC_URI[sha256sum] = "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1cf4377d"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    "
-- 
2.17.1


