Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0276F99371
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:15:03 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16101.1776938650576744028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 03:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PENnxgl3;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: zizuzacker@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-824c9da9928so3296273b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776938650; x=1777543450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgYhcNejakuQnzuyA4WR7LchHc5e2SYEi/INDTEQNO8=;
        b=PENnxgl3ir/kPmLlLRENJVvquxs+bQmvK2UAd5GhEX1l/SiVNsQViXPoKxs8uhZkwp
         Mgy9JaUDBlcMbKn0sJ34ebA2Dac1xsc2FpIKi7mfAoY5hYVxkJhw4V/l1Mj1qt0Xqra8
         osnumyZ2Q7yzGIc71B3+EyqHZ1HRIeJla7XxtJBmfNEkE+liG14lfi2WssR4nQuxBFuh
         g0ar2ABNQNeMpXTDJgTXNqyMcCaxk/DUZegg6w6ObG2S2TZkF27rQWxr9N7ecVacvE30
         kGP1iFdyMR7TMJzug3hvwC8OCk5es4n/VAT12XYevWnei38xLywcyJ4w/ZRzgR29EpKK
         CQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938650; x=1777543450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PgYhcNejakuQnzuyA4WR7LchHc5e2SYEi/INDTEQNO8=;
        b=GowORuy7e4Kt8M5NnJJQNHUr9wzakmv7QkyjtVnegdEEPtO4KJVbkt2sRMl7/wMy4Y
         SNBett8awhYsT6szVM1reZ8J7dVN5nvTK0FPK5uwSi2V3Vi8YtM5h5fcut8WGXh1U6Zl
         SgIPcj85wIXbEy0CcU5C14TRvoZwON25lgcCLcnaAI36aVgcFy+JR7+0C16k8oeffdx0
         wn/jktLV28cO/NG9zhYywjVl6OQNVGYEOpefb+tdNJ9iVS9mhePlUHmUmi+j3KhI/BIM
         ey+iiU40X9zyUoo+NZdSfLVO2GW/q0ILh48FSCaSjzw0JfpLAUiOhuBEgs6sVUktcOMe
         zS/Q==
X-Gm-Message-State: AOJu0Ywc9kLti8k3/VsiD146fWiYFI0PiE7xakbHeDu7YbBob9GCI8cN
	6RfIDMJbTyzonhVkgQeGH8b9KGotIw9w+M1Gt1jnzCdZfr0ONdj993PG+cvMNFu1tFI=
X-Gm-Gg: AeBDiesnhBqz/znkRTiKUgl2tjA6mSwwkAexAodgU5iWb1H7ObvNRCzHjox1cebYmai
	ex1SMCyX9BmTunlDHbCzJA7tPhLdxZK3Te8ms0HZkuicTKWOu32ycyEf9Q4sisuF23ohcw9VGb8
	BGMSx5EyMZq45zvRoNE0ZPna/dv8Z5lz9gDhrZAKpl7HlerFF4iJdTOGvTPoZKsMe7nVEqWzLoy
	KDHzjML6VtedDEFJLm4bG1vuMvijAaG3mOEbG2KzURngL7/pW+tICHdo1A9c/oa/Y671V7Iwxi7
	amPQQT8YWyns9z/1WCv2U12FbfNJY6WeTBD08SuERkPmZAUqBcfu8Usgz49DjjSCoZxRIwRgAxc
	8BBCeI71q8k3XsiWABuYhmyfSpCFQ8Pd8/6k3ICn9HievrEub26CWRGRTVSiZiIbtHMIU+4dzPn
	hVySOJeum76Uw/av6XJxu9t70z
X-Received: by 2002:a05:6a00:2191:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-82f8c9ee927mr25887675b3a.50.1776938649625;
        Thu, 23 Apr 2026 03:04:09 -0700 (PDT)
Received: from ltu.. ([42.118.25.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm21540801b3a.17.2026.04.23.03.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:04:09 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	mathieu.dubois-briand@bootlin.com,
	Nguyen Minh Tien <zizuzacker@gmail.com>
Subject: [PATCH v3 0/3] useradd.bbclass: fix parse error when only USERADD_DEPENDS is set
Date: Thu, 23 Apr 2026 17:04:02 +0700
Message-Id: <20260423100405.25255-1-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DI0BXNU5HAFH.348GL3QVI6JL3@bootlin.com>
References: <DI0BXNU5HAFH.348GL3QVI6JL3@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 11:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235755

When a recipe inherits useradd and only sets USERADD_DEPENDS (to depend
on users/groups created by another recipe) without creating any
users/groups itself, the parse-time sanity check in
update_useradd_after_parse() unconditionally throws a fatal error about
missing USERADD_PACKAGES.

This series fixes the issue by skipping the USERADD_PACKAGES validation
when USERADD_DEPENDS is set, adds a selftest recipe to exercise this
code path, and adds an oe-selftest case to verify the build succeeds.

Changes in v3:
- Fix usegroup-deponly.bb: remove unnecessary S and UNPACKDIR variables
  that caused do_unpack to fail on the autobuilder (reported by
  Mathieu Dubois-Briand)

Changes in v2:
- Added oe-selftest test case in usergrouptests.py (patch 3/3)
  as suggested by Ross Burton

Fixes [YOCTO #15863]

Nguyen Minh Tien (3):
  useradd.bbclass: allow inheriting with only USERADD_DEPENDS set
  meta-selftest: add usegroup-deponly recipe to test USERADD_DEPENDS
    only
  oe-selftest: add test for useradd with only USERADD_DEPENDS

 .../selftest-users/usegroup-deponly.bb        | 22 +++++++++++++++++++
 meta/classes/useradd.bbclass                  |  5 +++++
 .../lib/oeqa/selftest/cases/usergrouptests.py |  6 +++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb

-- 
2.34.1


