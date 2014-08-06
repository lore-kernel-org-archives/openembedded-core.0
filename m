Return-Path: <sujith.h@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id B0DA0617B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 10:07:52 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so3012513pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZxCMrsksl5D7IYVs4WZS8VOhHTVbAYbZYO83RQwqpeQ=;
	b=qiam1Zr0nwunqTGtYwGjd7EHaZWhE9jDqvKPHewx4ANByZ+H+rvSjkR21/V3qreFD8
	IMkBu6s9srNM051Qm2LxRFNml+pJZ0urLhLPFhSnCH+T9Cm7WUW+FNU8oN3mhTDGvg/M
	5d7iLEsR3U4qeczlLpxTp22UT8pgzTU0cyHh1K4E4DS5Y+bJE7DTyNTGmIzuUEih8xjo
	Bn16wTopnA+w3zcJtdBe2yWNV9aKVlRfZ9jli4mjMCS3FYDmSRQy3fVy47obtNy/q24Y
	KONhcdifqHPM8CFyNIyLSPMWqLcflOUGJJBXJPc5MyRpDo8q5bDBPbosv8e48OS94/qN
	bYog==
X-Received: by 10.66.182.69 with SMTP id ec5mr10296703pac.125.1407319673825;
	Wed, 06 Aug 2014 03:07:53 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id v5sm1019625pdc.7.2014.08.06.03.07.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 03:07:52 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 15:34:26 +0530
Message-Id: <1407319466-5066-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] systemd: Adding RRECOMMENDS for os-release
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
X-List-Received-Date: Wed, 06 Aug 2014 10:07:58 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

Systemd depends on the os-release hence adding
RRECOMMENDS for the systemd package.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/recipes-core/systemd/systemd_213.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
index 4fb7ffc..b5ac1c3 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_213.bb
@@ -248,7 +248,7 @@ RDEPENDS_${PN} += "volatile-binds"
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
                       util-linux-agetty \
                       util-linux-fsck e2fsprogs-e2fsck \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 os-release \
 "
 
 PACKAGES =+ "udev-dbg udev udev-hwdb"
-- 
1.8.4


