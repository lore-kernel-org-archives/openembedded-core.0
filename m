Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9F07DFDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c77so6288576wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pK7XsuEB2f2MCPBh304bN3RIsoFpDFuKC+m5fJSl24M=;
	b=GZMz85ArYxd3s2zSK6NL8mufPOF/YkExQoVYJbt9L5/OlfVYSYQCSijdNWXOHz+0Lp
	3GfLleVFK/KxMsqqwHIbtNjdLcLadUoa+VOGytShrf1Vrax161Vy3dvnYTrMdmJ6QAn3
	vrFe5+WMdVUrGGmu6NsUxg8ACtUWKNZrrJhYOH0lWcehZgMlpFjLI/yriRwCs73eZgJX
	uebiFR/LrB9ak43U7+cDVN8kdshRMwAfSqqPxWBNlbWxi7mp8M0dr4TYGOYsxCYbujZ5
	aXH5/FV5/hDjFLzXi85xrQv29oEVgAiN8oft26c735KCp/xd0RZlhERZzQTZG/uQrwum
	KGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pK7XsuEB2f2MCPBh304bN3RIsoFpDFuKC+m5fJSl24M=;
	b=rFVf95H4xtucXz0pGD6kM5TJkP6Vh5afle0kl7W8kyt8URWqM6C6gMa6CfNAW278T4
	36KN+5ERHyQLVqd+WLNpXU0Ny6g8KMhSsBZrgYttDtDYkOtZ/XwMyuFjujyx0FKwini7
	4gFPhgxNtIvvn8gvsMiXRGLXn0ZmZFnFQf4/nT2cRJdAaHjCrpeMUuQg72M0QKn8Po/2
	n7niF4gB+wj5Tn6bLhIUo3RORFE2UnsPdJhX4xWQKKEQHiJuYZBKwwg0GHQAW83SE08M
	jQkgjR6rS8/E8Kxzvu2jNCMm+cQ1lHHl1PXS3Qz0nWr/Ir8iWXimV74KbKU5M3mF/E96
	uRPw==
X-Gm-Message-State: APjAAAXz19UchhrWgpEK2pZYlPZTbqVRlj3XFbJcgYL8ItK8oWww2wGr
	GW8gkSLmXDPzlDu2NrHLRv4J197K
X-Google-Smtp-Source: APXvYqw8VnVUrLTITvA4jR32rbaBuoBVqN17MF3qFl9fgi51JcdOMmNgVQGkGJm1tnsv6zgGQGHIlA==
X-Received: by 2002:a1c:ac8a:: with SMTP id v132mr4562wme.1.1558116748782;
	Fri, 17 May 2019 11:12:28 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:49 +0200
Message-Id: <20190517181151.44001-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 35/37] freetype: upgrade 2.9.1 -> 2.10.0
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
X-List-Received-Date: Fri, 17 May 2019 18:12:28 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../freetype/{freetype_2.9.1.bb => freetype_2.10.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.9.1.bb => freetype_2.10.0.bb} (93%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.9.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.0.bb
similarity index 93%
rename from meta/recipes-graphics/freetype/freetype_2.9.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.10.0.bb
index 1e6f66ee9ff..200f43c21be 100644
--- a/meta/recipes-graphics/freetype/freetype_2.9.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.0.bb
@@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI[md5sum] = "60ef7d8160cd4bf8cb118ee9d65367ca"
-SRC_URI[sha256sum] = "db8d87ea720ea9d5edc5388fc7a0497bb11ba9fe972245e0f7f4c7e8b1e1e84d"
+SRC_URI[md5sum] = "a717e6925b61b9dda946322ecd278a42"
+SRC_URI[sha256sum] = "fccc62928c65192fff6c98847233b28eb7ce05f12d2fea3f6cc90e8b4e5fbe06"
 
 inherit autotools pkgconfig multilib_header
 
-- 
2.17.1


