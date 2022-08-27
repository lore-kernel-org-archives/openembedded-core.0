Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32318ECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.51901.1661624802361463388
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=npHd+S/J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id 142so4526482pfu.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=d90rRvw3bbICZxjNzF6fKwPujAvXMNUeaV85sNd8Pxw=;
        b=npHd+S/JWJ2ZdG88yv0VoH9EGENn7CVv1ZlFcuwHCbGikBfX8ZMKWwMJ5L30lAXFIH
         gU0g5ClbNGZdngqSUdqMw/g7X7DkTiM/EeW58ueAnZ8aP+rb1kqHyiql/6O/bte7MgwA
         6yMPIYoYJyzZMftu1ny9q3Nj6S3hUSWA8FXXjMNbDqKnYrFIZD9ZDS1HGxOKtB5t73d3
         cbEK+TFpnuIKnaFQ4I+nY2r8gAmVcSRBLvp+Rmgvr4eOvzk3++8KucNw7Bzl714jPQx8
         /XLxz2aP8gfQicqU6+A0vitequLqQVR6xKInZu+Yzcp0cprm02+1O8fT9oYrKtNiSZC1
         KCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=d90rRvw3bbICZxjNzF6fKwPujAvXMNUeaV85sNd8Pxw=;
        b=sSL7YeAsNfkTqwmmH/k3DbBGnevFLTMvfJptWrmT+uZeOtjEOFw7RcbkLIEOzQME+x
         rUwxxxIJFLOlWxQnTg7135LrPk0iosZa5l0Fz+6hm+IvckBD+wwCGXKl4Y889jOOrjn6
         MvkX52Tj/TdveelQK3LkkgxjXoDyn9QmGFVEGvcHzAKChrQa+maw09W5mDopyolbam+t
         0pjUBLsyie7yWlI5sI7g7unN+9VlGTzm7MZ/1e+uL65wsTe5+/Vm/ta5DucKMh1lCuSF
         gVVw3VtVAueuR6g115C5YjoB8opd3LSrjIuqpqrCdv0oLkEhiIzpcasLJkCyem/FgQgk
         Cqzg==
X-Gm-Message-State: ACgBeo3dCTjy6Zpw0YTuBOMoQtHFCq58rslUWJ6C4uJBbmtlwb7nUTiJ
	YhDlo2dKaHlXrrH9mBjkbEPFDk2gfjccZ817
X-Google-Smtp-Source: 
 AA6agR4sANfE1kwTg0OzVTtTxz3LFUa+NXsWQfoSzeKGkHUQN0WI+JrWwhh5pPDG3qvvWNN/xpX3jQ==
X-Received: by 2002:a65:6047:0:b0:42b:313e:d331 with SMTP id
 a7-20020a656047000000b0042b313ed331mr7991266pgp.179.1661624801442;
        Sat, 27 Aug 2022 11:26:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/24] oeqa/qemurunner: add run_serial() comment
Date: Sat, 27 Aug 2022 08:25:42 -1000
Message-Id: 
 <cd69e5d3a81d15cf663951b12abca01fc5a660a0.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169959

From: Ross Burton <ross.burton@arm.com>

Add a comment explaining the non-obvious return codes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6572baffa02ba6b8a686490d55af17cacb528920)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 76296d50cd..4c3d2010fb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -618,6 +618,8 @@ class QemuRunner:
                 return self.qmp.cmd(command)
 
     def run_serial(self, command, raw=False, timeout=60):
+        # Returns (status, output) where status is 1 on success and 0 on error
+
         # We assume target system have echo to get command status
         if not raw:
             command = "%s; echo $?\n" % command
-- 
2.25.1


