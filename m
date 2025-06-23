Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F646C7115D
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 08:42:38 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.15093.1750668152520981639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 01:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QociT34m;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6faf66905adso21741496d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750668151; x=1751272951; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D6y9D+O0g+Jefpq8iFeuWv9Y/Dq29KJsGAla5HQ0FS4=;
        b=QociT34mKsjog/ysR+Zw96RwpxbFXq5tBA6ZG4canmJ2fy8/H3pmKSAR6xb+/jP+9v
         0VNre2BPRMyFR0eweXKtyn1UVsf/XPTPUGg8RGnwvphEBKVHDOTs8bV3B/Bxp9O1+H4H
         eSl7SEuT1+rCRLeRi7wgCkfxhvlj4g8PIH0Ba69HPoEUqQ62Xy3AtSB11GcuVpV2cFvu
         P2IC0wlTQc/QjeamAIWotqTVeAZu/NxQEpCTAQyjXkn0lf2xIsMroeELK0aCax0tY1Il
         0IPE/tZ3/cE+FqKBYqSf6xLFXz9ZOq4fjsflznGLw7WVBXZavG9K5Gpns+ezPLiQLcdK
         LDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668151; x=1751272951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6y9D+O0g+Jefpq8iFeuWv9Y/Dq29KJsGAla5HQ0FS4=;
        b=K+1rGiTa7aICgfMpt8iHS+f4MyXBBjiYKg+qkRUN29bEB4/wgWtMDtw5861MkxW1yO
         UueGWGNzGmXjjHt/647NUYK4BZQvRC1PtBvaVcSgOt6hFE9ohePmSRVbatDz/mNdWw4w
         lrjjZMv3JUwzIfda+9Rg3eoBrOIbJ+Xb9N46OMfDOxCN+DYI2bZGF7Jc1SGxXUuj2hXU
         BXvx8CbhbBknf0MM7484Jtcmb0zmgwJI1gnrCiKG2/I7X2KIv+dVSRFi4pkHoxl7v+sk
         ywoiPGsGIEiCb0/Q2rMFRpeNw9qLhhipXwRLhnRFDEnbiYUgpTOX8gpaF8aBWd/VmSyb
         agpA==
X-Gm-Message-State: AOJu0YxED8TrZe+oKTE0Psv5Mq95fWMiH+AdboHpf5ZZVJ5RqXJSDM9v
	6D6fjz/Wp4mcsCYdNjFml8h9WFqQs7JhXptGeP3wOz9+o7nzia8NtmKS4stHUKHPC/90nPe6gDU
	eowNw8ynLKKhR89+GmOyXy4hit43qcU7WjazG
X-Gm-Gg: ASbGncsbF5zy8TCW3yxbk9pfleuohcE5uDlEr7EzxAO+t/iWqq4+uwnqFeV6DZQSAhw
	ltifGTxDVAT6KNS+wgRVk6/GJE1tgx/ppWmRoLx992Hn17Nb4RWUZARdz0OxqVKi+0cNVCQdVjU
	2EVl/s6QtvhOfUVaurseXGCDack/+XBz+hpjFVYOvG+gvhAr5hQ03smrRINytjgyhuxuWAFTf9i
	cBz0w==
X-Google-Smtp-Source: AGHT+IEQsLiUb9lmY+jdx/PE1TKr3l41VPQUFxf7InhcriLPWccuSVjiZ89WbQmP3DrQ8qvTckcWGqm9UbdLdAgsHms=
X-Received: by 2002:a05:6214:2463:b0:6fa:cc39:9f with SMTP id
 6a1803df08f44-6fd0a5784c6mr211869116d6.32.1750668151301; Mon, 23 Jun 2025
 01:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <DATR2GJI4K9U.17X02XHLY2PHP@bootlin.com> <3500.1750667907206854771@lists.openembedded.org>
In-Reply-To: <3500.1750667907206854771@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Jun 2025 10:42:20 +0200
X-Gm-Features: Ac12FXzFL0ElD-du3mWNs2DcV52Pq-Lour0MeVBr59Bg69sNQgmJe8vKKERc5AY
Message-ID: <CANNYZj-n89VkgOO_CrVkXcgeTkrQxe6jxRpuL7vmZUZSHVz=VQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] kernel-module-split: fix conf file
 generation when KERNEL_SPLIT_MODULES=0
To: dixitparmar19@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 08:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219204

On Mon, 23 Jun 2025 at 10:38, Dixit Parmar via lists.openembedded.org
<dixitparmar19=gmail.com@lists.openembedded.org> wrote:
> Oh great!
> How do we typically verify when a patch is accepted and applied?

git fetch, followed by git rebase? or look at:
https://git.yoctoproject.org/poky/log/

Explicit notifications would be nice to have, but no one has time to
do them. And the real issue is setting up gitlab without upsetting
existing workflows, which needs a motivated working group.

Alex

