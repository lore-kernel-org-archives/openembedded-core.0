Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 76377771EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 19:26:27 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id vy10so1387212pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 12:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=0+UFVso034//tZW61LRYZh4gbHddDNaVR4mtD97ECEw=;
	b=B2qyLEuG2n1w+6frXmmiBSlpuzVdNKQb2Koz/Iacequ8eVHsOFqywmXHvOzC004HQT
	lcEFOJVL4VTv4RyFOqDZs0c4+OJxu/Qm67kMjPdJcg7zQ5K3Y24y6dR0EKrhWxNS9VG7
	bLr1tNezVayhvaICtUqyaHisIsEYYIi/u1bX4JAVDGES1VQsboqG60yVUJ5cyUt38dL7
	PdEv3yx+kLkb/xMoxoMH2zSigcJAJhTaCXfKWIt5UsAvbUgbOzNzEkqNF4n9sbeE/5Z7
	Luj35ybnIoUudcM+xhzYQEVjC/TnbH2JquAwQpd9WlNvhMxgSDzZ0t+2IJHzEcrceowK
	okFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=0+UFVso034//tZW61LRYZh4gbHddDNaVR4mtD97ECEw=;
	b=bWxhCGmcx65/EoBxSiy9VcVwZMkpVSRlmTg3ZIHkE+u1VVRkY42lnCtSUbOuHFw2LS
	d5e+ThrnkGIScs4W3DeGv3ga/qxTm74IsCGStZpUbETs+s6CUYu8Ey3m2Ig++umLYjto
	yCCdOT+M8FQrR1GfGHRv+JilE03Ax4vNkgZwSBOX3S13fDfCkMPH9jeuGjD9UtmqI0nG
	ljavnqTu+g4VOv0n6ertKeZ2CjxEtuUtruHhFuc6/Yrrbxza/fLpp/cZ1tBiuKb97fHv
	Deg2AI0n+3OKYyT4+79l/QZmpIdabO7Cr2mImTbAaggXIqivcr8KajIDW4sSqjb4lxCT
	zASA==
X-Gm-Message-State: AEkoouvdfTDksE5S9P80svvp8j61GLz2PDuWaoW2DH6puYv1FIbzX0ATw0zTrcw1jeSAjw==
X-Received: by 10.66.123.42 with SMTP id lx10mr173699243pab.95.1470770787513; 
	Tue, 09 Aug 2016 12:26:27 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:29dc:cb12:3198:ca66?
	([2601:646:8882:b8c:29dc:cb12:3198:ca66])
	by smtp.gmail.com with ESMTPSA id
	e72sm57889649pfb.49.2016.08.09.12.26.26
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 12:26:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <57A9C7AD.9090901@topic.nl>
Date: Tue, 9 Aug 2016 12:27:01 -0700
Message-Id: <BA7DFF44-541C-4FEE-B5B2-586FD82ABC60@gmail.com>
References: <20160801123253.9292-1-twoerner@gmail.com>
	<57A9C7AD.9090901@topic.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Tue, 09 Aug 2016 19:26:28 -0000
X-Groupsio-MsgNum: 85576
Content-Type: multipart/signed;
	boundary="Apple-Mail=_358EA278-10E0-4233-A1A5-BEB5D163DEE7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_358EA278-10E0-4233-A1A5-BEB5D163DEE7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 9, 2016, at 5:08 AM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>=20
> I've been adding "lzop-native" to a lot of kernel recipes because you =
also need it when generating an LZO compressed kernel (I like my boot =
time to be under 1 second).
>=20
> It's a small dependency which is hard to automatically figure out, =
since there are a number of ways to trigger it (we just found two). I =
would welcome this patch very much, and I don't think many will =
suffer=E2=80=A6

=46rom linux.inc days there is a python snippet which can do this =
conditionally e.g. see

=
https://github.com/kraj/meta-raspberrypi/blob/master/recipes-kernel/linux/=
linux-rpi.inc#L121

>=20
>=20
> On 01-08-16 14:32, Trevor Woerner wrote:
>> If the initramfs image is type lzo, then a native lzop is needed.
>>=20
>> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
>> ---
>>  meta/classes/kernel.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/classes/kernel.bbclass =
b/meta/classes/kernel.bbclass
>> index fa76a14..db42744 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,7 +1,7 @@
>>  inherit linux-kernel-base kernel-module-split
>>=20
>>  PROVIDES +=3D "virtual/kernel"
>> -DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils =
virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
>> +DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils =
virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native =
lzop-native"
>>=20
>>  S =3D "${STAGING_KERNEL_DIR}"
>>  B =3D "${WORKDIR}/build"
>>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_358EA278-10E0-4233-A1A5-BEB5D163DEE7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleqLooACgkQuwUzVZGdMxTabQCfWwOxAQCwyf3oQiF9hpj6qYme
hb4An1+z2LNdzBuEOj+XqK8+WqysCNc5
=Vi14
-----END PGP SIGNATURE-----

--Apple-Mail=_358EA278-10E0-4233-A1A5-BEB5D163DEE7--
