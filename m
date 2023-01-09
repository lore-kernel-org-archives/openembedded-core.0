Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7E3C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 07:51:17 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.66209.1673250676392799675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 23:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oQHUSHnI;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id p25so1820301ljn.12
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 23:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DZ52ARBeTyzGuUVnlRhpEnm6fJLNcIn313BgN/lSuUo=;
        b=oQHUSHnIiGnWqYndQlcuWw77wFdnnUaxESfwqKVJM6Rvw8Ak/q0mIF9/Zq3Emtznfn
         36FXdBxUdNffPE83OhWjDuBzPCz2Bsw3LiKdT8hQV2Xk9dWvBxeC/wHmrGYltLNa4lZO
         Irec4OmzVAJqbDnT7GResHARjX83NekDr9kLszyDEwmRwLxCheLrK8gF5AslGRGCsSRM
         Gishj8XU7fYXdwiAzT0T3DYqJh2lThi7WW4j+QVXL+OfhYl4eY4AKEY6VlrVIIaTqQcY
         alO3HEAxcAWiW9s6JNKmJMGAdxA5A00FcgxRc+aSaw4KiYVfglDEBWsMEObyhW8yLmyd
         mApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZ52ARBeTyzGuUVnlRhpEnm6fJLNcIn313BgN/lSuUo=;
        b=xuW0pIjUItPXjxLByyZWP1qVflVE/9RbqcGuJy9EKdr4HOOTMvimUApx9ev+YXOQ8l
         DpJNWcL7Q5McbmyVQ4zzuMHS52t1CwjDdAPBGf/fHO74xm3Ka1yMZt/Qdn9NgSvfMGmU
         9yXIy+vkvDpvrl47SUrPTCUhqwsnOE0LIOAXkKjBkRZt5CMp9nWGRLkg+OxktbnOAnoD
         mqXxLYl2T0fBz5nGO1/1FOsgfcb0VQi56XdHEf3e2zQvgJrPn24R1XadIz/DHQPP9CpW
         EP8nRmYtFizMczDEK1WsO3EaQR+C59ryb76Oe8UcBep1fIrJGgFCQayqtWGCUWMzSgPR
         YyWA==
X-Gm-Message-State: AFqh2kr5gsT0eqOQRC7xTuYFLHBJry6+eXV3mhRnFa4wDmBDHPvA+LPQ
	gSY+LFUUBeVIYMNwzCvzQOtFcMb27WsuqxScQkA=
X-Google-Smtp-Source: AMrXdXsEQZhA1mbaub+zU868NgNrA5hGH72O9qqnr/itoS2VpFqriJGy3mnkSyjhujejuHKVJTo5EPeInqW/Fld9ZVo=
X-Received: by 2002:a2e:a813:0:b0:277:8759:bf65 with SMTP id
 l19-20020a2ea813000000b002778759bf65mr2801050ljq.108.1673250674396; Sun, 08
 Jan 2023 23:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20230104110548.2537259-1-alex@linutronix.de> <20230104110548.2537259-3-alex@linutronix.de>
 <a3fed81d-5310-ae68-4ef6-4aa8162a8b8e@gmail.com> <173733E168371C32.27663@lists.openembedded.org>
In-Reply-To: <173733E168371C32.27663@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Jan 2023 08:51:03 +0100
Message-ID: <CANNYZj_jYmtGcaZEcrh4KW9A6i-m-EpLDb+Rweh+U_L2aJKeCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/77] ethtool: upgrade 6.0 -> 6.1
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, mkubecek@suse.cz, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 07:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175669

On Wed, 4 Jan 2023 at 21:07, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > It is probably better to replace u_int32_t with uint32_t from stdint.h
> > instead which is more portable than u_int32_t moreover using _GNU_SOURCE
> > feature macro is also not needed.
>
> Hello Michal,
>
> this would be perhaps a better fix than the patch I sent.

I made a patch for this and sent it.

Alex

