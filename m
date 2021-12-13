Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E50EC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:36:54 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.12741.1639409813042197896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rCWeVSfM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 133so14869457pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FytVHk8VpAcU/GVw3boyQH2vw01jEj1PsPXXeSks7OM=;
        b=rCWeVSfM6CBoymwNuY21vyXXCWZzBt/g7QiLt1quQZ2qQIKnelwnQIVOCmXyxoR4qp
         OYS+vlBEuORQyNsWN4RLninDcGwSU1lBKo8Gh8OkPtdp5PwiaILU3GVxmGbgX23LIzz5
         2bRaWc0gSO04ha9nRRq+meRkviavT+NEco7P6+e9g6Y7srzQ/E+1LMN+xUFkugqYUjBC
         r8TAkS3RMy48fNUMl6xuZLeXa1aUgiZqmLWj7w4oyZ06RTCKMwea9dd1ynFi86kR5yy6
         HYasZ+OCJ84S00jbewbIm30mYS489df4W3PRkeBZq/TUsJMwWwFQ52284xs9myHn/k2H
         nZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FytVHk8VpAcU/GVw3boyQH2vw01jEj1PsPXXeSks7OM=;
        b=emNm5RDCOurEybUJcwVm4lAa/O1Oq2RWEdZzzEGhRG9LhlKR9JOXjq4HC0PED42r0P
         /UhmLOO30pI2fimJwwaS/kt27uWjBWZoVpII4iRstU5ISkuhMsnmxBnkuzlfPAM6x+Ut
         PdQWVCktRCLQDxSDApPhKwBremcED6mRTwZU8BKLBZLQ2sItMwd4WTuU8FTuMXHSMg/b
         Jf4fctopmlI4iXhZdfN5L64t174SNIoo0VH7sVMRIY/xC37tUvlldg/txX75Q00emsf2
         TWoX+1cySbDoEcsJ6KionFkBrn42EcqX7VdpuzKZmZyEdB40VMREmmNVExvj2Vs1rERu
         rKBw==
X-Gm-Message-State: AOAM531p4RMyj83tWds6AJXmgJXLqBcqODUiBbnqGh1CxCBqu+WYEGsA
	CUKturLgx0fO2wb88jXpGPrW0l5H5GVbXg//
X-Google-Smtp-Source: 
 ABdhPJx/UTy6EgEd/xrXdYwswrewTvJPFxHtz/o+YXFO5uhwSxX4bCqNj8sahfOK2T+OEygqywM8mg==
X-Received: by 2002:a63:c155:: with SMTP id
 p21mr46755707pgi.156.1639409811988;
        Mon, 13 Dec 2021 07:36:51 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y28sm12850297pfa.208.2021.12.13.07.36.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:36:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/10] gcc: Add CVE-2021-37322 to the list of CVEs
 to ignore
Date: Mon, 13 Dec 2021 05:36:21 -1000
Message-Id: 
 <71a6d3c31775c6b2db38e194992e0ffce637c827.1639409496.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639409496.git.steve@sakoman.com>
References: <cover.1639409496.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:36:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159646

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE applies to binutils 2.26 and not to gcc so ignore there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index 235576e627..c171f673e9 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -124,3 +124,6 @@ EXTRA_OECONF_PATHS = "\
     --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
+
+# Is a binutils 2.26 issue, not gcc
+CVE_CHECK_WHITELIST += "CVE-2021-37322"
-- 
2.25.1


