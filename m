Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A93CD6E5CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 11:53:27 +0000 (UTC)
Received: by wmec201 with SMTP id c201so66588041wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 03:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=pn6iyfSYQTvvoud9levVLebI38dthA/fzChgDL4a73E=;
	b=F04OtJ5+ZmmZ/NKVzCXSrur8So3nAQy70Md4WaZKT6N3h5b8J2fi4fryhGqIdy5f/O
	2y98lHEuMp6zd4JARfqaK69ggACcumYVLrnaAmT9DdsIstY8xViKfIOU5LLZ1bytimW4
	a9gAKILAqURVMRl2/rSJIHdLm1To9BuPETbk+6JxV7EdhBZ2ED4wq6DpUwkOCW9hSiiM
	h4bfW1TxTXTxKrQfZJxTdwKbAWCAnuXO8cAshaNYpDN2mzDhLKRiMFNBCKVmaBa4k8SO
	zoyTpU43bp87287xMMuCZvgC8bCyOeICxc1qQAUMFloZBrCMLZFCegq+vriSLNW+XtkO
	c6IA==
X-Received: by 10.194.79.201 with SMTP id l9mr21375363wjx.151.1449834807854;
	Fri, 11 Dec 2015 03:53:27 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	v129sm2278326wmg.21.2015.12.11.03.53.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Dec 2015 03:53:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CA+KKcbkvhpqXB0vOf=hn-7BTq8maqF6OQwGAH4ph_=H5L=kySg@mail.gmail.com>
Date: Fri, 11 Dec 2015 12:53:24 +0100
Message-Id: <CC9AE554-5395-4B3D-8297-A0F01E1C9996@gmail.com>
References: <CA+KKcbkvhpqXB0vOf=hn-7BTq8maqF6OQwGAH4ph_=H5L=kySg@mail.gmail.com>
To: Federico Pietro Briata <federicobriata@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto][meta-java] [PATCH] gnumail: Fix race condition in makefile fail to apply
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
X-List-Received-Date: Fri, 11 Dec 2015 11:53:29 -0000
X-Groupsio-MsgNum: 74650
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D313E2B8-0A41-4763-9464-561AD891D04A";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_D313E2B8-0A41-4763-9464-561AD891D04A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 11.12.2015 um 12:45 schrieb Federico Pietro Briata =
<federicobriata@gmail.com>:
>=20
> Hi

Hi Federico,

as told you on Oct, 16th - please always send to ML!

There is no right on private support, unless you asked _before_!

> I just pull to build openjdk-8 and I get this error:
>=20
> ERROR: Command Error: exit status: 1  Output:
> Applying patch fix_makefile_race_condition.patch
> patching file Makefile.am
> Hunk #1 FAILED at 295.
> 1 out of 3 hunks FAILED -- rejects in file Makefile.am
> Patch fix_makefile_race_condition.patch does not apply (enforce with =
-f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in: =
/home/federico/yocto/imx6/R5.0/build-pcm-mx6quad/tmp-eglibc/work/x86_64-li=
nux/gnumail-native/1.1.2-r1/temp/log.do_patch.7775
> ERROR: Task 613 =
(virtual:native:/home/federico/yocto/imx6/R5.0/sources/meta-java/recipes-c=
ore/classpathx/gnumail_1.1.2.bb, do_patch) failed with exit code '1'

I get the same error - unfortunately I know sometimes my system (MacOS =
X) broils the mails when unexpected special characters are included.
So don't take my word regarding to that patch, maybe mutt guys have a =
better experience :D

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_D313E2B8-0A41-4763-9464-561AD891D04A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWark1AAoJEESZlq7c5QqdKY4P/iV+vZWOWFOHa94nM6uQDA/Z
2yvxDSiZVDTn7+kqqjgwatkoKQvKLqUOUR3abRJUUuILNPSbCxoWCIQ6MW0ukf1Z
vmRUMbwe2xLXQEpuEfXv1EeK+fm2gYAk/4s6F1GATAb/E6aI+jA4remu8/QzwlsQ
aCdWFgp8GAWk8xQdcwMututMPPssCQ+2a5XZVqL9dH92J1UcXJwYXykpg6P4HeRh
MIHdM9aKEJaYYDPOHupkhxuTFff+ddSd66fmPjqAjrkrKDR4NtcrMUd6xnmaJDHZ
Xw14BimkYFtrCV0mhyWmXK4w3x/qJ/CeF8n8FPvCr6AyiR5XGl/JX9d1y/op4cCk
OHCevxVyXRLXknQdKY/vH91qCHa2EGsVsM38K4Ef11EWBEHfU8tYjBTEoDaMPTsj
NWHi+wru68dt/C7zYIy/fj1RLznz4n53mHeHtht24QHdViJ0eJ+LzdkBgTjRkRjh
qAHcvnXuqH1COdBJt3ZRv1xULZtRKCRuJe+v11wLJB8SBHm4b6+msem9qDMrpO0q
Su7revXDGrwdFEqjhBjP7mv11p3ERbbN00KUJnbSpjuD+wdWyty6zH+RhuhoRI04
PzGSZc/nudVyhYY+eiK9VF3Qd9zW5WoctvA3ygNQhQ6vC2V0aW40rkgjraJt1wmE
groAJl0C5KfTw493eW25
=DG4C
-----END PGP SIGNATURE-----

--Apple-Mail=_D313E2B8-0A41-4763-9464-561AD891D04A--
