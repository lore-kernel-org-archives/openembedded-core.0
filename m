Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id C8A1A7CFAE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:00:59 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id x3so7790527iol.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZDOZt2mVYmcKpJ3Swafr32kvwIfws98FnSshIdBBqe0=;
	b=gEbH+2EpDgdfRVlUUY41xrMQoQnFvF5kWJGXXgHtMI48eeAGrlvxCS9wRMN6bhHTfr
	+75Vtic3eRMTbo9t/apdr7le748qgdgRvGHNiO3Q40esbH4DHKH8z9GRYXEbIGGhKhB0
	ZeWw+hu8tLlGwhfEF2l7X+XVb/XKfssQBuF7QndHUVGHS5M0D2jc7L1YIB/hJNuQiFj1
	ignCh5oWwdZpsXuPEgFVuv5giP9omYrJa0wBNKhgFNvUr7vpfCZqskVJxOCmuGk2DpZK
	Rys1JjogLCUPPYNvGhG5DkMeH+mtl96yenPoAMDgeiaDeetnjszJqK+z3hR5puC/4uNU
	4pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZDOZt2mVYmcKpJ3Swafr32kvwIfws98FnSshIdBBqe0=;
	b=V9M/1ya9HEf6oDua5zvt3GIIIddVAHoah/+2ryMDIVtlOcl5nQtxnBQIZ8ZkFVcX4w
	Yo/mG59cLfatOokHzLK+zyuLQRKUnGXWRJr2P3+R5ekyf4wSY6nS6O5bTVOTI4lBGRzi
	4S6s0TYCN+6yPMN4bmUhSlqa3DBxb+XVdqQwExMvugvdUtAjGJwKw8ycM/B9gW4wxWPS
	F/6BPzhhBVOpY/XmIYyWd4cfPcHEyWxjleax/l/pBMNUMZWaVVOJm0WKdQqptkhOmUCD
	xGToOTg0lJuolgEnPX7P77QkAaznpgKsKjv1nljoacAdfUrnbXdieUgDSpfNdI0lmG0Y
	pPLg==
X-Gm-Message-State: APjAAAUewEYSsjQH7ClfYVpow7A8cNhxwFC0ctr2Wdod0EqpyYO3v38v
	bgQt6/vCJs1H0Q7tho9jcyWLXPibVGs87oiuh6QxIA==
X-Google-Smtp-Source: APXvYqxKcm2UWjUk9cdtiEaDHTlk09T2HUhFi+0hTPj3ZvSqX4c8ypOqa98ec/3sAA/9KoRktwZ7fF+EZl7mW3P+TQU=
X-Received: by 2002:a6b:3c05:: with SMTP id k5mr13465334iob.270.1554127260886; 
	Mon, 01 Apr 2019 07:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190327142005.17453-1-ross.burton@intel.com>
	<CAMKF1sosOJ6_Dk-CAiyz38iyBpV3ty4df5Ya5e4m=ccGxLyRSQ@mail.gmail.com>
In-Reply-To: <CAMKF1sosOJ6_Dk-CAiyz38iyBpV3ty4df5Ya5e4m=ccGxLyRSQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 14:00:50 +0000
Message-ID: <CAJTo0Lam4oEvd6rPYvvu=AckU7irH=4tEqGhfOVEMo9j7AkcjQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] asciidoc: use Python 3 port
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
X-List-Received-Date: Mon, 01 Apr 2019 14:01:00 -0000
Content-Type: text/plain; charset="UTF-8"

Error 4 is 'validation error', can you recover the file that is failing?

Ross

On Sat, 30 Mar 2019 at 02:01, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Mar 27, 2019 at 7:20 AM Ross Burton <ross.burton@intel.com> wrote:
> >
> > There's a sort-of-official port of asciidoc to Python 3.  Whilst the official
> > replacement is asciidoctor which is rewritten in Ruby, this is a fairly trivial
> > swap and removes Python 2 from core-image-sato builds entirely.
> >
> > Moving forward we should evaluate asciidoctor, but that can wait.
> >
> > Change the RDEPENDS so that python3 is only a dependency for target and
> > nativesdk builds, for native this can use the host python3.
> >
> > Remove redundant DESTDIR export that isn't needed.
> >
>
> its failing on my archlinux builder, ideas ?
>
> https://errors.yoctoproject.org/Errors/Details/234833/
> https://errors.yoctoproject.org/Errors/Details/234829/
>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > index 38164d55735..d0d15171ac4 100644
> > --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > @@ -8,17 +8,20 @@ LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> >                      file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
> >
> > -SRC_URI = "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
> > -SRC_URI[md5sum] = "c59018f105be8d022714b826b0be130a"
> > -SRC_URI[sha256sum] = "78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323cab4e1f0"
> > +SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
> > +SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
> > +PV .= "+py3-git${SRCPV}"
> >
> > -UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/asciidoc/files/"
> > +DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native"
> >
> > +S = "${WORKDIR}/git"
> > +
> > +# Not using automake
> >  inherit autotools-brokensep
> > +CLEANBROKEN = "1"
> >
> > -export DESTDIR = "${D}"
> > -DEPENDS_class-native = "docbook-xml-dtd4-native"
> > -RDEPENDS_${PN} += "python"
> > -BBCLASSEXTEND = "native"
> > +# target and nativesdk needs python3, but for native we can use the host.
> > +RDEPENDS_${PN} += "python3"
> > +RDEPENDS_remove_class-native = "python3"
> >
> > -CLEANBROKEN = "1"
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

