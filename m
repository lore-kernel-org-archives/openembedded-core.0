Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9S1K-0008Oi-Pf
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 04:40:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q862SHVK018254
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 19:28:17 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 19:28:17 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Thu, 6 Sep 2012 10:28:18 +0800
Message-ID: <13d1e7e26385248577b2517ca00ea8e60377c8ff.1346836639.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346836639.git.kai.kang@windriver.com>
References: <cover.1346836639.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] libclass-isa-perl: add it
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
X-List-Received-Date: Thu, 06 Sep 2012 02:40:43 -0000
Content-Type: text/plain

perl module Class::ISA is needed by LSB 4.1 perl test, so add it.
When LSB 5.0 release, it will be deprecated. But we need it now.

[Yocto #3030]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../perl/libclass-isa-perl_0.36.bb                 |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta-lsb/recipes-devtools/perl/libclass-isa-perl_0.36.bb

diff --git a/meta-lsb/recipes-devtools/perl/libclass-isa-perl_0.36.bb b/meta-lsb/recipes-devtools/perl/libclass-isa-perl_0.36.bb
new file mode 100644
index 0000000..0a9c5cc
--- /dev/null
+++ b/meta-lsb/recipes-devtools/perl/libclass-isa-perl_0.36.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Perl module for reporting the search path for a class's ISA tree"
+DESCRIPTION = "Suppose you have a class (like Food::Fish::Fishstick) that is derived, \
+via its @ISA, from one or more superclasses (as Food::Fish::Fishstick is from Food::Fish,\
+Life::Fungus, and Chemicals), and some of those superclasses may themselves each be\
+derived, via its @ISA, from one or more superclasses (as above).\
+\
+When, then, you call a method in that class ($fishstick->calories), Perl first searches\
+there for that method, but if it's not there, it goes searching in its superclasses, and\
+so on, in a depth-first (or maybe "height-first" is the word) search. In the above example,\
+it'd first look in Food::Fish, then Food, then Matter, then Life::Fungus, then Life, then\
+Chemicals.\
+\
+This library, Class::ISA, provides functions that return that list -- the list\
+(in order) of names of classes Perl would search to find a method, with no duplicates."
+
+HOMEPAGE = "http://search.cpan.org/dist/Class-ISA/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://README;beginline=107;endline=111;md5=6a5c6842a63cfe4dab1f66e2350e4d25"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Class-ISA-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "3a2ad203c8dc87d6c9de16215d00af47"
+SRC_URI[sha256sum] = "8816f34e9a38e849a10df756030dccf9fe061a196c11ac3faafd7113c929b964"
+
+S = "${WORKDIR}/Class-ISA-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.5.4



