Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD916F09E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 02:06:39 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id t60so2800246wes.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Ll45ibLBdDuq8lu6OaBl08ZVILfjP2CNJLGYanNWD3U=;
	b=toF5WmqfA4Oa9HMZ2axevHSdi/pjy0SDJi9pIw808YhsgMlcROc9D1Ky/e2A1UK69h
	cQokb2F+bc1KvqgmQsUJqtkitc3gv37fiFJOtBKldN3/eE130VOUK/OtIcwdU/pqJFib
	xYJG/vjMvrU0tMLBXUrMMvwhEEZqRzXaR5IN91C1YL4c0D/wC0E5Z8/O3ZuNoR2+gD8p
	wSw+bYwAxBk+fSdaba3btgIxFoqXBM+9AC9GUBsIIDd0oukWLbfceVW3UfBghEg2k54I
	5C7qseVnN3rqvxP16h9XStwES5JByI0faUjPLqtcJtSbVCSap4mN13RBw9c80hfGvH0H
	p6eA==
X-Received: by 10.180.97.72 with SMTP id dy8mr763583wib.5.1394849199880;
	Fri, 14 Mar 2014 19:06:39 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id jd2sm2219941wic.9.2014.03.14.19.06.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 19:06:39 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Mar 2014 19:06:26 -0700
Message-Id: <1394849186-25396-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] lib/oe: turn oe into a namespace package
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
X-List-Received-Date: Sat, 15 Mar 2014 02:06:40 -0000

This will let folks extend the oe package with modules from other layers.
Given openembedded consists of more than just oe-core, I think this makes
sense, and adds some useful flexibility.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/lib/oe/__init__.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index e69de29..3ad9513 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -0,0 +1,2 @@
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
-- 
1.8.3.4


