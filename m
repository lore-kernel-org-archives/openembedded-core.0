Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THf7F-0008JR-3x
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 20:16:45 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so116762wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 11:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fYh8BJO3PkwXoFQtZy+s1CxHmCch9Ct/pXDcylzG1Ms=;
	b=nTjHu7lQGqAJuzSJqK+cz4mjFxImjEfKhI/a6qW2Iwlxxo+Xbgwv2ddonx37hYOgD+
	SCA0wlCzhNjxUtaJ5GB3QMrkPvLYs8xWlG+zbFT9E9yOPwnoYbjOJ0RUEqf2SDWRutrK
	OqUbaghOQymRQYQuvcm69sZ5wDMS/y1MLTzX3ZEbAmJONhdj33f1QFSM9VpFf9jW8UcA
	4iemAjx5+wpA9yjRn9JZHCmc3mQEWT5PE6K9wDpNcF4VD2RJDU53WLHtLhpzennNSnNx
	nN8c5fYnc6xmMPNAmZZKsOcyQyC8n9aiyuTcWmjg3Qkto6/3taJAFdoT3Mw1J0114ZDu
	8yWQ==
Received: by 10.180.82.3 with SMTP id e3mr5360482wiy.14.1348855434135;
	Fri, 28 Sep 2012 11:03:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ga2sm643904wib.2.2012.09.28.11.03.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 11:03:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2012 20:03:50 +0200
Message-Id: <1348855430-11091-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1348855430-11091-1-git-send-email-Martin.Jansa@gmail.com>
References: <1348855430-11091-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 2/2] bitbake.conf: exclude DATETIME var dependency from IMAGE_NAME
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
X-List-Received-Date: Fri, 28 Sep 2012 18:16:45 -0000

* resolves ERROR shown when bitbake -S is used for image:
  ERROR: Bitbake's cached basehash does not match the one we just generated
  (/OE/oe-core/openembedded-core/meta/recipes-core/images/core-image-minimal.bb.do_rootfs)!
  ERROR: The mismatched hashes were 8c35cdf8a5d09c03941f081dd9f6d8dc and b5d6e2e5952770557c48c5779ddb73fc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e168ef1..8ac2769 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -401,6 +401,7 @@ STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel"
 IMAGE_ROOTFS = "${WORKDIR}/rootfs"
 IMAGE_BASENAME = "${PN}"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
+IMAGE_NAME[vardepsexclude] += "DATETIME"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 
 # This option allows for a percentage overage of the actual image size rather than a
-- 
1.7.12



