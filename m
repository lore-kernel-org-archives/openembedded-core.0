Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFS-0001HK-5z
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:14 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WrUtldJ5HGOQ6CRnNnNZSdQ1qHiCOu9vBEWetGPZpnk=;
	b=ULrtlrlcHwP6gJz2sGitjUt1syusPWcstdI1jSBzkwS/u9WQ8w8yHjLgMVNDH3OvxF
	9hx5/ckRmbRjtJMW4S0JDMhK/yx8CkpFRlO7nqRk3ZC9sgqzv8iF6+RzHoiMWLAJX3k5
	I6PhL4ArJP8zynpMPIGiP0dMflHGjMbFQq/SccS96sgzk5rCXbROyfIRHGclKdpTGWDe
	hnvG5InR+5JpFtHqIOuvGV/Kxtc8YbY5CNxNC4GVh8ZKT1bFZ4ah1oDb4attoj9rmXSv
	Re70ftKmQbRP537oj7NDwYRU6/8XonuxPgrRAbTWV3lMNGyDHdAB7UpzMNE/6UEq8gBD
	/19w==
Received: by 10.68.201.9 with SMTP id jw9mr52505941pbc.28.1341763867851;
	Sun, 08 Jul 2012 09:11:07 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:19 -0700
Message-Id: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 01/19] mirrors: Add debian archive snapshot mirrors to search list
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
X-List-Received-Date: Sun, 08 Jul 2012 16:22:14 -0000

I ran across this problem when apt 0.7.14 was not fetchable
from regular debian mirrors and existing snapshot mirror
did not have it either since we did not use proper syntax
so it was not hitting that.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/mirrors.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 86ccd7a..1a9a531 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -1,5 +1,7 @@
 MIRRORS += "\
-${DEBIAN_MIRROR}/main	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool/ \n \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \n \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool \n \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.de.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.au.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.cl.debian.org/debian/pool \n \
-- 
1.7.9.5



