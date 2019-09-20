Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 51E0B7F9F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 14:04:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 5so2650794wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ODWjdoaTP/cMWH69UYITuFbe9Xg+wND4ygtP9btywM8=;
	b=UwDIk9ktvRub45QxkYnbUPolozHRP8uh2be9ChCM/r2X384PCeDUnfgOcZNHRc9dNu
	Esg/1NeSuUMCpHlJtZw9UpOJgMmmb0JwoQZOjR2LGYMV+c4XJAE+Zgf28IaGAGhIJEq2
	oL69Z51F5j1hPyvCmVTBcRLXakOLTSMsh0GUFl62lCrrgH+RXzfm6QnKHE2emHE9Iny5
	/OS7HQQdCRR78z/auRH2JDqfNcXae9aSmtVaFQOQY0ISEUfnXtPo89g1i3MYFaegDgWQ
	eFtGx6W6PIzVihlnwXdtbuoTVTo+GMxq0ESTSWYWNmG4H4FFDEGOTqwqtS4KnUsPCVAJ
	zIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ODWjdoaTP/cMWH69UYITuFbe9Xg+wND4ygtP9btywM8=;
	b=jw68dUpcvPtji+Pep27Fho7iSuFhHuIZSRGkafBEftM9XX0H1KUYqFz01WxkRicFan
	tGHODq6euaVoSsc17g9DR+bUL56xsr2S19dpKyWLZL9gwTfos9IWarNxPiHEt2HSrJKE
	6h68vPVIM5oJe9Uep94Ht+rJpwKqjFObUYfNQjB3HR2bXUf+c8p0aJK1MK0hjvvleXL5
	Txy6AoK+pyjY3FVxyKNAEBPzuRvhrKOhm23vOPR/BzcPVILeNccOsGfm+JSpf0O3zZ1I
	V++8zNe1wjpigOM7NgklCegEc0YGoQRRy/ZT4WcDhKXEdb+WhxAfYqnMMsFHLjz+PkLq
	ONgA==
X-Gm-Message-State: APjAAAWLZfjf16HwshxDHzSt3waLS+wzZviKoRbV1jNS5HRmgFkkHn4L
	uan4l4RauQgJflzqYySi3vFrIX5x9OFkV7MGNco=
X-Google-Smtp-Source: APXvYqxWG2+bLrovt8sUakrm7Fy1WK/t/UZ9LYeTd/K3n0Z9bnwUDedIc5JVHboPN5bJIwi5d/sRKyTU+qym8AEItrU=
X-Received: by 2002:a1c:1f89:: with SMTP id f131mr3527288wmf.72.1568988263948; 
	Fri, 20 Sep 2019 07:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190917184947.2244823-1-raj.khem@gmail.com>
	<CAHtQpK4svi46b06dzCfCX7R-i6uiooQ0hi0mmdcOuoY+Ccm+MQ@mail.gmail.com>
	<20190920133829.GW6154@hiutale>
In-Reply-To: <20190920133829.GW6154@hiutale>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Fri, 20 Sep 2019 16:04:12 +0200
Message-ID: <CAHtQpK5cHSYFRr_Uck96fXDHZftV0ZEDeQz4K8SR3fO8zVjFtA@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH] openssl: Enable os option for with-rand-seed as well
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
X-List-Received-Date: Fri, 20 Sep 2019 14:04:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 20, 2019 at 3:38 PM <Mikko.Rapeli@bmw.de> wrote:
>
>
> Do you have rng-tools on the image? That helped me with the kernel random pool
> initialization for sshd in iMX8 and openssl 1.1.1x.

No, but I would definitely try it! Thanks a lot for the tip here!

>
> I don't see how 53b5654d6e could change this behavior for target openssl.
> 2c6b9b918c could change the behavior and would be suprise. Maybe also
> target recipe needs --with-rand-seed=os,devrandom on iMX8 or similar platforms.

This has puzzled me as well.. Actually, the 53b5654d6e is related to
2c6b9b918c in a way that it fixes the build issue with various
components. That was the reason I reverted both of them since they are
going in pair. Strangely enough, when reverting the openssl version to
1.1.1c - sshd starts to work normally.

I'm building now Arria10 to see if I can reproduce the issue there as well.

-- andrey

