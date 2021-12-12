Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B34C433F5
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 12:20:36 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.33418.1639311634550357065
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VOYhxHKE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id c4so22574236wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 04:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vqP6wJ4B5Dizwp5a+226tMDtbAFsKzDY5ABYcfknMME=;
        b=VOYhxHKEgIaLQ1nLMz9+8T/umTifdiXqgSpAOL5trpb+Jglq9k9O95hjk4pduGt71q
         +DeGEC6y4zlsj2nasK+pgjsM9vG+1u3cYPeS21tgklrZ6hewrTT8ndvTbaQ8AuWTnRR7
         ojz75ORK8+TiCrlteoYtfc+Xmoafytu3+l4yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqP6wJ4B5Dizwp5a+226tMDtbAFsKzDY5ABYcfknMME=;
        b=ifBG1dQpfdjowSaEgiPtVofa6eSmHF9oiQpeCF5O3Ru69Y7lpnhBYSdqMxtessCy67
         2ZSZwSFV7/mFQY9cPCcPtwshOymaIQ2QHkqjiG/hUZ+dtyACL9PP7YHsF0exCiTEXEBX
         xSiT6XJwG8a+pa98HewSFiQmFMjTpyrQACLfKtDTHDek3baSmuVz0P1e6yPT3WUC3go6
         SHWVDj7FbLR+2JDlivNADGDTIpBKQYscHj2rds433vHNR9RPoXwbluq/CrmFHRrI9wwM
         5cVD4BuC+5xxwkVPQJrrsN5R3YGrzW7Wjswt5ktjyHdMGccnvOt4ZZdZVMQPYZrr2zp6
         rEnw==
X-Gm-Message-State: AOAM533Iit05PWvSgaaCNltgP+WMO8Hu60SsBPE9eyMVqr5CeXCM2UPU
	L78Eikn2Hqd0inZXUPNJ/4HL97ss4i1j1g==
X-Google-Smtp-Source: 
 ABdhPJzQRpTycikclXyz9TWOSOhGvse/oj9WOvZzDZTB3Xcv83+5BhhT/z+VrwcseXdFxTfavs38IA==
X-Received: by 2002:a5d:4e10:: with SMTP id
 p16mr24870989wrt.454.1639311632688;
        Sun, 12 Dec 2021 04:20:32 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:dd:524c:81ce:484c])
        by smtp.gmail.com with ESMTPSA id e3sm7557515wrp.8.2021.12.12.04.20.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 04:20:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] patchelf: upgrade 0.14.2 -> 0.14.3
Date: Sun, 12 Dec 2021 12:20:31 +0000
Message-Id: <20211212122031.734474-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211212122031.734474-1-richard.purdie@linuxfoundation.org>
References: <20211212122031.734474-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 12:20:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159581

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/{patchelf_0.14.2.bb => patchelf_0.14.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/patchelf/{patchelf_0.14.2.bb => patchelf_0.14.3.bb} (91%)

diff --git a/meta/recipes-devtools/patchelf/patchelf_0.14.2.bb b/meta/recipes-devtools/patchelf/patchelf_0.14.3.bb
similarity index 91%
rename from meta/recipes-devtools/patchelf/patchelf_0.14.2.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.14.3.bb
index 2cd51298435..5d41c5edfe7 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.14.2.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.14.3.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            "
-SRCREV = "2ac5798fdc79762ceee520b2b3b4758f7f97b17e"
+SRCREV = "bf3f37ec29edcdb3e2a163edaf84aeece39f8c9d"
 
 S = "${WORKDIR}/git"
 
-- 
2.32.0


