Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1StH7w-0002rK-Jh; Mon, 23 Jul 2012 13:48:40 +0200
Received: by bkcik5 with SMTP id ik5so3987750bkc.6
	for <multiple recipients>; Mon, 23 Jul 2012 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zno+BQSykcHnfVwSmNzZPKFOQl3mb0E9B+kCvzsuQHk=;
	b=P3JxHDBJtXdtL4NqM4odR+b9GGw7ipM0Nzdvc3Jeb9+xTdVi8guCK/HoNbsSHbo9JA
	F3ocro2Dx8WJhyQgQg+fpZd9gNblrMYtdtvuYM3Am+1FR9XQ1knOFtQwboR6gJNlY0CT
	5+gQx2XByKP9sQe+pDYfOM3PuOwHIM0ec4iP+Oitw30krndCWWsZIHB3/BfPL1Af1kW6
	+3/AtOe5ObhNU8rZPqXCdNjZHRNSWIfjpdFZzDEISohBNgXQdvH0MmMRJlvDFLtkzw+l
	q/ZGG1hc4Adh6u3YDA29c67oCMYxIXZDvhVESSKJTfGwQf7occm8TufbGgEsXele8FQw
	ypoA==
Received: by 10.204.129.4 with SMTP id m4mr7364102bks.55.1343043433751;
	Mon, 23 Jul 2012 04:37:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm7110276bkc.3.2012.07.23.04.37.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 04:37:12 -0700 (PDT)
Date: Mon, 23 Jul 2012 13:37:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120723113712.GE3271@jama.jama.net>
References: <20120722104358.0339C10217@opal>
	<20120723111829.GA20311@jama.jama.net>
	<1343043175.21788.91.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343043175.21788.91.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Morgan Little : python: Update for python-native changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 11:48:40 -0000
X-Groupsio-MsgNum: 25994
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline

--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 12:32:55PM +0100, Richard Purdie wrote:
> On Mon, 2012-07-23 at 13:18 +0200, Martin Jansa wrote:
> > On Sun, Jul 22, 2012 at 10:43:53AM +0000, git@git.openembedded.org wrot=
e:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: 284a65d55f0ffad0f4f7f32d72da0f9410578643
> > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D284a65d55f0ffad0f4f7f32d72da0f9410578643
> > >=20
> > > Author: Morgan Little <morgan.little@windriver.com>
> > > Date:   Thu Jul 19 13:46:07 2012 -0400
> > >=20
> > > python: Update for python-native changes
> > >=20
> > > Add pythonnative onto the list of inherits and update the paths to th=
e binaries
> > > referenced in the recipe to the new paths.
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >=20
> >=20
> > Any idea why is opkg package-index now failing _sometimes_ ?
> >=20
> > | + '[' -e /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc=
/deploy/ipk/ ']'
> > | + touch /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/=
deploy/ipk/Packages
> > | + flock /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/=
deploy/ipk/Packages.flock -c 'opkg-make-index -r /var/lib/jenkins/jobs/shr-=
core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -p /var/lib/jenkins/=
jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -m /var/lib=
/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/'
> > | Traceback (most recent call last):
> > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/=
sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 569, in <module>
> > |     main()
> > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/=
sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 552, in main
> > |     known_paths =3D addsitepackages(known_paths)
> > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/=
sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 329, in addsitepacka=
ges
> > |     for sitedir in getsitepackages():
> > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/=
sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 303, in getsitepacka=
ges
> > |     sitepackages.append(os.path.join(prefix, sys.lib,
> > | AttributeError: 'module' object has no attribute 'lib'
> > | ERROR: Function failed: do_package_index (see /var/lib/jenkins/jobs/s=
hr-core/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/package-=
index-1.0-r0/temp/log.do_package_index.17223 for further information)
> > NOTE: package package-index-1.0-r0: task do_package_index: Failed
>=20
> What is the header of opkg-make-index? Is it a path to python or
> a /usr/bin/env python?

$ head -n1 jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/bin/opkg-make-index
#!/usr/bin/env python

Cheers,

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlANN2gACgkQN1Ujt2V2gByqKgCdGzPXPEPFiB8Wb+KlSrmsHgM3
aeIAni4xY+fqYwRFBsDDCQoTJubV/2qE
=kU/+
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--
