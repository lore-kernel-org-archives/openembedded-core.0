Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C87EA606BF;
	Sun, 24 Jul 2016 12:11:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so12656259wmg.2;
	Sun, 24 Jul 2016 05:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vjKVgUnulP0eukY7vV8TigZl54is5Ag5Znd8vr7Pvnk=;
	b=L94fW48aJL+iURQwn3FHwKgKqsYrW/EDkmTd3vG34vC65f+aOisaxc5MF+Go8YgiR9
	Lq5fW5+4d4xWf5RbVDnlPDBobfKJV3mX0CA+mnuG29DlippefnHrJkJVZ++xDCZQBAsk
	zPMaWMUrXuxWeKuV+9JtR+WwjhLTmW6uxJ3U/Fwnh1TdJ7vXHT33eJ6LvD8+c0PZXGzD
	0/qC5geSiBm3F8OMO+L4VoZhngIqo15UnjQXlKHNWXgbVllm7DpAm9AdRo7avT2YCSM+
	uHTtRSY/1btNr0BZFVNtKG3cVPBOuPHKK4k2k2ZeYhKFI8/bEI20ApEEXJqZYe3O6OEb
	B1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vjKVgUnulP0eukY7vV8TigZl54is5Ag5Znd8vr7Pvnk=;
	b=f/T9QuOvlOTPe3aPy7AjpfLahBmCdR5mCPjnEx0Sw8Go3kU8elDOWG51lverVJf5YM
	tpkBpI46YZ42/fmAu5r2+yd1vRNQdbA+3AxW2wV8S1ujWSWs8sSyUr19ZjY6JDfi/GAN
	viOejRHlP2OcpaB3LapIvKxyNd4fNo0jPqiYGhmUNnTRhV8QZHsH8vxq577945RyMZrC
	bpfXZUtbr8dBehaN8CMy4wY5hP+w8aivSdWRSYjRUyY22cKQ0V5CK5GCYXVNTHRwpRkY
	iwtOG9vsdwWi8mQok4r/D26I+9/gRlrGCOaCH2RsBaQ0k4lBxFNltY0o7FEKhgbR+LCO
	SXFw==
X-Gm-Message-State: AEkoouvd2xJUFnf1wfxnIm/+BIL6Ag4Vnup618CUAFsvp5+ppo0lB+/VdMoQsNqAfQwewg==
X-Received: by 10.194.89.129 with SMTP id bo1mr10549209wjb.105.1469362287913; 
	Sun, 24 Jul 2016 05:11:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	o4sm10414726wjd.15.2016.07.24.05.11.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 24 Jul 2016 05:11:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Jul 2016 14:11:38 +0200
To: openembedded-core@lists.openembedded.org,
	"Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160724121138.i7fp26ateflny4kl@jama>
References: <20160708085912.13734.77555@opal.openembedded.org>
	<20160708085918.3A528501B3@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160708085918.3A528501B3@opal.openembedded.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 21/28: rt-tests: move ptest to python3
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
X-List-Received-Date: Sun, 24 Jul 2016 12:11:28 -0000
X-Groupsio-MsgNum: 84831
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5edxmydzzt2rtb2a"
Content-Disposition: inline

--5edxmydzzt2rtb2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Any idea why it fails now like this:

http://errors.yoctoproject.org/Errors/Details/73086/

?

