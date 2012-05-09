Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRv9z-0000rz-9z
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 02:53:43 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so7395440pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 17:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2/QRLNhUa3xU7aL4M6OgDcsdyzb9em40DLVQe9rBH6Y=;
	b=s+TO1949HQ8HntXVVkxSemfS5F5bX3Re29XNdWsQN+XZtt+Wc3Chqj8WhSu1YGe/Ea
	I1FgOK0NnBPjbGOInBZxu9Sgqe0G2Ic4JcQ6DAfyCQ7GvoAcliTis+ZuAQ7mFhTjiPe+
	y1STz/pNxnUIy/2wTGYddRHKBJGAl/r9WEFBs68mNShfPDdBN1tgq097YcOI7XNPsSt9
	uZSczKBc1Zm2EuHTrFwZKFqdZynZzvaCar0vArUzKKsHc1SutYcz5m3ZC8QxjfMtGmzM
	vTIbBMzEl7W9okRK35WcU1k/YzIJ57Hh5Bkdh7pu4+Wa4YpzAHhyusFoMwD/vjXtsbFC
	8sWQ==
Received: by 10.68.197.35 with SMTP id ir3mr3037936pbc.87.1336524233068;
	Tue, 08 May 2012 17:43:53 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pq1sm4069862pbc.7.2012.05.08.17.43.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 17:43:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 17:43:36 -0700
Message-Id: <9ebe1b84f4b1497ed0469d13b3e768b85d4020da.1336524034.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
References: <fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336524034.git.raj.khem@gmail.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] classes/mirrors.bbclass: Point snapshot.debian.org mirror to working location
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
X-List-Received-Date: Wed, 09 May 2012 00:53:43 -0000

If you point to snapshot.debian.net/archive/pool then it will fetch
you a html page which will end up in corrupt download. The locations
have changed for archives and here we point the mirror to right
location.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/mirrors.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index bf23e05..86ccd7a 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -1,5 +1,5 @@
 MIRRORS += "\
-${DEBIAN_MIRROR}/main	http://snapshot.debian.net/archive/pool \n \
+${DEBIAN_MIRROR}/main	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool/ \n \
 ${DEBIAN_MIRROR}	ftp://ftp.de.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.au.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.cl.debian.org/debian/pool \n \
-- 
1.7.5.4



