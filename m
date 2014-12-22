Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 48F66729B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 04:55:15 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id et14so5170881pad.17
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 20:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MfHObLsIwThU0VDai44hh/0GLbkoGDFHa1tq6ltVOrI=;
	b=PfKIZJePpiaqXL8J6g9E5K46MvY9U6U7eKGry3ZYiqkJyGgFhvci+BRyiEKEUZ0egf
	9yK+RYPMahYfoBYAeXMAh4w9WHwojulvsg6grOfhd92X0WzozmhM1bHAvm7cNI9HjqZh
	QiFJaAKg2P92LGaME4H3cJYiPSzPQQWe+jwoREORk8Y6jA2TsrIX+c4Ukwatcvc6qlqs
	sTGmbyoHFiCbFtVfxKIQt3sHm1kC4s8T0HykB50lji4jSPimhIBTH4SAu+3hb9cS/yjG
	Sn5I0a/3CdXibk2Hm+E8k74GaR782zYeriF0gpCtz2x6FfC/NrJdu1EvPxhecdGrrbHk
	Pf/g==
X-Received: by 10.66.62.137 with SMTP id y9mr7846701par.87.1419224116935;
	Sun, 21 Dec 2014 20:55:16 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	nx1sm15835688pdb.85.2014.12.21.20.55.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Dec 2014 20:55:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Dec 2014 20:55:00 -0800
Message-Id: <1419224101-24900-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
References: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
Subject: [[PATCH 4/5] xterm: move from meta-oe to core.
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
X-List-Received-Date: Mon, 22 Dec 2014 04:55:16 -0000

core "xinit" package has a dependency to xterm so
move it from meta-oe to core.

core image "core-image-x11" includes xinit.

Updated to latest verison
Updated SRC_URI to us Debian. Old one was flakey.

Added X11 distro check.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/xterm_313.bb | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 meta/recipes-graphics/xorg-app/xterm_313.bb

diff --git a/meta/recipes-graphics/xorg-app/xterm_313.bb b/meta/recipes-graphics/xorg-app/xterm_313.bb
new file mode 120000
index 0000000..7193661
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xterm_313.bb
@@ -0,0 +1 @@
+/home/akuster/oss/mylayers/meta-openembedded/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
\ No newline at end of file
-- 
1.9.1


