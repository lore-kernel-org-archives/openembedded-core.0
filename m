Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
	[209.85.217.42])
	by mail.openembedded.org (Postfix) with ESMTP id 15CB46C4CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 14:27:35 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id z3so9886687vsf.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 06:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WAhRV04zJCDlcGFGWybvDddnSco6Ntmw+1pYvTrp9iE=;
	b=B7XcqIulRb/B/HfoZvCY+r8zrZVnW/RVuNJ+9QsxDT534P3bIIQO5Xr68mpFz5zf1A
	Bj65lIsKGEbaJa33R8srK5NcBGNp8u4GW0UT5LyUoVXotlMEOiqa3zBCUZL9rL/ODZGy
	ktKXkf11Gh4Owzq2YXY1lvWcIRgnSrLXIO++6SRXUZRzNymU/ldz9bmWjdqbTVcy0tv4
	Nus+SaGamoPEEm8kwuQpQQW2epaNZw2OyzUS2JTBQIXQ1RaOVb0Czf6EY0rD8FqVihYW
	YUM/NKPX4LTJLOK5HbZgsneCwdi0Wh8CWd4Kmnu9+oPypkitJUkNcgmw4pbNygZYZq6b
	WIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WAhRV04zJCDlcGFGWybvDddnSco6Ntmw+1pYvTrp9iE=;
	b=gHOi0g5ZmDvSdFe8xK+XGWdoFqaBO9HhGuo0BvtVqPlM6fW1COpdTga4x97a1GXA7o
	XLNUUy5/BsA4Yo4uqBPPklLdbqm81nzenDWTKAjgatWCQ8L9U73y8cTTds/fHzsmEXDq
	TmYaX9QtIXQ9OF7vBZRSfZq6u2K5tBZrVUNjqlgI8ZWjnWvG26pRha4dAD19dfFl7/Ut
	rcwybRy2xiTGYfBlWkxOu0ATDJKnLuSCGpIzEXrvib3QYvj8ETAo2W++Xl6pAgY98H3S
	uvVLC19iUCP+msrMy+Nrt5T9bcyVTIDZa+xkCtqclWw525LNZW4aqHeG2clKKLvtQJ8j
	7v0Q==
X-Gm-Message-State: AA+aEWaohooQOmQm33TB5nwhKuiEL9g+egb3yI+XoWLrQ7QxACI8AvKS
	fcbCCUoU+77v0OZ7TMuCgXsTl1mJwXdnRdcy5ZI=
X-Google-Smtp-Source: AFSGD/XR7zXd7QhSiXYqNSmXb/1LB59/EKmja2wb0QNgJKK6wGXMO4B890efMLp4IHP/mGd1FbvVNcPOnmwCxHQxlyE=
X-Received: by 2002:a67:f1d6:: with SMTP id v22mr8773935vsm.181.1543933656682; 
	Tue, 04 Dec 2018 06:27:36 -0800 (PST)
MIME-Version: 1.0
References: <1543920528-21433-1-git-send-email-alex.kiernan@gmail.com>
	<CAJTo0LYsnuRBTeWZAStDNHzZHTnZt3+SH4XKgPydzDfrKF7yFA@mail.gmail.com>
	<CAJTo0LZR+ZsT2hkszgLKELwJOQhLe=O2LV4LuTo14550QZ65xw@mail.gmail.com>
In-Reply-To: <CAJTo0LZR+ZsT2hkszgLKELwJOQhLe=O2LV4LuTo14550QZ65xw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 4 Dec 2018 14:27:25 +0000
Message-ID: <CAO5Uq5ThtzAvYkHFQqMem_Hq+MPuHipM2KCyPdCU0e9DDnBUnw@mail.gmail.com>
To: ross.burton@intel.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3-docutils: Fix shebang path to point at python3
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
X-List-Received-Date: Tue, 04 Dec 2018 14:27:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 4, 2018 at 12:02 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> Turns out we disable this functionality in distutils.  That patch
> should be fixed to do the right thing instead.
>

Well that explains a lot of things... I've a small bag of those
fixups, it never occurred to me it was local to bitbake.

I see that patch, but I dug into the into the distutils class too, we
have this bit for py2 in do_install:

        if test -e ${D}${bindir} ; then
            for i in ${D}${bindir}/* ; do \
                if [ ${PN} != "${BPN}-native" ]; then
                        sed -i -e
s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\
python:g $i
                fi
                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
            done
        fi

And this for py3:

        if test -e ${D}${bindir} ; then
            for i in ${D}${bindir}/* ; do \
                sed -i -e
s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${USRBINPATH}/env\
${PYTHON_PN}:g $i
                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
            done
        fi

Which look like it's trying to do this fixup, but fails for the
'/usr/bin/env python' case (and isn't constrained to the first shebang
line).

The extra "if" in py2 is this:

c54076ed8ae5 ("distutils: Replacing path to native path only to be
done to non-native python packages")

Which is in py2, but not py3 - assuming I read the commit right, it's
to handle of the case of coreutils-native not being in the dependency
chain, but I guess that's no longer true.

I'm wondering if the right fix is to delete both the patch and the
do_install fixups and start again?
> Ross
> On Tue, 4 Dec 2018 at 11:43, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > Interestingly if you build docutils outside of bitbake, the hashbangs
> > get rewritten automatically as part of the build...
> > On Tue, 4 Dec 2018 at 10:49, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >
> > > By default we get a shebang path pointing at python; when building the
> > > python3 version, ensure we use python3.
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >
> > >  meta/recipes-devtools/python/python3-docutils_0.14.bb | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-devtools/python/python3-docutils_0.14.bb b/meta/recipes-devtools/python/python3-docutils_0.14.bb
> > > index 81a449d64604..a2880a9601d7 100644
> > > --- a/meta/recipes-devtools/python/python3-docutils_0.14.bb
> > > +++ b/meta/recipes-devtools/python/python3-docutils_0.14.bb
> > > @@ -14,5 +14,8 @@ S = "${WORKDIR}/docutils-${PV}"
> > >
> > >  inherit distutils3
> > >
> > > -BBCLASSEXTEND = "native"
> > > +do_install_append() {
> > > +    sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' ${D}${bindir}/*
> > > +}
> > >
> > > +BBCLASSEXTEND = "native"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
Alex Kiernan

