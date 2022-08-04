Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7FAC19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:10:35 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.5281.1659622229970992692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZhDegzzW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id bf13so18032023pgb.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TgkaN63K832LwQshWGJH3rH8iDhncJ54z4KkWYlH7hE=;
        b=ZhDegzzW06ebdBiS3dSWk4SlANzFlkWD66/oKdBjN4pLkYe0VSZC61mQ8wzuWn+fuq
         npLZBivmlz+hR00DaXvG7hpn0bG6JCoqkLlYIhDH5rY/uwXL5/S9l6fapIpjmMGpg9Wr
         Fdzx8jwx8zrONlPiNLC+TLAJl3sPF1nqPzVYXYnSC+5YUqLfpsosjdxCSaLhC3eGdtrx
         E/A7YsX536IYo6Qq3HMLpPQKr9u9f+lIYIWGakWE7FE2+ICql2/eqaq7zeh9bpoTyX/d
         jxN6HRpmWeP5ffbtra0rG/EvMGMOS/9yujCfUIA6Qn0VeWqqDCHDPxMOvKGWbwOYDPrP
         Ypcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TgkaN63K832LwQshWGJH3rH8iDhncJ54z4KkWYlH7hE=;
        b=W9qTLy3ixSn84L8dDAPTl3MmjAE9mpg2wC77ZVmqyQLbcWa+6LAlQLjztDviOkEMTv
         Ox067OeB/OoyrWcbHyiHQgcfc/FTVCizu2D6vbviznwnH+XTxD1eHe7gIC8OVZb9HT4H
         AkOlMoI2jrRKCcvFrXTtMEAnpBjkv1ZeiWlJyQOPfxUzg/K7kh9XsQpqO0+wHXgr5u7q
         6FeXij1iD2daGPSZkSa+HU0eiLp1nJ0QMAQeLM9gvaax9OgzHAbABXTngSA6qx3+ldUk
         g2VY9Jh8db56X8Z5/1fcoML8q+Yt+B4AuKXJcNSVG4VJ/cP/Al/wRSUMzGyXQFUWfiX1
         Nwew==
X-Gm-Message-State: ACgBeo1jXLUlgaxGZjz25zLusdTfAMJQ4SoqLc2BFiJX5wXFbp37jO4k
	MTGJoTuQknr2IGGQpa0IwF/qxmEzRq+WM0RB
X-Google-Smtp-Source: 
 AA6agR5YCOlhpFYKL3Md4QVzu4Eh4K8laPXO8l8X6+tgs/fA81XyRCrmHmNQm84CRAaAcax+Du0GYQ==
X-Received: by 2002:a05:6a00:14c4:b0:52e:6b0f:209b with SMTP id
 w4-20020a056a0014c400b0052e6b0f209bmr2057206pfu.36.1659622228713;
        Thu, 04 Aug 2022 07:10:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 196-20020a6215cd000000b0052d5e93fcb7sm970261pfv.191.2022.08.04.07.10.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 07:10:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] openssh: Add openssh-sftp-server to openssh
 RDEPENDS
Date: Thu,  4 Aug 2022 04:06:10 -1000
Message-Id: 
 <c33eb7fb1d1e91a005b22b65d221d4b899ec69dc.1659621460.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659621460.git.steve@sakoman.com>
References: <cover.1659621460.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:10:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168856

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
 meta/recipes-connectivity/openssh/openssh_8.9p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index a3a0016ce5..e4446280d9 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -160,7 +160,7 @@ FILES:${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES:${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
 FILES:${PN}-keygen = "${bindir}/ssh-keygen"
 
-RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
+RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
 RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RRECOMMENDS:${PN}-sshd:append:class-target = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
-- 
2.25.1


