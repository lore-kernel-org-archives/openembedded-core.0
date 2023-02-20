Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DBCC05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:00 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.14066.1676902736696849155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7tEfW7mX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id ei9-20020a17090ae54900b002349a303ca5so1544290pjb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGGEugTG2RtGEFg7DB4Vh0ivgyC8ewQXm4szrxoXNrU=;
        b=7tEfW7mX2yqeXYuu7MHYJoPrloDO5QLRHVkzXiojuEKO7RDAI5FvPIe0k5qM2yCFoA
         WXgB1N2hc0DMeQo8wLJb8dNmXj/2JoSwvqv8cFRPPRQmCc+OAw3MgivgPCqxTD1uzvOc
         ffI073kVsBCaVWpo/ENpoibM4Fc448JVPsnK9JkbmGjlXTB4JJIArCSS+psWSso8TEJ0
         81TqJr3CORJ0VNiPDoLiccH8+GksWoBofgkLDjAFWWrDRQr1J710tztE+mD+ujhIVU9P
         WULj0hr1wjqWBJtfLF7xQekzmcg5e5BEAEdfvAl39VgX3pazvrsh8h+zcuISd+USg+Hg
         jlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGGEugTG2RtGEFg7DB4Vh0ivgyC8ewQXm4szrxoXNrU=;
        b=SKCcA5aiwTXnzQu/ffF54RWHwnGvlS/MXASov8GNI0qOakqlHWRG1KkVYIIVNl6/Yg
         c3xLo+EYpCo2EoospD2+RD6Ah8hD+EiyO8p0vG/ySldv1+1r7eJhrhFK+MMejMJj3ZGx
         uY75sbafaGFx2/spm7KpWiaonhhKV8xIxV8FHnfuTDauSqHBaAZLXJQJb+0Ltj87C5w8
         ZtjBHlkcAbfW3G6ot5tIUq0XuYmmj4wcpq7aHjTrxD6LeRcBzz1Np63eiEh8CWinF/sQ
         2ejfZUeitkDJ7BVUcyleDNYDOeYHz/u97w6UZ6JsKOMPsx+T116MhLp9aLz9rcjWRr/l
         YgSA==
X-Gm-Message-State: AO0yUKWqC6flkF9Eo1TxiaVQT1NJExUt+BXJPdrTK4U3SraeE/lMJ5Kz
	eWkgPjYsd2wstfaJtR4u6L7gw49Xs9mkUIkHeHM=
X-Google-Smtp-Source: AK7set+fNBTfKMzHxTfuP4FLRX3yr35xZpX5sjHqQFGlhZlffb9SvjUWGa4nXD5m5EbTQHDHRiZuYg==
X-Received: by 2002:a05:6a20:6990:b0:be:d368:5c63 with SMTP id t16-20020a056a20699000b000bed3685c63mr1178887pzk.38.1676902735752;
        Mon, 20 Feb 2023 06:18:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/22] git: upgrade 2.37.5 -> 2.37.6
Date: Mon, 20 Feb 2023 04:18:17 -1000
Message-Id: <936354cade974b59b964ea55aca22a04fa44a2a5.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177416

From: Sakib Sajal <sakib.sajal@windriver.com>

Upgrade git to latest 2.37.x release to address
security issues CVE-2022-23521 and CVE-2022-41903.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.37.5.bb => git_2.37.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.5.bb => git_2.37.6.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.5.bb b/meta/recipes-devtools/git/git_2.37.6.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.5.bb
rename to meta/recipes-devtools/git/git_2.37.6.bb
index ea53cc41e4..e6165ca37b 100644
--- a/meta/recipes-devtools/git/git_2.37.5.bb
+++ b/meta/recipes-devtools/git/git_2.37.6.bb
@@ -167,4 +167,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "5c11f90652afee6c77ef7ddfc672facd4bc6f2596d9627df2f1780664b058b9a"
+SRC_URI[tarball.sha256sum] = "626e4c338f72b170e2b3afb1cb2161f6fbe4fb1d0749154f1ebfb5f0a57ec25f"
-- 
2.34.1


