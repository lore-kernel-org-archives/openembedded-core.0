Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 737CD6C152
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 11:50:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j10so6678629wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 03:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=rMi7GrMMgDSrozgnmpum3XO9YjLOW4GnQykvbb2UItg=;
	b=Si8ZbPWIALiDjjCciJRxfhM0SZgxqevVRY21SlmVSNJT6FpEx3gqQCCFlWTLIZgHTL
	6Y/f3OJ2s2utoZZ/8f11Ei1J/idPjl6YU4WoBCIHdQOZ5zMcDfdF19SIiJp84RcRDvMj
	z5RtaQAEQLH1M/jEN4+ASh2uu/6ufUHK4weqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rMi7GrMMgDSrozgnmpum3XO9YjLOW4GnQykvbb2UItg=;
	b=Feyno8TjqAQCYBPW2/7yxc62vLudEOMwFCh+46Zu+pZ5FGgHQisiq9rdKgqaGGQrXT
	PeLwI4pj1iV7NyoXMV97RyQlaFw1bb5Wy3r1Ae1AJ3zANEoxpjpJcrrlWco/pnxraPnA
	MQPCGAfGpnjE7F86ATyCUr32D/C0f4MSOBvBqSYNeNyCFKyQSSVf+gj4K5zCj49w5/yU
	JtXwjbI8fIy3fA7Py05cRovr2wlbZyiws04+Qm6MDpo7DmRrAKP+IlJMQXwURTfmhoV+
	s0lyTEMpYeKYVII/ZH9lhhayLaMnnf/c19JqPYePRQWkUtjfFvt+wSTHh85QKsAczXvg
	TphQ==
X-Gm-Message-State: AGRZ1gKmyb+5dmf8DUWMLmQbFSAWeAYI2//0anCRKKKqWIJzsTYEH6Hl
	aOY4Q7OS4a0LchAsQ49yGNxLNr98m8A=
X-Google-Smtp-Source: AJdET5fMKGQJDn+5latMZLQe1bBcT0GWNCyuEI1+4Rwon5lhzqjVyI7TACKvTLe4K/jIxn9Pq0aw8w==
X-Received: by 2002:a5d:67d1:: with SMTP id
	n17-v6mr5728929wrw.245.1542282659280; 
	Thu, 15 Nov 2018 03:50:59 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j125-v6sm17622731wmb.12.2018.11.15.03.50.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 03:50:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 11:50:55 +0000
Message-Id: <20181115115057.12871-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] oeqa/selftest/context: Replace deprecated imp module usage
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
X-List-Received-Date: Thu, 15 Nov 2018 11:50:59 -0000

Avoid the warning:

meta/lib/oeqa/selftest/context.py:8: DeprecationWarning: the imp module is deprecated in favour of importlib; see the module's documentation for alternative uses
  import imp

In this case importlib is a direct replacement.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 302ff73bede..4509e0f63d4 100644
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
@@ -178,7 +178,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                     self.tc.logger.info("\t%s" % l)
 
                 sys.path.extend(layer_libdirs)
-                imp.reload(oeqa.selftest)
+                importlib.reload(oeqa.selftest)
 
         _check_required_env_variables(["BUILDDIR"])
         _check_presence_meta_selftest()
-- 
2.17.1


