Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7gA-00009A-RJ
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:42:41 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so4084906pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=bvnnZNaeKSfMXbgrvZhjdNMmwNr2+JZMhlNi0gV9ngY=;
	b=LQ8frOPPT/ABB6jiveQVk7RVCSJthDEJmKFVZSWCcC9eqMZ36jSR1UKmSF0W9dX309
	Nkzp39mra3asiQom0igRzZU8mdRQD5/KnB+6DuZIfiBcwJWoLIU+NddkSpr8pvZ7KNFf
	kOvxakPSYx7qr8D5rCZyGwFP+chkhQWo/gvLVceFUYrwVQ2dfVJPwv3eeLOiyanlC3WB
	aF5bBIFXsS5x+yKOaVdpnuXcaP0smbz/2AIKLr45dGPgGmfKPGGJ9YyH/Sru8G2w2HpP
	wSw+AtqY7sXU60ehDAccRmCTeFiNaT5Ci6ECVPnkuqHKryKJCHnCPfyIJwWCrnwnzpl8
	13aA==
X-Received: by 10.68.11.35 with SMTP id n3mr30146598pbb.220.1363026355716;
	Mon, 11 Mar 2013 11:25:55 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.53
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:54 -0700
Message-Id: <efbb924cceca141159ab3187ec6a9af5c6203834.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkOncW9SlzoRsSRTZT/12Dmu5N+uhg2c7SY4K5jnDuSmye8yHhKRucwOTBhw+8qDt6ExShH
Subject: [PATCH 11/12] util-linux: disable systemd support
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
X-List-Received-Date: Mon, 11 Mar 2013 18:42:45 -0000

The only binary in util-linux with systemd support is uuidd, which is rarely
used.

I tried making this respect the systemd DISTRO_FEATURE but it ended up with a
build cycle.  uuidd isn't critical so this can wait.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1cb4f5f..149cdc5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -43,6 +43,7 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
                 --disable-vipw --disable-newgrp --disable-chfn-chsh --disable-su \
                 --enable-write --enable-arch --enable-mount --with-fsprobe=builtin \
                 --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
+                --disable-socket-activation --without-systemdsystemunitdir \
 		usrsbin_execdir='${sbindir}' \
 "
 
-- 
1.7.10.4



