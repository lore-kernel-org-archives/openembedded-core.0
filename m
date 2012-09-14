Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCXeT-000516-Tp
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 17:17:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2012 08:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="222086326"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.221])
	by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2012 08:04:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2012 16:04:43 +0100
Message-Id: <1347635083-2596-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [denzil][PATCH] classes/mirrors: remove bogus gnutls mirror
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 15:17:54 -0000

This mirror entry which maps to itself plus a slash, if matched, put the
fetcher into a circular loop until the stack space is exhausted. A patch
has been sent to fix this issue in BitBake, but we should remove the
bogus entry as well.

(Note that this entry does not actually trigger the issue with current
master because the gnutls recipe now uses GNU_MIRROR instead of
ftp.gnutls.org, thus the bogus mirror entry is not matched.)

(from OE-Core rev 0de1827a9601143b090f751ea702fdb65a936b77)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/mirrors.bbclass |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 86ccd7a..db57529 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -25,7 +25,6 @@ ftp://ftp.gnupg.org/gcrypt/     http://gulus.USherbrooke.ca/pub/appl/GnuPG/ \n \
 ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \n \
 ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \n \
 ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
-ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnutls.org/pub/gnutls/ \n \
 ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnupg.org/gcrypt/gnutls/ \n \
 ftp://ftp.gnutls.org/pub/gnutls http://www.mirrors.wiretapped.net/security/network-security/gnutls/ \n \
 ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/ \n \
-- 
1.7.9.5



