Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29C8C41513
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 09:03:59 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.16973.1717491826492661964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 02:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ai6mZGAj;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-578517c7ae9so862445a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717491825; x=1718096625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOy09+aZez1XJ5CGH9LAEz5qo80QU94Q22O+aFgKJDA=;
        b=Ai6mZGAjyfpBvM0VIwGVUJVesaLFX84qzAySxNsj3w3CqLMlhsBEJeArSVeNFg2PN+
         aw0HECObn9n9ZyKGIns4WdOtr8USz9myfu+h8+X1mOBy54wJTGFGHGyqfQLMe+vKfXFV
         WwqkL/+XaM7xjUqlZ0fOpjhNg1W/dYOksx+Vrmubuh0B1QGpOeFoIhD+QEYBhCKH1bPH
         d/bs6KJw8R9m1Lg7tbcj7X+7BDA5T7PQ/E0Klefu+bpPcK6dLkivA17MujKMxAPwj2gK
         yx298KMVsPpE77sYvtoPPhY7w6qR9xjT5gtm+xT2fzvWyhXNC6tW+xdx03mDsviT2kW5
         SCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717491825; x=1718096625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOy09+aZez1XJ5CGH9LAEz5qo80QU94Q22O+aFgKJDA=;
        b=FUObUws6dgtlgQE6eRq0PRFaqEuEBerzCVB0LKsWyfF9bIAjq/sApe8ONCExI7t2OF
         d6ZoZ2O/7+J+3y34wcOzcwXFKDsawdYFxOoq5Mx8CwqVdm6YZ4Tc69ryqUra4RtEf35K
         bmegDB0EAdqIehbvsag77FuX30mh+gdRdQFwsinZ7bTvOxTLUVFGiIaq8+qlra1XRh9F
         fhHCigXC34qZniPjBPhiVbyFpKflzPIiuT7KaQ5hoWazEMGdWU3/7ahUz48oOrqIby1g
         u9c4iMz7IvODE6fudCgE/DIF2+HsKDwzwkQELyxNRHrOt3Eo2ahuh+w9JcdAuI3lDm4X
         n01g==
X-Gm-Message-State: AOJu0YxY/viWuBfBGy6K0nmuiV9jmQN75S5yTATgWuxjbHy6ja2bqBhq
	Y4N8ybiwbep+zA8iroEqp0tS+P9P5tW+JFhmdTt1vmh3+n/J/aFEsgbtTw==
X-Google-Smtp-Source: AGHT+IFv8Bk8dsQaVPeXuW4tYeblFxnO+HBqi/HSAxLaN5+wMUs8m3bzf/jeP1U29oQ2PlYaSliQBg==
X-Received: by 2002:a50:8a9d:0:b0:57a:2742:de36 with SMTP id 4fb4d7f45d1cf-57a36563e86mr7197482a12.35.1717491824341;
        Tue, 04 Jun 2024 02:03:44 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a61b4e36dsm3298048a12.75.2024.06.04.02.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:03:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv4][PATCH 1/4] selftest: gitrepotest: add Upstream-Status to 0001-testpatch.patch
Date: Tue,  4 Jun 2024 11:03:38 +0200
Message-ID: <20240604090341.45444-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 09:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200316

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
index bccda17ee9..c3f99455ca 100644
--- a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [this is useless patch only for selftest]
+
 diff --git a/Makefile.am b/Makefile.am
 index 432a9b4..bbf7c74 100644
 --- a/Makefile.am
-- 
2.45.2


