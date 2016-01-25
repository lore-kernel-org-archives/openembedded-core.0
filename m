Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1304A770CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 06:45:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0P6jqVc015310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 22:45:52 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 24 Jan 2016 22:45:51 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jan 2016 14:44:05 +0800
Message-ID: <51f0a96271229055e28dfe5ab12a29559c474614.1453703961.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1453703961.git.kai.kang@windriver.com>
References: <cover.1453703961.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] wget: inherit perlnative
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
X-List-Received-Date: Mon, 25 Jan 2016 06:45:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

In wget 1.17, it add option '--utf8' for command pod2man to create doc
files. pod2man doesn't support that option on some host such as SLED 11.

Inherit perlnative to provides native pod2man to fix this issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/wget/wget.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 049b898..f749958 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -7,7 +7,7 @@ DEPENDS = "gnutls zlib libpcre"
 
 INC_PR = "r16"
 
-inherit autotools gettext texinfo update-alternatives pkgconfig
+inherit autotools gettext texinfo update-alternatives pkgconfig perlnative
 
 EXTRA_OECONF = "--enable-ipv6 --with-ssl=gnutls --disable-rpath --disable-iri \
                 --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
-- 
2.6.1


