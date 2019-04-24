Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id D85027D5AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:25:58 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id e8so4433470ioe.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m/3kJskyZxR0ezls/XMYjZadR5/IPqQ4zvjEb9wJR4s=;
	b=Fza7kchOIoVKs8Vs1okty1W2otqRiBZNhVWe0yB5TbR2v7JYf4MOc3N6uCzK9k9afe
	1vhmC4TgHEyoZGNN+AEIngExBF98Jj4BrtDup9T9vYxsGFJMQyOJMmTVp1SBBNJyLXHb
	R+c5iu1DNKeL0PWsYQaBYo069X0k+wyICyvrIPVmnkXb6B5T9YpMEHhD2ZCWcdu5370t
	pI/lt1JxTQmSAghQQHNpteWHyQZh1YWefaHVm4IfokU+2tPNWDtC24F0OCO6fIpEf/sY
	61wnh+gkUpxDc5+Twot1EkuN54eZaa5crqypMVVfu+UOhK6/ciz1mswoToHm/7GOwsgo
	MeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m/3kJskyZxR0ezls/XMYjZadR5/IPqQ4zvjEb9wJR4s=;
	b=fWUQUP3X/Z7RrJ06AZwtkd4/goK2e3egZng+lOuks64aotvUkCWvUiK1cGluLgsg/U
	0H7HL8wjkAGplLSbXd8iIFA8EWfBXVrMVYCYRLjm54IX8h7A802oWWgaPaEY7uAFE5Wd
	8Uh8nlg458gRsspuflizuzl8pxt2IUGxv4pvuuKLXZIrattaskma7ZVPMuFGCDmkNZ2k
	4L3gZg3q5Kg4/INdeqtpG32IwQPZcFwy3GwJuNnPJg5uetw5vqI4dCpWTz0w5ffzspJ4
	pcVCtXdJ7CjR5t7q7AYDNpKIKSyuf7YfXUSvLarAvPy6SLGDUfkJ7+RWhQMtiQP1AwcF
	8HuQ==
X-Gm-Message-State: APjAAAWBIWOYN18nUKny3kg9ZXwRnbPdXqNErJzU9pHrmN2oOd8S4kth
	eBnBBjvCQH/hTEt6MuyNpVld0Frg+d16WOCa6bAgmw==
X-Google-Smtp-Source: APXvYqwA1vRLVBbUckhNakbWbt1/9Ue6TaEnvveJVnGrbjy60l83wXN1fcai4el8oJKJVmsiAFsglYxrJsNvwUvLTIE=
X-Received: by 2002:a6b:6f11:: with SMTP id k17mr4218042ioc.76.1556130359850; 
	Wed, 24 Apr 2019 11:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190424071955.22692-1-zangrc.fnst@cn.fujitsu.com>
	<CAJTo0LZJFLLtO7ZEX7SBUpo4T-=pSE++gKFdAAaTsd5iTZYefg@mail.gmail.com>
	<CAAPZna30Z1BydPm2YVr1VtWQf4VeK_ybK34+9Fs08O9fujMiqQ@mail.gmail.com>
In-Reply-To: <CAAPZna30Z1BydPm2YVr1VtWQf4VeK_ybK34+9Fs08O9fujMiqQ@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 24 Apr 2019 15:25:41 -0300
Message-ID: <CAAPZna1bD19D79uqKUVjBjSgTPLMamoqnRkcHeC9iSU7wqZ0jg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa:upgrade 19.0.1 -> 19.0.2
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
X-List-Received-Date: Wed, 24 Apr 2019 18:25:59 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Zang Ruochen!

You need to update mesa-gl recipe too.

On Wed, Apr 24, 2019 at 3:04 PM Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>
> Hi Alex!
>
> I'll rebase meson patch to work with this version.
>
> On Wed, Apr 24, 2019 at 8:07 AM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > How did you even test this?
> >
> > ERROR: ParseError at
> > /home/ross/Yocto/poky/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb:1:
> > Could not include required file mesa_19.0.1.bb
> >
> > Ross
> >
> > On Wed, 24 Apr 2019 at 08:19, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
> > >
> > > -Upgrade from mesa_19.0.1.bb to mesa_19.0.2.bb.
> > >
> > > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > > ---
> > >  meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} (85%)
> > >
> > > diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
> > > similarity index 85%
> > > rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
> > > rename to meta/recipes-graphics/mesa/mesa_19.0.2.bb
> > > index d90be8a074..e6646e8503 100644
> > > --- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
> > > +++ b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
> > > @@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> > >             file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
> > >  "
> > >
> > > -SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
> > > -SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
> > > +SRC_URI[md5sum] = "7f84af1c3fe2078c35a7a991d1469921"
> > > +SRC_URI[sha256sum] = "1a2edc3ce56906a676c91e6851298db45903df1f5cb9827395a922c1452db802"
> > >
> > >  #because we cannot rely on the fact that all apps will use pkgconfig,
> > >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > > --
> > > 2.20.1
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

