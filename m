Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id C41017E393
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 11:06:55 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id B52DBA0194
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1558868809; bh=Kx+USg16t82tMzS
	yM+arZt82qN3CA/k5DWLmGrxeqrM=; b=fFAZQxOGEp5RjHrFbHGmatDKjEw7ClJ
	DcdTSflYK/n70LI8k661h+W1qzHkZcqtzVk8BugQbusYjfM7D8bncacS97Sufcmo
	mm7VG5xO3isR3rU3atAkPcb+xtLtfvHjI+6xsichQNgdjjHJqt0c6uQWwUVDu//p
	RiE48K8hwBGnKlBdN6gYwKK4j4Tr6dSRSuRnHUbEDqbSBsGCNMBD+TRL1XVHF6qR
	bRF3LJqT37EPrANcxdrJlviVzzWOeapc6uILzkhIRT0Zeiuq4HWp4oDjueiWRRV4
	PFg+w+VGQ2iL+FOBndSIDdsG8cuzorwOiG5jKyCnbiyT48SAedayg5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1558868815; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=3cYaqJOaZMzd2wfInCtHP5BaUkEX8wy7ceV1l2RB+uM=;
	b=uHfP3kzNGjY5LklyDk3qNptc3kNndBJ6JU9GtuO7kiBDUkOH48/YdJtks1YLeHYWgtGx/H
	rIUjyaVdH5TKrfaACiVRgFYP2csGyjx6GLHMgOjU4RBP7Yuir8vuvii9/ipyWqhqi8fVA3
	eFcjxbPQgEZioUpDwjLqXfwc6p0VrJXiDRG6FUHLEgl5MMGxPZnHmQg0Um03mk7jFlB4PR
	iG/orFxRUo4xGxw4feWb+e7Hp+I1YHUvRQRCWDrChnQr/KauPgTz2PqFff2yj7pSlA7qA9
	rPMnpdutOsjjVK7U6hELBbEznIlm4nAoG/f4k/eO4eHA6XGKU7pUZoPfQCOjkQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
	[80.241.56.123]) (amavisd-new, port 10030) with ESMTP id 0kvKWtaCXYeR
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:49 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2019 13:06:41 +0200
Message-Id: <20190526110642.5341-10-crg7475@mailbox.org>
In-Reply-To: <20190526110642.5341-1-crg7475@mailbox.org>
References: <20190526110642.5341-1-crg7475@mailbox.org>
Subject: [PATCH 10/11] gstreamer1.0-python: upgrade to version 1.16.0
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
X-List-Received-Date: Sun, 26 May 2019 11:06:56 -0000

From: Philippe Normand <philn@igalia.com>

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...amer1.0-python_1.14.4.bb => gstreamer1.0-python_1.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.14.4.bb => gstreamer1.0-python_1.16.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
index 048aaf4413..af9f3f213b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d4c0e3915f547feef49208ee08981e5a"
-SRC_URI[sha256sum] = "d0fdb24f93b6d889f309d2f526b8ea9577e0084ff0a62b4623ef1aed52e85a1b"
+SRC_URI[md5sum] = "877b2ed2aaffdb62e63f38ea9469b70f"
+SRC_URI[sha256sum] = "55dc7aaed1855565f9b9ef842d93e93bfc5cb2b376faef6af5b463e1774e2d38"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.17.1


