Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2787F7FCE6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:13 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id cq11so5612905pjb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=d583mcwyno4Z9tOJHndA5WRA/xEMzGjZeuq5KxT+LnA=;
	b=TM91VEWt1g4nMsmnDolUB0A9ciLWDuXpajdon/ONS18GKB2aQ3Xm1aMcqqoEi1peKy
	eVQqUY1+930PNebcW32FqSY/KjrKOpFxZvEIbc8yN8y+w1AuxU6BtCuLXAPCXmgTOu6l
	kP/GbVV8sJR92i3xq2T+MVNXmZ6lX28gck1JlrOZYbpBi1f3SkjYZ3LD4C1V6vxCFd24
	2YKnxbkVdYUvhO1JlP1/Ck234gsik2lA7VYlK+SR1YwqUf/FWOHJwFDPH64GkcEJYabu
	4u8gDJmIw49nNCU31/lTibWE4J+kjjxnlBX3wsbZOy8DFgAsSj31RrF7eGIyrTitIWan
	9fSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=d583mcwyno4Z9tOJHndA5WRA/xEMzGjZeuq5KxT+LnA=;
	b=QygPuVECu2nSLyq/1qP+A852UKPO44BeIkagwE0Wq9nkr+EzL+5jFOJKSGuVpalomT
	EldZkcOonUOPTNed95h6B1seTBoOVRte5krjCixmwaSfT+vnEKLaqcmMy7bVHcl+3WQz
	t7DgSQvx5D3y5S2z1fBY83YVZOIv5YiFwiHOBIkDYkU0SqfvL8TFybJRjKAf3RgMgwBQ
	QgHiyBVKzPba+CvBr9ESnYS8pQv4ijD2hIBsRcbovnf87+aN7KehhsxONMeBPC3r6ZSs
	8TRI8ODZmcvU7olnkaQTMRM0wSvMGqr6MUjEVdBef7mxFpKt8+J0/rLkfB25dUUgmofO
	fp0g==
X-Gm-Message-State: APjAAAULuK2xMsVNPfC0k5vDt9iqgK1vhoLRx7LG9lhSyYDfqMFcQf+v
	5A1brigat0oyg1ojN4We8bRAGX6R
X-Google-Smtp-Source: APXvYqzvbCOE//nkypjdv+BS/D4ZAnNVUh/Pt2oXKjQ+K2Qp/ekcvHook4rtwYTsdV3wBuUJ3wg20g==
X-Received: by 2002:a17:90a:ff02:: with SMTP id
	ce2mr35165035pjb.117.1574639474348; 
	Sun, 24 Nov 2019 15:51:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:38 -0800
Message-Id: <469f545c19efcebdf7ae8ea66254ab5b507a1f5a.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 33/35] cairo: the component is dual licensed
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:14 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Somehow, over the years, no one noticed that cairo does in fact
offer a choice between mpl and lgpl, but the COPYING makes it clear:

https://gitlab.freedesktop.org/cairo/cairo/blob/1.16/COPYING

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index f32e9ba..e3de3f6 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -10,12 +10,12 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 
-LICENSE = "MPL-1.1 & LGPLv2.1 & GPLv3+"
-LICENSE_${PN} = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-dev = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-doc = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-gobject = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-script-interpreter = "MPL-1.1 & LGPLv2.1"
+LICENSE = "(MPL-1.1 | LGPLv2.1) & GPLv3+"
+LICENSE_${PN} = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-dev = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-doc = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-gobject = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-script-interpreter = "MPL-1.1 | LGPLv2.1"
 LICENSE_${PN}-perf-utils = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
-- 
2.7.4


