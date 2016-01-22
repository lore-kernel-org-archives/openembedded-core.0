Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id ABCEC75E2D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 21:26:32 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id w75so55351463oie.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SGtM+dEzITI6hfmO6V98KuJhyj93mL/1VJuFow9Criw=;
	b=D0La1a3LKzVu4HCQxk4KTy+/M0JuLyCYD1VwmxzFLWUjT2KuxtJBk1dEJYNuP66HxX
	eI2K1WPls8E5KOVZp0/GHC6MaazniQAdTFBmF2z4C6v6ppZnKILit//17y4QGehQ3pE6
	dpGb+WHOCJvbM3Ezw1gvieBdjMmPYPWNgrKbbtKHXgjsgRPWbJRBBwM6NFRWtFizbvYj
	NFpTC0Pe4a+C7RO8GwN92tXEy7dKg64gtzqxI5nIkKKXtNvyqA57f/eQZ2hRBOGLxYnI
	mTgdva06k+yRoUI7g21CiQ12vcZscGfo2BIQ+Uja+1rEoHkv8hE4iJzkZilBLfLylWW5
	cV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SGtM+dEzITI6hfmO6V98KuJhyj93mL/1VJuFow9Criw=;
	b=gkzfuRBWL/6YKjaNxzJX5h1UPpTDCEawv8Y2LtoGiZ7IoVyVXgMDrcWREJQwVvSseO
	alUW3zOjgMxtq4o0D6RRMfKBoHfuwGCFPQQFJYDnWmU6EDJCQQECGgZwD92WoTRMPTZ6
	LmdcsmHH8qX4X0iL3Mg9eAunhQJSs5AaNqMSDdMoX3h5AunLxP9XAQZFJOqKjmWIYrya
	cppMCPaf4F54zUo1HwKBO28j4FJzfNkbmEtmiEhRCTMgbRVP1RC4cVbPmvfnR34Did4+
	VKlaOt7u76/ZyeLsnQmJn3PogiXCB6I6RPpArp5cI2uJX/bcgb7uDLkksoEElgJZOLDY
	bGgQ==
X-Gm-Message-State: AG10YOR2qumSO5MMgWpi6GCDlU/wU4u+oqnBwMDLG3sTozJIj0KPkQkt5jJZ9+gPkPOVnA==
X-Received: by 10.202.188.68 with SMTP id m65mr4142822oif.37.1453497990985;
	Fri, 22 Jan 2016 13:26:30 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	l19sm4042723oig.27.2016.01.22.13.26.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 13:26:29 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 13:26:22 -0800
Message-Id: <1453497982-9859-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bsd-headers: fix LICENSE syntax, && -> &
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
X-List-Received-Date: Fri, 22 Jan 2016 21:26:37 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/bsd-headers/bsd-headers.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/bsd-headers/bsd-headers.bb b/meta/recipes-core/bsd-headers/bsd-headers.bb
index 12a2cca..1fd5b82 100644
--- a/meta/recipes-core/bsd-headers/bsd-headers.bb
+++ b/meta/recipes-core/bsd-headers/bsd-headers.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 DESCRIPTION = "bsd compatible headers"
-LICENSE = "BSD-3-Clause && BSD-2-Clause"
+LICENSE = "BSD-3-Clause & BSD-2-Clause"
 SECTION = "devel"
 
 SRC_URI = "file://sys-queue.h \
-- 
1.9.1


