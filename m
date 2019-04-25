Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DD2837C37F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 10:09:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id h18so9712909wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 03:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0x6kl/3Ii5l9i8DEWMkKj8GevEbw/93iancW9H0KjR4=;
	b=gyptn5AzhBqSBr4gd6YgAZToqUc8dVgxrXcDer9qJfQSc1jfbC7BbNRecbRftM5SiM
	GjOd2gLFAtlNrAubyA7WUnUsZP7MmxsfoZvGtsMVM7ParIOXz8x9QJ8JOReaThDi1Ue7
	dG/nZQRmXxzHCide5tCLBIQJZxtB9vesu5HZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0x6kl/3Ii5l9i8DEWMkKj8GevEbw/93iancW9H0KjR4=;
	b=UUToJeiFk1ukNKsGYEpLpworE6mnwkfo61YQr5HKFwN7U6Op7ZWPBi2wL3371j2kVI
	Ap6na1N7urvXpSBZEzU1nRoucFBhY6IFwjSye27RyZV7GGhoACtHMSNbUx/pkMJtPFwf
	5iDaAu493FY1mweRoach1KvV6n2VNlEKiI1K6mPeLHf2ILJDGsG/wKqyt+rcmEUTrwSN
	isFLX0X0eZXo9MUmV/YjGc4J4O/rnEC02xyMMxPbo1xf/gcvLhlTm1YY3Rd8wkFdLGWT
	16N8IrjT9pm5Pbefv90Jg7vkZzfLmlGRzoYBdag0vJ5nHSCzTiE6EB9GtXXTAfj39kRY
	Dl0Q==
X-Gm-Message-State: APjAAAU+urtBQPoIkvyhZbzdm3w5WMoainI5FnxH6MyxEw6EBWjxQL+G
	YSAiqJoIg0VY9sG+fQ0TzMjJ+tThB/U=
X-Google-Smtp-Source: APXvYqyyxli87RbQeuKJJu8+IWx07LbZocvllhgYsRg45psqDFYhsYe0ogr9/1Lhr8p3B9VW40+A1w==
X-Received: by 2002:a7b:c923:: with SMTP id h3mr2840212wml.34.1556186998135;
	Thu, 25 Apr 2019 03:09:58 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d4sm22220949wrv.42.2019.04.25.03.09.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 03:09:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 11:09:56 +0100
Message-Id: <20190425100956.30713-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] resultool/resultutils: Fix module import error
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
X-List-Received-Date: Thu, 25 Apr 2019 10:09:58 -0000
Content-Transfer-Encoding: 8bit

Fix AttributeError: module 'urllib' has no attribute 'request' when
using remote http urls.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index aab312dd172..8d17c7cd658 100644
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
2.20.1


