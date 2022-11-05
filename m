Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D348C433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 09:15:52 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.4654.1667639741228090213
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 02:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fGQ/up/9;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id j4so10468732lfk.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pbrWpSGYuAtPmHOglYvsNVfIAroue0J3CA8mMA0tTGY=;
        b=fGQ/up/9JyDUyKFro5fSAec8fZgTgb2vBSLyPEEcuS3RKr+U2viosXScOecPkhyel/
         4et61PfJiVV0QNloGlB9Hxi5YvORSSv/UrCWMBbOxSNdy2it8+DQW5fUp2I06f0ZYIYf
         1ataCl3IGWsqlbCBPEfeOEisAzygZMDWZWL939LrUuhdyWXjpWlBYc+na5vqjvK/dGvF
         vuK5ALmsMhuMzosLJJoIDXp4REicjzkuY5umA8JhWYcPqBn46fArxusvMFflplam9iHY
         KIV7bm2DzdYAsNO61R8ZzXWOOIh4QfP0HP2HRKGYJmGhmXap+YYwq1hzPTZr/m8vpJVO
         TTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbrWpSGYuAtPmHOglYvsNVfIAroue0J3CA8mMA0tTGY=;
        b=djGR0tF6NC75CBLii7alDlnHPC3xSQPePorTu2DsED8pAcXfBl3yT6jlulJhKssI07
         D/zyXmHC5wl0tbqzbfRp8MRcmE1xb/gEUhcmqYBcpHTFdJeXMDPZGNcrfJZlZD6m2n6/
         +/C1qsfFHU/nZmc5murdIQDntJXF59+euctID9sRhDYMN7HV1TDCS73TMqqBAWRavEea
         ZfsRG8C5sODp6y+OwGRXJM1l55nbuvWLmT3N9p74ePJnUoTfsfisvcArMaKWhFxN+fbk
         o+M8O7e8l/oV98V8wg3gpxROahlkM6XDltcQR/iXpqwA/IdzNBRY+1nGJVTr5Fl4VEVk
         KhpQ==
X-Gm-Message-State: ACrzQf2giAqxnTyC9pemW58FtgebGUHHHLeksFznsrXbn28JnBqA7k01
	OxKiAYidOyd2b6vNVRT5XqWVpqRsxmlbLg3PCA4=
X-Google-Smtp-Source: AMsMyM7S+SBCnFMwd9etN+HasdEBIWOQEJS9Ag1Leoco5tsmgGNzF9hAIGr91vHWSnMROK8gbhIx/aYKQVX1rqtSBY0=
X-Received: by 2002:ac2:4c8e:0:b0:4a2:7d0d:c7a5 with SMTP id
 d14-20020ac24c8e000000b004a27d0dc7a5mr14455623lfl.367.1667639739375; Sat, 05
 Nov 2022 02:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_j+_yUvihYHYJomTKhpzJdMZkDydLxuKqMV3J0A4LGhA@mail.gmail.com>
 <31379.1667639507546247461@lists.openembedded.org>
In-Reply-To: <31379.1667639507546247461@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 5 Nov 2022 10:15:27 +0100
Message-ID: <CANNYZj8L-JWuB4-3vArEv_DdgjjCVUVK6Ly8+k9Z87=cRHx0nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] add python3-brotli_1.0.9 in meta/recipes-devtools/python
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 09:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172739

It's actually already there:
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb?h=master

Alex

On Sat, 5 Nov 2022 at 10:11, cp0613 <cp0613@linux.alibaba.com> wrote:
>
> OK, I'll move it to meta python in meta openembedded.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172738): https://lists.openembedded.org/g/openembedded-core/message/172738
> Mute This Topic: https://lists.openembedded.org/mt/94823104/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

