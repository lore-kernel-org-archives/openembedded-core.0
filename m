Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RkLkl-0002x9-QC
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 21:23:35 +0100
Received: by mail-iy0-f175.google.com with SMTP id h37so7052792iak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 12:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dnIG79UxY1PsmsVwARu7Q8IE510Kyc9txtENA2kfWu0=;
	b=SVXNgypYp4x3fcGF51Z4Uzr3QCH9joYISkV+GYZWfXPxy+swnMjgUAY83R+i43eqkq
	apmur6ToYES6kKKZ22bteCJBQy9M0v9+4yme6I0FUiu/nlC04zg0g2XKe9Z4ockDHDEW
	o5SQ0SNqP8ersrsntzPVh5hZqXOOSO4Jyd5/I=
Received: by 10.42.244.137 with SMTP id lq9mr19115574icb.28.1326140170012;
	Mon, 09 Jan 2012 12:16:10 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id h9sm254620546ibh.11.2012.01.09.12.16.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 12:16:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 12:15:41 -0800
Message-Id: <aa563d02ad7b16337cb0c771b35f0a29c2cff242.1326140011.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
References: <106d8165fbc1ba1063d46fe268fd8b2595d6d9b8.1326140011.git.raj.khem@gmail.com>
In-Reply-To: <cover.1326140011.git.raj.khem@gmail.com>
References: <cover.1326140011.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc
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
X-List-Received-Date: Mon, 09 Jan 2012 20:23:36 -0000

Defaults are for eglibc therefore we define it with an
override for uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index e1594f3..0b515e5 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,6 +10,8 @@ LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
 LOCALE_UTF8_ONLY ?= "0"
 
+DISTRO_FEATURES_LIBC_libc-uclibc ?= "ipv4 ipv6 largefile libc-posix-clang-wchar"
+
 DISTRO_FEATURES_LIBC ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
 					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
 					libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
-- 
1.7.5.4



