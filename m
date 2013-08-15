Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9990B6B8AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:22:59 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id z7so186266eaf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=zzx7vsNk73vpbqZecx0N29ij0beMvBZplmNSogODN64=;
	b=pFQbGTB5ZVV9ikplzLP7xcmKlf++x8XffXucEp2pXTIuWeojKbrEspH0822iBPsvZI
	kQQrzaMaJ0+MeVrB/s4u7DS3QsofnPo8UUvQGibqfV1zAFC+do6H1Sx7V7Y10AC8jAcc
	pbZuSeZtmI5t9hOjdz8etIJgAmMPnZyJhac1lyE/Trkkdi4FujHfW5f3Up+Z2hoqlssS
	OP/Bh89Zcbbf5EuF5lD6xixodNzZDb1TiO3yMiVofWNUVjrDYEkMV3cPDKmuoGC+sIgX
	jSClSdVE0GZuNbGRdOKraWJgNZf88G3vJyFGjHzZp4q2vh7FQV1wY3Y1ihtmhm8aXJFC
	Od0w==
X-Received: by 10.14.149.3 with SMTP id w3mr141339eej.84.1376551380063;
	Thu, 15 Aug 2013 00:23:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm81957098eex.2.2013.08.15.00.22.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:22:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:16 +0200
Message-Id: <808811e7f3329865c17e40333338cb71bc23c4fd.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 05/33] quota: inherit pkgconfig
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:00 -0000

* missing dependency on pkgconfig-native was causing
  that PKG_CHECK_MODULES(DBUS, dbus-1) stayed unexpanded in
  configure script:
  checking for ext2fs_initialize in -lext2fs... yes
  quota/4.01-r1/quota-tools/configure: line 3746: syntax error near unexpected token `DBUS,'
  quota/4.01-r1/quota-tools/configure: line 3746: `        PKG_CHECK_MODULES(DBUS, dbus-1)'
  Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/quota/quota_4.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index 80159a9..f3c8fbe 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/quota-tools"
 
 DEPENDS = "gettext-native e2fsprogs"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 EXTRA_OEMAKE += 'STRIP=""'
 
-- 
1.8.3.2


