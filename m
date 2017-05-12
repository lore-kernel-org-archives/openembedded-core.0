Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C7BA977BC5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 08:16:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4C8GO0H028684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 12 May 2017 09:16:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d95kO-0001Zb-FW; Fri, 12 May 2017 09:16:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 09:16:19 +0100
Message-Id: <1494576982-6006-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 12 May 2017 09:16:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/4] glibc: Avoid errors if you accidentally create a git symlink in the glibc source dir
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
X-List-Received-Date: Fri, 12 May 2017 08:16:30 -0000

If you accidentally create symlinks in the glibc sources directory, it
fails in very hard to understand ways. Whilst most people don't do this,
since I debugged it, specifify the list of plugins we use to avoid
this biting anyone else.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc_2.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
index cf9c4f7..ab6fbbe 100644
--- a/meta/recipes-core/glibc/glibc_2.25.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.bb
@@ -73,7 +73,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile \
                 --disable-debug --without-gd \
                 --enable-clocale=gnu \
-                --enable-add-ons \
+                --enable-add-ons=libidn \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 --enable-obsolete-rpc \
-- 
2.7.4


