Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id D498175A64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 20:50:55 +0000 (UTC)
Received: by igrv9 with SMTP id v9so125338033igr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 13:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ewh37Nuc6jlzqok0TybsU9FKbi9uubXmk4a0sIomByY=;
	b=CNLsDAhy6Scm0az2hfgWeAVywrX1S5eamLhv0vAHUZqDRzAmEY6Vp9GHnScA2+Q4nq
	6gkXy61WUlDGKi/hQPotzZn9+yAd0AL9R/Q29rGr9gLELZKmaPscDhv8YCV8ZrLXHXy2
	ElTDpkMsW+H82UjUFWoMlr9yy4lNbYieDOrHTQKOs8sE5Bz3qzjNijL64U4XIqu3O69Q
	Ti1Dlg62OAMZL1ggRvgRblHSusr/3pcfgPWrsCaOOF9CuR1D+GvSBYhfuEJHxizzrCTk
	N9T0ERM7TnsFdxHqZpxennoSmsptuSGZtryPOQpTyBexkNVConD6uDnICKu5s1WrvYJ/
	8lfA==
X-Received: by 10.42.110.75 with SMTP id o11mr38116588icp.14.1436215856049;
	Mon, 06 Jul 2015 13:50:56 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id c41sm13182955iod.8.2015.07.06.13.50.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 13:50:55 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 13:50:06 -0700
Message-Id: <1436215810-23722-10-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
References: <1436215810-23722-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 09/13] rpm: fix typo in rpm-realpath.patch
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
X-List-Received-Date: Mon, 06 Jul 2015 20:50:55 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-realpath.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-realpath.patch b/meta/recipes-devtools/rpm/rpm/rpm-realpath.patch
index d2d9b09..a810123 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-realpath.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-realpath.patch
@@ -4,7 +4,7 @@ _usr turned out to be a relative path to support dyanmic config, but it's
 being used somewhere as a indicator to locate substrings, so we must get
 the real path of it in advance.
 
-Upstream-Status: Inapproriate (OpenEmbedded specific)
+Upstream-Status: Inappropriate (OpenEmbedded specific)
 
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
 
-- 
1.9.1


