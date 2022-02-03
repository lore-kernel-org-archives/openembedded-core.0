Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7649FC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 11:25:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.7868.1643887537506426397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 03:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gCVeOhpo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id r7so1726146wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 03:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yNGlKlt6rZtnNG1baen+SQZLV5KJCsCtV1ohJH01MZs=;
        b=gCVeOhpoD6JR9UfPDyJC5imgi1zxuGdU52hFcPbSrSFP1Iyd88HcuJHxZxtSg1Lk0p
         nwNtPh5RuiP8xYkFGUWHR3XefJKtnnHh5CKKABetMsJC1sJD1P1msDBFh+6qV2NrB+C2
         tBlQ4SFKD5xEfZFL8NVXWvsPPTqG5UPtzxVFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yNGlKlt6rZtnNG1baen+SQZLV5KJCsCtV1ohJH01MZs=;
        b=uOtYRRy9UTmMzJKOrSfRt8X50E6yxLWNjzDDMKQGnPQ7UETKERy+5jyCgM2+SleABh
         XWaFpqEWGQNA232DUHvTSX4ohyl6HhfvAL67EBkHd2CMtT36yN2XuPac0FOLJryTY+pU
         WdWlG+skOndQoFLRfpu2oO25VJ/sAOehZnNkKQqKdlzkyk3NlYTlrmYHh5l8c/fPPo7R
         XfBe5FGZEz53SZ3Zt7lTfhwRN7qhs29IpzjWW+5Bh/2TF91ox+6zuGjNKoJjFbe18G0p
         NDycYgjwyWLR9OocLURaEB1ME9OqAhyrRc9mfuZRgkhLKpvi1nFMXlk/+WhduzG4fgJR
         zeUA==
X-Gm-Message-State: AOAM533qyb7V4RTXAeFnHM0QX/v3uRWFe+3w6s8Yj4zYAJ0QeOoOTMpV
	891IIBSZ6LfURYL3EhAGusxlcRC8bTQcuQ==
X-Google-Smtp-Source: 
 ABdhPJzRlV//9bVrTE70nH8Vl+An7s7Wh+WJSJF+/I59AXNyHbvaAjCH8hXiMLK17VXy/lS2PxQ3XQ==
X-Received: by 2002:a7b:c455:: with SMTP id l21mr10054214wmi.91.1643887536028;
        Thu, 03 Feb 2022 03:25:36 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e772:7635:2207:1103])
        by smtp.gmail.com with ESMTPSA id
 o3sm19467994wrq.70.2022.02.03.03.25.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 03:25:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] abi_version/sstate: Bump for hash equivalence fix
Date: Thu,  3 Feb 2022 11:25:34 +0000
Message-Id: <20220203112534.2389621-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203112534.2389621-1-richard.purdie@linuxfoundation.org>
References: <20220203112534.2389621-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 11:25:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161272

With the hash equivalence fix, we need to bump the sstate and hash equivalence
version numbers to ensure older task hashes aren't matched into the new namespace.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 2 +-
 meta/conf/abi_version.conf  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index fd9acbab9b4..85d0ee2e6a5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,4 +1,4 @@
-SSTATE_VERSION = "7"
+SSTATE_VERSION = "8"
 
 SSTATE_ZSTD_CLEVEL ??= "8"
 
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 20ca1098ecb..66df69bb8d5 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "14"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "11"
+HASHEQUIV_HASH_VERSION  = "12"
-- 
2.32.0


