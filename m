Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3ABBCDB474
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:41 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.75799.1697319938993488018
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JudZcRtL;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.53, mailfrom: steve@sakoman.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7a27254cd12so129491139f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319938; x=1697924738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgBHHUNo6p2x9/2KeXvYlyk7ceaNjsjfyo/ABYrk5pU=;
        b=JudZcRtLl22wz9madkvujnaGIc6wOhi1mVbvgJ0O4dSt38RAeE0F+E/4Yurk45veX7
         ynrJxINa2FnvyN6aW08VH3jYS6ZZR6p05jqHXRDK9Yz7MNU+NKbXDBTsPmW8kOUxS/k0
         fdR+wPhKsjgtX4Oiks5XdjVt6beauTZtiSJ3ZxG7eA97+LnZgYXwg6RKCzl8XBuGjSni
         3TeNraMVJgAkd34Leem8t3ccrm376395snjryPjWwNc5CNXg1yxVf76yI5xpzw+WhhxP
         MM4Sfduo51EQavKxJyMJY0xR0RytMXn8quF8LMqtsqsEsaQSIZCb5gKtfibw7H1TE2uY
         i5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319938; x=1697924738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgBHHUNo6p2x9/2KeXvYlyk7ceaNjsjfyo/ABYrk5pU=;
        b=WY66q6qL4nGEIX2PTxbHJanrjDNucAY51aFJoAT0sOfHhgu9RMjevBhY+w+M1RsR/h
         pUenNv5QCQbhu0wseJFhUXM23RxxXQlBwM9cpKewacfEBBZvCj/rzdB/2C9xlmO0NVJD
         KfUj9SH6KqubUgSBrcjM9PFNJIDZPFDZ5VNHedIBipMNHIK3jyj5cfaPk41jPhcSQW4o
         NkE3wlzh5eJtDXNeIK1HqFWmzEaJo5BKVUaaI2WObMPQCNZ51ROtU6+yj4AwanHFVgCt
         yvGJLh66WYoH1L19XNkyXXK1qJh4ihUg0RuZHJ6vV8QeSKuiHGvGyQOkpzY/qm9XCpbg
         VnRA==
X-Gm-Message-State: AOJu0YxMK4/ud9NmhEHE4psoaMdnBfvaoz5wpHrcWVfThxy0KNP7Mfrt
	LNPPTgOcMKMEoLgZJ9ECElrN7T/odq61n1xfHc0=
X-Google-Smtp-Source: AGHT+IEonWzJREhZapSkkdcPcM9H3D2Qld+KIj2z6G3UU5hvIaP6htlCgpQ6DCpl84KBibg0tRwOAQ==
X-Received: by 2002:a05:6e02:164f:b0:34f:68fe:630 with SMTP id v15-20020a056e02164f00b0034f68fe0630mr39248165ilu.25.1697319937966;
        Sat, 14 Oct 2023 14:45:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/13] python3-urllib3: 1.26.15 -> 1.26.17
Date: Sat, 14 Oct 2023 11:44:57 -1000
Message-Id: <27a1de55a46b7b313eb2a6370e9d779a7cd49154.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189136

From: Lee Chee Yang <chee.yang.lee@intel.com>

1.26.17 (2023-10-02)
Added the Cookie header to the list of headers to strip from requests
when redirecting to a different host. As before, different headers can
be set via Retry.remove_headers_on_redirect. (CVE-2023-43804)

1.26.16 (2023-05-23)
Fixed thread-safety issue where accessing a PoolManager with many
distinct origins would cause connection pools to be closed while
requests are in progress (#2954)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.15.bb => python3-urllib3_1.26.17.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.15.bb => python3-urllib3_1.26.17.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
index d2de7c4c02..57b166870a 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "8a388717b9476f934a21484e8c8e61875ab60644d29b9b39e11e4b9dc1c6b305"
+SRC_URI[sha256sum] = "24d6a242c28d29af46c3fae832c36db3bbebcc533dd1bb549172cd739c82df21"
 
 inherit pypi setuptools3
 
-- 
2.34.1


