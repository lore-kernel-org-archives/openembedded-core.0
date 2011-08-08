Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqJQ4-0001bS-43
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 08:34:36 +0200
Received: by iyf13 with SMTP id 13so10309490iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2011 23:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FjO7QjU5YZic0s27aImGRo6+WBWXWeUDkFUAYXcS7Qc=;
	b=h5CvjncPSUPaxlRLB/V12VvjU2HhAi8oBXXCzd5+XYlQskVR0EZJt5MS66A+1+CMPv
	ASXmJGa3SdulOkErw1ng80nOJk9LnLFFQtV3nNmjjiCxMGu3wcnAf28a7hrvjjqxplER
	g426pYQQO7Dv1JDbHRYtj0T6yyXw6lxXD87AI=
Received: by 10.42.189.72 with SMTP id dd8mr5421334icb.100.1312785007940;
	Sun, 07 Aug 2011 23:30:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id bq3sm7118333icb.11.2011.08.07.23.30.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 07 Aug 2011 23:30:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2011 23:30:02 -0700
Message-Id: <1312785002-3627-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] scripts/runqemu: Make it run on ubuntu 11.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2011 06:34:36 -0000

location of libGL has moved in ubuntu 11.10
so we look for it in the new locations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 9611c64..2b8e88a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -388,6 +388,7 @@ libgl='no'
 
 test -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so && libgl='yes'
 test -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so && libgl='yes'
+test -e /usr/lib/`uname -i`-linux-gnu/libGL.so -a -e /usr/lib/`uname -i`-linux-gnu/libGLU.so && libgl='yes'
 
 if [ "$libgl" != 'yes' ]; then
     echo "You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.
-- 
1.7.5.4



