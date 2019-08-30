Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id C79C37F44F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 14:41:02 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id g11so2399777uak.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aUH5jE5ieIlns8RAULK13fg6mneHXtL2b+HMM2vIOx0=;
	b=PjjCaVaMJXpifo21p0KPfnYErchChOVfsT7QPQca9te8WVUPkmi42ss69qDLjZ+lJM
	qI8Lqqs/9MiPWOVE5XQJF8MGGbWCAWypdvfjcsmraVb6YlY4t1te05tsrE8NSOatKnlM
	SIpsN3XMdyUatAmhACOwQRQuMQrTqDK7loXVo2xmpxK+xJfCEYGiKSL8iti/GOWWq8b7
	tL+Y/0/PQ4GV7Qo/V3/k/EQuwzK0r8x9ngNZcaLQ5su/zeSIT98UjLJ8chsCja/KHIHD
	K07B/KG9NYcbPnylG/8KdlH9VaYreuobtMJcCvABTwiunWyKmpaw1ljBOn4QzXYUEuLp
	DOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aUH5jE5ieIlns8RAULK13fg6mneHXtL2b+HMM2vIOx0=;
	b=OrUs36t/tkHHqWvpLfdvuz0Z/z8JT6fucBSSUaKFX9lnQ2eIvJLH1FjOH9M01kbMbU
	N9nvXlIUs95XITi0OAdBpD5kVR0daqj3wdOEJbxbNUTdYrh28/DDsse/COQCERxjLFn+
	fWo7ZDSHqUT61pgl4p4VFqxMPScLZmj11OOOzyGqPu34XFXYSFJZhT/R9kQ06v+3/XSm
	SDmf3JtJqw9v+tCIi2gKSytUzob9P1EC1c/x+NOMgd1hHvwI/JNG1n/OR0iPT9K1Ipnw
	0/OkHA+wAmtkUG1n8kM1wIRj5ImajYPiO2iLxG6c7rtuETuzMogAdNBqsaWngMcWoteV
	8/0Q==
X-Gm-Message-State: APjAAAV/aIeYTzBFDHoaW6LkPcpaaQvXaRQexvGZdKwx0N6N4LvIWkau
	13jA+CaV23VS8gjnrkZ8y6TCtAe5PT139M4AhKM=
X-Google-Smtp-Source: APXvYqyF/2yqibKObWBbzwdpAOab2caTOaq/GPajg4XWjXwcK+crnbnJj5ZE4wZVeOsgQiMePoJ0icfSUCEU8oNiV0s=
X-Received: by 2002:ab0:2b13:: with SMTP id e19mr7464152uar.81.1567176063375; 
	Fri, 30 Aug 2019 07:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
In-Reply-To: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 30 Aug 2019 07:40:51 -0700
Message-ID: <CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: FETCHCMD drop breaks build when append is used (from patch b259bd31eb)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Aug 2019 14:41:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 3:08 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Andre,
>
> I've just pulled the master and experienced a build failure during
> fetching of updated recipe's source tarballs.
>
> The reason for this being that defaults for FETCHCMD has been dropped
> with your patch b259bd31eb from the series. Once defaults are removed
> and appends are used - the FETCHCMD gets defined to the value listed
> in append, which normally does not contain a command itself rather
> than necessary additional parameters (like user/passwd if working with
> local pre-mirror servers).

I think for the specific case of usernames and passwords the advice
would be to put them in .netrc etc rather than trying to append to the
fetcher command lines (but mainly for security reasons rather than
this issue).

> This patch would also break several other recipes which are using
> appends to FETCHCMD, for example for FETCHCMD_wget the libedit would
> fail since it appends the wget to use different User-Agent.
>
> I've copied Raj here since he introduced this recipe in the form it is
> and would definitely break.
>
> Can you please have a look at this and advise on how one can continue
> to use the FETCHCMD appends for the future?

One answer could be that modifications of the fetcher command lines
should be done by completely defining them rather than appending. I'm
not sure how reasonable that is though.

In the end the approach to fixing this depends on whether appending to
the default fetcher commands is considered valid usage or not... and I
don't know the answer to that.

> For now, I've defined the FETCHCMD_wget in my local.conf but I do not
> believe that this is the general way everyone should follow if they
> would need to append fetcher commands...
>
> Thanks a lot!
>
> --
> Regards,
> Andrey.

