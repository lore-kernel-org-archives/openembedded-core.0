Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B57C87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 08:59:10 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.96586.1755075547693218167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 01:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BUAHgG/u;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-7074bad055eso40152686d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 01:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755075547; x=1755680347; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1IVCS4mzyM5brduJU/MB8Ulwth/RSZIBPEH558d9MLQ=;
        b=BUAHgG/uR+Ui+0oUC3yr5XeHlTv+rxCKFGLXmTWGvwWj4jfyLaOIvFvIa77XXQFebp
         KgGCC3kJwrTFiOW9hHsnq6mfLOoajq3I32B6pnuySN7Td1uwTWWxpCPxBZEf3I7fzUOG
         jxrQtVbNBlrpL7HHvV1HK6xhnqsYQkUi5/vVYsUqs2diHG2xQyy576UREJTw5EPGkNW0
         ZenXMPfSQU1gnYLfm0bioxPT9PBzv7RM0ZZAUZgloU37DhkkvLHB/n+fpYAYTVlkCoPn
         R3h8DmYIt/t2VZTy4utjPuL87ZJOYO9lYvYnJplaYphKK8s5OKUriuzkaHgIgj6GT7k9
         KnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755075547; x=1755680347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IVCS4mzyM5brduJU/MB8Ulwth/RSZIBPEH558d9MLQ=;
        b=eQulp53VXDcldSXlNPejmgGu3P6yukN8JKqUDrx68kkXLEulfVlwFojaQpPZ4MHhHI
         c6/hfcpvUWM1jJgpinzrtLeksZNgavYMJ1g0VwsfhkEx2VP2+9czZXIB4lFIolDdQWRw
         Wb+7MQqd2zU3qk9IT4NKtdKeI10b6jQ/j3dBoCqSSVPdA5T5bf+yNIbQuJoztnfr2xFI
         F8izu3pWcuumddt6w3Jll5iPZLXCuHwmdUNaGt6mNZIkoCMM+DlNAT3PzjwQyec6rjSo
         n8TrG9RWCGiIY0ZVYoQ9qAfkVTMVPDKErY8vmWGNg5iy6MDCDYXv1Zx1T67ZPV++cbk/
         QeLA==
X-Gm-Message-State: AOJu0YyOiD+0jc3WkUdJwKvgq8nKUMyJJ075lRqnttA5DBnnoowE08Af
	6UrSl9njQZievA/kyivuv9O0kNGGzcqt51c8L79B/eyGkR17bCoMAQ0Jt5hMecsVjxleICjNcD5
	Aw1feGPGECbQV8R/1q4RYpWFjg7zJ1GsiVw==
X-Gm-Gg: ASbGnct+NdZgqFZTXSmzgsvD/7F+vRs5k/6GbqaezkmFxbh8fMU2+RcR3tBbjv8orgf
	Ic7sVgzQyJtipBq2gwj0e43HJnfmVyn49qhcap7MK5J0RGGSIiL8k2DlrISFJdWp7tRdyDAab4F
	/Ju2hDSEX0lTaijrrjXOt+aI3YQKfEgzXhSf7Di+rZUC94VJVeLIL/Q7lOh471wxQEq2UDRfcvq
	/CZBSF141Lxx73kvz2dX7eLAft8FkCjQeeIfuLVut8+B1MxZcIx
X-Google-Smtp-Source: AGHT+IFnUdfTN3g7jQLcoi1E63SXLLhLfy8IBfc46Mc6sieRnO/NUl0u6pIZbj2D+/qZKJ+PagKPBTzUW/Z6kqz8czU=
X-Received: by 2002:a05:6214:2b0c:b0:706:aae8:ad48 with SMTP id
 6a1803df08f44-709e89a5a2amr24827116d6.35.1755075546625; Wed, 13 Aug 2025
 01:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250811040339.857858-12-vince@underview.tech> <23953.1755049905508910253@lists.openembedded.org>
In-Reply-To: <23953.1755049905508910253@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Aug 2025 10:58:55 +0200
X-Gm-Features: Ac12FXzJ11DxqY1KEfLg6sShfakoisBSFWXe9rR96DbfKhDuisZhvvkFeBmaHDE
Message-ID: <CANNYZj_4XRKQwf+41WQEAimu3_Ex1HqTcyPkrhBFUkk91RX6eQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 6/9] bootimg_pcbios: add funcs to configure
 booting with grub
To: vince@underview.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 08:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221792

On Wed, 13 Aug 2025 at 03:51, Vincent Davis Jr via
lists.openembedded.org <vince=underview.tech@lists.openembedded.org>
wrote:
> Terribly sorry just now realizing my commit message uses
> "sector(s)" instead of "byte(s)".
>
> Assuming this patch series meets oe-core submission requirements.
>
> How do we proceed with updating commit message?
>
> Want to request oe-core review panel
> update the commit message to be
> "byte(s)" and not "sector(s)" so not to
> re-submit patch series.

You can fix and resend a complete set as v8.

Alex

