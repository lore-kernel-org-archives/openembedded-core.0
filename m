Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9B6C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:13 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.53248.1638136753130375238
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RFGntqNi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id gt5so11014659pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8YWB7YccSnSwi8b4EGen4hIbZw7IzHRADg948OpNATk=;
        b=RFGntqNiiUf99EVAMKPTf7FIbGbr2ZNgzqHT29KWNrmLsRaDgUOlNMgJK8XqfQ+FtA
         TMYACNxOG35S609FaQ+R97eagvK7xa2QPKdD4hiD36tUlEz0lL/Sob/5Gw+C1Nif+9KR
         vL9ypcXjn2ymvj5DeGl7EmNBkWEgSY4Dqz/4wfzpJgA44CMRL/EUgmIkwIQ28LIi98lh
         V5NLwUMSCIr+kP8bSHbQ6NBJMa5GSu4pC6EJm/cTLOIUIvgUD13Ef+3Onnz8rwwXfgge
         UiJnNvwD5wR/fmR0t0p1gURz/OV9J9PdVpRvw41FngY88xt51Mvy6gSJC3lzymko41Eg
         HSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8YWB7YccSnSwi8b4EGen4hIbZw7IzHRADg948OpNATk=;
        b=ADstt9TJl+qn12+5hzGnMU6LrXYnzazOs5Lh/fvBxxHJL5y2+e0/SGfTcJkZPRdNWc
         ZSw2AiUZKHDt+GVOfKe6qeEkLojMbFvcP12Skv60sVT0DMnhjfmxnoRU1znAy6x0fwP7
         3voppqfGnE5PWgigHPKUqfZjVbWrasvQPUaE6VVYmPF141OBADAGfCZdILdpk9gEus9h
         Ilm3A0a8mqJ6sNkk53HTJhQfmRe25ZIu3ndGoaA3Zz2sQzrVvUTDst2Aru29fOoxbc4z
         oUsBGMUtdfIyYzqx8hF8Ovmt1/2f8Tf9yIVw3UtpgpZRcPbQNuwk5BctvLI54ACcwwN/
         FzEQ==
X-Gm-Message-State: AOAM5318SKPz1ihkQnZtcXtCKh3IhLkWLqQKdYxu/9rTNSwJidh8LYm3
	B3l9n1buIpupnOTTuDLFSSrawDQJ7Zd/1Tf3SYk=
X-Google-Smtp-Source: 
 ABdhPJyS3rUp9o4QNd1YJW6rRmM33IJoRA/Fz1Nv3G82NkPdiy5iD+UfJuWeBugNouC8Wq0rP5Zv9Q==
X-Received: by 2002:a17:902:b7cb:b0:141:b33a:9589 with SMTP id
 v11-20020a170902b7cb00b00141b33a9589mr54953144plz.9.1638136752005;
        Sun, 28 Nov 2021 13:59:12 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/42] cracklib: patches submitted upstream
Date: Sun, 28 Nov 2021 11:57:33 -1000
Message-Id: 
 <f9c9fea863efb7ab63d927aded6c3b3f49137a5b.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158903

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d2e9354945dcf4e89e001f9816c8ea2dc79b066)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-packlib.c-support-dictionary-byte-order-dependent.patch | 2 +-
 .../cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index adbe7dfff4..e36b2e798c 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
@@ -9,7 +9,7 @@ Create the dict files in big endian, and convert to host endian while
 load them. This could fix the endian issue on multiple platform.
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/41]
 
 We can't use the endian.h, htobe* and be*toh functions because they are
 not available on older versions of glibc, such as that found in RHEL
diff --git a/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch b/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
index 6210e82121..b1022c04a8 100644
--- a/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
@@ -16,7 +16,7 @@ PWOpen: No such file or directory
 Set DEFAULT_CRACKLIB_DICT as the path of  PWOpen
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/42]
 ---
  util/testnum.c |    2 +-
  util/teststr.c |    2 +-
-- 
2.25.1


