Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id B2FE7729F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 00:28:47 +0000 (UTC)
Received: by pddn5 with SMTP id n5so4305457pdd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 17:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=kJ7E6mDAxaNb1s1wxW37dfmi/RVctK6XXHBPHqVJStc=;
	b=hTR95LkeAVqPxdk6pfd1HbUoDuKxm4fym5v5RnN3SMatu2cIqbBEw6rTbhRH3CvJSZ
	FhFIk5W7EL8PF//wgSxyMUJ3S16jytAQJXzbMUYqJrtHnnmUnI3iu1wAHOn0nWrgmDSk
	/zTswB2Iig+F6SHJfUlm4ccbsxG/VJ/yiXVoaOSSuocFJfI2g96kKVdHk7iwxBk8PfKj
	N1E197JCyNNVMeB+kkjnxZmUuQFSFOsEaupzDtbCob2inP/oSf7obER7DyTgTS7S+kCi
	7mOKdOM7MVwJas+4RGzP2qUN3RWVV+XKkCZjs4mGkMY4/QAxDDcS+x+7w2HH/9ZmOdJp
	2QtQ==
X-Received: by 10.68.57.143 with SMTP id i15mr13777903pbq.9.1428625728486;
	Thu, 09 Apr 2015 17:28:48 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:cd19:5409:9376:61d4?
	([2601:9:3580:84c:cd19:5409:9376:61d4])
	by mx.google.com with ESMTPSA id jh2sm210921pbb.25.2015.04.09.17.28.47
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Apr 2015 17:28:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428609535-15027-3-git-send-email-dmitry_eremin@mentor.com>
Date: Thu, 9 Apr 2015 17:28:46 -0700
Message-Id: <4A2072A0-6C21-4FE5-98D6-C9EEB1FA3924@gmail.com>
References: <1428609535-15027-1-git-send-email-dmitry_eremin@mentor.com>
	<1428609535-15027-3-git-send-email-dmitry_eremin@mentor.com>
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] security_flags.inc: add more exceptions
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
X-List-Received-Date: Fri, 10 Apr 2015 00:28:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 9, 2015, at 12:58 PM, Dmitry Eremin-Solenikov =
<dmitry_eremin@mentor.com> wrote:
>=20
> Add few more exceptions from other layers as noted during custom image
> builds.
>=20

you can put it in respective layer.conf its seems a bit auxiliary to =
have it in OE-Core

> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
> ---
> meta/conf/distro/include/security_flags.inc | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
> index 21e1a53..f977c8e 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -58,8 +58,10 @@ SECURITY_CFLAGS_pn-libglu =3D =
"${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-libpcap =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-libpcre =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-libproxy =3D "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-libvirt =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-ltp =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-lttng-ust =3D "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-lvm2 =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-mesa =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-mesa-gl =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-openssl =3D "${SECURITY_NO_PIE_CFLAGS}"
> @@ -69,14 +71,18 @@ SECURITY_CFLAGS_pn-python =3D =
"${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-python-imaging =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-python-pycurl =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-python-smartpm =3D "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-rrdtool =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-tcl =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-tiff =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-valgrind =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-webkit-gtk =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-zlib =3D "${SECURITY_NO_PIE_CFLAGS}"
>=20
> -# These 2 have text relco errors with the pie options enabled
> +# These have text relco errors with the pie options enabled
> SECURITY_CFLAGS_pn-ltp =3D "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-lxc =3D "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-mozjs =3D "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-openldap =3D "${SECURITY_NO_PIE_CFLAGS}"
> SECURITY_CFLAGS_pn-pulseaudio =3D "${SECURITY_NO_PIE_CFLAGS}"
>=20
> TARGET_CFLAGS_append =3D " ${SECURITY_CFLAGS}"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


