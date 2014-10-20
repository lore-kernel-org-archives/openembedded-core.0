Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B57B3607A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 09:32:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9K9Wien011679
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 02:32:44 -0700 (PDT)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 20 Oct 2014 02:32:44 -0700
Message-ID: <5444D64D.2030802@windriver.com>
Date: Mon, 20 Oct 2014 17:30:53 +0800
From: Liu Jian <jian.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] hdparm: hdparm man pages can not be forbiden
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
X-List-Received-Date: Mon, 20 Oct 2014 09:32:48 -0000
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit

"--enable-doc-pages" can control if man page of a package is added
to the file system. "none" and "target" are the two only values.
default value is none. But man page of hdparm is still included if
--enable-doc-pages equals none while man page of hdparm should be
included if target is set.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
meta/recipes-extended/hdparm/hdparm_9.39.bb | 4 ++--
1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.39.bb
b/meta/recipes-extended/hdparm/hdparm_9.39.bb
index 58ceb91..e2ad37d 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.39.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.39.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM =
"file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"

-PR = "r3"
+PR = "r4"

PACKAGES += "wiper"

FILES_wiper = "${bindir}/wiper.sh"
-FILES_${PN} = "${base_sbindir} ${mandir}"
+FILES_${PN} = "${base_sbindir}"

RDEPENDS_wiper = "bash gawk stat"

-- 
1.8.5.2.233.g932f7e4

-- 
Jian Liu
Email: jian.liu@windriver.com
Office Phone: 86-10-84778539


