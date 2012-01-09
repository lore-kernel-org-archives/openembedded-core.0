Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkLko-0002x9-Sg
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 21:23:39 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so7052792iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 12:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZqDgSI9Zrru+1fdJ3ok2HawDrI0O9+JWHKVbaqzJpH8=;
	b=p1r0y7tUQ6UAhMcl1Ip0p0hdDQKDMCQBlPePf/vBSEjC5hMA7pv94n7bu2zqDb7sB9
	bpnXui+WkrjLZTyQu+6o5YSi8vuX5kh5AwRZCq1virBEh0H7C2yG0FL0tGAMZ29POGCN
	/iCCSPrj/kvZ1yM0pKn6vnEH/8ynwT3tAZwSM=
Received: by 10.42.155.136 with SMTP id u8mr19305687icw.12.1326140173111;
	Mon, 09 Jan 2012 12:16:13 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id h9sm254620546ibh.11.2012.01.09.12.16.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 12:16:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 12:15:42 -0800
Message-Id: <913d20df2816857189d1724ec2ab0d734a6c4b04.1326140011.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
References: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
In-Reply-To: <cover.1326140011.git.raj.khem@gmail.com>
References: <cover.1326140011.git.raj.khem@gmail.com>
Subject: [PATCH 5/7] uclibc: Configure UCLIBC_HAS_WCHAR based on libc-posix-clang-wchar distro feature
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
X-List-Received-Date: Mon, 09 Jan 2012 20:23:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-config.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index a30188d..3de3845 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -105,6 +105,7 @@ def features_to_uclibc_settings(d):
 	uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
 	uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, rem)
 	uclibc_cfg('kernel24',  machine_features,'UCLIBC_LINUX_MODULE_24', cnf, rem)
+	uclibc_cfg('libc-posix-clang-wchar',  distro_features,'UCLIBC_HAS_WCHAR', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 # X, Y = ${@features_to_uclibc_settings(d)}
 # unfortunately doesn't seem to work with bitbake, workaround:
-- 
1.7.5.4



