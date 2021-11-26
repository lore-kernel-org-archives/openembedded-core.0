Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D88C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 05:28:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.20557.1637904501815729658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 21:28:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PT7R5e+R;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id r130so7857637pfc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 21:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=JVHhmCmqKzuCGXFzJjIfQ4Fh/X+OiYumapUQLF7JPIQ=;
        b=PT7R5e+Ri/LdjSXddYnLSQFVG08FDE7oKRv6QwjhUgL1p0qMOo2vJmz2dyZoiAjiFU
         fZ9CG/Y1FT1lB9nfj37cIgHz1voY3RpYNXJ0BFaDFf8e9aniVOoHircvV43tt9+uIVhM
         MbXUqVCOCbfjJq/N9KkEksedcffyaHiiyotlYMCpWIHC85n6Ci3FZyXAVjfwuTJhT4i8
         945g50UGY/tyvrndQxvVnnWzMF9dhsP4+sZCmW0Jxt6Hk6MhDeT132Ugv+iDLI3v1iJG
         AZCUOl1Kw1iYY0wQEuZjL5bBgrqXUKWYmbOUZr7zK4pVtS32+NLP55Q+1Eq+tE/9NOrM
         UNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JVHhmCmqKzuCGXFzJjIfQ4Fh/X+OiYumapUQLF7JPIQ=;
        b=Yeh2zxuyVfd1TWSiJ7JF9Zr76Kn0SEij/GTd2XC9u1kmZSGqi2oQqg4qA9ZXOJCpK8
         2G5+AfvMG8XnrRCjKZu3Fu5EAlesCS+E4vF4fcMZ8hZ8eOr2whsLV9Q3sQBKNZbBnnf+
         8dke6cur3W2p95Xft1NU3avrxYVHrfcLLQoPJI/iVZ6ahk2Wt0oLWV6vRMncEszqxNtQ
         Da1qJXGslr6IK9UcGCcvO3fjIBL3fv3bu7glN58TTDtm8kkBKhYmv7dN5Ni4h9r5I3B4
         Ib8OU0dYHXYxGcQUvaNIlIJFd9n0Pjm0S1oQ0FPngMqtiWt3f19YgFG6O0dDN/1AQH4B
         3+cA==
X-Gm-Message-State: AOAM530PBY0zFduonPjdyQnjQkHvzAAFl07QY8OZToMJhPvmqQFu57WC
	WpLYE+UNMF2SnUATLKeCyn6hxSETUdwwDCL4
X-Google-Smtp-Source: 
 ABdhPJyw3ezK4wIvjFXtPXYklsuuMn8IeX6r43SxPQ8MAiQzi6gW2VFSP//IWSTicANjiPSwy0VBNg==
X-Received: by 2002:a05:6a00:2441:b0:4a0:ddb0:a6ff with SMTP id
 d1-20020a056a00244100b004a0ddb0a6ffmr19558453pfj.74.1637904500990;
        Thu, 25 Nov 2021 21:28:20 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:1909:57fb:e907:6203:5372:5465])
        by smtp.gmail.com with ESMTPSA id
 ot18sm5048080pjb.14.2021.11.25.21.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 21:28:20 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [poky][dunfell][PATCH] systemd: add packageconfig for wheel-group
Date: Fri, 26 Nov 2021 10:58:07 +0530
Message-Id: <20211126052807.6138-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 05:28:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158823

From: Peter Bergin <peter@berginkonsult.se>

If the distro does not include the group 'wheel' systemd will
complain when trying to parse ACL rules for tmpfiles.d.

  systemd-tmpfiles[273]: Failed to parse ACL "d:group:adm:r-x,d:group:wheel:r-x": Invalid argument. Ignoring

Systemd has a configuration parameter to avoid using 'wheel'
group in the standard config files for tmpfiles. Add this as
a PACKAGECONFIG and enable it by default to keep default.

(From OE-Core rev: 1b5648e6aeb9837cb807ce086c26fbfaa16f6f8b)

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 457cc45f51e78a532930d0347de271f24ae0a2ee)

Upstream-Status: Backport
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index bf33b8d6a1..b6f5a47d63 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -96,6 +96,7 @@ PACKAGECONFIG ??= " \
     timesyncd \
     utmp \
     vconsole \
+    wheel-group \
     xz \
 "
 
@@ -188,6 +189,7 @@ PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
 PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
 PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"
+PACKAGECONFIG[wheel-group] = "-Dwheel-group=true, -Dwheel-group=false"
 # Verify keymaps on locale change
 PACKAGECONFIG[xkbcommon] = "-Dxkbcommon=true,-Dxkbcommon=false,libxkbcommon"
 PACKAGECONFIG[xz] = "-Dxz=true,-Dxz=false,xz"
-- 
2.17.1


