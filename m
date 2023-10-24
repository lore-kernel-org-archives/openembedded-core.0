Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4068C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 14:18:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.19258.1698157084214091307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 07:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mHZ2zSaK;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso33675575e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 07:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698157082; x=1698761882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGUfde4Fde3ZMszdS6ImswgfkQv0WRr/bpakYYswZ7E=;
        b=mHZ2zSaK8hOWjOVqm2elIcR+Oo3WuDZttKdhDJXr8D3T4vDevul2yGyyf/a60OE63p
         xVoTwF3M2O+of5nkk6PnX16f8Gphm9hLG8+Ffq/bdSKzcXUo5vmHxe7DyiisAoxahmgQ
         LY4UQlRqzbgPdrjmEmXxQKtakpNKeA9P4+rbZwJwmevPwwUcjo5gslyb5jQhpp1T0ZJo
         OEIacuCOSiMeQpJK32iz+e7XcMbkyuT0YL5AOrQbojb2M1/MgwiKR9phBI2ql/A4WBC7
         GM5q02m9Ss+kssSLROuyKNioAmeZ3JGf8tvPGtfQ/XVat0BhVsAsjQRurJAMrccXPyNW
         IK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157082; x=1698761882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGUfde4Fde3ZMszdS6ImswgfkQv0WRr/bpakYYswZ7E=;
        b=UNPAW96PI1viIyR6Qg7jXq+E+WzCrwQezM/kQgusUO3DmiiPvmKhRFcK6v2msT1Zni
         6lxwsS5m1bvMvn5/5NjmSqc86FJGx4Edu3YAzvIH7XUqfaIWT48uwxEPoMzveRt3EyCV
         5eTijY7HrUaEXQE9C9mvovYaDuAVvnRR4LPBlY7nqvM2ig2xQ6e93DNsyLEYCRfd5J/D
         SzIWGC0VEKJF/yO4m9wcMuZcmsZWSugIvbsmZYBLq93dz/wxJS5KrBXSfA806zTXiG24
         GhnVBEURprpQWgvluYgooXh4m34XkbbvFIpfZVdn8bTbPJUA59XzxOnoM/H4jAXdP7gD
         jpcA==
X-Gm-Message-State: AOJu0YxMiUOdGU8hLSCuI3HhMUYU8UXZ7i8vrQs9wUwhDQGRcBfqkC9o
	lLafBxi4ILQeopBuL+gR/KWKNAxFo1xGfjyOlzbmow==
X-Google-Smtp-Source: AGHT+IGfSykjyOKkxOQm9vwa53dvJorVI9f4RvZQnB6k0c44vy0mmeJDOCaEe0oHH7JUOET4HTpu5Q==
X-Received: by 2002:a05:600c:450d:b0:408:4cf7:4f91 with SMTP id t13-20020a05600c450d00b004084cf74f91mr9090470wmo.16.1698157082332;
        Tue, 24 Oct 2023 07:18:02 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id m16-20020a7bca50000000b00405d9a950a2sm16646736wml.28.2023.10.24.07.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 07:18:02 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND PATCH 2/2] oeqa/selftest/devtool: remove spaces on empty line
Date: Tue, 24 Oct 2023 16:17:54 +0200
Message-ID: <20231024141754.1528786-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024141754.1528786-1-jstephan@baylibre.com>
References: <20231024141754.1528786-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 14:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189647

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

