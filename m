Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F8CC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:58:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.40599.1681117126297868527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BxqOk9td;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117124; i=@fujitsu.com;
	bh=ea/sPd3MtiwSuRe3bDgKGcf/YPav7zzqH/rv6GCz7+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BxqOk9tdxgfOeeGcuL5yYYSLQNlCRYILT7xj84wm+QsxmbIbBsKMGUm+1sjeFtFCo
	 lXNlXdcbMQT/Yz2Y3HqaWm2X1V6gv7XIdeJtg3dSGolVeg9a/vI7hspFlogF2FcOC8
	 UjDEZFzU67IxuGvIfqGifiZFKyPHzHyMYdCcV9snPMmna+9v5q9CF9z9Cer/7QSECV
	 eA7g+PVrfJab4LRirGUIFqzubSpUycGsveJsw7I6cwBmoYvWSERt8NAaBpBRGG8EJJ
	 fbx0YtIbik9SHzsR2BcdJQGdLDhJXGvJx5CAZwipysDK+2LWamwrw6YR9pC3N5Quzp
	 EU5xsVRbz31Pw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWffIeeM
  Ug6kHxSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ownE04yFhzlrFjwk6WBcQdHFyMXh5DAA0aJ
  A2v3sUE4l5kkDu7sY4Rw9jBKzN/xEsjh5GATkJK4cf8/UBUHh4iAnsTVf6IgYWYBFYkXv3vYQ
  WxhAUuJU82PWEFsFgFVib9drcwgNq+Ak8TV68/BxkgIKEhMefgeLM4p4CxxqW8VC4gtBFQza+
  IcJoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbqGpnpJRZnpGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgaGbUqw4YQfjxb6/eocYJTmYlER5u7iMU4T4kvJTKjMSizPii0pzUosPMcpwcChJ8
  BqcBcoJFqWmp1akZeYA4wgmLcHBoyTCmwWMJSHe4oLE3OLMdIjUKUZdjg+HruxlFmLJy89LlR
  Ln5QApEgApyijNgxsBi+lLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5tx0GmsKTmVcCt+k
  V0BFMQEdwuRiAHFGSiJCSamC6dOrsJ91+Q6sDHFw+OwOWVez+UPSVsePUpi6hI2UcMz9sMEld
  5HtwovLGx/8Z2hK33xK02fzqmcka9WSj/dOO3NH18PKcsyZw3wvRi4nux+W+eVlzvHY+ppgt1
  rmzbMNZngNxCm2HZ0kJBz38K3IxN6jx6d37k3L7VLfLc8gwyXxYeXDdxF0fZxrfmJ7zsO0/97
  d1i00cxdhfHHBcI1uu4nhp9q9var9e9/EsPB/++9ZiLb5VpW9XLT4UqyTxWqd7b5tF91pj9jd
  +qeznhKOtnZ/X2Tis+8mTq3jLf92arS5qc8q67+hF1T+PvbAgvWvFHP4HaRGcy+tfe66S+59w
  +EefhfLaPIuwKTM98uMUlViKMxINtZiLihMBUp1ZhGQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1681117124!290908!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22065 invoked from network); 10 Apr 2023 08:58:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:58:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 16884159
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:44 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0A315155
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:58:42 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 23.0.0 -> 23.0.2
Date: Mon, 10 Apr 2023 16:58:20 +0800
Message-ID: <1681117100-24726-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
References: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179852

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_23.0.0.bb => mesa_23.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8f72f25c17..babd10a855 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,7 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[sha256sum] = "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"
+SRC_URI[sha256sum] = "1b7d3399fc6f16f030361f925d33ebc7600cbf98094582f54775b6a1180529e7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.0.0.bb b/meta/recipes-graphics/mesa/mesa_23.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_23.0.2.bb
-- 
2.34.1


