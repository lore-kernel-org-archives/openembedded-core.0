Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6887CCA0EC0
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.17692.1754643024862239007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F/L+VIrN;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b427f4a9652so1769533a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643024; x=1755247824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZs6TGjYaZ081FSWxT14xbCbpWIPZvh6J4LSGL+/NOQ=;
        b=F/L+VIrNJbjbyDteLn0YHD3tpju4+GrQcHH9dHDUR0Kj6JdLc52dAMKywyN0KrN9gz
         tcjOyzQIYdEHFa39mkmj+04jK2DNgIjrWYzgywEiCHWyMapCiN31UGIp2biXeccDAhDJ
         LQB08te66Bvhye9lb9Fu/GnSOLfH67W2CCOX6QCvl5KQUE9V3fPtYYRdDaACmqq0rxp7
         tr17Hvf1upoiiML8jBbVbD6fsX8rYqCudRaHDLG6UQ2pe1P7hoTJmvxP7U3Nb0iVElo+
         ca4JtOeFpQY41rC8vE8Fxh5otUmbphGHpWw7xGtWcwaHkZBgojmtoJbT7+fVZ3hA2oxC
         XXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643024; x=1755247824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZs6TGjYaZ081FSWxT14xbCbpWIPZvh6J4LSGL+/NOQ=;
        b=XbUqqT4pD7NvmFAyJOPntsUgpnkNX19Vxsuqq0LXeQJntcn/nrQm7X0tI3vIISDpfV
         ROjbz6RgeLgCCfDM5qp0US43f1qBejANbh+dasNtwgbD/xYeoG/Cn5VKCO1h2SQJkETi
         IZMrL1B8TL/OmROgVlXFSuAAxDyQAor+LNlIPns+dZYKKbn5b5oQdN+3K/VOVYY/UtEt
         O0yByl0BZOqOnqJ6kBIuvLZHXXy8vS94eVbaYa3Ab1EBiKtoEP/Dgf8fpsiCVXi+XTg8
         Z2a3QfJaJDtu38hCwZ8TjvJlGO9MzVBmBrAunA07Ww5QTuEbsWgfmq2K5AEzrbwtNClM
         kQ0A==
X-Gm-Message-State: AOJu0YwSlYneTLt3PAA/rOztQT0Xjf3OMqgPeXy4KOXkfQgKLDaVDUzb
	x6a8dwEHaY+t+7Ad05CUI0MqLTKblUN7MYNFLUptoaAnhO6t50JACtfZEuNo5A==
X-Gm-Gg: ASbGncuSoetT71R4Rk6l3DFbsRWWNbgU1Il4VnmMYM3SJqMgP5QSJ1BooZ2F67ua6NQ
	DXeUH6PE1Fc95OPc8UW7qbQG+ChyV5GcTTRkt7BG32Tvf82QmPlWtHad//NyF4PcnPRJy7/NFur
	H3R35tuZdOufa9syRQSjCAs/DG3K4ytXylPTdd8AOp32m26B/mqWA8Dnkk3SRneJgkK2XMcFHmi
	jICwgNZfqELrHTO4bNSS+Qo8zoPu9RuLXx8YHf1YXbZP8+EtSkrR6aqMQ8QyIfgCjrtb95YO1go
	HRT5zIPIXwe98VkTOM4ndpB8SJUD8IfpGZAUFQG3iazzxDqQl4pKkbckvh/Q+2rBbQ6S1ED2KQZ
	WxVEAZN6hui3GE4eOATiQfRXe/YObYczvp2NAKIYAChg=
X-Google-Smtp-Source: AGHT+IHa/VPsVK0w/atHqxIQ2BsqJ081LdMzGHw7tV8BMlciJNyKXwblNwubK/LC1AMwwVdDpMQ9LA==
X-Received: by 2002:a17:903:1b64:b0:240:7f7d:2b57 with SMTP id d9443c01a7336-242c22a0552mr27951975ad.28.1754643023881;
        Fri, 08 Aug 2025 01:50:23 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:23 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Philip Lorenz <philip.lorenz@bmw.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 17/23] bitbake: fetch2: Fix incorrect lfs parametrization for submodules
Date: Fri,  8 Aug 2025 14:19:25 +0530
Message-Id: <20250808084931.2156763-17-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221614

From: Philip Lorenz <philip.lorenz@bmw.de>

The existing code would pass `True` or `False` to the git fetcher. As
the fetcher expects `lfs` to be set to `1` this always lead to LFS
fetching being disabled.

(Bitbake rev: 5e487a5a096400271ed1e29b0df72903f2304e49)

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb6d89e9e6f27b683da6f2ba2227707a965a0094)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/gitsm.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/gitsm.py b/bitbake/lib/bb/fetch2/gitsm.py
index 1c58230eac..992de8276a 100644
--- a/bitbake/lib/bb/fetch2/gitsm.py
+++ b/bitbake/lib/bb/fetch2/gitsm.py
@@ -123,7 +123,7 @@ class GitSM(Git):
             url += ";name=%s" % module
             url += ";subpath=%s" % module
             url += ";nobranch=1"
-            url += ";lfs=%s" % self._need_lfs(ud)
+            url += ";lfs=%s" % ("1" if self._need_lfs(ud) else "0")
             # Note that adding "user=" here to give credentials to the
             # submodule is not supported. Since using SRC_URI to give git://
             # URL a password is not supported, one have to use one of the
-- 
2.25.1


