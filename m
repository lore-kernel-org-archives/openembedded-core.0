Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6003378873
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 03:15:13 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z203so4658863qkb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 19:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=EWw06jnomcZSSHBQSQtStXkehVSoeu4hkBDvrWT1Lbg=;
	b=MExnTYXjdWR470BF3Vqn9PDWGGf2NCE3Gm8m81rG7Hg443tA28EHz0rtH9rKkXCGkH
	N+U/2aoAq6/DaaL3kTkHuiZbPe3Z8Qy/dlzmPIL4rqaszRDxO0Lkz37+gzeyhI09r9hb
	3Q0NcQwegOnkFKIYFPGPiwPjJ6STYY2i+Tu5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=EWw06jnomcZSSHBQSQtStXkehVSoeu4hkBDvrWT1Lbg=;
	b=sBwbDxzQ1H6ns6lNagAWrIyA/skCCkgSSFsDw2hYoe/PY7ux/ZhMguK0tRWMSA1QI/
	3sa57k/D/a2/TXMK/rCfgHeYzQ/RAgMRnc0SGbtlTztbEw2yyJ41Paq1pGrXimFWyVhO
	6molFPW+QViauLlRbD2pEMKPKB/P5b9Jzzf0eeSBp3H2JY4ZuAUxKz92gFEr8dPbWIPI
	xoWe+94uKQWbfu5bxWh2Sqags0aeeBASZ1TV6HkrswUyH8JtAsp0JwML19TQbc45bj7q
	gkRMrelMq69cy4t6Uqyt7swfG9WXLd7+AdF6W2RnfcMPOePOnsGvrAh7rm3hBXGc+4nJ
	rZHA==
X-Gm-Message-State: AKGB3mLRjV3j0t7gm4MUc0GoDB6emmyhGBkDbfm9NAC/vY4gzMb/WFMV
	pfWnrt9/Q1KwT3shQCyZbyArbA==
X-Google-Smtp-Source: ACJfBouEO+/CttjKxYHt3x+LbJEzzXAnu1nEy5B7MHW2SX4SrS+1g/poRpNQ/dEwMdXmpgy9gT/R2g==
X-Received: by 10.55.99.214 with SMTP id x205mr14191716qkb.34.1513221314967;
	Wed, 13 Dec 2017 19:15:14 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	i23sm1904257qke.88.2017.12.13.19.15.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 19:15:14 -0800 (PST)
Date: Wed, 13 Dec 2017 22:15:12 -0500
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20171214031512.GK372@bill-the-cat>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
	<1510934900-22044-5-git-send-email-trini@konsulko.com>
	<CAJTo0LbsO5iYxo5W9GRn-CMNpY+oyky9emUO69RTRvo6-D8ATg@mail.gmail.com>
	<20171124153611.GD3587@bill-the-cat>
	<20171128155527.GH3587@bill-the-cat>
	<CAJTo0LaOB_=4EPi=k+HCf=sqYAfrw+5J_cqQ-MFmTtC24EZtRA@mail.gmail.com>
	<20171214024513.GJ372@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20171214024513.GJ372@bill-the-cat>
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
X-List-Received-Date: Thu, 14 Dec 2017 03:15:14 -0000
X-Groupsio-MsgNum: 106233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vwmj/TXzE7NEH899"
Content-Disposition: inline

--Vwmj/TXzE7NEH899
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2017 at 09:45:13PM -0500, Tom Rini wrote:
> On Wed, Dec 13, 2017 at 02:40:34PM +0000, Burton, Ross wrote:
>=20
> > I finally made it break locally, with MACHINE=3Dqemux86 and using sysvi=
nit
> > instead of systemd.  Basically, a pristine poky local.conf.  I've not d=
ug
> > into it beyond that, or why it passes with systemd.
>=20
> I found it, and, erm, ugh?  Here's what appears to be a systemd vs
> sysvinit difference.  With systemd, if you have an fstab entry and the
> mount point doesn't exist, it will get made.  So an entry of /uuid (a
> very non-HFS and just made up directory) the mount happens.  With
> sysvinit, no, the mount fails.  That's why the test fails.
>=20
> My gut reaction is that no, it's not wic's job to ensure that the
> underlying filesystems have all mount points and I should just re-do the
> test to use /mnt instead of /uuid, for the UUID test mount point.

And in fact, systemd just can't be used for oe-selftest and have
everything expect to pass today.  The existing wic.Wic.test_qemu will
fail on /dev/root vs /dev/sda2.  So I'm going to post a v4 that puts the
UUID one into /media, and I've run the tests and they pass atm.  Thanks!

