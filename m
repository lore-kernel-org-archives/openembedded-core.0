Return-Path: <dbaryshkov@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6143B73196
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 22:03:01 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id f21so6164524plj.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 15:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AWA9vdrtGTfZEvrgFeMvWcAWsdhd63sxA0iMOxMzt/c=;
	b=lYinMuxkeZDkIGUsgrSs4QmUG6EOKV99MckfpAEoECXqkuudHyFeg9mSoa7zbPEG58
	NZ68feLzvA05Kf/7QFXsXgsmjF2pqMepU/Mm/2oPgghkWEVumfje4hEOcFJ8AlfM/EAx
	IKLfBHy9eQPup4XvKdhQy6Pjb8GfwdBbzt+cxqJHhrCLsKGgjeUN8JLtIG107WSWUkaF
	XQ22CSuzE6r2T3/xhNsAJXRNeHSPxb9ngqOWOjNkfxsPW4MxwYH0uzFUc7llCr0l27Kh
	06veSDyl0lZ1PrVUQB0m1mdTpPBpXH7id7ja2dW3GiQyrwx1cYqzlTsCZi1ZF7DbH06t
	T1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AWA9vdrtGTfZEvrgFeMvWcAWsdhd63sxA0iMOxMzt/c=;
	b=fYDXxvW2p+m2kzPVJ2u5nk3QzJmqu+i3LdNrefl7qfHKg/OBYZqj19s8GaIRsf392k
	qJDvZ9oaMoWsHSXqjjvRgxg4pdA2F+nTbgw3TZsUTefOVyn/8x7AXvPZLfKoFTWRxEje
	xUN5g3I50OrxEeKMOKSisvfSmu2G2yERywqiSux3M6/CoNP0mKXO4Bvz+uErtYGPdcaK
	0MtQncMlTt4CQmx0VPHFx3ABwBk6reqxSuiymnkh7MHHyekIBNWYHoDN9pHXHzs3R2Jr
	6IDDEJ/y1rXPQCIbcnhmda237egPZ5aR1EmnFFaYEReJx+/J+tG1zNR9fJBWpH31LFnj
	pGcQ==
X-Gm-Message-State: APjAAAXzzTfSVA2nHMBH6aiFsB4CzJtrxRlDxDWiMbPu0j7yAKBsFXz3
	x+mCnjozXo0vGvPqWg25dtqY13I4IdTFwsRYK6A=
X-Google-Smtp-Source: APXvYqwzW36fixLrzaICa4CcMJJJgaBVU8b5Sv2Dybno7QceIBvADWlZcr+TLMkfJ/Lld5qKkmXx0JslTy1L9ImX1iE=
X-Received: by 2002:a17:902:bcc2:: with SMTP id
	o2mr11698127pls.281.1570917782201; 
	Sat, 12 Oct 2019 15:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191011081649.18474-1-nicolas.dechesne@linaro.org>
	<77b72f58-adea-f929-9f9d-2c0e6d7ff6e4@gmail.com>
In-Reply-To: <77b72f58-adea-f929-9f9d-2c0e6d7ff6e4@gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Sun, 13 Oct 2019 01:02:50 +0300
Message-ID: <CALT56yOMd4NYDzSOYGPXr71MzLGPKWdOx_ccQdQ2Oevu1ONvRA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH] kernel.bbclass: fix installation of modules signing certificates
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
X-List-Received-Date: Sat, 12 Oct 2019 22:03:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 12 =D0=BE=D0=BA=D1=82. 2019 =D0=B3. =D0=B2 19:57, akuster808 =
<akuster808@gmail.com>:
>
>
>
> On 10/11/19 1:16 AM, Nicolas Dechesne wrote:
> > From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> >
> > If one has provided external key/certificate for modules signing, Kbuil=
d
> > will skip creating signing_key.pem and will write only signing_key.x509
> > certificate. Thus we have to check for .x509 file existence rather than
> > .pem one.
>
> Is this true for all the kernel versions supported by warrior?

Answer to both questions is "yes".

>
> - armin
> >
> > Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.=
com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 2527e731eba43bd36d0ea268aca6b03155376134)
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> >  meta/classes/kernel.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 111a0b2eeb..fb1f49327c 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -453,7 +453,7 @@ do_shared_workdir () {
> >       cp .config $kerneldir/
> >       mkdir -p $kerneldir/include/config
> >       cp include/config/kernel.release $kerneldir/include/config/kernel=
.release
> > -     if [ -e certs/signing_key.pem ]; then
> > +     if [ -e certs/signing_key.x509 ]; then
> >               # The signing_key.* files are stored in the certs/ dir in
> >               # newer Linux kernels
> >               mkdir -p $kerneldir/certs
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
With best wishes
Dmitry

