Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UHZQC-0000Tf-KZ
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 13:44:18 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 18 Mar 2013 13:27:23 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 3448D288B04;
	Mon, 18 Mar 2013 13:27:23 +0100 (CET)
From: <maxin.john@enea.com>
To: <constantinx.musca@intel.com>, <radu.moisan@intel.com>,
	<sgw@linux.intel.com>, <richard.purdie@linuxfoundation.org>
Date: Mon, 18 Mar 2013 13:26:46 +0100
Message-ID: <1363609608-11554-4-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1363609608-11554-1-git-send-email-maxin.john@enea.com>
References: <1363609608-11554-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org,
	"Maxin B. John" <maxin.john@enea.com>, dexuan.cui@intel.com
Subject: [PATCH 3/5] lttng-ust: remove the COMPATIBLE_HOST check
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
X-List-Received-Date: Mon, 18 Mar 2013 12:44:22 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

liburcu-0.7.6 supports MIPS. So, we can remove the COMPATIBLE_HOST
check intended for MIPS.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
index 2117981..eb683dd 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
@@ -31,8 +31,3 @@ S = "${WORKDIR}/git"
 do_configure_prepend () {
 	${S}/bootstrap
 }
-
-# Due to liburcu not building for MIPS currently this recipe needs to
-# be limited also.
-# So here let us first suppport x86/arm/powerpc platforms now.
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux.*'
-- 
1.7.5.4



