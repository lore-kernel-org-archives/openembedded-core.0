Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZCXm-00034l-M6
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 03:47:50 +0200
Received: by mail-pw0-f47.google.com with SMTP id 1so351162pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 18:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=1Z4hJ/oe3MNI1zU5fK+ts1cq7EFYZRDfR59lcc0kDRM=;
	b=tv78SlyjsTjsl48TWpgfNBPA2kocklb8c/Xhf4QV6sQ5+urV9MPK0xTsCPlohA7Fq+
	vIBWFHHlttAqYAb6fAYpmvPuBIDjEUrgn+2gkATLu8dMUqi9kMJXRC2WM9pwC+3kWQyb
	oagPms51ayK8cZdVIdFJHR3xMg8hwGDuUuejQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NuwYfve13/QhOnx7aS+h2/iTzYXM7iQqfNvDA3KBfAq8/ZAFu346WJCWxI3BPK9toC
	sTqw5hC+uZWuRWe3FCyro00GIEFu+CtDyuyEBUOuOHh2JL9NRi3AHS0/hNF6aW0OhI+7
	0LHUSF9KM+FPx4GLrUEhhLXMmSx9nO83rqCVk=
Received: by 10.68.33.70 with SMTP id p6mr27851pbi.480.1308707057265;
	Tue, 21 Jun 2011 18:44:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m9sm55947pbd.87.2011.06.21.18.44.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 18:44:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 18:44:06 -0700
Message-Id: <1a1d570c5c80f3b8bbf3d04814490c38a6b36dc0.1308706511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308706511.git.raj.khem@gmail.com>
References: <cover.1308706511.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] uclibc.inc: libsegfault is only RPROVIDED by uclibc
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
X-List-Received-Date: Wed, 22 Jun 2011 01:47:50 -0000

Using ${PN} also means that uclibc-initial gets to provide it
which we do not want

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 00f5e8d..06c0f5d 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -89,7 +89,7 @@ RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
 # to satisfy this dependency for the images/tasks
-RPROVIDES_${PN} += "libsegfault"
+RPROVIDES_uclibc += "libsegfault"
 
 SRC_URI = "\
         http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
-- 
1.7.5.1



