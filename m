Return-Path: <andrea.adami@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 414DD7BDE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 20:37:58 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z11so3210019pgu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 12:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JevvUsZ6fwijZyqIdXTPbVSGwH14Kb02hNOf3RK2bQ0=;
	b=rJ4fDfTcRvznfdGqH7wyfSSqRMbXLXZet7Wh+p7AGvyXDmm6CAXHRD/oWOPQ4COZ4s
	yq3/OQADFI9juTONlQoRDOmGCt0cSO8m5c27kOi5APNsm/jROOjohtmXWcRg6Rmdrv9t
	QrnbBE1tNHlDDKjk+/PdV3Xzk5khyu6lFiA9z8z/eme30DdFyo/xhnBKQt65CPGXkJVF
	sRarp1Dfn3WROJjLWrkIfXzXeaWXHo8mk7atXSEMXq2QpyG5AUWgTTSWFAhkyasLQzgj
	zPCR/22T0GjKkuoHnIO39gFVDrRVPZvz+Tny+kdR7WHwJRechqP08LcI2s3FLyVZuuxx
	GqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JevvUsZ6fwijZyqIdXTPbVSGwH14Kb02hNOf3RK2bQ0=;
	b=UyV7zXMajpPInXSBS40jTaxpYeoFtd39NoKFrcZNBr7rPy1GcJI2AsVy47ypkhaUmp
	YfzqNtvIur6omz7A/P6WgyQw/f83KLLugi2deo0v3OgxLtY2wXd4gVs7ZWQxHtEENiyq
	oqOA/gdoc07glU9r0WLQDaZ96T6OIQ5DeFGtEq2J92XReeU2+II9Ey7NG3je4isGfrsA
	W28hIbJiBhvmmGBFh7v2vSpXQMyL7FVYlquSNEkHwKvpS48WvfrYCxW/L7mMxmC6mJju
	IgLTSq7k19/9Mpaxo0W6ZAy1vOvkmL6pVldCsvdSYl1ByMra5Iihw+7UfmkRbxZVZPfp
	hCVg==
X-Gm-Message-State: AA+aEWZvlqwQDFhHTra0Y4rha5MrycVlxE8TjgQLWtC0kl2TDST9kMfS
	68m76RM4xK6fOAGsGZV6c/9YMIqaCHPrRdIuDcE=
X-Google-Smtp-Source: AFSGD/X1Sy4j3RQ3FKFEk339YEZglHSurVc9TksendWVv4F3/Q1JWQlAZe81e26c8sn2e6rDmBWMuvwSzURgRhBfVos=
X-Received: by 2002:a63:5f88:: with SMTP id t130mr4025101pgb.395.1544819879209;
	Fri, 14 Dec 2018 12:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20181213141312.14587-1-andrea.adami@gmail.com>
	<CAMKF1srSoF3DJq231kSaspe0U8iVYqn1tFVtv6ABUv9eKaN+vw@mail.gmail.com>
In-Reply-To: <CAMKF1srSoF3DJq231kSaspe0U8iVYqn1tFVtv6ABUv9eKaN+vw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 14 Dec 2018 21:37:45 +0100
Message-ID: <CAAQYJAsZbBp6rOvr8h+MWZgGTFFJiUQBUnVKJ5KmtZvgsFOyMA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: fix build for powerpc-linux.musl and powerpc64-linux-musl
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
X-List-Received-Date: Fri, 14 Dec 2018 20:37:58 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

the patch is now superseeded.
Serhey sent a new patch-serie containing the fix for powerpc/musl,
please review that.
Thanks!

Regards
Andrea

On Fri, Dec 14, 2018 at 4:13 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Andrea
>
> Sigh, while I dont like what configury is doing here, we can probably
> instead surgically check for
>
> $CC --print-multiarch on ppc/musl
>
> and then update the tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch
> patch to consider musl multiarch triplets. Maybe do it for ppc64 while here
> but I will not hold you accountable for that.
> On Thu, Dec 13, 2018 at 6:13 AM Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > Add the missing triplets (not considering uclibc) for do_configure.
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  .../python3/powerpc-musl-triplets.patch       | 43 +++++++++++++++++++
> >  meta/recipes-devtools/python/python3_3.5.6.bb |  1 +
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch b/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch
> > new file mode 100644
> > index 0000000000..477d049858
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch
> > @@ -0,0 +1,43 @@
> > +Using musl libc the task do_configure fails on powerpc*.
> > +
> > +  checking build system type... x86_64-pc-linux-gnu
> > +  checking host system type... powerpc-oe-linux-musl
> > +  checking for python3.5... python3.5
> > + ...
> > +  checking for the platform triplet based on compiler characteristics...
> > +  powerpc-linux-gnu
> > +  configure: error: internal configure error for the platform triplet
> > +
> > +Fix this by adding the musl triplets.
> > +Note: uclibc is purposedly not considered (unsupported in oe-core).
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > +
> > +--- a/configure.ac     2018-12-13 14:44:55.414309610 +0100
> > ++++ b/configure.ac     2018-12-13 13:22:37.546497547 +0100
> > +@@ -831,14 +831,22 @@
> > +         or1k-linux-gnu
> > + # elif defined(__powerpc__) && defined(__SPE__)
> > +         powerpc-linux-gnuspe
> > ++# elif defined(__powerpc__) && !defined(__GLIBC__)
> > ++        powerpc-linux-musl
> > ++# elif defined(__powerpc__)
> > ++        powerpc-linux-gnu
> > ++# elif defined(__powerpc64__) && !defined(__GLIBC__)
> > ++#  if defined(__LITTLE_ENDIAN__)
> > ++        powerpc64le-linux-musl
> > ++#  else
> > ++        powerpc64-linux-musl
> > ++#  endif
> > + # elif defined(__powerpc64__)
> > + #  if defined(__LITTLE_ENDIAN__)
> > +         powerpc64le-linux-gnu
> > + #  else
> > +         powerpc64-linux-gnu
> > + #  endif
> > +-# elif defined(__powerpc__)
> > +-        powerpc-linux-gnu
> > + # elif defined(__s390x__)
> > +         s390x-linux-gnu
> > + # elif defined(__s390__)
> > diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
> > index cd7991e7f8..2e8ae711d5 100644
> > --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> > +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> > @@ -44,6 +44,7 @@ SRC_URI += "\
> >              file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
> >              file://run-ptest \
> >             "
> > +SRC_URI_append_libc-musl = " file://powerpc-musl-triplets.patch"
> >
> >  inherit multilib_header python3native update-alternatives qemu ptest
> >
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

