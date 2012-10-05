Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TKE9w-0000eF-Ev
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 22:06:08 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 891432FD12
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 15:53:00 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 12:52:45 -0700
Message-Id: <8430748e838872b22fe0e83a7dbf3a2a5b1faba2.1349466569.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 891432FD12.37620
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/6] gnutls: Update SRC_URI to use GNU_MIRROR
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
X-List-Received-Date: Fri, 05 Oct 2012 20:06:08 -0000

From: Darren Hart <dvhart@linux.intel.com>

The current SRC_URI fails. Update it with the GNU_MIRROR SRC_URI from
upstream commit 753b22012f10c393c191d3116b9d38ee4be6d112.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: John Howard <john.howard@intel.com>
CC: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 157612e..e818f07 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libextra/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/gnutls/gnutls-${PV}.tar.bz2"
 
 inherit autotools binconfig pkgconfig gettext
 
-- 
1.7.9.5



