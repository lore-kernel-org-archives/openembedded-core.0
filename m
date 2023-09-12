Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BBDCA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:10:56 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.22425.1694517046483437168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qVj8DCH3;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bce552508fso90101561fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694517044; x=1695121844; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VK+IrVI7ufJJMWkzBP24Hod0hiRqoSHQDSxntzJ/UzA=;
        b=qVj8DCH3YiiUXDRj4y17gyehI6vRQXtb4xEZm60euXI3PeeTgtaZDmKI14FgRRwF69
         0KvW+GbdAhm55AR+fPrVkEcl/vR/2QzWNQ9G7Is1nkV+pj3XE6yzAS44nkHb0y5ix9eQ
         viN9CL2bjj47fdOGEmU9gG8IVs5Bpkhalf32NDY5RZCocMJseBS9iIONNK+OPZoZLToU
         cio3RCOiAnKeuF7Bmr3F9vu8T0tgwe2S+u/EKonTGQ2oxk+MOIWEgCDp0qySBs59OxMa
         0cfbCjCTUsGq5B3q6J1a152SZvELl1N8h93Hf8ojQjPbQ3FMLHnuvB+QD5hTtC0QjFh1
         ZhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694517044; x=1695121844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VK+IrVI7ufJJMWkzBP24Hod0hiRqoSHQDSxntzJ/UzA=;
        b=Go2FxG7nzTxGlEstGDZ2r0SC7nZWQrmEQvK/Bd2wtwU5zdjU5C7iTwHC5ugNt9QJ7s
         a4a9raPhDQEoP86f+OPjDuFY33O3xc8JZlg6qHF0L8qwl79isQVpAwXi/poSbzl7ZJXk
         XY6T4s2x/IMB6Ko1yJWhQCTXAzoLM/zXyitoGCOdCc+KYCFfCaYx2x+8mAJjSeNgwBRp
         ICiLlZP0D51Ndk9r2s5c0375Gf7gLMwhIcG+gXLUp2fZi2fconciV+2FsxmsG0uGaKKI
         MwSR5HEe4UKKh/Gmsjl1zQcowQRoLrEU+Q4Ju2ZVIK0ctRsuf9z8H6EhHTeGVvdoMP7v
         XF4A==
X-Gm-Message-State: AOJu0Yy1ybhQVOB9Kp7ijjounHWRmie08c76cvDB42orgVJdPV7wG44l
	tsC2h46rIPfUBJTJUnPip9iSXbyCck9eCw8ox6s=
X-Google-Smtp-Source: AGHT+IENYDwXnmxq/lUexKZkUbvfB5zCGCD0kGRyKp9G5YAHbqXhPJTmBZM81YGfC7g6hVBQaEw6ezF+JJjmhJ7vEBE=
X-Received: by 2002:a2e:7c1a:0:b0:2bc:c846:aa17 with SMTP id
 x26-20020a2e7c1a000000b002bcc846aa17mr10251729ljc.41.1694517044154; Tue, 12
 Sep 2023 04:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230830141512.656130-1-alex@linutronix.de> <082C37B7-684B-49F1-BF8E-A0891EACABF6@arm.com>
In-Reply-To: <082C37B7-684B-49F1-BF8E-A0891EACABF6@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Sep 2023 13:10:32 +0200
Message-ID: <CANNYZj_5terzF7i0VZjXgi+iHmLMBsZZNmHOeUE-rsnnY7YMeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta/conf/templates/default/conf-description.txt:
 add a template description
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187502

On Tue, 12 Sept 2023 at 12:58, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 30 Aug 2023, at 15:15, Alexander Kanavin via lists.openembedded.org <a=
lex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> > There is a need to separate the template notes (which are lengthy
> > instructions about how to use the template) and template description
> > (which is a short explanation of what the template is for).
>
> What=E2=80=99s this need?  I don=E2=80=99t have a problem with the code i=
n the patches, but the need or purpose for this extra configuration file is=
 not documented or explained anywhere.

When a user needs to select a config template or get an overview of
them, oe-setup-build (or other similar tooling) would show the notes,
but not the description. The code is written and tested, I'm just not
sending it because feature freeze:

https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/setup-layers=
-tweaks

Alex

