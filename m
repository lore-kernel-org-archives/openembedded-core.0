Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EBAC433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 22:00:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.53385.1638136802903824659
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 14:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ui4pvUZJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id y7so10525119plp.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 14:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o1rP7vt3j1nKMvx+2K2v89XoD37ZTAWm/LcwfXTMr3Q=;
        b=ui4pvUZJDMZsCMsdmey1zYHXn0IbZPCtjupcWs7S7y5snkuiNeQv9YFrhTWMlTFCGz
         d7Qn2k6axt0z2wdbScJE3fju+uBjTK8sxYe186RPh0RU0lR4b0dbx1mXCRqxtO9rYFNr
         1BDu/4tfSCCtV0s6oj9/F7kyc0/2ZXShHh++thmFqZxR9DydOvEsNGdqN8wTt96ZHfP/
         QBethRiSZF2UMAoHz2iNXsGmQu5dxHGxndpVufvrHCIfT16I2CLFhiIDfblRzGyVbn8Q
         ojvGb9gFgnVV7mBIgMdb/xsujdZb5Bvq4x1ZscdNahc482LFLgJKbvWxnaRTBLoEfqvb
         thtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o1rP7vt3j1nKMvx+2K2v89XoD37ZTAWm/LcwfXTMr3Q=;
        b=OvV3BkKR4YyY6ekNSpwIpCxLhzsB1MyYNxJMWoxUQPOrW+JJN+sjJLrlGhgq7nDTy0
         6Zl2/rHvuQYY6z3q751pjDi5Dwb7bQyZ480BYLwJqzJHAEGCdXMr2fXJaU5R91DklytV
         +Oq9nhw7zTh977HWQD7j1gfO+ol/zWh+um4VVinG+JH0PE1qRjCjaxNEi77ggQP46tua
         W7goixgjVbafq6WaWve62GLsOOFoCT/DN1Pyxgnlv7EjKWkDK15bIIpSXHi/eky5cYtF
         p333cny4WcuItzri1Q6r/ptz0qe2yvYcgAnI8wi4jr9ObrKJlar0yCW9YxuK1aT4alyK
         L7tQ==
X-Gm-Message-State: AOAM532nifOT/GhMZS50c2bHYInZSTJI5Yf1B1Qaksb1OzIIYt32TKDi
	cTNEHukvQilrdbQPN/bSjhIosMtYzaK9mxv8gRQ=
X-Google-Smtp-Source: 
 ABdhPJxoNg4s6YrM15vX6shTYMg2MBTgwZZ1M3ZMpTJjlXbgsZc8YpLD+OxjhyckOB+P+GjFO9VuhQ==
X-Received: by 2002:a17:902:c702:b0:144:ce0e:d47 with SMTP id
 p2-20020a170902c70200b00144ce0e0d47mr54599370plp.69.1638136801794;
        Sun, 28 Nov 2021 14:00:01 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.14.00.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 14:00:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 41/42] openssh: Improve LICENSE to show BSD license
 variants.
Date: Sun, 28 Nov 2021 11:57:53 -1000
Message-Id: 
 <fa8b8c26386f220af0d4ba9dfc9885abe3f2fdcb.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 22:00:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158923

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Update LICENSE to show that BSD-2-Clause, BSD-3-Clause and BSD-4-Clause
are all present.

(From OE-Core rev: d17938953fc2524bc5f04db4409a47aa400e756a)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
(cherry picked from commit e42870e233a85bc0d55395ef110b7445dfe784f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index 5f03bdc877..78f1669240 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -5,7 +5,7 @@ Ssh (Secure Shell) is a program for logging into a remote machine \
 and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
-LICENSE = "BSD & ISC & MIT"
+LICENSE = "BSD-2-Clause & BSD-3-Clause & BSD-4-Clause & BSD & ISC & MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=18d9e5a8b3dd1790d73502f50426d4d3"
 
 DEPENDS = "zlib openssl virtual/crypt"
-- 
2.25.1


