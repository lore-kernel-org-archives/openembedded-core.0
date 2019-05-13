Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 107637DEFF
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:38:26 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id m7so11322982ioa.6
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 14:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+fPikTg3IOo5gJttt/get0wYUabYUEaxPc/qLrIatHo=;
	b=TRwrl7VGY7dBqPYGozlhMShhJ4ZH0xorHvQ1jgLOD8pK4TSWJtHrxX4O+/plUnvXPg
	LUGjfId71aM2jIgW4yTPCyNuDQ3fgVeQnlxlXOCMRNvBxitLKvQU0+Lg+M+iI9qez6P4
	UjhaLLpKTRKM43Dsw7FFd8xuQj89tbUeLqwK/TFHUhGrs5w/2Tmcm8KarjNi56SbVi9s
	t/BamYPmm9j8cuQM0NjAreSdONG8p44day1x9dQTZ+JE4OXIsX4h4vmiSdOx1VBg7qYm
	0LlikOR/kfDNJm1AzMxQzANUTjZ3FWrOTibFAu60shnerGerjPm+m5bQOoYDNyK4b21H
	WgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+fPikTg3IOo5gJttt/get0wYUabYUEaxPc/qLrIatHo=;
	b=bjaRa9FrrIduYXeJbzgUnK2rHBcsoCNtK4DjpnjVpf2DDoxVNV9WhTBj8vcdgFwM5m
	el3MekM2He79FKyulsRBsgu6+30KjayhNribogwRoA2tDdS+KfhFkmW2dpMm+qEReMyq
	5s59F1aK67dsg2iOmmAAMppR1hC08xk0eCEtp7DZ2Hze6auvZS3KXtexKXk6Socom7BW
	KiAhpSzWyNqDKjR4FDUeDGTHKsHSf8KR8lqrK+xl7C/ZldyJ9CY/+HSJuFRcKRZ56+nq
	FTkFCqDRGIC5BgbUiQxAQcChnIz9dNdGqu0Qp5LckZRBhj+P8A9HGJmhqgmseezu0kql
	c5ow==
X-Gm-Message-State: APjAAAVxrdEtICjNyQ0gImSUkqldPrdSfZXHw0F2A15wMLEu9ZQ55kRq
	BplvXn+Sz3QRys9MuU+1Zyuf9YBLKwfZULyTr09ZABkk
X-Google-Smtp-Source: APXvYqw+l2bmEk0mxGrDobepU0o/FYsRoWnF7ybgFniWHQIXdb0+chAK6PCxlZdnwOsJaCmdiQ1Mp+o+fcO4VmSMOTI=
X-Received: by 2002:a05:6602:11a:: with SMTP id
	s26mr16826715iot.201.1557783507751; 
	Mon, 13 May 2019 14:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <1551792970-1216-1-git-send-email-catalin-dan.udma@nxp.com>
	<VI1PR04MB5565D1837E769E35CB840F41DA550@VI1PR04MB5565.eurprd04.prod.outlook.com>
	<CAJTo0LbBGZz_71T4kF5yq7Lwj9Mta2k8K+wAEMo=KOYj48nnew@mail.gmail.com>
	<VI1PR04MB5565B9F1D7458A0608C96498DA310@VI1PR04MB5565.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5565B9F1D7458A0608C96498DA310@VI1PR04MB5565.eurprd04.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2019 14:38:16 -0700
Message-ID: <CAJTo0LYUKU5FYAHTYhUbCL+4k_w_=ewY1R9yWhWpZkej_DQBDA@mail.gmail.com>
To: Catalin Dan Udma <catalin-dan.udma@nxp.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [EXT] Re: [PATCH] insane.bbclass: fix QA-check to consider the PREFERRED_RPROVIDER for RDEPENDS
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
X-List-Received-Date: Mon, 13 May 2019 21:38:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

Not sure what happened, maybe the mail got corrupted, but thanks for
attaching the patch.  Applied locally and will test.

Thanks,
Ross

On Tue, 7 May 2019 at 00:50, Catalin Dan Udma <catalin-dan.udma@nxp.com> wr=
ote:
>
> Hi Ross,
>
> I may be missing something in how to contribute to oe-core. I could apply=
 the patch on latest
