Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03FBC46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:45 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.16023.1672594715863712312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=d/gxSsxH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 82so17177656pgc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRSNgNe6MVpA86A0oD8nPP48YQS6X0VVWZzRSMfM5og=;
        b=d/gxSsxHtLUrhV6AP2XN0wvJrC326cEOt/ehuHd1aX8+JFleb9C5/5RqkkYykN1LEt
         Q0dv+RLXbONszHMx6pQHpIazG6BpUSdXUm+kNYBPOnlx/ow9fpbQRQme9Ei/tpnead9k
         BrcjUo68XnR7I8HE+w8auwwU3aYSeOXsdLQoxxzsIcfC10PPom/q/TnELjlI0Bulecj3
         OrWnfPGXtuYIVbL7sYpYBn1nDRyTn69KCBezz024JfL+3vJf4ly5u3BWy7YBuPvG8xuY
         NTQvb1kE69NKeq3tdchaz7qo7r52ndjtcASLfwy8FbHJh7PL7SFmDDx8q83OaZ9Fvyuy
         kYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRSNgNe6MVpA86A0oD8nPP48YQS6X0VVWZzRSMfM5og=;
        b=35WLLAexbJZQaNyZlOf/lJkVE+uQJ4xunnnvu1NLb4S/h+c+JoVJPgxccXITIKKmnq
         wRGUOt5z1Z4YpMWPFh/xNpy26TKrm0WtkQcpdHRDBv7cAry+SKLxmwIs0lwja4liw2q8
         MmweVLbaiuIZ9izcMmdtAFH7ybcoGUxInrf43646CIa3CwiCcbIfCODRqJT4kuquJlEl
         IcIlcaUGXFCtAgoU4bUBPCHcaNBLxVLi+C11BJtOlGaO250/4g/mS9JQkTswdURDZZAM
         ohH0TdmTItlH0qdQ4Ei/iZWL6EPzKISmhntzbr5QdX2gdUG1i5fEbsxNdx9P8K1sL0bT
         9dbw==
X-Gm-Message-State: AFqh2kpr9Ikqfh/GwLAnkNAmfTeHkOluBCSdH55PmTkG2PnT/T87+Irq
	BLyL7RH8UkVj5EGlRPCz7ApvwkG70IWXKz/Kt4Y=
X-Google-Smtp-Source: AMrXdXsK94XM/FOC1Od8bTytjgUEf44YktR+sUw4EPG/oaQBJMMTrnlV1F9X7TFF2eSe4pOYGdFhsw==
X-Received: by 2002:a05:6a00:3217:b0:580:ffa0:bfcf with SMTP id bm23-20020a056a00321700b00580ffa0bfcfmr25806064pfb.6.1672594714905;
        Sun, 01 Jan 2023 09:38:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/29] openssh: remove RRECOMMENDS to rng-tools for sshd package
Date: Sun,  1 Jan 2023 07:37:41 -1000
Message-Id: <c4949d2443bcecaf57c1d7f51151ecc10fe5e129.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175207

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

It appears that rngd is not needed as of linux-5.6 and later[1]
and should not be installed by default since the purpose of rngd
is to provide additional trusted sources of entropy.

We did some testing on real hardware, the result seems to support that
we no longer need rngd by default on kernel v5.6 and later.

Testing result as below:

1. observing the crng init stage.
 the "random: crng init done" always available before fs being mounted.

2. generating random number without rngd.
 testing command: dd if=/dev/random of=/dev/null status=progress
   on Marvell CN96xx RDB board, speed almost 20.4 MB/s without block
   on NXP i.mx6q board, speed almost 31.9 MB/s without block
   on qemu x86-64, speed almost 2.6MB/s without block

3. using rngtest command without rngd
 testing command: rngtest -c 1000 </dev/random
   on Marvell CN96xx RDB board:
      rngtest: input channel speed: (min=4.340; avg=135.364; max=146.719)Mibits/s
      rngtest: FIPS tests speed: (min=8.197; avg=69.020; max=72.800)Mibits/s
      rngtest: Program run time: 418771 microseconds

   on NXP i.mx6q board:
      rngtest: input channel speed: (min=96.820; avg=326.769; max=340.598)Mibits/s
      rngtest: FIPS tests speed: (min=15.090; avg=37.543; max=40.324)Mibits/s
      rngtest: Program run time: 570229 microseconds

   on qemu x86-64:
      rngtest: input channel speed: (min=37.769; avg=101.136; max=136.239)Mibits/s
      rngtest: FIPS tests speed: (min=10.288; avg=30.682; max=40.155)Mibits/s
      rngtest: Program run time: 836800 microseconds

4. observing sshd service.
  using "systemctl disable rng-tools" disable service and reboot system.
  system boot up normal, sshd service also start in normal time without
  block.

Reference:
[1] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 868dfb46d96a27ec9041cb902fb769330277257d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.9p1.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index e4446280d9..6057d055f4 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -54,15 +54,12 @@ SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket"
 
 inherit autotools-brokensep ptest
 
-PACKAGECONFIG ??= "rng-tools"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
 
-# Add RRECOMMENDS to rng-tools for sshd package
-PACKAGECONFIG[rng-tools] = ""
-
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 # login path is hardcoded in sshd
@@ -162,15 +159,10 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
 RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
-RRECOMMENDS:${PN}-sshd:append:class-target = "\
-    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
-"
-
 # break dependency on base package for -dev package
 # otherwise SDK fails to build as the main openssh and dropbear packages
 # conflict with each other
 RDEPENDS:${PN}-dev = ""
-
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
 RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
-- 
2.25.1


