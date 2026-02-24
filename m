Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031C8F55425
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:02:47 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33591.1771974162271005205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TCdmtnR9;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-463a94f8475so314140b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771974161; x=1772578961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofuA+vdR5ppDkJ6wNzst3Xp9U6VbeNhNiOC7BQ8aiWI=;
        b=TCdmtnR99BOhWxV/gUf6GXvFTkVRHvh57QEtfUvFS1i3+EhI2voh4luod9XbiWdsaV
         iO57Qs+oytV0f2JuD3o5J5H2/g7aXyWFT40AmPOc17h7p8kqZPg47fsDHMNoS8+shz0v
         0xyWcTqkctT6iOajtiP9ZfhreySiAlBKL0Nw5kZZUN+Z0Lq61T+Ir09X28pQsBxZrPnO
         9QRfgsfwM4KMIAqSR8yli4aznNhPaWfA+FaEdRQlQiF5PLKrdzZX9zxBe1Kk/Ef/WzD+
         GfdZ1yWEnv461alFuyA4aIPzCw73MXSP6hYaM8UiofOKg70biAIIMqEDGpPI0rShKmL8
         /2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974161; x=1772578961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ofuA+vdR5ppDkJ6wNzst3Xp9U6VbeNhNiOC7BQ8aiWI=;
        b=S789P8APkDWEhu5GLTUdpYrXrXoK1oX8WLLGGjBQBCa7CRlvytG8SLVo0NEVLzuzku
         NPbTdaSTeRWtfpp9rYejFlvx53Aq2eI4nkAKiFPMMhed7ldwcKg3i708taBff+9KDwIy
         PvQk7Qkg3kbGw/1LEyoVa/Il8rVyD5XAZoTZkDWGcTbC+1zifUHwlQkSCaYINPSoYBXy
         fqwwq4yt2lWxbFHb5S13aRU9a7E6wZ9dHplUOh+HAtXwQ0s+NnVD7OsiX8QrG1vL1Leo
         LAaJ3It3WJcW0zUVxcrWqUykaZay0794iMH8wyjBWF87pFysIfSBjLgVv9JGXDgWuX0S
         WB5g==
X-Gm-Message-State: AOJu0YwpX7oqsQor9OXqCIALJmQw+xSb0JbDcAeWFGGX+3RhuVNRLS8S
	/G/ZeeOWhX/aKv9OhgLBDqpyPKJN1zFDEoVyzs8BnwhUAfFnWWO8073jytNYKw==
X-Gm-Gg: AZuq6aK29JZqjIT8x4g/8Q6hd0CSQSch8jqi6+LB/XVn5dRQ4ymVWLaxivphEBMWuH0
	RZELNd3fwtufukxL//D9Em8EMh6rRgWbRsVYWr8nqkrz0z39ciIGvBUv/JgQgnhap+TuS43hpds
	OIt3wyd5KMgXdCO5D+0cpZ94lN+pPdnAUw0coNtKwRu23A5oTyRPe5qektaBnGl0IfrUVcPoVIr
	DzhGle7SuB21G2+N75bmSz63Mg5qznTsQQhYPGJ7FS1eKgsABb4GtJqbBJPvHRootdIzwaxzxl2
	JOFQxnY5rxLBX9BAAl32aVzWgJKDj0EvkFX3CsIz4mOy/R+9uQqkLdQ/wVFPocSwds1m2sW/BVh
	l9YUNMgr8V7fBU3MC1cPDPuEJco0751BQ4gp/m5oDurl636G/VFz7ykbjbrIua/w3PVh9gOz1ft
	pttxs9rci2OtzPs92XrFkinYR3/u7dzrA=
X-Received: by 2002:a05:6808:179a:b0:45e:b4c2:ff58 with SMTP id 5614622812f47-4648bc84d14mr1024923b6e.10.1771974161296;
        Tue, 24 Feb 2026 15:02:41 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a1efc76sm7912024b6e.18.2026.02.24.15.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:02:40 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 0/8] Add SPDX 3 Recipe Information
Date: Tue, 24 Feb 2026 16:00:13 -0700
Message-ID: <20260224230234.679049-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220154123.376880-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231909

Changes the SPDX 3 output to include a "recipe" package that describe
static information available at parse time (without building). This is
primarily useful for gathering SPDX 3 VEX information about some or all
recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
vex.bbclass.

Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
helping work through this.

V2: Fixes a bug where do_populate_sysroot was running when it should not
be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
incorrect (this is already handled by bitbake in the taskgraph, and
doesn't need to be manually removed).

Joshua Watt (8):
  llvm-project-source: Use allarch.bbclass
  gcc-source: Use allarch.bbclass
  spdx3: Add recipe SPDX data
  spdx3: Add recipe SBoM task
  spdx3: Add is-native property
  spdx30: Include patch file information in VEX
  spdx: De-duplicate CreationInfo
  spdx_common: Check for dependent task in task flags

 meta/classes-global/sstate.bbclass            |   4 +-
 .../create-spdx-image-3.0.bbclass             |   4 +-
 .../create-spdx-sdk-3.0.bbclass               |   4 +-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes/create-spdx-2.2.bbclass          |  12 +-
 meta/classes/create-spdx-3.0.bbclass          |  75 ++-
 meta/classes/spdx-common.bbclass              |  16 +-
 meta/lib/oe/sbom30.py                         | 192 ++++---
 meta/lib/oe/spdx30.py                         |   2 +-
 meta/lib/oe/spdx30_tasks.py                   | 487 +++++++++++++-----
 meta/lib/oe/spdx_common.py                    |  11 +
 .../meta/meta-world-recipe-sbom.bb            |  26 +
 .../clang/llvm-project-source.inc             |   8 +-
 meta/recipes-devtools/gcc/gcc-source.inc      |  16 +-
 15 files changed, 615 insertions(+), 245 deletions(-)
 create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb

-- 
2.53.0


