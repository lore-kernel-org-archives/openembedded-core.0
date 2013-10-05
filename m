Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 004D26CD76
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:13 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so2296996eek.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=7uimjRKMPK+c43ZeljVuHw8XayVv1/kKN49G9KOrypI=;
	b=WZSqAXuMd1Xgqsnsv+b7cnIXtV6g/vW+Hdu5MNF4gw5rDvUW2o33Dy0TKWDaO0uBrx
	z4XqdDYVcGKUMikZUpptaoLHVwIFcRoTHfFiwCOLnDZll+CS8zdjFbPlESHEZdKlDtwK
	aZJ1qejSi4UrE2QHxNLLPKWWt56SblkbFUnBOuo+2JTekgXv52UGiBrXC95K3QAoRXcY
	adQI/UT6PKw0qmMQ1K3l42Cr9XC+GjUS3LIlG4wb2WGZhHxMPGWste6dZeSvdvkszjtG
	WXPRJn0lEPt7oEempuCF/ALMS08b/0hIilEEdkhE3+et/uLamk3cdeNVAKQKCzm9/EnX
	2KGg==
X-Received: by 10.15.98.194 with SMTP id bj42mr30711520eeb.12.1380975795579;
	Sat, 05 Oct 2013 05:23:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm39210983eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:06 +0200
Message-Id: <f6ac08a55048cdeff41f3bd2ce57c5df0871726b.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 09/14] wget: Add dependency on libpcre
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/wget/wget.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index de9b620..7af55c4 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "openssl zlib"
+DEPENDS = "openssl zlib libpcre"
 
 INC_PR = "r16"
 
-- 
1.8.3.2


