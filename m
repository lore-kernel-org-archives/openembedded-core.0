Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 87B2276DA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:04:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2015 06:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="756484376"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2015 06:04:20 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:06:03 +0300
Message-Id: <1b1addab8587973a984b477e271e3fd4df9d88a5.1440680489.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1440680489.git.jussi.kukkonen@intel.com>
References: <cover.1440680489.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/6] mirrors.bbclass: Update gnutls mirrors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Aug 2015 13:04:33 -0000

* Remove mirror sites that no longer exist
* Update the gnutls.org path so the gnupg mirror gets used

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/mirrors.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 081c982..b96c071 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -27,10 +27,7 @@ ftp://ftp.gnupg.org/gcrypt/     http://gulus.USherbrooke.ca/pub/appl/GnuPG/ \n \
 ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \n \
 ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \n \
 ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
-ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnupg.org/gcrypt/gnutls/ \n \
-ftp://ftp.gnutls.org/pub/gnutls http://www.mirrors.wiretapped.net/security/network-security/gnutls/ \n \
-ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/ \n \
-ftp://ftp.gnutls.org/pub/gnutls http://josefsson.org/gnutls/releases/ \n \
+ftp://ftp.gnutls.org/gcrypt/gnutls ftp://ftp.gnupg.org/gcrypt/gnutls/ \n \
 http://ftp.info-zip.org/pub/infozip/src/ http://mirror.switch.ch/ftp/mirror/infozip/src/ \n \
 http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/ \n \
-- 
2.1.4


