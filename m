Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 252BD78290
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:29 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id e1so6598355pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cOjWoPNjibIehBgMwUrCgAG0d3bHgpB78Wa1cStBIgI=;
	b=GQHRvHKeBSgRQDqRCdx15fPZPvYH94jgwuTyX98O8LgVawnvtIrxCa6Zfi7B/oss6W
	WL8vzxbdO0GE11LcTzXqX/m6QEZiQ8RO/Nmu5V1x5Gm+pnkk/1QMslW8br80/iK71uWW
	plR/GX+GTTudX8G/7jy6ws6lT9qO93s06+9MD6SXR5Hd5CihVRt7mOhrxuLuHbB3KYEN
	o3RXLe5KvTMcdVwuCQHiHZl6NTPbo97GaNcLGK0iGyM2V+IWG+vdrj5N8/YAnB4nUMLy
	BLiiv9NQi9HCZykBFL1eNyPtV8E+JCGXhNZe6sFdKNYvLCL4WYo5gaKFILSsvzwXsELm
	oJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cOjWoPNjibIehBgMwUrCgAG0d3bHgpB78Wa1cStBIgI=;
	b=lGDp7I7PnkMQpVl0rTJixllo+KKKht20UaGkzCH1MVv+sFMltrkdzYQvcjf9tFZbjC
	yNgflm+UGjE6kmBwbDzbubS5ZCiODWtuSsCwIJRSGNB+XMayp/IcoAPS1EiKq+MHsRIq
	bwFXfYN8/yYAd97I1eScj6nMhR4AceOx/uXx7Cj5xbAoHovw1irrqpAQpcLRzIYDusA3
	QKE9nO2/mIamjoJiqJaqaejK26BM1WB0FiYhBV0jVvLXW1ZeGmoYkR3W6YklHYiuWwMO
	FI2nZzSTO3K8wrTwePsT1eNaE6ZIB8wSP3KBMsh0zo8pocsCpeaOgPw+lBpKZXA68dvj
	GlHw==
X-Gm-Message-State: AHPjjUhIk/DH6pBRpnTNzs8LAwuwyikCAPCFgePofF/J5+B4WqIOcbtv
	J9ZONrKYh8960iWj
X-Google-Smtp-Source: ADKCNb5m6E8Csp9kjgRdr4S6AV7TPDkmlGN2wLlXGWb8d667fWUroPRzJ1QPiruDIyk5hVKJEOiGaw==
X-Received: by 10.84.209.197 with SMTP id y63mr5319724plh.244.1504912951141;
	Fri, 08 Sep 2017 16:22:31 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:47 -0700
Message-Id: <1504912911-23120-12-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 11/15] dpkg: update SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:30 -0000

The upstream oe-core recipe fixed similar fetcher issues by switching
to a specific debian snapshot version. However, the debian snapshot
doesn't provide dpkg v1.17.4 so fetch from yoctoproject.org mirror
instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index eef7ce9..33bbb3b 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,7 +2,7 @@ SUMMARY = "Package maintenance system from Debian"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/dpkg_${PV}.tar.xz \
            file://ignore_extra_fields.patch"
 
 DEPENDS = "zlib bzip2 perl ncurses"
-- 
1.9.1


