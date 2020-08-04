Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.2490.1596536534234802218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 03:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U4c3X+7w;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id jp10so15247611ejb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
         :to;
        bh=7tle9VpKflip/km/DjXrEFqqv+IpSruf2pL1NNcCwKY=;
        b=U4c3X+7wf1jFp9jCiAfZqUSmcImwJE8/OifBrFHfZEnBRmE7cFRCkdkEsR+Ri1eR7z
         sT13QGRXh1InJy2MrrxXSRFv5FdTBA6MQBU+tUwISajW6vVhqXiaNxwx8QDSmL4Cew0G
         JtVDtycIiH0w3w+cFmAzBfgg9oEndF9PoF4IfoaXR4Y5k5LPSzRreFzpxKreeHjdBV0s
         p+wAlUVW7knaXJDegbbMlpEjZ0Ec1pHy83KJAtNcLWmHGrCs1d14q/1dONkqBFwjwKwZ
         niI1Iw29U5kPptY3tL/BqNi4ly5alJkyWI99TIIicMoeDhG2wCAD3HPFPqn+Z0nGtdTq
         R8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :message-id:references:to;
        bh=7tle9VpKflip/km/DjXrEFqqv+IpSruf2pL1NNcCwKY=;
        b=UkLyJMJvO3t2jYIUVcfDDCrTtfd7iBxaWa93TJgIbjIJ/bZnqp5JcGzBkkJxzY+5Om
         WJYi3utFNUrTHG742nNDxZFA/qjBiliZWVmQBfYqQ02fvVIm1lh0ovDwDfRbgHEuho3q
         ZWt9arBkMvUioSzYVTyUERIKlPjMK2zAQZTCiiatUVo7Q7eKlpqWqv2m01OcwI/dXHLV
         kgR2mbeQwJX3XfXnGHln8z6+keXZTtC2t0BgUIOa5ZgBNWnqlBTt3Ay+BhvXHwhf50BV
         3/ixStmbVM2wBeDZJDu7TKNsUR1/LTNuXFTo+iMl49R6VRr5XcW05BHX2Gfp2guBtWvc
         AWZA==
X-Gm-Message-State: AOAM532pmo7/PBGn88zarIMsLncMjyZOp2lrBIS+zyiUldCGoCqgm+rk
	d6RlRx5TdeJazYljaqqmvLE=
X-Google-Smtp-Source: ABdhPJwL8YRhA7a50XEM6DlT9o/NuhLdL0rHkzQXgRChXifHYWzDxyVdTdhGCXASslvB5gWADAxOgA==
X-Received: by 2002:a17:906:17cc:: with SMTP id u12mr20281233eje.344.1596536532755;
        Tue, 04 Aug 2020 03:22:12 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p5b25b9cc.dip0.t-ipconnect.de. [91.37.185.204])
        by smtp.gmail.com with ESMTPSA id t18sm3824771ejf.38.2020.08.04.03.22.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2020 03:22:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [OE-core][PATCH v2 1/2] toolchain-scripts.bbclass: also recognize ${SDK_SYS} env setups
From: "Jens Rehsack" <rehsack@gmail.com>
In-Reply-To: <58f6f225e3e005694a481165a0258e61e3554e2e.camel@linuxfoundation.org>
Date: Tue, 4 Aug 2020 12:22:10 +0200
Cc: openembedded-core@lists.openembedded.org
Message-Id: <DB9F41F8-751B-42FF-ACC3-EE3EA94801E5@gmail.com>
References: <20200724052606.6726-1-sno@netbsd.org>
 <58f6f225e3e005694a481165a0258e61e3554e2e.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Groupsio-MsgNum: 141183
Content-Type: multipart/signed;
	boundary="Apple-Mail=_729E0802-1B54-465B-8245-27B779BC821C";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_729E0802-1B54-465B-8245-27B779BC821C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 27.07.2020 um 18:06 schrieb Richard Purdie =
