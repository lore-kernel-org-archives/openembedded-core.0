Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7246ECA0FFD
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 07:14:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.4235.1693638842212509686
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 00:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VYgn2uph;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-401c90ed2ecso27807785e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 00:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693638840; x=1694243640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCSfO3mlQT1dhAjOLTzifp/fkG9k+dKxnf6EyXEuvQ0=;
        b=VYgn2uphVnDHSzIwFwxAid2DlskyBKSfKgBUsr0/H56QyoiL6D6GIWYqeiM0Hqlyry
         AehDyOwyayxSjxDNAiZxe4mcz8+VoQVeJqIffVXtdfmI+M3fP7V1tydnHyyvnzQYwTEU
         gQbkbyFJ6NBdFzy0x7bAV3wMZfp3xWqS6bWh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693638840; x=1694243640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCSfO3mlQT1dhAjOLTzifp/fkG9k+dKxnf6EyXEuvQ0=;
        b=ehrBBvlY3aIngtEizkDeuXO3O31vkvDZlRbtmJj0vER0euNAR29ChALG1RP1hbwFBs
         fEkxVNQEzmknFtCn0h1zhtcVwri86zuONMLdezXNbwqCVnPTtiBmpJ8xCnUgqTEritU/
         nyKaBpcgYODXblMYkfADHOQK0wpI64eCUwkVtPd6sK70KllgZ+qcddRzHfnTlD2bQEOx
         qrdXbc45CrfV41+EAP2BYPAgmealWKnNQKwCFtb/fw47w3ECLdqGgwxokH/wllrpoPLB
         307G4EBiQ1T0d0682nKoqbErhHAXKC62nITljLFg9MVJSiewERr0ICJsJjxKBH0Aq1G9
         DmTg==
X-Gm-Message-State: AOJu0YzCdFPWFtQUZF/N3Ll0BnijTrzw4w6En1HIOpjqct59hUvkQ0nN
	8G2tdTwYFLOP33UZ2T/U3DwgOg0EIBuBsjPZfRQ=
X-Google-Smtp-Source: AGHT+IHC0/WI8Nt9VeZTpatIORNzcpoTGAdbZmDdVsXO5Hri99167FEfP3uIFc1FiAmjc/bs1wxCvQ==
X-Received: by 2002:a05:600c:225a:b0:401:b204:3b97 with SMTP id a26-20020a05600c225a00b00401b2043b97mr3529082wmm.4.1693638840188;
        Sat, 02 Sep 2023 00:14:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bb30:48fe:2031:d024])
        by smtp.gmail.com with ESMTPSA id f7-20020adffcc7000000b0031c7682607asm7501861wrs.111.2023.09.02.00.13.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 00:13:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] Add DOCS-WIP
Date: Sat,  2 Sep 2023 08:13:57 +0100
Message-Id: <20230902071358.2409016-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 07:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187022

We've needed a way to queue/note/sync docs changes with our manuals, migration
guides and release notes. Add a file which we can use to "stage" information.
We can then ask users submitting changes which need docs changes to add
information here. This will then make it easier for the docs to be brought
into sync as we'll have a much better idea of when something merged and
what changes are needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 DOCS-WIP | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 DOCS-WIP

diff --git a/DOCS-WIP b/DOCS-WIP
new file mode 100644
index 00000000000..0e2baf9e0bf
--- /dev/null
+++ b/DOCS-WIP
@@ -0,0 +1,4 @@
+This file is intended to note docs changes that are being made by commits so
+that people working on the documentation know that changes are needed. This
+includes entries that would make sense for the migration guide or release notes.
+
-- 
2.39.2


