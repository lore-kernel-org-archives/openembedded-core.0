Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 181B07DF46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:06 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f8so8401137wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pK7XsuEB2f2MCPBh304bN3RIsoFpDFuKC+m5fJSl24M=;
	b=fse77NylPdFHjG/njX2+EK/dNpI3vTMNhsnsgfmHRK2rhb1nKUrw65+fS5uwgiEJYv
	Au5JTwk9PDslkE+nE0Zx6AOeOWkL3lNReSxopJhamsiUA9+C8JORDI48WfL1n93ai1Da
	PXJ11ut4vsEtnQ8lOoT3njZnUUPAouy4nb8TTpMVWkEWnZZki79Y/ASjq4ffxMMEWEEd
	1j6MeRpGTbmg70WsLQMNOz4RwcRhx9ZP0t7nrMmvihTSF6GWgmEkHuXym/sPbGNo2n1r
	/yl1fFKf0XKCORcKVQgXXGdxAqHxGacvC0K/nIu7m5/ZkofUYF7O2ut9vKZuxb+yxY5j
	kW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pK7XsuEB2f2MCPBh304bN3RIsoFpDFuKC+m5fJSl24M=;
	b=dTycRDb9XbVet8BzvcTxocAqOa12b2hSjo++jKhM2cYUEO41t+ndwGVe2vI4KmEO8j
	fFIMdnTozv+u56W4ak7P7XmWWFMkhPs6AL0cpdDvjkGJN9CeGqxXQ2Z6ldsDXRuZdlkb
	09pdO8ed2q6t3L/pzQxSeQryrrn5cx0ZVnMG987N4XisQpuv2RRhgZgXkuoj8hT0JmLu
	YfoyvGcYb2jOyuL7rNdgR/bVCAl2oLmF59WeomjKJsdHiVFllKjWRFnaN4scR1TcW2GI
	A8IKOyWzRPQYD3rlmU8z4y5Ic+QMDgZGk408kum92xxCsKWkzWyw7njBfgzD+nU8LnQf
	uYlQ==
X-Gm-Message-State: APjAAAWNS99JvOK8zN2rZl0ZhRN3JfO/uT8WUHp41ofR02sEBrTFRIK4
	AmTD6WA6eW6i1dop7s/kJehx4srm
X-Google-Smtp-Source: APXvYqw4t6Pura+WPDtBfXd/+uyBQTXy2HWIdwyn32iUEy6NR7YIXuf64J5mUOE6vxW389Jmb1WUZw==
X-Received: by 2002:adf:8bc5:: with SMTP id w5mr2998745wra.132.1558361526849; 
	Mon, 20 May 2019 07:12:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:18 +0200
Message-Id: <20190520141125.10805-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 35/42] freetype: upgrade 2.9.1 -> 2.10.0
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
X-List-Received-Date: Mon, 20 May 2019 14:12:06 -0000

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


