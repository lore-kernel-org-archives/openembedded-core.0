Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFE9FA373E
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:24:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.19769.1666621488212009746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ztMVVem9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id 192so1936153pfx.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0Xanhy6qrSHj41+r0cUU8EyNgpPQl8TMMr5IKDoxX0=;
        b=ztMVVem9ctKhboDBXY6VTRMlZOJbFDrAX6FhWXIBUROuX+e9W4Bt1sEiU4HdtpuNav
         2gTymRADzS8SlauLWFwZjmJjTEPC/ecGOB7Btfouy3t+coR9sOYfUSpM1GamjlotDAIc
         HSwAiMS79OOb/9EMINgWaMMyL4GQ3x6AoJhk26rR24osTaXilFcHX2anPc3xdyZPf3Q8
         9wp9GwpBkYgdrhDwQ1YiU/lOStiftI4BgkR8L6V8reXIFgosoCK0twMWs2s5/+RaiyuG
         eScUP79/rRDih11gwjQlxH9FGM8FS15Zz5JncbwpkpxoVLD4zNkaWZ1g4B9g6519uymr
         6LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0Xanhy6qrSHj41+r0cUU8EyNgpPQl8TMMr5IKDoxX0=;
        b=beNc+EKStUhmHZ9UDncboh8rP6bCu7ke3790FFAHIEsNXJ52oJa7fYfUbkFnMX7SdL
         OUnSIbRDxefarWleD4BvO/MCh0IW4ChAXd4JCi3qWhEftd8Z3sojvCRndsN4YghCphcN
         64oVwe6YU7CebUbAiRlBwmab0ctGKr+pLAZbPN4O00GeejUEJQ1uJ9BU7FnpNR5fF//Z
         EFBxr3aslVpAkBPPDR41UtNhT6GCsOwswbnHiEPRvEXrIQXGqTesoZgBwJWO7jPfGqwB
         DgG76A+hGcybpgzxAYeH2kjRiID4DNvYc0HfuOfP6cNoBXRDAnsiGjkjr7jVKTd1HoJ4
         G/4w==
X-Gm-Message-State: ACrzQf2zq8PSK9oEUAUAOozgs1dkEmGMBrhO3yKpPkNJJAEtG6DqTB/q
	Tl+37AjS4phNkdsH38jeb4B22bHcW7hrPjLC
X-Google-Smtp-Source: AMsMyM6HXmb1s31p9jnRgxmwJ+PkPogjHVATgt63LCXPT/zdKBHl7gDNmUjpzxn4Wm2/s+Ger+Wqdw==
X-Received: by 2002:a05:6a00:1946:b0:565:c337:c530 with SMTP id s6-20020a056a00194600b00565c337c530mr33407296pfk.47.1666621487251;
        Mon, 24 Oct 2022 07:24:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b0017e64da44c5sm19704457plg.203.2022.10.24.07.24.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:24:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] dbus: upgrade 1.12.22 -> 1.12.24
Date: Mon, 24 Oct 2022 04:24:18 -1000
Message-Id: <f00cb90cb4169ecbc003c61b50ae9e0dd4b75254.1666621276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666621276.git.steve@sakoman.com>
References: <cover.1666621276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172094

From: Omkar <omkar.patil@kpit.com>

Upgrade dbus from 1.12.22 to 1.12.24

Fix Below CVE's:
2022-42010
2022-42011
2022-42012

Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dbus/{dbus-test_1.12.22.bb => dbus-test_1.12.24.bb}         | 0
 meta/recipes-core/dbus/dbus.inc                                 | 2 +-
 meta/recipes-core/dbus/{dbus_1.12.22.bb => dbus_1.12.24.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.22.bb => dbus-test_1.12.24.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.22.bb => dbus_1.12.24.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.22.bb b/meta/recipes-core/dbus/dbus-test_1.12.24.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.12.22.bb
rename to meta/recipes-core/dbus/dbus-test_1.12.24.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 8219f0875e..82e91c7b13 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
 "
 
-SRC_URI[sha256sum] = "8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474"
+SRC_URI[sha256sum] = "bc42d196c1756ac520d61bf3ccd6f42013617def45dd1e591a6091abf51dca38"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
diff --git a/meta/recipes-core/dbus/dbus_1.12.22.bb b/meta/recipes-core/dbus/dbus_1.12.24.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus_1.12.22.bb
rename to meta/recipes-core/dbus/dbus_1.12.24.bb
-- 
2.25.1


