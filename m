Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9766A463
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 21:23:05 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c4so136744eek.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 13:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1Pl3LQCnipd7KE/SLIbBKIZMVVNrVWjBrnKkrPYxfgY=;
	b=jRJhndIQTDzZQab4YS6L/B3E9qdWi0tsDAIytFjUwlF+vUorEEwMusuRyvEk7+Y+j3
	n/Ax7dkVDk0FsWC1mka5oD4Elsv1Q74xhaEXYvn0gpU64Ef6pDZKiBpogA/yb5bOe0WJ
	DQpLbEaHvC04FszzYzT1MSIuuZia4haqU3vYPPzHatXL3MZW2AOdTT8jW3EXumvgb06k
	vjTFxX8VrbH5z9s5JhDGz4W4waA1fDYYVWuvFjLV3mcuYWyUwej+9+wWfTDMWA08aSNU
	EV44+PxGX2u3jcrQJ0O1a5ouwsc34GDsAwuxwmgxwXy9ki4MaiRU//LQJBo/8ZwgiUn1
	jgdw==
X-Received: by 10.15.76.6 with SMTP id m6mr11122807eey.37.1385068984627;
	Thu, 21 Nov 2013 13:23:04 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w6sm73879994eeo.12.2013.11.21.13.23.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Nov 2013 13:23:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2013 22:23:07 +0100
Message-Id: <1385068987-29714-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] xinput-calibrator: add formfactor to RDEPENDS
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
X-List-Received-Date: Thu, 21 Nov 2013 21:23:07 -0000

* 30xinput_calibrate.sh is calling ". /etc/formfactor/config"
  breaking Xsession for images without formfactor

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index d6b3021..1ffd6d8 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -27,5 +27,5 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
 }
 
-RDEPENDS_${PN} = "xinput"
+RDEPENDS_${PN} = "xinput formfactor"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
1.8.4.3


