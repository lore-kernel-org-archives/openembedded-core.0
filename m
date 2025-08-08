Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4426ECA0EC0
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:49:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.17679.1754642995009838659
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6Zpsbwf;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2402bbb4bf3so22959505ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642994; x=1755247794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TZofw14SzG1UPmEVIWyW9VjhjZBe54YMK3FzEUSST4=;
        b=J6ZpsbwfGbDArczGEglyTlwJRnnNHZkffFgchzKhRrJJZPp6Ox4jx2GSxnUSG2Mc/L
         AGKRsQ7CIzZ4ic2ThIOXql3f9ZLygv3ZqIW3nlWyngVEIeXeR/4o4l7HUJacNtwvQBlR
         NFApCLRqOhvxCR7uSaCw6PoEfHWgb16+YebxvDBuYxVVMmADX3b0QOgS5uu26QYko7wA
         TCg/DFF1xu2DiZDKrOLyhNDLmgLvWqSkDuttipM2QfRN8kA7K8CFwxaap0VNrAB2P10r
         bfm6Gsy93ynQE+sSmp/7TC/JkZEOxtaJtFSYWHlOfkrMpsXqlPM+b5jDkVOTJgczNSf0
         YK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642994; x=1755247794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TZofw14SzG1UPmEVIWyW9VjhjZBe54YMK3FzEUSST4=;
        b=MSZHpuoMZmXsT3rHFSeeyHoTyGIFyBWcTo+jdZ0V/eFUYC+pxSkKheC8Blo+ShajIE
         66mHDG857phGE8qKjDdQWB8zptcRyggFBm3+KGz2ZJueurRuVIa3liYjgVQR+OpY3TaF
         wWVn05IIU6f6Z2imzj8eQ2GrM00c8gdVLl6jckrfvfdKo1uNuSLlUhkaTc3Td50zIV1t
         W3GSaqpo1L5VFvT18LBlpx2CMhu4V11952WqYHecap//bh3+qE+ciWqq3Pt3gj980puh
         OYJ2Qg1OLbjh8Gej7BUxp9KnynE5zzNHersamPwKiNcY/yuKJsLeU8XhQ36iiO4+wZc4
         KfKg==
X-Gm-Message-State: AOJu0Yy7xAujEO9TsGun49A3wDjsN80e5CqP/50G5pfkw4P0T/ORyaBF
	j8o02T9fXO7hnrrFwCUqpT8GUj1rL0pJrFNTuavP6V23vpHtSTFuZ0Unyl40Cg==
X-Gm-Gg: ASbGnct61nAAJe03cRel+c/ShUKjt8cvcIgwpvVkBCAIaYGpo+HKYjC/A0Y8MTIkpm5
	11VUEJIQ83AiR70Ffo9EtqsvS2pF3vePA8X75HnK2Lr6tFws2sQdlLf6+zhmwjjfWgjAJjwuz26
	2oRu1Fhdl8yI+vEcVq4gHGA2fKndJ0S6avGR9vETZvVB2vgIFElQpEOiCR/XOjXdgKuxO1koPFe
	RRYPmFpsHsD+JTtKMw/IKmKQoRoz8hDEcBfHe7JdiS62rI+7zsGm35VXXuFD7l0yW4cGy3SxLhs
	eIu7jvCtaOKfHZ0NluvMysfegOOPBP6K5oHPhxVxT9LD2Rv0JniItTDF69A/ow3hi4pighZZXOV
	01CXa6fOdQc1omSZ8IbyK51hNE6L4WLMA
X-Google-Smtp-Source: AGHT+IH55Sa2kiIA7bfXMafeTFUniznALH7rU0FRmu9qx8s8K5CEJDbz8hHx+3Kx2IlxL1Ws/H9dAA==
X-Received: by 2002:a17:903:2a8b:b0:240:2a0:c449 with SMTP id d9443c01a7336-242c1fdc1b2mr29844735ad.8.1754642993961;
        Fri, 08 Aug 2025 01:49:53 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:53 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 06/23] bitbake: git: Clean broken symlink
Date: Fri,  8 Aug 2025 14:19:14 +0530
Message-Id: <20250808084931.2156763-6-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221603

From: Robert Yang <liezhi.yang@windriver.com>

The file may be a symlink when mirror from local disk, and the symlink will be
broken when the linked file is removed, use os.path.islink() to check and
remove the broken symlink.

(Bitbake rev: d0deb5fe6e7a84b07b49ef685b209729d2fdc780)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0a45ba64adbc279928a4347c5073eb78da1bf00a)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 0ea55e139d..6badda5972 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -733,7 +733,7 @@ class Git(FetchMethod):
             to_remove.append(ud.fullshallow + ".done")
 
         for r in to_remove:
-            if os.path.exists(r):
+            if os.path.exists(r) or os.path.islink(r):
                 bb.note('Removing %s' % r)
                 bb.utils.remove(r, True)
 
-- 
2.25.1


