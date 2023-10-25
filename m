Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB16C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:02:59 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.177370.1698249776353480687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 09:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xvCk7RNk;
 spf=pass (domain: baylibre.com, ip: 209.85.208.176, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so78819741fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698249774; x=1698854574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqo2Tl7AaYu7f8846G7UsUOoPCexcOfUCpXLuFyRkfQ=;
        b=xvCk7RNk+fKnOGk07Ke6lsoWbb1QiovDH7ilgnhHtG52t+O72E8vrTwCGoZ5UIcfx5
         V2oyTeQnrEeoOwx+59of2NFsMnNz/16vvtXnRYw5bBeFi2hw/JoTmiNDLt5/u9Cft7TQ
         vtOIcT5zMS108Tj0qKQ+funhz1968AdNDarirqLDsy1GOHqUGnwRhkaPSicMIHNnFbLm
         +c5o0pQ6+fkomsL6kHudsyF93WdgVbyTHgij0EaFnAnZZ53t2u3onZ1H9RfdQmRWnuya
         DDwL/TM4WjrbPOL1zLKIklwK6kuBB9vA7KnCz6cWOoOakvUrRcNwT8TwY3FGROKAgigK
         MmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698249774; x=1698854574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqo2Tl7AaYu7f8846G7UsUOoPCexcOfUCpXLuFyRkfQ=;
        b=lPtFa6ePBlIv+I5WasprU9ox3sfHguNRJTL8RuRoEBmYlDDXGdItUhv8bhGXaCi+aJ
         +ihWt5z2/iQl9YhUKcXHivdmHaZfkgXhL9Mj0EwVeousmj2iIrAqQGmMCnKeXY5AqZqr
         BRHzOTmY4FMKGpXEoZ75kKkdy9q8svcg2jjaImRtwJQDHbKgADBAfGw50ojPb4g2vPah
         PDHvWxrtpwR+uw/CD5kpChJbEDxGKf9mHapgVWWPVhMr3R1twK5d9cp8ha6F+zIqlfyg
         iHrrQxSfro9yBqPaU0h4JSfHB9a0UK7far6J/yXOHHekmRCNDSVuHVpL1frAUgnrJJL6
         nQ4w==
X-Gm-Message-State: AOJu0YxspPbJu+U2hKmGwfwwwwePc4+2SsgRqnOZockKwhtAnIVYKFcI
	CyLJmLd+iGxtweFmUFsM1lCiqQkJTvJ5ZAUaD2Kb1A==
X-Google-Smtp-Source: AGHT+IHVlBvHCf0mtE+YlJRycIplfPkK2coMyuMkeIKNccEjNQtEXJpzzr3byNWLRXtadit8fV+xHw==
X-Received: by 2002:a05:651c:154a:b0:2c5:741a:15eb with SMTP id y10-20020a05651c154a00b002c5741a15ebmr10827331ljp.4.1698249774245;
        Wed, 25 Oct 2023 09:02:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4585000000b0032d8034724esm12382786wrq.94.2023.10.25.09.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 09:02:53 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [OE-core][RESEND][PATCH 2/2] oeqa/selftest/devtool: remove spaces on empty line
Date: Wed, 25 Oct 2023 18:02:45 +0200
Message-ID: <20231025160245.2446263-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025160245.2446263-1-jstephan@baylibre.com>
References: <20231025160245.2446263-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 16:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189690

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
2.42.0


