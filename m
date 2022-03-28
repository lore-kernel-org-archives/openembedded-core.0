Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E20C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:53:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.9083.1648461212269509867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=c+IzAyTU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461210; i=@fujitsu.com;
	bh=cZG+oyzihUr58vtBzuCTEJm7FQl6RxTYUWC41IkRjKE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=c+IzAyTUp8asmBb2RmSLHnYfZ6VqmReJtu6F4wVthf56A1fcSmcgSIDlmjZ52NV53
	 p6O/3pwqOxaH9nf1xb1enFoMyVR0iljFkQHCnrJeSyVZeI7v2YLh5l9ODofZJHrY+g
	 DYa4iO9cIeQQCRzRKy81zAnkebCVTSRVbdr6L3OmYPrkvXQr6J7CqVaQJGqZrONnK1
	 uD03r3SjntDC/XAoI+IeSML70IWQWIiEaMzV7NJr6ytevBnhbDLN4gynY8h4TuOket
	 mBENDnxtMCiolKTe1TX43qKiCYnsknMzZlYq1a/UUiHgXVUvEXvbLBits0cu4JpZiM
	 xBTLUOcdUse+A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSXdWq2O
  SQeMCIYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP61jtMBb2cFZem32dsYFzP0cXIxSEk8JhR
  4vyzbqYuRk4g5zyTxJHVBRCJPYwSr5d/YwRJsAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgJPEg3cnWUFsFgFViYd7trOA2LxA8aYlJ5hBbAkBBYkpD9+D2ZwCzhKHP52C2uskMf
  v6NSaIekGJkzOfsEDMl5A4+OIFVK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGprpmukaGBnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIEhnFLMdmkH49y+n3qHGCU5mJREeY0yHZOE+JLyUyozEosz4otKc1KLDzHKc
  HAoSfDeagbKCRalpqdWpGXmAOMJJi3BwaMkwmvaBJTmLS5IzC3OTIdInWJUlBLnDW4BSgiAJD
  JK8+DaYDF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrwvIFJ7MvBK46a+AFjMBLV77zhZ
  kcUkiQkqqgWmLYEn01TMr+b6yNRi9jM6/sPXt/oNRi04ldmySsV74lElCWE9u0YX7Xs2zbvjX
  JLlOZTp2SC1DIPx0j85h0UfLVdiulDn/UmEs7Lt9S+HBe8fanQobPXTZ4/Q6/liJHkpfucg68
  bbg6zOzdKO/740IWLy87iVH7Tzf6rzbc1LuWTd9yL3ZVtt3gbmwUapddFXrakfOeIkzf1hMF5
  XoKzlsXFfJylcpb+SmHS10srZtZrKJzuufG+6GuBlZ7Lzu1MhxMzDw/YYrLitdbl6xNd0Y+p9
  db+6HiKj86FyxmhT3oojJZmrnJffExmpyPXm8fv9bj0crWdK9ax2YtS7M0RTw0fd4Pe/2iaCb
  KkXTlViKMxINtZiLihMBUXk0SVwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1648461210!165309!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4287 invoked from network); 28 Mar 2022 09:53:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:53:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C1BCB100456
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:53:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B27F4100440
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:53:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:53:14 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lttng-modules: upgrade 2.13.2 -> 2.13.3
Date: Mon, 28 Mar 2022 17:52:53 +0800
Message-ID: <1648461173-15770-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648461173-15770-1-git-send-email-wangmy@fujitsu.com>
References: <1648461173-15770-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:53:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163699

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-modules_2.13.2.bb => lttng-modules_2.13.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.2.bb => lttng-modules_2.13.3.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
index 86e0931af2..b6f8ac1315 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2"
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "dfd547d9041c8c545ae5b7bfef3f0ef2d9f2520d6ab44188c9ea8de56d5d298a"
+SRC_URI[sha256sum] = "7cf1acbb50b84116acc9b4281b81dcc2643d6018bbd1e8514ad1270239896c4b"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


