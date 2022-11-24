Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B164C352A1
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 13:44:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.23906.1669297466274770838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 05:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IssYpe4D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id z4so2560763wrr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 05:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=82M+SkMxK5LB+i57fUoTErwhki0WGaiBzkUMF+Q9N6Y=;
        b=IssYpe4DzFcJ+aaQex3+36qtg7C/TOzhgBX8Zu8UfMf34kZoixjDo5jEkhr3pI6Hwc
         pp4/XqUAYNbIzsWyUHae1J6rV1om6gPwPn/FotF3uDJx9Oygqx2gIHhx2+N8mNhzgC0m
         Sg7wkRpWKDng8ZDbGa4ohQNc75nPn1fxpGa2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82M+SkMxK5LB+i57fUoTErwhki0WGaiBzkUMF+Q9N6Y=;
        b=ChP9dp0cnMKSoxQlXAw30cmKrgV3qUNv4sJgc0FI/6+0Bjd5gJNb5l092+GkpzLKXf
         wVj02wIeMET1lv40yEiCdOz1vTC+Uj7cKVkWtySVaF3Y+O2OwStr9Xd4VlhhiqsxaPEr
         lon3w0/C5G8NsCdfFB+x5kTIrStGJwNVsxw68owv3ZIFgprUTnfcc1CZfRcjxuVwqJQn
         uHBeoFRv/mGFnBCL5ww9UBR0GZSRMguqCrSByaLcsvrPuo+DhV1p6sb4oeNMIKuWT//S
         61C2NBXHBPkSOnVADpPKsZYgMfklBSUq9PXb1XRTbUkE/Dznc+pLICmc9CUfH927tebi
         4FGw==
X-Gm-Message-State: ANoB5pmz/EZmlgRci+rxTR9PqNZuzy0HbAyju78+Y1xxv0cdb4Sn67Xq
	OckDLpLrl6pcIEY8STTK9zjkOA==
X-Google-Smtp-Source: AA0mqf7aSB4ApzeyVBvRxwbhYYvjoS8c25fWYGLh9LKMAptoPdWKqCuwQolX/5LQWOu7H+Gww3mqEg==
X-Received: by 2002:a5d:6089:0:b0:241:e85c:f769 with SMTP id w9-20020a5d6089000000b00241e85cf769mr6250218wrt.69.1669297464442;
        Thu, 24 Nov 2022 05:44:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4038:3d32:5f00:5957? ([2001:8b0:aba:5f3c:4038:3d32:5f00:5957])
        by smtp.gmail.com with ESMTPSA id fc12-20020a05600c524c00b003b4fdbb6319sm6140201wmb.21.2022.11.24.05.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 05:44:20 -0800 (PST)
Message-ID: <860e71c1edb0e530899aa25c00722e7dc04acac6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/17] unfs: update 0.9.22 -> 0.10.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 24 Nov 2022 13:44:18 +0000
In-Reply-To: <CANNYZj8DcqqBFjBeLNsvhS-KbpzM1=hCeR=XL=FNwQV7=bBEUQ@mail.gmail.com>
References: <20221120133122.2464634-1-alex@linutronix.de>
	 <20221120133122.2464634-5-alex@linutronix.de>
	 <fb9b0440c73d2d287b6dce447e652d7b0986c33e.camel@linuxfoundation.org>
	 <CANNYZj-HbuCeOiK2yd_01ruShEg17J6yAKH2F4QTEp6hi9O+Pg@mail.gmail.com>
	 <ab2f02ff2654669a3c0b26bf741514698966b292.camel@linuxfoundation.org>
	 <CANNYZj8DcqqBFjBeLNsvhS-KbpzM1=hCeR=XL=FNwQV7=bBEUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 13:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173751

On Thu, 2022-11-24 at 14:07 +0100, Alexander Kanavin wrote:
> On Tue, 22 Nov 2022 at 16:09, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > It would help, yes. If you do that it could be good to understand and
> > document which areas we do/don't have test coverage of some kind for as
> > we could then look at either adding it or dropping that support if it
> > isn't used.
>=20
> I sent a second version where each patch is separately reviewed for
> necessity, and also the runqemu use of unfsd is manually tested and
> fixed (there's no test or usage of it on the AB).

Thanks, the details in the review there are really helpful and the
patch is clearly a good improvement to the situation. I'm happy the
situation is well documented now. I'd forgotten the NFS ports situation
was clearly resolved in 2017!

> The scenario with qemu is that when given a tarball or directory with
> a rootfs, the content of that is extracted and given to a nfs server.
> Then the kernel is instructed to mount / from that nfs share, instead
> of reading it from a file. I'm not sure what use case this fulfils
> that can't be done with 'standard' .wic or .ext4 rootfs files.

There is one really neat scenario where if booted that way, you can
change files on the emulated system "live" directly from the host's
filesystem. For some kinds of development or debugging, having a
fast/instant way to sync things to the target as a normal filesystem
can be very helpful. For that reason we should keep it around, it is
part of our more unique developer support.

Do we need special privileges to be able to run that?

Thanks again for looking at it, it does look much better as a patch
now!

Cheers,

Richard



