Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 60F247F9B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 15:21:38 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id f7so1898201qkd.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JOIkcB9mbAcAnQ9tths+rlvl3YFxPJLqmPNHgksktmA=;
	b=pGsk1tOhXQ8oQBlISNEdOtqCGpo/jZOldFNnFwmoq8+WQ8xAwuTG0G3McG4A1Ik7wY
	mMbIyI121lud5oQMsolNKCdEQNBbCisbnx61QUXhrl2//TEahR0gFa9JjbHf2DDphrgg
	7/ZY3WDnBaTnPVB3bbt/HqSRev29YRoqbcyd4lkw1UmJqUiLzZ1KnM5EvyEJFORz6+gH
	Xo/xmLHHI/WBrYpHPjgGLZPqIZVQh5BlDYK+t+PDl8uZlBqwFE+lu4Aza3n9wV44PmaD
	8+Uz7vAj1BGx8K87p9MXAdw49PUgLKgSYkkzRrVG9I9Ta5lB1LLT0u5Ta8aAZrpHtfWl
	KJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JOIkcB9mbAcAnQ9tths+rlvl3YFxPJLqmPNHgksktmA=;
	b=ciBHK/7OTBikRhrAVvq0s9K2YEQfql6U36jioWZlMqODzYm0B51PCseUcl/eaKEYhw
	xlax2mssQephGQJDV0YeMqucXcLODWNbt1XDCPOKXIcq4JTzmNgldicHfyALOpTtO5NK
	89Otr/iVlgdcn2gQSl1LPxfG8CNggfwvbU4FvAwmWxM2NIUURFDadOfNmqhMUPBQrnC+
	2pTT+NcdN6vO9lkW4dto0SxTd5iQBiI4Ko+5WZ1H/HLhIH3+cc03ZmEU28GR0zHM9b2J
	sS9prP5+Glvz8TBzmjatfi08TtXL6FlTzR4pA1kq/usQLRV1+hGHzOB/B8SAPaCIuD4F
	W0NQ==
X-Gm-Message-State: APjAAAUmFbQaycNNzBE7oD/fSOv3wlHGpLv5J0Ea4qRNUeoFvAkN9nQX
	z7eeLfJEuJt2mqpGv5EwLAxpxF+PKw153NdUPOWMgPAT
X-Google-Smtp-Source: APXvYqzfDSGMrv/K2tfpv3k0H8p6aEkxLAmyelF5UHaxuRMfBx/BEFcM6skvbGI1SY4IxdpieM7XNhxhRr69ff9ntB4=
X-Received: by 2002:a37:a348:: with SMTP id m69mr14896056qke.474.1575645698984;
	Fri, 06 Dec 2019 07:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20191205220716.29178-1-pkj@axis.com>
	<bf7d7c11-f4ee-864f-7e94-b307700a9c78@gmail.com>
	<26df55cb3ae746e6b99dc1597fec2bd7@XBOX03.axis.com>
In-Reply-To: <26df55cb3ae746e6b99dc1597fec2bd7@XBOX03.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Dec 2019 07:21:12 -0800
Message-ID: <CAMKF1sqW+466VDT5Qghmr4=BXJ7886jEzFNV_ny0FTo8ka2gkA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][zeus][PATCH 1/2] libtirpc: Simplify the installation of symlinks for legacy headers
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
X-List-Received-Date: Fri, 06 Dec 2019 15:21:38 -0000
Content-Type: text/plain; charset="UTF-8"

perhaps send a revert request instead

On Fri, Dec 6, 2019 at 12:59 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
> > bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 6 december 2019 05:56
> > To: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [master][zeus][PATCH 1/2] libtirpc: Simplify the
> > installation of symlinks for legacy headers
> >
> > On 12/5/19 2:07 PM, Peter Kjellerstedt wrote:
> > > This also corrects the symbolic links installed in
> > > /usr/include/rpcsvc.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >   .../libtirpc/libtirpc_1.1.4.bb                | 27 +++++++++----------
> > >   1 file changed, 12 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > > index 633cececd4..91e0ce6fd2 100644
> > > --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > > +++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > > @@ -1,5 +1,5 @@
> > >   SUMMARY = "Transport-Independent RPC library"
> > > -DESCRIPTION = "Libtirpc is a port of Suns Transport-Independent RPC
> > library to Linux"
> > > +DESCRIPTION = "Libtirpc is a port of Sun's Transport-Independent RPC
> > library to Linux"
> > >   SECTION = "libs/network"
> > >   HOMEPAGE = "http://sourceforge.net/projects/libtirpc/"
> > >   BUGTRACKER =
> > "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
> > > @@ -22,21 +22,18 @@ inherit autotools pkgconfig
> > >   EXTRA_OECONF = "--disable-gssapi"
> > >
> > >   do_install_append() {
> > > -        chown root:root ${D}${sysconfdir}/netconfig
> > > -        install -d ${D}${includedir}/rpc
> > > -        install -d ${D}${includedir}/rpcsvc
> > > -        for link_header in ${D}${includedir}/tirpc/rpc/*; do
> > > -            if [ -f $link_header -a ! -e
> > ${D}/${includedir}/rpc/$(basename $link_header) ]; then
> > > -                ln -sf ../tirpc/rpc/$(basename $link_header)
> > ${D}${includedir}/rpc/$(basename $link_header)
> > > -            fi
> > > -        done
> > > -        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
> > > -            if [ -f $link_header -a ! -e
> > ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
> > > -                ln -sf ../tirpc/rpc/$(basename $link_header)
> > ${D}${includedir}/rpcsvc/$(basename $link_header)
> > > -            fi
> > > -        done
> > > -        ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
> > > +   chown root:root ${D}${sysconfdir}/netconfig
> > >
> > > +   for dir in rpc rpcsvc; do
> > > +           install -d ${D}${includedir}/$dir
> > > +           for link_header in ${D}${includedir}/tirpc/$dir/*;
> > do
> > > +                   if [ -f $link_header ] &&
> > > +                      [ ! -e
> > ${D}${includedir}/$dir/$(basename $link_header) ]; then
> > > +                           ln -sf ../tirpc/$dir/$(basename
> > $link_header) ${D}${includedir}/$dir/$(basename $link_header)
> > > +                   fi
> > > +           done
> > > +   done
> > > +   ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
> > >   }
> > >
> >
> > I know this patch is making the existing logic better. But I dont think
> > we should be substituting, sunrpc headers like this, what problems does
> > this fix is not clear. tirpc is not a drop in replacement for sun rpc.
> > Applications have to use it consciously. Sneaking the headers like this
> > can cause subtle errors.
> >
> > Perhaps original patch should just be reverted.
>
> I'm perfectly fine with reverting the original patch instead as that will
> solve my problem.
>
> > >   BBCLASSEXTEND = "native nativesdk"
>
> //Peter
>

