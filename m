Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3EF65CE8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 15:18:04 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id g44-v6so8452596qtb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JEEStcm9vuqVM+lEGs6rifXJCa3P9/o4a3XRZcaqQOI=;
	b=EnLGHFaZ9YicuPR4yT+Fwx+UqJAH1QRaQeOaQ6LNihZIc/fjcsckCi27BUU5DxIksx
	GedKPDh/e0K5DyGNm/8P9IH7VGrMddu3uIIWBaXsrWkz+w2pr2B0cknlgDLX0w7s66x0
	DafjZn10bexF1OIDE+J5Qfq8ptbqAAfPPAz65nfZaC/AJ2SQ52U6E7e4Re+8hB5SpavB
	1bN6P2zVLuJfXK9MtnidK6Spzz1ylhiI3hKt4cahYjlWRRJbt701nW8k9BHFhgdM4LwR
	81UZ50JcpLZXTBhyFfJOeWbu1t0SgaI+2a1uARwGnmLoGCYtJpOrUVUfB6IDKCkjFeHk
	5jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JEEStcm9vuqVM+lEGs6rifXJCa3P9/o4a3XRZcaqQOI=;
	b=sXqMS5ntDueY9gs97hSC5uPwWD/3esFgtpwzKTQfxtE6R08m+YQvEswKxJdlkgxLj1
	9Tm90N2Snqz7aUv9i00zH3KNZ8hTc4HLu4kqjYeDCawKe943UeReFmgW1h5qppiWwPiJ
	aJU7Em4cvzKCKpuZf9OHclOSOoNSntRakJ+K588C+ScLuP8MJVO6Vgmra54jZQCKahWs
	g8saXS84PILqnTwZSS467iT6ZXUdpYln4j8MAFXYfLOY72dznch5jl9izKEZJ8NnNH/+
	+mO2Ywrle2lPXM+MK3gSyprkbAs0eNObcKHtjGcMsQPBSDkjHu/PaCM7SRYBl5eS9OLr
	npZw==
X-Gm-Message-State: APzg51CYq3UjUBG5wwGFL1FH/8rQLMLn28rLnfTGgoKf3AxMbQdZ++6J
	WcyCHkHzKzivMkXQgmC6YV10JfeN0IGMXaf9sCLKfG3e
X-Google-Smtp-Source: ANB0VdYSmSMCT8J2ym/o0fS5aQJg1TDiTnauE+W2yrbhit3LocqBTjHF79KW3vWDl/gh4Us2gHwj678GCi8ZhAeRXas=
X-Received: by 2002:ac8:6c8:: with SMTP id
	j8-v6mr34246855qth.314.1536160685046; 
	Wed, 05 Sep 2018 08:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
	<CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
	<CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
	<CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
	<CAMKF1sr9+bzRBVfV5J=ad4v_m1kQ5hLg=qDqX_dyEUWcFeocAQ@mail.gmail.com>
	<CAP9ODKpfrTs+vQQcG=TyTO6nPZHR8U3xHyg4i_xsn17eOKc41A@mail.gmail.com>
In-Reply-To: <CAP9ODKpfrTs+vQQcG=TyTO6nPZHR8U3xHyg4i_xsn17eOKc41A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Sep 2018 08:17:38 -0700
Message-ID: <CAMKF1sq7UQMb7qGtEZhXiB5W09sTxYQdt1ZMq6cEUic6UcCd_g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
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
X-List-Received-Date: Wed, 05 Sep 2018 15:18:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 6:42 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
>
>
> On Tue, Sep 4, 2018 at 8:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Here is one failiure that is seen in meta-oe with updates cmake
>>
>> http://errors.yoctoproject.org/Errors/Details/190510/
>
>
> I am looking at it...
>
> Seems not related. I built poco using cmake bump and OE master.
>
> Seems related to the musl update on master-next.
>

here is glibc failure log
http://errors.yoctoproject.org/Errors/Details/190886/

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

