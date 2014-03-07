Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id C96DE60C19
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 00:57:32 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so4101447wes.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 16:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=D9PYV4P8giFlM/Dc9Vcz0tcTmhtuZ0wpGga4DxrMyoc=;
	b=1HjX2+sLk32zH9iKYQ93JAOHLDRaMmUqNO9mPcdykhiq0eJsOdDqJpXAU6XpqrVqh8
	Uh09UPFYa+TIr69Pw+RLvLqWurbIQUgpwY+xbVo37yZpdX9Qs3becOpIjig0RRJTo33e
	OlqkcZUaHaubi4Xb6Y6FwasM5xCv/U7iUh7lv7nlDWoxsYvpL6KpZKHQzKQq2Zim+G1X
	7AhC4UNYCrNDMZRqbiQUZt2iRDCO1bNKh3FntxHnslOQLq51nu40KtmTbEQeTr2Zt5sB
	rg8ZIOFm6KMmFucddlKNIdrzSjNNe8Bg3iOD8KLvpeHBt4bSlwpu1xwvtZbDZ6m7UN+2
	7oTQ==
X-Received: by 10.194.186.170 with SMTP id fl10mr6277851wjc.67.1394153852906; 
	Thu, 06 Mar 2014 16:57:32 -0800 (PST)
Received: from desktop.betafive.co.uk
	(cpc66027-shep11-2-0-cust140.8-3.cable.virginmedia.com.
	[81.110.75.141])
	by mx.google.com with ESMTPSA id q15sm932108wjw.18.2014.03.06.16.57.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Mar 2014 16:57:31 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Mar 2014 00:57:02 +0000
Message-Id: <1394153822-4370-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] opkg-utils: Update to latest git master
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
X-List-Received-Date: Fri, 07 Mar 2014 00:57:35 -0000

The latest commit in opkg-utils allows packages created by opkg-build to be read
by dpkg-deb again.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index c2509c4..54cfe54 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 PROVIDES += "virtual/update-alternatives"
 
-SRCREV = "fd4a3a4c20ada47b19e89849ddb6ff87904f01d2"
+SRCREV = "c33b217016ee911718b10c9d57f9912935baf5a9"
 PV = "0.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils"
-- 
1.9.0


