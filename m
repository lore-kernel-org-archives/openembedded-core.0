Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 62B617F953
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:31:04 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id l24so3629675vsr.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 14:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yGDjICftnF5NB3QWnApqxH32ko/jSXF9SDe1FfPQCvs=;
	b=fSFqqP1ZuF7/8256DdmOfDKLoAsQxg7nFc8ZMoERe7kj4PR59su8896zEmY05kZtpS
	ovrq30dQL672taf0V9bk7KJE+OGGXadKXQp3yMXGMVjbKa4AzKzEgnBDEQTZt3fsabFu
	8sRWkwf5fBGUwojL4YzOWaY4Tv+JQnnuhWe1naVpKdZFpxX4nt87Pls6lrgTl9mFLWT3
	y6GnB00bNhc2wUngCYfWmWM9QvHBjB9XWk1Kn42vTA6wi4xw4XQrEBC296hP/5MhuOES
	77nNkZarKn1Ji23AKieMlKwnrQUNWgp1hqHqeAhkQWw0XznuMigJLq41o4tpv5OmxAsr
	sLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yGDjICftnF5NB3QWnApqxH32ko/jSXF9SDe1FfPQCvs=;
	b=p2WziiY/jBMGG4DNBMoor8fNwzhxUhmWywbmTlrUrfF/AUPzzs+GWAc9YDeYUFDpEK
	STaKmuXi5reKmfEBn1Weh0n4ngcHxT6zBvLkKPaMj8GyfIhsVeiajM6xnrAaXJ7IiHNs
	eBjkmERNqs+U4ui9321MooSJbKkztRrEojcK7GIgWb5wtXBy9kyM53gts8mup6TA8sLY
	MLyMWhhrzohJJfs3yTsPVaumjx+/c87T+IlvSMWz/XtN/z/AGkMcbEoxDz2ysxt1wokT
	KWGRyy4NovTTkiIYrWWB95qLAcgy25Ls7WviZ11BUB8xlW6UbPgc+OqjKbhfy9Oc2Xfe
	7sqQ==
X-Gm-Message-State: APjAAAVubCuR6RLAyHzQjaV6OpPjc6RfULNXc8M1GUvoswHUE5eKqYud
	VgN7/MxjdGPtxtruF1Iyw7ePBWv8OSfscsll0fE=
X-Google-Smtp-Source: APXvYqzfTrwnX5DEJgN0/fRRzU86O32zLBEOV3nsBMEaWhPLE1cwERVxpvpzr+7mrXZRf/awZAtDaFKrJ8SDu1RnXN0=
X-Received: by 2002:a67:f7d1:: with SMTP id a17mr7415338vsp.130.1575585065161; 
	Thu, 05 Dec 2019 14:31:05 -0800 (PST)
MIME-Version: 1.0
References: <3082aa3cab14404d97c7f3c03af84462@XBOX03.axis.com>
In-Reply-To: <3082aa3cab14404d97c7f3c03af84462@XBOX03.axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 5 Dec 2019 14:30:53 -0800
Message-ID: <CAJ86T=XqXKPjH9j987Xsi0pchB2TYJdJTuwX_gepR72Es2J-mQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][zeus][PATCH 2/2] libtirpc: Make it easy to disable the installation of legacy headers
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
X-List-Received-Date: Thu, 05 Dec 2019 22:31:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 5, 2019 at 2:23 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 5 december 2019 23:07
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [master][zeus][PATCH 2/2] libtirpc: Make it easy to disable the installation of legacy headers
> >
> > Providing symbolic links to the header files to replace the old
> > corresponding glibc headers seems like a band aid for applications
> > that have not been updated to cope with the lack of the RPC headers
> > from glibc. Additionally they clash with glibc if an older version of
> > glibc is used that still provides the header files. To remedy this,
> > make it easy to disable the installation of the legacy headers by not
> > setting the legacy-headers PACKAGECONFIG.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  .../libtirpc/libtirpc_1.1.4.bb                | 23 +++++++++++--------
> >  1 file changed, 14 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > index 91e0ce6fd2..3c84694161 100644
> > --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > +++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> > @@ -17,6 +17,9 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
> >  SRC_URI[md5sum] = "f5d2a623e9dfbd818d2f3f3a4a878e3a"
> >  SRC_URI[sha256sum] = "2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d"
> >
> > +PACKAGECONFIG = "legacy-headers"
>
> I set the legacy-headers PACKAGECONFIG by default to maintain the
> compatibility with zeus-22.0.1. However, it can be argued that it
> should not be set to maintain compatibility with zeus-22.0.0. In
> our case, the change between 22.0.0 and 22.0.1 broke the build
> for a couple of our products that build using an older glibc.

The change broke builds for me too. I'd prefer to have the
PACKAGECONFIG disabled by default in zeus.

> > +PACKAGECONFIG[legacy-headers] = ""
> > +
> >  inherit autotools pkgconfig
> >
> >  EXTRA_OECONF = "--disable-gssapi"
> > @@ -24,16 +27,18 @@ EXTRA_OECONF = "--disable-gssapi"
> >  do_install_append() {
> >       chown root:root ${D}${sysconfdir}/netconfig
> >
> > -     for dir in rpc rpcsvc; do
> > -             install -d ${D}${includedir}/$dir
> > -             for link_header in ${D}${includedir}/tirpc/$dir/*; do
> > -                     if [ -f $link_header ] &&
> > -                        [ ! -e ${D}${includedir}/$dir/$(basename $link_header) ]; then
> > -                             ln -sf ../tirpc/$dir/$(basename $link_header) ${D}${includedir}/$dir/$(basename $link_header)
> > -                     fi
> > +     if [ "${@bb.utils.filter('PACKAGECONFIG', 'legacy-headers', d)}" ]; then
> > +             for dir in rpc rpcsvc; do
> > +                     install -d ${D}${includedir}/$dir
> > +                     for link_header in ${D}${includedir}/tirpc/$dir/*; do
> > +                             if [ -f $link_header ] &&
> > +                                [ ! -e ${D}${includedir}/$dir/$(basename $link_header) ]; then
> > +                                     ln -sf ../tirpc/$dir/$(basename $link_header) ${D}${includedir}/$dir/$(basename $link_header)
> > +                             fi
> > +                     done
> >               done
> > -     done
> > -     ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
> > +             ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
> > +     fi
> >  }
> >
> >  BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.21.0
>
> //Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

