Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 874BF73183
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 03:23:43 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id p187so39733939oia.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 19:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tiemzA/0ETT3uXc4toC33+ksZxyKL5iMEp3dkf76Hr8=;
	b=IIE/Ot+QNGwYpZe3tUoClcFnJlaXxB5B1Y/6c3A9No3SSMuVF2pgSNYs1trCy0VtBM
	Ruws3uBBiDTulYp7qhbzz4m0DzweD0jgLQGln5/XoFh/j2tj/wnaqI3ogheZKwbpo1WJ
	fI3pY1YUXGrX/rBLt+QPIs9w1bd3BYWU2DH59ZVAv3ElVhLmqPmxLvr1nYot1nl94xfX
	naqDWS+fXUfGIf4gQnUFpD6PrKVjyKjfnvSC4v9TXRtrRDmqYQMM0BR6gbBRuenh/AcJ
	J7lipYM9SFkMwxmv5sG15RcogXxv6Vjp54XKFSef+LhdAitNHjTcoyn48KQk0KY+nFQK
	Ovjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tiemzA/0ETT3uXc4toC33+ksZxyKL5iMEp3dkf76Hr8=;
	b=HsocqExkYPuoXN3WRayOP+6aPNDF26W8Y+brqTMyFx+9Xz32QRxDeyJ2nD15WlkUtY
	YJ+xjj/6Tr4z08Cjo9y6FSiDDq3tD49+YTJiFz1YemgeVbMgd1DSCCMH1k5a39vBdw/9
	4RJJjX5LLzHxMX2ydA1+UVKW5djeYkQRTVjO0JVE3WFncWnJyZ+f/aKoGEAWLM8DSMF5
	7ALVpQs+AEp2egNPYpq8WXTEH3U6ornQrIpw7UL/N4Wl5nenxhzGv5Ig/8EJxQi1MuN8
	XNU9e/mBi7ZxhD+LHV6zNF8bVW9UDpvwdXIK0GjN7Ot+4KSZxLzBraJAKWRhhsljbzoG
	gx7Q==
X-Gm-Message-State: AG10YOQEPDTYUjvOfuXOZrTQdXKMXX3de0zmZ/IbiKjLfr4s2GE7Te4KrG4k3WTxf7PzTQ==
X-Received: by 10.202.219.10 with SMTP id s10mr561740oig.27.1453433024698;
	Thu, 21 Jan 2016 19:23:44 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id m67sm2210273oik.4.2016.01.21.19.23.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 19:23:43 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 19:23:37 -0800
Message-Id: <1453433017-25240-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gstreamer1.0-plugins.inc: drop obsolete ${S}/po/Makefile.in.in workaround
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
X-List-Received-Date: Fri, 22 Jan 2016 03:23:44 -0000

The workaround was originally added to the 0.10.x gst-plugins recipes
in late 2012 [1] and the root cause seems to have been fixed upstream
in late 2013 [2] (ie prior to the 1.4.0 release).

 [1] http://lists.openembedded.org/pipermail/openembedded-core/2012-November/071149.html
 [2] https://bugzilla.gnome.org/show_bug.cgi?id=705455

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index fd0d8bd..6ea911e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -23,12 +23,3 @@ EXTRA_OECONF = " \
 "
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
-
-# apply gstreamer hack after Makefile.in.in in source is replaced by our version from
-# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed 
-# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
-oe_runconf_prepend() {
-	if [ -e ${S}/po/Makefile.in.in ]; then
-		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
-	fi
-}
-- 
1.9.1


