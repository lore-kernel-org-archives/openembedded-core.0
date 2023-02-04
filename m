Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47839C636D6
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:49:13 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.16707.1675547351320115698
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mwMSDHeq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id a23so5875137pga.13
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNSr4DgjIE807cSukyS/hYgDF3Cr5QMy1rZ8bknHf4k=;
        b=mwMSDHeqryx9+dCx9R8tnozwYF24wgN2SvMTzkUjtD/dws+bDBa32dK+c0LTrKlEST
         ARtE05MbWa2ezmlua94bJ5NKl639huDRhaMBkruxkrpK2Z/CXHFHEEPM018EcB7hm335
         AYHKT//2p52ovCSXAtdHruD/gllwppWNj6pvOBb2ofIdz2HIx/kSYO2QP8Sj+TrYDpPN
         822nqEkYjKW99eJOE1xDG1u1MwSnoN8eJk4nDun8KrPlQrMAw0R+eHJNvEVggs3BAF5u
         AyFTlr9riVrX/pwRVDRtN+0WGNMtBBrsqMdH3LK/nJZKHjztSi1Q8ZQ5jYkYcj57rP+q
         wFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNSr4DgjIE807cSukyS/hYgDF3Cr5QMy1rZ8bknHf4k=;
        b=cImTFXxQCSXkybplwyvFVW4AtdiCdtqb50W0wGZ0nnBUPThtdyBkgbtTSnggMyQY3s
         BSw53oC2K+GpJam5ffBcLsQ29Rg0mx4LqXNXK10Hy0DzQ4iSUtEwCPcIoY3HmwLHg8FK
         CPQOCk59TG55v1F0U1HXuVFA+0/l6VGSsi4IZM1M2cdp0aNeAI+/e96EMUODGUWLonB5
         /+LNnegRTGlZ+CmVgGTiGLu3xXocmXOhKleljLYmk2pJRO2G3ZxS0D/syf5PP1ucuyjs
         uU6Vj84D+FB3OHn6AUxlb/QPNV8dITXi9+RRkENPBHsvl6zOHQIJ6L9xBkjkPNkc5cJ6
         NE6g==
X-Gm-Message-State: AO0yUKVmYfD9q5+Ikzi6jF7lGV55P50Nq91b13ffX7aEBHZ1jhecJxdn
	YDI/G1u59vqncUQ+UfKP0mpwOb8WItupGtorpEM=
X-Google-Smtp-Source: AK7set8Yi/+1ozRoCnJZvr1C+/6Yz8bxfXeO/9V4lCgRSNxvm7JafOUa3K5AHjI+PH5FMw3p2veqgA==
X-Received: by 2002:a05:6a00:18a2:b0:590:7659:9c33 with SMTP id x34-20020a056a0018a200b0059076599c33mr17567040pfh.22.1675547350450;
        Sat, 04 Feb 2023 13:49:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.49.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:49:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] Fix missing leading whitespace with ':append'
Date: Sat,  4 Feb 2023 11:48:38 -1000
Message-Id: <b21e5524e3326c77598d30f6fe9268a5fdac91dd.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176780

From: Niko Mauno <niko.mauno@vaisala.com>

Mitigate occurences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

(From OE-Core rev: fcd340ec53ff8352b8cae0eb351810072b025a08)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index aa00d5397c..b24f8d99d5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -117,7 +117,7 @@ python write_host_sdk_ext_manifest () {
                 f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
 
-SDK_POSTPROCESS_COMMAND_append_task-populate-sdk-ext = "write_target_sdk_ext_manifest; write_host_sdk_ext_manifest; "    
+SDK_POSTPROCESS_COMMAND_append_task-populate-sdk-ext = " write_target_sdk_ext_manifest; write_host_sdk_ext_manifest; "    
 
 SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} Extensible SDK"
 
-- 
2.25.1


