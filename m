Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVcCP-0001kx-Nn
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 06:22:57 +0200
Received: by pzk2 with SMTP id 2so1743305pzk.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 21:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=HS+0IAnOFi/8XKFo/tD9egFC0cn9yt+GtJWb8ndfZpA=;
	b=XxD0vO8oXCyg+Cd1ys3A0eao2izQwRnOKizM1+T3BnZJV3Ow4iPNEL8u4LQYyLGKfT
	FOWpH7+Hbgn2uhGCCCu13wzvgAkahDE8wUr6aNdJH13sUZsvyUbGKVWy4XOBpfoOqvDl
	2P/+SAsi4TszlqoLdqb7jiWFli6zJzHA6Es/w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=n3pg00czuP/EgKu4+a/qlVx+fuTEesN5s8l+iIbvPyYdFGokFjnrwTrvg0yAgtLQR+
	mpCp6fikBBlCfi1IW9GVJWI1ji+2r+gprW88kMujbML3caxjo44wMKgIfgPSLOWB2eed
	CaXRiJmUtH+auvPHAUZLWHsRg7989yzXj2Joo=
Received: by 10.68.35.70 with SMTP id f6mr1670753pbj.172.1307852372584;
	Sat, 11 Jun 2011 21:19:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm3579520pbb.18.2011.06.11.21.19.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 21:19:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 21:19:03 -0700
Message-Id: <accbe9a92e95233759755cd9a1be77e95cf8cdf2.1307852182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
References: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
In-Reply-To: <cover.1307852182.git.raj.khem@gmail.com>
References: <cover.1307852182.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] uclibc.inc: libsegfault is only RPROVIDED by uclibc
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
X-List-Received-Date: Sun, 12 Jun 2011 04:22:58 -0000

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



