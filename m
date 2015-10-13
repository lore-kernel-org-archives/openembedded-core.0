Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 14C5365C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 13:03:54 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so190606824wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 06:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WO1ttme/zItoJxhQM+6k4qkCHZpCk0mLjHOONNximb0=;
	b=HfzCwbQGbJxXNrNuwKLwx5V3DxFkRsnf2UGzex5wZt6e1Yu/T7ibxEeJazW13RXaH2
	JhqI1/NUNz09a/jOxmXRddJq1bavcqQuji7X+xN6UGgIja3+E5KJA4EHHzVSA0nb/ZfE
	xCex9Vco9k29hPKJAapZMpomw3P+l3ZYR24eaSo9bbDyl0la+pB5VDNWgLBl8EWpnKKk
	mLPIKx+KJCpGXEFyMjCZyzUb/Ua7cfaMNEc4YEGR8F81Gp5IOvYEB9TKTejAttj4RIdW
	2YyGfVafItfWRG+US0VBzrzsTlbM+Lu+Bs7hyjQ2/dl6OnZOlyLOrJMi3wQaHFlnFr+y
	lSZg==
X-Gm-Message-State: ALoCoQmSxN9tAqjTw9ldbejW1pr8x69absPXcIXYAn2q4KSBfkpUxs9REzngJyu3YNWUbgXltEHV
X-Received: by 10.181.29.102 with SMTP id jv6mr13115564wid.59.1444741434638;
	Tue, 13 Oct 2015 06:03:54 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jf3sm14960341wic.8.2015.10.13.06.03.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Oct 2015 06:03:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2015 13:56:25 +0100
Message-Id: <1444740985-23542-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] linux-yocto-custom: fix typo in Upstream-Status tag
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
X-List-Received-Date: Tue, 13 Oct 2015 13:03:56 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../linux/linux-yocto-custom/0001-linux-version-tweak.patch             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
index 39c7ee8..1c88315 100644
--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom/0001-linux-version-tweak.patch
@@ -3,7 +3,7 @@ From: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date: Mon, 11 Jun 2012 15:31:42 -0400
 Subject: [PATCH] linux: version tweak
 
-Upstream-Status: Inapproriate [example code]
+Upstream-Status: Inappropriate [example code]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
-- 
2.1.4


