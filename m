Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 474947DBB8
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 13:25:41 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id r71so8875402iod.11
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8+suR4WA2mIQXU70mR+MvfxjOSOGQF/gFEHyCQDidW8=;
	b=sZoTEow74tQiBscDZP7y4aHKGxPjAnDXTiBEBS9orSnrgp8bNL2S0fsT4G1NX/BbMT
	eWsxJmmtN9h+K+gbWVpfucszhb/L9xNTea9cyen5kTjNPOc6PJsabmltKEw4H8VBIO2a
	ui93+ojap+GukunpTCfl60jC8Bn3yZetSEGGZp7LCOFLOTXLLbcPmkOqEX8YdwP72uwl
	SG5ZWVACIm0DcnvBTny/RBl01/HBRL+PS6SbwtaPuKVPjBdJS8cDETzzifKX4QSom2oD
	RBlH7YY2IimnbPwBoEI3iarU34HaBo09yM31IUk/0g6iFnJTOwytN3QCDcfVTwAixYka
	NF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8+suR4WA2mIQXU70mR+MvfxjOSOGQF/gFEHyCQDidW8=;
	b=dSG+dERthBgrSVOF+/mRazuFm83t0kUdWm0tCGeWKDOIo5cB+dkFgHhNc4TOtLh4Rm
	DrNeZZBAvZ2oLmgi6KR5bG1yo6Yvo4DwRSokW7H0I9QYEuqbcBqS6gPKIAfXlkRFTqw1
	iFX2UjGd9MVn36F6qUtS5It98AaSyTat+n9igSaiA4Yah8Bg+q7Y3MEffZWunJvjEkQX
	YWnypUucIKCeFTebGnhcmo5PoizYBMaS0PmhN5uFkmAnVg4LU91sVVr4c0Mnt58+8Hu+
	fiykNGak4Kfm1f94siD9WojMt6u2rcOLw7v2ccVAtuIBKoJQ5KcXcE1tvja81YFgkQg9
	jSzQ==
X-Gm-Message-State: APjAAAW5rvAnK0aqvOL/SdaC+OPIOfQnjmXYUU5Xe9lq39XNzYqZhME2
	HjV8lBvrd6hqZeOowNLa07j8GuN2tp0dWpuk2Jj5xNsZ
X-Google-Smtp-Source: APXvYqwbQUOC14DCzKfHR7RxO5JTcINdt0nd+IbLNC1n7ZMkqkcSBdXrzNAg+oSY/e2eXti97Vy63I0KMPCQDMSdTtE=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr20362481ion.20.1556544342290; 
	Mon, 29 Apr 2019 06:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <1551792970-1216-1-git-send-email-catalin-dan.udma@nxp.com>
	<VI1PR04MB5565D1837E769E35CB840F41DA550@VI1PR04MB5565.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5565D1837E769E35CB840F41DA550@VI1PR04MB5565.eurprd04.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Apr 2019 14:25:30 +0100
Message-ID: <CAJTo0LbBGZz_71T4kF5yq7Lwj9Mta2k8K+wAEMo=KOYj48nnew@mail.gmail.com>
To: Catalin Dan Udma <catalin-dan.udma@nxp.com>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: fix QA-check to consider the PREFERRED_RPROVIDER for RDEPENDS
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
X-List-Received-Date: Mon, 29 Apr 2019 13:25:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just ran into this, but the patch doesn't apply to master anymore.
Can you rebase?

Thanks,
Ross

On Tue, 2 Apr 2019 at 23:39, Catalin Dan Udma <catalin-dan.udma@nxp.com> wr=
ote:
>
> Ping.
>
> Thanks,
> Catalin Udma
>
> > -----Original Message-----
> > From: Catalin Dan Udma
> > Sent: Tuesday, March 5, 2019 3:36 PM
> > To: Openembedded-core@lists.openembedded.org
> > Cc: Catalin Dan Udma <catalin-dan.udma@nxp.com>
> > Subject: [OE-core][PATCH] insane.bbclass: fix QA-check to consider the
> > PREFERRED_RPROVIDER for RDEPENDS
> >
> > QA-check looks in the RDEPENDS list without taking into consideration t=
hat a
> > specific package may have a PREFERRED_RPROVIDER defined.
> > If PREFERRED_RPROVIDER is set, QA-check will ignore that settings and w=
ill
> > consider the original package, resulting in QA-check errors:
> >       ERROR: do_packate_qa: QA Issue: <...>, but no providers found in
> >       RDEPENDS_<package>? [file-rdeps]
> > The fix is to replace the original package in the QA-check with the new
> > package defined in PREFERRED_RPROVIDER, if it=E2=80=99s set.
> >
> > Signed-off-by: Catalin Udma <catalin-dan.udma@nxp.com>
> > ---
> >  meta/classes/insane.bbclass | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 6411884..165233b 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -689,6 +689,9 @@ def package_qa_check_rdepends(pkg, pkgdest, skip,
> > taskdeps, packages, d):
> >          # Now do the sanity check!!!
> >          if "build-deps" not in skip:
> >              for rdepend in rdepends:
> > +                pref_rdepend =3D localdata.getVar("PREFERRED_RPROVIDER=
_%s" %
> > rdepend)
> > +                if pref_rdepend:
> > +                    rdepend =3D pref_rdepend
> >                  if "-dbg" in rdepend and "debug-deps" not in skip:
> >                      error_msg =3D "%s rdepends on %s" % (pkg,rdepend)
> >                      package_qa_handle_error("debug-deps", error_msg, d=
)
> > @@ -739,6 +742,9 @@ def package_qa_check_rdepends(pkg, pkgdest, skip,
> > taskdeps, packages, d):
> >                  while next:
> >                      new =3D []
> >                      for rdep in next:
> > +                        pref_rdep =3D localdata.getVar("PREFERRED_RPRO=
VIDER_%s" %
> > rdep)
> > +                        if pref_rdep:
> > +                            rdep =3D pref_rdep
> >                          rdep_data =3D oe.packagedata.read_subpkgdata(r=
dep, d)
> >                          sub_rdeps =3D rdep_data.get("RDEPENDS_" + rdep=
)
> >                          if not sub_rdeps:
> > --
> > 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

