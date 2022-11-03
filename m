Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7E5C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 19:00:25 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.2378.1667502018656675101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 12:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YglxWSJe;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id a15so3379329ljb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6KEGm1VDD6KdaKOYMUTKpcN2aGSgV7IZVJWlSZpZEyw=;
        b=YglxWSJe5iBsnmeNwtvUDGnOOj7HOMTiaJFJTSNt588oMU/OV0qV/Ya6DtCYCb1RAB
         WFsm+B751NCxbqk5uSiW6vbfVKR+KEgP72X3BNRpGVk92vtngSj/JxywtDwPOq9fW7p+
         DQl8qbtK54FsDS4Wyrhk6B/X/hEGI06KMnc89+CxXAuKWtnKOa3a6nNhzyn9U/4c0+GL
         wDpJcvmbLTYihjz+Dmd/Xr1jebreEDyvJLc6RT/eeIE8RC3gVIP9w7sSXnd4YOTr3gkS
         ANDphK9gePlpuHJ5QUZnGb4nH6Or/uTHAxIuH1tuk3aRQvgFtDpM/nJxai5pMAParFnM
         lCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KEGm1VDD6KdaKOYMUTKpcN2aGSgV7IZVJWlSZpZEyw=;
        b=4coziiCLdQkV0h+R9wHJ7aZiUGL9ery7+gzTXfosF2egAI6usvhAa2LReGfFu3FVnd
         vVt/gfNUsZK28g7PO7+HefGJIvzPJrfak7YNrFS1NOu6CCUcNN/ILo5KqevqXdOFrtC/
         /5rh9hiOexw9fYgp4mTSnUznjEjNHyay70P4pGMB9gn7phcWofdmuds63mHmn6h518z2
         GZukZybCE/z9DNFdzQ3hyvh1oV93CnZ/BtqkgIoriJiLHrKU1Lc7hmjZ7tsgdoLX9/K4
         dGWxSIP1lJqBRmzc8ZiB4ypwkf3XwBr1/lbds88uUwOVezRy89UIsqn5+js8fKwRoFzm
         CSJw==
X-Gm-Message-State: ACrzQf3fXC6SlzqMMUN3ZwmCT+VIl5KOr4/Vme1yufks7Kb3awUYzrgZ
	6TJi/Mpg21PfzopO6u8SabqB4IPkOffzF4+e98w=
X-Google-Smtp-Source: AMsMyM6Wpj71IKlBhfFPJ7uJyD5XSWmRZTpYvdgUeLz166gHzfT+6Pb2AbYCOhnbhidpUQbZPbK4uSlAwFx2e63vctY=
X-Received: by 2002:a2e:c4a:0:b0:277:3931:6dc9 with SMTP id
 o10-20020a2e0c4a000000b0027739316dc9mr12660717ljd.45.1667502016106; Thu, 03
 Nov 2022 12:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221103183356.40685-1-sakib.sajal@windriver.com>
In-Reply-To: <20221103183356.40685-1-sakib.sajal@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Nov 2022 20:00:04 +0100
Message-ID: <CANNYZj9R5=X_=yK8hsq_RJJ0ieSrGbCqd4jpzBN5Uv_U59n2ZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] blktrace: ask for python3 specifically
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 19:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172651

On Thu, 3 Nov 2022 at 19:34, Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> python2 has been deprecated, use python3 instead
>
> +Upstream-Status: Inappropriate (OE-specific)

This is not inappropriate, or oe-specific, please send the patch upstream first.

Alex

