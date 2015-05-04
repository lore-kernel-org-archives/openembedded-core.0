Return-Path: <christophe.guillon@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE607169F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 11:00:59 +0000 (UTC)
Received: from pps.filterd (m0046670.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.14.5/8.14.5) with SMTP id
	t44AsnZb020570 for <openembedded-core@lists.openembedded.org>;
	Mon, 4 May 2015 13:01:00 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 1u3w5xp6qu-1
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 May 2015 13:01:00 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 967133A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 11:00:58 +0000 (GMT)
Received: from Webmail-eu.st.com (safex1hubcas3.st.com [10.75.90.18])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DB115044
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 11:00:58 +0000 (GMT)
Received: from gnx2112.gnb.st.com (10.129.179.50) by webmail-eu.st.com
	(10.75.90.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 4 May 2015 13:00:57 +0200
From: Christophe Guillon <christophe.guillon@st.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 May 2015 13:00:44 +0200
Message-ID: <1430737245-3904-1-git-send-email-christophe.guillon@st.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2015-05-04_01:2015-05-04, 2015-05-03,
	1970-01-01 signatures=0
Subject: [PATCH 0/1] ncurses: inherit ncurses from pkgconfig
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
X-List-Received-Date: Mon, 04 May 2015 11:01:00 -0000
Content-Type: text/plain

This patch fixes an issue in openembedded-core daisy where
ncurses does not install pkgconfig .pc files, which causes
issues for other packages using ncurses.
For instance alsa-lib does not build correctly when for
some reason ncurses is itself built before pkgconfig-native
is built.

Christophe Guillon (1):
  Add inherit pkgconfig for ncurses

 meta/recipes-core/ncurses/ncurses.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


