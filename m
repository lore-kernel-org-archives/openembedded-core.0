Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE180C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 12:03:16 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.8340.1653393791096526629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 05:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VPcdTusF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id j25so956179wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 05:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iSl0BAzR5FjhfFAKu7phVf3TdRfjboPiv2POY7jIEj4=;
        b=VPcdTusFbHrD4Ed3725Vu50cpDvMO58qoe4uuqZuCAkOzOuneE0Rb5pbz7S6uA1o1Z
         j2ghPaN7pFDHki8geCtk5JVN2H7o0jnPU2joDBUocXNJRBSzaroMXi2ZTU7qSyHeIlSk
         c+zvnkmwKonA6jUx++daxW4ePs7iu1+axXI/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iSl0BAzR5FjhfFAKu7phVf3TdRfjboPiv2POY7jIEj4=;
        b=uhtwEwoVGtzRQxnsMtRwNcQgQm8JZthCPl3q8lud+PP2XQOe+2e0c9/tGF1vpnUbpt
         MaTH3+EpyLhqCYbAUWDsQ6YP10hI8fhjm5BfLXqgAqunU6MjcwjMTEn5shCe8BXS7SMG
         BkL8WnwPRqAJfatizikJ0oHuve6i4PKy0/jPODn+GlqbfOmSOEWXFJb6p6Hv/p1QH71v
         I57VVjDHeRQAm5OCW5optoxVxoBPYfXxXGyfw5COYlyHEaPRLU9w60YGhfOcUQLjLZCr
         0m+wRC9dr543YFkRt4svBg8zGUpdlD+3loUaulBUB96wvYg4SNwQbStEe4DO0798XLJh
         jrhg==
X-Gm-Message-State: AOAM532Xe8rVS5yi/k7CgVP61wDNaM1M7qfTJ+jbm9XgtXVqOuydVf8l
	1YFuJycrrwwrtqwLWg4PWNFO6v9nJUh/9jAx
X-Google-Smtp-Source: 
 ABdhPJzG4nhaFcwXJ+weTPE6Rqo2WcTzNGea/pvpqPVTql9zZMbn/VsxcCfsSkNeZE06H9QMgZY48w==
X-Received: by 2002:a5d:594e:0:b0:20d:bb7:72b3 with SMTP id
 e14-20020a5d594e000000b0020d0bb772b3mr22710451wri.702.1653393788774;
        Tue, 24 May 2022 05:03:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6777:760f:4de3:e746])
        by smtp.gmail.com with ESMTPSA id
 j15-20020adfb30f000000b0020d12936563sm14857335wrd.108.2022.05.24.05.03.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 05:03:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lzo: Add further info to a patch
Date: Tue, 24 May 2022 13:03:07 +0100
Message-Id: <20220524120307.306167-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 12:03:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166063

Add some further info to the patch based on upsream changes. Given the last release
in 2017 and glaring issues on at least armv5, it does raise the question on whether
we should drop this. There are probably better compression tools now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lzo/0001-Use-memcpy-instead-of-reinventing-it.patch    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch
index db3a70e8031f..4e6ca4132b54 100644
--- a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch
+++ b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch
@@ -10,6 +10,13 @@ Change suggested by Julian Taylor.
 
 Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=757037
 
+RP: Patch is still in debian as of 20220524 in a revised form:
+https://sources.debian.org/patches/lzo2/2.10-2/
+https://sources.debian.org/patches/lzo2/2.10-2/0001-Conditionally-replace-reinvention-of-memcpy-with-cal.patch/
+
+We likely need this in OE to prevent against unaligned accesses
+on systems such as armv5.
+
 Upstream-Status: Pending
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 ---
-- 
2.34.1


