Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAFBC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:27:35 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.32781.1635172054420188391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BXunEEQZ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635172052; i=@fujitsu.com;
	bh=TE04I+lV9kauQWmy5WWa15fXMzPm4t+RSPZmbdoJtOQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BXunEEQZ35k9GHhLWWWDg2MSrBhkjOfIYzJTUlNlaLcZDnKNNjQ39rR8KMWVg5ata
	 oKOp7Fj8e3NuqLDGJsVs9gDMRWwKzO3u70FpWThWFLzpSupfmAa+M2sVAhFKeafnYc
	 ockcS6WOvr/MJEgw6Hfp9D6TybXYeZjvBhqBvFZTvTcQEDTUNXsi4Xt4kn2B9HyKzZ
	 b9LHNYdAE+zZ0/sJnHOSUUea3HQhq+MOnL3sAWpKpcexklevR+OoqqY9ZRFIwwWQVm
	 S/nCN5jqg/aUwPxKCce5+Yi4cxZa8hyBeYzulEqLqzzjYpak4UiFGY+x/Q6vvSwi9p
	 V86SMRykmFZFg==
Received: from [100.113.6.252] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 77/4A-14220-4DEB6716;
 Mon, 25 Oct 2021 14:27:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSffKvrJ
  Eg6kNPBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0b7poiCj2wVC0/XNjDOZ+ti5OIQEnjMKDH9
  YBsjhHOeSaKt9Q4rhHOCUWLjpdvsXYycHGwCahLTb90ASnBwiAjoSVz9JwoSZhZQkXjxuwesR
  FjAVOL8sguMIDaLgKrEqcXLwOK8Ak4Se678YAGxJQQUJKY8fM8MYnMKOEv8uvAQLC4EVHPt9h
  5GiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNUHMqJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrRMKspMzyjJTczM0TU0MNA1NDTWNdU1MrbQS6zSTdJLLdVNTs0rKUoEyuollhfrFVfmJuek
  6OWllmxiBIZvSiHrux2Mz15/0DvEKMnBpCTKe2Z+WaIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d5te4FygkWp6akVaZk5wFiCSUtw8CiJ8J7aA5TmLS5IzC3OTIdInWJUlBLn9QBGoJAASCKjNA
  +uDRa/lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80qDTOHJzCuBm/4KaDET0GI/3RKQxSW
  JCCmpBqawlzOXPW2b0eygG2YsvkXdo2iNoEvK11NfuUWSWJcnetXKK65znL7p7+PmZ2KhQZpl
  l7MCVda6ZX78nSlb6iby7LzqH0XNj3P5phqbKRzer/54Qob/iZm2ncGTD3R4vXrrd65fMqD83
  0OL80EPN3YILp/Fx6vqc4RTlHn1KrlfRhzXuiSjf4Yc4nk0Sbt+7vXl3t9e7t69nd+ufibfZy
  Gnf/YZPNG/N83W69xX9dT9Xri87dZfu998mrZjqniXzvUyx/0vQvbusdmR/fOs8TrJZYwL3M7
  7SSk5vLvRd5Flm9nN7LneZzlSjxdfaOHcVXV+/87C8hMrWP8LO94IN3x+ds+PPXufvrq7NPJx
  X88RJZbijERDLeai4kQAsP3hsVoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-248.messagelabs.com!1635172051!440063!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32637 invoked from network); 25 Oct 2021 14:27:32 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Oct 2021 14:27:32 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A32C3100467
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 92F8E100452
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:27:31 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 25 Oct 2021 15:27:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] file: upgrade 5.40 -> 5.41
Date: Mon, 25 Oct 2021 22:26:54 +0800
Message-ID: <1635172017-18309-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
References: <1635172017-18309-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:27:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157342

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/file/{file_5.40.bb => file_5.41.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.40.bb => file_5.41.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.40.bb b/meta/recipes-devtools/file/file_5.41.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.40.bb
rename to meta/recipes-devtools/file/file_5.41.bb
index 32b61f4f39..9cc83085d0 100644
--- a/meta/recipes-devtools/file/file_5.40.bb
+++ b/meta/recipes-devtools/file/file_5.41.bb
@@ -13,7 +13,7 @@ DEPENDS:class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git"
 
-SRCREV = "f49fda6f52a9477d817dbd9c06afab02daf025f8"
+SRCREV = "504206e53a89fd6eed71aeaf878aa3512418eab1"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.25.1


