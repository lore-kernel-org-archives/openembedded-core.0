Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591DCFA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 15:56:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8250.1666886196715838852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 08:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B3utowLh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id y10so1296999wma.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 08:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=quVCF59EZLXdSJPbPjr5yGNUw8BPa0YtWnl3/h6kY3s=;
        b=B3utowLh9DHioeUsZcIJ1TLwnM8NZ7HErJDjrX6xe3/UHKZuSffQdVToMI7+Uikc43
         nRKVWpIud81QJMxYYx6gptFALatVHCGBz1OJ3U45gUULS8EyFjXao8XpsR3tO7zs/2wT
         zW8GhR9alcYDI9AFw/9Z+peHNksxCVc5I1hrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quVCF59EZLXdSJPbPjr5yGNUw8BPa0YtWnl3/h6kY3s=;
        b=AkNoEWFwhMhZ+rE2ZiLAZukyjtULOnJ/utFLcVJo+g6vcDLCyYafjO5JVVFqGYkxhE
         fXXL0daDbfvT68mtGhLCuv3x6acJYlSOv4ucSJ6mj0ZAfrAxxSYiUaMinwI27Fw+Z809
         hj5vW9p+REiOPZtGF/b9V/NjCSaMk0ex0eT30HPthvz+G5RAkdjdcXmq2xIBZm112cwx
         6sKm4ke7PfyZQeE0gyj8GksUtneYn7sDVIzFZ3tDteJl5iJdEU3KZZsIII888L47pYBV
         Mq4u3yQ5J4ZKQb9sbfehZNSN55rYbAgr8aWT+qSd6NmJuCaq9fZ3Dc9eX6K01kg/KGj+
         NBoQ==
X-Gm-Message-State: ACrzQf1JygKWCA9WwPuSC2IcxXZhyacizMU2VVhNybFgiMbgjbZ/ilnY
	5Srm0lsrrAg8xnZHQG4p8MSPYw==
X-Google-Smtp-Source: AMsMyM45sl/O9wSO8rAt6Yt68UzVg9ShufarpNA3GgDIYiu7o2CKYFho6Ma8hFRKDIptcCD+H+CfJw==
X-Received: by 2002:a05:600c:46cd:b0:3c6:f5ab:d383 with SMTP id q13-20020a05600c46cd00b003c6f5abd383mr6630260wmo.40.1666886195141;
        Thu, 27 Oct 2022 08:56:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a815:5d52:bbbb:d081? ([2001:8b0:aba:5f3c:a815:5d52:bbbb:d081])
        by smtp.gmail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm1944061wmb.30.2022.10.27.08.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 08:56:34 -0700 (PDT)
Message-ID: <6f888c8b7e63a706f9e04fc81acf2098c0e781d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mirrors.bbclass: use shallow tarball for
 binutils-native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ecordonnier@snapchat.com
Cc: openembedded-core@lists.openembedded.org, Etienne Cordonnier
	 <ecordonnier@snap.com>
Date: Thu, 27 Oct 2022 16:56:33 +0100
In-Reply-To: <CAHUKmYbuyn_WayncEW1kvUorpf3L5kQrWvx_1YXQXw85qd+rxg@mail.gmail.com>
References: <1721EF56935912B7.550@lists.openembedded.org>
	 <CAHUKmYbuyn_WayncEW1kvUorpf3L5kQrWvx_1YXQXw85qd+rxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 15:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172194

On Thu, 2022-10-27 at 15:24 +0200, Etienne Cordonnier via
lists.openembedded.org wrote:
> To give some context: this is useful e.g. when using meta-clang,
> because this introduces a dependency to binutils-native, and then a
> full tarball of binutils is fetched additionally to a shallow
> tarball. The original BB_GIT_SHALLOW lines were added because
> of=C2=A0https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg0875=
2
> .html


Rather than replying to the patch, this information should be in the
original commit! :)

Can you resend with that included please.

Cheers,

Richard

