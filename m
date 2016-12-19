Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DB0BE7729B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:36:00 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 19 Dec 2016 05:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="44702445"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 19 Dec 2016 05:36:02 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 75D576A4080;
	Mon, 19 Dec 2016 05:35:13 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:35:46 +0200
Message-Id: <0782ba71aee9d8be9fb448f805195f5bd96bb0de.1482154012.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482154012.git.jussi.kukkonen@intel.com>
References: <cover.1482154012.git.jussi.kukkonen@intel.com>
Subject: [PATCH 8/8] mirrors.bbclass: Fix gnutls mirror directory
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
X-List-Received-Date: Mon, 19 Dec 2016 13:36:01 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/mirrors.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 1184708..1174ef6 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -27,7 +27,7 @@ ${GNUPG_MIRROR}	ftp://mirrors.dotsrc.org/gcrypt \n \
 ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN \n \
 ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan/ \n \
 ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/ \n \
-ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR} \n \
+ftp://ftp.gnutls.org/gcrypt/gnutls ${GNUPG_MIRROR}/gnutls \n \
 http://ftp.info-zip.org/pub/infozip/src/ http://mirror.switch.ch/ftp/mirror/infozip/src/ \n \
 http://ftp.info-zip.org/pub/infozip/src/ ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/ \n \
-- 
2.1.4


