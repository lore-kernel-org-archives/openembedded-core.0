Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tvovb-0002qr-Q9
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 13:50:44 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so736167pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 04:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=oXix+/Ql5hJb9vKGZr3KKZjXyxUeBJLAPzL2ziY9IxU=;
	b=ZF9PJyFNan5MsdSd+IqnaRVMX3Zluy391BCkRjgXKHIPuSyBbiry7ouCWviGhzofJD
	v+1Zow3ELckcA9mcmpki7AdzWfmw971bQXKRVM25KNDc8d4t9oT0XR+znRwravx/3OEL
	EtUIxi4+jJMnddLYQ3gRehj9n85Z+njsTCqJx8ZxZHK5mBK72kX50NzSrt0qlPT3h9j8
	2N8nXW8+mZru7RtFW6gtzkFLDbzfBYCvV8zNBLvkOGwp/H6aqOt6lPTy659kIsMuvXDQ
	kXOPS2jQ5Hl9vtm5LB3du7fSS+VW3exWUXaT1wbjxeadjPVCdoxGRA+mKDxZCYOYOg0N
	R0/w==
X-Received: by 10.66.73.167 with SMTP id m7mr13144940pav.68.1358426119963;
	Thu, 17 Jan 2013 04:35:19 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hs2sm1018088pbc.22.2013.01.17.04.35.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 04:35:18 -0800 (PST)
Date: Thu, 17 Jan 2013 13:35:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130117123513.GD3067@jama>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
	<6b20de5260fdf8542bd214ca4c380bfe7614f56c.1358406049.git.hongxu.jia@windriver.com>
	<20130117092811.GB3067@jama> <50F7D6E1.4000800@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50F7D6E1.4000800@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libnss-mdns:fix support prerm at image creation time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 12:50:44 -0000
X-Groupsio-MsgNum: 33952
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline

--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 06:48:01PM +0800, Hongxu Jia wrote:
> On 01/17/2013 05:28 PM, Martin Jansa wrote:
> > On Thu, Jan 17, 2013 at 03:07:21PM +0800, Hongxu Jia wrote:
> >> The pkg_prerm_${PN} failed at image creation time because $D is not as=
signed
> >> as the prefix of "/etc/nsswitch.conf"
> > Again looks the same why not use $D/etc/nsswitch.conf in both cases?
> I think that  test $D to explicitly make a distinction between the build=
=20
> time
> and run time, it's better for others to notice the difference.

But there isn't any difference if I'm looking correctly.

Cheers,

> Thanks,
> Hongxu
> >> [YOCTO #3633]
> >>
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> ---
> >>   meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb |   11 +++=
++++++--
> >>   1 file changed, 9 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb=
 b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> >> index f7356e4..e9a4128 100644
> >> --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> >> +++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> >> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa3=
495befef8f17206a5b0a1"
> >>  =20
> >>   DEPENDS =3D "avahi"
> >>   RDEPENDS_${PN} =3D "avahi-daemon"
> >> -PR =3D "r6"
> >> +PR =3D "r7"
> >>  =20
> >>   SRC_URI =3D "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-$=
{PV}.tar.gz"
> >>  =20
> >> @@ -30,7 +30,14 @@ pkg_postinst_${PN} () {
> >>   }
> >>  =20
> >>   pkg_prerm_${PN} () {
> >> +if [ "$D" !=3D "" ]; then
> >>   	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
> >>   		-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=3Dreturn\]//' \
> >> -		-i /etc/nsswitch.conf
> >> +		-i $D/etc/nsswitch.conf
> >> +	exit 0
> >> +fi
> >> +
> >> +sed -e '/^hosts:/s/\s*\<mdns4\>//' \
> >> +	-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=3Dreturn\]//' \
> >> +	-i /etc/nsswitch.conf
> >>   }
> >> --=20
> >> 1.7.10.4
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD38AEACgkQN1Ujt2V2gByAMwCfU9OnoaZzCir/GlwZMyk6yuE+
HgEAn1fhSibCvWdVGguq76MztYc3hVov
=3CoD
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
