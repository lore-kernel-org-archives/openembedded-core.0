Return-Path: <trini@konsulko.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 31CDE71C0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:45:16 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id g10so6263563qtj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 18:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=O2fey/y5qLZf5biKDniMwW6vq3baZB44e1AIKtshZKg=;
	b=P+ft8JzSnh0QmvG6oVjAo1MUjwRCY8my3e3iiNjFIJqo2TEFc/Hn2Oq4+AKhaPE3AK
	+vTzFqK4QLDOywSqIDUCBYdpyoNbIAj5EUbt2TGyJHeGi8fHEVe9ZDqdf8zZpme28UvM
	WNsbx2uhumhTvgRtUPCZsbfEw4kxUYj4HYDSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=O2fey/y5qLZf5biKDniMwW6vq3baZB44e1AIKtshZKg=;
	b=VsY2JYOhy/pbTqydScNVWEBj/LvyY6/EJvKn7+7rXlrKm6Mw0THUemvVa9yT3VDKat
	uFY+BI7I7l/oDHUglGX66pikOOF8ROf1OAhlO41QzZUBiGWx+Nu0iuutQ0WQXuuex6ln
	wSUxdO4DJiasnCbftHmez2Ya821DLJYdEuziqX9l3snt1LvFKLzumnj6Yd96wBRk73L6
	nvQ7MMUZdSx5kCjSDcEyxdruuSFK1a0Q0ib64RFYUPWQHxQZ2GiKtugIlIv8bqutQmOi
	r0tvUkVFHbAoLh7SdwKdGmi7fv2P3QVB5iurS6WluwCJlvDNfQqR4fRS2o9CoNf9GFOm
	q0aA==
X-Gm-Message-State: AKGB3mIbiHSQyJDgIOS/4d84Udv9FEpwmjTAtpXQK6eu7IbQKcEycDki
	7uwzDGdPTZx0DgjKbORul9/Iig==
X-Google-Smtp-Source: ACJfBouDu/rKdPUES+NQ7t3HKlCTerE4l/qavpebAcyCVU3E6VIvggaZFOtMSB69pGePieMV82fWuA==
X-Received: by 10.200.63.140 with SMTP id d12mr14789659qtk.253.1513219517111; 
	Wed, 13 Dec 2017 18:45:17 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	i23sm1876451qke.88.2017.12.13.18.45.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 18:45:16 -0800 (PST)
Date: Wed, 13 Dec 2017 21:45:13 -0500
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20171214024513.GJ372@bill-the-cat>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
	<1510934900-22044-5-git-send-email-trini@konsulko.com>
	<CAJTo0LbsO5iYxo5W9GRn-CMNpY+oyky9emUO69RTRvo6-D8ATg@mail.gmail.com>
	<20171124153611.GD3587@bill-the-cat>
	<20171128155527.GH3587@bill-the-cat>
	<CAJTo0LaOB_=4EPi=k+HCf=sqYAfrw+5J_cqQ-MFmTtC24EZtRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaOB_=4EPi=k+HCf=sqYAfrw+5J_cqQ-MFmTtC24EZtRA@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Dec 2017 02:45:16 -0000
X-Groupsio-MsgNum: 106232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E0LdhqWfziiBVv4P"
Content-Disposition: inline

--E0LdhqWfziiBVv4P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2017 at 02:40:34PM +0000, Burton, Ross wrote:

> I finally made it break locally, with MACHINE=3Dqemux86 and using sysvinit
> instead of systemd.  Basically, a pristine poky local.conf.  I've not dug
> into it beyond that, or why it passes with systemd.

I found it, and, erm, ugh?  Here's what appears to be a systemd vs
sysvinit difference.  With systemd, if you have an fstab entry and the
mount point doesn't exist, it will get made.  So an entry of /uuid (a
very non-HFS and just made up directory) the mount happens.  With
sysvinit, no, the mount fails.  That's why the test fails.

My gut reaction is that no, it's not wic's job to ensure that the
underlying filesystems have all mount points and I should just re-do the
test to use /mnt instead of /uuid, for the UUID test mount point.

