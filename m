Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCA2C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 14:01:13 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.93611.1722607264737055111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 07:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g4PBFERl;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ed9b802ceso9939401e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 07:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722607263; x=1723212063; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yjxwTIOF5abzIx0s+f7MsAZ7V8isj0mshxbNf/ti484=;
        b=g4PBFERlVhtGxjwQrZRULbYkKiYYs9AC49LkQYm9HUdRPgU6UkyDxNJaHAEIAm17Ly
         nmiDHXM3h4sB7cydxL4ngmrJU59OuCjMrh0LgQQWkycwbDDSjg3uX7fTUyuTG7c0OmTU
         5GitWqNxFtUHC/nQrUSOquQdsrJGrSWav3wIQ41aX34/rGe6XDbZnYJ+6+b2u8uMHA41
         10w+U14ImUHEjEviVRgQwEUe0X1rlZ/XRv27S2mv5avtPMiPbjBLfjd9aQy6lH5hItLC
         hCNh7rh5haqlW2xgkhHXL+mjYdj7a5wwK8y0jj9mqsgnD3zMMkVSkm89oN35Symh9eBr
         H9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722607263; x=1723212063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjxwTIOF5abzIx0s+f7MsAZ7V8isj0mshxbNf/ti484=;
        b=njNFn9s7u8ecHtxrX1Hmpck1Ig+NinFSsiSU7XDKn8zWTVN+Eeif7XQ9yuuvBxJOKH
         mYgxAmWBkZE248GhzQCPWpZ0RrFrK5Rl5x18m3qKy1J8MbnEYvm4fKSerrkVxrrfsyUe
         zXuKcQUcHyJnr5VJzI9OgKATYVutA9B6tiJPymh62ImDpfs2UCHp1LCzaLCYxzDMoOoJ
         aFOex/YItNc+NyoTsu58f9re6CAULIFIv5ctUE19+YDoq8kiCIzPDb+UFdDWFBcKTbAa
         l212BxtCoK0mRCO7TreqjWSX32fTRmOrycKa+qgW83RTyJMsJcRulQk1mA68oDN3Y85e
         KYPg==
X-Gm-Message-State: AOJu0YxiigJa02UO5bq8Hf7vK4hJXn7Oa1R5qbePkujpi2lAl9lCpeYC
	dYn4bdzqL9UklA0EdFGxizGjzPZTQmtGc6E4xwtzW8lehVJMeGwjqpvZRVzMG6Nz9n4nCm2h0TZ
	evyUL0Muw0CzTGvI4Q1W6gx1rAS4=
X-Google-Smtp-Source: AGHT+IG6ac+5vP6996hsy7IVWo5Asmqp/M5ALDL2FnedJAnACjy8hDXBrGGvUMX/c1An/fui7RhulkpwMS+Jm+7F7Cc=
X-Received: by 2002:a05:6512:1393:b0:52d:215b:9028 with SMTP id
 2adb3069b0e04-530bb3b3b43mr2190539e87.60.1722607262318; Fri, 02 Aug 2024
 07:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240802121336.1642376-1-thomas.perrot@bootlin.com>
In-Reply-To: <20240802121336.1642376-1-thomas.perrot@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Aug 2024 16:00:50 +0200
Message-ID: <CANNYZj8XmjudNK_=O0ftKAw9pUHD2Ybc=ZoW_wLHjROiZQ7giA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.5.1
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 14:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202913

You need to rename the recipe as well?

Alex

On Fri, 2 Aug 2024 at 14:13, Thomas Perrot via lists.openembedded.org
<thomas.perrot=bootlin.com@lists.openembedded.org> wrote:
>
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> This intermediate release has following fixes:
> - Save/restore menvcfg only when it exists
> - Adjust Sscofpmf mhpmevent mask for upper 8 bits
> - Fix potential NULL pointer dereferences in SBI DBTR
> - Fix incorrect size passed to sbi_zalloc() in SBI FWFT
> - Check result of pmp_get() in is_pmp_entry_mapped()
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/recipes-bsp/opensbi/opensbi_1.5.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.5.bb b/meta/recipes-bsp/opensbi/opensbi_1.5.bb
> index 6b31d15a051b..652b81182b80 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.5.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.5.bb
> @@ -8,8 +8,8 @@ require opensbi-payloads.inc
>
>  inherit autotools-brokensep deploy
>
> -SRCREV = "455de672dd7c2aa1992df54dfb08dc11abbc1b1a"
> -SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
> +SRCREV = "43cace6c3671e5172d0df0a8963e552bb04b7b20"
> +SRC_URI = "git://github.com/riscv/opensbi.git;branch=release-1.5.x;protocol=https"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.45.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202901): https://lists.openembedded.org/g/openembedded-core/message/202901
> Mute This Topic: https://lists.openembedded.org/mt/107683486/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

