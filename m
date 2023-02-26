Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B605C7EE31
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:16 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.69611.1677430992870919457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1iPTTtXH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id ky4so4431778plb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5y3YkZzz4Q89v2UOoh0dXSVc8XDxWFEQH0UKrxRY0dU=;
        b=1iPTTtXHmYMquE87ce683WW5nm+IFNSifXifkXKNnUoTC8yYyyCR79i/wIhNzjbz8e
         eA2Zvk17h3r9LWAC4DYsKLFb4XWKmAKKzl6aVR+pJe89o7GI3ch5O6aH+xhG41N2URbF
         D4B1FzUDqNUD1m1EPdA4PZ1EV6hQmyYIeRhoR0/r//knpAuxQ0bIJcmmtTPephgWlcY3
         aFjtm7HqjFue6ZUhXJgoRk//qCniyKxCihtBOIt/9ouGuq/ppYY1vauW2LXzqdP2y+OI
         g02AOtt0x9q125pp/b4iFYnr+DWodVjKMWAF7BmobkQmLrIstG7urrflOUd5JGnJkXYp
         EVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5y3YkZzz4Q89v2UOoh0dXSVc8XDxWFEQH0UKrxRY0dU=;
        b=WUHIdnrSpXq80YLeo84QKSMBxwwyr/Z8lj9ioCqUEjOZ17ZLFxdrulWPdYXB6Ryevn
         szrxBk9GQi9CqM9IMgU2IKPALDfDBtCHM1PsPKR/kaM5LWdeu5sQLWSXr/9GcyK1dbLl
         74usL9NWXs0rpMfviY3QgSiReFJnmtb69g+WwfZHbK9U//pWhOMikInnYgVnHXgM5+Gp
         a0lAD8RkM0dHhbeuVBeQ8+toWHfWJBWA3vaPVicAox3U4gNcMQtXI6w++ando7asnC2o
         J/BpnJxWaNko14LSgGIPU9V2WNbZilDTlIM2f1j01T8wD2BSEzCSxvYpJ0jfZQ3PBoHV
         /sQg==
X-Gm-Message-State: AO0yUKW/lAZhZ3m65jXH6ICZ8z7zFfgYGhrzG6Y4NXsehTmwnDWkwaHb
	dJl2yeA29MQwIi0PdFcbosYVBjYSO2+R8vp++8s=
X-Google-Smtp-Source: AK7set/Kg1STAbWbaPc+da+Gytdky22aqLpvwPzC8mZsaayvcPbCW+itlpV4v/fTuCNQ8tAsJliNHw==
X-Received: by 2002:a05:6a20:6918:b0:cb:77f0:9a42 with SMTP id q24-20020a056a20691800b000cb77f09a42mr23951400pzj.33.1677430993667;
        Sun, 26 Feb 2023 09:03:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 24/28] cml1: remove redundant addtask
Date: Sun, 26 Feb 2023 07:02:20 -1000
Message-Id: <70051189bb4ecae5475ce45eabe37113f417257e.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177762

From: Ross Burton <ross.burton@arm.com>

The configure task is added by base.bbclass, no need to do it again.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d7897bcab2b70d850bfe02ded42b20eb695eda8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cml1.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index b79091383d..a09a042c3f 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -21,7 +21,6 @@ cml1_do_configure() {
 }
 
 EXPORT_FUNCTIONS do_configure
-addtask configure after do_unpack do_patch before do_compile
 
 inherit terminal
 
-- 
2.34.1


