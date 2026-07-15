Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF09C4451C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:01 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12680.1784134080501118241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LzyGGA/1;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-448de0cc236so3424447fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134079; x=1784738879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoHXRGlxY9chaHeq7fWskVY2J121XKNx61FcwSehgC4=;
        b=LzyGGA/13i9Pst/sdjxxArT2jlUHWbqQDhfY0Olt3NhHQ+Z3kEcz7RH8f/Ch5YCEFm
         lsHleig9hFKB4N8nDw4UkkgqVFmWLR/qRkBHHqYB0P00/Xa1xhA2rXoiFeodkDUYZ/kE
         oRpROHIo9dtJ9xiT7GMBlk84hZRHjnyAgdEziCdpj31tLc0sroZ/Pecow4FerwBLQgjJ
         LcGIl+r6x8X1mlnWEzCBUu5bYt3X/j403SBo7A5GSRXt4Sl80S4Lq/5R0lZUbqGyqx0V
         BajZ5NfeDUmYtzIeRvUIrCXL4FJNEROekMQmRgRxjoiBYg2kBYYkgmD+C77TPO/ANTHk
         Eyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134079; x=1784738879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoHXRGlxY9chaHeq7fWskVY2J121XKNx61FcwSehgC4=;
        b=Bo0M7LvKC6pwnuMJXI9Ryq+rQWp6jNsZsy51R6/X0hI428x8q7ITUxxPol4CJBk8ne
         eLn+lazGCjP/jQqq05u4lh2i7XvKRlm4hwdHGzEOh7f5v8S6emX1O01mcqsIue+OL4nM
         /TIM2eKKdpRrYZcf8UIOQfIDPm8KSkuPlQXhTl67e2hYZRjUMHmSny1PobsATK6ByiYW
         G0FlxH/vw/DFVjiFwKubXtXqXHACjIprNcFZy/MZRCd287O4X8IbBGT026UzkjIEBAf2
         0etWkF7XC0kkk7662nxE/xP6WQE5Fh75JRcrdfy4WUpI+xmUNyutHq277VNXdEMSNDVW
         mm8w==
X-Gm-Message-State: AOJu0YwTrRIJxLXyHvcq8bmPrzYHANpI2hWeS4o42sS/ZDVDPyhfHDRI
	FBgXqbtHi6viQQXIjvPCp2mWjzDXW+GFTUZ9GkWgO9gXrjOSDo1A1B0AhEFQFw==
X-Gm-Gg: AfdE7ckUUcC7X+Q/5TKss5Tf75VbHD9G+EjEpU5mJUDWYE2PxhBm1oREVsUkt6F0mNE
	BTLbDBzXmOHY1TDiCW/meUHzgTiAKqW2KjIyG25+Hq4SnYfC6ZSdiGtZcbe7IvjqRf4Pm+yRcNt
	tnQ8jVRNNcMDxGuEGBLKGoRoJ27Db196rCYTsZUx5mCh4FyTzf5oBQTCsQ2TWWKAL0ZYDgK53Vt
	G9oYmAdAsVx/RDtiUevG6kpKzne9HeI/kKMZE1dqyvee4gP5Jmfo0ASvgurVs7KS/tWtIqjj8oc
	EAgbkuA2WxM2c/bKvwc+kllzsZPGDIGAVf1+J6k258Dpo2XuWM87sdZRaWG7mp6JDgj5gxFwpTZ
	hIkOWe8UJyfp5RmtA7+EWkmKayh3XbUKMdh7I07EkXix+BLKbriTRqO1RsNu0J7FsE0sZ84NQ4t
	7eIA0lA26y
X-Received: by 2002:a05:6870:a0a6:b0:451:bc5f:3d35 with SMTP id 586e51a60fabf-455f7cec5bdmr5339768fac.14.1784134079624;
        Wed, 15 Jul 2026 09:47:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:59 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 24/25] oeqa: selftest: bbtest: Fix license exception
Date: Wed, 15 Jul 2026 10:45:20 -0600
Message-ID: <20260715164739.364323-25-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241015

Adds an exception to GPL-3.0-or-later licenses to allow them if they
have the GCC-exception-3.1. This is required because the license uses a
WITH expression, instead of being a bespoke license that combines the
license and exception.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 51934ef70d..860f499269 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -233,6 +233,7 @@ INHERIT:remove = \"report-error\"
 
     def test_non_gplv3(self):
         self.write_config('''INCOMPATIBLE_LICENSE = "GPL-3.0-or-later"
+INCOMPATIBLE_LICENSE_EXCEPTIONS = "GCC-exception-3.1"
 OVERRIDES .= ":gplv3test"
 require conf/distro/include/no-gplv3.inc
 ''')
-- 
2.54.0


