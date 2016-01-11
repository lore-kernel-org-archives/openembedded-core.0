Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id DA1826072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 21:06:08 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id ho8so66200608pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 13:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=w3zlNGp9adgY3xH8c1e4L5XFVxM4VO6W6ssiele04PY=;
	b=LmuFcA5lHkGLZf/ua/SH7FHJHcgl9o+Pd7nddoOB8ZiDWtAWhaddu4pNz+lWnLY1X3
	uvXMciK53BI25o5QCQpEyyJJ9Fkig5PfCjS0ySYx4KzArFjEzHEjJ+UTioUwoHJP/VV0
	N/FAZT11D0Q/XzkJ0la5TKf0OVUPn8AqKTUpU4czxedPeK7TXWKZ365vaZ5h74hW5p2o
	ZpEWqwXUe66pwzOgk8sdx+Zde12zutW3eVahiC370HrsykMmyqC9C37kXi8px3EV1x+I
	TJ3t+za2Fg/2GTN2YpfDG2QNlfQpQWzywRMoHRrtzBNvIrkbewdf5ZAa6LJwFFuAhnuj
	jmKA==
X-Received: by 10.66.55.66 with SMTP id q2mr117248949pap.120.1452546369344;
	Mon, 11 Jan 2016 13:06:09 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	r26sm16883719pfb.21.2016.01.11.13.06.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 13:06:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZrgzjXXWTzyRDU9=FquvUW16ynw1W26hj-MVVRnqZDEQ@mail.gmail.com>
Date: Mon, 11 Jan 2016 13:06:04 -0800
Message-Id: <ED4C8094-915C-44FE-A428-674853C174E2@gmail.com>
References: <1450352712-31476-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1451986361-10021-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1451986361-10021-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<CAJTo0LZrgzjXXWTzyRDU9=FquvUW16ynw1W26hj-MVVRnqZDEQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] boost: update to 1.60.0
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
X-List-Received-Date: Mon, 11 Jan 2016 21:06:09 -0000
X-Groupsio-MsgNum: 75874
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B4578CCD-2BFE-431A-A775-A2A7CB55B794";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B4578CCD-2BFE-431A-A775-A2A7CB55B794
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_35C3B617-3D14-48C3-8EED-280060AA07F9"

--Apple-Mail=_35C3B617-3D14-48C3-8EED-280060AA07F9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Ross

> On Jan 5, 2016, at 9:31 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> On 5 January 2016 at 09:32, Lukas Bulwahn =
<lukas.bulwahn@oss.bmw-carit.de <mailto:lukas.bulwahn@oss.bmw-carit.de>> =
wrote:
> Due to the version update to 1.59.0, the two patches previously
> backported in this recipe are now dropped. The actual status of
> the arm-intrinsics.patch (reported with Upstream-Status: Backport)
> is unknown to the committer, and hence, that patch is kept in the
> recipe, even if it is possibly not required anymore. A deeper
> analysis is required to determine need and status of that patch.
> Furthermore, boost 1.59.0 provides a new library, called timer,
> which is packaged as further library in the boost recipe. The
> update to boost 1.60.0 required no further changes beyond
> changing the checksum hashes.
>=20
> This is breaking on mpc8315e-rdb (the reference PPC in =
meta-yocto-bsp):
>=20
> | gcc.compile.c++ =
bin.v2/libs/test/build/aca09349fdb84d131321425f6c3a38ed/execution_monitor.=
o
> | In file included from =
/data/poky-master/tmp/sysroots/mpc8315e-rdb/usr/include/fenv.h:114:0,
> |                  from =
/data/poky-master/tmp/sysroots/mpc8315e-rdb/usr/include/c++/5.3.0/fenv.h:3=
6,
> |                  from ./boost/detail/fenv.hpp:97,
> |                  from ./boost/test/execution_monitor.hpp:64,
> |                  from ./boost/test/impl/execution_monitor.ipp:31,
> |                  from libs/test/src/execution_monitor.cpp:16:
> | ./boost/test/impl/execution_monitor.ipp: In function 'unsigned int =
boost::fpe::enable(unsigned int)':
> | ./boost/test/impl/execution_monitor.ipp:1383:7: error: expected =
id-expression before '(' token
> |      ::feclearexcept(BOOST_FPE_ALL);
> |        ^
> | ./boost/test/impl/execution_monitor.ipp: In function 'unsigned int =
boost::fpe::disable(unsigned int)':
> | ./boost/test/impl/execution_monitor.ipp:1420:7: error: expected =
id-expression before '(' token
> |      ::feclearexcept(BOOST_FPE_ALL);
> |        ^
>=20
> Any idea?
>=20

these source files might not be including boost=E2=80=99s own fenv.hpp =
header might be.

I wonder is SPE has issues with FPU status functions can you try to =
build a small sample using feclearexcept()
something like

#include <fenv.h>
int main()
{
  feclearexcept (FE_ALL_EXCEPT);
  return 0;
}

does it link ?



> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_35C3B617-3D14-48C3-8EED-280060AA07F9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Ross<div class=3D""><br class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Jan 5, 2016, at 9:31 AM, =
Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra">On 5 January 2016 at 09:32, Lukas =
Bulwahn <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:lukas.bulwahn@oss.bmw-carit.de" target=3D"_blank" =
class=3D"">lukas.bulwahn@oss.bmw-carit.de</a>&gt;</span> wrote:<br =
class=3D""><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":2m2" class=3D"" =
style=3D"overflow:hidden">Due to the version update to 1.59.0, the two =
patches previously<br class=3D"">
backported in this recipe are now dropped. The actual status of<br =
class=3D"">
the arm-intrinsics.patch (reported with Upstream-Status: Backport)<br =
class=3D"">
is unknown to the committer, and hence, that patch is kept in the<br =
class=3D"">
recipe, even if it is possibly not required anymore. A deeper<br =
class=3D"">
analysis is required to determine need and status of that patch.<br =
class=3D"">
Furthermore, <span class=3D"">boost</span> 1.59.0 provides a new =
library, called timer,<br class=3D"">
which is packaged as further library in the <span class=3D"">boost</span> =
recipe. The<br class=3D"">
update to <span class=3D"">boost</span> 1.60.0 required no further =
changes beyond<br class=3D"">
changing the checksum hashes.</div></blockquote></div><br class=3D"">This =
is breaking on&nbsp;mpc8315e-rdb (the reference PPC in =
meta-yocto-bsp):</div><div class=3D"gmail_extra"><br class=3D""></div><div=
 class=3D"gmail_extra"><div class=3D"gmail_extra">| gcc.compile.c++ =
bin.v2/libs/test/build/aca09349fdb84d131321425f6c3a38ed/execution_monitor.=
o</div><div class=3D"gmail_extra">| In file included from =
/data/poky-master/tmp/sysroots/mpc8315e-rdb/usr/include/fenv.h:114:0,</div=
><div class=3D"gmail_extra">| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;from =
/data/poky-master/tmp/sysroots/mpc8315e-rdb/usr/include/c++/5.3.0/fenv.h:3=
6,</div><div class=3D"gmail_extra">| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;from ./boost/detail/fenv.hpp:97,</div><div =
class=3D"gmail_extra">| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;from ./boost/test/execution_monitor.hpp:64,</div><div =
class=3D"gmail_extra">| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;from ./boost/test/impl/execution_monitor.ipp:31,</div><div =
class=3D"gmail_extra">| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;from libs/test/src/execution_monitor.cpp:16:</div><div =
class=3D"gmail_extra">| ./boost/test/impl/execution_monitor.ipp: In =
function 'unsigned int boost::fpe::enable(unsigned int)':</div><div =
class=3D"gmail_extra">| ./boost/test/impl/execution_monitor.ipp:1383:7: =
error: expected id-expression before '(' token</div><div =
class=3D"gmail_extra">| &nbsp; &nbsp; =
&nbsp;::feclearexcept(BOOST_FPE_ALL);</div><div class=3D"gmail_extra">| =
&nbsp; &nbsp; &nbsp; &nbsp;^</div><div class=3D"gmail_extra">| =
./boost/test/impl/execution_monitor.ipp: In function 'unsigned int =
boost::fpe::disable(unsigned int)':</div><div class=3D"gmail_extra">| =
./boost/test/impl/execution_monitor.ipp:1420:7: error: expected =
id-expression before '(' token</div><div class=3D"gmail_extra">| &nbsp; =
&nbsp; &nbsp;::feclearexcept(BOOST_FPE_ALL);</div><div =
class=3D"gmail_extra">| &nbsp; &nbsp; &nbsp; &nbsp;^</div><div =
class=3D"gmail_extra"><br class=3D""></div><div class=3D"gmail_extra">Any =
idea?</div><div class=3D"gmail_extra"><br =
class=3D""></div></div></div></div></blockquote><div><br =
class=3D""></div><div>these source files might not be including =
boost=E2=80=99s own&nbsp;fenv.hpp header might be.</div><div><br =
class=3D""></div><div>I wonder is SPE has issues with FPU status =
functions can you try to build a small sample using =
feclearexcept()</div><div>something like</div><div><br =
class=3D""></div><div>#include &lt;fenv.h&gt;</div><div>int =
main()</div><div><div class=3D"">{</div><div class=3D"">&nbsp; =
feclearexcept (FE_ALL_EXCEPT);</div><div class=3D"">&nbsp; return =
0;</div><div class=3D"">}</div></div><div><div class=3D""><br =
class=3D""></div><div class=3D"">does it link ?</div><div class=3D""><br =
class=3D""></div></div><div><br class=3D""></div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_extra">Ross</div></div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_35C3B617-3D14-48C3-8EED-280060AA07F9--

--Apple-Mail=_B4578CCD-2BFE-431A-A775-A2A7CB55B794
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUGT8ACgkQuwUzVZGdMxTcowCfUFLxGvAhrIoTqqz4SGDVnfaw
Sx4AnAtad061KOIvQHac1hgA8+LPsEM6
=p/1y
-----END PGP SIGNATURE-----

--Apple-Mail=_B4578CCD-2BFE-431A-A775-A2A7CB55B794--
