Received: from mail.bmw-carit.de ([62.245.222.98] helo=linuxmail.bmw-carit.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas.bulwahn@oss.bmw-carit.de>) id 1TkxvL-0001py-CA
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:13:35 +0100
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.3])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 831B34029C;
	Tue, 18 Dec 2012 14:22:23 +0100 (CET)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 14:58:40 +0100
Message-Id: <1355839120-12142-3-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Cc: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>
Subject: [PATCH 2/2] python-setuptools: include setuptools' path to easyinstall.pth
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
X-List-Received-Date: Tue, 18 Dec 2012 14:13:35 -0000

From: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>

To work properly, python-setuptools must add its location to the
easyinstall.pth file.

This is achieved using the easyinstall class.
---
 .../python/python-setuptools_0.6c11.bb             |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
index 8608104..38af7a0 100644
--- a/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
+++ b/meta/recipes-devtools/python/python-setuptools_0.6c11.bb
@@ -30,4 +30,8 @@ RDEPENDS_${PN} = "\
 SRC_URI[md5sum] = "7df2a529a074f613b509fb44feefe74e"
 SRC_URI[sha256sum] = "630fea9b726320b73ee3ca6ff61732cb32675b0389be658080fe46383b87a1d3"
 
+EASYINSTALL_${PN} = "./setuptools-0.6c11-py2.7.egg"
+
+inherit easyinstall
+
 BBCLASSEXTEND = "native"
-- 
1.7.9.5



