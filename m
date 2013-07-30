Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1A43A6B410
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 08:14:32 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so3386534ead.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 01:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VJalBzd+iFnKd1MAK6at0uWDpx3/EwW2Gj4ZJpEBDEE=;
	b=H6hq4tyUzVCDzLt5mPVWtHZvUGHoVwRW7MO3bmIpy2lQPq4twFH/QXnGLK+CFjQ91Q
	1sG+jQNQluXSKjQ7HgvTpBul1f4pNDnxcfRw3QS2CXmEmJPp8+J2+/oaTbVKCpfMwDVk
	l4ixNMkfZChiZdoyKwS4NnpJ0pjIA46Yw6zsQAmtw0AHe5QSvsq7q1kBCLZELVNnUJyN
	kkadQym5IJu5cVAl6gsoouNZrRbm4jKFv72OjG5nlfbAm7OGFvRfnoIzqgFVVSCuCbU8
	aljOry+FZzU5SgsPRYfM/OKR9G1o+AwoXSn3mBmI/tol0JUhfLe7tJFvGCPDFmLg+Z5c
	+PLg==
X-Received: by 10.14.6.9 with SMTP id 9mr20066269eem.108.1375172072625;
	Tue, 30 Jul 2013 01:14:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bb14sm7597268eeb.17.2013.07.30.01.14.31 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 01:14:32 -0700 (PDT)
Date: Tue, 30 Jul 2013 10:15:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Message-ID: <20130730081504.GF3280@jama>
References: <51F5E863.9010406@cn.fujitsu.com> <51F5E948.4070107@cn.fujitsu.com>
	<1375112169.13247.44.camel@phil-desktop.brightsign>
	<51F71C3A.8000701@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <51F71C3A.8000701@cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/6]qemuarm.conf: provide a common qemuarm machine configuration
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
X-List-Received-Date: Tue, 30 Jul 2013 08:14:33 -0000
X-Groupsio-MsgNum: 42644
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B0nZA57HJSoPbsHY"
Content-Disposition: inline

--B0nZA57HJSoPbsHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2013 at 09:51:54AM +0800, Bian Naimeng wrote:
>=20
> said the following on 2013-7-29 23:36:, Phil Blundell wrote:
> > On Mon, 2013-07-29 at 12:02 +0800, Bian Naimeng wrote:
> >> qemux86.conf: provide a common qemux86 machine configuration,=20
> >> so developer/distributor can customize their specific one.
> >>
> >> Although, we can modify the meta/conf/machine/qemux86.conf to customiz=
e our=20
> >> configuration, but it's uncomfortable for developer/distributor mainta=
ining
> >> their branch.
> >> After applying this patch, developer can tell poky using their machine
> >> configuration by prepending their layer to BBPATH(Of course,
> >> the bblayers.conf should be adapted to it).
> >=20
> > I don't really understand the purpose of this patch.  Surely there is
> > nothing to stop you from shipping an overlay qemux86.conf in some other
> > layer today, right?  What exactly is the advantage of this extra
> > indirection through an .inc file?
> >=20
>=20
> What my purpose is that make it easy to implement the below case.
>  1. I want inherit all the configuration item of qemux86.conf.
>  2. I want add some new items to my qemux86.conf.
>  3. If there're changes to qemux86.conf, i want merge them to my qemux86.=
conf
>=20
> Yes, we can implement this case today.
>  1. Copy the meta/conf/machine/qemux86.conf to my layer.
>  2. Add new items to my qemux86.conf
>  3. Rewrite my qemux86.conf to merge community changes.
>=20
> However, if applying these patches, it becomes easy.
>  1. add "require conf/machine/include/qemux86.inc" to my qemux86.conf
>  2. add new items to my qemux86.conf
>  3. modify qemux86.inc to update qemux86 configration at community,=20
>     so all community changes will be merged to my qemux86.conf automatica=
lly
>     when merging the mainline.

Without patches
1. add require ${COREBASE}/meta/conf/machine/qemux86.conf at the
beginning of your qemux86.conf copy
2. add new items

>=20
> > Also, as a side note, your patches 1/6, 2/6 and 6/6 all said
> > "qemuarm.conf" in the subject lines but only the last of them actually
> > contained changes to qemuarm.conf.
>=20
> Sorry for my mistake. The correct one is following.
> 1/6: qemux86.conf.
> 2/6: qemux86-64.conf
>=20
> >=20
> > Also also, the patches in this form are quite hard to follow.  Did you
> > use "git format-patch -M" when creating them?
>=20
> Yes, I used "git format-patch -M" to create them.
> I will check them by linux/scripts/checkpatch.pl next time.
>=20
> Thanks
>  bian
>=20
> >=20
> > p.
> >=20
> >=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B0nZA57HJSoPbsHY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH3dggACgkQN1Ujt2V2gBydjQCeM5q2k7j3/rQ6XP0Adsuor717
T4MAoJ0bcQIYmSip5IeYgFFM9HyNNIQA
=q2Rb
-----END PGP SIGNATURE-----

--B0nZA57HJSoPbsHY--
