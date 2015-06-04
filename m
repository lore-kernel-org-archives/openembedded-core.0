Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D8F35734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:25:04 +0000 (UTC)
Received: by pdbki1 with SMTP id ki1so36954317pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=im+1kySqIVbYXAJp5gihAUv+JjkmERRdlMdoiRNQGV4=;
	b=Vcwr5XklwnLCk9kaitr6XmMFiSZoLLD339z/PzXvn7nnjvNQGubuo+dGy2jATUG79i
	atzRwKahgz+DN23DoMv+J0nlB/GFyTRYu9D1QJaikhSdIxxdWjufC9fReQ79RlwpNwBa
	ybF2dsJyEGlTF2Ol1rhBw5nLICp+90UojT6pFWlZoSOJdPGwcfSw6yxNz+ft66+gwYRH
	WpH59m8IST8Wu3A5NHGZl5beczLV6sAqZXewg9IAOEiK591BtAESfbYhrIPpx4bxpZ1N
	pPnx6KSX1nvAI3Fr7XkS+77xslXV3YNUZRjnpLU1MrTsVv7B509hQCO8ZsQbW5JTdToT
	Z7Vw==
X-Received: by 10.66.193.164 with SMTP id hp4mr61023721pac.23.1433445905915;
	Thu, 04 Jun 2015 12:25:05 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id nm6sm4493240pbc.75.2015.06.04.12.25.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:25:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:24:48 -0700
Message-Id: <1433445889-7311-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433445889-7311-1-git-send-email-armccurdy@gmail.com>
References: <1433445889-7311-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4] lame: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:25:05 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/lame/lame_3.99.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/lame/lame_3.99.5.bb b/meta/recipes-multimedia/lame/lame_3.99.5.bb
index d0e8872..0477611 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.5.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.5.bb
@@ -27,4 +27,4 @@ FILES_libmp3lame = "${libdir}/libmp3lame.so.*"
 FILES_libmp3lame-dev = "${includedir} ${libdir}/*"
 FILES_${PN}-dev = ""
 
-CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
-- 
1.9.1


