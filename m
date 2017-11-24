Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 848DF783F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 15:36:13 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id c195so6828299ywh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 07:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GeAMlMzD+igyIcrXpld78tfIVYJpK74vWliaMNa2t9o=;
	b=ks6TRevpGxiPxJ7MPEkCQARq9IuFFwaym0zHt91nxQVzfL5BONwvzVSYc8be72zMtk
	Ke8CnQHWN5D+AeZDKyTuoyVcDBYSQXBAckhlLZkNBxLyNPvbw0cH/DT4BVlLO05yzqcs
	6xSmCqB/XnD3ii9Shos4BUsdW57UA+dbwJo0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GeAMlMzD+igyIcrXpld78tfIVYJpK74vWliaMNa2t9o=;
	b=LU92ZIXfsfv04TJSNd5og9n2MvxQI+dEX4eHpV9eU73wy+5e5Phiv1zYprZwIDNgHp
	RWCRc/i2+Lfyth/HHmj0Ut9dc/UhiI0Ul4DOwl8KGA73TczjB6zeluPhl1YqQ7lhINVg
	jrLANJ7ciIcqn2Zyv9pbsCFm4d0OfPXi7BzeEokdTdLLWeWUMbdrfq5HzXEN487m73Fm
	ptFPCJMKiBlbcqErs+36jrPjlkDvcE1Ze0FptfpCf4RXsCjTDag06g7YR8mYnva+Q2jy
	ZR3lo7b4kFoBDmbdBH9/PlZFgF9ZnPcJoWxB2LRQx2heUaSIwCGcXzg9J+nkWO1LJhyt
	z/VA==
X-Gm-Message-State: AJaThX7wGqWNuJ8YilnOllrv3cChfdiMX9E9lBmiTUV2SCjYtE1TxKh3
	9DW+TQuVfKK6Qg6Ordsa9iXdKA==
X-Google-Smtp-Source: AGs4zMbydQbvRnZM4jL5jZiUFLXzFFrqyv7AqRFO8kZM90iKvhmt0ZRE5TEdu3cGDM0euDVa/whZ6g==
X-Received: by 10.13.196.197 with SMTP id g188mr18494048ywd.242.1511537774475; 
	Fri, 24 Nov 2017 07:36:14 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	v187sm8976564ywb.34.2017.11.24.07.36.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 07:36:13 -0800 (PST)
Date: Fri, 24 Nov 2017 10:36:11 -0500
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171124153611.GD3587@bill-the-cat>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
	<1510934900-22044-5-git-send-email-trini@konsulko.com>
	<CAJTo0LbsO5iYxo5W9GRn-CMNpY+oyky9emUO69RTRvo6-D8ATg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbsO5iYxo5W9GRn-CMNpY+oyky9emUO69RTRvo6-D8ATg@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 Nov 2017 15:36:14 -0000
X-Groupsio-MsgNum: 105502
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline

--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2017 at 03:28:21PM +0000, Burton, Ross wrote:
> Still fails on the autobuilder though:
>=20
> 2017-11-24 03:33:51,694 - oe-selftest - INFO - FAIL: test_qemu (wic.Wic)
> 2017-11-24 03:33:51,694 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2017-11-24 03:33:51,694 - oe-selftest - INFO - Traceback (most recent call
> last):
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build=
/meta/lib/oeqa/core/decorator/__init__.py",
> line 32, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build=
/meta/lib/oeqa/selftest/cases/wic.py",
> line 58, in wrapped_f
>     return func(*args, **kwargs)
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build=
/meta/lib/oeqa/selftest/cases/wic.py",
> line 639, in test_qemu
>     self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3
> /mnt\r\n/dev/sda4 /uuid')
> AssertionError: '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /mnt' !=3D
> '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid'
> - /dev/root /
>   /dev/sda1 /boot
> + /dev/sda2 /
> - /dev/sda3 /mnt+ /dev/sda3 /mnt
> ?               ++
> + /dev/sda4 /uuid

Erm, that doesn't make any sense:

> > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > @@ -633,11 +633,14 @@ part /etc --source rootfs --ondisk mmcblk0
> --fstype=3Dext4 --exclude-path bin/ --r
> >          self.assertEqual(0, bitbake('wic-image-minimal').status)
> >          self.remove_config(config)
> >
> > -        with runqemu('wic-image-minimal', ssh=3DFalse) as qemu:
> > -            cmd =3D "mount |grep '^/dev/' | cut -f1,3 -d ' '"
> > +        with runqemu('wic-image-minimal', ssh=3DFalse,
> runqemuparams=3D"nographic") as qemu:

=2E.. I'll v2 since disabling graphics was a local thing, oops.

> > +            cmd =3D "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
> > +            status, output =3D qemu.run_serial(cmd)
> > +            self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2
> /\r\n/dev/sda3 /mnt\r\n/dev/sda4 /uuid')
> > +            cmd =3D "grep UUID=3D /etc/fstab"
> >              status, output =3D qemu.run_serial(cmd)
> >              self.assertEqual(1, status, 'Failed to run command "%s": %=
s'
> % (cmd, output))
> > -            self.assertEqual(output, '/dev/root /\r\n/dev/sda1
> /boot\r\n/dev/sda3 /mnt')
> > +            self.assertEqual(output,
> 'UUID=3D2c71ef06-a81d-4735-9d3a-379b69c6bdba\t/uuid\text4\tdefaults\t0\t0=
')

We no longer want to match the string you've got showing up, and the
string you have showing up says that /uuid wasn't mounted either.

Can you check the sources in the autobuilder please and make sure the
whole series got applied correctly?  Thanks!

--=20
Tom

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaGDxrAAoJEIf59jXTHXZSSOwP/Azteq664HFDEb7h5XiUJHkQ
EnbDdSg7vJpb9ra8OARNmYTKgus/rN8Z7SUAZ61ZbhPpfX8fttZKbw0RwVI1/khy
7gt55ZCdfYjUkwk55CSbFggvBbi2N02J7BBJ8xc5tyxLavo7QaZV+hcw1Srm+k8l
yLDI/con2ENKjjnfClS5qQE2yAgphOW1iEM9Fw+b4Cv3sD/Pd8DCiKTofu1kODfe
lSBBtGoGXwb2UvQrh4y/idz3mlCxjmJlm1XsLokKO6KNc1WlYRiM0kQtLME1l7l6
or9zgJJjxgXDi/GBA0JWvj+4SPtFXB2e2rnuNsPBIgEZLPjHnCHC86axlnOmJ172
g+iasz4IR1Nl/LTCC/iRMwcox1H/lb95wvlHvaua//KcCaiP4oOGkKsQh+vawzMI
GyJXuoFgFrM9+HmEUZAv7S/8sVw+oRH/fv27eAJNT/13upGv166dNHN9dpM9sV2/
1u4wQP/FDg6osUwTkHHEJFo8d9toIa1wB0vcpUsS+Kcz3VhmZPP10psyINPeLO+a
93MpMKI3PO+yFKZaA2ydOJzT7oSQ8P8aWTnLxNvTNn3pdz9G/X0OF1HpwA3Lv0ZJ
sLisjmF/N0pK9Ehp7Z7CMNZjXBm1b2GuN8PbpOnlgnraMYiy8RYfmQ+C8+25ZeD9
xj07hgTWQMhmjszFGdbB
=10Hr
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
