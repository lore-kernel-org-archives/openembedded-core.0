Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCFCC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:01:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.61991.1638198087772968256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mnaNfOrz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198085; i=@fujitsu.com;
	bh=bt5HUICo+8IsBa6HFnW2oo/mMCneQkfXocjo4kUiZyU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mnaNfOrzx7zDqHXjicwDKc3JSm0ntoK3zcjgYHWgxReAAzZMKdpLvEHp2x5up8Q3R
	 /U3LJf+HVGTzpdFyxmROvSVTn/IHi3F8Uv7dwtkqJ5NztrWMyBGBophuwfBI2YL50T
	 zwliKgBaON0Wd3COB8kZn8PQmVNtID/0LyKUlYk0mp8Lf2wlmcQnHobdUOr4Wbagii
	 MHRBgXl7ABMTR7yNltpfgRXz3vnmq0dunzmJ4virF7SP6JrqhIY+XepM55p5wxvMOX
	 3uMM0kQ2wrCZiC/zvRPI57kHqm6iRv7y8QBwo2yMkyh7iRSQXZZ3oUHkKPYgkvI+op
	 jPg+02bt0wu3g==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 43/F2-12056-54BE4A16;
 Mon, 29 Nov 2021 15:01:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqOv6ekm
  iwbReOYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeNL80GmgjPCFfe63jM2ML4T6GLk4hASeMwo
  cX55MzuEc55J4vyXX0wQzglGiT0nfwA5nBxsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgLXG47x0LiM0ioCrR0dQHFucVcJa49vQKmC0hoCAx5eF7ZhCbU8BFYsK1m8wgI4WAak
  68FIUoF5Q4OfMJC8R4CYmDL14wQ7QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKprqmtkaqqXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYwinFrP93MHb3/dQ7xCjJwaQkypu1ZEmiEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQne/ldAOcGi1PTUirTMHGA8waQlOHiURHiLXwCleYsLEnOLM9MhUqcYFaXEeUVB+gRAEh
  mleXBtsBi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYVwVkCk9mXgnc9FdAi5mAFr9duhh
  kcUkiQkqqgWnOE6+3rqKvw7vvK97w/vxk1Q6PMI7DlkrTRXmX3+V5uPdVqcq71QsMuaVDFpT2
  LZlwI+xCy1kp/4NlCmUr18eY3v5TslNoletqo04RVYF67xK9Jzu73u3YEtqh/Fsh/enc7gDXU
  1ccGjdb3LX/rq7EXJPwalKB/my3hREbWb6p8M04KSP17sD26/HVhtOKvG/kShSvlFglGvdx5p
  3/K1NWuX8oOqj+ilX3leoRjyMnNxjv4W5baLR86f9sOYUsxY3fdfjz5jHvsk/6zLuiaNon0YT
  yfx5ij3+cTs1kNt3/3Xme0dHuLSXlK9rmX5Ce9HPHe5EV9wQt3DZMb3Dp7dVSnCE8V+r81DmN
  F9bp621QYinOSDTUYi4qTgQAJCB+IFwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1638198085!20808!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18564 invoked from network); 29 Nov 2021 15:01:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:01:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F18571009E9
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:01:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E6C2110023D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:01:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:01:09 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] patchelf: upgrade 0.13 -> 0.14.1
Date: Mon, 29 Nov 2021 23:00:54 +0800
Message-ID: <1638198055-118993-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638198055-118993-1-git-send-email-wangmy@fujitsu.com>
References: <1638198055-118993-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:01:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158947

refresh handle-read-only-files.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../patchelf/handle-read-only-files.patch         | 15 +++++++++------
 .../{patchelf_0.13.bb => patchelf_0.14.1.bb}      |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/patchelf/{patchelf_0.13.bb => patchelf_0.14.1.bb} (91%)

diff --git a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
index 63080a42d4..8d9a50a697 100644
--- a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
@@ -15,10 +15,10 @@ Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
  1 file changed, 15 insertions(+), 1 deletion(-)
 
 diff --git a/src/patchelf.cc b/src/patchelf.cc
-index fd1e7b7..a941da1 100644
+index 1aeae88..6b77afe 100644
 --- a/src/patchelf.cc
 +++ b/src/patchelf.cc
-@@ -527,9 +527,19 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
+@@ -534,9 +534,19 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
  
  static void writeFile(const std::string & fileName, const FileContents & contents)
  {
@@ -39,10 +39,10 @@ index fd1e7b7..a941da1 100644
      if (fd == -1)
          error("open");
  
-@@ -543,6 +553,10 @@ static void writeFile(const std::string & fileName, const FileContents & content
- 
-     if (close(fd) != 0)
-         error("close");
+@@ -564,6 +574,10 @@ static void writeFile(const std::string & fileName, const FileContents & content
+     if (errno == EINTR)
+         return;
+     error("close");
 +
 +    if (chmod(fileName.c_str(), st.st_mode) != 0)
 +        error("chmod");
@@ -50,3 +50,6 @@ index fd1e7b7..a941da1 100644
  }
  
  
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.13.bb b/meta/recipes-devtools/patchelf/patchelf_0.14.1.bb
similarity index 91%
rename from meta/recipes-devtools/patchelf/patchelf_0.13.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.14.1.bb
index b24c74a149..2b63fbfbc3 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.13.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.14.1.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            "
-SRCREV = "a949ff23315bbb5863627c4655fe216ecbf341a2"
+SRCREV = "8f7b4a7a3648970fe55824cfee2afd3808626a3f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


