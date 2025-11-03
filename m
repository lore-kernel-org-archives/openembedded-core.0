Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3397CCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:16:59 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18160.1762168613484796413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 03:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HXivOc20;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4eba0adfa04so57969711cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 03:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762168612; x=1762773412; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qa0u/N7Ju0yvyTK33mmaRc3UVuFhAGRO1WvvsH58DzA=;
        b=HXivOc20EKdCv+/YYd5zFAFmzgrV+6u7GFmJByUItfSlUnrfZ+l6odTxcU11LXzUDQ
         eBrThpJoDAk3NARYeyDLS4n7QuV8ChySZ/OJ9cB9AhOOV1XzGi4nT+Y1Hp0ZVFFyEEd2
         dI5rjjnxs6cC9ovsY7x1KKe4QlrCAi7GlPB6IKCNidk8bLWLcM5i4Raz+JF1/ijvTD9l
         GM01xXNNNSu5leSvH86ph21pOXq5HEoAX9EAclIVz1TtrbOrkZBHDzZ9D00s30wZqnDs
         P0OpgaArNttUKFNBNYRoq3ETN+tvzl+HYCkEHivZhKLo6ZlaKfG1iL1KR/Wbu/VgCoMd
         l0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762168612; x=1762773412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qa0u/N7Ju0yvyTK33mmaRc3UVuFhAGRO1WvvsH58DzA=;
        b=JfJ+xF5aLjmMHp5gQY57x7EtVfP+NdpTrOibnvA5UOaI/klOiSLn/0ByLUgX20QAQW
         cr5g9HC+hYevU+8L316iR8j06pP7hN17Qe+LpOCtCPu9PzY6wpGDQiaRtqdYaI9RUmqj
         jSnEdZiun8bvlr97xju8Iulv7OoS3lYDdVa3GLd64XA4b7cmjIE05saTAo3amP6fVRGS
         QZRYNbQzanCHMb+S+dgj2hBJEYJHbQauFpzwwvtua3Tz+iBTlRlPFe+S2J0mvnoiekiK
         /qlETcLXeGqhQrPQbJHmI8GuQPiBxnnNNBXy9D8e3MkbEm36tKV6L9T8STAXS11/sZ9M
         GK9g==
X-Gm-Message-State: AOJu0YyK582gSake+ahQWJPFflVvb7Ks7e2jpalSvlHETvxrk14Cbrge
	lGcN6J8OQFNSIkRmWcr22MP5faSqqVkbuMuHkHD7WPuFsYtTs5c0MKJ+ISzR+tLG8Gq+rbG0cTp
	La5YfLYG4g/zLbCggv7AKZCzucAkgbjw=
X-Gm-Gg: ASbGnctcuDAlr56tQJWlCIlmvtkpwwW5VEP4K+3P93V+n8oR0l6NEtdD1ftZl7ikIXa
	NLn6ZmTOFIshwCWaO2wMNbIbJBMIi5Mko5EmOLdCOK96IL1AFbbj17O8aZ8QcxwvouAeBw6OZZb
	wGitrrmnx5Jx8DR3aWLvGm2GSsKCdnuIkb2HJy8VMWiq56PzRTkgYb7rNhRwOMZXmntwiukDOdJ
	sZOxWekJpuW2HtJBMvJ/GTZA0PMSu3IUsng8/BDTT9mqz2rjor3N90kI6IW9uCO2Fzq/v8sIR9d
	mMrATx7GHiVxqMIoBmcMcDz4lEXzxw==
X-Google-Smtp-Source: AGHT+IFf52mZ9FK9bOTlXExoOxDT0/eGQiKcibFsCGKUMqboyL/AJOCU1szQbjfhgHxDDQkmgmPg+/Ht84oD804xRDY=
X-Received: by 2002:a05:622a:1ba3:b0:4e8:8c99:832d with SMTP id
 d75a77b69052e-4ed30d92a2cmr154521771cf.15.1762168612379; Mon, 03 Nov 2025
 03:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20251103080410.2025712-1-zboszor@gmail.com>
In-Reply-To: <20251103080410.2025712-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Nov 2025 12:16:41 +0100
X-Gm-Features: AWmQ_bmxwlH1NZSUD1ZWwkm2sF8Fu4uzt-tSMua2L-p2f7ZxgSPKy6C8ArNc_MI
Message-ID: <CANNYZj9WdjNNdaNTUuhL=J_TJf51zfOONb0xR8X05QCs8ioiRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta/conf/layer.conf: Avoid adding build deps
 of rpm-sequoia-native
To: zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225645

On Mon, 3 Nov 2025 at 09:04, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
wrote:

> Avoid adding dependencies of rpm-sequoia-native into sysroots
> as it needs none of its build dependencies to run.

This needs to be a bit more specific. What is specifically installed
into sysroots that you would like to avoid having there?

Alex

