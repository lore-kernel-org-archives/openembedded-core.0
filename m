Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E97CC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:04:28 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.9721.1646921067459814650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=f7ViwD71;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id o26so4814676pgb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CykFLFlVxqjh+vyA0L2nsTbf7rrrme66kefZGaGy+7Q=;
        b=f7ViwD71uhLKV3362XkpYSCx02TfkDHX8RvzNooSdMHzG/Uu0g+ElO+K14EJ9uYpEZ
         0OMcksLPU62XmskpZWKG3rFhRGDypoVAhlNH+CNX6f87NdpKp5tkDExkHUewW+3rrHPU
         FM7VgEuBeC8xtPIYxWrwqpev/yWcdZk1X1NRYHizuv6dfcS9IwN/o1A/qN91RfpOxjJu
         ar52nfK5gDzpjCTKmwAX798hyERbnLR7N1MEKFLpGHejxZZjZVdyndzWKlC9ntMqPMSy
         bgUnTDKRjUfrm4IgKekcoUaBRo3WaMjM3v7JNoQ8V3iklflNHkK1n7RwyBtT21hSRg6e
         k9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CykFLFlVxqjh+vyA0L2nsTbf7rrrme66kefZGaGy+7Q=;
        b=HdP1VpCdx1vAyfTKUlMnVDjmdgD/sXd1pgwGP1K9KCnBQ98OjDZH8hvgu45EOcjCzB
         bH8Jj8DcBWP3wDATKV5A03v4kqgWkXf5DEIEphMJ+iMbD8QEUEVfvViBM9zSxqKEP/Qu
         kAaxt25PEHh1I4+A1tJi6FVUAggvxmn6KnaocSiAZj6NRXt5wjBv632Fn3m/tkqKzGtm
         FZ74XQKoKil8zesMe5iPSLiwNGaA5BK6HfscQxESROpiVuelvADkYS8zwIIB1rRWT1Z0
         46hQNNeccQNT0tKKDUSxOlvKrk19VB3FUucVGRTpLRejqdDydtTGJQEQ6wlMwI+hMZqa
         jfyw==
X-Gm-Message-State: AOAM533dnxOogXgiz7GCrr0VgymED1/QwTcj7UvYcoN/DEu1Xc1wN8KO
	wCxO4tjcyIvYTtmWQLfvD1Eo+vMyEpHE1i1NSNo=
X-Google-Smtp-Source: 
 ABdhPJzhLR5WBpTNnUbDxmcXHX1ulAbBULLoTslj1N1ZNxPDBvOlh3O08XmyItYss8jCXZtyYTCcmg==
X-Received: by 2002:a05:6a00:2311:b0:4e1:52bf:e466 with SMTP id
 h17-20020a056a00231100b004e152bfe466mr4814631pfh.77.1646921066419;
        Thu, 10 Mar 2022 06:04:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004dfc6b023b2sm7291927pfl.41.2022.03.10.06.04.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 06:04:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/3] perf-tests: add bash into RDEPENDS
 (v5.12-rc5+)
Date: Thu, 10 Mar 2022 04:04:04 -1000
Message-Id: 
 <0cfc604b48155ed4129bcc056610f32caf1a93b4.1646881254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646881254.git.steve@sakoman.com>
References: <cover.1646881254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 14:04:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163027

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Upstream commit:

   commit 1dc481c0b0cf18d3952d93a73c4ece90dec277f0
   Author: Leo Yan <leo.yan@linaro.org>
   Date:   Sat Mar 20 18:45:54 2021 +0800

       perf test: Change to use bash for daemon test

       When executing the daemon test on Arm64 and x86 with Debian (Buster)
       distro, both skip the test case with the log:

Changes tools/perf/tests/shell/daemon.sh to be explicitly bash
(it was already required, but was just skipped on various
distros).

We add it into our RDEPENDS for perf-tests to fixup 5.12+
builds.

We already have relatively heavy RDEPENDS for perf tests (python3), so
adding bash into the RDEPENDS isn't signifcant even for older perf
builds that use the same recipe.

(cherry picked from commit 159cdb159ad0e9d3ed73cfc07f9acd5c0b608e7b)
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index e04047e85a..9c9bf1647f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -267,7 +267,7 @@ RDEPENDS_${PN} += "elfutils bash"
 RDEPENDS_${PN}-archive =+ "bash"
 RDEPENDS_${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
-RDEPENDS_${PN}-tests =+ "python3"
+RDEPENDS_${PN}-tests =+ "python3 bash"
 
 RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
-- 
2.25.1


