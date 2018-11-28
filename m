Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7F86C6C5D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 10:58:28 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id h25so22212362oig.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 02:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RrHT+wERoDcxbLiyt4inr4moqX/7Z/8wL7scf3odAGI=;
	b=deqA6TMlxoaZo0MjjinNKum56wnE67o1l/nAUr+kIKvUNe7qhvcxv+TMTt42tOE0Iy
	yeAoniCcD+DISYaO6VqVF1tmjF68oIZUpmJSn/Fy/N+8Y8oxOtYVUQo+x4Vood8Fdrjo
	7hCHaq4J79VMqijr0tB/5hgYfz90j/gnmnjOPnORUCp+UexLtAVmPh+H5eOHqzwwGqPR
	3eNxquOKBxFgNc3x1oCWFEP/E5mFgPdMMNp/bzYWdaMaMnJuoFFMijy/4gNRiwCg7D9K
	UpxFjnb6XYxg6r2DaY/lkS7uWXQh2vCSPCj53tLEuQPkSmpha3xz00H44TxCc3pS9aDt
	nCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RrHT+wERoDcxbLiyt4inr4moqX/7Z/8wL7scf3odAGI=;
	b=mWpgQG7DqeaJri5zFIQpwGaP6DfQ926/ZDA+J/QHCs3dyAw4ZH4x7zPjnXAxM6VRA0
	hEbIr4oOqwMhVMSxA6Fvyr7dzo0d679iHsGfrcSy1sRvgpDns5gozngGXhHz8KyleioO
	xv67UOdjAaWCpo7VxHyA/KKNuY+cIYMZrHMs8a/TIdK0Nf5f/L+zJR9C6Mq41UzKuggX
	a21lWEsi6zW/m+728TfeJnFk1znZR2/FV0ybMIOqeUnW0B9izB5gHCVUAC7RNyYrNPx0
	cOl1UNlL36JFMaLXbky6Ug5zN8pVtlpyzFZAFKEmfYVyUe7MliF0JQA0lelVFUsNtzr/
	fuBg==
X-Gm-Message-State: AA+aEWYwHjmp8kOrzZp+mbT6ix78tX/SRj1LT7HdXPuLHoI4U8JDrS44
	3n1QEaaORz5pDjaWxJ8IuPYhg9HRIS+WHw==
X-Google-Smtp-Source: AFSGD/XTH5nwSYn7OlpgnwdiPg/S6jUnGvHBRVGxOQARErONme2ewa2BZKXD96fzaiIMulCkWPtl/w==
X-Received: by 2002:aca:bdc1:: with SMTP id n184mr8811431oif.223.1543402708794;
	Wed, 28 Nov 2018 02:58:28 -0800 (PST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
	[209.85.210.50]) by smtp.gmail.com with ESMTPSA id
	j13sm2459064oth.48.2018.11.28.02.58.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 02:58:27 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f50.google.com with SMTP id u16so23116040otk.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 02:58:27 -0800 (PST)
X-Received: by 2002:a9d:1b2c:: with SMTP id l41mr13375412otl.1.1543402707002; 
	Wed, 28 Nov 2018 02:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20181127191255.39052-1-abrodkin@synopsys.com>
	<CAP9ODKq2NRaMcW3nY-cs-uBuKBG3xx7sAuzBoZtRheo-jz+7CQ@mail.gmail.com>
	<CAP9ODKo+3XpTqsVpUB3s2OhUuV2039J-RefKOBvDNVABQB18+w@mail.gmail.com>
	<33b52a810fe1248322362e401b7138024caca0cc.camel@synopsys.com>
