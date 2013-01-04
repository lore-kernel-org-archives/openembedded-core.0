Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <majo@sestofb10.enea.se>) id 1Tr5jy-0004JZ-C2
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 12:47:28 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Fri, 4 Jan 2013
	12:31:01 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 64A95291D4B;
	Fri,  4 Jan 2013 12:31:01 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <yocto@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jan 2013 12:30:55 +0100
Message-ID: <1357299055-56828-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>, scott.a.garman@intel.com
Subject: [PATCH] latencytop: add sudo as runtime dependency
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
X-List-Received-Date: Fri, 04 Jan 2013 11:47:29 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Latencytop needs superuser privileges. The latencytop plugin in
eclipse invokes it as 'sudo latencytop'. So, it will be good to
include sudo as a runtime dependency.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-kernel/latencytop/latencytop_0.5.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index 3e35bf9..a148a47 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -7,6 +7,9 @@ LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a
 
 DEPENDS = "virtual/libintl ncurses glib-2.0  ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 
+# latencytop and it's eclipse support need sudo
+RDEPENDS_${PN} = "sudo"
+
 PR = "r3"
 
 SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
-- 
1.7.5.4



