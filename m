Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 935D57EB3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 13:25:06 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id d18so6301213wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qn6w8gabChqkvNLstBbqjD+cw7MRZB+cZzR/h8Sxo5U=;
	b=pzqalBaGaV9B9kbVKNAqKiqlCz8kSRRAHPHyZJcD/yDz7ioFOqcD+OBashtftcztZE
	rEQevDQwuszwj2405pou1kFvgBy6dafmWubA9/UYyqKcwBwYWROk6TeFKcJUil/GkByB
	cL2lbyWva6ZvSzXLW7Wtxrei2A3SL3Vkn6lCvKv8ClqX62xTYXWeI+CaHUjtHOhhOEh3
	lDocw+IgI3Z8m20fLLEgMSbTayoIJjJWUjG+6mpLzJYdkC/JAHDGGOjM+GcOeTNZhynO
	0bq32SD+nil+g5gqec0RWz7jvo++3fW9eFbutq7XMu+tqCtEJ7P1oFmFBif80wWHpReJ
	jciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qn6w8gabChqkvNLstBbqjD+cw7MRZB+cZzR/h8Sxo5U=;
	b=WoQwwR0qUdmgisTpiY+1smrCbG71b/8E4zdSXw6MLscRr5b+g4NwAKJisrdj6zY6WY
	3vDftETLwAlsSI/nL3dSf6S7YiX3xAJRmvCn/vfdy+CrpwMpkds69aeGIJtCHrs+Ufrj
	XkLU157GCstsIEtyFWV/vnviS4FXLqOWoFiL/IPihHfIYDrhFFev3mL0d/IwdBZXcwyB
	kkT+nPLc1fQJE+kgmDVyEytmGUSKc5CY7NM0rVGz2Dwj4ZyopqWZQhje2qZK0nEgIvzq
	Jd0iS9VMVBYllAjAu/WHONt/EgWbjECYxJ7RjOwigNeHlbkb3OqcfuJtPeTiOjV6Sl4C
	fUOQ==
X-Gm-Message-State: APjAAAUfVGQoEckRxxwdfwQQKy2ID6YQtCiD25Pgdb0m3c+uwkVCxjAK
	5Hyxqln3tvVXS4/37RTdgGKJTr1B
X-Google-Smtp-Source: APXvYqxy+c/ak1hE2Q36P1riR1/xN9iurl3GZcnZR+41zKprL7M09T2e8ZsNPuejWyQUnWQemeQAvQ==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr8406859wrq.171.1561728306985; 
	Fri, 28 Jun 2019 06:25:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id z6sm2158338wrw.2.2019.06.28.06.25.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jun 2019 06:25:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2019 15:24:52 +0200
Message-Id: <20190628132457.39465-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] rt-tests: exclude 1.4 version from upstream check as well
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
X-List-Received-Date: Fri, 28 Jun 2019 13:25:06 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index f87952e0a8d..84a8f67bd45 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -3,8 +3,8 @@ SRCREV = "dff174f994f547a5785d32454865f140daacb0f5"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
-# 1.2 and 1.3 seem to be development versions
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.2)(?!1\.3)(\d+(\.\d+)+))"
+# 1.2 and 1.3 and 1.4 seem to be development versions
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.2)(?!1\.3)(?!1\.4)(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


