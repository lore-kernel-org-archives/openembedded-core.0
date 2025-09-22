Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A379CCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 09:44:48 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.47867.1758534282226634725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WdLpm90q;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-7970e8d1cfeso44277606d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 02:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758534281; x=1759139081; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WaOOs6x2X3isQPNVghjApOi6UrLGJvy2t2ilEGA6xNY=;
        b=WdLpm90qjjKSxYzNZY/C48PMYSxIqb8UxJJ0XNbuePeLnrpHoHpbhuHH//imO4dwHx
         9ER+CEJYyJIUpb1d9d/7mnKjqQY9cDFmGVlT4zneWgu60SVIdrEaH8WCCDrGSrFGFn4i
         dU+ryH3rAU7vjIuruG9QjQeU6bqOj69/FMzcCGvd5EPjGDonpvSNt3stXNoC2XCCTIKd
         2aYeyCpfHlWKq+cK0tFyHRNlXEmsgDHQaVYeBYzn02U/JpyO9DSi1xC+WN5gh4hGKzjT
         92KczqZjVTMvcNlj6mbTKxwoD7eAkADsNVenQoxahUidS0zDvvA/j7G90iNWUOmul+Ou
         4zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534281; x=1759139081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaOOs6x2X3isQPNVghjApOi6UrLGJvy2t2ilEGA6xNY=;
        b=HL3m13fnmCPC2/BztjtqmJxRCnGT9BYfAFvpXMZ48J4S/St6GWfmCRDTVoL+wKR1qQ
         yp3jURbvE+BWwZMF7nSpXve8hhcVv0zQfDgJZdQiugUYbFhuLVbdWVy/MMzB0rPz9xVH
         WGkqFCgVPWFJKMMqfZNOOnSbsQTg4TzXSzfLqLKjgufmmAK7QPz4IBYaEObuhs7R1r+N
         jEhzF74gOndsIanrgAidz37f53Z/rgtlgiwToqBsPqWT3Zb22A6/ZQZ459TBmk5saQZ7
         t+fd5JDJ8C1BLQzuquEscrIrH7ZpLfqukz8DxwwIRYGFjQl7DuUnbFahTVvOGuejdBE7
         B/sg==
X-Gm-Message-State: AOJu0Yy2S8WIuTWwKHzqpc6ahz0D1a74Pgm/3epFOtwOOfu2aLikapAq
	8/GPTO4sS0K9GNMNv13RRNw8YAP2IafhzB+Tg4vkGMBt/z9aqGVcqDRWqteSIhakfgH/7bNKOQr
	Y5LR+g3iNWQawAo19IPaaVl7wHVfvRc0=
X-Gm-Gg: ASbGncu4o7d8UVypsF7kZmqiB+CLhOdPmKfMGCajCk1vItx/InJ7497s1qN0ETAiskx
	IvQcb+U0Hlqlv+y9NzfoYpg1h23P/vwCKtnM5RiNneXysLQL91K4U6GZetJs/Ab1nY8N8r2t6t2
	VHjFjQBBVRSEtFPIioIlwb3sHtuPfh/GEj+4JRKQxOloBgqML+CnpNBVL3Le6pHyZ2NHCj8Za/O
	SfW3kO/IO+vCMfmlftawTQD7DLLtw3GFczqFrnFQ1sPUH5e4L1Jx0NcRUYtmS7jYpvZaUsqAMHj
	oTe6o0hhvCxfDkUR
X-Google-Smtp-Source: AGHT+IFt5YQh/wccKowkmb3Gi2pY5rdEj6UmldFalZByxDvfrPdxs/5nAlihonHh2vrpygslHh9/4fjNg3BpAbCyFsU=
X-Received: by 2002:ad4:5d66:0:b0:782:9454:ac85 with SMTP id
 6a1803df08f44-79911368e98mr136182126d6.5.1758534281205; Mon, 22 Sep 2025
 02:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250919073335.2069114-1-kavinaya@qti.qualcomm.com> <20250919073335.2069114-3-kavinaya@qti.qualcomm.com>
In-Reply-To: <20250919073335.2069114-3-kavinaya@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Sep 2025 11:44:29 +0200
X-Gm-Features: AS18NWA-3By_rXjUHv3vXwddrcosJbkyqvDHXgoEl8vY9LnRrCTwVhCPFZCKqW0
Message-ID: <CANNYZj9xh8BztiOwf62iVGAraejqrgKwva3RQ-ET7k71H-a1Sw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] image-fitimage.conf: introduce
 CUSTOM_ITS_FILE variable
To: kavinaya@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 09:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223815

I don't understand. Where is the variable used?

Alex

On Fri, 19 Sept 2025 at 20:58, Kavinaya S via lists.openembedded.org
<kavinaya=qti.qualcomm.com@lists.openembedded.org> wrote:
>
> Add an optional variable CUSTOM_ITS_FILE to allow specifying a custom
> ITS file for FIT image generation. If unset, the ITS file will be
> generated dynamically.
>
> Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> ---
>  meta/conf/image-fitimage.conf | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
> index 090ee148f4..619e70a670 100644
> --- a/meta/conf/image-fitimage.conf
> +++ b/meta/conf/image-fitimage.conf
> @@ -44,6 +44,12 @@ FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst
>  # DTBs are provided separately in a FIT image.
>  FIT_LINUX_BIN ?= "linux.bin"
>
> +# Optional variable to specify a custom ITS file for kernel FIT image generation.
> +# If left unset, the build system will generate the ITS file dynamically.
> +# If set, the specified ITS file must be placed in ${DEPLOY_DIR_IMAGE} before the
> +# do_compile task runs.
> +CUSTOM_ITS_FILE ?= ""
> +
>  # Allow user to select the default DTB for FIT image when multiple dtb's exists.
>  FIT_CONF_DEFAULT_DTB ?= ""
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223767): https://lists.openembedded.org/g/openembedded-core/message/223767
> Mute This Topic: https://lists.openembedded.org/mt/115333709/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

