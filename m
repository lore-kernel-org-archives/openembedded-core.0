Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B7CC7618B
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 01:03:23 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.2190.1678928601491835043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 18:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SjVRLdLl;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so32270pjz.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 18:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678928600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXRslCxGl+qgOW5PbY93zjNke969mT/FUjii8g4Te7E=;
        b=SjVRLdLlec/nGYqqpKydsFw660eLF8M5VfODy3cwVt3fQjYnzVWEPnKvpXXqBvYv8Y
         G67+vjjAiEFrj8mpCr2gA2D71IjAngcW0pOByx9D8DydXPhI4RLbZGzi/UU/Na77s1QB
         ELs90q0Ul1I7eQgqp8rlDTSBBIf6hoVEEX34UoXu0c7V3w/aIHfiz3eTBY1cfttFfBP2
         iq4HQQaSaIlBQmIMIKtqqIItnkLrKWmnOe4gWPi0nPyiz+tkmgejsWyPV7WVkCOQ8whD
         WZzK6ovC+ZGCyxvHQGFM7DPqw1gUld1O9MHAjW9IKo/HrS41td2LTKEUwBdW7/IUI0FZ
         xcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678928600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXRslCxGl+qgOW5PbY93zjNke969mT/FUjii8g4Te7E=;
        b=FX5QhVXXbvORLnLE2AKQ1he66FaNFmIlHdHmz8o935XLT6PaYRKkAzmvSJDcb2gtCy
         LaVatyi234LjGcZH5r6daQm40fh5K96DujH/Hfv+Oi8TebjAypg9rtIC51WFQkY+KCWa
         R1MNvzIn9PzJQg38QIPt/po/9Qw0a5gxDD2A0Xfn96oH9tPKNvtyYNpySJMOl1+7FX66
         z/ombanILOWHyp6KE4/XI6DYKUpDinWAczMh6GfvhZg1NfFL8u+ND9xuXaIvJhX3Ihpy
         Ko9elleF0gXdvctAt5aPmzcPjrFMZ39dC8gHW647i/6DLDwRYWoxgHqfY6/eFsRBoocQ
         OCLg==
X-Gm-Message-State: AO0yUKWswOE/Ce5zcMmQoGIIPOyJ9s8XONIrHbSFDHaVs3PvWhS0/kr8
	Uf8AzYkLTA8JsCXF8FiLMtn/y2ne2pw=
X-Google-Smtp-Source: AK7set8LnWed1k0hA2YdxkV6AaeSWKjwqsanehdOcDa9LUyz5l3iMPCiDeDg/56nR4NlFt5nc0QBXQ==
X-Received: by 2002:a17:902:ce81:b0:1a0:7602:589e with SMTP id f1-20020a170902ce8100b001a07602589emr1860427plg.40.1678928600513;
        Wed, 15 Mar 2023 18:03:20 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:66f1:cb87:4495:5f63])
        by smtp.gmail.com with ESMTPSA id kf16-20020a17090305d000b0019309be03e7sm4240035plb.66.2023.03.15.18.03.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 18:03:20 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] python3-poetry-core: upgrade 1.5.1 -> 1.5.2
Date: Wed, 15 Mar 2023 18:02:59 -0700
Message-Id: <ac88a968568448e6c6f55a1a892835ec2caab468.1678928363.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1678928363.git.tim.orling@konsulko.com>
References: <cover.1678928363.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178668

https://github.com/python-poetry/poetry-core/blob/main/CHANGELOG.md#152---2023-03-13

1.5.2 - 2023-03-13
Fixed
* Fix an issue where wheels built on Windows could contain duplicate entries
  in the RECORD file (#555).

https://github.com/python-poetry/poetry-core/pull/555

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ython3-poetry-core_1.5.1.bb => python3-poetry-core_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.5.1.bb => python3-poetry-core_1.5.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb b/meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
index 952ffef99da..738b9786900 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
 "
 
-SRC_URI[sha256sum] = "41887261358863f25831fa0ad1fe7e451fc32d1c81fcf7710ba5174cc0047c6d"
+SRC_URI[sha256sum] = "c6556c3b1ec5b8668e6ef5a4494726bc41d31907339425e194e78a6178436c14"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-- 
2.30.2


