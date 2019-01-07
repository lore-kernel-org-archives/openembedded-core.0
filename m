Return-Path: <jacob.kroon@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 812156C106
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 09:38:21 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id m62so237638ith.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 01:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oqTf9M5F8j7lD7rLrQw9/9OHQI3kccC4CyX+nlhT9Kg=;
	b=qzlfZfOgapIO9JydCW4YET1PL5bh+hc2hji8LDnnIBonBSgj0RBjva5GW2FNgMLWg/
	Uz+fPkbGFgDi8bVYYQ1UqGzwz2WIosiIu+tXU4DKy08OaKi5HOAAkJl1wmqaiVCkOTHg
	OqGicbEdv6Ww54OvZtujPaIo0Oh7BvsvYoj/EkGzDvyy97tgrAudQS1Bjz8IZcjd4/ip
	p2IFzIhFjqESpUm9Jz0fKF5xuHrO7vbP5BU6Uqw5BiLo3rTAF9EXxQiNbdA70EuJVTpr
	9b5wAbTgtzfgCv2/lRpQNVZbIt3tLPWHNYW970W8CMDUMkIDrJXrtsPXLZArR+9MtKME
	f/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oqTf9M5F8j7lD7rLrQw9/9OHQI3kccC4CyX+nlhT9Kg=;
	b=BydqcgSXRoVJm5DYvAo27AdBDX2V7jlySwipsGoHyb4qjy8c0BiYSSK2f+oQFKgm+N
	czm6k9wi0Ur65yLDrC1yzYIwtzZvaP/QMVV9yZz+9lxzl9vVVKT8po0LEQK7yj2QXyIe
	g0aAV9n2ZsAjS5tm0OElVP07AgZIFhVBO0AwLEnfuiV54x2wK5qISxQ6wYiivck6kLZ6
	DhX7XOu3CxpYymtmh0Hly4er2xXtlvADq+WKcnZbE8+oVrYriMRpaBpUf9V4EjvI/CO2
	5lr4v7S5WSLe97z82MJlYgQMlZKxUdv3LO5NBVHw+CZhIEu5XhIeuDQvPLqjdx0iAL3Y
	agIQ==
X-Gm-Message-State: AJcUukcdvgHQ2yRwraAcLCbt6Rzm2k6AoxuEsOF5uWzGk1vHkq5Fwfr5
	5wq0GkH2AmUOUR1u6zsJvGYOqjrckd4QT6N2G8nxIK/T
X-Google-Smtp-Source: ALg8bN5rO9OMIjKC8s5AxqSCR49WsTcPNL1Gld+PIpqNih7gBR8BIGoOUHQIT/Sdd3BpntEstK4GH1VBlLuqo6Dq8xY=
X-Received: by 2002:a24:1dce:: with SMTP id 197mr7281015itj.154.1546853902144; 
	Mon, 07 Jan 2019 01:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
	<7561c555f243ddaaa45bdd28eed97394c35d67e5.camel@andred.net>
In-Reply-To: <7561c555f243ddaaa45bdd28eed97394c35d67e5.camel@andred.net>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Mon, 7 Jan 2019 10:38:10 +0100
Message-ID: <CAPbeDC=vBTFU6G+CjKUwe_CjhqHqyN6mKxU3t+cr+aw+Wu+5DA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 2/2] buildhistory: support generating md5sum of files
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
X-List-Received-Date: Mon, 07 Jan 2019 09:38:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Mon, Jan 7, 2019 at 12:09 AM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> Hi,
>
> On Sun, 2019-01-06 at 19:13 +0100, Jacob Kroon wrote:
> > Introduce 'md5' in BUILDHISTORY_FEATURES and enable it by default
> > when doing reproducible builds.
> >
> > When enabled this will additionally create:
> >
> >   files-in-package-md5.txt
> >   files-in-image-md5.txt
> >   files-in-sdk-md5.txt
> >
> > containing the md5 checksums of regular files.
> >
> > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > ---
> >  meta/classes/buildhistory.bbclass | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/buildhistory.bbclass
> > b/meta/classes/buildhistory.bbclass
> > index 33eb1b00f6..00f0701dec 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -7,7 +7,8 @@
> >  # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
> >  #
> >
> > -BUILDHISTORY_FEATURES ?=3D "image package sdk"
> > +BUILDHISTORY_FEATURES ?=3D "image package sdk \
> > +  ${@ "md5" if
> > bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARIES')) else ""}"
> >  BUILDHISTORY_DIR ?=3D "${TOPDIR}/buildhistory"
> >  BUILDHISTORY_DIR_IMAGE =3D
> > "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}=
"
> >  BUILDHISTORY_DIR_PACKAGE =3D
> > "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
> > @@ -526,7 +527,12 @@ buildhistory_list_files() {
> >               eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
> >       else
> >               eval $find_cmd
> > -     fi | sort -k5 | sed 's/ * -> $//' > $2 )
> > +     fi | sort -k5 | sed 's/ * -> $//' > $2
> > +     if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'md5', '1', '=
0',
> > d)}" =3D "1" ] ; then
> > +             md5filename=3D$(echo $2 | sed 's/\.txt$/-md5.txt/')
> > +             find -type f | xargs -I{} -n1 md5sum {} | sort -k2 >
> > $md5filename
>
> Why don't you
>   find . -type f -exec md5sum {} + | sort -sk2 > $md5filename
> ?
> It'll be quite a bit faster because way fewer processes will be spawned.
>
> Am I missing something?

You're right, I will update the patch. I'm assuming I don't need the
stable sort, -s,
since the filenames should all be unique.

> I don't know what the intended use-case of the md5 files is, but could
> sha256 or similar maybe be more appropriate?

I thought it would be a good idea to store some sort of checksum of files i=
n the
buildhistory when doing reproducible builds, so that it is easier to detect
when a rebuild produces changed files, but perhaps there is some way to do
this already that I am missing ?

But I have no real motivation for choosing md5, other than that I
assumed it would be less
cpu intensive than sha256, and the fact I'm not too worried about collision=
s.

Thanks for the feedback,
Jacob

> Cheers,
> Andre'
>
>
> > +             [ -s $md5filename ] || rm $md5filename # remove result if
> > empty
> > +     fi )
> >  }
> >
> >  buildhistory_list_pkg_files() {
> > --
> > 2.11.0
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

