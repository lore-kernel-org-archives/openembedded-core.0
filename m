Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07DCA7BFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 07:00:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O703kY010055
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 23:00:05 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 23:00:04 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2019 23:00:00 -0800
Message-ID: <c2c225060925cfacd5aea8b40246ce64f42b92e3.1548313066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1548313066.git.liezhi.yang@windriver.com>
References: <cover.1548313066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] gettext: Add --cache-file to EXTRA_OECONF
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
X-List-Received-Date: Thu, 24 Jan 2019 07:00:05 -0000
Content-Type: text/plain

This can save configure time since it runs configure multiple times:
$ time bitbake gettext-native -cconfigure
  2m22s -> 2m2s

  Saved 20s

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 933bacc..4049724 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -39,6 +39,7 @@ EXTRA_OECONF += "--without-lispdir \
                  --without-emacs \
                  --without-cvs \
                  --without-git \
+                 --cache-file=${B}/config.cache \
                 "
 EXTRA_OECONF_append_class-target = " \
                  --with-bisonlocaledir=${datadir}/locale \
-- 
2.10.2


