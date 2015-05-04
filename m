Return-Path: <christophe.guillon@st.com>
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id F0A8473C8C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 11:01:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.14.5/8.14.5) with SMTP id
	t44Aw2o7023620 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 May 2015 13:01:05 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 1u6706g5qy-1
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 May 2015 13:01:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6680531
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 11:01:03 +0000 (GMT)
Received: from Webmail-eu.st.com (safex1hubcas3.st.com [10.75.90.18])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AE3B5048
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 11:01:03 +0000 (GMT)
Received: from gnx2112.gnb.st.com (10.129.179.50) by webmail-eu.st.com
	(10.75.90.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 4 May 2015 13:01:02 +0200
From: Christophe Guillon <christophe.guillon@st.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 May 2015 13:00:45 +0200
Message-ID: <1430737245-3904-2-git-send-email-christophe.guillon@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430737245-3904-1-git-send-email-christophe.guillon@st.com>
References: <1430737245-3904-1-git-send-email-christophe.guillon@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2015-05-04_01:2015-05-04, 2015-05-03,
	1970-01-01 signatures=0
Subject: [PATCH 1/1] ncurses: inherit ncurses from pkgconfig
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
X-List-Received-Date: Mon, 04 May 2015 11:01:06 -0000
Content-Type: text/plain

Inherit ncurses from pkgconfig bbclass such that the ncurses
build installs pkgconfig .pc files correctly.
Otherwise packages depending on ncurses may not get the
right ncurses configuration.

Signed-off-by: Christophe Guillon <christophe.guillon@st.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index f0a4044..33f937e 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -8,7 +8,7 @@ DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
 INC_PR = "r15"
 
-inherit autotools binconfig multilib_header
+inherit autotools pkgconfig binconfig multilib_header
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
 SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz"
-- 
1.7.9.5


