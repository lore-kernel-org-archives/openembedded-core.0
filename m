Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D3AC64ED6
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:37 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.43528.1676990478424193122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iHrrKiaB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id n20so2627814pfu.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1D6WMDL76xjUGrBNfm2GE5eel+TO5iAF0XenY83OKR0=;
        b=iHrrKiaBQRUdshse0TLhOj2dYgoEs01FFihmRi0KglMyRGRmQQN6U90cfp3fiAiowS
         T59CxL/0U8TchPxc9cAV/8ExasZ0ZGS0JT0u/twJcYLQFFvwH0rb5ILvsI+zil5RSNVc
         8gGBPujKN3iyfjKghH9K/uJrX1w0jMYHFCAeTuSGDmZ3QE39Aku6CRZqhIRbZKFtzzhK
         RkE2UfmUaVoah6KyIFn6ZlE9rnTIpCkGPfEAbG/p/etAYEwLQvWELr2oNghcKT55puuh
         NQdqFGW6/JtVe81B3x0E7CTMKkGag02+VjQJSfxJylFlbvDTDcoe/UQD8zGIGdRfqpJH
         f13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1D6WMDL76xjUGrBNfm2GE5eel+TO5iAF0XenY83OKR0=;
        b=vCdrS79DbS2z0LL6jjv39/bZhpHEctiavlscaYRLmgy8AxjUtvZmnFJbR9PwMfIc8S
         isG3LQVKDQXsFAhRhakfAMB5Lk1bFC1LdkK9xU965th3+dzHWNqpG9EyHABQNY0IZ2wN
         gSDOeEvmQ3ToDaDxxwBKNkbMq7q6pp9SlEofzJa2IPlZjtKxSQer7NXV5UBphSU0w1r1
         tpNHD84sFuUsr2pRr6ldy7Z3ziqOl5MBxOGjTxxaVC1hLzA68LxXZMJjfg/bWUY3C5vr
         UfXaVzPnVoi/4hRvgmkPgKJeAaWpkBeEL0WeRrjgJ0/QZSPf2W93MbG2mrWnjyb4Sngy
         tgcw==
X-Gm-Message-State: AO0yUKWTePXkwSLnJX+y1Ra3tv5mdMeWEdDlKfDIDw362BUqPTqVQHKY
	j6G30K0dGeUgehgjD7k2rKc8mIJIve8p1aSe3nw=
X-Google-Smtp-Source: AK7set/LsniMiqOXloEelQjwVgMZgtWkXiF0jJjObrps3Ocj2xZsE/YUAOmPTe+5cX2Fv7TvHqpNmQ==
X-Received: by 2002:a62:1c97:0:b0:5aa:39a8:41a2 with SMTP id c145-20020a621c97000000b005aa39a841a2mr3167543pfc.24.1676990496143;
        Tue, 21 Feb 2023 06:41:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/23] libgit2: upgrade 1.4.4 -> 1.4.5
Date: Tue, 21 Feb 2023 04:40:55 -1000
Message-Id: <6c64dc88b5dac910f3760e9cd1003cc83df3ffad.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177512

Fixes:

libgit2, when compiled using the optional, included libssh2 backend, fails to verify SSH keys by default.

Description
When using an SSH remote with the optional, included libssh2 backend, libgit2 does not perform certificate checking by default. Prior versions of libgit2 require the caller to set the certificate_check field of libgit2's git_remote_callbacks structure - if a certificate check callback is not set, libgit2 does not perform any certificate checking. This means that by default - without configuring a certificate check callback, clients will not perform validation on the server SSH keys and may be subject to a man-in-the-middle attack.

Beginning in libgit2 v1.4.5 and v1.5.1, libgit2 will now perform host key checking by default. Users can still override the default behavior using the certificate_check function.

The libgit2 security team would like to thank the Julia and Rust security teams for responsibly disclosing this vulnerability and assisting with fixing the vulnerability.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libgit2/{libgit2_1.4.4.bb => libgit2_1.4.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.4.4.bb => libgit2_1.4.5.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.4.4.bb b/meta/recipes-support/libgit2/libgit2_1.4.5.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.4.4.bb
rename to meta/recipes-support/libgit2/libgit2_1.4.5.bb
index a6f4d8d7f2..aadfe4ad02 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
-SRCREV = "3b7d756ccfaf9ec2922d2db22e6cc98f8ab6580c"
+SRCREV = "cd6f679af401eda1f172402006ef8265f8bd58ea"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


