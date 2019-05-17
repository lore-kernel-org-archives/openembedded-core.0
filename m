Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D966F7DEA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:11:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d9so8126748wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6gIxFNxnyonxuOCQiF2D7NeACZiBm3vfujnRqjAN42o=;
	b=kNaw/m/eneSM8gwfHpb18ABCV4jY1lJCGBjB+16i5bK57j17i4ffn/jZLjdINNA44s
	KN5L799Mh5t5niQw4lfmmpTR5661IfZyw4kv0/OhpEkHvYFU+gWvjp8yvYyHPY88C/xg
	Ukg0l/d5Tk/d+ukKn885qmzEm/YDBxgAv3ZGAB6OeVw6ZoogiwJZTl0bsCVCeFt8rhwR
	npIuuxELqTAtYQXKrrMLdR9gs7M6X8UXzdeGGgva+xDGZRYkkvPozOqUpBlrpfNt00EY
	iBVKiXWV08w0VvBBIx4kzUVuYrdQrUEN0RyQuA0bHwaTX9jwCd89gwrxB2PfEJB6Rain
	IlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6gIxFNxnyonxuOCQiF2D7NeACZiBm3vfujnRqjAN42o=;
	b=Tll9D0bRFSBzAhDA3QiY/GmQdBKkJoz+8XJAVpCTseC5Yop+oXOIJw9zMlFaCnsDB/
	Jv3760f/yjch/Z/L7grH7g0iXESSgYye8XAkjSZk5xQg8hUpvAEn9Hya+vSMlNKSUFhz
	wilrjENo/3Z/obbzW5QJxTWwWEyVFU7hv3glWVfCx4wAzhedkg6B7vK0k2PKS9TI8ZLM
	/gOz96YlYf5awVl/OY7pRtOGMDtNXdn04Yunz2XLgVqvJHVAgBHh+tAFtYnNJjj901pt
	6ygQc8yarzwLELzwls5rTiwlmb8D+8QZq41JJwU5/Rd1FK0fEVFsfP8f15yXu8jSh6pu
	/tog==
X-Gm-Message-State: APjAAAVARy6nTA0F9s1d5MkCaYDSo01IBGX9sbaEFic9UrIACj8DoCjJ
	CJYrSa9NXuLrgGgtTkWlvQ0FkPwV
X-Google-Smtp-Source: APXvYqxKFGY0mClZPg24DMXr4bM0AB1c1H8fLDe7CaKtni5KnaTWgQxj8sG3AF8UnP0G4xaqcX9rCg==
X-Received: by 2002:a5d:4604:: with SMTP id t4mr35167371wrq.93.1558116718329; 
	Fri, 17 May 2019 11:11:58 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.11.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:11:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:15 +0200
Message-Id: <20190517181151.44001-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/37] librepo: upgrade 1.9.6 -> 1.10.2
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
X-List-Received-Date: Fri, 17 May 2019 18:11:58 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.9.6.bb => librepo_1.10.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.9.6.bb => librepo_1.10.2.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.9.6.bb b/meta/recipes-devtools/librepo/librepo_1.10.2.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.9.6.bb
rename to meta/recipes-devtools/librepo/librepo_1.10.2.bb
index fecedc981f6..43c1967c2ba 100644
--- a/meta/recipes-devtools/librepo/librepo_1.9.6.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.10.2.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "7d8acd45eb09809a5ab729c312744da4b2fe92bb"
+SRCREV = "91ebe846b0320751a264116c36a665a8facf9e0e"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


