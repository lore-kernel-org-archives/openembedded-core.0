Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0553C60FD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 19:55:28 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id t20so1302827uao.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 12:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TzJTc3UK2f2WQJTJfWCsccj5YG9aw3J4yENNZ3ku4Y8=;
	b=BRIU5wAzsGyKYdQTpoB+OsF3ukgSrd/w7iwS+tN59b8P7/bHRX9aEnPQT8TrzSViAk
	cn6bMrsVwCk/qL2rTX0xRToP2TCu9UVOv3LwHt80i1a2f2FcoA0VOwfgwhL8l79mYmyt
	OMzj20Q5jcsP+SlzLYQKCvTCiLjmQhlhGnlVtnOh3Zo7NxKApFfLzFKt2sKsCjx7rRyv
	gxMZnVzTuZrS8GUR5koe1JikV3aEYXUFDdxwEqcITboiB0SCAvQzZj29bUSCWIJIvFR/
	7Phty0bHzK2eEhRQXDT0q+QMzOHXsWxb+vX6v8/5G7MPffP7KTHGAEcwg+sRwM70G1Ov
	Qdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TzJTc3UK2f2WQJTJfWCsccj5YG9aw3J4yENNZ3ku4Y8=;
	b=CJ8drGXat79aefFRmDkEZz7GTEQA0FbFlV8FdU8wzJgdFENpOKOdec/bg0RNNehxsa
	rPPOxkLCnLyJiZmir2Kp9JbO6DBSDYtCZDobdA+xT7zW5IxhSHfqO2WstkkD+cMMUL3p
	5yQugF//EIRf/x1KVQzCtsxsiSSYdYe8lyhcApA6UVjvJW/kc9CHMO7MyfxrSHCKTRlp
	Ok+jvsLGoO0uraIgRVdV6aflVWetSN2kOaTM+4VB0rUyk/RjJX/RAx2zraOaXxQvaUfy
	B57idbU4tPOGnpeh54RIZR7P1TTGF8m0RfVch95IWnDranDx9koxMFyZZQIFFChvXB4z
	CE9A==
X-Gm-Message-State: ANhLgQ3ppp0FQsyRCCsSsA1GcYljqobhsp0ul8egLLFCNFFcOOn92iBI
	duZZBnCWNcHLuvIHOJ0D87kjLW4WPmFiOHF3QnE=
X-Google-Smtp-Source: ADFU+vszC0ljFS/LuI4SHy7PdrtiXkv7nImzZi4QJu0QITysVOqPn5y1LLsrgvjRQlzarHdMSAxRW2KwLkE0ZP/5W9Y=
X-Received: by 2002:ab0:2559:: with SMTP id l25mr3230516uan.99.1584647729522; 
	Thu, 19 Mar 2020 12:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200319191913.13388-1-Martin.Jansa@gmail.com>
	<CAJ86T=U9+UuFK214nZgjw_-6EU1EbCUkdV-HoWs61gk3=MbLGw@mail.gmail.com>
	<20200319193741.7sld24mwcdujjpxb@jama>
In-Reply-To: <20200319193741.7sld24mwcdujjpxb@jama>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 19 Mar 2020 12:55:20 -0700
Message-ID: <CAJ86T=US_EvRonxDbcb31E3w4+--8b=cMLTq1rYsQiq8LH8Y+A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ross Burton <ross.burton@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [zeus][PATCH] sanity: check for more bits of Python
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
X-List-Received-Date: Thu, 19 Mar 2020 19:55:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 19, 2020 at 12:37 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Thu, Mar 19, 2020 at 12:33:17PM -0700, Andre McCurdy wrote:
> > On Thu, Mar 19, 2020 at 12:19 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> > >
> > > From: Ross Burton <ross.burton@intel.com>
> > >
> > > MJ: icu in master doesn't need distutils anymore, because icu 65.1 currently in
> > > dunfell/master doesn't depend on python3-distutils anymore since:
> > > https://github.com/unicode-org/icu/commit/b4d41b0561b6e8de38b99850ce0e4be8ef536bb1
> > >
> > > but the icu-64.2 in zeus and openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb
> > > still need python3-distutils as described in:
> > > http://lists.openembedded.org/pipermail/openembedded-core/2020-March/293984.html
> > >
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ---
> > >  meta/classes/sanity.bbclass | 12 +++++++-----
> > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > > index 936fe913b4..5c2f8f9d75 100644
> > > --- a/meta/classes/sanity.bbclass
> > > +++ b/meta/classes/sanity.bbclass
> > > @@ -625,13 +625,14 @@ def check_sanity_version_change(status, d):
> > >      # In other words, these tests run once in a given build directory and then
> > >      # never again until the sanity version or host distrubution id/version changes.
> >
> > s/distrubution/distribution/ (not part of the original patch but maybe
> > worth fixing in a v2).
> >
> > > -    # Check the python install is complete. glib-2.0-natives requries
> > > -    # xml.parsers.expat
> > > +    # Check the python install is complete. Examples that are often removed in
> > > +    # minimal installations: glib-2.0-natives requries # xml.parsers.expat and icu
> >
> > Stray # left over from reformatting the comment.
> >
> > > +    # requires distutils.sysconfig.
> > >      try:
> > >          import xml.parsers.expat
> > > -    except ImportError:
> > > -        status.addresult('Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n')
> > > -    import stat
> > > +        import distutils.sysconfig
> > > +    except ImportError as e:
> > > +        status.addresult('Your Python 3 is not a full install. Please install the module %s (see the Getting Started guide for further information).\n' % e.name)
> >
> > Should that be the Yocto Project Quick Start? Googling for "yocto
> > getting started guide" doesn't come up with anything.
> >
> > The version of Yocto Project Quick Start found by google doesn't
> > mention anything about installing python3-distutils though, so maybe
> > it's not the right document...
>
> This is just cherry-pick from master to zeus (I've only updated the
> commit message).
>
> If you want these issues fixed, then it should be fixed first in master
> and then backported to zeus.

Oh yes, didn't notice it's a backport to zeus. Sorry!

> >
> > >      status.addresult(check_make_version(d))
> > >      status.addresult(check_patch_version(d))
> > > @@ -667,6 +668,7 @@ def check_sanity_version_change(status, d):
> > >          status.addresult('Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n')
> > >
> > >      # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
> > > +    import stat
> > >      tmpdir = d.getVar('TMPDIR')
> > >      status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
> > >      tmpdirmode = os.stat(tmpdir).st_mode
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

