Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCXn-00034h-Cv
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:47:51 +0200
Received: by mail-pz0-f50.google.com with SMTP id 2so236581pzk.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=PqXTLUy8YO/LN2JC1v4gM/TspUGfPjYvpOKiL3TcRSs=;
	b=a9u4gGzt3Dx5PFEO6iThTZ9ekUZOcHeUucR/gNZQ3eSdHW41BoBrbGudgnrL4TmF63
	2wPsJuf4Gdpm5UU1zWOXGfivu/c/fn3EG3nN1URNEiJ+XKDu6Fph7RgLj0CuAp96ecUs
	MNO4c7lWhd8kt8oTWTGGU0GxqF66Tafca1jLM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OCojHOJMnIZGWAShxkaF4gESAHuYWGUvjV6zvtCa1GX6pztMzJEPyS/t2JXNBck/3z
	K4nIHIPp6OFuj7M5xssDvCSXIsQxYTSAUGP0D+xigDs5S2g+AntRi9PMqs6yVtD7LSFg
	ovnpycCU6HI0KKozGNWC4aKhn93RxmeI+AnNk=
Received: by 10.142.63.13 with SMTP id l13mr10328wfa.427.1308707059509;
	Tue, 21 Jun 2011 18:44:19 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m9sm55947pbd.87.2011.06.21.18.44.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:44:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:44:08 -0700
Message-Id: <b12b3ec30ddeae3d6548a7466d8a90b096f20da4.1308706511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1a1d570c5c80f3b8bbf3d04814490c38a6b36dc0.1308706511.git.raj.khem@gmail.com>
References: <1a1d570c5c80f3b8bbf3d04814490c38a6b36dc0.1308706511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1308706511.git.raj.khem@gmail.com>
References: <cover.1308706511.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] uclibc/x86_64/uClibc.machine: Enable ARCH_USE_MMU
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
X-List-Received-Date: Wed, 22 Jun 2011 01:47:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/x86_64/uClibc.machine        |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
index ac50da0..94c008d 100644
--- a/meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
@@ -32,11 +32,10 @@ ARCH_SUPPORTS_LITTLE_ENDIAN=y
 FORCE_OPTIONS_FOR_ARCH=y
 ARCH_LITTLE_ENDIAN=y
 # ARCH_BIG_ENDIAN is not set
-# ARCH_HAS_NO_MMU is not set
 ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
-# UCLIBC_HAS_FENV is not set
 KERNEL_HEADERS="<path/to/kernel/headers>"
 HAVE_DOT_CONFIG=y
-- 
1.7.5.1



