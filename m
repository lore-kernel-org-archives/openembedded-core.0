Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.32725.1589759667211324534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 16:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g/0LM4dU;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id b190so4099199pfg.6
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 16:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=9BU72afbup3tLPEqhuXNp1OxjQqf3BjQsiY0mrUzrro=;
        b=g/0LM4dU0yVtC07bsCdMvM7hmTO1aLJEEVT9d3BI0SHvJrz4fa6+fCar0NL9dkWpJ+
         oJG7Pv8eq4yKh1Ok495ucxHa/1Iy5JXXNmtadYT64s4aqtwFsa5yKDmF6TSpXl2V8qAx
         mPDOyzrnCAtX3Ah+oLSCUBYadJS+9A5WN01GkaK40kPEaUJ1w7t1c8eVGWHc65WzHkvv
         ZJ70F7E6uYOvcSw0VWvcyMXVR3BcX8wzyzT1VylPJ6mhXAU4tGUy6CUJcSUcO7T403JI
         ULCkTwSWVyi2BlSLWTsLwHnh+NAn/2SV0vStdtu22INULY1Oy+cBx7wFJ2jPE4mQSKog
         309Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=9BU72afbup3tLPEqhuXNp1OxjQqf3BjQsiY0mrUzrro=;
        b=PRwh5DOGViSAVoKNqnaN1e3zSGlaJPr4fV1eR43cReg5Q8QvnJpPY9gAG9sd85XcBd
         MIUnGtGdWm0x7DICMizMPqP/2MIalpoYdnNJ1xks8JX0Loh4ccaJlfEfxDBisPrB436k
         SeqBLn9Cxk0QohqixL1n/wLHf1hBij3aBvcEmz5tXhowO2tp+ZwJuzJQulLMX0TDfbJE
         gOWhPmd7g12Gvi5NWOagLlH0rDU+bKLhKj9udjuY2qbVkBxzeYjhrMnKZhXY154/uZL7
         s2jVdMywW43UDLr6Id/6++1f/MAReNzuXJCESeY9xHslzpB+dPgnoF9F/V/6RN/GWEM1
         J2bQ==
X-Gm-Message-State: AOAM532lQ99zg7orjeuqpIfbjkmpoReN2L6dUX1Q+bmXsWQik6TAT/TC
	KY3dWFMqgtbL2P3cD9Z6j9dx8JSAv1A=
X-Google-Smtp-Source: ABdhPJwnCz6uq72fzHvIIz2W3mHhJ0Ol4Z9f7atB12r0L2EObTI6zVTvN83E6xtMoczyF//GBn9ZrA==
X-Received: by 2002:a63:f64d:: with SMTP id u13mr12441494pgj.151.1589759666248;
        Sun, 17 May 2020 16:54:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2264? ([2601:646:9200:4e0::2264])
        by smtp.gmail.com with ESMTPSA id h14sm6781632pjc.46.2020.05.17.16.54.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2020 16:54:25 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: openembedded-core@lists.openembedded.org
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <8a37d1b4b7784a48ac57074af3eca982@XBOX03.axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <01f08d40-baf2-ee11-5bae-ff63896866d0@gmail.com>
Date: Sun, 17 May 2020 16:54:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8a37d1b4b7784a48ac57074af3eca982@XBOX03.axis.com>
X-Groupsio-MsgNum: 138391
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="CqNOI9qkYCYFXwr0TaDJjsrfhDvHcefUo"

--CqNOI9qkYCYFXwr0TaDJjsrfhDvHcefUo
Content-Type: multipart/mixed; boundary="IrUSfUamZW54cB3Oec0MkskLjVMz48qoj";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <01f08d40-baf2-ee11-5bae-ff63896866d0@gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <8a37d1b4b7784a48ac57074af3eca982@XBOX03.axis.com>
In-Reply-To: <8a37d1b4b7784a48ac57074af3eca982@XBOX03.axis.com>

