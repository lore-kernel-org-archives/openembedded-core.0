Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9F6556C42C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 07:48:50 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id a190so2044247ite.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8wRCAxH0ZEqYbWTIOUSCZmg1RK9JOd4rHvWOFBlu15I=;
	b=oVcKVcwC7xm0A5nneLUQVX0BShDDdX44+ziUZK9mMoGukNWmm0WqUa3ON2tn0gVpd2
	AwsGVdOLu8toKgTxar70kdG2IXPhxwYjurkUGHScI8tMlw9efkyA9NaKWZhj9YvX2bTX
	cO0oLohPZ4s4r4cV2iwcelRdtpTngOWYROqX7J2e3pXo8sHTyir8cNcZOYI7bX462a86
	jmGgnPbPdq8pyBR5mPDXstgg/glGNf7AVMm/Uy1si7wsJ4KkIdT42GyJYY21KBn8schc
	+WY+ew7rEetjXcAQxj3HmpbWyId3fUGwTQh8iRnJKT+fMvwsArsJggDL88reo+H3VySa
	jxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8wRCAxH0ZEqYbWTIOUSCZmg1RK9JOd4rHvWOFBlu15I=;
	b=NW7Z6fLWOba82dfeIqrVUD3IsopyPuMK9fDa/iE6LfcrtabyrJQCSQkpxYW1GZBqFE
	j0TZDP5CPqJGjdLWWOj9ojMsIsPX4KpAsC1wF3gmgRgUVWYE5ulCuDrZPFL9HgsaLnld
	ndZshuVJi/VSgt2qoxu4fipgiykwmaNTdvKEdthukISQB/AKhFi+cU2NXHrV/MV+rcwQ
	oc9PNuqVyBRYdQH8XOW0mPDV3iEAp3imR/w2dsxeXONsV0tiUvnHobXMEuVp56Q4pDvr
	7qPlB6U4QX88poEiXMBVkPPhdCrqZv9DQoA6wLhe8NKzL8eLvm1MDDkf1Sgu6mk3RhrH
	QGtQ==
X-Gm-Message-State: APjAAAW/ct73b330Rdb5kEZnLVrCMOuf1YrYk2TkE+rry5nWV24wfTUr
	9N8f2XRn6sgNEw1MneZDW9t76aVKVKbOTv6gExGVgihm
X-Google-Smtp-Source: APXvYqyqoA6U1rIfLiZ1A/WwBmOECiH/or4ln1T0ZJTBh6yMvMx50pnLQ6G+B4i727t3QalokKfzvgK2pQZSqP1Dyuo=
X-Received: by 2002:a24:d643:: with SMTP id o64mr3100665itg.148.1554191331592; 
	Tue, 02 Apr 2019 00:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190327142005.17453-1-ross.burton@intel.com>
	<CAMKF1sosOJ6_Dk-CAiyz38iyBpV3ty4df5Ya5e4m=ccGxLyRSQ@mail.gmail.com>
	<CAJTo0Lam4oEvd6rPYvvu=AckU7irH=4tEqGhfOVEMo9j7AkcjQ@mail.gmail.com>
	<CAMKF1srHw-SfA_TwxP-qB_Yi3y07rsjzk1MxFxoHa7ZfsGicPA@mail.gmail.com>
In-Reply-To: <CAMKF1srHw-SfA_TwxP-qB_Yi3y07rsjzk1MxFxoHa7ZfsGicPA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Apr 2019 08:48:40 +0100
Message-ID: <CAJTo0LaKN5+SEMwRujXiWdVm7St33Hg02pjDKiFyKiRWJyfM8w@mail.gmail.com>
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
X-List-Received-Date: Tue, 02 Apr 2019 07:48:50 -0000
Content-Type: text/plain; charset="UTF-8"

Ah so it looks like it's ignoring the XML stuff we're installing and
using the host, and you don't have the right versions.  Shall look
into this today.

Ross

On Tue, 2 Apr 2019 at 03:34, Khem Raj <raj.khem@gmail.com> wrote:
>
> I find many posts reporting similar issue also I see it happen on
> ubuntu 18.04 host as well
>
> https://groups.google.com/forum/#!topic/asciidoc/FC-eOwU8rYg
> https://groups.google.com/forum/#!topic/asciidoc/N4boYdQ3Zik
>
> On Mon, Apr 1, 2019 at 7:01 AM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > Error 4 is 'validation error', can you recover the file that is failing?
> >
> > Ross
> >
> > On Sat, 30 Mar 2019 at 02:01, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Wed, Mar 27, 2019 at 7:20 AM Ross Burton <ross.burton@intel.com> wrote:
> > > >
> > > > There's a sort-of-official port of asciidoc to Python 3.  Whilst the official
> > > > replacement is asciidoctor which is rewritten in Ruby, this is a fairly trivial
> > > > swap and removes Python 2 from core-image-sato builds entirely.
> > > >
> > > > Moving forward we should evaluate asciidoctor, but that can wait.
> > > >
> > > > Change the RDEPENDS so that python3 is only a dependency for target and
> > > > nativesdk builds, for native this can use the host python3.
> > > >
> > > > Remove redundant DESTDIR export that isn't needed.
> > > >
> > >
> > > its failing on my archlinux builder, ideas ?
> > >
> > > https://errors.yoctoproject.org/Errors/Details/234833/
> > > https://errors.yoctoproject.org/Errors/Details/234829/
> > >
> > > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > ---
> > > >  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 21 ++++++++++++---------
> > > >  1 file changed, 12 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > > > index 38164d55735..d0d15171ac4 100644
> > > > --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > > > +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> > > > @@ -8,17 +8,20 @@ LICENSE = "GPLv2"
> > > >  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> > > >                      file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
> > > >
> > > > -SRC_URI = "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
> > > > -SRC_URI[md5sum] = "c59018f105be8d022714b826b0be130a"
> > > > -SRC_URI[sha256sum] = "78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323cab4e1f0"
> > > > +SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
> > > > +SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
> > > > +PV .= "+py3-git${SRCPV}"
> > > >
> > > > -UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/asciidoc/files/"
> > > > +DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native"
> > > >
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +# Not using automake
> > > >  inherit autotools-brokensep
> > > > +CLEANBROKEN = "1"
> > > >
> > > > -export DESTDIR = "${D}"
> > > > -DEPENDS_class-native = "docbook-xml-dtd4-native"
> > > > -RDEPENDS_${PN} += "python"
> > > > -BBCLASSEXTEND = "native"
> > > > +# target and nativesdk needs python3, but for native we can use the host.
> > > > +RDEPENDS_${PN} += "python3"
> > > > +RDEPENDS_remove_class-native = "python3"
> > > >
> > > > -CLEANBROKEN = "1"
> > > > +BBCLASSEXTEND = "native nativesdk"
> > > > --
> > > > 2.11.0
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

