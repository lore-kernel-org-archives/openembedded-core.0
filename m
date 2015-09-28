Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 694EA7570D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 03:28:05 +0000 (UTC)
Received: by pablk4 with SMTP id lk4so63855079pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 20:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OxtvOoYpLa253xcZFsp0tNEaWRYmsekqz3lQfmStPK4=;
	b=oQ1NcP9FZfq9eZxudKqPw0tmRZJiHHLg13rtNYawTdUc5lFZjST8Qd6wBNKgz/S0kj
	fPNrp4a3Eqen7YIgET5hW3FCHe3FH8H6Cg1QVvopezXrinoNRjay1VkwM919PefF3GiX
	L9pk/6RlR4jVwwGbp+k5c+oaF2+EHcBRKqLWmJ55BY/+I2nFgav2+w6eBfmYTuSbS2KV
	Flo7QDz/ZQNUjPCDWZvrA2KMlBxZFCF5rIwXD6D9PSFHQ4eDd6CLo/VoZXEgyZYoQrlO
	KxQaXFVrRhJS9TDyeeM9C8bHqpghlf9FlmC7aH+dYufgsCKDhK4a/ZPau4ZdrjDOTzVl
	+hwQ==
X-Received: by 10.66.97.73 with SMTP id dy9mr23757391pab.115.1443410885992;
	Sun, 27 Sep 2015 20:28:05 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	sv9sm8918256pbc.44.2015.09.27.20.28.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Sep 2015 20:28:05 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2015 13:28:00 +1000
Message-Id: <1443410880-19730-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.3
Subject: [fido][PATCH] systemd: add PACKAGECONFIG for qrencode
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
X-List-Received-Date: Mon, 28 Sep 2015 03:28:06 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index b972dd4..142bdb8 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -90,6 +90,7 @@ PACKAGECONFIG[iptc] = "--enable-libiptc,--disable-libiptc,iptables"
 PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
+PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
2.5.3


