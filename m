Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CAFAE6E3E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:55:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBD7tn6o001180
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Dec 2013 23:55:49 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 12 Dec 2013 23:55:49 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Fri, 13 Dec 2013 15:54:46 +0800
Message-ID: <d703034cfc99633c49b80bcce96a4a888c26eeb4.1386920771.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386920771.git.kai.kang@windriver.com>
References: <cover.1386920771.git.kai.kang@windriver.com>
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
X-List-Received-Date: Fri, 13 Dec 2013 07:55:51 -0000
Content-Type: text/plain

LSB libstdc++ test requires some locales. Generate them explicitly in
case they don't exist.

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


