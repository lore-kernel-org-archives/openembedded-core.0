Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id B5A7D6CC42
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:09 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so2286126eek.19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=NeIRWd7a4R8tNqy0BEWSR35TKkoGJzXMbYIGLRDoMII=;
	b=p+uiHJr1BR5H8NaV7UVpvguOb7MZnjZLYrKxt+u6PuUX6rXVxelkZYWSQcjZENQNwV
	tJVYvehiCYWVJxhlZUoYtOmzF5Yrv93JjWtzvi250RsjBB2rCuNXNo7TnD25UkUzmDpe
	AzLUDtqeqwWvfl6VtqRTn59iz0aI6211LP8Cxp5DDZtL+6GR5IcdUmkfy93ecsCHFkkL
	ece658FlSfblj9eWQTOsE3/qRqxs4mWfGfoJmw3dT/T73CrEedPtilj9ilF86Vujn12N
	CQcsrTf9fLbdIoofzO0vWBtZMYXm8mmFUcbQvQTCnBjdaPeswsupbg/Xbry/2neHIaUl
	0msg==
X-Received: by 10.14.103.69 with SMTP id e45mr3175420eeg.51.1380975791299;
	Sat, 05 Oct 2013 05:23:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm39210472eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:02 +0200
Message-Id: <e6dc9a620f06c55de710e803f582b30b084d1b85.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 05/14] xdpyinfo: Add dependency on libxcomposite
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
index c853926..3688e1b 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
@@ -9,7 +9,7 @@ clients and the server, and the different types of screens and visuals \
 that are available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3"
-DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxau"
+DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxau libxcomposite"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
-- 
1.8.3.2


