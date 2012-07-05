Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnKh-0005rn-3S
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:03 +0200
Received: by ghbz2 with SMTP id z2so7046547ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WrUtldJ5HGOQ6CRnNnNZSdQ1qHiCOu9vBEWetGPZpnk=;
	b=BwTbYR6fSaQVnm1oJQ0SzBscKSvHxjcoHPGhGGnZ+kBJildTyI4mHCV/fIzDdhuazf
	cYTvv++kSgKrPqE5Go1sPVN78sr0hF/1ncvq+5q6a4d9oQZ7PnDUKXj+moBB2DgjheNU
	eNrRq/bmpZ6RCJFDSLj1IQlrXLPxkO2PwpH9lA25gK76Km+cG8yl3BR9yd4mX8XXQ2QZ
	8zxrz3ewcCDN2ro2rNipz22rvwn5JVGYklMG1ZfDBL/64YjQ201HeNq/KtTH7c37sbbG
	Nw4PZDOn1LmHPHo+AO8+6vn7TBkIzaXOklph3OBi8sc/UNSBoCHOb7eEbGUMMkJAV78W
	jmhw==
Received: by 10.66.74.97 with SMTP id s1mr37658127pav.11.1341498957832;
	Thu, 05 Jul 2012 07:35:57 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.35.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:35:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:20 -0700
Message-Id: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 01/14] mirrors: Add debian archive snapshot mirrors to search list
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
X-List-Received-Date: Thu, 05 Jul 2012 14:47:03 -0000

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



