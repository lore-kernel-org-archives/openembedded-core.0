Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D57C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 20:53:40 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.3388.1669150410743772491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 12:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xn+zAuwE;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id s8so25319158lfc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 12:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G8CDR/z+COnDJDeC0I5XYjtSqY4r3KlBiRHiRd4tWSo=;
        b=Xn+zAuwE9Z0x6HCRqPoJhlZYDyLDWn/Sk+kojpGkaYa4dfrjoq+kJ67p5uzkQgYAqL
         g/r1Fc/Jw7yz95wHDDc3k4rkKq5AJN0NNV9pn6jDQNR/hjRbAzKqPB/8YJVyYAnwLZn9
         RNjM05mHtBWwJhtQWD/OGKfcYqOO8TG8eoZegR9re+MUiZYGg5Ep+sH7hJ4IuuJF9+6y
         nrUkIYh0s73KyQuxvfIDB8LxKpOFTwUVhHZnl6Jr4xG2uUsxjKENKgrvVdukkPi3TF38
         1/OvBoWU4YmVX9IbI5+bfq7XJwJfIXwIvr6HKw4rGKBVfpaSZ6f/+z18UCp1VdkdZr8i
         d57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8CDR/z+COnDJDeC0I5XYjtSqY4r3KlBiRHiRd4tWSo=;
        b=DPaSZ12ek3XXPb+jn/NLUrG/24w2gsZ2xkmFaBBfWGdDvl1ilmMVuP38Ii1ZEJKm91
         Qv82L3ePy4W0RlKQ60yNmcqFofKHBIRHMpzRwSL9ms5mOqx4GsfN36gWVmHfOS4x8A7m
         nfwWFDeT+1lRUEsjr+84fsBGUeMg0yWeIq3f5bj/uCpgMpkfA5IPEIrrBaD9B0fSJcd4
         +pF99v7gr75xZWsd3KeHpQ5RAwOoDr28QPu+49e0kLmKjVnAlLr5Ay0A8AoDbfNLBd2C
         QkdPe4bC2t/51BOdG8hg9HLz2hqCh0LDHj/d9CEKjwi4q09eS8iUWuccJq5CSiI3vUFx
         EWsg==
X-Gm-Message-State: ANoB5pnUJZxiBYydgOYHi33L8liW2GlSKOlBkneAaWbHBvkr5HoVGtHs
	4duyK3eieWccEjP5MVabkyyDCHMygn0LKefgpDM=
X-Google-Smtp-Source: AA0mqf53/tvjr5Fv7CoChJ+dP7ULFelylPW34TLW9L07yF45fBaFHHLQfSsIBL/WkI0s8+d5e0Sfqw6LhYWEvDWdGWU=
X-Received: by 2002:a05:6512:25ab:b0:4b4:d443:6550 with SMTP id
 bf43-20020a05651225ab00b004b4d4436550mr3471923lfb.393.1669150408485; Tue, 22
 Nov 2022 12:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20221120133122.2464634-1-alex@linutronix.de> <20221120133122.2464634-6-alex@linutronix.de>
 <66344aa4e79a890e2c9d90af9b712bf432f450dc.camel@linuxfoundation.org>
In-Reply-To: <66344aa4e79a890e2c9d90af9b712bf432f450dc.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Nov 2022 21:53:17 +0100
Message-ID: <CANNYZj8c5HPpMqTAdbOd8swzF-A0ef7cXfSHaTpVpekT87uF6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/17] man-db: update 2.10.2 -> 2.11.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 20:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173700

On Tue, 22 Nov 2022 at 13:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> From a quick look at the changes, I'm not sure this is correct. At
> least some pieces of the codebase are still under GPL-2.0* so at the
> very least that should still be here even if the output result is 3.0.
> It may be some of our output packages are also still under the 2.0
> licenses.

README has this to say:
In addition, man-db incorporates Gnulib, copyrighted by the Free Software
Foundation and others. Note that much of Gnulib is distributed under the GNU
General Public License version 3 or later. This means that, although
man-db's own source code is licensed under GPL v2 or later, the work as a
whole falls under the terms of the GPL v3 or later. Unless you take special
pains to remove the GPL v3 portions, you must therefore follow the terms and
conditions of the GPL v3 or later when distributing man-db.

I took a look at the log.do_compile. Gnulib is statically linked into
libman.so, then every executable binary is dynamically linked with
that. So there does not seem to be any reasonable independent target
piece that is under gplv2.

We can list the license as "gpl2+ & gpl3" with extra clarifications I guess.

Alex

