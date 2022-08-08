Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE33C25B06
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:26 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.22275.1659940973527483070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hpkfftya;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a7so14839984ejp.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mXfcbebF4+diuiV/3DOQPGrRmINdDw1J1jKb2RYTwzE=;
        b=hpkfftyafZbeyIG4GKkfoevKXrMI8ItyZDbPV/JClQViKKV12Xi8HiwFwWcZwniBve
         BQBBVJz14QZccKQGcFJjPFXGZS2yKW1kqxQjp9ZjLykgGEvd874tgieBn0UUi2+P0KpS
         1cydMSTQlX/z9lR27ckF3wlB36kr/0WWW9glVzJKF5reGXW2+2Et+ABJPilTPouuHPrP
         Umcu/DXHJTrbVbRLSOybSJ7UHtAfVVSZX9G37VIR6fVhKQQGYapLEd3rkPL6E8rTTtU1
         MrUcV8ZsXeSBNi6w5WVocj07ODaQ7jNOSrr6I8MhmMTLyIEEEcULfzA+bRbWYZyOuvxY
         iyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mXfcbebF4+diuiV/3DOQPGrRmINdDw1J1jKb2RYTwzE=;
        b=I3Fr4VQV+uQNmjo7423NTI4p9gXhzp+xztOoLofltvWKk06z0clVyR2z+whEoiST4p
         PBjS9Evx36JIUe3oD7bUF6Crs5sr0M37GbW7eewTq5S6sdUnhPBu9r+FyH5Wq/SKKybM
         Uns9KZpPzowiNWgzGCOcfrqhCQoFG9akLks+R3KjH6VdwvLLEJbfJY38nxzyPbrW3OHo
         IYTqWuvN7j3urOpMCW2tQUI4YkGh5os32lMHrpDTTsw1dpvCElzv9xZg0by0Y9vYuPUp
         BdX1Q67N/sRS2FC9ELN5LejLGjy1MbP1vwSOXue63+dKpFL341gJnIqkmzDgjNaTLjdx
         OaSA==
X-Gm-Message-State: ACgBeo2I4qJ/taTfnn51H+STij6+l0mu0Mgt7/x0j4KS+8sDf5h3qAjZ
	x94bw5SjIIBLhzh8gacsvnSlDfY+dJE=
X-Google-Smtp-Source: 
 AA6agR6kAmmzqjeVzNDAAUMos+8mmzhb9g9TXPQswO1KhrMzb/53NuWzDgfztMrxvD2q4Ec511SEfw==
X-Received: by 2002:a17:907:2cc9:b0:730:93c8:4177 with SMTP id
 hg9-20020a1709072cc900b0073093c84177mr12187880ejc.494.1659940998537;
        Sun, 07 Aug 2022 23:43:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 43/44] webkitgtk: upgrade 2.36.4 -> 2.36.5
Date: Mon,  8 Aug 2022 08:42:36 +0200
Message-Id: <20220808064237.3975347-43-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169066

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webkit/{webkitgtk_2.36.4.bb => webkitgtk_2.36.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.4.bb => webkitgtk_2.36.5.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
index df4ff63121..b3fe357010 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "b6bebe1f85a479d968c19e44a4704622ef8cef61636ad1b2406b77d16ae2e2a8"
+SRC_URI[sha256sum] = "d5532fa884c943dc48f1911473dd663aba407a3b35caa7b04bac1419b41e5908"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.30.2


