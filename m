Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1TawzM-00060V-Km
	for openembedded-core@openembedded.org; Wed, 21 Nov 2012 00:12:20 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so4040382vbm.6
	for <openembedded-core@openembedded.org>;
	Tue, 20 Nov 2012 14:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=xmGFH94Aa5i9Hkc52u6a763VRe75PpV5pLzqAj6PisQ=;
	b=DTsRjcjKp1f+xmjklL3qQ8E6Lbm6vMG7Ln1d51KhCPMtvrajOWn0kUzRLTvm6Haz4m
	jQvtoWdTtIYbN2js91HCL9BtJGfh3Bk2+ea5zEnFOfvBM4MVDtQ6q2b/HQnvmo7uisPh
	q5yJT2gS3dZ777mbBfAkB/8cqy0ZhSp3mdKQK5eL/6PIzzolVLzRUiUY5rkQp+6lHCQh
	w7h7oIDlCGXWd57uziHljICK3LBnj+nfK1AKisoYYW6fzGBzOt5g7ZUB01bbOvVnPnr3
	PB3fcEEEoi/IWOoW1uJc/58aYl/ZzbgKC7wJ26KJy1oYOUiipGeAHnoyRqS/6gREyGtS
	on7g==
Received: by 10.52.100.5 with SMTP id eu5mr22396291vdb.34.1353452296127;
	Tue, 20 Nov 2012 14:58:16 -0800 (PST)
Received: from localhost.localdomain ([96.240.166.19])
	by mx.google.com with ESMTPS id dh10sm7473166veb.8.2012.11.20.14.58.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2012 14:58:15 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@openembedded.org
Date: Tue, 20 Nov 2012 17:58:11 -0500
Message-Id: <1353452291-3503-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] distutils-common : Add -staticdev to PACKAGES.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2012 23:12:20 -0000

Some python recipes may build static libraries that need packaging in
{PN}-static-dev.

This change fixes a QA error in python-numpy.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/classes/distutils-common-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index f66a5cd..36c1e83 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -5,7 +5,7 @@ EXTRA_OEMAKE = ""
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
+PACKAGES = "${PN}-staticdev ${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
 
 FILES_${PN} = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
-- 
1.7.11.7



