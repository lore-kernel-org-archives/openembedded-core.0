Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXl-00066r-NW
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:44 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so507877lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=DT6TXCd8TJauRgcQm4StJU0vIUgfc2hiFWHQXJg1JMA=;
	b=s+Ofp4veHOZTJouWcfVsdKiAHjow16Z0vL6JU5CCTGnljJUu23M5ulcZGgJHt0SPbi
	RLHL5BtNzh0Z4U77TPrC8Ie/eUknTOF0XJhXgexTybep1Kt6wPPpcOLgjF7u6UoQYiWM
	qRPOL/1ezG/Sn8jyNPpuqJrbMvCuKIfZkimt2fsZKiezq5ruRv45sDQ9aM1cWdZdRRxA
	7vGfUrjUkvQMVNMFli76AZ3pqeGzLBqdg6Yc4CbI7omXH+oWeKJJSZmIGYhpklA7bm+T
	Tj54ea1VN/X+SoyvB2uBsxUZTcjl4eo6AecJacqdzUhLgCN4zvLm57F3oFPvDIq6WU9P
	l3rA==
Received: by 10.152.108.37 with SMTP id hh5mr1539193lab.52.1354288564592;
	Fri, 30 Nov 2012 07:16:04 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id d5sm2212227lbk.10.2012.11.30.07.16.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:16:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJr-0002yd-Ak; Fri, 30 Nov 2012 17:15:59 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:40 +0200
Message-Id: <1354288544-10778-7-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-6-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-2-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-3-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-4-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-5-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-6-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 06/10] gmp: fix license segment md5sum boundary
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
X-List-Received-Date: Fri, 30 Nov 2012 15:30:52 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. Old md5sum was calculated from
the beginning of the file, not from beginning of the license segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-support/gmp/gmp_4.2.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 49ee59b..4da8381 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "http://gmplib.org/mailman/listinfo/gmp-bugs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
-                    file://gmp-h.in;startline=6;endline=21;md5=5e25ffd16996faba8c1cd27b04b16099"
+                    file://gmp-h.in;beginline=6;endline=21;md5=e056f74a12c3277d730dbcfb85d2ca34"
 PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
-- 
1.7.10.4



