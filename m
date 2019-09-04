Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id AB35B7F28F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 15:08:54 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id j5so103206vkn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6mNkHCDtHkkJv1UxjnDbZlPZjkPZyqPMOM/xLulMk1A=;
	b=hIfjMkiTkL6UxC68NLzE0d58jMFPMLlppQUdM0DGYkdTulHhG9/GfP9a2bp2irAqxr
	ImWpqMB1yuBAW5SmFq3mwXKJq6xg9e8X8ppvxO4pEKFjHR5hhLh+XHBfIfUuZL8PghMN
	ELJnysMyRTDaGXHf7ZqRbTzakCt8uTueSFlXV5uftP/9lCX2bqiBU/b3znfu+kFbt4Km
	5A1bEN58oQRuW5951FNnI9e6BN1/uBbt+oaV73hnjY7iHyIj+T7BwT6NvyDkm2zctP+3
	8XonKxGl9JJ9bkkKPdg9hc3wzXR0wSRiy9TIHWmM4sd5skMcQGwwKBzJICFKDno1e0tL
	tcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6mNkHCDtHkkJv1UxjnDbZlPZjkPZyqPMOM/xLulMk1A=;
	b=BRF18Jy7axEXUI56NZM8RKduudaV4vOXSWXf5+SMZZvqBW4dQRKc/YYLz8WsW2EsIS
	vU+at+vTopzmZXovMj5eHKjFBdhbHyxvbA60cFk4hWZtro9v96d2+qPUdvKj3wvnGk1u
	w6m5Zkcu/QWgoB6yCJswXCNi3/rSXpRhFWdqsyfOUIjhXMBfyFbyTc/HehmAsdC7b/UN
	505QX3SoPhYmn5lnaMDRX+U7IWPjK/47f+FWQN54GAsIXee6l1KXnaZRBzT21jPbBeA1
	qI1y3cutkFXAEGkLTiQbxEBFE1NAezfx25V2DWa0oQ4G085Hr0iSUCVEOMacOObEx3fm
	r9Ng==
X-Gm-Message-State: APjAAAXh/xJPgWKney5xWsLXrfMV5oFKqFhci7yQ9K9h7oaiZUaA4yWE
	kzPb3vmlUcTvnpbEDW9R0APjm1X1Acf/7PLeMD4=
X-Google-Smtp-Source: APXvYqzTQVVXZCqn5POTFZDTI0yHxRYs7Iq6hds4dtwJgDfPFBy3EiW8PV+umcHRDENm58Gz4YT7c14NMlVnooh/dkI=
X-Received: by 2002:a1f:a5d8:: with SMTP id o207mr19547087vke.12.1567609735544;
	Wed, 04 Sep 2019 08:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190903163241.87739-1-alex.kanavin@gmail.com>
	<20190904073239.rlk6spusid6m2zbd@qschulz>
	<CANNYZj_ZFESLDrUxU9XjjdTQXEp-awnq+-EJEavE32SqJOZSXA@mail.gmail.com>
	<20190904125538.c6f6mz6cwcz56ebr@qschulz>
	<CANNYZj_N9hz-mwKPofSUY7Lrf-L9B2Ep+z1sbCcL9wdhtBP0Gw@mail.gmail.com>
	<20190904145724.w7tv6oorinwuxdhb@qschulz>
In-Reply-To: <20190904145724.w7tv6oorinwuxdhb@qschulz>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2019 17:08:44 +0200
Message-ID: <CANNYZj9o57VKzCH_yDwXKGEm6zzMLBebjkc+e8K7FSuVbvNLyg@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: allow shell-style wildcards in PRIVATE_LIBS
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
X-List-Received-Date: Wed, 04 Sep 2019 15:08:54 -0000
Content-Type: multipart/alternative; boundary="0000000000006f01620591bb9593"

--0000000000006f01620591bb9593
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Sep 2019 at 16:57, Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> > the original code is not adding any lines at all while yours adds eight
> so
> > I'd just keep the patch as it is.
> >
>
> Added lines vs added execution time.
>

I am fairly certain do_package spends the bulk of its time elsewhere, so
you are really optimizing the wrong spot here :)

Alex

--0000000000006f01620591bb9593
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Sep 2019 at 16:57, Quentin Schu=
lz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.schulz=
@streamunlimited.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">&gt; the original code is no=
t adding any lines at all while yours adds eight so<br>
&gt; I&#39;d just keep the patch as it is.<br>
&gt; <br>
<br>
Added lines vs added execution time.<br></blockquote><div><br></div><div>I =
am fairly certain do_package spends the bulk of its time elsewhere, so you =
are really optimizing the wrong spot here :)</div><div><br></div><div>Alex<=
br></div></div></div>

--0000000000006f01620591bb9593--
