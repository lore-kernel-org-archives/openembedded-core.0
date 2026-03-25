Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3AF103A98D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:19:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13718.1774405174304430719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RFmxUESG;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82a3d3235c9so1714312b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405173; x=1775009973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epLbyxajSxQqpN9BM7cOsPmDCQrYWfy/KcngOqijAv4=;
        b=RFmxUESGURYCG7aB//MCam6vVfhuvdZ8ejQWbUZPfZVYImUDTa+Fqrj1256OGYD/xs
         nNXNWNOBhXG+uPx6Ya/gqJ3nj29OoLapg7BhpzzzZfIPOl0Id773V6n0nOBJvt5ieAk8
         Tqw8IY/m+qVMlaLJHuyBzX4BuY8MAvNkJSj5HT7UzVy8X595nJa+ETh9uCIaS31oEpdG
         0FweOOK31qWD95fKpbZS6OiWza3DIK2aJAzoCR7RWgHkKAKizbHX1bfkX9TooIsvTDFE
         CsmI4mXlQyn/pkW2Xdt3m2f1kOZ8Yg7wpMaoQEYmRWKjbx+AGDtqjB1pYKVga4AZGQxH
         yjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405173; x=1775009973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epLbyxajSxQqpN9BM7cOsPmDCQrYWfy/KcngOqijAv4=;
        b=QBowtthhwqK1IoQ/K6mQ6OOj0vxK3Fyh+cMimzQx3Erd9/wn5E5UcZ/JwOIon2sg4u
         F/r/20dMqW2exigC3GusLXR2rMQQuOUXw2wN/ncaYNpoiSTGwF9B0MPW0i8VG6ZiD/iH
         bNJvNeuN8fBiP+6bEi0D/KXlUZgs7JH4YhjAsgaLkO09kt2YIcM1CxCKSXqMGdCYcIjk
         pqcx0UJtldslrRE/XwR30aLRWtoG5Iq4zzkJGN8nssx7eFH77BRQuXs/Pm26bamCaXGH
         gAX2NDOuaEmOUPFCcPgapC8OHGkr88CKoX3CvhI47tPFZD5YAa7aGi6P07UoJdSQE9gX
         TVsQ==
X-Gm-Message-State: AOJu0YwJTA12ODG3hP/qa32WzdhQzWrJVDpKH9m56vohgiuVOjvpZl8q
	6iEU6GnpJ5gIJCNbNGrrJR9Qfv4zH7tUSJrYlk1Ew0Ay8nw7xxLtL3pqZxXIfbEH
X-Gm-Gg: ATEYQzyi8fOKZlHr0AbK4MRhw6e0Ila/dyCbEcSs09GSDx5xQzLiK+wiuRxsNvtEfn7
	QZwUbg7C9RJoJv0K3VlZl1o5nMnDUqsZhHGk8cfpyrj8YpP8x4gyyHobxhER1yIpHHWNLo/yIqD
	Yw96DEqp4bBTw7Ewj3xaboDWC8GY0ySzbWRYe+Ql9p4xQYZlIzaAczMxZju7srRsEti3h0vvPiB
	zTqvWvafHzEEKROTklLhcHgyEWRJNuWZtfMvM7W5cM1MY+venbUG91e6d05cBrY7pL29Ps+AwG+
	LeQnz6nPIFWhOAO/a8BUbqGRS00Xoi5qvLJSkUTrTUuG/AzrcnviAJO0B7TknIQUgks7MoIf+Yz
	rpLKK+T7ObcYeGcWMGBv2U9BkzeSilZ0eHXxzNwaNhkPrRqaYJOv5TcxHIvy6CJFCJPpG8p3zu5
	s+Zr4bTbM+j2SnDAtDyTAf8GoGUrKEanej9GM=
X-Received: by 2002:a05:6a00:3a2a:b0:82a:7893:e14f with SMTP id d2e1a72fcca58-82c6dfb6793mr1667409b3a.41.1774405173524;
        Tue, 24 Mar 2026 19:19:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:19:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 04/12] libxmlb: upgrade 0.3.24 -> 0.3.25
Date: Wed, 25 Mar 2026 15:18:48 +1300
Message-ID: <20260325021856.4053666-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233842

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
 - Correctly decompress heavily compressed zstd streams

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0421e9b2031fcc56df192da796a4cadef6966b38)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libxmlb/{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.24.bb => libxmlb_0.3.25.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
index 24eb62c98c..8687436052 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "d004cca465e5c5af3ce02c02a15978ff02b510c3"
+SRCREV = "b31dec072f4428123db3866c18bf32bc5db04d35"
 
 DEPENDS = "glib-2.0 xz zstd"
 

