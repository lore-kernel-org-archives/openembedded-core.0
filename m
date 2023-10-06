Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCA4E81DFC
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 13:26:09 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.12625.1696598760747641221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 06:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=EchYjWuo;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso20213295e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696598759; x=1697203559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGUfde4Fde3ZMszdS6ImswgfkQv0WRr/bpakYYswZ7E=;
        b=EchYjWuo6SF0oeJRJh2yQAxG0Mh5++9wxYP8xHQKyh3gjhXB7K/Ed3u1Ol9gDReH+W
         kMLv4rTNcvtokS6i/KAjxNt2sb/TuCqn+BVvgph5SgGlhbhyrqTMLlwiz0bhe0g0o0QZ
         AIkhJG5uiDHX/RPWMaqbx30fI1BqhQ2q+NCggfZ5KVfVJG7nrUf/HJ66oc90RJUFJJNE
         ashH+KKjeY9zNMORKCyoIDtAlFWXTXOLZh6GaK5wXx2rKTt3bXva4UjCvwN/c2zrJxrY
         tNiyYwNf9Agg27FAlE6xtwZCRoNxVXDy5fuUJMGO53P9Q5lMWQFPfmACb5u/p7LADLUt
         P0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598759; x=1697203559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGUfde4Fde3ZMszdS6ImswgfkQv0WRr/bpakYYswZ7E=;
        b=wdmZb2H9kx+xq9DQUz/CTefoyHv6oguF1b1is3q1g9jtNtxwxUty3lXsNdR+psRkTn
         kDk1omz3JowGJPUoV97L4XZoOwjb+qCpcHx4lneUl0t9uXqiOV1PQK8mx2MR2jIDmH4Q
         ROS0UhhVFfKdLANCiKipalahdK58sGSpK4UW8o99h+oY7CTm+ca6z4tPyB3dfuHe4C8T
         jgnsEccAZ4ceIkHW2UKMJi/3/ThtKX8NVF0+7lduuXLVyTcHhbwj2NJyFEhXRRgzTxJc
         38OoBxTT06GpYOXj+fII2Zc3NWdmwEG/038HJnUH3wSoe5UaWVruC7B9LwScDJ7MTi/F
         9VCA==
X-Gm-Message-State: AOJu0Yz9OEH0nJZE6/ZBUE6BiEjru6JED3Txqloix9lW8trGzb4rLaCO
	nO0977essjxGT2QG/pTeTTlMU5wzi9gUNye0qdyzrQ==
X-Google-Smtp-Source: AGHT+IFY4HuijDYlMJEziz7McgQK+6KaqicDeHW4bTLxPt+pszCf9jphR/NW7ba5xipzKKM87aMlcw==
X-Received: by 2002:a05:600c:2191:b0:405:36a0:108f with SMTP id e17-20020a05600c219100b0040536a0108fmr7874476wme.41.1696598758822;
        Fri, 06 Oct 2023 06:25:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d54ce000000b0031773a8e5c4sm1678587wrv.37.2023.10.06.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:25:58 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 2/2] oeqa/selftest/devtool: remove spaces on empty line
Date: Fri,  6 Oct 2023 15:25:54 +0200
Message-ID: <20231006132554.2561243-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006132554.2561243-1-jstephan@baylibre.com>
References: <20231006132554.2561243-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 13:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188768

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c36b1efa78b..b5c488be8e8 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -575,7 +575,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['S'] = '${WORKDIR}/MarkupSafe-%s' % testver
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(recipefile, checkvars, [])
-     
+
     def test_devtool_add_fetch_git(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-- 
2.41.0


