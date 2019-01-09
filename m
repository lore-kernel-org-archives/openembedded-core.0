Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id ECE966D74B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 11:56:28 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id b16so5824942ior.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ro0xyvR9oQWpZWfCnehbJ0xluPAGehONSfYwpyxrC+Q=;
	b=yCwAZ8I4E/TB0VjTDQ/47MGJXSLS+6NnbL1r+HW8BBzVMMuOeSIihbbIS/IS35JITU
	HPy9cZAWYebjg3bSvxaN20vgCEvyPrAd6f5cey70dMrkWuquAv6UdT5AF6zI7YQN3EXs
	tNV4omcbyGi6qmklygiDRpHSLOCXrPlk4kV37x+keiO3kEjKV19Taep4Mh0Q9tuox/nL
	FgJHgQv0czpIb9Gx9+1r3jLGg0pZQk2duCTUcjgAjrs1D0oE6sdLK2rNM3irx3O+QILj
	S/L0QB0fIwhzsKpsgB2mToZOq28hRCboU8fBHEhImaDpRAJaPkBTOq9O09m8c0giQshY
	PcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ro0xyvR9oQWpZWfCnehbJ0xluPAGehONSfYwpyxrC+Q=;
	b=kY218CcRu51tLwSIgiM1iDhQFIrDodPU4bnEXvX23x4FIt6rGvaBGbGGORjJZvfjL3
	mXKTUMlUXIxp41+BC6tHUq63WLLc/KhgeJTmdgtal0AlbK4lY66LsyP08SUHUiuTRKR/
	sETfEbDTm41XUUPoTVL7Kk0O+v/isnczVaYqmbeMuj/cPkTL2Q5QRGgZ20TRBlZiC7/R
	NRLH2LHkgFW1k2i/7R2bar0IqZBIejLt1hssDk2hcGhPu8r8/oT0jM0eHO+zV93RBwrR
	CYQ2wwmJFs81c3lDYta0zNE5U0zjn5lUwJZqeSHtFViGd/Fa99SjO2UkEaxAXHUtfOx4
	QrIQ==
X-Gm-Message-State: AJcUukfzikvGFhpqZqCovS+pWrR8eEPkgEDOajAshAav6CZowG0NN0La
	ydafN78goTwRMp2muJkoiCUPBsyATvjoLwtckisGVg==
X-Google-Smtp-Source: ALg8bN7E2L5XK9Zh+dc5qpeKoH1OVOYVO5oH864AxquYaJkTMVjYG3+GyuRQVhgrObwBu+lsGO7wTeKrrbrvdfNcUFw=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr3392093ioe.20.1547034989943; 
	Wed, 09 Jan 2019 03:56:29 -0800 (PST)
MIME-Version: 1.0
References: <1544645927-18002-1-git-send-email-alex.kiernan@gmail.com>
	<CAO5Uq5RZ0gEppGrR2xu-dKbnkcj7Kznph-XgWQnPVrF7GNpt7w@mail.gmail.com>
In-Reply-To: <CAO5Uq5RZ0gEppGrR2xu-dKbnkcj7Kznph-XgWQnPVrF7GNpt7w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2019 11:56:18 +0000
Message-ID: <CAJTo0LY4KZ+7nMWWt-fSPXaQ2jCgrQgUQd_2Q1fz=49ROpyQgg@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-sign.bbclass: silence warnings when UBOOT_DTB_BINARY is empty
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
X-List-Received-Date: Wed, 09 Jan 2019 11:56:29 -0000
Content-Type: text/plain; charset="UTF-8"

This is queued for a build, I'll fire one shortly.

Ross

On Tue, 8 Jan 2019 at 15:57, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Wed, Dec 12, 2018 at 8:18 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > When UBOOT_DTB_BINARY is set to "", the keys for signed booting are
> > expected to be already present in U-Boot's DTB, so don't issue warnings
> > for this.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>
> Ping?
>
> > ---
> >
> >  meta/classes/uboot-sign.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
> > index 03100b8a5fa1..9e3d1d6fc1ad 100644
> > --- a/meta/classes/uboot-sign.bbclass
> > +++ b/meta/classes/uboot-sign.bbclass
> > @@ -70,7 +70,7 @@ concat_dtb() {
> >                 elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
> >                         cd ${DEPLOYDIR}
> >                         cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
> > -               else
> > +               elif [ -n "${UBOOT_DTB_BINARY}" ]; then
> >                         bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
> >                 fi
> >         fi
> > @@ -86,7 +86,7 @@ do_install_append() {
> >                         # need both of them.
> >                         install ${B}/${UBOOT_DTB_BINARY} ${D}${datadir}/${UBOOT_DTB_IMAGE}
> >                         ln -sf ${UBOOT_DTB_IMAGE} ${D}${datadir}/${UBOOT_DTB_BINARY}
> > -               else
> > +               elif [ -n "${UBOOT_DTB_BINARY}" ]; then
> >                         bbwarn "${B}/${UBOOT_DTB_BINARY} not found"
> >                 fi
> >         fi
> > --
> > 2.7.4
> >
>
>
> --
> Alex Kiernan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

