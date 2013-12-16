Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6DB6E4C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 03:33:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBG3XFo9009890
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Dec 2013 19:33:15 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Sun, 15 Dec 2013 19:33:15 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Dec 2013 11:33:00 +0800
Message-ID: <f033353f7628b237785b8074d36559855b7964f0.1387164126.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1387164126.git.kai.kang@windriver.com>
References: <cover.1387164126.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] LSB_Test.sh: update locales
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
X-List-Received-Date: Mon, 16 Dec 2013 03:33:17 -0000
Content-Type: text/plain

Add missing localedef statements to the LSB_Test.sh which are required
by the libstdc++ LSB test.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index 2004157..37ce3f1 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -485,6 +485,11 @@ localedef -i it_IT -f ISO-8859-1 it_IT
 localedef -i ja_JP -f EUC-JP ja_JP.eucjp
 localedef -i se_NO -f UTF-8 se_NO.UTF-8
 localedef -i ta_IN -f UTF-8 ta_IN
+localedef -i es_ES -f ISO-8859-1 es_ES
+localedef -i fr_FR@euro -f ISO-8859-1 fr_FR@euro
+localedef -i is_IS -f UTF-8 is_IS.UTF-8
+localedef -i zh_TW -f BIG5 zh_TW.BIG5
+localedef -i en_US -f ISO-8859-15 en_US.ISO-8859-15
 
 echo ""
 echo "Installation done!"
-- 
1.8.1.2


