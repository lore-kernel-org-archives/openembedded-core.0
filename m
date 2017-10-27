Return-Path: <shubhabrata.sen@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6D4E1782A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 11:08:40 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id n61so7890761qte.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=FPHZi4X+ikpNZsGlCQUPpMoGuqLbYaabxIrEb3mkdgI=;
	b=cPWKNvyef0zUA1IRwSFFEk2aTiH9JpF+d12nhUUCvRi5hkBq0h2Zz6Wv0DLIoxdNM+
	Si0C1CVWgN5ZharOGqB41cVM8GcCqAcf7E67LZNTsoD1t7uYmBlm9uPUYfk9CdlNuIhO
	ibokcbv/UHWVTvhHDF5yQv7rrEVvWSQ+MpRmyRvoAm+DeKKCnxHGyOcxV2tzRF3gIHmg
	trkFVELnZrjfu7g2p90SgTk4w0bGRPEDiAKTXtmHsISud7wYGumVqQr+laiwTJ2KHz7t
	cpDgH9p1Vjs60Ew6qq0Dgy4u6t9DcxVku6UHOSwzEkDmwrQgeX2VShAjDRp2qPgZsrLJ
	0RRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=FPHZi4X+ikpNZsGlCQUPpMoGuqLbYaabxIrEb3mkdgI=;
	b=QzYk0V3XUgyP7mqR8rXcouXZ/IHHvowARB0eQ6lQyPZqfHtqveOvDL8md06M6sOEnF
	73AuhUX0XagV8krNAcpjvq+xtTs9dJcyTaSyVs5rL6E3JALuhcTB1EUmuDIdK/mTBGYm
	BHmzD6FF6YpNmdLoBLKh3Pkn5tfz8iHgPWO40lZMXDMBrlfMK69nSTXOXoMVlPToNe4J
	hCDyTyelbodzdzCLxOevAieSH0f8ne1ToquCKCO21b+yHp4BQlfvET+qwcHeeGdwcdEo
	Gwf2QXNnSw8Zwq44UxlZx5UpWb2zuAcQOojf7SiAvsAhT0tv+WqPqZrpbaaUeM6/HOmK
	rNWQ==
X-Gm-Message-State: AMCzsaUnmbldEq1JmDXVbE2ts2pkFLqfTMqmSruwO/61KTZXrBs6Ciny
	Gtp2hkaxRmCeJyq6ik52NqC40SUg3kJOa8Ip0yfEWw==
X-Google-Smtp-Source: ABhQp+QuTrN2suT8RwyPLykNe5oDnatKG4r4PRE7q8QRdk1QRPNUGHjrealLXeZtTc2w73Az1xBJe8BvyXOnhEUb1kM=
X-Received: by 10.237.32.101 with SMTP id 92mr195763qta.44.1509102521178; Fri,
	27 Oct 2017 04:08:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.35.52 with HTTP; Fri, 27 Oct 2017 04:08:40 -0700 (PDT)
From: shubhabrata sen <shubhabrata.sen@gmail.com>
Date: Fri, 27 Oct 2017 13:08:40 +0200
Message-ID: <CA+jxWbeh3Ug=P87QTfqbmC62iiJwkox1VzsQqvVtLmgrjrvwnQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Python consistency error during apparmor build
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
X-List-Received-Date: Fri, 27 Oct 2017 11:08:40 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c97d8b45e58055c854f92"

--94eb2c0c97d8b45e58055c854f92
Content-Type: text/plain; charset="UTF-8"

I get this error while building firmware with the apparmor recipe

checking python extra libraries...  -lpthread -ldl  -lutil
| checking python extra linking flags... -Xlinker -export-dynamic
| checking consistency of all components of python development
environment... no
| configure: error:
|   Could not link test program to Python. Maybe the main Python library
has been
|   installed in some non-standard library path. If so, pass it to
configure,
|   via the LDFLAGS environment variable.
|   Example: ./configure LDFLAGS="-L/usr/non-standard-path/python/lib"
|
 ============================================================================
|    ERROR!
|    You probably have to install the development version of the Python
package
|    for your distribution.  The exact name of this package varies among
them.
|
 ============================================================================

I researched a bit about the error and tried to set the libraries using the
LDFLAGS variable but I'm unable to resolve it. Do I need to install any
additional python-package before the apparmor build ?

--94eb2c0c97d8b45e58055c854f92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I get this error while building firmware with the apparmor=
 recipe=C2=A0<div><br></div><div><div>checking python extra libraries...=C2=
=A0 -lpthread -ldl=C2=A0 -lutil</div><div>| checking python extra linking f=
lags... -Xlinker -export-dynamic</div><div>| checking consistency of all co=
mponents of python development environment... no</div><div>| configure: err=
or:</div><div>|=C2=A0 =C2=A0Could not link test program to Python. Maybe th=
e main Python library has been</div><div>|=C2=A0 =C2=A0installed in some no=
n-standard library path. If so, pass it to configure,</div><div>|=C2=A0 =C2=
=A0via the LDFLAGS environment variable.</div><div>|=C2=A0 =C2=A0Example: .=
/configure LDFLAGS=3D&quot;-L/usr/non-standard-path/python/lib&quot;</div><=
div>|=C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</div><div>|=C2=A0 =C2=A0 ERROR!</div><div>|=C2=A0 =C2=
=A0 You probably have to install the development version of the Python pack=
age</div><div>|=C2=A0 =C2=A0 for your distribution.=C2=A0 The exact name of=
 this package varies among them.</div><div>|=C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div></div><di=
v><br></div><div>I researched a bit about the error and tried to set the li=
braries using the LDFLAGS variable but I&#39;m unable to resolve it. Do I n=
eed to install any additional python-package before the apparmor build ?</d=
iv></div>

--94eb2c0c97d8b45e58055c854f92--