>=20
> >=20
> > Ross
> >=20
> > On 28 November 2017 at 15:55, Tom Rini <trini@konsulko.com> wrote:
> >=20
> > > On Fri, Nov 24, 2017 at 10:36:11AM -0500, Tom Rini wrote:
> > > > On Fri, Nov 24, 2017 at 03:28:21PM +0000, Burton, Ross wrote:
> > > > > Still fails on the autobuilder though:
> > > > >
> > > > > 2017-11-24 03:33:51,694 - oe-selftest - INFO - FAIL: test_qemu
> > > (wic.Wic)
> > > > > 2017-11-24 03:33:51,694 - oe-selftest - INFO -
> > > > > -----------------------------------------------------------------=
-----
> > > > > 2017-11-24 03:33:51,694 - oe-selftest - INFO - Traceback (most re=
cent
> > > call
> > > > > last):
> > > > >   File
> > > > > "/home/pokybuild/yocto-autobuilder/yocto-worker/
> > > nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
> > > > > line 32, in wrapped_f
> > > > >     return func(*args, **kwargs)
> > > > >   File
> > > > > "/home/pokybuild/yocto-autobuilder/yocto-worker/
> > > nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
> > > > > line 58, in wrapped_f
> > > > >     return func(*args, **kwargs)
> > > > >   File
> > > > > "/home/pokybuild/yocto-autobuilder/yocto-worker/
> > > nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
> > > > > line 639, in test_qemu
> > > > >     self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2
> > > /\r\n/dev/sda3
> > > > > /mnt\r\n/dev/sda4 /uuid')
> > > > > AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt=
' !=3D
> > > > > '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /u=
uid'
> > > > > - /dev/root /
> > > > >   /dev/sda1 /boot
> > > > > + /dev/sda2 /
> > > > > - /dev/sda3 /mnt+ /dev/sda3 /mnt
> > > > > ?               ++
> > > > > + /dev/sda4 /uuid
> > > >
> > > > Erm, that doesn't make any sense:
> > > >
> > > > > > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > > > > > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > > > > > @@ -633,11 +633,14 @@ part /etc --source rootfs --ondisk mmcblk0
> > > > > --fstype=3Dext4 --exclude-path bin/ --r
> > > > > >          self.assertEqual(0, bitbake('wic-image-minimal').statu=
s)
> > > > > >          self.remove_config(config)
> > > > > >
> > > > > > -        with runqemu('wic-image-minimal', ssh=3DFalse) as qemu:
> > > > > > -            cmd =3D "mount |grep '^/dev/' | cut -f1,3 -d ' '"
> > > > > > +        with runqemu('wic-image-minimal', ssh=3DFalse,
> > > > > runqemuparams=3D"nographic") as qemu:
> > > >
> > > > ... I'll v2 since disabling graphics was a local thing, oops.
> > > >
> > > > > > +            cmd =3D "mount |grep '^/dev/' | cut -f1,3 -d ' ' |=
 sort"
> > > > > > +            status, output =3D qemu.run_serial(cmd)
> > > > > > +            self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/=
sda2
> > > > > /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid')
> > > > > > +            cmd =3D "grep UUID=3D /etc/fstab"
> > > > > >              status, output =3D qemu.run_serial(cmd)
> > > > > >              self.assertEqual(1, status, 'Failed to run command
> > > "%s": %s'
> > > > > % (cmd, output))
> > > > > > -            self.assertEqual(output, '/dev/root /\r\n/dev/sda1
> > > > > /boot\r\n/dev/sda3 /mnt')
> > > > > > +            self.assertEqual(output,
> > > > > 'UUID=3D2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/uuid\text4\
> > > tdefaults\t0\t0')
> > > >
> > > > We no longer want to match the string you've got showing up, and the
> > > > string you have showing up says that /uuid wasn't mounted either.
> > > >
> > > > Can you check the sources in the autobuilder please and make sure t=
he
> > > > whole series got applied correctly?  Thanks!
> > >
> > > Have you had a chance to look at this?  It's really confusing as the
> > > test output is basically the wic-minimal-image without the change tha=
t's
> > > included in this patch having been applied (it's 3 partitions).  Than=
ks!
> > >
> > > --
> > > Tom
> > >
>=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
> --=20
> Tom



--=20
Tom

--Vwmj/TXzE7NEH899
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaMezAAAoJEIf59jXTHXZSDngP/0GvAiXNF87zqZwRXnX2CE62
cFxRD4xS2ehiwjjbF7F4tw8Sw0fWuXiVlu6jYtitX/wtKaZvX91180nOH3LT+MzG
8kiWHRpMdSmUq1NYeB7PRNf+eT4KOvmCR17uaCiJwGn8hmyzKz7xOGWOVLHZffBk
HW4XKYp93zBy/TXMEPB/2noYytgn+R0iN/h3ftrNFHWaZepyK2wQQLKOh7KXKp2x
SFeriziYbelvSNYJnvYQw/YP8JCvebqZ+62Mk357ZbhFY1Nrsb+L2g/guYMpBWGj
Id5W89tQJtMl9hnYdntaV0q8M7B6H37spUxV1VoI3mHT5k2+DzbW5FfMhBijQWp7
029waUWG3bOVsPYbIlX6p7BtV66oF30eakLI4sVajqjUfkq/JWm1vXmdQoqv/NKi
CbC+j6IYQq+B/8Rc1ZXuDFopyci7X7xgqTkdjbdObOOs+upWBav4r0uXNKa3E8k4
3qmJc5+tgFXAB1nmt/vfijU63FHCILK08sRxDILt1X64TFOOE85LLoaQzHgr4rlv
NfxMkH7OojHz9pP2q57LvIFTNwtWpd66BpCMzy+91ButIzm9ST2LDcDFM06wejiE
svVXhwGOmGcKcPCqmvhIXTQ93KFko38tv/uBOiKyWMgSkk+mgbxq/Zyqvz2XIUrQ
MwHXiWEKC0WO5AYE2LEO
=UKq4
-----END PGP SIGNATURE-----

--Vwmj/TXzE7NEH899--
