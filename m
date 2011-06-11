Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVJy7-0001k3-Uz
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 10:55:00 +0200
Received: by pvc30 with SMTP id 30so1629414pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 01:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=HS+0IAnOFi/8XKFo/tD9egFC0cn9yt+GtJWb8ndfZpA=;
	b=mPNXWBcjSyapFaKXPhOLfQVGxXa0Xv30L5DX6sRabR24emQW/Q9VW4/XryRQdQBzY4
	X2M2YeoITKOeHkIvMFifBgAjoRV+MlcirRsmeWGThXR6obl5iIZH3YTcKO1/LqhLMcs/
	vJELr1gRP8WgMIPdMhG7BBRO1rs5XfLoGmbRA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EL/ejc5Og4rTnoE+n7WJiBGFc6ZF6f/rzJ5mKsuegXASrf+r+2VULOw6bdeD0YIyeg
	vDA7yLW7NqbNMs8Rgpi1QV/nwjv3pA3CMdqvblCu65WyKhaTRn/F4ZBEQ0o3MI2g+ksu
	Kl28Bx55RS75eUQszks94Y2hMTWPJ/qdMpOfg=
Received: by 10.68.21.8 with SMTP id r8mr1329683pbe.499.1307782297705;
	Sat, 11 Jun 2011 01:51:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm3006882pbk.4.2011.06.11.01.51.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 01:51:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 01:51:11 -0700
Message-Id: <1307782272-6002-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1307782272-6002-1-git-send-email-raj.khem@gmail.com>
References: <1307782272-6002-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/3] uclibc.inc: libsegfault is only RPROVIDED by uclibc
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
X-List-Received-Date: Sat, 11 Jun 2011 08:55:00 -0000

Using ${PN} also means that uclibc-initial gets to provide it
which we do not want

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index c1bc422..0f8c6c2 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -99,7 +99,7 @@ RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
 # to satisfy this dependency for the images/tasks
-RPROVIDES_${PN} += "libsegfault"
+RPROVIDES_uclibc += "libsegfault"
 
 SRC_URI = "\
         http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
-- 
1.7.4.1