--IrUSfUamZW54cB3Oec0MkskLjVMz48qoj
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/11/20 11:53 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Rahul Kumar
>> Sent: den 23 april 2020 20:40
>> To: openembedded-core@lists.openembedded.org
>> Cc: Rahul Kumar <rahulk@mvista.com>
>> Subject: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
>>
>> Source: git://sourceware.org/git/bzip2-tests.git
>> Type: Enhancement
>> Description:
>> bzip2 now has a test suite available at git://sourceware.org/git/bzip2=
-
>> tests.git.
>>
>> This is a collection of "interesting" .bz2 files that can be used to
>> test bzip2 works correctly. They come from different projects.
>>
>> Some files are deliberately bad, and are use to see how bzip2 handles
>> corrupt files. They are explicitly not intended to decompress correctl=
y,
>> but to catch errors in bzip2 trying to deal with deliberately bad data=
=2E
>> All such files have a name ending in .bz2.bad.
>>
>> All non-bad files end in bz2. And should come with a .md5 file for
>> the original input file. The .md5 file is used to check that bzip2
>> could correctly decompress the file. The original (non-compressed)
>> files are deliberately not checked in.
>>
>> It will by default test with the command 'bzip2', running under
>> valgrind (if installed on the system).
>>
>> For each .bz2 file found it is decompressed, recompressed and
>> decompressed again. Once with the default bzip2 settings and
>> once in --small (-s) mode.
>>
>> For each .bz2.bad file decompression is tried twice also. In
>> default mode and small mode. The bzip2 binary is expected to
>> return either 1 or 2 as exit status. Any other exit code is
>> interpreted as failure.
>>
>> License:
>>    In bzip2-tests source code Each directory should contain a README
>>    file explaining where the .bz2 files originally came from.
>>    Plus a reference to the (Free Software) license that the project
>>    files were distributed under.
>>
>>    Adding GPLv3+ License to the bzip2 recipe. Since we modify the
>>    bzip2-tests.git/run-tests.sh script and we can redistribute it and/=
or
>>    modify it under the terms of the GNU General Public License (GPL);
>>    either version 3, or (at your option) any later version.
>>
>>    since all other files and directories are unchanged and We are simp=
ly
>>    using the compressed files as data so we are ignoring the license i=
nfo for
>>    these files and directories in bzip2-tests.git
>=20
> This is not how licenses work. They typically relate to distribution.=20
> I.e., it is the act of distributing the code that is covered in the=20
> license. It does not matter if what is distributed is later used as=20
> source or as a binary blob, it is still being distributed.
>=20
> Since the code that is covered by, e.g., GPL-3.0 is only distributed in=
=20
> the ptest package, you will have to set individual package licenses. I.=
e.,=20
> LICENSE should contain all licenses used by any package. Then for each =

> package that should have a different license, you need to define it=20
> explicitly. E.g.:
>=20
> LICENSE_${PN} =3D "bzip2-1.0.6"
> LICENSE_${PN}-dev =3D "bzip2-1.0.6"
> LICENSE_${PN}-dbg =3D "bzip2-1.0.6"
> LICENSE_${PN}-doc =3D "bzip2-1.0.6"
> LICENSE_${PN}-src =3D "bzip2-1.0.6"
> LICENSE_libbz2 =3D "bzip2-1.0.6"
>=20
> The above assumes that what is covered by the GPL-3.0 license only ends=
=20
> up in ${PN}-ptest. If any of it ends up in any of the other packages=20
> above, then obviously they need to be removed from the list too.

right, as such this patch will mean bzip2 has to be skipped for distros
which have no GPL3 policy. Its better to have per-package licenses
expressed here.


--IrUSfUamZW54cB3Oec0MkskLjVMz48qoj--

--CqNOI9qkYCYFXwr0TaDJjsrfhDvHcefUo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXsHOqgAKCRC7BTNVkZ0z
FCT6AJ9CGQJx57twwz1z5doSQwhVvHtP6wCfbjpFgOqvZDCtBBYcBdnEerBxkn0=
=tdab
-----END PGP SIGNATURE-----

--CqNOI9qkYCYFXwr0TaDJjsrfhDvHcefUo--
