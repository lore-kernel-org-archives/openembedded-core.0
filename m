Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EB1C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 01:47:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.1543.1639100872127251852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 17:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CEV81P+4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639100870; i=@fujitsu.com;
	bh=THo3ah+J0oa88uxKtCTFx997QjyQRLZGC57YY2gvINk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CEV81P+4NGemfgmO50q5FiDlu4Zq2avq0aQJF6JQMrGKpcHSL3+H+rGo3AUcpHnfP
	 4LCNoPsw6athR/rKRSuN55OFRrRiwH4esBKAGyA8eWn7oJ3ie4hJ46L6AKTIeeTk/I
	 4TK/pM7uqky3W0HWEhbnTdmYDYlTGD2GCbwAxFyBz8B8xcHGfsAguQn9XzlopRl9ZX
	 yCsYCpbwD/tCrZkfziHDENXtwajHHXdtVqLRA+7KAK0SXx51tgR+AsgI6szUCeGzg2
	 tV4rUEVRlWg2kQtTXiFi72uNN5Co8xwq4zOhPBs/K1TMGthaMMFy2LAbqirEasZ3PQ
	 qX57fxYaVTAyQ==
Received: from [100.115.34.229] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 57/00-09428-5C1B2B16;
 Fri, 10 Dec 2021 01:47:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxRffoxk2
  JBrc6VC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ox3R+eyFNyVrLjy+iFTA2ODeBcjJ4eQwAwm
  iff7xboYuYDsE4wSB543sIEk2ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52EFtYwE5i1
  d63rCA2i4CqRNfdH4wgNq+Ak8SS1idgNRICChJTHr5nhogLSpyc+YQFYo6ExMEXL5ghahQlZl
  9uZoGwKyRmzWpjmsDIOwtJyywkLQsYmVYxWicVZaZnlOQmZuboGhoY6Boamuoam+kamhnpJVb
  pJuqlluqWpxaX6AK55cV6qcXFesWVuck5KXp5qSWbGIEhllKssmgHY8vlb3qHGCU5mJREeTdW
  bUoU4kvKT6nMSCzOiC8qzUktPsQow8GhJMHrDQxaIcGi1PTUirTMHGC4w6QlOHiURHifbgBK8
  xYXJOYWZ6ZDpE4x6nK8bvm5g1mIJS8/L1VKnDcNpEgApCijNA9uBCz2LjHKSgnzMjIwMAjxFK
  QW5WaWoMq/YhTnYFQS5i0FmcKTmVcCt+kV0BFMQEc4t6wHOaIkESEl1cCUoTX//mWxRTWRsnv
  fPjh7u9Wd3/+r333lmoPXdtxzvnXs11KeHZ5VN8S5k4wuFG5uejzz1fJzy9njyk4/iK1asMJj
  RfbTkOXztryqkNqxP3G3btlZPQ7Ou1dmbwpU0lhbULjqy6kV61w/C7C375j5apIWx5TTJyaLb
  gtYf/Hszlwmj++Gwql7f/zWvHt9gtjn8MLusx0um7/cqY4oXafX9zvmdWpnkNkXx3PfC8vmz9
  kbH6e6pOKmed4j77UCRWVHlyoHPtn2SfxS0Lyuhm9+E0MNf13tPqjc6+LT5vQivtipPynAefW
  TbRr71c3qu/Yu+7B85ozzt3zLPxrt/mXSNdvj6u1jYfZ1k+fFT9YLl1NiKc5INNRiLipOBACQ
  LxKVOAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1639100869!49212!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11944 invoked from network); 10 Dec 2021 01:47:49 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Dec 2021 01:47:49 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BA1lYm8015155
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 01:47:49 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 10 Dec 2021 01:47:32 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] pango: upgrade 1.48.10 -> 1.50.0
Date: Fri, 10 Dec 2021 09:47:23 +0800
Message-ID: <1639100843-17956-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 01:47:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159488

Add patch 0001-Fix-bug-for-x86_64_x32.patch
to fix compile bug when building 32bit on x86_64 environment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pango/0001-Fix-bug-for-x86_64_x32.patch   | 55 +++++++++++++++++++
 .../{pango_1.48.10.bb => pango_1.50.0.bb}     |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch
 rename meta/recipes-graphics/pango/{pango_1.48.10.bb => pango_1.50.0.bb} (91%)

diff --git a/meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch b/meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch
new file mode 100644
index 0000000000..9ab55879a4
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/0001-Fix-bug-for-x86_64_x32.patch
@@ -0,0 +1,55 @@
+From 8e97429dfb9a2931c79658869da25b44014f8eba Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 9 Dec 2021 00:13:20 +0900
+Subject: [PATCH] Fix bug for x86_64_x32
+
+When built 32-bit Pango on x86_64 environment, the following problems occured:
+
+error: size of array '_GStaticAssertCompileTimeAssertion_4' is negative
+|   826 | #define G_STATIC_ASSERT(expr) typedef char G_PASTE (_GStaticAssertCompileTimeAssertion_, __COUNTER__)[(expr) ? 1 : -1] G_GNUC_UNUSED
+
+This problem can be solved by removing the judgement of arch.
+
+Upstream-Status: Inappropriate [https://gitlab.gnome.org/GNOME/pango/-/issues/637]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ pango/pango-item-private.h | 15 ---------------
+ 1 file changed, 15 deletions(-)
+
+diff --git a/pango/pango-item-private.h b/pango/pango-item-private.h
+index d37fc3f..d49f2a6 100644
+--- a/pango/pango-item-private.h
++++ b/pango/pango-item-private.h
+@@ -40,19 +40,6 @@ G_BEGIN_DECLS
+ 
+ typedef struct _PangoItemPrivate PangoItemPrivate;
+ 
+-#ifdef __x86_64__
+-
+-struct _PangoItemPrivate
+-{
+-  int offset;
+-  int length;
+-  int num_chars;
+-  int char_offset;
+-  PangoAnalysis analysis;
+-};
+-
+-#else
+-
+ struct _PangoItemPrivate
+ {
+   int offset;
+@@ -62,8 +49,6 @@ struct _PangoItemPrivate
+   int char_offset;
+ };
+ 
+-#endif
+-
+ G_STATIC_ASSERT (offsetof (PangoItem, offset) == offsetof (PangoItemPrivate, offset));
+ G_STATIC_ASSERT (offsetof (PangoItem, length) == offsetof (PangoItemPrivate, length));
+ G_STATIC_ASSERT (offsetof (PangoItem, num_chars) == offsetof (PangoItemPrivate, num_chars));
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/pango/pango_1.48.10.bb b/meta/recipes-graphics/pango/pango_1.50.0.bb
similarity index 91%
rename from meta/recipes-graphics/pango/pango_1.48.10.bb
rename to meta/recipes-graphics/pango/pango_1.50.0.bb
index 40df7042e6..974e053b8f 100644
--- a/meta/recipes-graphics/pango/pango_1.48.10.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.0.bb
@@ -20,7 +20,9 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "21e1f5798bcdfda75eabc4280514b0896ab56f656d4e7e66030b9a2535ecdc98"
+SRC_URI:append:x86-x32 = " file://0001-Fix-bug-for-x86_64_x32.patch"
+
+SRC_URI[archive.sha256sum] = "dba8b62ddf86e10f73f93c3d2256b73238b2bcaf87037ca229b40bdc040eb3f3"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.25.1


