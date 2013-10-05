Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9536CD2D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:18 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so2297234eek.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=49Flv/FtbB6cDsq8cHgb39e1qdRxZBEvLEPd5jjJ1Po=;
	b=s/3SIkq3n5s7y7H3UUjYhMYuJuwdY8UEEEIPSeUijF1ysOwnzsB8D+gmCr2Yb3I+22
	sPaH/5eBNsN3zodzmoiYtONi9rtw88kZfPOgvMGnS5wUzsZGe1g1N3KS+Nk/uRYi11i+
	wxKqbsimeSkzrv9iTOO/C2IMCGWkN9IliqclLGsqm/EGJQdEEVIt9tffntiM85ZabObZ
	KiH0XNjTl54fqerSehhz0NfIMyRx5WaPzPLfbvOeE9IsutWvZ3fdjiN/KDR1FguN9+u4
	273rtnorb2atgyYMFIuMg1ki54/6T85HWxg4/PQBG2tsaj7+gPQVuRVzqO9+V3dhCZON
	TTKw==
X-Received: by 10.14.5.133 with SMTP id 5mr2812003eel.56.1380975799736;
	Sat, 05 Oct 2013 05:23:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm39206705eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:10 +0200
Message-Id: <ed8b803632613900759dfd14f77f19c28b236f80.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 13/14] subversion: Add dependency on file for libmagic
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/subversion/subversion_1.7.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index f77656b..4acd70b 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "The Subversion (svn) client"
 SECTION = "console/network"
-DEPENDS = "apr-util neon sqlite3"
+DEPENDS = "apr-util neon sqlite3 file"
 RDEPENDS_${PN} = "neon"
 LICENSE = "Apache-2"
 HOMEPAGE = "http://subversion.tigris.org"
-- 
1.8.3.2