<richard.purdie@linuxfoundation.org>:
>=20
> On Fri, 2020-07-24 at 07:26 +0200, Jens Rehsack wrote:
>> Instead of recognizing only environment-setup scripts in
>> ${STAGING_DIR_TARGET} or ${STAGING_DIR_NATIVE}, respectively - lurk =
also into
>> ${SDKPATH}/buildtools/sysroots/${SDK_SYS} where nativesdk-openssl =
installs
>> setup files.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta/classes/toolchain-scripts.bbclass | 5 +++++
>> 1 file changed, 5 insertions(+)
>>=20
>> diff --git a/meta/classes/toolchain-scripts.bbclass =
b/meta/classes/toolchain-scripts.bbclass
>> index db1d3215ef..e3959e21e8 100644
>> --- a/meta/classes/toolchain-scripts.bbclass
>> +++ b/meta/classes/toolchain-scripts.bbclass
>> @@ -119,6 +119,11 @@ if [ -d =
"\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
>> 	    . \$envfile
>>     done
>> fi
>> +if [ -d =
"${SDKPATH}/buildtools/sysroots/${SDK_SYS}/environment-setup.d" ]; then
>> +    for envfile in =
${SDKPATH}/buildtools/sysroots/${SDK_SYS}/environment-setup.d/*.sh; do
>> +	    . \$envfile
>> +    done
>> +fi
>> EOF
>> }
>=20
> I finally got around to looking at this, sorry about the delay. Whilst
> this fixes the issue and doesn't harm anything, I think its incorrect.
> I suspect that $OECORE_NATIVE_SYSROOT should be pointing at
> ${SDKPATH}/buildtools/sysroots/${SDK_SYS}.

This would definitively a much better solution. Actually it's created as =
follows:

```
sdkpathnative=3D${7:-${SDKPATHNATIVE}}
echo "export OECORE_NATIVE_SYSROOT=3D\"$sdkpathnative\"" >> $script
```

Which is expanded (taken from `bitbake -e`):

# $SDKPATHNATIVE
#   set =
/home/sno/gpw-community-bsp/sources/poky/meta/conf/bitbake.conf:424
#     "${SDKPATH}/sysroots/${SDK_SYS}"
SDKPATHNATIVE=3D"/opt/gpw/1.0.0/sysroots/x86_64-pokysdk-linux"

And it's updates after installing the SDK to:
export =
OECORE_NATIVE_SYSROOT=3D"/home/sno/sds-lp791a-sdk/tmp/sysroots/x86_64"

> Could you see where $OECORE_NATIVE_SYSROOT is pointing and see if we
> perhaps can't fix that instead?

Any suggestions?

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_729E0802-1B54-465B-8245-27B779BC821C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl8pNtIACgkQRJmWrtzl
Cp0TQg//e/MzRckVGxcyV5y0F1z5dHi6uMpQzYElGOVyucXDFtTkwje8Wpx+/akv
yk1mW1LPF+LfqoZSaz4P6A9Zca9IUI7AzNr3D0lijeoRz/EOSTHmX9KA0np+zeUI
XjA/zQAR3txXjOBgROjZHaQtXqW3a/fIWrA4IDX7L5Mt3ePTwdeskZMXnU8mulNy
0lLTTxh/U3b1cNC/mMHi7vz8WZhMA/+vBiY9PFF4wMP3Fq8K2/5lLtQBlqNYeBYn
PMNgmhriaVbnQ4NCdZOy8BNVuLx2Xii3jz8TxVvmEZgGs9UtqGno6fufs6qdC6dt
JkYAns6eWRxjcQqMX4J++AUuMoqZcDK9uKPdbR38LIFqE+OOMnxrWUWaVASi9vbN
23y633fveup0K2vhsfka/TRg7Gs2d/OhF9mbEhi+7u8Y37kHrnkBEQZ5uoB31Wzv
oQe3kGOQJeIkW5oL7OaPUaZtHdS0OsVpXSeUiAYl3Ha5+tlqSy2e6YBUI9LMsvTN
CJ0wcP4jvr7B89wcokUzV1eMPU2NMbmnQJP4UMK4OMIWuWY8MAl//1jqVdCdY0/N
n3EIOp7Krl2KQ95gem3kBBqNp6bCBfm1fna6kO5OyVjr5yGsK5BlEPuo11oNo/nD
qFG1jw+X8LBmEB1T6ronoIXmhxd/3MrJXtDsB/A7ePqQpjyix14=
=yeDi
-----END PGP SIGNATURE-----

--Apple-Mail=_729E0802-1B54-465B-8245-27B779BC821C--
