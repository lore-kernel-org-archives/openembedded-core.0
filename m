Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A146A75034
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:46:52 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id w16-v6so1624452wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f4JqF5x49wFJ/Xn89GeYprfVbEyfOXB84DlWAwijRj0=;
	b=QOxaSUTsjZdzKPJ+Ta0Cp/XPsU48nuB9Rv5sK5U0kkJTQxCTpAEeNCE2WA2KYnT7+Y
	sCMk7+Sr6uyyHQQK17e0VVgf2Nv5oNbMXTrotTj8QsTbVkzRo3h3BYTYmEQbLLJs5wS9
	Idc6iL9XACFp71RQDOTAoGgk/GjB/02uu3GFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f4JqF5x49wFJ/Xn89GeYprfVbEyfOXB84DlWAwijRj0=;
	b=eY8fJXD4zcDS+ojgffS4LF/hP6Q2UsFNNGxXiHRO6cvk/7lmGu75j8caNJe3hHqGyb
	Hn9wW9epPRq4yqEPvjsnz5653Mhna00kc30URoGi65Ao5bcIrTiXZiXEk0QM2aUiUXQB
	sZDN/BGcuQGhyV+adp752gAhcHj/Ov3ZlOhnkeom7hWXeVebacvn3k6PwZWXFHC3sQKe
	IfVb+Xl4NT1X07VHrBwnRYQEdRvGbN/PURvAqmefd+gWPedK60pRVPGV0Oq+dcxbJ0Rr
	VS04mMmNdGF71VeU9KhqLQvbyzCqgw4gSdN5vq/79yTVFvwCjFaVXQ7+K5+EvRdU/WfY
	SgGg==
X-Gm-Message-State: APt69E1lKAU9aQt7m202kl90aJHQAqUmwIw28btMPQoTjo2/x2tQkzO+
	doRIG1E/r9hR/8aTCS+wVbtUpnR/f6s=
X-Google-Smtp-Source: AAOMgpeEEzKF//8I1i8sPG3wopE2zB0oTAJxPrrqZmznJvWDTdQxE1aPNeHHwqmqZuT79OPzIvzmoA==
X-Received: by 2002:a1c:dcd:: with SMTP id
	196-v6mr1900313wmn.131.1530280013239; 
	Fri, 29 Jun 2018 06:46:53 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	r15-v6sm8119573wro.21.2018.06.29.06.46.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 06:46:51 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Fri, 29 Jun 2018 15:38:30 +0200
Message-Id: <20180629133831.21377-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629133831.21377-1-nicolas.dechesne@linaro.org>
References: <20180629133831.21377-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [sumo][PATCH 1/2] mpg123: remove LICENSE_FLAGS
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
X-List-Received-Date: Fri, 29 Jun 2018 13:46:54 -0000

From: Kai Kang <kai.kang@windriver.com>

mgp123 is patent free from version 1.25.0, so remove LICENSE_FLAGS.

https://mpg123.de/cgi-bin/news.cgi#2017-05-29

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b0bc82a5f238db82425b3b146e269bc6605cbdce)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb b/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
index 929069ab49..ff2b7d893b 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.25.10.bb
@@ -7,7 +7,6 @@ BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
 LICENSE = "LGPLv2.1"
-LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-- 
2.17.1


