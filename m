Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D5BC2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 08:09:57 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.68045.1718957396524353637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 01:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+YdaZW2;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec3c0dada3so21794011fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 01:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718957395; x=1719562195; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t9SGShXlxjJ8j7ZWGvhDZzt01gqrRrOZ1KSawmQZsy8=;
        b=W+YdaZW2HT76Jk21Y8t0+/47E+EI0Ogmvlo49E+RrVEtcfvW7h1hGKu6ImyEj8X1er
         TAs8yT/M2ssYzAaytt9B5QkU7sa4jZ736Zhn/dvcLQuKpFlhwX3hScl1TDZEWAoxCPh0
         0p4QKVTs8hsiACXMlQN8qMV8UDbEpln9qfq1puxDWxynAkOVfZdacLSYtY7b+YZjVCHf
         z4XLeYQsPWKc9gvlNC7B0MuXsngiGHNmAWIDywBUIjdXwutekNGDsezJPAdReD/JzuRF
         Hg7ZZjATvOwwteIDms7qpLGDp3q8nSoiM4eHHouincVBFIGooQcBCKA45/LUVQJMXEwl
         vmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718957395; x=1719562195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9SGShXlxjJ8j7ZWGvhDZzt01gqrRrOZ1KSawmQZsy8=;
        b=KNZ7OyZC8yiqb0kPxX9+3xRlFxlanJVu+upWCr9+8LbUf55oyj10/8ICEyJgYq6iEO
         +xQOAeIdLEmHLnPeMzDi74kQnS7q4OCr+uGwZBto/r1YqX/CwcciCm46IOJDAUc2F/FR
         IfQWFP8KyQHElVMQ/VlhzSOhTasFAmRDy7p04nOBC6yBwzurj3QN4oStrJLubpnL/QD+
         Dy6Qe2Uxf8JdqESNiXZEDhdcdAy1cPXaTZU3MYZS5ahlZ6cSbEpXYx+Gyyi1sXWUaNHs
         zxiknSIpXv1RhDK3wHTr7lwje8PsqQxW1jXVhCf2Dq24Q1L9ZZU3vOk95Srr/GKTEZWx
         XGzA==
X-Gm-Message-State: AOJu0YxAKZAGVeKGc0KSU3YUPoa3AMU7RIYKjcTVIQXeY8I8aRwcC/Jl
	PNdW8KbohazfAINnYZVe/+iSvbny2nXWyxd4Hn/9z4t5HYa4vC6UEH10oMhaxgxNKfel+7poL1B
	bywhXwMcUfUMpAFTVN3mwEJSiRI8=
X-Google-Smtp-Source: AGHT+IERC0a9ikC62lct65+UE/EZp4h2OV1m4T+o49+1lQ+CjbjnuJ24t4zkJsDJfa6Hl8hkSxmOHL9ByCL8fGCGaLg=
X-Received: by 2002:a05:6512:54d:b0:52c:d6a1:5734 with SMTP id
 2adb3069b0e04-52cd6a1586dmr692918e87.14.1718957394358; Fri, 21 Jun 2024
 01:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240620151023.407966-1-tgamblin@baylibre.com>
In-Reply-To: <20240620151023.407966-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jun 2024 10:09:49 +0200
Message-ID: <CANNYZj9Z460AL0fSMvks7iDma2G1JfU__vxDAmNYsQ8f25bUOA@mail.gmail.com>
Subject: Re: [OE-core][RFC][PATCH] python3-numpy: upgrade 1.26.4 -> 2.0.0
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 08:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201001

On Thu, 20 Jun 2024 at 17:10, Trevor Gamblin via
lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
wrote:
> When trying to build the recipe, I see this error during do_compile:
>
> | Found Pkg-config: NO
> | Run-time dependency python found: YES 3.12
> | Has header "Python.h" with dependency python: NO
> |
> | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot compile `Python.h`. Perhaps you need to install python-dev|python-devel
> |
> | A full log can be found at /home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-log.txt

inherit python3targetconfig is where I'd start.

Alex

