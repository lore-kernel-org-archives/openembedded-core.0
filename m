Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AA1C46CD2
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 22:41:39 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.34718.1703284890422149931
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 14:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BzRzooJS;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6dbb8698312so1075501a34.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 14:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703284889; x=1703889689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cy+kpM/qBX/9iggWia8HsmkhnbNa3ccIGC58ADCx4yc=;
        b=BzRzooJSITTi6ggEp0OCC6M2UhIrZ8yuymZ2sal2nF0JdsDlfPkokGUIn3FlR7sJ68
         c1feI8w4zAhLGMIzPrleXcJPOg/zs7ZehqMDRemeOlsHFfFyS4xIaXnMFjzsezYkpHHv
         IS2G7F6mALvybActzJndjPTUv4eKuf3/KqWdy1DspHPuokmTePtRhbAOAqgDkPl+s7+c
         79WtTJie00fnBP0AdndK0HHCvin+HFDkTFAs7Rx/t3HHc2gjO/YmHWhN1X7msmsqNsWg
         aKzgKkNCK8RIyXhBPUSxfpTdWYTCucrFmLWJKcgRg0lD9DTaoGsBBjMfwRWnBtla+Y3V
         l6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703284889; x=1703889689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cy+kpM/qBX/9iggWia8HsmkhnbNa3ccIGC58ADCx4yc=;
        b=Mc/kB7EXcRbFouuDC75CUfXWBfL7IiGmHK/oAEU9L8rqcL1G5Fg0ZQwbsE+b5FiqqX
         LDj+3UaL+wrUZZOPzdQbgEfy1YVZ9cFnnwKhpm+H5Yh9xVTOJbrJM6rM+h9KB7Mt6EIn
         9AGxNfqYzumraxn170fzbAzmmbYzFYOYZMuDowW7CW2g5AQ41Hy7OmNCcPSPRsSl+WE7
         Q5gW+o1zbbNAj064p9k2e7uOuNch1CacVZnuA287vB5hJQVdioTmDu38QokW91OGsM/1
         PazBRRejXE0d9R/ZoYSwZImIGyq4F5mwTw8yj+8nRQL15+1468oOFIePWjIZMGOUpZ2z
         ekiw==
X-Gm-Message-State: AOJu0YyAutO7dZaOjv5bY6NOgfLaEqGsaGKY5pC+R5JvzKaGp7E7lDcT
	2suMQtqHgzFLzKlPZemTU/jMUyJtKig=
X-Google-Smtp-Source: AGHT+IHqKiybK9X+g1dDjQTSq/DPN3NLq0nGEf3tf4qJQ5H+fYvxexS3FCrRl7d7o+a0WE5GrP/1rw==
X-Received: by 2002:a05:6830:1c8:b0:6d9:ee22:a9eb with SMTP id r8-20020a05683001c800b006d9ee22a9ebmr1431964ota.20.1703284889143;
        Fri, 22 Dec 2023 14:41:29 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::d6e0])
        by smtp.gmail.com with ESMTPSA id r10-20020a056830120a00b006d9b1bbc666sm822167otp.17.2023.12.22.14.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 14:41:28 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes-global/sstate: Fix variable typo
Date: Fri, 22 Dec 2023 15:41:09 -0700
Message-Id: <20231222224109.1750153-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 22:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192879

The vardepsexclude was subtly wrong in that it referenced STATE_MANMACH
when the actual variable name is SSTATE_MANMACH.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 9330433bb2d..efe7f697752 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -336,7 +336,7 @@ def sstate_install(ss, d):
     for lock in locks:
         bb.utils.unlockfile(lock)
 
-sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES STATE_MANMACH SSTATE_MANFILEPREFIX"
+sstate_install[vardepsexclude] += "SSTATE_ALLOW_OVERLAP_FILES SSTATE_MANMACH SSTATE_MANFILEPREFIX"
 sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"
 
 def sstate_installpkg(ss, d):
-- 
2.34.1


