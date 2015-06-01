Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id D6F7375681
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 23:33:40 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so74065280igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jun 2015 16:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SNYh2LiefzNrO1wGZVatEOfJzUWttaYUIRFiyF/7GmM=;
	b=unXpe6YoivKtksVcsA8KiphplTeq2Q5RkLfkcsRluqhtufxprKP7Vk0f87O+P21xMX
	KHLIHJJ4CwJCBmRzXhXmGnUJc7pNzTLPlZSV85w1tEp9paGu7obYmcivCzTQTIPRi0Uf
	zF7vlbApcUfJpWrd+8RdsfhZr4wcB3xNmNSJyPIaGRYigjf8klMaCWY/AC1veBtvZ9Pc
	wiDk9VORP1LNK/wh9tQCq4MHuBEVhjyJek3IowmlnoooL7WHevxqUOBMwb0XUjC2e4hJ
	727EdpoqCcQbtkJEuBv22zez9h5iiXOCmfoNhAkSHS7zUbXA2yTYSb6Muz2XosBDPfIS
	PtJQ==
X-Received: by 10.43.34.205 with SMTP id st13mr31664137icb.4.1433201621302;
	Mon, 01 Jun 2015 16:33:41 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id n14sm11439961ion.5.2015.06.01.16.33.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Jun 2015 16:33:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jun 2015 16:33:34 -0700
Message-Id: <1433201614-12954-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] glibc: remove duplicate --disable-nscd from EXTRA_OECONF
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
X-List-Received-Date: Mon, 01 Jun 2015 23:33:43 -0000

An appropriate --enable-nscd or --disable-nscd option is added to
EXTRA_OECONF based on the 'libc-inet-anl' DISTRO_FEATURES check.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.21.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 0c28814..03c5461 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -87,7 +87,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-selinux \
                 --enable-obsolete-rpc \
                 --with-kconfig=${STAGING_BINDIR_NATIVE} \
-                --disable-nscd \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-- 
1.9.1


