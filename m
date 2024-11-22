Return-Path: <karem.ibrahim46@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157BED75E40
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:32:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.23990.1732282321342969325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 05:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLRtorsC;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: karem.ibrahim46@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so18460465e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732282319; x=1732887119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILVodiFnNNiYIPhah2KdOxtvN/+H1x7Bu2JPeTItMJY=;
        b=iLRtorsCAOXOAPp/DO6/WY69x8gwlyWn+OPUK5z0AXBLAHsAp9XxUI8Gf9LCw/fi0a
         1A2j+2g9yhp7iIl9FnKoGnF1+zGeSb9MnL4Gt+Ak8bvbaZqZN0UHSGZUd2yBP4tmmK2+
         fK0X7V7w/RwVv+14OqcnkY8ZWS0HBHrHHgCZC/nI7hpIS5OfMqLEPnqhMKoi5r3jZfUH
         kiCB0g0y1r5NO9zkCQ2mj6v76GWQTQu0ufHo43JZ34lMjooCotVox6QqgbCc84DTH+hW
         fNBZWpHbd+IYkpqQOK1O2K/oCouyTqzXxHv0gpjWa6yDECfWZ3mDpbx2TqfekEO4g9mt
         6RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282319; x=1732887119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILVodiFnNNiYIPhah2KdOxtvN/+H1x7Bu2JPeTItMJY=;
        b=wP0jbIqYJANAoUuZsYV9KkrufAUf2Ll9uZtRS0E/qF+RZXw7IVXdU7yLnnDWYHEBm/
         uTPBOEcSztzo9tkfkDVEnq5qBY8+EK5xUFRxhvlpWyIhh2WP3hrCm8iHoGyNrmmYjId+
         ANf4ytHc2uxeFWl46OpYalO5w+j1eVeZOsBEpW4MJdEoMHGnflozR6RqRlIKJ0Bv8m1M
         sSx0gki/3X4TBRI4jUvnIcPa2S+hclN3qbeu93D/X1atLLBcdrcNmTvEM7xG0XQgRQ9R
         4ZBpPWRm32mjXXV9OODRLx2U1tq3AhUYVRYAot9KblTxWe9WTtXfcSTLuZdoucThnscc
         T3gw==
X-Gm-Message-State: AOJu0YzR6K0u6W9lktw1DXq/KfMpB4iq3U+3k+WOih1W1okXl18zHL5H
	dch7drNtKo+xPn+DXkVlG+IhhlONN2lY9D9MJfSZHB06bguVJ/k2oAnbM7K+
X-Gm-Gg: ASbGncuIj1ngCjhWfFFm2TD9Z/BW/O8jpKKVYBw0phX/I8g99nSfd2EIGA4rLWCdjlj
	Uxdzrwk0JDlbVKZi2BSEgLmgHvJUNvIN++qjzHBsB+F29kGCKbqrdlHedhmtqWZRuil0gCcWuMB
	4j5FuCWk6FVLLv58F9nLjrJs/OY5KOY7GSJR5GkByQLMTb7er22WPvFnNM8k2YV3OyMjm0cWt3S
	JtfAGhdTGYplZWYt+AxyU6xpNOG6SrHvztLTCoXL4VDeJvj73JNpTTv64P8DjYzKDMy3Bc/isuu
	22MOaAXexLHIGXdul/70QmGNXaU8LBEKQv4=
X-Google-Smtp-Source: AGHT+IEattUWUOm/g+kIuMj6RGY8yRMuMVWfV4t7iCF7O3QeDhpuPwbprH9u5uvbS+wa2bGPTFvqSw==
X-Received: by 2002:a05:600c:4f4e:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-433ce4264cemr22595625e9.11.1732282319218;
        Fri, 22 Nov 2024 05:31:59 -0800 (PST)
Received: from CAI1-L15933-Ubuntu-20.04-valeo-wsl2.vnet.valeo.com ([197.134.217.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde97c68sm27306195e9.36.2024.11.22.05.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:31:58 -0800 (PST)
From: Kareem Ibrahim <karem.ibrahim46@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Ibrahim <karem.ibrahim46@gmail.com>
Subject: [PATCH 1/1] Added a new cargo-online bbclass for recipes requiring remote crates
Date: Fri, 22 Nov 2024 15:31:40 +0200
Message-Id: <20241122133140.1627-2-karem.ibrahim46@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241122133140.1627-1-karem.ibrahim46@gmail.com>
References: <20241122133140.1627-1-karem.ibrahim46@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207615

- This change was intended to abstract user from having to set compile network flag to get remote crates
- as network access was disabled by default in kirkstone version
- I faced an do_compile error with bitbaking Qualcomm qcrosvm under yocto kirkstone with message "Could not resolve host: github.com"
- And after some hours of debugging I noticed that cargo inherited by recipe needs remote crates during do_compile of the cargo.bbclass
- It was fixed by adding line do_compile[network] = "1" to the recipe
- So I found it more convenient, since cargo build usually need network access, to abstract users from these details of cargo.bbclass do_compile

Signed-off-by: Kareem Ibrahim <karem.ibrahim46@gmail.com>
---
 meta/classes/cargo-online.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta/classes/cargo-online.bbclass

diff --git a/meta/classes/cargo-online.bbclass b/meta/classes/cargo-online.bbclass
new file mode 100644
index 0000000000..175c94e09d
--- /dev/null
+++ b/meta/classes/cargo-online.bbclass
@@ -0,0 +1,7 @@
+# This bbclass is added to abstract recipes writers from
+# having to set do_compile network flag to 1
+# if his cargo package need external remote crates
+# as network access was disabled by default since kirkstone version
+
+inherit cargo
+do_compile[network] = "1"
\ No newline at end of file
-- 
2.25.1


