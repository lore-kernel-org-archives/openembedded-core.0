Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SWbsu-0002bs-4g
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 01:19:28 +0200
Received: by dalh21 with SMTP id h21so6529147dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 16:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=4D/i1Nx8yKJu/IavflcHgI5Vv7J0cFbO0zLpHUve+xY=;
	b=M+58LADA4z9eOZ3utZrkAW34n1UtWIFiCyQKntYC/DKo544IrHUWSz9tTAH3aUgzfI
	SyHCVzEvlyOOQIhiJzU7VHKRJ5aRzBDlNRimr06/HkI4AvvLQ95kKcFPDkFVNhgnK+w6
	sFUmvNmvIioT99yHShJco/BMDGbgv9TgXcVJhlww0a25ywx2WaP7kQvP2S3svNEuPZ6i
	ZfJznldUXZBu5a27q7Rl7XbOdcSC/bwe2ynXwFOgVRMDzo4VHVjP7/fjI2YEb8J7l60e
	qI6yptpuPgYz90lUOBv/eJwDg+oryIdaY7PkMSGR0+yCMhVEI5wI+7/4fgb0Fqqm8fYO
	L/8Q==
Received: by 10.68.231.195 with SMTP id ti3mr24868345pbc.96.1337641759158;
	Mon, 21 May 2012 16:09:19 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242]) by mx.google.com with ESMTPS id
	po10sm12643702pbb.21.2012.05.21.16.09.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 16:09:18 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2012 16:09:10 -0700
Message-Id: <1337641752-1521-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.10.2
Subject: [PATCH 1/3] tcmode-external-csl: preferred external-csl-toolchain's gdbserver
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
X-List-Received-Date: Mon, 21 May 2012 23:19:28 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 731780b..0fa2ee1 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -34,6 +34,7 @@ PREFERRED_PROVIDER_virtual/libintl = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/libiconv = "external-csl-toolchain"
 PREFERRED_PROVIDER_glibc-thread-db = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
+PREFERRED_PROVIDER_gdbserver ??= "external-csl-toolchain"
 
 # No need to re-compile the locale files
 GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
-- 
1.7.10.2



