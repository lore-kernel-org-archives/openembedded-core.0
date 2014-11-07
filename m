Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 49D166017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:29:02 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id n12so3825069wgh.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SBNIzfUzxmTDwakys2wX4Bpk+nYqFIdWM1mzZIQvh6M=;
	b=DE1Ocs3vjJFIKtMCJ+46ZMnBcGk3nKIusuLyxNnWsxgakDKOIi8glq4cFmJ2fRYV+X
	rT8/e92AGGDyzHHDKibnQhCuMsVlUbiwJH2qUn9JgPLmk2dxtTt7ND/RZDYirVp2iVly
	icwPJ5Jgk2+cC9vO7Cf6+g2mEtiRwwA9qP9P3t3zl3g9tSAwKwsPX3xjdZFcxPN7TZvE
	YdQj4+F7+rcW6WJudeuRT5MNnU4YwvJ8SBg0e3S7cTlnHhp4PekgPZV/fa0Ist0xZyW+
	ig5WVB6IuZmAmXtd/t0U75tVl2uDzCd69Z8Dgmpl67HSe7Obla8hBuTuHRK1Rr/9fxg5
	lSmA==
X-Received: by 10.194.78.238 with SMTP id e14mr16467750wjx.106.1415370541789; 
	Fri, 07 Nov 2014 06:29:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mw7sm2248121wib.14.2014.11.07.06.29.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Nov 2014 06:29:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 7 Nov 2014 15:29:07 +0100
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20141107142907.GD2444@jama>
References: <cover.1415258952.git.Qi.Chen@windriver.com>
	<a66c9ed9fe8f4b1524803dd814e62fa606a1c34c.1415258952.git.Qi.Chen@windriver.com>
	<51B83ADF-EF5F-40FF-B4F5-BFDEF0305051@dominion.thruhere.net>
	<545B2A5F.5040208@windriver.com>
	<745681A3-F15C-4D06-93C6-3342E014B672@dominion.thruhere.net>
	<545B629B.5000900@windriver.com>
	<648271BD-0C3E-4506-86C1-F416BC23EA22@dominion.thruhere.net>
	<545BF855.9030205@linux.intel.com> <545C3DD7.60308@windriver.com>
MIME-Version: 1.0
In-Reply-To: <545C3DD7.60308@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: make /etc/sysctl.conf have real effect
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
X-List-Received-Date: Fri, 07 Nov 2014 14:29:09 -0000
X-Groupsio-MsgNum: 59413
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Content-Disposition: inline

