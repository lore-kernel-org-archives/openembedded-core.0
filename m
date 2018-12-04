Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id F17686C492
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 12:07:48 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id h65so13977197ith.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 04:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oG+nF2Dur2BO2VqCJjFNpHWo5mO3sj3b+T1YVbhZNJM=;
	b=IM+3Lyr1FO6femTMyH3yKQN+pVY4FYMEvEeXJYZDOJ2+Hijk3vW9PbNozwEUABIt/f
	s78CSplA4mSuQpjy0WT9EVq1N0PHcbNlbvoE4t+h58tR27Bhs6wJhiDmRO1oLMId7jKI
	dT4VzUJqG7OhXeqBUinzEn+YuREemKPysVBXkhNqFgq2mL+i+FENi/eRD5CT2s0nCfI4
	uaW8s+sneLuuHxOSxKSGb+CYti5ibIJVqW7mkf8QpWE9O5IcpIGxhynI7Vc8OSz6IyEa
	P4nnuSpNY9isomDA2PfHE5YS2xsP7peZEXgy5+nuCupPgpm5HiplFl5tSAGG8rlIKe1k
	4Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oG+nF2Dur2BO2VqCJjFNpHWo5mO3sj3b+T1YVbhZNJM=;
	b=eu7bMKdLnMYcolvt4+MWETGbHAiRsngw+D5k+jlK4SKV9oEgFbTz5PXfmeWUZlza5M
	MDB6UEWwnTC/Lh2Rg8Ytzw91bN9xVGMb6QlIvT797LPaLO+9aNCXO7quKDGGn0H1lJ1a
	P/SrXj/TprVXwSIhGGhAeNZMWbSY17c0LLCvMLmjVbOSSV7kryyf6Fao1aCn63O8E9Hd
	0XEizIZ+XNXg/p0wbNDEK8gG/CgqR3230rpSpUHjQVsNopvIxDFkJ8XmbeaCtjj1FU0p
	48VLFMmY6xWmxONaE31Ek7HHUvPZLtu0vn0whjcxGtvcmdkvu4DiE2ly65ewyF6g4m1z
	ip6g==
X-Gm-Message-State: AA+aEWayVBmAA7iLSvmt8+y+QDflwgRiNggUko4f3vYdT8N9Kk23TUBc
	rNuRIJXohttdmXTfR5hLcrvTNTSkClc4ydsxCMbR1A==
X-Google-Smtp-Source: AFSGD/VTxeoE8WdRE3IptmlBDnc3E8cuUNWGE2o1/45U47kTvbXQ1mZEAjZKzExaiasiWImyLvHQAr/d+uoG32xR/og=
X-Received: by 2002:a02:57c4:: with SMTP id b65mr18371223jad.79.1543925269876; 
	Tue, 04 Dec 2018 04:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20181203152815.6623-1-git@andred.net>
	<CAJTo0LYwiZ57t7zZBSYO51Tn2AwObKYJ6xqBExDCKr7LLssdqg@mail.gmail.com>
	<17942ed5-f221-9a69-62f8-828a44e097a9@windriver.com>
	<df4c8f584913808f38116e52eb9fc9d53b9ba971.camel@andred.net>
In-Reply-To: <df4c8f584913808f38116e52eb9fc9d53b9ba971.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2018 12:07:37 +0000
Message-ID: <CAJTo0LaYqZXM8TbvOQnz_PbswTFGvPnB9=ocYuqTVEUT2w9f1w@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split out blkdiscard into its own package
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
X-List-Received-Date: Tue, 04 Dec 2018 12:07:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yep, staged already.

