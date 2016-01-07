Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5FF7321C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 22:29:39 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id uo6so252042600pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 14:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gGBJUDOg6FTwWyX9fBWgBRSubGqC/aLAc3S9fCj4lrY=;
	b=THDwOKU0/MIUnWYxr2A0VqeeIq5yc/s+9dwxcN49YTmaMtGPwxGOH83ymHmjfUcaqU
	QXxj3wV6lzVSEB1OI7ZLN8MExiS5olGUP2OhkmO3oeja0jeLXttaV+Q733RIT7Lfhp+E
	t8vTHb2yMhj2IXorojTvrQLYG+Jqttc/YQ0Ywhgf2Q7UzMT6gkgzT0ANZTeFDBuutZxD
	qMG9OsfW79zWo5q8Gp7D3Yt2AsPGwzL9tPeZ928c4InqEH+ZwhA2Hr8HKeJBBHWVtEr+
	nr+p0tyfe8CcA+spYBFnrS8IdcerSUe48WNHkTbkBFCJvLSiS/iqfjPEu4xiP+pBpxN7
	ibxA==
X-Received: by 10.66.234.226 with SMTP id uh2mr150552206pac.6.1452205780420;
	Thu, 07 Jan 2016 14:29:40 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wa17sm93819672pac.38.2016.01.07.14.29.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 14:29:39 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 14:29:10 -0800
Message-Id: <1452205752-6353-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 2/4] gcc-configure-common.inc: duplicate armv7a over-ride for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 22:29:39 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 45b3f15..84e971a 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -74,6 +74,7 @@ EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
 EXTRA_OECONF_append_armv7m = " --with-arch=armv7-m"
 EXTRA_OECONF_append_armv7r = " --with-arch=armv7-r"
+EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
 
 EXTRA_OECONF_GCC_FLOAT ??= ""
 CPPFLAGS = ""
-- 
1.9.1


