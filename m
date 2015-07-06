Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4D46373F87
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:52 +0000 (UTC)
Received: by igrv9 with SMTP id v9so162746038igr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t9eQ1ZhpvQI80fQRQ/q4gJZmXL7Lc/u6VT+dD43SCSM=;
	b=vZJB3D/AXtR8WhULg3IAvrQNifif/IKWpgoGuI9vzvTWQRfMeortxKqISkgpyplZzJ
	FbzKaj/pbuRCwBCumr642cSVvgDvkREa/zJ83povgiw5ir1smmgPLMRRM9eT3zJTAxSi
	fl2SH4luY8w97TmhlqBwM9mbdmDrvCZaWl3A3hJ+9hdz2bBl/MHqayUtXReOYL5MKCET
	pzqS6IXS9jPcl2rld8MMorM1xaMWFdwmpVmt1e9ZIwF/SbGZJBKoSI40bhtVXeg+X+Un
	Gu0mXh2plpp21SC6RNsU96dYW6vu3uo7mRn7BegqXUDqg81xFSm3OOGD/cLU9F5+Ijau
	r47w==
X-Received: by 10.50.43.227 with SMTP id z3mr74649074igl.22.1436215852464;
	Mon, 06 Jul 2015 13:50:52 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:04 -0700
Message-Id: <1436215810-23722-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 07/13] pkgconfig: fix typo in fix-glib-configure-libtool-usage.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:54 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch
index 9bee438..01c6247 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch
@@ -1,5 +1,5 @@
 
-Upstream-Status: Inapropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-- 
1.9.1