On Fri, Jul 08, 2016 at 08:59:33AM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 2767cbe014f84c9ad42ed8ef1eca7caa862e5196
> Author: Maxin B. John <maxin.john@intel.com>
> AuthorDate: Fri Jul 1 11:39:02 2016 +0300
>=20
>     rt-tests: move ptest to python3
>    =20
>     convert python2 based ptest of rt-tests package to python3
>    =20
>     Signed-off-by: Maxin B. John <maxin.john@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-rt/rt-tests/files/rt_bmark.py | 26 +++++++++++++-----------=
--
>  meta/recipes-rt/rt-tests/files/run-ptest   |  2 +-
>  meta/recipes-rt/rt-tests/rt-tests_2.0.bb   |  2 +-
>  3 files changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt=
/rt-tests/files/rt_bmark.py
> index 0e2b105..080a655 100755
> --- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
> +++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python3
>  # -*- coding: utf-8 -*-
> =20
>  # SPDX-License-Identifier:     BSD-3-Clause
> @@ -106,8 +106,8 @@ def tc_name(sub_name):
> =20
>  def log(*msg):
>          tmp =3D "".join(map(str, msg)) # 'map(str, ...' allows numbers
> -        for line in tmp.split("\n"):
> -                print "#", line
> +        for line in tmp.splitlines():
> +                print("#", line)
> =20
>  #-----------------------------------------------------------------------=
--------
>  # Like log(), but with a timestamp added
> @@ -265,7 +265,7 @@ cmd =3D ("cyclictest",
>         "-d", str(interval_delta),
>         "-l", str(loop_count)
>         )
> -rex =3D re.compile("C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)=
")
> +rex =3D re.compile(b"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+=
)")
> =20
>  def run_cyclictest_once():
>          res =3D subprocess.check_output(cmd)
> @@ -283,7 +283,7 @@ def run_cyclictest_once():
>          avg_sum =3D 0
>          avg_cnt =3D 0
> =20
> -        for line in res.split("\n"):
> +        for line in res.splitlines():
>                  m =3D rex.search(line)
>                  if m is not None:
>                          minlist.append(int(m.group(2)))
> @@ -376,11 +376,11 @@ class cyclictest_runner:
>                          log()
>                          log("PASS")
> =20
> -                        print
> -                        print tc_name(name), "[Min/us,Avg/us,Max/us]:",
> -                        print "%d,%.1f,%d" % (bm_min,bm_avg, bm_max)
> -                        print "PASS:", tc_name(name)
> -                        print
> +                        print()
> +                        print(tc_name(name), "[Min/us,Avg/us,Max/us]:",)
> +                        print("%d,%.1f,%d" % (bm_min,bm_avg, bm_max))
> +                        print("PASS:", tc_name(name))
> +                        print()
> =20
>                  except Exception:
>                          log()
> @@ -391,9 +391,9 @@ class cyclictest_runner:
>                          log("WD: ", os.getcwd())
>                          log()
>                          log("FAIL")
> -                        print
> -                        print "FAIL:", tc_name(name)
> -                        print
> +                        print()
> +                        print("FAIL:", tc_name(name))
> +                        print()
> =20
>  #-----------------------------------------------------------------------=
--------
> =20
> diff --git a/meta/recipes-rt/rt-tests/files/run-ptest b/meta/recipes-rt/r=
t-tests/files/run-ptest
> index 8e6d3e3..b7c5e29 100644
> --- a/meta/recipes-rt/rt-tests/files/run-ptest
> +++ b/meta/recipes-rt/rt-tests/files/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
> =20
> -python ./rt_bmark.py
> +python3 ./rt_bmark.py
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb b/meta/recipes-rt/r=
t-tests/rt-tests_2.0.bb
> index 21780d1..83869b8 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
> +++ b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
> @@ -28,6 +28,6 @@ do_install_ptest() {
>          cp ${WORKDIR}/rt_bmark.py ${D}${PTEST_PATH}
>  }
> =20
> -RDEPENDS_${PN}-ptest +=3D " stress python python-subprocess python-multi=
processing python-datetime python-re python-lang"
> +RDEPENDS_${PN}-ptest +=3D " stress python3 python3-subprocess python3-mu=
ltiprocessing python3-datetime python3-re python3-lang python3-misc"
> =20
>  FILES_${PN} +=3D "${prefix}/src/backfire"
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5edxmydzzt2rtb2a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleUsHkACgkQN1Ujt2V2gByjAQCeIhCfGgiddmoMH1VLr9YvyYmL
XpsAnjTLYhA7lVlsWLl+BJ/QqeJpXEB/
=hgmt
-----END PGP SIGNATURE-----

--5edxmydzzt2rtb2a--
