Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CA0C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 06:53:45 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.8479.1639032824086045971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 22:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jzDwXXFj;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so5555386pjj.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 22:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iwQ1zd5udjEBbSQl/Qec3KoWLut01RuybtKqMRrvS08=;
        b=jzDwXXFjpAswI9bHGNzt14wxHDSNBtsH40h8Ug6eQjTYQ+mW1SI1ZPs1htB3if88wS
         JE3j52rdWrbJ7G4UnK9kYLnMfIN0C2SNa6SVkaLaCOKQwFDXboxTb9dw4BWTfVijSvtU
         gHm/EZHKR2RYTQualefp6jCpPlJmiX8QtByoYzBKbz8sYCoeeg4MUxLJcDPtyiddaXVE
         tDldBg2+2es2LyMTN6uRs5wAUrQ90N94G+Qq/3o5+8Pj9Df3eRcM7uBX8pu7ARVXHjkP
         SLa2Wh0wRG02IoJWaJLbeIy8LZ5a4RcvGd4j+kwBn/26qYwFTTeBOa7N/Arjcjh6kUxq
         3Mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iwQ1zd5udjEBbSQl/Qec3KoWLut01RuybtKqMRrvS08=;
        b=rPmXSWCOrOeFcZnt7+XibGjcqJQT9tMnqPl2fNRBYw4hFoohHry5FvCCD6GCNN6IzD
         ymjA9gZw0UMj3ZETGRM/5IFiFwI9YHy8tEi8JVRm2o2ECHHLhjT+vrjGyu+DCf0SE4G6
         /ujLsTijo8vpjxIwBjcCyNqxao82he1vUue/tb2cq6h4pud5HWaFUqbTVenoNFTPe/pr
         lPLCOM9vSGusP8CFCRtc1LHFsT0GOZm6RbaG3XqWR00C+VfznLoqGQgiTgRhdU6Rkqbe
         H+wh82u25xz+PePgltuhPs6jfqaFRl5B2/9iiUfJdzm0HZMFXtG90ewyTa2ZAFPb2mrl
         ZnGQ==
X-Gm-Message-State: AOAM532vcDOfhV8zIb6BJCQTHeXwRGIKWRlzXs02Z/4kZav/oWWNxSYG
	Yqv2pAd4bh6v3/XcWAnWwExAxskcjiwfnw==
X-Google-Smtp-Source: 
 ABdhPJzaNpY3B1Z2DgjkqrOAdaoVS+is4x/1wwuyH509IxhjNMWzFYoUoiHp10OStMPiSGF91yK0WA==
X-Received: by 2002:a17:90b:4b09:: with SMTP id
 lx9mr13694977pjb.100.1639032823166;
        Wed, 08 Dec 2021 22:53:43 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:950e:1dc5:83fb:4754])
        by smtp.gmail.com with ESMTPSA id
 m11sm6642888pfk.27.2021.12.08.22.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 22:53:42 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [dunfell][PATCH] gcc: Add CVE-2021-37322 to the list of CVEs to
 ignore
Date: Wed,  8 Dec 2021 22:53:35 -0800
Message-Id: <20211209065335.2999735-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 06:53:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159441

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE applies to binutils 2.26 and not to gcc so ignore there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index 1c8e3df51d9..a1b442de8a6 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -123,3 +123,6 @@ EXTRA_OECONF_PATHS = "\
     --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
+
+# Is a binutils 2.26 issue, not gcc
+CVE_CHECK_WHITELIST += "CVE-2021-37322"
-- 
2.30.2


