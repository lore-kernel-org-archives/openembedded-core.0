Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2AE79EAC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 22:24:49 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id d18-v6so7543030yba.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 14:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2GOCdJOOcY7jNuBq9qFm57IruR/K37f0fziBPwuDICQ=;
	b=TMdXEgm8ztP2+TMK8bRLI6QXmcojvq6s8sLC7vchIquJD8IYdZ4bJDNEBoQy33YI85
	VC19IOl9h8cVPEYhjdwaRh1x8lpYMu5kxFIFurbt3WMIUn8JBYkAPI2pjI/9EGQT3pgO
	a4h5X6jSf9ZVVwhgrXPq0pyUFQsz3hrnI15AbtNcHYVMBhRmzf/ygq/a5O/31nfUtWZ5
	cNWQGBXGcz0nEjDNi4VKp3hi4vNSXDmyf7PUmE3hiYkR6Ir5LfxP2xOCt/+rpVsIglxO
	rxqA2kYUC+iLaoUWICoAiGIoOnl/CTdvyE7AT/wPRbs6HosHJUCk5d6LIDE1QX+jsFw0
	qxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2GOCdJOOcY7jNuBq9qFm57IruR/K37f0fziBPwuDICQ=;
	b=FezX09lPdP3f336mgWoP1trhkUTVhTe4Lzk1UXMBkCiEsD3jsW+py/CWKPnJYLV41V
	CPmjdoivb3IJ6JFSa8fmsWyGGo7VYcVlom9ygD78WRfvZR7Of1MvUyhoEaGjibXIdKia
	h5mhjE9nMsLZT2ykG8mlc76ueG6KbGTS6zahkBDPkCiVlVwfoRvPdW0B/TIziCbsX/xl
	BDWyBpKQpTig8CoTxexKeQLQbdoQ8lo67ALO+6ZrLI5tu/D1Kx7dkpUyi8I676hZTh0z
	rU0tQt0rCrfjrHJO4O0TS3m4IMpbeRPvEGZwqQkXZtHEytIEZ/TP61VNF18hlogxm85B
	uN7Q==
X-Gm-Message-State: AGRZ1gLtLP7QuTk+saAwrPn22/3Qog1HNDQAmZoIfwQf5OvH+q2/ZJmh
	I0arnmno0OTZi3HBe7zPbvNhjxVUAOYxi18gJEQ=
X-Google-Smtp-Source: AJdET5fOS8f5Ord0war7mJcjC99qRXuOC9ZgGZqvLf/iC1C9uxvT8mOfWjsmP1KY6EvrEVOG+cCBOKe0LE3mMZWmovA=
X-Received: by 2002:a25:308a:: with SMTP id
	w132-v6mr2242237ybw.106.1541629490193; 
	Wed, 07 Nov 2018 14:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20180928094813.10862-1-schnitzeltony@gmail.com>
	<35422df46140ffbb6e2676691cd74a14a2a41013.camel@linuxfoundation.org>
In-Reply-To: <35422df46140ffbb6e2676691cd74a14a2a41013.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 7 Nov 2018 23:24:37 +0100
Message-ID: <CALbNGRR3bkdbK3k=Wgg-8AYL05Sbo4oy15q4aOScx99Yy0NqkA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image-buildinfo: drop more verbose build configuration
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
X-List-Received-Date: Wed, 07 Nov 2018 22:24:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 29, 2018 at 4:17 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2018-09-28 at 11:48 +0200, Andreas M=C3=BCller wrote:
> > * before DISTRO and DISTRO_VERSION were written only - this is not
> > enough to
> >   get a complete picture in which environmet an image was build. Now
> > same
> >   information as displayed on console is written.
> > * code fragment was based on bass.bbclass
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >
> > I know timing is not the best - we are already feature freezed. But I
> > think it is an enhancement worth to have an exception...
>
> It sounds good from the commit message but anyone IMAGE_BUILDINFO_VARS
> or IMAGE_BUILDINFO_LVARS is going to find a significant change in
> behaviour? At the point past feature freeze I'm not sure we can do
> that...
>
> Cheers,
>
> Richard
>
> >  meta/classes/image-buildinfo.bbclass | 28 ++++++++++++------------
> > ----
> >  1 file changed, 12 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta/classes/image-buildinfo.bbclass
> > b/meta/classes/image-buildinfo.bbclass
> > index 213fb9cf9b..fbb3188040 100644
> > --- a/meta/classes/image-buildinfo.bbclass
> > +++ b/meta/classes/image-buildinfo.bbclass
> > @@ -15,18 +15,6 @@ IMAGE_BUILDINFO_VARS ?=3D "DISTRO DISTRO_VERSION"
> >  # Desired location of the output file in the image.
> >  IMAGE_BUILDINFO_FILE ??=3D "${sysconfdir}/build"
> >
> > -# From buildhistory.bbclass
> > -def image_buildinfo_outputvars(vars, listvars, d):
> > -    vars =3D vars.split()
> > -    listvars =3D listvars.split()
> > -    ret =3D ""
> > -    for var in vars:
> > -        value =3D d.getVar(var) or ""
> > -        if (d.getVarFlag(var, 'type') =3D=3D "list"):
> > -            value =3D oe.utils.squashspaces(value)
> > -        ret +=3D "%s =3D %s\n" % (var, value)
> > -    return ret.rstrip('\n')
> > -
> >  # Gets git branch's status (clean or dirty)
> >  def get_layer_git_status(path):
> >      import subprocess
> > @@ -57,10 +45,18 @@ def buildinfo_target(d):
> >          # Get context
> >          if d.getVar('BB_WORKERCONTEXT') !=3D '1':
> >                  return ""
> > -        # Single and list variables to be read
> > -        vars =3D (d.getVar("IMAGE_BUILDINFO_VARS") or "")
> > -        listvars =3D (d.getVar("IMAGE_BUILDINFO_LVARS") or "")
> > -        return image_buildinfo_outputvars(vars, listvars, d)
> > +        # taken from base.bbclass
> > +        localdata =3D bb.data.createCopy(d)
> > +        statuslines =3D []
> > +        g =3D globals()
> > +        func =3D 'buildcfg_vars'
> > +        if func not in g:
> > +            bb.warn("Build configuration function '%s' does not
> > exist" % func)
> > +        else:
> > +            flines =3D g[func](localdata)
> > +            if flines:
> > +                statuslines.extend(flines)
> > +        return ('\n%s\n' % '\n'.join(statuslines))
> >
> >  # Write build information to target filesystem
> >  python buildinfo () {
> > --
> > 2.14.4
> >
Is this something for time after feature freeze?

Andreas

