Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4D8F65E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 05:10:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9H5AHde028252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 22:10:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 22:10:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Oct 2014 13:11:33 +0800
Message-ID: <d25dfecb24cc2fb9bb480ff9e9666525ced054da.1413522652.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413522652.git.Qi.Chen@windriver.com>
References: <cover.1413522652.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: fix libidn floating dependency
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
X-List-Received-Date: Fri, 17 Oct 2014 05:10:23 -0000
Content-Type: text/plain

WARNING: QA Issue: systemd rdepends on libidn, but it isn't a build dependency? [build-deps]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index ebf9395..14bb698 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -62,6 +62,7 @@ PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicroht
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
 PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
 PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
+PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.9.1


