Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 85739799A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:26 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id j10so443159pga.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5KyMlv1liByjlX+W322VuqkeLTddKwhhDxZ/R/c3/Xw=;
	b=kBakq8g3Yb4hJpQuZCZEaA5bw6bYvjWAhuierwP5E+mf9Qhs1MLFwQqDyimN9JG9xr
	LRvhAEeE2m4/JJ4utWjrKIlDOJWpJeWC29w55bNhhJEuZuCt9xFSly1PAsCo5kunta6h
	eNWbZblPjUa9hpCx022+nzzywCydw2wDj8If6kLkrOdrQZaOLs3b7PqkQhk8JsTSOvRV
	5ClBWKHiuAr9ROjyZh+HJ8zwD/2Tm8cdKyD8njpWhUnbbp5nJTp/oeJSYRY0RnSTEwQ6
	Qmuag8we0eII1Jgr23ZGp5BhrXD8nmQqE4tXqfMRd9Jzzqdcn4WNJxm2aX1je9aHZZvd
	A97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5KyMlv1liByjlX+W322VuqkeLTddKwhhDxZ/R/c3/Xw=;
	b=ueyqYCILr1rZOJhhFRgbWeg0TX7cXibAdzX4OLVXIf3pIo5JMl+ZhCSjem/AsjnVH9
	udim5EwEN+xIojXk9WjlxqXyurtsDeld/+rutJBv+7fIbjuicDwSIzcDd1lMpg2hpawK
	hIns4p2odEy/UbOHAJKKQfJXjt6WMmy/d3WIiffJUJ/5pR/qQHleGtLGQXMP7lWbWfSQ
	/o/s667tnjG9SYHHWAuWY8veio2/i+8apXK19brXqw68hB9wCwmLYUW8RIx1IuURMmrR
	wU3YKzptYHAJusYvjwp2BfiKxPOX+ltWch4Xo2LQSH7WfvjMj48+HKoD8VAvFhEk1IMf
	wmyg==
X-Gm-Message-State: AA+aEWbBtFwkzOO3sxBOH89IHdyOJ7Wk9ajo3brot63vIzFchR87VR9n
	B3Imo7G02s4wh6X4ksoXgUi3ziTB
X-Google-Smtp-Source: AFSGD/XW0Ch9E1ayuV0Zu9TnlzueFzRjy8Czdi/t4M6TR2LvU7GXLQuTk+gV+UEfe6g+JOJC9IKDow==
X-Received: by 2002:a65:514c:: with SMTP id g12mr392428pgq.169.1544737167309; 
	Thu, 13 Dec 2018 13:39:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:30 -0800
Message-Id: <fd6199ec457bbb163826945e102631c4bd26619e.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 22/45] oeqa/selftest/context: Replace deprecated imp module usage
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid the warning:

meta/lib/oeqa/selftest/context.py:8: DeprecationWarning: the imp module is deprecated in favour of importlib; see the module's documentation for alternative uses
  import imp

In this case importlib is a direct replacement.

(From OE-Core rev: db7a60c36a2d3eefc61ae6e1ede01680dc932035)

(From OE-Core rev: 351a7b75959593922909d7e1929a6429a2bf94a7)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 9e90d3c..cac049f 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -5,7 +5,7 @@ import os
 import time
 import glob
 import sys
-import imp
+import importlib
 import signal
 from shutil import copyfile
 from random import choice
@@ -174,7 +174,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                     self.tc.logger.info("\t%s" % l)
 
                 sys.path.extend(layer_libdirs)
-                imp.reload(oeqa.selftest)
+                importlib.reload(oeqa.selftest)
 
         _check_required_env_variables(["BUILDDIR"])
         _check_presence_meta_selftest()
-- 
2.7.4


