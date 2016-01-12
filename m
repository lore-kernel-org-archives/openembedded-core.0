Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id B52456FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:23:23 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id ho8so69402307pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 17:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Tg6QH0LeYmdp1bt3QnS7jydL6CQQy2F50GAilazkdZg=;
	b=VQ/kwiS1Gz2fYUsPD8MLKZd219vl5Nn9NnlafRboN6WV2Rt8GGsz+d9tZvEdt6w9ax
	iP3K2q7TzyAyQg56fYmJsEG7TeKCmakyMCtUx1hExD2RvIRl9AVhi0ZtxZBbHnOzYrjV
	yTwxFVFiYNSX/oN2FZGimqiODar/Tv7HM7f0zvb+dPp6gHPH0aIk/XwykrlSMKy8b3vm
	Sev5NJ7mKXi6xJjzL27SGgtz8XmGO5B7OZAcGGr2+36avuebdkCQwdORnJvUAXJCM8Lq
	NFWgwLNjoe8lDdv6c0+wUcoMwjrzIFOsD4lbpACWF8tfeYhJkgDnEKa50yFL4mhEM09j
	eM4w==
X-Received: by 10.66.232.170 with SMTP id tp10mr185650341pac.38.1452561804368; 
	Mon, 11 Jan 2016 17:23:24 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	g26sm25897794pfg.35.2016.01.11.17.23.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 17:23:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5694545C.1050802@windriver.com>
Date: Mon, 11 Jan 2016 17:23:22 -0800
Message-Id: <3FA0B274-B9B5-488B-A0E5-82AC5B9CAEB3@gmail.com>
References: <cover.1452491844.git.Qi.Chen@windriver.com>
	<2523177d0da5233c60da6a6aa99f74631a9277b7.1452491844.git.Qi.Chen@windriver.com>
	<79D0CE6B-7A5E-4D08-BA90-06C6155E25D0@gmail.com>
	<5694545C.1050802@windriver.com>
To: ChenQi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] curl: upgrade to 7.46
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
X-List-Received-Date: Tue, 12 Jan 2016 01:23:23 -0000
X-Groupsio-MsgNum: 75895
Content-Type: multipart/signed;
	boundary="Apple-Mail=_60A270F2-1D9D-44F7-BB0B-3BC6FCB281DD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_60A270F2-1D9D-44F7-BB0B-3BC6FCB281DD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 11, 2016, at 5:18 PM, ChenQi <Qi.Chen@windriver.com> wrote:
>=20
> On 01/12/2016 02:20 AM, Khem Raj wrote:
>>> On Jan 10, 2016, at 9:58 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>>>=20
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>> meta/recipes-support/curl/{curl_7.45.0.bb =3D> curl_7.46.0.bb} | 6 =
++++--
>>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>> rename meta/recipes-support/curl/{curl_7.45.0.bb =3D> =
curl_7.46.0.bb} (92%)
>>>=20
>>> diff --git a/meta/recipes-support/curl/curl_7.45.0.bb =
b/meta/recipes-support/curl/curl_7.46.0.bb
>>> similarity index 92%
>>> rename from meta/recipes-support/curl/curl_7.45.0.bb
>>> rename to meta/recipes-support/curl/curl_7.46.0.bb
>>> index a7ed778..8b109ba 100644
>>> --- a/meta/recipes-support/curl/curl_7.45.0.bb
>>> +++ b/meta/recipes-support/curl/curl_7.46.0.bb
>>> @@ -14,8 +14,8 @@ SRC_URI =3D =
"http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>>> #
>>> SRC_URI +=3D " file://configure_ac.patch"
>>>=20
>>> -SRC_URI[md5sum] =3D "62c1a352b28558f25ba6209214beadc8"
>>> -SRC_URI[sha256sum] =3D =
"65154e66b9f8a442b57c436904639507b4ac37ec13d6f8a48248f1b4012b98ea"
>>> +SRC_URI[md5sum] =3D "9979f989a2a9930d10f1b3deeabc2148"
>>> +SRC_URI[sha256sum] =3D =
"b7d726cdd8ed4b6db0fa1b474a3c59ebbbe4dcd4c61ac5e7ade0e0270d3195ad"
>>>=20
>>> inherit autotools pkgconfig binconfig multilib_header
>>>=20
>>> @@ -55,4 +55,6 @@ PACKAGES =3D+ "lib${BPN}"
>>> FILES_lib${BPN} =3D "${libdir}/lib*.so.*"
>>> RRECOMMENDS_lib${BPN} +=3D "ca-certificates"
>>>=20
>>> +FILES_${PN}-dev +=3D "${datadir}/zsh=E2=80=9D
>> what files are in ${datadir}/zsh ?
>=20
> Hi Khem,
>=20
> There's only one file in this directory. See below.
>=20
> chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ cat =
tmp/work/armv5e-poky-linux-gnueabi/curl/7.46.0-r0/packages-split/curl-dev/=
usr/share/zsh/site-functions/_curl
> #compdef curl
>=20
> # curl zsh completion
>=20
> local curcontext=3D"$curcontext" state state_descr line
> typeset -A opt_args
>=20
> local rc=3D1
>=20
> _arguments -C -S \
>=20
>  '*:URL:_urls' && rc=3D0
>=20
> return rc

this is a tab completion file. Please move it to PN

>=20
> Best Regards,
> Chen Qi
>=20
>>> +
>>> BBCLASSEXTEND =3D "native nativesdk"
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_60A270F2-1D9D-44F7-BB0B-3BC6FCB281DD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUVYoACgkQuwUzVZGdMxS7EwCfTorPrUvUK+Iz4SVnJHOLMJqF
ByUAni0nuzpges1V79tB5euSjCRmfk+Q
=zav0
-----END PGP SIGNATURE-----

--Apple-Mail=_60A270F2-1D9D-44F7-BB0B-3BC6FCB281DD--