> master (eb8c7b5 Richard Purdie, "bitbake: HEADER: Drop it") on poky and p=
oky-contrib:
> - git://git.yoctoproject.org/poky
> - https://git.yoctoproject.org/git/poky-contrib
>
> Could you please help me understand where should I rebase?
> For reference, I attached also the patch I applied with "git am".
>
> Thank you,
> Catalin
>
> > -----Original Message-----
> > From: Burton, Ross [mailto:ross.burton@intel.com]
> > Sent: Monday, April 29, 2019 4:26 PM
> > To: Catalin Dan Udma <catalin-dan.udma@nxp.com>
> > Cc: Openembedded-core@lists.openembedded.org
> > Subject: [EXT] Re: [OE-core] [PATCH] insane.bbclass: fix QA-check to co=
nsider
> > the PREFERRED_RPROVIDER for RDEPENDS
> >
> > Caution: EXT Email
> >
> > I just ran into this, but the patch doesn't apply to master anymore.
> > Can you rebase?
> >
> > Thanks,
> > Ross
> >
> > On Tue, 2 Apr 2019 at 23:39, Catalin Dan Udma <catalin-dan.udma@nxp.com=
>
> > wrote:
> > >
> > > Ping.
> > >
> > > Thanks,
> > > Catalin Udma
> > >
> > > > -----Original Message-----
> > > > From: Catalin Dan Udma
> > > > Sent: Tuesday, March 5, 2019 3:36 PM
> > > > To: Openembedded-core@lists.openembedded.org
> > > > Cc: Catalin Dan Udma <catalin-dan.udma@nxp.com>
> > > > Subject: [OE-core][PATCH] insane.bbclass: fix QA-check to consider =
the
> > > > PREFERRED_RPROVIDER for RDEPENDS
> > > >
> > > > QA-check looks in the RDEPENDS list without taking into considerati=
on
> > that a
> > > > specific package may have a PREFERRED_RPROVIDER defined.
> > > > If PREFERRED_RPROVIDER is set, QA-check will ignore that settings a=
nd
> > will
> > > > consider the original package, resulting in QA-check errors:
> > > >       ERROR: do_packate_qa: QA Issue: <...>, but no providers found=
 in
> > > >       RDEPENDS_<package>? [file-rdeps]
> > > > The fix is to replace the original package in the QA-check with the=
 new
> > > > package defined in PREFERRED_RPROVIDER, if it=E2=80=99s set.
> > > >
> > > > Signed-off-by: Catalin Udma <catalin-dan.udma@nxp.com>
> > > > ---
> > > >  meta/classes/insane.bbclass | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbcl=
ass
> > > > index 6411884..165233b 100644
> > > > --- a/meta/classes/insane.bbclass
> > > > +++ b/meta/classes/insane.bbclass
> > > > @@ -689,6 +689,9 @@ def package_qa_check_rdepends(pkg, pkgdest,
> > skip,
> > > > taskdeps, packages, d):
> > > >          # Now do the sanity check!!!
> > > >          if "build-deps" not in skip:
> > > >              for rdepend in rdepends:
> > > > +                pref_rdepend =3D
> > localdata.getVar("PREFERRED_RPROVIDER_%s" %
> > > > rdepend)
> > > > +                if pref_rdepend:
> > > > +                    rdepend =3D pref_rdepend
> > > >                  if "-dbg" in rdepend and "debug-deps" not in skip:
> > > >                      error_msg =3D "%s rdepends on %s" % (pkg,rdepe=
nd)
> > > >                      package_qa_handle_error("debug-deps", error_ms=
g, d)
> > > > @@ -739,6 +742,9 @@ def package_qa_check_rdepends(pkg, pkgdest,
> > skip,
> > > > taskdeps, packages, d):
> > > >                  while next:
> > > >                      new =3D []
> > > >                      for rdep in next:
> > > > +                        pref_rdep =3D
> > localdata.getVar("PREFERRED_RPROVIDER_%s" %
> > > > rdep)
> > > > +                        if pref_rdep:
> > > > +                            rdep =3D pref_rdep
> > > >                          rdep_data =3D oe.packagedata.read_subpkgda=
ta(rdep, d)
> > > >                          sub_rdeps =3D rdep_data.get("RDEPENDS_" + =
rdep)
> > > >                          if not sub_rdeps:
> > > > --
> > > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flist=
s.o
> > penembedded.org%2Fmailman%2Flistinfo%2Fopenembedded-
> > core&amp;data=3D02%7C01%7Ccatalin-
> > dan.udma%40nxp.com%7C2ed6ecae67224c18f69208d6cca62e99%7C686ea1d
> > 3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C636921411454726374&amp;sdata
> > =3DW9Ke%2B%2B%2FXsXU2%2BHvd1Zh5LnkWYWhyb8nAX9iYX3Cuy%2BY%3D
> > &amp;reserved=3D0

