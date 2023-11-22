Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166DAC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:08:57 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.15986.1700647734123854851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 02:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y6TlnG8r;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso83679011fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700647732; x=1701252532; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yaqa36cqsGJFiJbk88BWuzXzD4Jx1GWl51d4T17kBBw=;
        b=Y6TlnG8rWtUR4uD2tSMmUW+c7+4FoSLfEmG/lSmo6WLdd0NoTVj+9Vl5oobe9TuRP1
         uNbSZdZQ1Fv4PNNfmH33qDZXRnuVbfeMmoI8ZYJh4fVMTZ1k6ukPjaqVNYHH21Ez1L9e
         iNoAca+emlmzE1llxyYUEBajWk2a+o890yhRDX5CT1+C11t/LYJSht79eVFi9/rR/vcX
         a8k4NN1tVqn6fluKXyK6rWNWXJvvHRyD7PkFJ8lrGyR3vMk39TY8Azbm9KdC/No/8HCr
         NjgsrPd2MN7O2glTrtYOnJten6Va6WwlsuT0yxhJcTNl9QAJG1PJ0UX3+aPG50l+vV9I
         4J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647732; x=1701252532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaqa36cqsGJFiJbk88BWuzXzD4Jx1GWl51d4T17kBBw=;
        b=Kxo4Ct14YeprLKQk7XvgWdcqEcI9o+QHb6tqHmCOZ2/ckq1x/Icoy62l6QZDlDK2iG
         NKX6uNxitboJoxidEQEu1EDZivrsFNpT5fpYP5qGD2ffOgBVx14t5+cINcIIMCteNkFi
         D/Sh4JkfUqN7RV25AmJQf/umvoU42GRuJyHbU3zM6Tirnt3WuACsSql//+46L0lIBTgG
         kgJM+WppAdBcBZe8+FSIwQFQvJVZ4KWM9oObWSDJqBNU/d7OPJBV2BrkNolKMP72drkT
         H5ajleknoKoGxs/p+tNYvqJfGuHcBqYCxRDc5kLKAvGhYW0LrcJ7vDZym2PfkmXq2C3k
         XoNQ==
X-Gm-Message-State: AOJu0YxEHCkXyryqm/1sdbHZA6aJXCcbG/81pwn5bErYgDH4CKASvaGX
	P6dWkPh8h5hzITr7CLUFPVUc7zpy6gQPacHz7Sc=
X-Google-Smtp-Source: AGHT+IH8bX1A6xEggeOXZdKqZXQ3jtzr3ekAVRKQaNTiLqrWr9TNYX5s1DHlvOWZTVSfaYM7y6Ry8T4HMGCYi/zcvXI=
X-Received: by 2002:a05:651c:1a25:b0:2c6:ef8d:b49d with SMTP id
 by37-20020a05651c1a2500b002c6ef8db49dmr1411340ljb.24.1700647731810; Wed, 22
 Nov 2023 02:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20231122095931.1866607-1-zangruochen@loongson.cn>
In-Reply-To: <20231122095931.1866607-1-zangruochen@loongson.cn>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 11:08:40 +0100
Message-ID: <CANNYZj-+AU_ipssf0wRJM7arN1q6xyhbmVAjaBwY1Wnfk6=oRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: upgrade 0.189 -> 0.190
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191050

On Wed, 22 Nov 2023 at 10:59, Zang Ruochen <zangruochen@loongson.cn> wrote:
> -From c5fb59ac0819b5b6d8244c613cbcf92cb09840c1 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Tue, 15 Aug 2017 17:10:57 +0800
> +From a54d70478157f3528c2ed73afd57020b59571fc7 Mon Sep 17 00:00:00 2001
> +From: Zang Ruochen <zangruochen@loongson.cn>
> +Date: Wed, 22 Nov 2023 00:52:53 -0800
>  Subject: [PATCH] dso link change

Thanks, the update looks ok, except this bit. Please do not change the
patch authorship: the From field with the author and their email must
remain as it was before. You can manually insert the previous lines
into the file, but it's perhaps better to check at which point it was
rewritten, and see how that can be prevented.

Alex

