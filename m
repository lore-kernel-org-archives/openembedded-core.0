Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B1EC678D7
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:09:14 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.196997.1673964551341064314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3wvLrqho;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id z4-20020a17090a170400b00226d331390cso34180311pjd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+TQpD27PNr87KDIvQUnbZpzPZyFiVm4z18CbJi5Nw4=;
        b=3wvLrqho0M7mTdmIEBJGTfz5hzT9WzS5M8yizu8aT/9E5G1EjHud+mHc+u/ogRGJnE
         +WIzQCJsZFlUPdc43HguICt7MUfZfAXHMl/y7VitD6Eqkdz2WsEdkNMTjuHyROClVg2I
         Xm1XCaFRYGvZhNunnJUBoUWJQRmCmkPFC2fzDXLtph2v9lyX/4VwM6h9GcHznM7SAoRH
         AXE++2NabOpK5EI696NJhK/6ZF3ceQB/yUhIx90+9g2dpNAi5ePK4nxRdy8A0ViU//nF
         HK/CkPAsODeQgIQoge3g8MKuut3RpSSkeMQXSrAs52EAWIQFFcnwYjFcwH1GSbta1xS8
         6FBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+TQpD27PNr87KDIvQUnbZpzPZyFiVm4z18CbJi5Nw4=;
        b=5TM9/mn8sH01+9vPCVc3CiFzmqz+KAi+A/3g5XDzH/G9VRmQ01K6qmgImRHF0aGM+R
         p9//djMhBxRm2FIryu14WLgrI1yDMVvvdXZPr518aCLn99X8bC1Pt4k381KakLSJU/Yx
         xHDjeaIGwOvhB+b3L+yaLUXi67eocEiToyo7eFB7eaC3DtX59P+HL0zJgZa/37d55xGs
         Piy/Y5dJkp27caSQTN+4FnrREmz/kP4s9pNHljfxwy3qVMsyP50VG2shoW69cjR6ufFY
         UEKJ5K1AqAMDJ+2nxWFRCBupt55EjNpPH8XCZT8b9l+EvzegADR21pzHLYcMcEFw/cBH
         64qw==
X-Gm-Message-State: AFqh2kqDsdT8mfO5dyV0vf1b5WaPcdoSAY1MSo2XMjwSkeIgy7wY/iBD
	PKkUM5f3bUi3vwu8bbGHVTJNxqDjQVEjRf1N2js=
X-Google-Smtp-Source: AMrXdXvlq3tg5IEOJ+5x2fCTzwHwKe2xxb5bGx04HZkpJ2/ydaGK/SQ6uCdUi81X0KV9FGWZLmGPtA==
X-Received: by 2002:a05:6a21:8cc4:b0:b2:36a6:d7b4 with SMTP id ta4-20020a056a218cc400b000b236a6d7b4mr3077950pzb.27.1673964550368;
        Tue, 17 Jan 2023 06:09:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001930b7e2c04sm18197788pli.287.2023.01.17.06.09.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:09:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] freetype:update mirror site.
Date: Tue, 17 Jan 2023 04:08:44 -1000
Message-Id: <8f1de2127bd8f3f2a182a8532102ec0d3d44be70.1673964419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673964419.git.steve@sakoman.com>
References: <cover.1673964419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176046

From: KARN JYE LAU <karn.jye.lau@intel.com>

update SAVANNAH_NONGNU_MIRROR to SAVANNAH_GNU_MIRROR
to resolve package fetching issues.

Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/freetype/freetype_2.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index 5b464d3d70..d425e162bc 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
                     file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \ 
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz \ 
            file://CVE-2022-27404.patch \
            file://CVE-2022-27405.patch \
            file://CVE-2022-27406.patch \
-- 
2.25.1


