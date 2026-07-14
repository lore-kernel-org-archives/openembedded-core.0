Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504C3C44510
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:20 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1656.1784055854709625761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qLESZcP6;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-451a49abd8aso881261fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055854; x=1784660654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGWqjJs+fNKlzz1kmLZjlt65hC9sfRL9qu7+CMsnGFs=;
        b=qLESZcP6uidMDDStNEboLWAIu4+hMxccLVIvWl9EToV6Njzv3JsX2PdMYmIyO5P7IX
         q9S5Ay8WGdJsV+v5cRmuk6j7s79PvfpkQ2WO6388q3wF3rsiFSgDJ9Oj5jT4WTAGr0oe
         tmgwiP/usQWVDS3mnxytN485U0okuTAmkZjCU3QSiuSEzCcmrUYazthr0T85luGq95T0
         zqQgserjltTUDewssnsXOkWAygNiZNbzV3+Pbh8mOcDQFsk/ZCIfrHM8YlEzodUAJpFF
         Yz6XferVyw0C1iccfeymF25+5iPe/NwL/khvli6dQnwrdTQzoXWOSvU503xSYZ0wNmei
         t1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055854; x=1784660654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGWqjJs+fNKlzz1kmLZjlt65hC9sfRL9qu7+CMsnGFs=;
        b=gKHBJoEcSLSsySnvDQl/FOQvppHELRnyP1BzfqfmHcGaUT1LqJIiZ9xXjGOiUcq6cb
         O7n2cUZoNtUcBoAtatZGxqxvOyZeV+oEfTFYF2B/ai0LtLQuyIO5z3+dtnytC4gMAnvx
         StzAinilLpPl8jfveAkdEoIcOUuZF/Y6HjqUVUi5qNqqBtfMeHrr4a2OCBXkj5gyEPg4
         bXHrhmhCQBGDa4d8nqE6LmJUjcg6uElH4S35gzF26fBjzAx1V2lafRQ4GUw6qCAGxnYJ
         f5cGoWQcudWDShUhxI/bGfJ68mq3u8X/sceSfQ9A6xRdnEEMpHl43BVLkEF7UKbZ+TRF
         KcDw==
X-Gm-Message-State: AOJu0YwQVNj35E8HrBbF4K3e9C0aAQzkdeG4PJpZl+itlS9SkQ1O42zl
	Z5uYQWXe/LPTT7vxELTIdJh+0JjHZNUs79cnvQV9Eg2E7iD0yZ/wmatOBMvxZA==
X-Gm-Gg: AfdE7cmTeTARYuC7hySMX+8SNkb5w2Rutr+hqItzdAQ7IuOK/QbUHKEQr+cJozeZmoc
	LZW5XFE6Yic84iKMqIMPUZjTlKt4bgWHWv4WWqhv8OmGqaU7SPyFD0RZ6HOzWLc6bDxhDoSC+w3
	kncgBsvsAPaRfCKq9lSYQ2CqC+tYXysobmaxLI+lNA1nnoQoDk57fdN+jRH4rm9n8SPmpvrrLhD
	6YbOGoK8BDsYzZ8oVIsUCsddNHneIH+70VEsl0RoEoRYxL2+qMlC/D3z6mApd5ezrGiy5SX1Vsh
	kzdT9iJd1P75nxI7JGtC/Lmhp1U+cklmElzJd5umhX7jEIkU0laGw00wQEpln9tUys6zo/q+Ukl
	BT0VXiR9DcJROt/DYUBAgvVyQGwSDPokdzNIzw4mN4jVVlI1R2qQV85baviisIHuf63CEZiN6ti
	1wRl24ZhUSK80rtV3GWT06
X-Received: by 2002:a05:6870:b1d0:b0:455:ae1a:c443 with SMTP id 586e51a60fabf-455ae1b9322mr3758466fac.42.1784055853837;
        Tue, 14 Jul 2026 12:04:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 06/22] meta-selftest: Add NO_GENERIC_LICENSE
Date: Tue, 14 Jul 2026 12:31:16 -0600
Message-ID: <20260714190405.3328796-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240913

Adds NO_GENERIC_LICENSE for a non-SPDX license identifier, since it is
now enforced that licenses are either SPDX license identifiers, have a
matching generic license, or use NO_GENERIC_LICENSE

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../recipes-test/license/incompatible-nonspdx-license.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
index 142d73158e..128f313e1f 100644
--- a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Recipe with a non-SPDX license"
 DESCRIPTION = "Is licensed with a non-SPDX license to be used for testing"
 LICENSE = "FooLicense"
+NO_GENERIC_LICENSE[FooLicense] = "LICENSE"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.54.0


