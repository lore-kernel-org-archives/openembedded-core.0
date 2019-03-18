Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF097C7D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 21:16:26 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id c4so15834577ioh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 14:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dua1dT50gPE0IKi4dFLFz/EG/CrEd9ESOmDuUlnxQrY=;
	b=uWiW1BTIz6p2zlr7yhUyndHPU0XqGOL+hXjrg/zRPPV9mUZQx0gcIfSUql9K6VSGF1
	3MN8yAu0OtIxJr49vv6hrhJDqc1Oi5enDxqm9suaFEOST/7mm3tydkKJuRUxQS5BRoSq
	sj2XfaAWGkFXRSQI/doawGX/0D/9Et0IHlxLFMUmLdDFqmyIlkw4MrA5dxA+a9w2dUCI
	1R3vZSyOvZQ/uvCL7TGaVFqWxGQk7wvwHlvaa8m2HC/Hoz9ZnjlETgIY/o7g4trIw/b0
	cg571JxGZ10uyvJ1nmG3bab0ErZWJ8ORs+MwrUas7LygDKx1ELtWLO7l0q4+rMAkC9ZI
	39Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dua1dT50gPE0IKi4dFLFz/EG/CrEd9ESOmDuUlnxQrY=;
	b=dDINzUkDDyc73QYJUifMwvizZlapUbqrphz5uVG+uSDKn2ztkh5vfRm/ev0yQzdwza
	tJmn+x4pGHtm+OmhTlqAIo3rQttrZoMteSW5MpbZzQju1kfW3vTQzYtD5VrxT7i4U+U+
	aamKEueerUcTx94k9205K6Lvz/7n18HDD2EpP5eUkPCNIpyBJ5UCdfl0L9Q+YjumCWUS
	M8nFIAvj9iB1GOFYgo282q19Tfdn41e9QNH42m6gERk9DAC9AfKESSvjg/q2kgANnTZ9
	jDbH4b729Lokmvgbl6LaSheU2jCdlbw382nktaU3Lg/ZoMd4FkInbUSnakv+IcPucZSV
	G+1w==
X-Gm-Message-State: APjAAAW+9EPd3K8M6Mq9wC2RFr8433jgF1WIbGPPzFjsch0ewj3VhSQf
	xaaHsq8AVdRbqKH8iunzVuXjjK9x/S/pTodLCTIxAg==
X-Google-Smtp-Source: APXvYqw2qcAFSGiqX5rP7GEOrY73lPDGNQsIy5rN67HFBed3eIZD/igKyxgG6JMCOg9cjH9PW30hzm0ppnENUROhMnE=
X-Received: by 2002:a5d:860e:: with SMTP id f14mr12128704iol.294.1552943788159;
	Mon, 18 Mar 2019 14:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190315212140.9597-1-fabio.berton@ossystems.com.br>
	<a4bbe97737049688cff93e4da243c112e6e79052.camel@linuxfoundation.org>
	<CAP9ODKoTnuoKUUhpStFA-R_3+Pfzrt4uKDvOFdunnbYs8rqzZA@mail.gmail.com>
In-Reply-To: <CAP9ODKoTnuoKUUhpStFA-R_3+Pfzrt4uKDvOFdunnbYs8rqzZA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 18 Mar 2019 18:16:12 -0300
Message-ID: <CAAPZna03Cd1jxER3YOeEYMuGPFq+uahTM42ibQuTQRe2WLfsHQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Eric Engestrom <eric.engestrom@intel.com>, Matt Turner <mattst88@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: Update 18.3.4 -> 19.0.0
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
X-List-Received-Date: Mon, 18 Mar 2019 21:16:27 -0000
Content-Type: text/plain; charset="UTF-8"

I sent a v2 adding python3-mako-native to DEPENDS.

On Mon, Mar 18, 2019 at 5:58 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello Richard,
>
> On Mon, Mar 18, 2019 at 11:00 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2019-03-15 at 18:21 -0300, Fabio Berton wrote:
> > >   - Patch 0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
> > >     was applied on commit e68777c87ceed02ab199b32f941778c3cf97c794.
> > >   - Refresh all patches
> > >   - mesa 19.0.0 deprecated the use of autotools and we need to add
> > >     --enable-autotools flag. For details see mesa commit:
> > >     e68777c87ceed02ab199b32f941778c3cf97c794
> > >
> > >   The complete change log can be found here:
> > >     https://www.mesa3d.org/relnotes/19.0.0.html
> >
> > This failed pretty much everywhere, e.g.:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/407
> >
> > I think it will be too late to get this into 2.7.
>
> We are looking at this here; we intend to have it working anyway so we
> can decide if it goes on 2.7 or not.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

