Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6F7F97F3B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:12:15 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n7so7169379qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mmKsAAHpMUDipwabhJi6Ro4Vy16ew9UDHDXgOH2hC7Y=;
	b=B0H42oXFM3qoPR31MMsCeY/58/OusBKG0sJTLQSZujh9OXk29I4Ak1QRIlwIuPjkJE
	ItuQk/7CP3kt8pKsCc2EM+qIXHB5byvy6pAvvfmOhALS9ka6yhSy34oqj78/5iXJwO5M
	VzuBHFW/5wdYe7rI943psZNF45Lewt+vOvlf8kyTjON2MSHGU4/GhwzFPemshKghu/YS
	NGbOYzYecrMsmGgOiERMZiwqYwvYRGbNbN/qP2+cm8SBqMXJWM0CpisrnPCncGI5OXM5
	Dgi7UbhfvicoD9GeRrNvxrQfPi2PRG0K4FY4R7kUUDVFPvEk92BBxQE9GV7iEhP8mG4f
	B1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mmKsAAHpMUDipwabhJi6Ro4Vy16ew9UDHDXgOH2hC7Y=;
	b=iEaMyRqeNmYZOjQF0u39aC1Q317PFMXE+M5Zas3Lt6EEnhu/PatczLnPWhulFYqrKj
	uaCBqHnHT5eUGJuUMTRE+XTD15H2Yvd9VpQfJu8xMxHBN/lt9mZkbmMwGqhAflYpMaGi
	zJspIwxm/mPBrN2Y/RUD97nEdzpVlACoBKff8LaWCiS5/oso1ZBiCFS9f8RjdN95o/zZ
	8/GJyLrh3ncIuyAXoF2XA9C1XylkDp7m/R3kA8yqpuomdSFxKuJSSIr99x+Boz6OHODr
	8Gru+56NtNsvt5gV4HD9lb2UzHA+1UJaUjoCVA0iG8QwUJslAz65Rk4nDbqJoTX7MbOL
	9eKA==
X-Gm-Message-State: APjAAAVr6vU/xwd8hnGbtnzVd+aUd+HLMxzS49ONX17AqqbevwmdGS3m
	XQ6g1UWBm4cG9MWpBE4zzw/BlHv+1rLR7sfaU5w=
X-Google-Smtp-Source: APXvYqyqsta3CkO0qsjI13+aQW3wkH4AANyK8qyEEPSJV2NPfT28+cZqzi4oDbUhzLR+5ZzYYyjdI4PfxX9Hx57DFqA=
X-Received: by 2002:ac8:460d:: with SMTP id p13mr9314016qtn.378.1567779136184; 
	Fri, 06 Sep 2019 07:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190831142252.7204-1-raj.khem@gmail.com>
	<CAMKF1spmWGzRPyih6uZsDmZj4Rwb0s_uwLOaDJuVGxyvtbS-jw@mail.gmail.com>
	<540dfb8b-f256-3983-a61e-ca4cc833c6d5@geanix.com>
In-Reply-To: <540dfb8b-f256-3983-a61e-ca4cc833c6d5@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 07:12:05 -0700
Message-ID: <CAMKF1spJ4scwiMq5eNVCg-6dBk5VfozN6DwosoNHxKgE37pSHQ@mail.gmail.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Fri, 06 Sep 2019 14:12:16 -0000
Content-Type: multipart/alternative; boundary="0000000000007fa4fb0591e3061a"

--0000000000007fa4fb0591e3061a
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 5, 2019 at 10:51 PM Sean Nyekjaer <sean@geanix.com> wrote:

>
>
> On 04/09/2019 01.50, Khem Raj wrote:
> > Can we cherry-pick this patch to warrior and thud, please ?
>
> Hi
>
> For thud that uses a older version af libgpg-error, and the patch
> doesn't apply :-)
> Should I update the patch for thud and resend?
>

That will be helpful please do

>
> /Sean
>

--0000000000007fa4fb0591e3061a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Sep 5, 2019 at 10:51 PM Sean Nyekjaer &lt;<a href=
=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
<br>
On 04/09/2019 01.50, Khem Raj wrote:<br>
&gt; Can we cherry-pick this patch to warrior and thud, please ?<br>
<br>
Hi<br>
<br>
For thud that uses a older version af libgpg-error, and the patch <br>
doesn&#39;t apply :-)<br>
Should I update the patch for thud and resend?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That will be hel=
pful please do=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
/Sean<br>
</blockquote></div></div>

--0000000000007fa4fb0591e3061a--
