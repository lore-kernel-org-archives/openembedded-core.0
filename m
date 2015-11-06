Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id EADC076E2E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:52:35 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so116646348pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kUXWeFs1eFlXKMlI2UDADAaibVM6SkLCti9J/ExzWQk=;
	b=apYKPr2qQY8fqQa8qjNj1WstgAirY/Jk2RAu8O3kdcYvCFZ7dJdAbs2s0Mlj66tXE3
	k3DUl9fSblItutNcBlaP2ifL2R35ZrYcJJAbXBpAvfDb6c7KcnBj40flhvj3a4WHgOqr
	lMuLUtabFV0qnbDd6xJ9vKHknmAjc9aP3psz/1/A5UWcDCvW4H+jhIUBcjCjp+n6xsrx
	PLGqjRN9fD7aRP1097rppct9r84aGZDSF4oxBib7s11tMtNNemLNF8JfPLEBr9cTO3L5
	AsEq/wDhFNLa+F38AFDI98aziv6k4PiFW9l+NPPtC+gYJa2HJJ5aMMugkFCmsDfKxvsD
	VNAA==
X-Received: by 10.68.135.132 with SMTP id ps4mr15773237pbb.111.1446799956251; 
	Fri, 06 Nov 2015 00:52:36 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	uy1sm12553361pac.39.2015.11.06.00.52.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:52:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:52:26 -0800
Message-Id: <1446799947-7149-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] cairo.inc: drop obsolete CFLAGS += "-ffat-lto-objects" workaround
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
X-List-Received-Date: Fri, 06 Nov 2015 08:52:39 -0000

LTO support was removed from Cairo in 1.12.18 (and 1.14.0).

  https://bugs.freedesktop.org/show_bug.cgi?id=77060
  http://cgit.freedesktop.org/cairo/commit/?h=1.12&id=213b3b9b8b92944506c712aa4d728903c547f879

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 45651ba..c7e686d 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -44,5 +44,3 @@ export ac_cv_lib_bfd_bfd_openr="no"
 export ac_cv_lib_lzo2_lzo2a_decompress="no"
 
 BBCLASSEXTEND = "native"
-
-CFLAGS += "-ffat-lto-objects"
-- 
1.9.1


