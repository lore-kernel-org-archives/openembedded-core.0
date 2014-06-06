Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6D356B7A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 02:27:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s562RRjS022329
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jun 2014 19:27:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 5 Jun 2014 19:27:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 10:28:19 +0800
Message-ID: <b893b8b17a219b8f376ba2e24e13d6be18610029.1402021350.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402021350.git.Qi.Chen@windriver.com>
References: <cover.1402021350.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/4] gawk: fix libexec of the old 3.1.5 version
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
X-List-Received-Date: Fri, 06 Jun 2014 02:27:28 -0000
Content-Type: text/plain

${libexec} doesn't necessarily equals to ${libdir}/${BPN}. So fix
this problem by using ${libdir}/${BPN} in FILES variable.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/gawk/gawk_3.1.5.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index 48e8939..c7af4a9 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -26,9 +26,9 @@ inherit autotools gettext texinfo update-alternatives
 PACKAGES += "gawk-common pgawk"
 
 FILES_${PN} = "${bindir}/gawk* ${bindir}/igawk"
-FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/*"
+FILES_gawk-common += "${datadir}/awk/* ${libdir}/gawk/awk/*"
 FILES_pgawk = "${bindir}/pgawk*"
-FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
+FILES_${PN}-dbg += "${libdir}/gawk/awk/.debug"
 
 ALTERNATIVE_${PN} = "awk"
 ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
-- 
1.7.9.5


