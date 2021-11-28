Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4906C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:58 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.53355.1638136738151392184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Y9dgz9Dm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id h24so11026895pjq.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TStRZoN3KJ5UyPXm0Zd9cvGnKIcwF+dGyZErIphv3W4=;
        b=Y9dgz9Dmmzo13f3R+6lZTytcBs8ZN0fg+RotCE5yPsUv1Va4/fb7JsscftDxg6A5ht
         7s8ktlBDreCeyTf8t28H8SiG+aUHH/maqTTIEBuvksVx+/kRgdfv8Emm43PKpirT7XDk
         VTxZOOtuF+1rSl83KZtLuI4rO/iwTwgdodtTSfhjioFVAYxC5ijTjoIRrnTo+60iFtEO
         ge5/dnADLiQSKvbnwRm2ob1+pg99y7Dw31Uq6aPsuPa8Cf1KVcCOgEvK71ugaAMAoo0a
         /46Mtyw6kteJnZmdzATu66xeun0YdZIM57+7xcWo7MKK+rjO8boOMjC4g77Y+ayEPg4k
         3AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TStRZoN3KJ5UyPXm0Zd9cvGnKIcwF+dGyZErIphv3W4=;
        b=D2Oh7t/DTQWMMXoB4Xq5eTTS5+pi+DoZcGyLFWaszv4q+gFHogQBneaenKRQixb5SV
         gXyGInBihPExu7zL+4ckXubqoBgvKdmtH26YbacAP+/daqP/bEkZ+EB0lsXo7/PRB6uk
         IaBGUWX/e93llqR4gkOD1wSBhQXUOnNt+8CMeSdBTaayXeAelJ/FW0taorXcnORBTffT
         agspLr25d0graJXz81qQvK5ZTUnKIxIpJajQIfwsGBquscmsG8rP+aAYu/AblpOYgTUz
         StVHqxP+YeIe58b9DdJtyF5dTaExD6TTfgb0dggfmw2REZzlijNGcPFdpNJtV+JhD9rv
         ggcA==
X-Gm-Message-State: AOAM530QBPd1mbwwbQSY4UC8Gs0pdhGYGrGJkRxF2oshxHcTLNbWxV2N
	9k4vowczRdM6MhEo1EgDcI2hCbYasliofkZ1hu4=
X-Google-Smtp-Source: 
 ABdhPJwKXYfOY29XDYTFdiwYKWvgN/SQwh4qQ9ExCn1SQqjrRJBC7ZtPiGGOe3saogNrMERD+dT5VA==
X-Received: by 2002:a17:90b:4d0a:: with SMTP id
 mw10mr33731589pjb.89.1638136737056;
        Sun, 28 Nov 2021 13:58:57 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/42] glibc-version.inc: remove branch= from
 GLIBC_GIT_URI
Date: Sun, 28 Nov 2021 11:57:27 -1000
Message-Id: 
 <e62e0f6757078cef5c793d8fb107b09362db783d.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158897

From: Anuj Mittal <anuj.mittal@intel.com>

GLIBC_GIT_URI is used along with branch=${SRCBRANCH} so no need to add
it here.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4c9cfe326913d28f82e6a91d1eeae55a6651f0f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index dd6f0039c7..aac0d9b3bf 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -3,6 +3,6 @@ PV = "2.31+git${SRCPV}"
 SRCREV_glibc ?= "4f0a61f75385c9a5879cbe7202042e88f692a3c8"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
-GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;branch=master"
+GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
-- 
2.25.1


