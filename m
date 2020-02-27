Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8308E60207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:03:29 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id g7so744758vkl.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=57Z4CINa9Oif9UFYbyO8Fn1ooBRQiEUcngRLldvW1vU=;
	b=BoQ4gqKulfTmywzEwHSlty76E/EM2itJMlGcQtqcSePpPlvR8uNA4ZuszMvlcVlKf0
	atrr0Qgp9iCRtFzmnG4jMijICcryUiIWhuYnvC49oYK0v4nFkkzBc3j+LlU7+Ps7ROLG
	IIeqfkBZDDVQyfYf7dzS7HfxNcw7cGFn+VbNlNGFaZdZuzNXaHRSCoUtHMs+9fC1HLUg
	h80WxQCSqgNb821uNX3g5mQ1KXuNrbWCR+Fd2zosS98xSwraN6qpfDcMTfaRnxjjuE5H
	Wi3FznimOSkUoKTteEatgscgsNUe22To04ZsBeYap30B1dg8IxjMu1KjesyuWblAiI2J
	8ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=57Z4CINa9Oif9UFYbyO8Fn1ooBRQiEUcngRLldvW1vU=;
	b=W2pCv30/LMn2fWg531MheLUYZQ4T5124uKNny2Jt5REFloB+BEblrtEgiDBgch/O+g
	oKoiuzEnetFIsAvKJmEg0tHBtVIajhKoZ277acOb+jQwP49lUNVbre8rdy1snKLuRoyI
	75tJX2t8dhwEDxtvFjx9GuxunHote7yUTXaO+P9CwlU/UM5zdt1MlUlsl+UjJSFGF4Ia
	l/bdeiPysUNj0OuWTGoPQbppR8SpnzirvEu7BDcciKokgpUR5VMoo918I307pyxRYUce
	Fvah/hcsQeW65gGizuAwGHcEeijOiXjGtMveofe3dA7qPoSFZgeNbQ17YpQX13AgBlU1
	Cv0A==
X-Gm-Message-State: APjAAAUkfLavCohJh7hTGuM2leIF5aPRXm695wukq2h4asnyKqb2smeu
	iknn5gbhNRoWCK5mgu+FdnIeGZ4MoZIDcmTvc9A=
X-Google-Smtp-Source: APXvYqz48WtoXCBggFfz+N0BPLaK5jzLDIGatG0ETLHeUb8vdOdOt8VIdvkxq6aIbWjFeolTl3NnE7Im9WrhOStlYoE=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr2631137vkc.1.1582812210102; 
	Thu, 27 Feb 2020 06:03:30 -0800 (PST)
MIME-Version: 1.0
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
	<20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
	<20200227132729.GA6240@localhost>
In-Reply-To: <20200227132729.GA6240@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Feb 2020 15:03:18 +0100
Message-ID: <CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 1/2] nss: Move to meta-oe
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
X-List-Received-Date: Thu, 27 Feb 2020 14:03:29 -0000
Content-Type: multipart/alternative; boundary="0000000000008788a5059f8f2f86"

--0000000000008788a5059f8f2f86
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Feb 2020 at 14:28, Adrian Bunk <bunk@stusta.de> wrote:

> >...
>
> It is a crypto library with a history of unfixed CVEs in supported
> stable Yocto releases.
>

If the issue is unfixed CVEs, then I do not think it's particularly
relevant which layer the recipe is in. Stable release maintainers are not
expected to 'track and fix CVEs', that one is on users.

Alex

--0000000000008788a5059f8f2f86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 27 Feb 2020 at 14:28, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">&gt;...<br>
<br>
It is a crypto library with a history of unfixed CVEs in supported <br>
stable Yocto releases.<br></blockquote><div><br></div><div>If the issue is =
unfixed CVEs, then I do not think it&#39;s particularly relevant which laye=
r the recipe is in. Stable release maintainers are not expected to &#39;tra=
ck and fix CVEs&#39;, that one is on users.</div><div><br></div><div>Alex<b=
r></div></div></div>

--0000000000008788a5059f8f2f86--