Ross
On Tue, 4 Dec 2018 at 08:49, Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> Hi,
>
> I'd be happy to work on that, but I won't have time to do so until someti=
me
> early next year...
>
> Can this patch be applied in the meantime nevertheless please?
>
>
> Cheers,
> Andre'
>
>
> On Tue, 2018-12-04 at 10:04 +0800, ChenQi wrote:
> > I think this is a good idea. I opened a new bug in bugzilla to track it=
,
> > and assigned it to myself.
> > Ross, please check the bug description to see if that's what you want.
> > Andre, if you want to work on it, take the bug and let me know.
> >
> > Best Regards,
> > Chen Qi
> >
> > On 12/04/2018 12:40 AM, Burton, Ross wrote:
> > > When do we just programatically split instead of doing it piece by
> > > piece? :)
> > >
> > > Ross
> > > On Mon, 3 Dec 2018 at 15:28, Andr=C3=A9 Draszik <git@andred.net> wrot=
e:
> > > > From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> > > >
> > > > For systems that don't otherwise depend on the full
> > > > util-linux package, blkdiscard is a mere 18k (on
> > > > cortexa7t2hf-neon).
> > > >
> > > > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> > > > ---
> > > >   meta/recipes-core/util-linux/util-linux.inc | 5 +++--
> > > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > > > b/meta/recipes-core/util-linux/util-linux.inc
> > > > index a05c1cabbe..b5f77f7b6b 100644
> > > > --- a/meta/recipes-core/util-linux/util-linux.inc
> > > > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > > > @@ -27,7 +27,7 @@ DEPENDS_append_class-nativesdk =3D " lzo-native"
> > > >   SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-
> > > > linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
> > > >              "
> > > >
> > > > -PACKAGES =3D+ "util-linux-agetty util-linux-fdisk util-linux-cfdis=
k
> > > > util-linux-sfdisk \
> > > > +PACKAGES =3D+ "util-linux-agetty util-linux-blkdiscard util-linux-=
fdisk
> > > > util-linux-cfdisk util-linux-sfdisk \
> > > >                util-linux-swaponoff util-linux-losetup util-linux-
> > > > umount \
> > > >                util-linux-mount util-linux-readprofile util-linux-
> > > > uuidd \
> > > >                util-linux-uuidgen util-linux-lscpu util-linux-
> > > > fsck.cramfs util-linux-fsck \
> > > > @@ -74,6 +74,7 @@ FILES_${PN}-doc +=3D "${datadir}/getopt/getopt-*.=
*"
> > > >   FILES_${PN}-dev +=3D
> > > > "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
> > > >
> > > >   FILES_util-linux-agetty =3D "${base_sbindir}/agetty"
> > > > +FILES_util-linux-blkdiscard =3D "${sbindir}/blkdiscard"
> > > >   FILES_util-linux-fdisk =3D "${base_sbindir}/fdisk.${BPN}"
> > > >   FILES_util-linux-fstrim =3D "${base_sbindir}/fstrim.${BPN}"
> > > >   FILES_util-linux-cfdisk =3D "${base_sbindir}/cfdisk"
> > > > @@ -126,7 +127,7 @@ RDEPENDS_util-linux-su +=3D "libpam"
> > > >   RDEPENDS_${PN} =3D "util-linux-umount util-linux-swaponoff util-l=
inux-
> > > > losetup util-linux-sulogin util-linux-lsblk"
> > > >   RDEPENDS_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam=
',
> > > > 'util-linux-runuser util-linux-su', '', d)}"
> > > >
> > > > -RRECOMMENDS_${PN} =3D "util-linux-fdisk util-linux-cfdisk util-lin=
ux-
> > > > sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util=
-
> > > > linux-mountpoint util-linux-prlimit util-linux-ionice util-linux-
> > > > switch-root"
> > > > +RRECOMMENDS_${PN} =3D "util-linux-blkdiscard util-linux-fdisk util=
-
> > > > linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprof=
ile
> > > > util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux=
-
> > > > ionice util-linux-switch-root"
> > > >
> > > >   RRECOMMENDS_${PN}_class-native =3D ""
> > > >   RRECOMMENDS_${PN}_class-nativesdk =3D ""
> > > > --
> > > > 2.20.0.rc1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
>

