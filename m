Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 96E266E954
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 12:58:52 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id b8so5388183lan.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 04:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=O0tkmkG8REBnFM/mUxrGHklHMv3Fe+3eINvLqrRveWI=;
	b=rX2w+rt8rY0bsXgv+3NklesVpoGtJrQYLnHUyVjgO7rK4e2cG86o4lFbIrT1DGQdBY
	Ddq1QTHoD0S6Xojs/Sb+c7SxO1lvEiCSOceuXHYy0KNnJ4oBkL4v7U52Jd/fpEe/qsUc
	A/F3NyrysR+BhQkoTyQqjcykdbVDYshbY/l8Ty8sjaMPUO6Y/hLmc6kwzQ/834x7KT/j
	hhkkeELHOkEu/rEoPbU5WfwIflJR4x7Vhd2lZgIiyYyzVrFQg1aGSJ9mqsANmEbkJJu2
	tqNqZXzJHZimtVInl+lDWN0jmqoFBPA6L38E3jnBSMuFdDxVIyqZ9B3tQlXRvRgv/nz7
	lkXA==
X-Received: by 10.112.236.3 with SMTP id uq3mr12797978lbc.14.1391432332667;
	Mon, 03 Feb 2014 04:58:52 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id e1sm3095535laa.8.2014.02.03.04.58.51
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Feb 2014 04:58:51 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 1D5631C698F; Mon,  3 Feb 2014 13:58:50 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 13:58:49 +0100
Message-Id: <1391432329-1046-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [RFC][PATCH] udev: add udev-utils to RDEPENDS
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
X-List-Received-Date: Mon, 03 Feb 2014 12:58:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An intended fix for below error message with core-image-lsb, 
Sending this as an RFC since I dont really know what constitutes 
a RRECOMMENDS vs. RDEPENDS. 
Is this clearly defined somewhere ?
Below should be an RDEPENDS, no ?

INIT: version 2.88 booting
Starting udev
udevd[59]: starting version 182
/etc/rcS.d/S04udev: line 108: udevadm: command not found
/etc/rcS.d/S04udev: line 113: udevadm: command not found
/etc/rcS.d/S04udev: line 114: udevadm: command not found

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-core/udev/udev.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 1b22525..b22c1c1 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -58,7 +58,8 @@ INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
 FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit ${nonarch_base_libdir}/udev"
-RRECOMMENDS_${PN} += "udev-utils udev-cache"
+RRECOMMENDS_${PN} += "udev-cache"
+RDEPENDS_${PN} += "udev-utils"
 
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
-- 
1.8.3.2


