Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0B67482D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:28 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id x4-v6so11753675pln.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uOwSGJSykhkHvjGhgdqPDsSbJ0Mn2Zx9O+ZOdEq4020=;
	b=MBQG3sQveKMhpSXMvZdlFi+LikYuqq36d81DwhP5Za50mWyHIfyoSd7+FuaR3Gy88m
	vdYcWaUedBAV5yPVgaAwLoFqHE5o0TFSYjitLWSQ6WNUa1OFkGqc9iJj2xa+eyYWeI3u
	YRg8ZIHktEgdhJMIOBuCtg2UjYS+b7x9hKFeNRVrFle5WYKN187QBDvBxRRWEz/UgOV/
	XdynK1WRpMbsvlUYu1w4eD1KcvV2HDalvmVZVv9ShVBTOh6tyJ6ORo1m7beL/oPQibcW
	Yoz+vWBPFlvgVjuh/zNOdcrKvV9KHg+a5XWtKjqU17LvINMgyxb/tU5KxSE7Hjzb70E1
	gMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uOwSGJSykhkHvjGhgdqPDsSbJ0Mn2Zx9O+ZOdEq4020=;
	b=MB+XbQDYPEg5xaOskkj52Q2d883iT9YtpVqgNqAPy4ijI6nDj5GYdyl2X0vPIdDlXd
	20T36ugiZTMibt8vDSfycjMgL9Lcj/Z43SMDX+Cx8tLW5azjBZn8aD9w0JOByE8ThzHa
	fDl+NvXPgcZWQOx41pO1GgkGsmbxEEwWY8hwzg9KZAmUtkZHNDL8obZvHEdWF3raA/qL
	bjrRr6IVvN//iyw2fD3pS8WyZR31Laxfrn0bpD3oBY0Mkhu6+V35NSkyE60PH67O4Dvj
	pu8qBHmBkqUUK6LB5taOgFFec3o/ZYdqlns3drAqYlhUcliPQgFm1/1WJBZ7gVejkf4N
	2NTQ==
X-Gm-Message-State: AElRT7EP1R/qfrIl9j8bpNdvZivg7hrofSADdICVvZMnw7hGYKLbzPg2
	W9ZRXZGDossz4+GTCtRDEC16tg==
X-Google-Smtp-Source: AIpwx484c0+yw8O/YXEQdojtMh3sQOf8CR1EF5stM3fiIKJCG2p6v6JyAhStn/fThrANa3ILpt3pqw==
X-Received: by 2002:a17:902:8c8c:: with SMTP id
	t12-v6mr16566186plo.100.1522806570168; 
	Tue, 03 Apr 2018 18:49:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:05 -0700
Message-Id: <280b0507b3eec349c6cadd777b5c7ec84873d76e.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 06/21] xwininfo: update to 1.1.4
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:29 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-app/{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.4.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.4.bb
index 0c23d19..1fb90dd 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.4.bb
@@ -11,5 +11,5 @@ DEPENDS += "libxext libxmu gettext-native"
 
 PE = "0"
 
-SRC_URI[md5sum] = "b777bafb674555e48fd8437618270931"
-SRC_URI[sha256sum] = "218eb0ea95bd8de7903dfaa26423820c523ad1598be0751d2d8b6a2c23b23ff8"
+SRC_URI[md5sum] = "9a505b91ae7160bbdec360968d060c83"
+SRC_URI[sha256sum] = "839498aa46b496492a5c65cd42cd2e86e0da88149b0672e90cb91648f8cd5b01"
-- 
2.7.4


