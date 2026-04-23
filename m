Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76D0F99372
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:15:13 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16102.1776938652111028721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 03:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aPBASuZX;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: zizuzacker@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-827270d50d4so6026356b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 03:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776938651; x=1777543451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbNmtYpOA3mHXGP+dxSUSWoVkVPt2e5+kxSc10nJi5U=;
        b=aPBASuZXt4UdreHgFjtHVVYtszPAaPF4aqs3KH3MYLCO7yTbg740jbmENHORMJeJTa
         aeebzrRikJ0Jg4bOeNXS9kNKl6ObSMSPUWElmBJjyw15NY9jxeHZvu+tx7unfO9fPS1P
         WUauJuE63CanCNnok55zkOw1nVIqSt27omTHirsJVwLZUi0gbJDL4OaeHWZ1gVR7sz4+
         eZZMqZyQkY+isX8MA1WkjgFsz2UrfI4dPCQCiCm+eIlB3Sv5LdN+sCvA9mHNcWVqjLZy
         IrHnKmvuWUkLr9JXq40N68HogDPTDBVeya69vuC0K7TK18VVM81LYANFpXoKkwBAly/H
         Fmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938651; x=1777543451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZbNmtYpOA3mHXGP+dxSUSWoVkVPt2e5+kxSc10nJi5U=;
        b=HdrRQDquRpwdjh22D5AkYN4rp350necUTKYHmUdzeGF39B3y+cCd5q2sqEDIidiI9U
         bS5maUktvmtnHBY6uJSAdjl1mcBQ9Ly4t6d5I33vAWOyYZ+ZwdyIUZnYQoalkoQawxP8
         mSBvw9l3vOmlJeyI2zgldeLR5SjAl7rUoxD2zdY6TOiPKUNcUKYE6Zpo/lXrTF1+5dTX
         vbWH8qaz8yKXWPnhAyH2smmiVBlzw+o2EkTvElI3fBZOgI02x6/eeingVMMZw8wfPupA
         BXzeA87y1HGdYuTZpSkkysaG2kdDzIXw4q8AE1S/iLaiOZRVLAsDv/3cmUdjAmHfT3gJ
         1Enw==
X-Gm-Message-State: AOJu0Yw2voHfEEJqbEzyDET7IG33rMS9P/DqpMpFBLPGCrCUaGEBnku2
	f7Ul3WlJqTo9c2kwvOzTA1oQ9uZtDo69USmb5K2IRwWHWcduWpQicqfqFkHVaydP
X-Gm-Gg: AeBDieuHZ3sCkCHintoPK5qdAVev70gKxZ8SpCObbPehGh6vwx/hFaVXaT/lGIdEmK9
	0KFlLi7BPPST/qqJE1TvtOBcGwvjWLkKBIcmGIjGtJYMuLBm0oMEw0CUY4czhbYhha+gARQLXq9
	KntlpCY/sSxa/UYzOPnDALujKRsVUBe+0sZKiA9D/AOAZZFLUvKABoWWQ2lZU7P56mPJQux55sz
	TnnACEI2ohn85xZfiFnZV6anaLAw5uWV0hIRQ1GdGwPBkWDpMfv3Nm/wt/dIamCMZaY73TSkPaT
	GwciWG17V30Ei5DVxgQfouF+TZf2UmJQwNFve62ZufOoisJ1wHx59y7heerV4/QtJxjLxhAQxPk
	dhmZEsGB0XrBTBby5ZeQaF4D5jxiaFV5RIh5zOU4LBiTJm/+6mZlIiyla9Iz/mKgHIi26A50SPK
	AxOJaON7srj8iHs+i4yv6k/R1c
X-Received: by 2002:a05:6a00:3397:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-82f8c821430mr29516939b3a.13.1776938651283;
        Thu, 23 Apr 2026 03:04:11 -0700 (PDT)
Received: from ltu.. ([42.118.25.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm21540801b3a.17.2026.04.23.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:04:10 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	mathieu.dubois-briand@bootlin.com,
	Nguyen Minh Tien <zizuzacker@gmail.com>
Subject: [PATCH v3 1/3] useradd.bbclass: allow inheriting with only USERADD_DEPENDS set
Date: Thu, 23 Apr 2026 17:04:03 +0700
Message-Id: <20260423100405.25255-2-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423100405.25255-1-zizuzacker@gmail.com>
References: <DI0BXNU5HAFH.348GL3QVI6JL3@bootlin.com>
 <20260423100405.25255-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 11:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235756

When a recipe inherits useradd and only sets USERADD_DEPENDS (to depend
on users/groups created by another recipe), without creating any
users/groups itself, the parse-time sanity check incorrectly throws a
fatal error about missing USERADD_PACKAGES.

Skip the USERADD_PACKAGES/USERADD_PARAM validation when USERADD_DEPENDS
is set but USERADD_PACKAGES is not, since the recipe only needs build
dependency tracking, not user/group creation.

Fixes [YOCTO #15863]

Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>
---
 meta/classes/useradd.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 16a65ac323..9d857a4555 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -212,6 +212,11 @@ def update_useradd_after_parse(d):
     useradd_packages = d.getVar('USERADD_PACKAGES')
 
     if not useradd_packages:
+        # It's valid to inherit useradd and only set USERADD_DEPENDS to
+        # depend on users/groups created by another recipe, without
+        # creating any users/groups in this recipe.
+        if d.getVar('USERADD_DEPENDS'):
+            return
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
-- 
2.34.1


