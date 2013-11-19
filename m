Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 004BD6CC8C;
	Tue, 19 Nov 2013 18:21:43 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id b10so1116332eae.5
	for <multiple recipients>; Tue, 19 Nov 2013 10:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sPoYSzYkxWbASuM7CEkFndZnA7V4VRiKqWRBQq2+4aM=;
	b=RBeI7kdSe1mSzQttOLX+IejRJEya1I3ZFVueJPaV0I+csxdjJH/pAkuxPB41TW662O
	+fg9bg14U3+8R70Wsh39WIoNsB8DIbcu3S1FnPdtlLrp/fCmb2xN4epHur87RUYMtBcI
	7XC76uvRcEoTemFE5AHONlTPo4IVg/qjvS91/aJ58HA49IDysR6U9wA4TLc0W/pxQzIH
	tQjF9HZ3OALMsa+sL+T7YMHyFdFY+YEHetOVv90vsg86sDzy0cKhh1OhySMO5lGc6W87
	09ZAi3LkOiCRfE7cGoMkaSU8Dj88jydDy9dBxEdJwgtHNYrO+WNN1lI3+26aW5dX6pi2
	W04g==
X-Received: by 10.14.105.200 with SMTP id k48mr21988522eeg.1.1384885305545;
	Tue, 19 Nov 2013 10:21:45 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id s3sm51328223eeo.3.2013.11.19.10.21.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 10:21:44 -0800 (PST)
Date: Tue, 19 Nov 2013 19:21:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20131119182146.GF3708@jama>
References: <20130622181656.GK14021@jama> <20130725162341.GA3280@jama>
	<20130808225419.GB17945@jama> <20130811114403.GG17945@jama>
	<20130917123058.GC7313@jama> <20131020194345.GB3709@jama>
	<20131030230825.GB32015@jama> <20131119155040.GD3708@jama>
	<20131119155622.GA10619@deserted.net>
	<CAAQYJAvoXz-n7XiZEATZ3kfkWv0XTMdONCegiL3DMMmJQbkcXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAvoXz-n7XiZEATZ3kfkWv0XTMdONCegiL3DMMmJQbkcXw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Tue, 19 Nov 2013 18:21:45 -0000
X-Groupsio-MsgNum: 47293
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline

--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 05:01:06PM +0100, Andrea Adami wrote:
> On Tue, Nov 19, 2013 at 4:56 PM, Joe MacDonald <joe@deserted.net> wrote:
> > [Re: [OE-core] State of bitbake world] On 13.11.19 (Tue 16:50) Martin J=
ansa wrote:
> >
> >> On Thu, Oct 31, 2013 at 12:08:25AM +0100, Martin Jansa wrote:
> >> > Starting now I'll use
> >> > http://openembedded.org/wiki/Bitbake_World_Status
> >> > to post results from my bitbake world buils.
> >>
> >> It was updated few times since this e-mail and I've received no
> >> feedback.
> >>
> >> Should I continue to post them or nobody except me is really intereste=
d?
> >
> > I'm interested.  I've not had nearly as much time to hunt down the ones
> > I own as I'd like, but I do appreciate the mail and I flag them in my
> > mailboxes for easy reference later.
> >
> > -J.
> >
> >>
> >> The stats also show that nobody is interested in fixing them, some iss=
ues are
> >> there for 6+ months.
> >>
>=20
> Martin,
>=20
> thanks for the time you're spending on it.
> About the failure concerning my maintainance fields, I see:
>=20
> | Logfile is clean
> | makedevs: No entry for root in search list
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_rootfs (log file is located at
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-li=
nux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.5623)
>=20
>=20
> So I grep in oe-core for " makedevs: No entry for root in search list"
> and find a serie of commits touching it...
>=20
> Most probable origin of the issue. Starnge that itfails only on x86, thou=
gh.

I believe this "root" is meant as username, I had couple of issues like
this for usernames which didn't exist in /etc/passwd included in the
image. For initramfs-kexecboot-klibc-image I guess you're not installing
base-passwd at all, so maybe the check is failing incorrectly for
initramfs.

> >> Date                   Failed tasks            QA     QA-w/o-unrecogni=
zed
> >>                 qemuarm       qemux86 qemux86_64      qemuarm qemux86 =
qemux86_64      qemuarm qemux86 qemux86_64
> >> 2013-11-19    12      17      19      141     142     131     29      =
27      18
> >> 2013-11-03    11      18      19      96      127     123     22      =
21      16
> >> 2013-10-31    9       17      19      74      114     107     23      =
21      14
> >> 2013-10-30    11      16      18      224     191     184     28      =
23      16
> >>
> >>
> > --
> > -Joe MacDonald.
> > :wq
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKLrDoACgkQN1Ujt2V2gBwfPgCeMDZvqTE3/8i3uvc9rZEp4NDa
fWEAn1UmLb9Zl7uSw1bDGZsuKuG82RaE
=RsPO
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--
