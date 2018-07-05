Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B79C78AE8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 10:19:56 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id y9-v6so4560712vky.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 03:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=grjKfxCh2PDgaHn7GDeb//JV4Qpezs3KTc+u5catYUc=;
	b=I3H4VOmkP1OL0CJIyKWNbmn2ksiA6eyis1OFERSJct1ocevKY4hvOtx5ih5ooIVlPv
	vhRU0o8+V4h6LBPr9oVq8q+Tnxyj4p1kQa/qLRV9+mpjDqygzKTWKB6yUK5pTqjzTVoC
	VBwZXQaNsZibPJrQjIC2bo/RCY5ovQ7tBxiAB2lGMZHw8PCGu94lgvJRCgJOTXcAB4Sp
	a6KXpugVpbhj3o1FuQ60xXWFUS/OmGoV0aC06Fdjonmct27dFF6k8l62wTx+GdQVyKy5
	vkrPusRPolfbiAvf7MLBkuDj2SeBF13G6H7sUzdKJJbkNj2SvQaFpIdz/VhPJRhDPe8i
	r+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=grjKfxCh2PDgaHn7GDeb//JV4Qpezs3KTc+u5catYUc=;
	b=V8Qzidm8EWPP97+NhfIxpitkH37H6I2bJzhyeKJ84hltfRRzMrVU86xnTr5tshKhBK
	wLotav2bXoKM2uMnCA6B1Ah1t4BfgwZa5F9fdSYjajERGNIOhsylexujW56xrvDt4Uif
	QxJ9OMakMWBTtkd/RreMoTd8REPeLZR8FHzRejYOYUiEF4kdZSZ5JZmBUc2xfmu2QDFi
	HmKQUqJJL9vcAdMZV/G+duDx7xmhGFCCIqyotOSdoOBDsXcFexBeV1xdrr0Ebr4bPN9L
	3dSaGJ0d/zWlR1KRmZ5CR7eJYOrq1So4S6fhK6E59wWP0HFhmXNl13VBBYZfoYZJpvWd
	DraA==
X-Gm-Message-State: APt69E3B8rvvi6sjRdTaIdlN2P9jdA1IKyi3byKxxc56C5ce8mfkHBpB
	pn3a7Dv5Sj6CnX41+77/VlT7/i/Z4ud8rrX6FN/P3PVA
X-Google-Smtp-Source: AAOMgpe97CoRr2OOEVQFR7rY/3ft5lSh2K1xEPk+LTL19hucV9IhLLdx8zinFxBgBdEeQ+Q+mnqe/CYHgkH7RrpIUcY=
X-Received: by 2002:a1f:cf02:: with SMTP id f2-v6mr2964982vkg.10.1530785997362;
	Thu, 05 Jul 2018 03:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <1529133425-9806-1-git-send-email-alex.kiernan@gmail.com>
	<2bf570bc-3025-b7dc-e305-891c807a99d8@geanix.com>
In-Reply-To: <2bf570bc-3025-b7dc-e305-891c807a99d8@geanix.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 5 Jul 2018 11:19:46 +0100
Message-ID: <CAO5Uq5T19+wbSxi-XvwyvUm9fZkP7U_L2EAWTrFqe=npixB-vw@mail.gmail.com>
To: martin@geanix.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] kernel-fitimage: Allow setting of DTB/DTBO relocation address
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
X-List-Received-Date: Thu, 05 Jul 2018 10:19:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 7:25 AM Martin Hundeb=C3=B8ll <martin@geanix.com> w=
rote:
>
> Hi Alex,
>

Sorry only just found this, gmail decided to mark it as spam :(

> On 2018-06-16 09:17, Alex Kiernan wrote:
> > Introduce UBOOT_DTB_LOADADDRESS and UBOOT_DTBO_LOADADDRESS so that you
> > can set where U-Boot loads full and overlay DTBs. This is required when
> > using bootm's overlay support to construct the final DTB.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> > This commit conflicts with this patch:
> >
> > https://patchwork.openembedded.org/series/12589/
> >
> > Either that needs applying first and this needs rebasing on top of it, =
or
> > use this one in its place.
> >
> >   meta/classes/kernel-fitimage.bbclass | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel=
-fitimage.bbclass
> > index 50a91e1..f3c2ff0 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -135,6 +135,15 @@ fitimage_emit_section_dtb() {
> >
> >       dtb_csum=3D"sha1"
> >
> > +     dtb_loadline=3D""
> > +     dtb_ext=3D${DTB##*.}
> > +     if [ "${dtb_ext}" =3D "dtbo" ]; then
> > +             if [ -n "${UBOOT_DTBO_LOADADDRESS}" ]; then
> > +                     dtb_loadline=3D"load =3D <${UBOOT_DTBO_LOADADDRES=
S}>;"
> > +             fi
> > +     elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
> > +             dtb_loadline=3D"load =3D <${UBOOT_DTB_LOADADDRESS}>;"
> > +     fi
>
> I haven't looked into the use of DTB overlays in fitimages, but
> shouldn't it be possible to specify multiple overlays?
>
>  From the way I read your patch, only a single overlay is supported...
>

Multiple overlays are fine - that's my exact use case. But you only
need one loadaddress for all of them, I have to admit I've not dug
into why that's the case, but it matches the U-Boot documentation:

http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Ddoc/uImage.FIT/overlay-fdt-=
boot.txt;h=3Ddddc4db1a67de19053ba1e9d395e2f651b13d7d0;hb=3DHEAD#l117

From a quick read of the overlay code in bootm, it looks like it
serially loads the overlays into the loadaddress from the FIT image
before it's merged into the main DTB.

--=20
Alex Kiernan

