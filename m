Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2B72B7DBB8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:44 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z28so4439071pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9OjbYcYKdXxblCRT80tIDUT83IV0RixbUVwxumywORA=;
	b=n5Q0nVPy9CIT2ckta1gH+rwqN4Nf3dibGIOT8VXwt2R7RaJAqQe+ilGESp1iRvKZTM
	IN8ruUX8iBaE6GyVubnEqr4jWLVAjPPiM2iDWqR7QZx4klTOxvI0QdTT/2NWOXVpsc2L
	vFtyRB9Lv4yXsYnl+e9G7gjLQhroFPG0OpVTPQhrVQkPAKjsspJqGfBaUtZV+i3Yhz4z
	5PdrwhBSZzW8Qpwqw9/eZFnqJ3uYrMeU6lOj7dTko5sW+orjBX87Bi+ZrWyVoI6xO5YP
	/bSLSJ40Lmd4r9AlSiHbgmFsLVJoDr17nvdHigij6mrcQM1UEUYT+1Z6F7r5RcHrjy1J
	4EPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9OjbYcYKdXxblCRT80tIDUT83IV0RixbUVwxumywORA=;
	b=ngS7sUsyQ83T+vUHRHzFFInKPjR6F7mVM9JFy6UfJenByWGK9AcqpJ3JajvZNhfcFe
	4WxJO6Z7ycOlremsAO7gUkb7mv1h0V/YULBYzEjy2vg8ARjgdrGELNUpOnbkxfvBhjQm
	pttpyGoqs2pE1LEmSCyDGR5DN47b2iQRbhvJNipyybI9JEBon+IaM924biSCpj7Po0yw
	rosE5HDMz52jAT/mqw0juuNYIHRMm/2u9lRQCF/Qzpor6fAg3bZQesx3i+lRsNIQhvla
	i3PzvkA1OOCax30VwRS5cy4Std2+ieOrTwN0J6IOp/toNTkYHVoD3WDkvShWAyelove+
	EJVg==
X-Gm-Message-State: APjAAAWg1/080dTJCgXjHBMIxlSL4HzGTkGOXqhIj491+mMPt/3SaIsj
	ntQ4xvROq4QKsuqMPc4IowmjvItG
X-Google-Smtp-Source: APXvYqxVqYTvuNbP0EuqcfuSRwKW5Eoy5E/Q1qzmbMoNdHiB2OB3aAeOHUO2U8isvDCrsznqiK/QAw==
X-Received: by 2002:a63:fb58:: with SMTP id w24mr19340794pgj.444.1556983665325;
	Sat, 04 May 2019 08:27:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:55 -0700
Message-Id: <ef6aacb0ed543c78172ae5af933eee32ac70e602.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 19/43] resultool/resultutils: Fix module import error
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
X-List-Received-Date: Sat, 04 May 2019 15:27:44 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix AttributeError: module 'urllib' has no attribute 'request' when
using remote http urls.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index aab312d..8d17c7c 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -16,7 +16,7 @@ import os
 import json
 import scriptpath
 import copy
-import urllib
+import urllib.request
 import posixpath
 scriptpath.add_oe_lib_path()
 
-- 
2.7.4


