Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 89DA17782F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:36:28 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id f127so14019512pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jun 2017 22:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rZSpOlIvc7mMXgqPnkMFpRsX4H/kPqeLzidJyU0+v+Q=;
	b=OyPGLeXreQTNa38o2PFH+gLH7FGfh/RSVSLA6Vy/oIUljhbctWyb74IOevIIxtNX10
	EjKt5GKLWR+r6BDi80KEfiYitH2JLcVFviJYA+ol95HgVZleTF+Rpw/155h839nqCSBJ
	m77C82tXK4TtbdjbcgIeHe7twGAkH2XLTcArKe27hMQbtKlkS6qInTbQ7zEd9TuEPpTf
	3vpQCDcnH3xWWjMdv2m2eO4Tj1RapNuX08yEg/iUlgU+gCT4yPRIGTrYcec24yf5P6BS
	W5dgRWDD5WN5jtk7XYGpnt/9/QoUMh7m7fpmaP/20LiS4YXGhx0SR+zHy+B5vFpuVcg3
	zY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rZSpOlIvc7mMXgqPnkMFpRsX4H/kPqeLzidJyU0+v+Q=;
	b=KVD0+ZQagxuuvVgd5kwjt5CnJV1eE1/NLoMR5fLpSjSKoYcf6VWt06xqmPu+/qHMEx
	fxzDo8K4Y68XFJRE/Zg4tqASKO17NXWGRwOiY4eyegM1SqwmMreJIhGJ6/fJ13dvXClm
	Vv5KSD7vEjIWOnVrX6CyqdoI+/CM5Vo3l2m1j/LexNU3+aS3VP2yaIojtw/apulLx5Af
	VomJbTH8kTFwc4eUDi77rtgyNqsU+q5iU338KRr9TsCqrFi6V1LI+B7GI9NdfB8gyUd1
	JTWYnKtyAHoF5oWPACimJZYgiwGI9LQxVgt0KwGLm8o4Tb63iLFQAby0SdWmBguhEE+6
	wNdQ==
X-Gm-Message-State: AKS2vOxLLydBmiQVff6y/BF9Fe0lXHDh4ErxEhwtPOnbDL/hSVMz2zqr
	z8bl7IpK9KL0d7pe
X-Received: by 10.99.8.1 with SMTP id 1mr19648921pgi.15.1498455389401;
	Sun, 25 Jun 2017 22:36:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	a79sm24095931pfj.5.2017.06.25.22.36.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jun 2017 22:36:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Jun 2017 22:36:19 -0700
Message-Id: <20170626053619.38084-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH] iptables: Apply 0001-fix-build-with-musl.patch unconditionally
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
X-List-Received-Date: Mon, 26 Jun 2017 05:36:28 -0000

This patch is generic enough, That it can be applied universally
and makes maintainence easier

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/iptables/iptables_1.6.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.6.1.bb b/meta/recipes-extended/iptables/iptables_1.6.1.bb
index 4019e2a4a4..b37c55a64e 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.1.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.1.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
-          "
-SRC_URI_append_libc-musl = " file://0001-fix-build-with-musl.patch"
+           file://0001-fix-build-with-musl.patch \
+"
 
 SRC_URI[md5sum] = "ab38a33806b6182c6f53d6afb4619add"
 SRC_URI[sha256sum] = "0fc2d7bd5d7be11311726466789d4c65fb4c8e096c9182b56ce97440864f0cf5"
-- 
2.13.1