--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 11:34:47AM +0800, ChenQi wrote:
> On 11/07/2014 06:38 AM, Randy Witt wrote:
> > On 11/06/2014 05:29 AM, Koen Kooi wrote:
> >>
> >> Op 6 nov. 2014, om 12:59 heeft ChenQi <Qi.Chen@windriver.com> het=20
> >> volgende geschreven:
> >>
> >>>
> >>>
> >>> On 11/06/2014 06:33 PM, Koen Kooi wrote:
> >>>>> Op 6 nov. 2014, om 08:59 heeft ChenQi <Qi.Chen@windriver.com> het=
=20
> >>>>> volgende geschreven:
> >>>>>
> >>>>> On 11/06/2014 03:48 PM, Koen Kooi wrote:
> >>>>>> Op 6 nov. 2014, om 08:32 heeft Chen Qi <Qi.Chen@windriver.com>=20
> >>>>>> het volgende geschreven:
> >>>>>>
> >>>>>>> In systemd, /etc/sysctl.conf is actually ignored by systemd-sysct=
l,
> >>>>>>> because this command only examine *.conf files under a bunch of=
=20
> >>>>>>> directories
> >>>>>>> like /etc/sysctl.d or /usr/lib/sysctl.d.
> >>>>>>>
> >>>>>>> The problem is we are used to configuring kernel parameters in=20
> >>>>>>> /etc/sysctl.conf,
> >>>>>>> so it would be really strange if the configuration in that file=
=20
> >>>>>>> doesn't have any
> >>>>>>> effect.
> >>>>>>>
> >>>>>>> This patch reference Fedora's solution to this problem, creating=
=20
> >>>>>>> a symlink to
> >>>>>>> /etc/sysctl.conf under /etc/sysctl.d/.
> >>>>>> Shouldn't this be done in procps instead?
> >>>>>>
> >>>>> Actually, the problem is not about `sysctl' command.
> >>>>> procps provides `sysctl', but busybox also provides this command.
> >>>>> It's very possible that on our generated image, procps is not=20
> >>>>> installed but `sysctl' command is available.
> >>>>> Both busybox's and procps's `sysctl' command takes=20
> >>>>> /etc/sysctl.conf into consideration.
> >>>> Right, but only procps installs that file.
> >>>
> >>> As busybox provides `sysctl' utility, is it reasonable that it also=
=20
> >>> provides a corresponding configuration file (/etc/sysctl.conf)?=20
> >>> Should we make a patch for busybox?
> >>>
> >>>
> >>>>> Now, systemd provides a similar utility called `systemd-sysctl'=20
> >>>>> which is executed at boot time via systemd-sysctl.service.
> >>>>>
> >>>>> So our actually problem is that systemd-sysctl ignores=20
> >>>>> /etc/sysctl.conf, which makes it somewhat strange, especially to=20
> >>>>> users who are used to configuring parameters in sysctl.conf.
> >>>>> And this patch solves this problem by adding a symlink under=20
> >>>>> /etc/sysctl.d/.
> >>>>>
> >>>>> That's why I think we should put this in systemd.
> >>>> You're adding a symlink to a file which only exists if you install=
=20
> >>>> procps, which isn't in RDEPENDS.
> >>>>
> >>>
> >>> As I said before, procps is *not* necessary for the sysctl mechanism=
=20
> >>> to have effect.
> >>> (Think about systemd-based core-image-minimal image.)
> >>>
> >>> Busybox provides `sysctl', systemd provides `systemd-sysctl'.
> >>> (It's an easy program, there might exist other packages that provide=
=20
> >>> it too.)
> >>>
> >>> /etc/sysctl.conf is a configuration file which is very likely to be=
=20
> >>> modified or created by administrators to configure kernel parameters.
> >>> (You can't expect administrators to all start learning systemd,=20
> >>> trying to understand the gap and differences. In addition, they may=
=20
> >>> have scripts that edit /etc/sysctl.conf to automate their work.)
> >>>
> >>> The point of the symlink is to ensure that when users edit=20
> >>> /etc/sysctl.conf (or create one), configurations in that file will=20
> >>> have effect at boot time.
> >>>
> >>> Just think about this problem from a standpoint of user experience.
> >>
> >> You still haven't convinced me that shipping a broken symlink is a=20
> >> good idea. I'm pretty sure it's not even allowed in out commit=20
> >> guidelines.
> >>
> > I agree, even in Fedora's case, both /etc/sysctl.conf and=20
> > /etc/sysctl.d/99-sysctl.conf come from the same package,=20
> > initscripts-9.51-2.
> >
> >
>=20
> Koen & Witt,
>=20
> When I started out to solve this problem, I basically came up with three=
=20
> solutions. Please see details below. I chose to use solution 3 because I=
=20
> think it's better than the other two. Please tell me which one you like,=
=20
> or please tell me your solution.
>=20
> Solution 1:
> Make 'sysctl.conf' managed by ALTERNATIVES mechanism in OE. Busybox,=20
> procps and systemd all provide this file. And the symlink is still in=20
> systemd.
> (My opinion for this one: over engineering)
>=20
> Solution 2:
> Make base-files provide sysctl.conf and /etc/sysctl.d/99-sysctl.conf (in=
=20
> case of systemd). procps no longer provides sysctl.conf.
> (My opinion for this one: sysctl.conf doesn't logically belong to=20
> base-files.)
>=20
> Solution 3:
> Let systemd provide a broken symlink '/etc/sysctl.d/99-sysctl.conf' and=
=20
> don't change anything else.
>=20
> Which of the above three solutions do you like? Do you have any other=20
> suggestion?

Solution 4 (suggested by Koen and supported by me):
Provide the systemd symlink by the same package which provides sysctl.conf =
in
your image.

If you want to get better user experience for admins with scripts to
update their /etc/sysctl.conf then submit patch to systemd upstream to
process that file, so that their experience will be the same on all
systemd based systems they manage.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRc1zMACgkQN1Ujt2V2gByJUgCcDg3kOU0awPIcsCqt6IzVpqh8
BooAn0Kg893++37o5UHk9K0p3zS3dmSF
=q2Y+
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
