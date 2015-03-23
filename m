Return-Path: <net147@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id F02F773BE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 11:18:57 +0000 (UTC)
Received: by padcy3 with SMTP id cy3so188669331pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0wQCotXhJzPuZeYXRhNy0ThPf0VOik8Yi+5eg11uG5M=;
	b=PRyYgj3wZwrZrBDHLOoFQr+9llExPmZhYAOB1O8AQcE1he4WbqA6Ir8lAs+vrnLhQB
	SDCbhRFrUJETxSqNqhdoQNrp6jYHqmek3ST16Zs6qoQBjoxek1gFt47wnMuoX+cHJEY1
	qI0tOppsMzlTm0w8DnJxAhimiA2CFfbiLBrP9TzyxGOpr94N0DeEtICz7Cz65D7c9UtD
	NRHh2lDTA/LuxvAj16p62O6O2sqQbXNYSskDih0p2+oqiqTCEifntOoe0FXfzs1nhyYX
	mG+r9LhnQASO3UeozKA4abhi8SGBPzWRIlXYFyKcPVLRrOxNckoLCbUMmGf0AtNgdb9W
	Ge+g==
X-Received: by 10.70.53.226 with SMTP id e2mr211832421pdp.25.1427109539038;
	Mon, 23 Mar 2015 04:18:59 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id nj5sm743054pdb.35.2015.03.23.04.18.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Mar 2015 04:18:58 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 22:18:46 +1100
Message-Id: <1427109526-31351-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.3
Subject: [PATCH] systemd: fix firmware path to match linux-firmware
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
X-List-Received-Date: Mon, 23 Mar 2015 11:18:59 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 5ecdda9..f2d3c13 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -112,7 +112,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --enable-split-usr \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
-                 --with-firmware-path=${rootlibdir}/firmware \
+                 --with-firmware-path=/lib/firmware \
                "
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
-- 
2.3.3


