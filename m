Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 147587E873
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:58:11 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id i21so2641234ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qD03B7IyyL9HO7txmb0GGWKImDl6yqriGLZyRU2iCSw=;
	b=KuytpVG0Zd0uRJw3KcuNLux/XrJnPJQA9uYMnu3SYfOVt1lWiMQSFV6YckHMkau2dR
	MLKuNlc9/4OJRBktYa7cIRcUZnxsEZ6H+Ro6lj6fYpUxTlstpZhaKbt8+erLqDgQO0jv
	AvFGr8hNeT4NHMLZDY/lNe78E69N6Vi26oEtn2UvE/lIBSNpKKhH3tcUUvvVDRvk47VS
	1Yvlt490aND++mocDIxtmzVOZHA2h4w5iSnOmbZQeSD0ZaXiVmBU7A7O2F6LWGMZYUiI
	0uYhwkX2TEXAdQ6E7wO/K7nz/HUo8gYv9R316GLOH6D0e3S9e605v30NO/IxzwR76MkF
	TziQ==
X-Gm-Message-State: APjAAAXNHb+cdS1ssWiCw0D8lHGh4LA94yUhWmmv599O1ICkytIrXiSU
	2juF0NR6P/duPPDS1IJUA/AxGlq4xP9VqtZT+E9gY147
X-Google-Smtp-Source: APXvYqwgv8Pa+rPjov9dE/482MC6i9WnibZHzGw8RG6fKsYO7wGLuArzibUJO0BcleLesCXgTQHoasaorRG6iMvuraA=
X-Received: by 2002:a2e:124b:: with SMTP id t72mr57824046lje.143.1560938292511;
	Wed, 19 Jun 2019 02:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190619094436.2024-1-ricardo@ribalda.com>
	<CAJTo0LafiOR5uE8cD3wv79TeVsY0OSsoMsUG1OcgMwCXgBwYHA@mail.gmail.com>
In-Reply-To: <CAJTo0LafiOR5uE8cD3wv79TeVsY0OSsoMsUG1OcgMwCXgBwYHA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Wed, 19 Jun 2019 11:57:54 +0200
Message-ID: <CAPybu_1i_Hi6h7kcHSgzEAR_9jC4xw+zHOzHu0g6bvQVx0s_4g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] less: Create symlink for pager
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
X-List-Received-Date: Wed, 19 Jun 2019 09:58:12 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross

I am ok with that.

But looking forward it is definitely more difficult to maintain that
patch on future dpkg versions. Will prepare the patch and then you
decide :P

Thanks!

On Wed, Jun 19, 2019 at 11:55 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> dpkg may, but that's because dpkg is the Debian package manager and it
> follows Debian traditions.  /usr/bin/pager is a Debianism: I suggest
> we just patch it to use 'less'.
>
> Ross
>
> On Wed, 19 Jun 2019 at 10:47, Ricardo Ribalda Delgado
> <ricardo@ribalda.com> wrote:
> >
> > Some system tools (like dpkg) expects a binary called pager when they
> > run on a interactive console.
> >
> > This patch addes this symlink via alternative, so other packages can
> > also provide this symlink.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  meta/recipes-extended/less/less_550.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/less/less_550.bb b/meta/recipes-extended/less/less_550.bb
> > index bb1618f1eb..8f59bd6087 100644
> > --- a/meta/recipes-extended/less/less_550.bb
> > +++ b/meta/recipes-extended/less/less_550.bb
> > @@ -24,6 +24,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> >                      file://LICENSE;md5=ba01d0cab7f62f7f2204c7780ff6a87d \
> >                      "
> >  DEPENDS = "ncurses"
> > +RPROVIDES_${PN} = "pager"
> >
> >  SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
> >           "
> > @@ -39,5 +40,6 @@ do_install () {
> >          oe_runmake 'bindir=${D}${bindir}' 'mandir=${D}${mandir}' install
> >  }
> >
> > -ALTERNATIVE_${PN} = "less"
> > +ALTERNATIVE_${PN} = "less pager"
> >  ALTERNATIVE_PRIORITY = "100"
> > +ALTERNATIVE_TARGET[pager] = "/usr/bin/less.less"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Ricardo Ribalda

