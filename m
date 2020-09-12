Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.12312.1599887043796959605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 22:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D44favU/;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id f2so5879791pgd.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 22:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=sTyLa4niD8wOb7u3WTYJmm4F08TZ3nafX34MK7DV6kM=;
        b=D44favU/S8YZ6kGjiDL1PXzpcR8Ydkc/4A9zZRlCYgAqG0Gn0noopnxa6wA+QM81+B
         /ZL61DCJ1IlexEx8AmY+65owMVb3knl0njLROsoVm5truO/cYy+ULCiNaU68SXWaKioW
         EDAwUVLv6Halv4dnJdf8aqhhqiXcb+AVd7HsAROSU/E4QP4MHjgwBXhKURpaZjQurZPJ
         LtyNWRWiqS9hN4+ZITDEBeoedczCvW1qkyAqmScvnaSnFXmKWMAzU8vVS9pECvLavPhI
         5x2KM4c1EzawUyPVHKdm7EVT5yWu6bg/hRP1NTWYKlJSfOzm2eBw4FD3aIW5bjHvUv+a
         3vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=sTyLa4niD8wOb7u3WTYJmm4F08TZ3nafX34MK7DV6kM=;
        b=oQxWRkLNEFmkOgDvY3yTkAvNQksOEiV9yxsGP/PhO14ynK2Cf6qVEzH0aVxGyIb5jc
         1rOtOY9ZCBf3D7LI2GaXitWjNxfjiSQWbvTGHb9Rr53rOTo8pxi/74BS1NgsPSoXnkqz
         W9iqawSirPy1InDYwUX5vVlJfkno/n6lvcXr5+e7xjbgt5Tgi/sH/dGMjxpafCLs0ah9
         NkwaiU6m3ymHp2AHYcviMzU7hE/ZepbRq6pJY5ZwxF5BzHQ2bZB9aoqZPy0uRJXPK5d5
         cDRp3z7E5KWx13Jqs/W+/Av9/sQYvoCvGO8HhhHFAouU1M9Ip8kL/wWhvB3YNPgYOhGh
         BzeQ==
X-Gm-Message-State: AOAM532lNNIj2aUe7FUOeKLO5OSULSViveBlKm/Pde/0QJaCKShXzlQm
	xWWrv6Pj1o2ahbOZKatBM2oN086Alrw8JA==
X-Google-Smtp-Source: ABdhPJzrtxGrrlK3p9TCGgl5ShPe7Vudi8p/g+cQtC6YA1Ht3zfmKgqegZeepHlK0hO5J5YEdhInhQ==
X-Received: by 2002:a62:2f03:: with SMTP id v3mr5077742pfv.123.1599887042836;
        Fri, 11 Sep 2020 22:04:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2dcb? ([2601:646:9200:4e0::2dcb])
        by smtp.gmail.com with ESMTPSA id c127sm3767882pfa.165.2020.09.11.22.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 22:04:01 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2] squashfs-tools: Allow COMP_DEFAULT to be changed easily at build time
To: Andre McCurdy <armccurdy@gmail.com>,
 Peter Morrow <pemorrow@linux.microsoft.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <1599844862-15857-1-git-send-email-pemorrow@linux.microsoft.com>
 <CAJ86T=UPhup8G+e6yt2X9=smV9Y3oMQ=kvZB0K_ivp5ZwKDDCg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <4f31caab-3148-c719-32ae-55d84d4bbf8c@gmail.com>
Date: Fri, 11 Sep 2020 22:04:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UPhup8G+e6yt2X9=smV9Y3oMQ=kvZB0K_ivp5ZwKDDCg@mail.gmail.com>
X-Groupsio-MsgNum: 142450
Content-Type: multipart/mixed;
 boundary="------------A568A94A37ECACF3868E6153"
Content-Language: en-US

