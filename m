Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 39FFB7D43C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 02:37:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x462bU9e028685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 May 2019 19:37:30 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 5 May 2019 19:37:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 6 May 2019 10:37:27 +0800
Message-ID: <1557110247-24405-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <785e61d4-006b-7637-f70b-b220f3a8118d@windriver.com>
References: <785e61d4-006b-7637-f70b-b220f3a8118d@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] acpica: use update-alternatives for acpidump
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
X-List-Received-Date: Mon, 06 May 2019 02:37:29 -0000
Content-Type: text/plain

acpidump is both provided by acpica and pmtools, so use
update-alternatives to fix conflicts:
...
|Error: Transaction check error:
|  file /usr/bin/acpidump conflicts between attempted installs of
pmtools-20130209+git0+3ebe0e54c5-r0.i586 and acpica-20190405-r0.i586
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/acpica/acpica_20190405.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20190405.bb b/meta/recipes-extended/acpica/acpica_20190405.bb
index 0cd88d4..25ad7ce 100644
--- a/meta/recipes-extended/acpica/acpica_20190405.bb
+++ b/meta/recipes-extended/acpica/acpica_20190405.bb
@@ -26,7 +26,7 @@ S = "${WORKDIR}/acpica-unix2-${PV}"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "acpixtract"
+ALTERNATIVE_${PN} = "acpixtract acpidump"
 
 EXTRA_OEMAKE = "CC='${CC}' \
                 OPT_CFLAGS=-Wall \
-- 
2.7.4


