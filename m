Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1829A780BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 16:11:00 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id d127so102267393wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tmGByRdhrA6LlIJMBFxGn99/R2HS5bvMPAUJ+S4gQ4M=;
	b=KWoKgNHxSi3V4wHBQSRK74MuNpx383GqApbayvWIltSBfp+lmbNB/VNgpZqCAXFrGj
	yDZnbFbefd7PeOt0HMBxLDI2+dyjk3Zt1B16q3PrBh8eXgB8knnzZuaAFC0VyzZED/e3
	pgvuJINRR0/xg7F4C02ENJhyIoqE190omXtX42ytRz37U6juJoHLmr7jPaYKEOuInrYl
	cW+x2jmrneuyXJUcKYwbtQGVdYF++wlyEnl19ijLeob/g0RxQq5Yg9IYpxXy37IFfpDM
	j9BGY/NlmFRPR3wvA8TUwWt8BGFn7v70Yth0kOCsKx4N+DQGTk43gWAB73phHGBZVI46
	WvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tmGByRdhrA6LlIJMBFxGn99/R2HS5bvMPAUJ+S4gQ4M=;
	b=dtGBT1+43U2wZM0Mwo3GQS+LktaShR4JpXD8IP6iMIUH6v2rdzg8f1CC8M6XZSqBmc
	qJ4cGT143Hq/ndci42XqN2iR7zTaWU436fZTvPjY9IYLQAmn8Tu6GiFyeobA/6rIgPbu
	xOk5d2xcszLYI3Z+u/HfC43BqYw53hKkbVHu6mE+xfrs9OltG0GX7owfkuF3vqAIiBib
	Obnu0aBkXSuifPrNJNN580PuoSfRiYDDiZhgkON0SfSLpOeSXg2hp/Mj0kI2T5+cpK/T
	L0w5fYaCzWh28VUcOA7g1tgLzw31wW2H75Q/Nxqn4O5pwywx9ekI6gDsTp2pmg8AaOCw
	0Lew==
X-Gm-Message-State: AODbwcCY4qUiktegrz6HS5ZUublNn0N+JdQfBURnxSFCaaqDz3LPLTGB
	UmaFDDgMbjfp+SQnVO+SYmB+5HE7Kg==
X-Received: by 10.80.154.165 with SMTP id p34mr17245703edb.127.1496160661623; 
	Tue, 30 May 2017 09:11:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 30 May 2017 09:10:30 -0700 (PDT)
In-Reply-To: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 May 2017 09:10:30 -0700
Message-ID: <CAMKF1srQQQFZofNGn8FEcVBJL+TrVKjvwMn_qp20J2BmNDTN3g@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: KERNEL_IMAGETYPES and Image.gz
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
X-List-Received-Date: Tue, 30 May 2017 16:11:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 29, 2017 at 2:13 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> hi,
>
> i am trying to set  KERNEL_IMAGETYPES="Image.gz" in my machine conf
> file. But it doesn't work. I am seeing this error during
> kernel_do_compile():
>
> run.do_compile.30019: cannot open Image: No such file
>
> In fact the code snippet that tries to compress the Image file into
> Image.gz expects the Image file to be in ${B}, but when compiling
> kernel Image is actually in ${B}/arch/arm64/boot:

is that always the case for all architectures ? that it puts the Image
ion arch/$ARCH/boot ?

>
> $ find tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/linux-linaro-qcomlt/
> -name Image
> tmp-rpb-glibc/work/dragonboard_410c-linaro-linux/linux-linaro-qcomlt/4.9-r0/build/arch/arm64/boot/Image
>
> The piece of code in question is in kernel.bbclass:
>
>   gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
> It really sounds to me like something obvious is missing, i doubt I
> would be the first one to try Image.gz..
>
> Any thoughts?
>
> thanks
> nico
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