In-Reply-To: <33b52a810fe1248322362e401b7138024caca0cc.camel@synopsys.com>
Date: Wed, 28 Nov 2018 08:58:15 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpJ83gkrLfcAxVo9VonZbAyLcYvrV-5taX7yTJyM4w4kA@mail.gmail.com>
Message-ID: <CAP9ODKpJ83gkrLfcAxVo9VonZbAyLcYvrV-5taX7yTJyM4w4kA@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	linux-snps-arc@lists.infradead.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-tools: Improve build preparation
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
X-List-Received-Date: Wed, 28 Nov 2018 10:58:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2018 at 6:49 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
> On Tue, 2018-11-27 at 17:52 -0200, Otavio Salvador wrote:
> > On Tue, Nov 27, 2018 at 5:30 PM Otavio Salvador <otavio@ossystems.com.b=
r> wrote:
> > > On Tue, Nov 27, 2018 at 5:13 PM Alexey Brodkin
> > > <alexey.brodkin@synopsys.com> wrote:
> > > > Even though we're not going to build here real U-Boot binary
> > > > it is still required to "configure" U-Boot to get get to the
> > > > tools building.
> > > >
> > > > We used to use "sandbox_defconfig" for that purpose but
> > > > since U-Boot v2018.11 it started to cause problems [1] due to [2].
> > > >
> > > > So to have less dependencies let's create super minimalistic
> > > > configuration which is good enough to allow us to run "make tools".
> > > >
> > > > [1]
> > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__errors.yoctop=
roject.org_Errors_Details_202185_&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=
=3DlqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=3D6GBkAGgxs4IOh0rJ4joj36Xu=
kb_msE_tdIIJQXh8Gbg&s=3DvuvAMfkM9WIKHek7mwuwSjWKKpUcKJ-zCcKypEfxCuw&e=3D
> > > > [2]
> > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__git.denx.de_-=
3Fp-3Du-2Dboot.git-3Ba-3Dcommitdiff-3Bh-3Da4958a71017fb142542f977c843c5fce7=
69fc6ea&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3DlqdeeSSEes0GFDDl656eViXO7=
breS55ytWkhpk5R81I&m=3D6GBkAGgxs4IOh0rJ4joj36Xukb_msE_tdIIJQXh8Gbg&s=3DGN4U=
6Of_hi-W_5CEu3RvRUIVEjgaNwnK8CarkwIly4Y&e=3D
> > > >
> > > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > >
> > > To allow extended use, we need to enable CONFIG_FIT_SIGNATURE
> > > otherwise we won't have the support.
> > >
> > > See:
> > >
> > > # MXSImage needs LibSSL
> > > ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_ARMADA_38X)$(CONFIG_ARMAD=
A_39X)$(CONFIG_FIT_SIGNATURE),)
> > > HOSTLOADLIBES_mkimage +=3D \
> > >         $(shell pkg-config --libs libssl libcrypto 2> /dev/null ||
> > > echo "-lssl -lcrypto")
> > >
> > > If you do that, we can likely rely on this and avoid some extra tools
> > > packages (for example on meta-freescale).
> >
> > Looking at this, I am wondering if folowing wouldn't be a generic
> > solution capable of upstreaming:
> >
> > diff --git a/configs/nativetools_defconfig b/configs/nativetools_defcon=
fig
> > new file mode 100644
> > index 0000000000..be69bdf43a
> > --- /dev/null
> > +++ b/configs/nativetools_defconfig
> > @@ -0,0 +1,3 @@
> > +CONFIG_SYS_TEXT_BASE=3D0
> > +CONFIG_FIT=3Dy
> > +CONFIG_FIT_SIGNATURE=3Dy
> > diff --git a/tools/Makefile b/tools/Makefile
> > index 3c0521f655..e916d0cebb 100644
> > --- a/tools/Makefile
> > +++ b/tools/Makefile
> > @@ -124,7 +124,7 @@ fit_info-objs   :=3D $(dumpimage-mkimage-objs) fit_=
info.o
> >  fit_check_sign-objs   :=3D $(dumpimage-mkimage-objs) fit_check_sign.o
> >  file2include-objs :=3D file2include.o
> >
> > -ifneq ($(CONFIG_MX23)$(CONFIG_MX28),)
> > +ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_FIT_SIGNATURE),)
> >  # Add CONFIG_MXS into host CFLAGS, so we can check whether or not regi=
ster
> >  # the mxsimage support within tools/mxsimage.c .
> >  HOSTCFLAGS_mxsimage.o +=3D -DCONFIG_MXS
>
> So do you think there's a room for improvement in my patch for OE?
> Or before we get a missing part for tools/Makefile there's nothing more
> to be done in OE?

You could use this attached patch (marking as Pending as it is still
RFC). It allow us to drop or 'mxsboot' recipe on meta-freescale, for
example.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

