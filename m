Return-Path: <mihai.serban@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id D13E174922
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 19:42:22 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id i83-v6so16218403lfh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tLRRgHn1ufdgu/+b6Mj2CaOOfa0H87V+LN9cCg6afjg=;
	b=hPUGmUVLD/fYVkhu63jQOEqhUo+IUnJ0G5tfLa5XkLBG1zH9snRiwqJ2BiJomEP6df
	GZ3HHlmQ/THSN7+gzJoA2WQ+F5xjp/y6fMRXKBrLlqfEp1o63DXNGfVmntvxf61dIO8L
	DJM0oTznyvkwt5EqUSh6KJPmH4OHSFXtGFfBswQrXm8Xx9A7bYD1Rj2d62RcMAi8FMPh
	ygMlHKZ3S9onY3upwPOR1+3RzO0+E4YFeV59AFViDdsQYhnhYGCfKH+hmNz9ALHLTrrL
	Pg+Sd3uxdO5Iit4uhYK/8INHsXZWsi/FOWrvp64IuWE9lC//S9AXrd4WqnDBobpLLhOi
	EIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tLRRgHn1ufdgu/+b6Mj2CaOOfa0H87V+LN9cCg6afjg=;
	b=EQjMPmKN2GjMziHM0vheJqyuwt8A1bkqFJ/jUbVDsMhLeryZZKGsxD7JUEoQXLPr7S
	BhMlhpg6gGtUEJLOuRMf5QJFhBBrDHj053VjUeWnfvNRyDAhpzDdfbCRsqj36HZWmDlP
	sP55oiDmHDN4hegMuH/DWJbSno1SrNJDOmhNKKmIUj4NmeAJ5VFjn/LmqWc3iNUYuNhz
	jjD2a15krcFNg0A4pPM67WQroEPpMDWBo77LvdJIVRTLe1SKLPLb7OZks7byToXnu5G8
	mk/mjb95xMCvIM3FkzvZWxZFfFoB11NX5546kL3+Wz0Oz+J0wct/Oa9cZJoM+fCsMxio
	DMfw==
X-Gm-Message-State: APt69E2A2+KX8YDCq6v7U1OwfY+cZ9n760wLuy+FeTaT4kUsFfCvQTLn
	mzdjltjQtJm7VFloBADlt2+lhGdbM9uTJ013aBs=
X-Google-Smtp-Source: ADUXVKLAF1H4lonlouHoWjFTcOjlf8+rHCi6ELeO2Ru96aETLHkA4PQ/5FBoRNsILZIlUAFGk/AiRFyxttD1EisLChE=
X-Received: by 2002:a19:7d06:: with SMTP id y6-v6mr133799lfc.30.1529091743374; 
	Fri, 15 Jun 2018 12:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180615161818.831-1-mihai.serban@gmail.com>
	<CAO5Uq5SOwRVqnVRWYkPR=8j+wNAexr68NjXVDZaFkhHPUc0qOQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5SOwRVqnVRWYkPR=8j+wNAexr68NjXVDZaFkhHPUc0qOQ@mail.gmail.com>
From: Mihai Serban <mihai.serban@gmail.com>
Date: Fri, 15 Jun 2018 22:42:12 +0300
Message-ID: <CADoSQ137E1Z7JRGX+KvNpudGmasbhNwWXzKrLy=4RA7Zc9g=Pw@mail.gmail.com>
To: alex.kiernan@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage: Allow DTB file relocation at boot time
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
X-List-Received-Date: Fri, 15 Jun 2018 19:42:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 8:58 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Fri, Jun 15, 2018 at 5:19 PM Mihai Serban <mihai.serban@gmail.com> wrote:
> >
> > Use UBOOT_DTB_LOADADDRESS and UBOOT_DTB_ENTRYPOINT variables to instruct
> > U-Boot where to place the selected DTB file when booting the system.
> > Without these settings U-Boot uses the relative offset where DTB resides
> > inside the loading address of the FIT image.
> >
> > Signed-off-by: Mihai Serban <mihai.serban@gmail.com>
>
> I've a similar patch I've been sitting on for a while, which also
> deals with the case where you want DTB overlays, but I don't have the
> entry line - what's the use for that in a DTB inside a FIT image?

Thanks for pointing this out. Entry is not used for DTB, I'll send v2.

>
> I'll get what I've got posted up.
>
> > ---
> >  meta/classes/kernel-fitimage.bbclass | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> > index 50a91e199069..981d11f19f8d 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -134,6 +134,15 @@ EOF
> >  fitimage_emit_section_dtb() {
> >
> >         dtb_csum="sha1"
> > +       dtb_loadline=""
> > +       dtb_entryline=""
> > +
> > +       if [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
> > +               dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
> > +       fi
> > +       if [ -n "${UBOOT_DTB_ENTRYPOINT}" ]; then
> > +               dtb_entryline="entry = <${UBOOT_DTB_ENTRYPOINT}>;"
> > +       fi
> >
> >         cat << EOF >> ${1}
> >                  fdt@${2} {
> > @@ -142,6 +151,8 @@ fitimage_emit_section_dtb() {
> >                          type = "flat_dt";
> >                          arch = "${UBOOT_ARCH}";
> >                          compression = "none";
> > +                        ${dtb_loadline}
> > +                        ${dtb_entryline}
> >                          hash@1 {
> >                                  algo = "${dtb_csum}";
> >                          };
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Alex Kiernan

