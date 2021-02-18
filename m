Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web10.1204.1613682863953786364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 13:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=DcAP1OYO;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 185CF98B;
	Thu, 18 Feb 2021 16:14:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 18 Feb 2021 16:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=uh2Mqj0O4yMIM9L2wsfYl9QqRR
	DSBB5Nl5ycUl9DjLQ=; b=DcAP1OYOWL9I8qZT60WienF7JyqxWtu12NLa02aipK
	ZxyL4pq+ANkohBCFeMX3bViZ4dRR97yvi/qrQCRph0yKtUqcOzC0/uuOXnC58FTg
	u4msqMd92i3JfbNY5yqpqPQdhzrGIrlgr0g+tt9mA8Ur05Shc8eVf4k4KPqPQ0B8
	VRxjPlRXdhttYIIyqHpMKB3xi5Lna8YuEcRpaRGLgvgFBnqJwEb5XSRMsjRqwjDy
	4U99b7KEyZntKb4cG4N+W1cShg0STIG5oPTYyhufR6s4EssTzSBpxBFHUPFGG1hH
	pG8OLjvnHf4G92UeyIP/v2mLI+LU+9qHVsg8dWmXYxsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uh2Mqj0O4yMIM9L2w
	sfYl9QqRRDSBB5Nl5ycUl9DjLQ=; b=RG7h3bB/g31Efc+pNRYDqyQn+dmnScWTZ
	T1mxCJTYDGvXk8rxQeZzN7FZjljrcXLrhlmZUkLF4vh86vDQE3HwiCHuAx7oe5rJ
	YtHAyHN3B5ORqebs548LSe1EKOyQLeV79yJlvvQvjN/K6eSZG0UO+pdSX32Niy9L
	8fXtUDBCsK8uOrTnpnzx4YzT7k6gAXZ0Ui0YCA3nTGkhHGRFfXJh1vA+2h+zvNC9
	06o0yDd4fVeTzrU6duNrmddBHn8Q9u7yIsKOtR69KAdUPO852wPvaJAuLcrPzn0m
	UxRg2OrXQ7OFY2v8MlwQO9Yq2GkkfDV082SeC+S1K+C+YpBbZL/6w==
X-ME-Sender: <xms:rtguYJCRzEcBkATjqNTdv9paTqVC8bqG2nAA_6LOQqWryawJVB2M8g>
    <xme:rtguYKxiH6I08oDmfBmOnvELbjodiCdDrBFFv0LRUyh0LJI29600mKJx-ZpK4xO4R
    VEt832u0nuEzFjvmMU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeggddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgvihcu
    ifhhvghriigrnhcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecuggftrfgrth
    htvghrnhepvdetuedtuedthfevgffgieefheevtefhueffkeegieeigfekhfehheejieej
    jedunecukfhppeekiedrudeftddrudegiedruddvvdenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtgho
    mh
X-ME-Proxy: <xmx:rtguYOAOXkHQtS5zjOQWGwxqpUeEMzEcAXcM0aUBmrCWaMBhsWMwyQ>
    <xmx:rtguYPYQS7crSKv6GZfOb5QdbSxQFtRl_VdicAETiqMHt6_OcbLgTQ>
    <xmx:rtguYOi9jH0TuDwIdPGSR3V08r__lFynmVFQZi3ZJkWganfX57eOhQ>
    <xmx:rtguYMKd9fbutmWNOe9-sy5tYTIz3q2Lj3optxi2TYVAi_IjK2JUjQ>
Received: from qwirkle.internal (host86-130-146-122.range86-130.btcentralplus.com [86.130.146.122])
	by mail.messagingengine.com (Postfix) with ESMTPA id DAC3724005A;
	Thu, 18 Feb 2021 16:14:20 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrei Gherzan <andrei.gherzan@huawei.com>,
	Robert Drab <robert.drab@huawei.com>
Subject: [PATCH] oe/recipeutils: Fix copying patches when BBLAYERS entries are not normalised
Date: Thu, 18 Feb 2021 21:14:03 +0000
Message-Id: <20210218211403.893633-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

`devtool` uses `copy_recipe_files` for the upgrade operation when
creating the new, workspace recipe. Before handling the copy operations,
the function checks the entry in `SRC_URI` against `FILE` while in turn
uses absolute paths. When BBLAYERS contains entries that are not
normalised, this check will fail resulting in having the recipe in the
workspace without the initial patches.

Signef-off-by: Robert Drab <robert.drab@huawei.com>
Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index ef69ef207f..407d168894 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -409,7 +409,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=F
                 fetch.download()
             for pth in fetch.localpaths():
                 if pth not in localpaths:
-                    localpaths.append(pth)
+                    localpaths.append(os.path.abspath(pth))
             uri_values.append(srcuri)
 
     fetch_urls(d)
-- 
2.30.1

