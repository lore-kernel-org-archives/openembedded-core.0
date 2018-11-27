Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5680B6BC7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 17:59:23 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id o125so15173033qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4iYocQGH+LQhHM5BSolHEvMT+vcEIyqktBvG9xT+ACA=;
	b=jjuBx3HW8Q9SO9JP4IaLL4i3T4kZfoZ0b/1RLTvxFKxpasQfHtk1p2r+iop1MDaBUN
	oJjVHHKtBaNpPg+j60eJ7FXPLXqeIYjJEebGCqodecEuQwju/2ihxI5289H29qhXyVDc
	KZ59nPTJT3xaYJvgIQC8EmjirAk4RfqwOaJY3QgFUGcf3KUmUOrhp7dmRIsdlYP23xa/
	OZRVGLIxOyMgsPdNiIf2PAo7mly+64aV9+rYO2/MU/rTCpqA6yqP71lv2UScYpCXiiN4
	pxyu0uA9EbyPQZq0jrqGPrPJuaimmNGfAzPznrHTnmLFQud7cyVHSj0ZoSt61B6Pf8UW
	sWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4iYocQGH+LQhHM5BSolHEvMT+vcEIyqktBvG9xT+ACA=;
	b=AnvrbXTL9p5DXm1CCQ0RnAXgo8A5yo66ymKMNvbyUoDWh6icExBa+63CJ0okWdqIh8
	J9WQTOq6sWSnMT12Q+OiqAbBTwjo6FG2vudHHepwZFDfLdFQn7vBkmIxtKcnnml2ZihL
	9iUzjWhA+B0R9FQZ9gMncUXlHZD2wkUcpyEJJ02NU2OBLtHyIv+zoZLoz/9EUL/vmRjU
	YIRKvWaQpMky5OWWLiW+3ABtOfDgxLOoQrvEkENKyGQN/NkmyWkMymOd0AtQABPEbf8N
	M+6JPhFj4RPDmOv5P+2eRTftoTNaqJbKMF3yMhZtCESWf+NkxF618y9mU6lm+n3kW1Ej
	5QKQ==
X-Gm-Message-State: AA+aEWa3fYZMQBw4q9YXoPhIRhCV2Y5GUa4EWFfq9XgTzr0VDvWAnFXe
	vyhKAkmmaml1Gy1+Iop+fepk0uNwQYyUiDtoCgY=
X-Google-Smtp-Source: AFSGD/W4azrh0D8yeao7PHumoTiKW/EJ1igDiEaK6m/joly4OanFzxFeHsf7Bg8adr4UUF6RKBuwwK/Ge9h4up2V0WM=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr30372740qkf.223.1543341564088;
	Tue, 27 Nov 2018 09:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
	<CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
In-Reply-To: <CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Nov 2018 09:58:51 -0800
Message-ID: <CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Tue, 27 Nov 2018 17:59:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 27, 2018 at 12:48 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 26 Nov 2018 at 23:29, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Nov 22, 2018 at 7:42 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Also, change default meson option to building introspection files
> > > (previously they were not built by default).
> > >
> >
> > I wonder if this is causing
> >
> > http://errors.yoctoproject.org/Errors/Details/202291/
> > http://errors.yoctoproject.org/Errors/Details/202280/
>
> "Could not find GIR file 'Gee-0.8.gir'; check XDG_DATA_DIRS or use --includedir"
>
> This file is coming from libgee - it has the necessary file, but does
> not install it for some reason.

I repeated this qemumips build on a different host ( running archlinux
) and it worked there. The host
where it fails are centos7 and ubuntu 14.04

>
> Alex

