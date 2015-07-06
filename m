Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1C773F87
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:57 +0000 (UTC)
Received: by igh16 with SMTP id 16so35610442igh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fNcXniI63JSJ8Owj86gIcFbNSXUXgDNwgYQ32f6S4aI=;
	b=sE4hg1SIGmz5yVP5RayuV/+uXlegLZCm3mGgySvnnHHn1XcdhscHEk3weCY/eFtCUD
	hDo8QsYL20oJp86R4A++eqAtxoMxhCYyFlRf6IXpElliUzvLeH/tyhJ6+Lof2N3b6R7Y
	mkeEayAARWCUcLs6T9x+IHjTrH48G9QYvdOsdTeqkJv6v8XMCXXhQOPzbj0+l5J8/pvr
	AZhB/5OziQFN10l7M5S/JfWRfab5PwpzLk485GTKd3ZNxA7CNGtYYeBKld0Kf9TvQAYo
	G9cYxl2zXbBB2m6IjODqaJSg7UngkzJMqRS5X+pBJvLU+MgpuJ4nJdkjQoDM3X/3Wx0N
	W9eA==
X-Received: by 10.43.65.139 with SMTP id xm11mr17164617icb.81.1436215857670;
	Mon, 06 Jul 2015 13:50:57 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:07 -0700
Message-Id: <1436215810-23722-11-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 10/13] rpm: fix typo in rpm-reloc-macros.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:57 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch b/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
index 0a5f5a4..59fe524 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
@@ -4,7 +4,7 @@ When the dynamic, runtime relocation is enables we need to make sure that the
 RPM macro file does not override the dynamic settings.  Fix this by forcing the
 dynamic version to be used in all cases.
 
-Upstream-Status: Inapproriate (OpenEmbedded specific)
+Upstream-Status: Inappropriate (OpenEmbedded specific)
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
-- 
1.9.1