>=20
> Ross
>=20
> On 28 November 2017 at 15:55, Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Fri, Nov 24, 2017 at 10:36:11AM -0500, Tom Rini wrote:
> > > On Fri, Nov 24, 2017 at 03:28:21PM +0000, Burton, Ross wrote:
> > > > Still fails on the autobuilder though:
> > > >
> > > > 2017-11-24 03:33:51,694 - oe-selftest - INFO - FAIL: test_qemu
> > (wic.Wic)
> > > > 2017-11-24 03:33:51,694 - oe-selftest - INFO -
> > > > -------------------------------------------------------------------=
---
> > > > 2017-11-24 03:33:51,694 - oe-selftest - INFO - Traceback (most rece=
nt
> > call
> > > > last):
> > > >   File
> > > > "/home/pokybuild/yocto-autobuilder/yocto-worker/
> > nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
> > > > line 32, in wrapped_f
> > > >     return func(*args, **kwargs)
> > > >   File
> > > > "/home/pokybuild/yocto-autobuilder/yocto-worker/
> > nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
> > > > line 58, in wrapped_f
> > > >     return func(*args, **kwargs)
> > > >   File
> > > > "/home/pokybuild/yocto-autobuilder/yocto-worker/
> > nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/wic.py",
> > > > line 639, in test_qemu
> > > >     self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2
> > /\r\n/dev/sda3
> > > > /mnt\r\n/dev/sda4 /uuid')
> > > > AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt' =
!=3D
> > > > '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uui=
d'
> > > > - /dev/root /
> > > >   /dev/sda1 /boot
> > > > + /dev/sda2 /
> > > > - /dev/sda3 /mnt+ /dev/sda3 /mnt
> > > > ?               ++
> > > > + /dev/sda4 /uuid
> > >
> > > Erm, that doesn't make any sense:
> > >
> > > > > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > > > > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > > > > @@ -633,11 +633,14 @@ part /etc --source rootfs --ondisk mmcblk0
> > > > --fstype=3Dext4 --exclude-path bin/ --r
> > > > >          self.assertEqual(0, bitbake('wic-image-minimal').status)
> > > > >          self.remove_config(config)
> > > > >
> > > > > -        with runqemu('wic-image-minimal', ssh=3DFalse) as qemu:
> > > > > -            cmd =3D "mount |grep '^/dev/' | cut -f1,3 -d ' '"
> > > > > +        with runqemu('wic-image-minimal', ssh=3DFalse,
> > > > runqemuparams=3D"nographic") as qemu:
> > >
> > > ... I'll v2 since disabling graphics was a local thing, oops.
> > >
> > > > > +            cmd =3D "mount |grep '^/dev/' | cut -f1,3 -d ' ' | s=
ort"
> > > > > +            status, output =3D qemu.run_serial(cmd)
> > > > > +            self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sd=
a2
> > > > /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid')
> > > > > +            cmd =3D "grep UUID=3D /etc/fstab"
> > > > >              status, output =3D qemu.run_serial(cmd)
> > > > >              self.assertEqual(1, status, 'Failed to run command
> > "%s": %s'
> > > > % (cmd, output))
> > > > > -            self.assertEqual(output, '/dev/root /\r\n/dev/sda1
> > > > /boot\r\n/dev/sda3 /mnt')
> > > > > +            self.assertEqual(output,
> > > > 'UUID=3D2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/uuid\text4\
> > tdefaults\t0\t0')
> > >
> > > We no longer want to match the string you've got showing up, and the
> > > string you have showing up says that /uuid wasn't mounted either.
> > >
> > > Can you check the sources in the autobuilder please and make sure the
> > > whole series got applied correctly?  Thanks!
> >
> > Have you had a chance to look at this?  It's really confusing as the
> > test output is basically the wic-minimal-image without the change that's
> > included in this patch having been applied (it's 3 partitions).  Thanks!
> >
> > --
> > Tom
> >

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Tom

--E0LdhqWfziiBVv4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaMeW5AAoJEIf59jXTHXZSa1oQAJgj66WZVCEOcgpTnXFYSlLC
RSCeYIp59dFweA2FrTeumpiqTWP5H4wtCMGQbCnZ/OlHKh50r5pUtcsu44S64X97
e+U1JJ6+2oNKNDuNAV2x5aKzsaDNUcm8aK8ld1y/s6/rn++tKaV4dkn4g+9vnAaG
ZVXwbbU1iTIw6SPmuCgF8Vk0pDHPK+zvJFNPZCq7i2ZBQB8ZegJzNSFXywluntsd
FY66gtVdapl9/e6bgWuFSg0dvutyMrCG65OwSANkMdtDGa8C6yGaWLAQYbQkeJha
rUfJltyE7TXqEUYeyoWAX8b+h4BxBuAsqzW0wMNI2U8JR3LD2hrOocLMuN57OdNr
h29zqSXu+bNFMmdnW4RQOV4Q6YXcaioqzsMpJ6ObpG89pQLERLvooeJK2WexjJyd
lYDGdGLtQBHf1vHvVsExQdbt4lenBqNzi52iGyvebuO6DRQzVvV618nbJ/REbnq8
9Mk43pOD77SULLGN2XkfvktfU3tV4KH+Dx4qpZyock3xuDHmWiw9+VAmQRvpxDdf
7gmT/6KbaNpOLjg3Zim76ktV1JMxppYFp6ILAZzCHElK1d9fdLmU4+R0+hkZIhsu
oPM8kE7Dd6FPlWUJaea14M1Pw2lU5tTpgo0LNwpGdsuPCR+vedErEi5921gIyPnp
lep+v3XX68292iHWb4vs
=T10t
-----END PGP SIGNATURE-----

--E0LdhqWfziiBVv4P--
