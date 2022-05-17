Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53983C4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:57 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.1201.1652811947159833340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7sSsU030;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id q4so18066249plr.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Xyp0hU1EG4qUW8gKmnQYaw0CeoFYYwDELTpn3NJ3hwA=;
        b=7sSsU030rO4yNZlJFkGfS/nfGyTuapeaBRt+Q+9IBFYV7cLv+O22vV81IRqShd1+hy
         /Vuna0b8TNYd3V4p5CIH0zqguhyI6tNUmj03M3N78uChZA8gUr6F81Dl1UHWbZIa8+iZ
         IPnrl3edQ4BMRfsgtFoPVvjyn1he8HXI4yG4ezvqSNb4Kl6QIKtkfN0h0M/oix20GcIz
         1gykXsTfawp9py37UTSblwSN255fE8Nu7OqiCERJDq7DCTLHIGBADGq6wZr2lshSKUth
         olmVPsPMkayvJHUYSRYZ8hqgO7RMyuMCL0DLGzWcGdnqKxGf40kyozbv9NfS98eoifyV
         Rntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xyp0hU1EG4qUW8gKmnQYaw0CeoFYYwDELTpn3NJ3hwA=;
        b=u6b80SeX3Q8WXVYS2UafF9injQhAonRbzUHoiPAQ6eF9AwZfs05cqMSGn9BkJe6PiT
         wt1LDWl8onPehkjRnI68YVLKKB0TxBJ/Ba3b6syHAivwGDsVLPV+K29yiZ+oe5w/WTw0
         3c9AdRB9BfPId9j5q1cx4196xvKr6Gv1TUgapup7a4NKhwQ5wkhxid9v+t5DZXmqfZz4
         erIh8w7bxsNbzvx7USCeKECuyGkgsVm6TM33O2A7vsrrp4rVOEnjSE3eqnpI6jQ21LkP
         gacj4IgX2kRZCSqG6g9kq4WoHol1KSlzinMMbgCvDEu9L77w5Jmk0Aa285uMdgBYGl8a
         WMAg==
X-Gm-Message-State: AOAM5310fcUXM5L03Ix5Jgbb+rEUqYzIKyaPZ0l5h/pHuKlPWRdBIgU0
	oBaiiBlY3oaWlbaw0TKl3XYRQAORUUVYzj+6
X-Google-Smtp-Source: 
 ABdhPJzR9gJptk1KHPJTVvtsIWPcTFLg5nuwqXdw+23XQ3rK/6a+L6AlfRf/tYvzOrWw0PuDBUjkNw==
X-Received: by 2002:a17:90b:1b0d:b0:1dc:672e:c8c2 with SMTP id
 nu13-20020a17090b1b0d00b001dc672ec8c2mr26561651pjb.96.1652811945963;
        Tue, 17 May 2022 11:25:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/31] sanity: Don't warn about make 4.2.1 for
 mint
Date: Tue, 17 May 2022 08:24:14 -1000
Message-Id: 
 <eeba7fdc2878b3c1e90c0babbcaf7711a2e42fc1.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165773

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst not a supported distro, we can exclude this from the warning as it
is debian derived and doesn't have the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b561e40f906737eec81245c6a12e78501311f667)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c72a7b3ed3..b416918013 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -470,7 +470,7 @@ def check_make_version(sanity_data):
 
     if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
         distro = oe.lsb.distro_identifier()
-        if "ubuntu" in distro or "debian" in distro:
+        if "ubuntu" in distro or "debian" in distro or "linuxmint" in distro:
             return None
         return "make version 4.2.1 is known to have issues on Centos/OpenSUSE and other non-Ubuntu systems. Please use a buildtools-make-tarball or a newer version of make.\n"
     return None
-- 
2.25.1


