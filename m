Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F332C25B07
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:41 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.980.1660170760143529467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fsZXuQif;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so3490937pjk.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=P6dENcIz2F5a6YqtHGUjTYkgyLyJf3S82coEJBXLc94=;
        b=fsZXuQif9NhRW7u6sBx56wq5tzGGIZXxnlzCLNbP/JYuHwZXnpTcqrF3byWRfY76h2
         mRYo61QDBt7YeCSCtBzLM+b9sY1nn4VqIdE2YDWUauuUbyraTAHj73+WkfRSeqSICwg8
         emMeSVYjD0TPQmicx0bYC81cOc3uOxqa4gDFVKbyhTv9H/xO7N3GGo6jb1pMXs8xpk40
         nnahR+n2Y8DeDBfiCLZUcnuRCR9HhSUeTAhergGbvlzsBipA8rmPjzhf0sTSgWwAAtzx
         C47/SBdSz3xa4R9341nXgEWRlImxgjKDq2mql5GhqSMDZL7FE5fTfFO7b3a2r1vDjnuF
         w9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=P6dENcIz2F5a6YqtHGUjTYkgyLyJf3S82coEJBXLc94=;
        b=CqLnPR9gjp5dZvnrQvht7oW5bxO3ueBRqBwaRQixTl8ZBaF0h2lQ7T9tzkotuSOgLz
         JvdQN/Jt31BejRGXaJKUicE0vw5VGzJtOC0EKA6bLz8KylMaXz7MxZnzZKMtcQX1NFXT
         MGYJnWxfa/2R5hX8zeqndPZNALIFF3ezIKO5wAHfmg9yfNnxJv80XIRs0oMsLJJaEeiv
         Y8PlGNKZX4oYqCiOYqLklafkxB9q6zzgqKfSczVOb2t7FzLBX4b0diElkf5X64K3YI8v
         EdAtsHOro6F6t+vhXI+lq5nsOZxtw4RWU1sm8icTVei8B6mAlVck8JFf6wR05jq8aF3l
         Ia0g==
X-Gm-Message-State: ACgBeo03VnSC0aD879bd0EnGZ89umDXo8MM/DbX9v17J5e7LL9YgAyp1
	DgMsIQ82l92NsCK17gi0DPNCeBSe+ivoK453
X-Google-Smtp-Source: 
 AA6agR66FPzhch1JtbJC3Dg1pPDS5n85cJ4H3OvndsNB4nmznstQaTa+kJtjt1CltrS9m9TAJMHlhA==
X-Received: by 2002:a17:902:ea03:b0:170:a235:b72b with SMTP id
 s3-20020a170902ea0300b00170a235b72bmr17127262plg.13.1660170759225;
        Wed, 10 Aug 2022 15:32:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] openssh: Add openssh-sftp-server to openssh
 RDEPENDS
Date: Wed, 10 Aug 2022 12:32:06 -1000
Message-Id: 
 <788e2c6bccc58e5a88b33fa91ea3c3ffec7611ca.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169221

From: Alex Kiernan <alex.kiernan@gmail.com>

OpenSSH 9.0 uses sftp by default as the transport for scp, add in
sftp-server so that this works as expected for users, rather than being
left with a confusing "scp: Connection closed" message.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be61b9dac78f0d85c870a0d8304fb4b536ec4bc8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index c529d1d060..79dba121ff 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -190,7 +190,7 @@ FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
 FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
-RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
+RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RRECOMMENDS_${PN}-sshd_append_class-target = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
-- 
2.25.1