--------------A568A94A37ECACF3868E6153
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 9/11/20 10:33 AM, Andre McCurdy wrote:
> On Fri, Sep 11, 2020 at 10:21 AM Peter Morrow
> <pemorrow@linux.microsoft.com> wrote:
>>
>> The default compression algorithm is gzip, this patch allows the defaul=
t
>> to be changed via a bbappend file by setting SQUASHFS_TOOLS_COMP_DEFAUL=
T
>> to a valid compression algorithm.
>>
>> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
>> ---
>>  ...ols-Allow-COMP_DEFAULT-to-be-overridden-v.patch | 34 ++++++++++++++=
++++++++
>>  .../squashfs-tools/squashfs-tools_git.bb           |  4 +++
>>  2 files changed, 38 insertions(+)
>>  create mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squ=
ashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
>>
>> diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-t=
ools-Allow-COMP_DEFAULT-to-be-overridden-v.patch b/meta/recipes-devtools/sq=
uashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-=
v.patch
>> new file mode 100644
>> index 0000000..5f12c42
>> --- /dev/null
>> +++ b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Al=
low-COMP_DEFAULT-to-be-overridden-v.patch
>> @@ -0,0 +1,34 @@
>> +From d2d9b517696f5950597f5b60ae8fdade5b7c14a9 Mon Sep 17 00:00:00 2001
>> +From: Peter Morrow <pemorrow@linux.microsoft.com>
>> +Date: Fri, 4 Sep 2020 15:43:15 +0100
>> +Subject: [PATCH] squashfs-tools: Allow COMP_DEFAULT to be overridden v=
ia make
>> + cmdline
>> +
>> +Currently the only way to modify the default compression algorithm is =
to
>> +modify the Makefile. It is useful to be able to set the default compre=
ssion
>> +algorithm via the make command line since otherwise a build time searc=
h
>> +replace operation needs to be performed on the Makefile.
>=20
> That's not how Makefiles normally work. Options set via the command
> line over-ride variables set with =3D in the Makefile.
>=20
> Does setting your chosen value for COMP_DEFAULT on the make command
> line really not work?

that works if make is invoked with -e option, We do not use make -e with
bare makefile based recipes.

>=20
>> +Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools=
/pull/93 ]
>> +
>> +Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
>> +---
>> + squashfs-tools/Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
>> +index aee4b96..7425605 100644
>> +--- a/squashfs-tools/Makefile
>> ++++ b/squashfs-tools/Makefile
>> +@@ -85,7 +85,7 @@ GZIP_SUPPORT =3D 1
>> + # in Mksquashfs.  Obviously the compression algorithm must have been
>> + # selected to be built
>> + #
>> +-COMP_DEFAULT =3D gzip
>> ++COMP_DEFAULT ?=3D gzip
>> +
>> +
>> + ###############################################
>> +--
>> +2.20.1
>> +
>> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb=
 b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
>> index b06951d..df025d4 100644
>> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
>> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
>> @@ -9,6 +9,7 @@ PV =3D "4.4"
>>  SRCREV =3D "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
>>  SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dh=
ttps \
>>             file://0001-squashfs-tools-fix-build-failure-against-gcc-10=
.patch;striplevel=3D2 \
>> +           file://0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overrid=
den-v.patch;striplevel=3D2 \
>>  "
>>
>>  S =3D "${WORKDIR}/git/squashfs-tools"
>> @@ -25,6 +26,9 @@ PACKAGECONFIG[xattr] =3D "XATTR_SUPPORT=3D1,XATTR_SUP=
PORT=3D0,attr"
>>  PACKAGECONFIG[zstd] =3D "ZSTD_SUPPORT=3D1,ZSTD_SUPPORT=3D0,zstd"
>>  PACKAGECONFIG[reproducible] =3D "REPRODUCIBLE_DEFAULT=3D1,REPRODUCIBLE=
_DEFAULT=3D0,"
>>
>> +SQUASHFS_TOOLS_COMP_DEFAULT ?=3D "gzip"
>> +EXTRA_OEMAKE +=3D "COMP_DEFAULT=3D${SQUASHFS_TOOLS_COMP_DEFAULT}"
>=20
> Note that this will force the recipe's default value even if upstream
> squashfs-tools changes. Not a problem now as the two are the same, but
> something which will need to be checked each time squashfs-tools is
> updated.
>=20
>>  do_compile() {
>>         oe_runmake all
>>  }
>> --
>> 1.8.3.1
>>
>>
>>
>>=20

--------------A568A94A37ECACF3868E6153
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------A568A94A37ECACF3868E6153--
