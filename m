Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E87D6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 16:12:28 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y129so2197003pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Aug 2017 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=NrDAtvdixKUSI8Nlqir5K9qjEBS8nNBslt2988BwZhk=;
	b=aP8uO3OyKXJceQHPBBdAdvqKm1PReGRnbxOKTnqLBpD67KPqv2LMC4X5qUCBIN0lYn
	BxzLehop2KuHFV+yzZWL/2rQmZER4yPIC4moDCUXT6f15sPRADVdNmL++l0aQcZJhLDH
	Xa65Wy3bP0eNqNaCMKRTPLL0uFRHPtt0RCZcIfSTPK1vMC6ged4kiV9CvhvybdO1E0ff
	Nyye6hDwfYayT/rvHdJXdCENQshPKqtK3B2EjJ/WVa1pLnvvxWs1kv9eIWbt12nJ/TEN
	Pza/j7kEATEIgwrIcYddZFITUnHhnmg3UFY8IR4jx3W743T79Pzc+YjxwEdZpJa1jquM
	er2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=NrDAtvdixKUSI8Nlqir5K9qjEBS8nNBslt2988BwZhk=;
	b=RYmgF+anBI8e+o7++oTkFFTXy2YkE2yuboIaIQjAFLDpMyva78JSLUwkt/sgGR4iAb
	vpr1MEaPZOSW5AGmGNUuOk4sWRNxWdJc+32QU3muluD6PhuIymjs5GJw/GagSxiaeDS5
	y2oSaOEApncaqPCr0gOvJf6P3yrrWu+qzx/qM7K5i1n08gUyDMkEkFbho2zxYcFuICWJ
	jPSqiQuSbEE8DkGWjkFhg6WhWiM8VpdMuD3KGUNG0lQkJ512fYH/BBur5O9lKRTWVDP8
	Sx94Aow0BjZJT4d1St2VNm5y/f32nmDTlII2/bq99DV3peTcvwpnU6CkIehazAxkOzmP
	neHw==
X-Gm-Message-State: AIVw11062NWuWhISdiSKFu+7XAP9U/LM1Y+21FF6WvUjCIG/Ho/kADdU
	1tfyLCqIrVOh+AfKOfk=
X-Received: by 10.84.132.78 with SMTP id 72mr3326782ple.66.1501863149317;
	Fri, 04 Aug 2017 09:12:29 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:3d12:bcdd:cd39:49d7])
	by smtp.gmail.com with ESMTPSA id
	206sm3511049pfc.61.2017.08.04.09.12.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Aug 2017 09:12:28 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170804094421.13226-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4f118163-c586-1772-f8e3-85652a0a1b69@gmail.com>
Date: Fri, 4 Aug 2017 09:12:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:55.0)
	Gecko/20100101 Thunderbird/55.0
MIME-Version: 1.0
In-Reply-To: <20170804094421.13226-1-ross.burton@intel.com>
Subject: Re: [PATCH] checkpkg_exceptions: add LLVM
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
X-List-Received-Date: Fri, 04 Aug 2017 16:12:28 -0000
X-Groupsio-MsgNum: 101069
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="MxDM5FlQmReClfqIlDQnItePNHiDOGL6q"

--MxDM5FlQmReClfqIlDQnItePNHiDOGL6q
Content-Type: multipart/mixed; boundary="B2CsFwBR76Fx5WK6E33M5JJBBX3hoSKll";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <4f118163-c586-1772-f8e3-85652a0a1b69@gmail.com>
Subject: Re: [OE-core] [PATCH] checkpkg_exceptions: add LLVM
References: <20170804094421.13226-1-ross.burton@intel.com>
In-Reply-To: <20170804094421.13226-1-ross.burton@intel.com>

--B2CsFwBR76Fx5WK6E33M5JJBBX3hoSKll
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/4/17 2:44 AM, Ross Burton wrote:
> The git mirror of LLVM doesn't have any tags we can track for release
> announcements, so exclude llvm from the checkpkg test.

we will switch to tarball based release once 5.0 is out.

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-selftest/files/distrodata/checkpkg_exceptions | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-selftest/files/distrodata/checkpkg_exceptions b/meta-=
selftest/files/distrodata/checkpkg_exceptions
> index ff54cf0baed..d87a80de7a7 100644
> --- a/meta-selftest/files/distrodata/checkpkg_exceptions
> +++ b/meta-selftest/files/distrodata/checkpkg_exceptions
> @@ -8,6 +8,7 @@ gst-player
>  kmscube
>  libxcalibrate
>  linux-firmware
> +llvm
>  lsb
>  mmc-utils
>  ovmf
>=20


--B2CsFwBR76Fx5WK6E33M5JJBBX3hoSKll--

--MxDM5FlQmReClfqIlDQnItePNHiDOGL6q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlmEnOoACgkQuwUzVZGdMxTN1QCff2elj/P7nmBMpwhVvIv48NxY
BAoAnj8e8PTi7LRQtMQGwGRU8WCDwQKI
=nMEl
-----END PGP SIGNATURE-----

--MxDM5FlQmReClfqIlDQnItePNHiDOGL6q--
