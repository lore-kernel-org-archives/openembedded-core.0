Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id B64046BC09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 06:45:00 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so5839473pad.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 23:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=viKZPRqrJEpC75+/xgj/aw6TR1qP3bJUye5WtDsv9ks=;
	b=R+LAgLztnSFVqtM2vbFtytcCcsIymlaaGAaoc4G8Mc93eXj1AxIhIHwqjD8/26MT57
	RFih8tFNJeJMdQovGhaHt3Cv4JFXDHRiE/6aLvsKCaXf3OmCUV9LiUcpiiKTQp7kdRc5
	DeUKH6XBdWIVWsWszXlUvi1wSkT0sgt0rA57TvIGej9Wku/3VL3kXqiNjtx03WYB+3TR
	znoemnWozbkBjGVhaA0+c9omdvmijeN4r8kVGdT8fiMCTEIi2qMweVdzAmbo8LdsCF1q
	u2Ajeil0VGYwjeQ3d5fp3Kz+jWpeamNvcRFG7KlFCoF/qRyWZzkuCzALhvDL3uuOzMPT
	oigQ==
X-Received: by 10.68.234.130 with SMTP id ue2mr13400224pbc.159.1377672301757; 
	Tue, 27 Aug 2013 23:45:01 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	ct4sm20077332pbb.41.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 23:45:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 23:44:07 -0700
Message-Id: <1377672247-16456-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] systemd: Cover for udev-systemd
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
X-List-Received-Date: Wed, 28 Aug 2013 06:45:01 -0000

meta-systemd currently has a bbappend which provides just a cover
for udev-systemd, if we move this to the recipe proper then the
bbappend can be removed from that layer

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_206.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index f05aa1b..4234d13 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
-PROVIDES = "udev"
+PROVIDES += "udev"
+PROVIDES_udev += "udev-systemd"
+RREPLACES_udev += "udev-systemd"
+RCONFLICTS_udev += "udev-systemd"
 
 PE = "1"
 
-- 
1.8.4


