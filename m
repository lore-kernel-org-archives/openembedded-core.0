Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 563DE7F946
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 05:07:18 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id v69so26193501ili.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 21:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CE4W4uEr4O1QuLEItAJf2FAgjsHKe4Re/ECQLTSq0J4=;
	b=YgyITEk0omotd1OdqtaPD50X/wNidWyv2yXk/+5cveLYN/tWOUb53UOQQMdW2oBgEc
	/bU4i+qkMpaBl+RVzEOcGLw14VzaeXqzXtVewKexVOdGu13o78/HP4MtiHNe+9u8ompv
	SYxsSQxFBpM1Le8JpzqzveEwLdwaHSjUBitoGjgES1jkzjsppqkf8kNXTBwf1uWQCtuQ
	lvofFyaCXqqIFFjXZW8fj/jbtq/JuUsmw8I4sxablD32cmWSqom7XT8I5O50P9zcCrUV
	CiLCgmQ3hI8WDEriNT53Sqq50oDz78VaEfNs/glC3xomaH0YE1hRIfkA+QJE8RxVg5KP
	yJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CE4W4uEr4O1QuLEItAJf2FAgjsHKe4Re/ECQLTSq0J4=;
	b=HPpj3HAKoTexPjkKx/kxKHWJsYKf/P4q8W0WcYTpXbmawd/N9UKtx3hbaM8VWVjOc2
	DdIeElKjkyoIJjyjQ/Gzqt2NZGwkNLNk51NvPnbXei3onHepCSGnvnxLPapnkwBds3EY
	L2+shIebtnVdESFpE0qM0xfosNm3+C/CLu+n4GmzQg6a0cqAWZv6cmGdcJ3l7f+EQ+nL
	uvo69dHjsTxVRP7dEhiv2MtsWHeQuQBA4rOMC6gCint8CfRcui3dSuy3+/Wy3obAlIy4
	B3/BQ0JaQMEhE/zt/V8nPmFH9Yq+1BuFss7fFGPWWti+YUIRd18IN4jqGFakRrD06o/7
	/Nsw==
X-Gm-Message-State: APjAAAUBefn5qDdPIoYhSw6sryATbUAIP/01zxUIpSsWp4mRz+YHzKxr
	kTEzShnrqV476+mxnD2KttnUDR2txAmwI0giYbU=
X-Google-Smtp-Source: APXvYqz4zECEPVd94JZtGHo4prj7xl5anK0REEDCUrrNnEj25akMbqYFJfaGa1PpsMJnpY18Abt6hKWsKEMaJ6VH2hE=
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr9077681ilq.306.1579496839361; 
	Sun, 19 Jan 2020 21:07:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:e345:0:0:0:0:0 with HTTP; Sun, 19 Jan 2020 21:07:18
	-0800 (PST)
In-Reply-To: <CAA=hcWT9A0rmV1B6-Jz0H2cOcn6Sp_eaRdAyF=8=v543+GudBw@mail.gmail.com>
References: <CAA=hcWT9A0rmV1B6-Jz0H2cOcn6Sp_eaRdAyF=8=v543+GudBw@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Mon, 20 Jan 2020 16:07:18 +1100
Message-ID: <CAA=hcWTiyJbOuLOW0qoQVwHHNZUR11ouS=94ihcZY8aKkXiZoA@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: WiFi network failure after updating thud to zeus
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
X-List-Received-Date: Mon, 20 Jan 2020 05:07:18 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I sent following message several days ago, the problem is that connman
sent DHCP request messages but no DHCP response received, something is
got wrong in network, could anyone advise what have been changed in
zeus?

I saw another email of eth failure after updating from thud to zeus, I
am not clear if it is the same problem of DHCP response or not, but
seems something is going on in zeus, appreciate your kindly advice.

Thank you.

Kind regards,

- jh

On 1/16/20, JH <jupiter.hce@gmail.com> wrote:
> Hi,
>
> I was using thud version to build image to run on imx6, it was working
> perfectly except I was told a bug in connman version 3.15, I need to
> build connman version 3.17. I could hot use thud to build connman
> 3.17, so I upgraded Yocto to zeus.
>
> After installing new image built from zeus, now I have a very weird
> WiFi network problem, it could not get IP address from WiFi router
> DHCP initially, after a while, the WiFi got an IP address
> 169.254.203.142 which is not my WiFi router subnet 192.168.0.x, it
> could not connect to the Internet either.
>
> My first suspicion was the new updated connman version 3.17, but when
> replaced connman 3.17 to connman 3.15 in an old version system which
> image was built from thud, it was no problem at all. Apparently
> something got wrong in the image built from zeus. Has anyone aware of
> that issue?
>
> Thank you.
>
> Kind regards,
>
> - jh
>

