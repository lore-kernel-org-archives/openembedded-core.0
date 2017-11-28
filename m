Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8C660684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 15:55:28 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id 5so126337ybp.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 07:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IN4MDY+RSCNhfhbLqRllWcpxWxL3TlgoQwP5v5w5HO0=;
	b=ZgeysGfAEqJl/Uopigx/SQgbTMQsw5DhSTxu06SF6t/cW/PiFhqsWpgjJc9o/qe4RO
	f7iyLSed8rTplMQFHC9wVu5Mg7WKNrMOQYXXeWuMOEiorSVysIoxbHstkXFH7t/WRGiV
	h8l9XmylshzokyddYebmRwdoI0ag2oZh+0agY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IN4MDY+RSCNhfhbLqRllWcpxWxL3TlgoQwP5v5w5HO0=;
	b=g/ZNBoP0+n96lnOCAOa4yzU+TuY0G/6U4j8bWtb0SuTfM34SMAZo1N2gzc4mLFK9zF
	6YHIOTlDdw5An9IQzmW/y/LUX5HFc7OgpmTxGyfKp1Jx2en0d+AdP2B2+mtpJf8fdfem
	a0hFcYnCAdiWBkF4JmFA17CEHHaQmNN4IIu6vBBDLPPhvrqNfn7XwFTaDJj8eJ1oKStQ
	7ViEjAtGkQXroJMe942GCYXTDlc2aCqMSPDpOcNIDnmwOpMjNqKtjgOS6UEyoPXm3DEA
	fO5jEJI9eKBrp25q1jJEjfM48/HuOZthnww+9PNPXSUQi9glvT6K5vjLIoul3TlZl4XF
	PI0A==
X-Gm-Message-State: AJaThX6iyfvfCMBvdxKwfEbIAcjhyVj4uZX+jESKWvVMqWBaz5zMUqF9
	UXY5WhqdT7Wf+ojIcM6KbP0qvw==
X-Google-Smtp-Source: AGs4zMaL00tmc+SMWJf8iXCVTqMTnPfeMDnWDswuT8nXWi5FtgZj41e3ukPE9udT7RmJRk8PPoIXDg==
X-Received: by 10.37.246.39 with SMTP id t39mr27138521ybd.497.1511884529556;
	Tue, 28 Nov 2017 07:55:29 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	184sm10606866ywa.10.2017.11.28.07.55.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 07:55:29 -0800 (PST)
Date: Tue, 28 Nov 2017 10:55:27 -0500
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171128155527.GH3587@bill-the-cat>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
	<1510934900-22044-5-git-send-email-trini@konsulko.com>
	<CAJTo0LbsO5iYxo5W9GRn-CMNpY+oyky9emUO69RTRvo6-D8ATg@mail.gmail.com>
	<20171124153611.GD3587@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20171124153611.GD3587@bill-the-cat>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] meta-selftest: wic: Add test for --use-uuid / --fsuuid
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
X-List-Received-Date: Tue, 28 Nov 2017 15:55:28 -0000
X-Groupsio-MsgNum: 105655
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X0vpKvTpCy87tk9a"
Content-Disposition: inline

