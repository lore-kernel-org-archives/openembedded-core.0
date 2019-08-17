Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5537F32F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 21:21:46 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id h3so548783pls.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ymkRFCWUx10ycgLFNunG7/yu1TjVc3WwCcaBRFt8fM8=;
	b=fNZJWS9cJCs4UYpvxV2RjfZ3B2HOUAke4gcQoFvwItt0DfweqNksKJ0rGMt19G6FIr
	KYdc+bBxdgkDrtZJr0PpnYKWzTRhCEDL2s9ivAvpdJ5uhoRq9TTsi0kdq9SncsUekk3B
	25MSYyTjOd1lYomJGVLjXo9YGRCaTQUlfLxS8fPu4ElD7moVuAMbtSTXQmfO+THPkvYA
	knvf4e6EuUi7P7vsYETJMKp408j71cvZqXJPiZV1NQM+VypFiJX4ix+eQSHVuu4ZUQWR
	TaonIzKpUDjYbiPCHbUvPyBVajhYho3Qwf22YlrH5kidYzkjWnIcI7SRzdiQK0lEhEL7
	ScwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ymkRFCWUx10ycgLFNunG7/yu1TjVc3WwCcaBRFt8fM8=;
	b=jRSP7C8HK4k1y6D0tnkJYJqbzSIDcgNyLO8EQ4v5PEyqeDAT8Or3DGzKmptQV0hpec
	rrLq5K6YySXqj4MyXcZimeqHycv+dZJxIk5kCVxY5WqXjQKCn26WJQ0SJKJb2usb3RKU
	8iOn9tr8qYkWTw9xEn/TLQpYvCk23pF8MhhjVutdt5I8eykX3NGDTam51nuDIxzD7Pck
	Ruuf4+9cvRgaEWx5cWUd3m2EOENbPKSVWHk1nqMflBIikPb1dWzmOEmbpca05Ac5XE/i
	8D3Cf52w6P9SwjPan6IJeGxgEHBiLTgVLpkc3CUKCfVafrnqVB0QstrGSoS9v8m6Lp9p
	2+Pw==
X-Gm-Message-State: APjAAAXXRz2VphulesmAMm42Wz33F3+iRyOM+IXeLgyVrpEmQ7pgsYvG
	72CAhTUw8Kf+bb1OrNEmKBppoQpv
X-Google-Smtp-Source: APXvYqw26aoMlTBLIv2pGk6z8Xwk/6SR68BVEyRhJlJ0WFQ7KgJ2if4q0M6oFzrRCDHt/eMOLUgGvw==
X-Received: by 2002:a17:902:7c12:: with SMTP id
	x18mr15729819pll.123.1566076907168; 
	Sat, 17 Aug 2019 14:21:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:29d8:851b:cd27:3ce0])
	by smtp.gmail.com with ESMTPSA id a20sm7261804pjo.0.2019.08.17.14.21.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Aug 2019 14:21:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Aug 2019 14:21:34 -0700
Message-Id: <f965ecbf558b6db1959e4ba8e599d65a5c8022b2.1566076780.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1566076780.git.akuster808@gmail.com>
References: <cover.1566076780.git.akuster808@gmail.com>
Subject: [thud-next][ 1/8] buildhistory: call a dependency parser only on actual dependency lists
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
X-List-Received-Date: Sat, 17 Aug 2019 21:21:46 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Previously it was also called on filelists and possibly other items which
broke the parser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/buildhistory_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index ad7fceb..d3cde4f 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -127,7 +127,7 @@ class ChangeRecord:
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
 
-            if not removed and not added:
+            if not removed and not added and self.fieldname in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                 depvera = bb.utils.explode_dep_versions2(self.oldvalue, sort=False)
                 depverb = bb.utils.explode_dep_versions2(self.newvalue, sort=False)
                 for i, j in zip(depvera.items(), depverb.items()):
-- 
2.7.4


