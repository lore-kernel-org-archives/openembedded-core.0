Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A33C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 11:28:49 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.115460.1669634924813160791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 03:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y/h3GXKv;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id n1so8077276ljg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 03:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UAkLEP7EpPgxipAw6j/GG15yagHKZNF/HMYsBadcKs4=;
        b=Y/h3GXKvRpEnDnO/TKuR2aWraFl9S7h3RVeFejqo7YhqVFMBYkrfogou/09DTsrITL
         E1DXnDLQl3IdrNKPUkYsC/XEg2g8T1ct55uIKvVkeIxcxE3cqk/beQjnA61gCgVSES+l
         ItFD1lQLZtQyxiM4BECQBPRnS9G7HfPY1itjJGZmAz9/0bFj1KJYM/vfvHkinJ/5wLaf
         KTebAwIYEJj3P9bj/z7fufJLA/ejrIC7lkYWQdkHojGlZPnR4oH23hVuDTaGWTcrgnIM
         uiCR69w0Ft/6E+IPvJEew69foKrqwguZFsQl92/sL4DVjM4lhraKewA3uA2o7jOCRGLq
         NOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAkLEP7EpPgxipAw6j/GG15yagHKZNF/HMYsBadcKs4=;
        b=AM4+Mj3JjtYNxmgwrz/I8JQi0htiCIgpZrDJVGQ4NTH8x+I5stddZzuWibDwpPHvs8
         JtqE/9FD4bD6RH5R87Mfps6qCq81zN41w6oFgyGKl1J3i9yjwAc3utbkWF1XfXkIcwDV
         Ny06+lGXIXxzOgLBQVHphr23Z81+AwQ+p/mmRWyj3cz1p4ISe+Gde1Mujzciz6Zm6NLg
         BhurJWx8JoeF7r2/7JAhOC/bzCR66M6uNy2DHLW1A3jRxVbK6UwvQuRCdnK9WvUQvv21
         KZYmiKxSVstYO+8mJnWTeFlI1FB9xwCLI+eWehECY5Q492DPEClsYTmYyTSSHGw6yVOt
         tYlw==
X-Gm-Message-State: ANoB5pkbjiKyCEo+So8lGXphZlaJMJ8WkCoBdmhRMOxUIr607070z1iZ
	tZFvTnp9RedAWkOE2f0f6/AMNJFtB09/mD+XQRY=
X-Google-Smtp-Source: AA0mqf7kVTwoXEA8M/fx050khWjSWxhWESMRZVzoknuQP4/5xtk3lsqhC9GkKqNReAbnQ+Hqkb6P/wtoUWZeotQ2X48=
X-Received: by 2002:a2e:3a07:0:b0:279:43be:97d6 with SMTP id
 h7-20020a2e3a07000000b0027943be97d6mr13901544lja.33.1669634923005; Mon, 28
 Nov 2022 03:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20221128112232.123025-1-f_l_k@t-online.de>
In-Reply-To: <20221128112232.123025-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 12:28:31 +0100
Message-ID: <CANNYZj9OzcCqoC9=cDcMVPDc85KZbuWuksekUgg0YhDWsG+TrQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173908

On Mon, 28 Nov 2022 at 12:22, Markus Volk <f_l_k@t-online.de> wrote:

> +do_configure:prepend() {
> +    sed -i "s|ssh_add_path = find_program('ssh-add', required: get_option('ssh_agent')).full_path()|ssh_add_path = '${bindir}/ssh-add'|" ${S}/meson.build
> +    sed -i "s|ssh_agent_path = find_program('ssh-agent', required: get_option('ssh_agent')).full_path()|ssh_agent_path = '${bindir}/ssh-agent'|" ${S}/meson.build
> +}

This needs to be explained. And we need to find a better way to do it,
preferably one that is acceptable upstream.

Alex