--X0vpKvTpCy87tk9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2017 at 10:36:11AM -0500, Tom Rini wrote:
> On Fri, Nov 24, 2017 at 03:28:21PM +0000, Burton, Ross wrote:
> > Still fails on the autobuilder though:
> >=20
> > 2017-11-24 03:33:51,694 - oe-selftest - INFO - FAIL: test_qemu (wic.Wic)
> > 2017-11-24 03:33:51,694 - oe-selftest - INFO -
> > ----------------------------------------------------------------------
> > 2017-11-24 03:33:51,694 - oe-selftest - INFO - Traceback (most recent c=
all
> > last):
> >   File
> > "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/bui=
ld/meta/lib/oeqa/core/decorator/__init__.py",
> > line 32, in wrapped_f
> >     return func(*args, **kwargs)
> >   File
> > "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/bui=
ld/meta/lib/oeqa/selftest/cases/wic.py",
> > line 58, in wrapped_f
> >     return func(*args, **kwargs)
> >   File
> > "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/bui=
ld/meta/lib/oeqa/selftest/cases/wic.py",
> > line 639, in test_qemu
> >     self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sd=
a3
> > /mnt\r\n/dev/sda4 /uuid')
> > AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt' !=3D
> > '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid'
> > - /dev/root /
> >   /dev/sda1 /boot
> > + /dev/sda2 /
> > - /dev/sda3 /mnt+ /dev/sda3 /mnt
> > ?               ++
> > + /dev/sda4 /uuid
>=20
> Erm, that doesn't make any sense:
>=20
> > > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > > @@ -633,11 +633,14 @@ part /etc --source rootfs --ondisk mmcblk0
> > --fstype=3Dext4 --exclude-path bin/ --r
> > >          self.assertEqual(0, bitbake('wic-image-minimal').status)
> > >          self.remove_config(config)
> > >
> > > -        with runqemu('wic-image-minimal', ssh=3DFalse) as qemu:
> > > -            cmd =3D "mount |grep '^/dev/' | cut -f1,3 -d ' '"
> > > +        with runqemu('wic-image-minimal', ssh=3DFalse,
> > runqemuparams=3D"nographic") as qemu:
>=20
> ... I'll v2 since disabling graphics was a local thing, oops.
>=20
> > > +            cmd =3D "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
> > > +            status, output =3D qemu.run_serial(cmd)
> > > +            self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2
> > /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid')
> > > +            cmd =3D "grep UUID=3D /etc/fstab"
> > >              status, output =3D qemu.run_serial(cmd)
> > >              self.assertEqual(1, status, 'Failed to run command "%s":=
 %s'
> > % (cmd, output))
> > > -            self.assertEqual(output, '/dev/root /\r\n/dev/sda1
> > /boot\r\n/dev/sda3 /mnt')
> > > +            self.assertEqual(output,
> > 'UUID=3D2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/uuid\text4\tdefaults\t0\=
t0')
>=20
> We no longer want to match the string you've got showing up, and the
> string you have showing up says that /uuid wasn't mounted either.
>=20
> Can you check the sources in the autobuilder please and make sure the
> whole series got applied correctly?  Thanks!

Have you had a chance to look at this?  It's really confusing as the
test output is basically the wic-minimal-image without the change that's
included in this patch having been applied (it's 3 partitions).  Thanks!

--=20
Tom

--X0vpKvTpCy87tk9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaHYbuAAoJEIf59jXTHXZSKWEQAIy+5HhrWmwhqm3Xxvlg59Qw
RHL1TcjpV1Q2cwbnLt/u9cWUZYwKDdjckAAUe/Q3YHF13QU9nGbZ0CdeGge+uiPv
cZDuimPaOUBvVRwqBmv1XkfObJZ5/s15pWyZhiqc2VsFXswS4I+ecndhDWxhOJ6b
ERuBn02C8a5pKCSuOkA/4JTwrXQ+tM91PYb/T0aWz71kZ/sDmANpl8ReKZ1HdC91
vNfApwvZe2XH/xt6EGio3X6RfN9ptD+E0LgHZxRsSytQBJMpL+fjqbBO+D9k7jNm
hWoi6JOnBQXHdTmLiQ1GGeq/2yT5b4Ch/HJFk7Gv4UpgDMEp0Td/PWJcYLLwG4RC
kbNdu5hKGzTK04dRt3/u3/Q+nOKLcNLGFB6s1EA8Cvk0XZb+/fMG5tg/SyNefRO3
o/jgEyzF4jp3WT5bXN2dk52KjeQORv0uxr5QFS15wGvxjtg/bGp3IMfdtdZ4ICrv
jbmSE8rHGb/rAoOuyrz97R8lwITsMecq+gLrGYd+T/AbEr3QiNUHa/FySMHqBnim
w8OYzqGJYHWkXyMesVm0n8F2eqq8CrMvaTTMwSXZHSp+BC1ZphnRCuX1z5l8qD2S
mi2y32NcBqsM7597GSC9ZkopYfrbUXYZh4AmBs2A3g1uAauabAyTNw2TB+avPTvs
KnNQ2Rhijrg91zoEP7MU
=wAUw
-----END PGP SIGNATURE-----

--X0vpKvTpCy87tk9a--
