Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 14A0D7520C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 17:43:18 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id x18-v6so11222762uaj.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=78H9iydwj+K3eElqYwP00ot9zP2iuown4TwFDeDrbiQ=;
	b=Qlrg1t0yZHdLQSITsZBozpGRyyRLM5Hkr+3N0/VG1iqEdW+xfDjd+NCZtfO4che7Ws
	qdVMrYMPysy9k1OjMqivuAWKt9S7yuUWiV9FnMhHmk08GaDhbnrMH4Qnk7ChiW9spJgH
	AKhSRQxc1ltjIVGmXz8Iq6fMsRAffhNs2x1LiX56UrdKiBLwBtnlX0FrBtfRahXhcyUk
	2zfn8Nl6BEYSJz30JirI0yCAeu9Waj1cAgRR4XA1onn2mJ2xpv11qUyU6hmEmC0dZur0
	jTSvuBB8vnnUbAhE6akz+VaYD7tpXarnwRww5P8N+q8RuvtghCQCjcH4Z8MIghkiCy8k
	DceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=78H9iydwj+K3eElqYwP00ot9zP2iuown4TwFDeDrbiQ=;
	b=azonofIk1PIgjtDZxO4+n7tgU0jUDWulG/HqjdEpdk7dwjl3Mj6XOf+naJI5Dqezo1
	uSD6krK2IDGQK3CK+H2Sw1p1CKA+eTUnRAY2pom+KhuHkPah58Q2JL6FLp/IzdDDrJbm
	jxN2AiDxMeqs6M97BOl3mEC4DtPV+CUX/6bsEE9AGk3aOV4xWlODKlrjTP7i6fzQPobr
	9X/FvOyfqk8ps+W/swfsJ1TUcukfcaexT3EPMUBfyN15dTbcqd1DAwQzNm8gckU3EyoF
	ZN1A7ckLSnJTr1sQNtJTm5b7Wh/t1f5eDTVVqW7TBMzENLRq9/J7SMpTFa2XDtCJ5P7A
	9YvA==
X-Gm-Message-State: APt69E2lh3s7fBL6qse80y9/jOAAEUSe1pfoMRGL2+jKUdt5EV5gCUCr
	70cvZriaMAsY8sGfQDuziR7p0lWyWITK8S1x4eY=
X-Google-Smtp-Source: ADUXVKKfJAtJVOoPzOKtfjaklP07hnFRmTfUV8wimtFeQpo43E3SujKNAxsNp2U8WTuMGGClrV73jCBeMXsai5tt78E=
X-Received: by 2002:a9f:3613:: with SMTP id
	r19-v6mr8768320uad.49.1529343798993; 
	Mon, 18 Jun 2018 10:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
	<1909050.5dYaE66dI1@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1909050.5dYaE66dI1@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 10:43:01 -0700
Message-ID: <CAMKF1sqTp4y-a=cxdhy-DCax+V2h=S+QRY419qYiMgeBNuGtwg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] package.bbclass: provide debug sources in externalsrc -dbg packages
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
X-List-Received-Date: Mon, 18 Jun 2018 17:43:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 20, 2018 at 3:26 PM Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> Hi Vignesh,
>
> Thanks for the patch, a question below.
>
> On Thursday, 17 May 2018 5:50:00 PM NZST Vignesh Rajendran wrote:
> > The recipes which are using externalsrc method doesn't contain the
> > debug sources in their -dbg packages.
> >
> > Add a handling in copydebugsources function to copy the debugsources for
> > externalsrc -dbg packages.
> >
> > Signed-off-by: Vignesh Rajendran <vignesh.rajendran@in.bosch.com>
> > ---
> >  meta/classes/externalsrc.bbclass |  3 +++
> >  meta/classes/package.bbclass     | 12 ++++++++++--
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> > index c9f5cf7..135670d 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -129,6 +129,9 @@ python () {
> >              d.setVar('CONFIGURESTAMPFILE', configstamp)
> >              d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}')
> >              d.setVar('STAMPCLEAN', '${STAMPS_DIR}/work-shared/${PN}/*-*')
> > +
> > +     # set DEBUG_PREFIX_MAP to external source path
> > +     d.appendVar("DEBUG_PREFIX_MAP", "-fdebug-prefix-map=${EXTERNALSRC}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}")
> >  }
> >
> >  python externalsrc_configure_prefunc() {
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index edeffa9..f071a2e 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -420,6 +420,7 @@ def copydebugsources(debugsrcdir, d):
> >          workdir = d.getVar("WORKDIR")
> >          workparentdir = os.path.dirname(os.path.dirname(workdir))
> >          workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
> > +        externalsrc = d.getVar('EXTERNALSRC', True)
> >
> >          # If build path exists in sourcefile, it means toolchain did not use
> >          # -fdebug-prefix-map to compile
> > @@ -444,9 +445,16 @@ def copydebugsources(debugsrcdir, d):
> >          processdebugsrc += "fgrep -zw '%s' | "
> >          # Remove prefix in the source paths
> >          processdebugsrc += "sed 's#%s##g' | "
> > -        processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
> > +        # handle external sources to provide sources in -dbg packages
> > +        if externalsrc:
> > +            localsrc_prefix = "/usr/src/debug/"
> > +            processdebugsrc += "sed 's#%s/##g' | "
> > +            processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s/%s' 2>/dev/null)"
> > +            cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workbasedir, externalsrc, dvar, debugsrcdir, workbasedir)
> > +        else:
> > +            processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s' 2>/dev/null)"
> > +            cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
> >
> > -        cmd = processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)
> >          (retval, output) = oe.utils.getstatusoutput(cmd)
> >          # Can "fail" if internal headers/transient sources are attempted
> >          #if retval:
> >
>
> Is there a way we can fix this without adding a reference to externalsrc in
> package.bbclass?
>

perhaps setting DEBUG_PREFIX_MAP relative to S instead of WORKDIR is
going to take care of this

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

