Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BE5EB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 10:05:04 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.3051.1688292297545093778
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 03:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=poEx6bns;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a04cb10465so2502519b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688292295; x=1690884295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PuU6c0LtXhxb/D7ke+pQ3/H0YybeG76qr0hcr5OEGwo=;
        b=poEx6bnsjyactZ7mxKRQ0SD0Zd4r+BbFXi0ndX8WhWNqGYRVgfrp/jwv+ti6vXaJ35
         FSVU3j5akEbHA9PSK2CGIVdH39UUfGQhUORJaz2/5EpAr7dK5yFfWU6oYffL4TC5PQ0J
         bqVwx+hd5RdXWF6T0lYYu4JZFLWkNp8mi6DMLMr5i3tuyVXpjmB3SVhK/Ifs0bJ/gd47
         hZLDFT9NjxHZLvqPbY2n+FLTA2KlhnZGLgY4Le3fxxu+NmADQ4sGtCoYX6WgCjMOpouD
         JOY8MPKf57Kmfq6qk4d0xzfvrxFVNYGnFRi6TmWEWxYKvUFz6cJA5nve+p5+1YB2Ets/
         xMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688292295; x=1690884295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuU6c0LtXhxb/D7ke+pQ3/H0YybeG76qr0hcr5OEGwo=;
        b=k9mduNFYr00gmNCaAOsVljEiQl3nLNCoEtxgPlfxKJ1Pcb0OY3w0tU+i4/HpKPZ9gt
         2PebBbkW1N8vDo2KPTAHmI9hdzxznRICIt/5W89qtQP8cYbxPM7n/pJbblr+ZnKEL8iu
         WG695JwmM9dlhtIv1n+RedDK2JpVKvqNoeCqY7wZfRdZAIZKPdC3Wtaw3bejM4DYVr9M
         IcTXpzs8/SeRVhM0rk/uaySW7N54E7VhnGdTc+Mj5SJ8kOQmbOZBnfdTtwlUrAqEv8Mf
         DhmsU9mTOrKWysY26h9RO4nnKP9Uaxrm/9ybZH3btl8w1NgTJ+QqJ1aK7BjwNfYB1Hg2
         oJRw==
X-Gm-Message-State: AC+VfDwf6AMfKEWf4Sye6FIGWXgOnWhw7xXEOBGdo5K35wd0BvDEubhE
	cCP4Egvao99I98h2esyQRGuDIR679voL/nOT
X-Google-Smtp-Source: ACHHUZ7jPU+lMX/aM8vWkCU/t5fTXkXZ9PI/noAFJORWQegAaqLcU1T5zK4d3sgUQpJZk2fHqhIC6w==
X-Received: by 2002:a05:6808:140d:b0:3a1:cbac:38e5 with SMTP id w13-20020a056808140d00b003a1cbac38e5mr11485754oiv.12.1688292295280;
        Sun, 02 Jul 2023 03:04:55 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:e28f:b00:32f8:7851])
        by smtp.gmail.com with ESMTPSA id 3-20020a170902c10300b0019aaab3f9d7sm13405586pli.113.2023.07.02.03.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 03:04:54 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-hypothesis: upgrade 6.79.2 -> 6.80.0
Date: Sun,  2 Jul 2023 03:03:52 -0700
Message-Id: <20230702100351.2442902-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 10:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183776

Changes:
* This release drops support for Python 3.7, which reached end of life
  on 2023-06-27.
* Fixes occasional recursion-limit-exceeded errors when validating deeply
  nested strategies. Closes: issue #3671
* This patch updates our vendored list of top-level domains, which is used
  by the provisional domains() strategy.

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-80-0
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-79-4
https://hypothesis.readthedocs.io/en/latest/changes.html#v6-79-3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

All ptests passed on qemux86_musl, which had failed in the AUH build
due to an unrelated libpam issue.

 ...ython3-hypothesis_6.79.2.bb => python3-hypothesis_6.80.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.79.2.bb => python3-hypothesis_6.80.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.79.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.79.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb
index c98f10e1eed..82f855d4b78 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.79.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.80.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "51fb2259489dc446d3edc04cbc8ebd5848d7d3f238121183bee5449b91f7a8d8"
+SRC_URI[sha256sum] = "75d74da36fd3837b5b3fe15211dabc7389e78d882bf2c91bab2184ccf91fe64c"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


