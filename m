Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FD4C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.1935.1667356963204736946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ysDoh4mS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id l2so15280842pld.13
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lf13shiaQrIvm8Ni270Z+NpDcH7sahBD0yOJlbVK5eQ=;
        b=ysDoh4mSOcJ7R5HuhdevmvaCGNIrTLbr70Kml+zIPVMeUFyf07bv5LqGgUvTBacuYi
         jBTY1eom50RDL3XUwDKc8zkKeqoJS24ackBBB6i5eWDhDjfB9ElSI6HtGaKf7C5IwxYg
         nde5ZFy/4kbER7a4/91SQk86iRcMLeHfEW4CgcIuCxuIBrgDC5NG0bHXIk2sbhOIBvGJ
         wC+ffZE7Ph1AoSHlkDPArBvVWKzag7Sf/kxX7/spb4ojByyjDpMsIn3JDIvTmPdmUcZL
         X94XrKvzCu2H2j9GWi2JK7HXc/laJcRn2bLIfOUbZOv07e+h/GHci577qTRa2bk0s9WX
         +MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lf13shiaQrIvm8Ni270Z+NpDcH7sahBD0yOJlbVK5eQ=;
        b=nP4ypd3s+TFBaEXGdFCCs9gYsl0tOtklbn0jpsJKSgG+rtdpFyP+H1p2fss0+tc6qm
         eWPmsb/qT+7L0VwI42A+8Mnim5qtQtPqYOMAlWUevRFmH5LlhZluzCdyn1c8UONZGZX/
         EEvA++3oPjOtaOaLskh5peF7jqDCtj7Sjtqlb6UFklwtdSr3rHDv3gNRz2wdU4lbrwNx
         oOYjAKbEFWRPokZbh0IqVPUDqtzm/3hDjrz41LLS+cwZIgbAzYOuUWsGJQqTVyZE+rfW
         Ej7OYdDhHnWtZAKbONaKfuleEkuMmWjGrbPRpSi1J8Wb+OYm8d7DkdI33vu4L+FMMsgz
         Bk0A==
X-Gm-Message-State: ACrzQf2d8JxvjfUU9CFfZ7hXlW1EdTZ6RemoJFilJBYVfwbxFaDlAeIa
	CiOkG2gKeYCd+cPi5NQPgYdtWljHWDWn1DRg
X-Google-Smtp-Source: AMsMyM7K3npWB69HadUkELtq1RlpeSG8zapXIgvyUi8Jti20nrblyaHLu4FJm2ySHxtUkoWW/qLOwg==
X-Received: by 2002:a17:903:245:b0:178:e0ba:e507 with SMTP id j5-20020a170903024500b00178e0bae507mr23333100plh.115.1667356970013;
        Tue, 01 Nov 2022 19:42:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/20] ifupdown: upgrade 0.8.37 -> 0.8.39
Date: Tue,  1 Nov 2022 16:42:03 -1000
Message-Id: <342fb3183fd1910b76c2bed242bf8b2ea179d217.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172553

From: wangmy <wangmy@fujitsu.com>

ifupdown (0.8.38)
  * Remove dependency on lsb-base (Closes: #1020604)
  * Remove pump support (no longer in Debian archive)
  * Fix error message when turning down VLAN interfaces. Thanks to Aleksandr
    Muravjov (Closes: #1007889)
  * Ship Ubuntu's integration scripts for systemd-resolved. Thanks to Luca
    Boccassi (Closes: #1016798)
  * Add rfkill support. Thanks to Sebastian Reichel <email address hidden>
    (Closes: #645559)

ifupdown (0.8.39)
  * Add execution permission on resolved scripts. Thanks to Vincent Lefèvre
    (Closes: #1021259)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f0462e3336c7134aeeb2684692732c187971b330)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ifupdown/{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb} (97%)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
similarity index 97%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
index 57d4152a39..7096bc94d7 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.39.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://0001-ifupdown-skip-wrong-test-case.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
            "
-SRCREV = "2b4138f36ce3ba37186aa01b502273e0c39ab518"
+SRCREV = "be91dd267b4a8db502a6bbf5758563f7048b8078"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


