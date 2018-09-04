Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 39563753D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 20:46:59 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id z125-v6so3406148qkb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ICOoU1em1O+QNIj2CTvku+5nM2JVIqzSpYZ3EFLlSgg=;
	b=KDpijhr/FE/wWRMYrYCxcVeZWY9cIVZj6ukRqxm3cBjvPWNelunIiuy+obVA3fP2ES
	rkhUKCLBdtC50m40nvoD3btZwe1+sdJLHswg0XYGpKG+JjbkHlDZ4qdaKpS6sn25ZveE
	ffy+5qj1/K3SRU2cUWsrBejNUMZihZ91cRanoOPYuI21kxLoq2EcbFWV7QHv741+OIPb
	DkAy/RhEFZ/pZ8DCdEpCDk7VLr8kSrFBc6EW4Y88j9LNxgJ10FzAPTtyq2SZPZ+3ttkT
	LQ6dP/0go4f93ht0OMRK640DDygrqIogpHjTqE8WezasjMYm+DgUh1sYDtCfAxCU0LRn
	f/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ICOoU1em1O+QNIj2CTvku+5nM2JVIqzSpYZ3EFLlSgg=;
	b=eE5Lg5rK1eJE7Yay9JQxogEITtqqr3S8wKVCVmLQ0IcdAHGEX4gG79vbzhr56uhRaO
	JqpvRvfhVi1JGnswR/bGyeCZB8H3zlt7oS8uWeNTi7AUzOWCSd5nuye1MndmOl8StPH/
	mFCyJijW8AwkWb6OEm88869wdJkHo02rhcDYyzlfL1Ehor2Nqj7sWDHX9QLuduxdbikh
	AA5kP/K+ohScqfBn/rbyHqPCuxgiTl5RswX0oFl5sAuCvEcR2uQpaUHfskbvwLVabjFf
	+kqYflUktF/AEI55LHq1dGkIbvAadya9Ml5mSURzwOI/nq92j4Edry5yle8tx+6bybE+
	uh0w==
X-Gm-Message-State: APzg51DIOrzQUakQ8pzsfAdnnA3bcL4Bl2YaQ/SCfslEB2potYTIbmkS
	hsH26/XLKmX6vIdc14tdQwS1A1bhLiMawhmOsME=
X-Google-Smtp-Source: ANB0Vdbt/mhEgplqYzzJsJWUFT5p6mdw5UzW7FVnGgpHZvUYotFRtd5ntQ1aiqn2aEmvqR6BchU84p5t2zHHGCajunE=
X-Received: by 2002:a37:a811:: with SMTP id
	r17-v6mr30446087qke.81.1536094019895; 
	Tue, 04 Sep 2018 13:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180904155000.3715-1-ross.burton@intel.com>
	<CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
In-Reply-To: <CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 13:46:33 -0700
Message-ID: <CAMKF1sqNV5vj41Z5ikLzg0VJLVn+i_VAohLBh=u-a=dKPL0Xdg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] os-release: fix to install in the expected location
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
X-List-Received-Date: Tue, 04 Sep 2018 20:46:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 1:19 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Sep 4, 2018 at 8:50 AM, Ross Burton <ross.burton@intel.com> wrote:
> > From: Joshua Lock <joshua.g.lock@intel.com>
> >
> > os-release (5) recommends that the os-release file be installed in
> > /usr/lib/os-release and that /etc/os-release be a relative symlink to it.
> >
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-core/os-release/os-release.bb | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
> > index f9887047561..c6e36001dc5 100644
> > --- a/meta/recipes-core/os-release/os-release.bb
> > +++ b/meta/recipes-core/os-release/os-release.bb
> > @@ -1,7 +1,7 @@
> >  inherit allarch
> >
> >  SUMMARY = "Operating system identification"
> > -DESCRIPTION = "The /etc/os-release file contains operating system identification data."
> > +DESCRIPTION = "The /usr/lib/os-release file contains operating system identification data."
> >  LICENSE = "MIT"
> >  INHIBIT_DEFAULT_DEPS = "1"
> >
> > @@ -42,6 +42,7 @@ python do_compile () {
> >  do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
> >
> >  do_install () {
> > -    install -d ${D}${sysconfdir}
> > -    install -m 0644 os-release ${D}${sysconfdir}/
> > +    install -d ${D}${libdir}
> > +    install -m 0644 os-release ${D}${libdir}/

both install calls above could be squashed into install -D -m 0644 ...

> > +    lnr ${D}${libdir}/os-release ${D}${sysconfdir}
>
> This probably needs an "rm -f ${D}${sysconfdir}/os-release" too to
> prevent problems if install is run twice as lnr doesn't handle the
> case where the target already exists.
>
> >  }
> > --
> > 2.11.0
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

