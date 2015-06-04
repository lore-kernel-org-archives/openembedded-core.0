Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id AB0A47574D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:31:23 +0000 (UTC)
Received: by pdbnf5 with SMTP id nf5so21175253pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pnN8nQ/HBC4v+5QRoRZGHkksPuLiRIH0UpJR/KomW1w=;
	b=yNJeO+5N65TMUMlkAIubxUXA6QNKM7gOsoRFMjXfa9JT8Rm1SjccXWBcEwUP6tttPN
	0/qdtbxQ8dsXVsl6RsxBITBAOZz60hrYUOknotF0WhBkT5v7CwpqKE3LNUpDRQZuKKn/
	YBaBjIS5NT92REc7nQn0X0WOTqqqCbxF54RTsLZGWVy+XqJi298hRL5OloRlDZ9k1/8I
	1ZAzxXbHI8xqJ1qWNQeNWtUb+qhBYZBppqsJCwsUNwZyP6PVq4tTFqyEHW4XK3kNafxS
	RNf3OzIWrAb+Cu8DlVxFSRnZiIC83Yyx7vJ5he1xqaTc/dhp4W6MKn7w+qvSPVM29CW+
	EA0Q==
X-Received: by 10.70.50.199 with SMTP id e7mr65501368pdo.124.1433388685310;
	Wed, 03 Jun 2015 20:31:25 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ms7sm2144901pdb.11.2015.06.03.20.31.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:31:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:31:05 -0700
Message-Id: <1433388666-8923-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
References: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4] lame: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 03:31:24 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/lame/lame_3.99.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/lame/lame_3.99.5.bb b/meta/recipes-multimedia/lame/lame_3.99.5.bb
index d0e8872..2ceb45a 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.5.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.5.bb
@@ -28,3 +28,4 @@ FILES_libmp3lame-dev = "${includedir} ${libdir}/*"
 FILES_${PN}-dev = ""
 
 CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+CACHED_CONFIGUREVARS_append_i686 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
-- 
1.9.1


