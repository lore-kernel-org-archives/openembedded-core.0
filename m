Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88028C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:08 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.64.1659106080315624173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=X7sH1cTL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id bh13so4201692pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OEMYmAquq1Z346ZPpKOndf78V2QUgq65ujGW3KXKPxk=;
        b=X7sH1cTLkfqrylzyfhSSQ1R2BAZOMA+rNS5p2nDYXpRtCvpBxG/tHbK5K6i87ZkmEn
         jugbazZjaxBmKiHFyCMa1DRusm0xmkZT9L9r/8eHWMEgkZmAle3JGoeiQAYuVqeSCPCn
         0Tgs31IT/spk/VNEkrhRaTpEeoxrX3X8HOqjyXgQ2LsGXV5+kVe3NANdtbSoSsQbvGA5
         G0LRxy1zMAyhGq+50b3IGBAOr0qyLuq3aZu6WtIf9+q6m81dsKjpJlnvbQqOsCwwxBda
         FIaWRknnHjNep0/YwCWJrFvD1W1GlNibIROjqluNHzbS6hJVah5k3zSJiRIEmUe2uLab
         /opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OEMYmAquq1Z346ZPpKOndf78V2QUgq65ujGW3KXKPxk=;
        b=oM9Rau/UG0eZdqtr4eNxI1nc1HLBjgbqe+kXZJ112V5Npwef9INb99Nr/nSWYBcfj2
         LveN7fXADpNkZzgK+TLzJnMvM5Rg2nAohKb2j4qQ/osEKTsyAI3COhC1oH71LidsCPDb
         5f2BWtWMtQxTpD8v43a3E6hk43KbpMmrUV4fS4bbIKcvspDcCuh9+0d77tvxICb32XHJ
         u+tXdP5gRXeopHJx/7M0NUWXXe1mxexF3++fesYw4W+45y3eXHbzx5WnW5/dUUuYyG/b
         Exxk08Yb9UrsNhdH5P7x08pMAnouFaO3eHOgFyVyV04ifxBkUr4mx40ym4AJkAqTn+zC
         0D1Q==
X-Gm-Message-State: AJIora8OwUJgoJxTw4ejhhcZdmpRPbCx3M9kprjnRD4SvobGrcquyV13
	FRRihu8Vax8qMVKVy0JtAWntjy8hdNBLDuRU
X-Google-Smtp-Source: 
 AGRyM1uNEYVy1QZWyXEMpSdff8oZhGfFLbaM/zTso3NINCv3pHwEGIPBp6mkvcvBpDKfPdWLDilzGA==
X-Received: by 2002:a05:6a00:1745:b0:52a:f0d3:ae7 with SMTP id
 j5-20020a056a00174500b0052af0d30ae7mr4241512pfc.72.1659106079262;
        Fri, 29 Jul 2022 07:47:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/29] vala: upgrade 0.56.1 -> 0.56.2
Date: Fri, 29 Jul 2022 04:46:32 -1000
Message-Id: 
 <b29546561f8e518cd59043a563f8783ada6f3053.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168651

From: Alexander Kanavin <alex.kanavin@gmail.com>

Changes in 0.56.2 LTS release:

  - codegen: Correctly set array-length for NoAccessorMethods properties [#1316]
  - codegen: Detect usage of static type-parameter in runtime context [#1326]
  - vala: Avoid critical in SourceFile.get_mapped_length() [#1330]
  - codegen: Make sure to initialize static collections
  - codegen: Split reserved identifiers for C and Vala
  - codegen: Check cname of fields and methods against reserved identfiers [#1329]
  - glib2.0: Add abs() to int8/int16/int32/ssize_t [#1328]
  - Add initial wayland-client binding
  - Add geocode-glib-2.0 binding
  - Add rest-1.0 bindings

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21913b732953a1b85ae89721f8337eb9f75d1798)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala_0.56.1.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.2.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.1.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.2.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.1.bb b/meta/recipes-devtools/vala/vala_0.56.1.bb
deleted file mode 100644
index 48d21685e8..0000000000
--- a/meta/recipes-devtools/vala/vala_0.56.1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "c518b81dfdda82d1cdf586b3f9b2323162cb96bd3cb5a2c03650cea025d91fb9"
diff --git a/meta/recipes-devtools/vala/vala_0.56.2.bb b/meta/recipes-devtools/vala/vala_0.56.2.bb
new file mode 100644
index 0000000000..08c8ccca1d
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.2.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "66c9619bb17859fd1ac3aba0a57970613e38fd2a1ee30541174260c9fb90124c"
-- 
2.25.1


