Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 18CDF78709
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:16 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id w12-v6so12041340plp.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kbCDVraM7v+zrX5nNK/xy+6XWeuJEyTuZ/zBSMqJnjw=;
	b=Gz95eDoZPeH+HA0MSeESitzuL9aMebZxkPU1w1hAn4EhT3ruhiQJzWpo5/Bq3VISMo
	CJAKsf/ZU3jE7GwhoZqMoa6ReKrels93pTYoxnxc3Y6CXvd6AgXxH8b01gp2jP4l+hkK
	t5Eh3iI+CL7dpSqcjTg0900QDmkm6373gta08j3/MyI6MDDKW7+q8wq08rqNzIzzGD69
	jULSvT1xydxwd0LwlGrSH84OUxqKr+Nnq7B9nEKLRcvzxtJMhMnta7qZEWtJ89jwzWOl
	SW+PdIUnsoG4FJAKkZE9o44okFI5RcwPm6viVM80j7sBcx1mPDRO6vDhRGDZhlvO/kvz
	dFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kbCDVraM7v+zrX5nNK/xy+6XWeuJEyTuZ/zBSMqJnjw=;
	b=qo21jLqE+jO45faf8lFmP/9Pq6v+mq4CyBinereg3hUskFmgvpdMvWSzbN9YrClJVc
	DkeTsP7xwXay8Lqgo3jmjbagQm8BV3CodelKr+Yu5/ttBK6tQKUO3OPzUVBxI66LF0gz
	XrPYoCcQis6C2cDVw5BBpTu2Q/UQXjbUEa7DnA8//5y3/lgwXbDLK0785IhJSihGWG0k
	DirAe7/Wia8Wj+1Ypnar4z1FC6xqMUHEG91YARsLCYUcOreeS1sXM5y+xcGUzt4L2JQJ
	ISDkE543rmRK+bP8nuibA1UQODiKaLCMJ6M6DkP7sF2JWzU82bt/fNsKylxSeqQqJ9yr
	O4Aw==
X-Gm-Message-State: AElRT7FzPBVBUrCFHEQmSsLHpiU+QehpGBmdF8779qTQqWh8cFUnD/9Z
	ZUbQAY+UB9UNAjaE4MgTUKACIw==
X-Google-Smtp-Source: AG47ELvaZlKZrSLtcxxsfPhsJpcX9430AgKf6+7KPnpUOqQhOpHyEFaACRBf4oEW1px+/85dHgfGKA==
X-Received: by 2002:a17:902:aa02:: with SMTP id
	be2-v6mr41156842plb.86.1522074678315; 
	Mon, 26 Mar 2018 07:31:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:06 -0700
Message-Id: <c6ac6cdbee20a78223d7dbf9d8cbbc0628a32149.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 03/21] xprop: update to 1.2.3
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:17 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.3.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.3.bb
index d78bf04..ca58d47 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.3.bb
@@ -14,5 +14,5 @@ DEPENDS += "libxmu"
 
 PE = "1"
 
-SRC_URI[md5sum] = "fae3d2fda07684027a643ca783d595cc"
-SRC_URI[sha256sum] = "9bee88b1025865ad121f72d32576dd3027af1446774aa8300cce3c261d869bc6"
+SRC_URI[md5sum] = "4becb3ddc4674d741487189e4ce3d0b6"
+SRC_URI[sha256sum] = "d22afb28c86d85fff10a50156a7d0fa930c80ae865d70b26d805fd28a17a521b"
-- 
2.7.4


