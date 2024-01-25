Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA36CC47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 09:42:43 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.13720.1706175758460173866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 01:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FWrygbza;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5100fd7f71dso2289349e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706175756; x=1706780556; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=681akCdgCMvsL8qe6GDrefzJY8eEnZAcH48A3NtmylM=;
        b=FWrygbzanS1E02epfpqaEH76CuCOqvGJFdYNZnzpfNFED9ri6Tnh+I1kBsVhSBXa0C
         gSJ0p6ARRbwdSTL4+Ocwr0tQc6BgOPvC6BBWzThlF+5Z4MfbmlVAYzKIRLJ8+NuSsWNk
         Ycze2/XqG7XcUhBcHBSkwcDFYsolxB795Rh3uhTfWqXoF568FfUcDgsTBtaTQjLlv/A1
         7l4gNWtyhha91HoT+Mtx9CQtNoMh8HnhkfwL4ryHxYlsEVD+zPPUQmoAp/Vci1tPTxlX
         Cpnfsop+rMb1dDcSDhQyF9tBfHrWBWWt0DJrcQliwBuBKEczztfm2KEh/Gry0130O2Ir
         IQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706175756; x=1706780556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=681akCdgCMvsL8qe6GDrefzJY8eEnZAcH48A3NtmylM=;
        b=ArZ6YZ+vflJnIW1bTw8U/2UgXaGBmXqhUim52NdIhMuRYtRMaRokLFexxLkNHZfIUQ
         5foiKXta/5kxUt6flMegSu0wNsbXbOaX1gbW/FOXIq3t4UMzmTMBdLQKQ0lYpWvLsipu
         MFGMH0d30Bpqv7Xy9ZNDIpH70UiH86dt9et1L1lf2rktdmv/WemIaGRbgxd+RBcRmo7P
         hsfMn207NnKZ+UwH8WQ1LHpXy9/xraSK/zhNVgy+4Padx4tvFiPb/R+ft7KTc2sISMou
         gtBtConHAKScFqYBgc7cugJAa3pjZ85Pb2q+7KYWEzgv1XC24kvPPdbrTXr3itbxV14x
         9aGA==
X-Gm-Message-State: AOJu0Yw7qOBzxut3wdRPLn85Kzb5GKsXQrluq7tNLWlczZEP5UBxEqjV
	vhviWcwmu6SnsW2cZzUFu4aXKKOHZfZIZcxyJU8zJsIHQJGvSNBLkJI99vgp8evV6ebCnu6rzHj
	WsaX2Ck3JjM3MEZxs3qXLySKKa2I=
X-Google-Smtp-Source: AGHT+IH+jKs74+5jZrKbPJ/Gr4Qi8zCoBNdV9Kq1waXPJ1G4/rlclI8ZcyJmc5QHUBi0MRS29kgi3W8k6Som9qTm2+w=
X-Received: by 2002:a2e:9592:0:b0:2ce:9:bdc3 with SMTP id w18-20020a2e9592000000b002ce0009bdc3mr366318ljh.71.1706175756356;
 Thu, 25 Jan 2024 01:42:36 -0800 (PST)
MIME-Version: 1.0
References: <20240125092554.3657475-1-mingli.yu@windriver.com> <20240125092554.3657475-3-mingli.yu@windriver.com>
In-Reply-To: <20240125092554.3657475-3-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jan 2024 10:42:25 +0100
Message-ID: <CANNYZj_FZz3+P6FnpgmOCA1yXpB3WdE_60Vh-SWHbLy4NvK1Jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] blktool: Make the version consistent
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 09:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194315

Doesn't this also break PV monotonically increasing?

Alex

On Thu, 25 Jan 2024 at 10:26, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Update the version to make package version consistent and there is
> indeed the source as blktool_4.orig.tar.gz [1].
> Before the patch:
>   # rpm -qa | grep blktool
>   blktool-4+7.1-r0.core2_64
>   # blktool
>   blktool version 4
>   usage: blktool [options] DEVICE COMMAND [args...]
>   command list:
>   ATA     defect-mgmt { off | on }
>   ATA     dev-keep-settings { off | on }
>   any     dev-read-ahead { off | on }
>   [snip]
> After the patch:
>   # rpm -qa | grep blktool
>   blktool-4-r0.core2_64
>   # blktool
>   blktool version 4
>   usage: blktool [options] DEVICE COMMAND [args...]
>   command list:
>   ATA     defect-mgmt { off | on }
>   ATA     dev-keep-settings { off | on }
>   any     dev-read-ahead { off | on }
>   [snip]
>
> [1] http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/b/blktool/
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-extended/blktool/{blktool_4-7.1.bb => blktool_4.bb} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-extended/blktool/{blktool_4-7.1.bb => blktool_4.bb} (100%)
>
> diff --git a/meta/recipes-extended/blktool/blktool_4-7.1.bb b/meta/recipes-extended/blktool/blktool_4.bb
> similarity index 100%
> rename from meta/recipes-extended/blktool/blktool_4-7.1.bb
> rename to meta/recipes-extended/blktool/blktool_4.bb
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194312): https://lists.openembedded.org/g/openembedded-core/message/194312
> Mute This Topic: https://lists.openembedded.org/mt/103950929/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

