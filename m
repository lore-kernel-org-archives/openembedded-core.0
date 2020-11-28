Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.37648.1606597431039839535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 13:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PsRZHdaq;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id z188so7452265qke.9
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 13:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0aMv3Ytpe1Vl4F/fTOSTVN/HsM7yLpCoteIJfGtT4DU=;
        b=PsRZHdaqTaJ+EWhz94YFtewh3g9MojTgS9IrU3tbHprUoSzacjzKgHYzjhbDk/5JQC
         61PDW4EtRHEgrt6tafyB4EOMoXrlJHyH1+8dE3armLAMbodmcMInlpKm3UIqH/9ht5EM
         qyFauXV9ZzxsJSzu9ucWbeVRPZIREEvf4YrV/NEKXYBRw3M6ljcP6V91kcWg5otdx6TG
         PI7Sfyt1StpKHLPg+yyylpG1LppreOLyhiDLF4rTudcFR2PAOJ0f0S0Csrmtm87CVaHv
         BnaI3qsQQV3kn+r1sgm/9sD9QKGGltYSm4edNf7NMRjWV4rszQCU7bhGa/hjvPCnwdgR
         /+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0aMv3Ytpe1Vl4F/fTOSTVN/HsM7yLpCoteIJfGtT4DU=;
        b=Zw1RnTVyonKI2DAlEG4yT7drKFDi+bN3TyWKuLqvhqq0FUT1IEnQELtUSj+qx/+HY6
         lg8nriQ9koyh0y5zRuFq09u2ov5LBXB1Pd4XNRySmDlf+Bxoa5JRnv2PnQvrmXNCyGPq
         G+O7FXBkDRdQ0Mr+H15g0AuYnaDggjL3I7Ii+/Hn6Aek2up4xNBIvuCa1GJWP52/imMP
         Hr3DFo0I22Dy5la+d3ZKttXCIyCgdmFS+oYusW+HmB3jIuUFYgBMILqcRVs9wcbf7k8r
         ihm/e6ej3Apwk77X+OL0CVrvBnWVHIfSREFCGuQJqeLqbsJGnMlIpfJowhQ5C9o6ash0
         lZjg==
X-Gm-Message-State: AOAM531dhoDHUwB7oM5ryBXt+4DiXPMS7chfa4GnzJS7Xz8+spAqYfpe
	unwPuMJ5cL7q2FMk8PUHFPjz5wAuYxI+OoxWwWo=
X-Google-Smtp-Source: ABdhPJzmMKTnWRyNC5WL9U/job1haBpaYOSyZLLZL39i7BKuzMWxoaw1eViqtv0MbmlT5yoYgNzNNemCAsjUOamVSIo=
X-Received: by 2002:a37:a70e:: with SMTP id q14mr15038865qke.337.1606597430040;
 Sat, 28 Nov 2020 13:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20201120172950.1619754-1-raj.khem@gmail.com> <20201120172950.1619754-4-raj.khem@gmail.com>
 <CANx9H-AQbxr-RpJe3T-6YSR4=zMwmxwdrNCVGjAnLMpmo1fM2w@mail.gmail.com>
In-Reply-To: <CANx9H-AQbxr-RpJe3T-6YSR4=zMwmxwdrNCVGjAnLMpmo1fM2w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 28 Nov 2020 13:03:23 -0800
Message-ID: <CAMKF1soTReBQ6qVMgJMU1F6O9QdLQ2AMLShXw91u3+GY5k-H+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 4/8] python-numpy: Add ptest
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 28, 2020 at 10:57 AM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Fri, Nov 20, 2020 at 9:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Since 1.15, numpy have replaced nose with pytest testing framework
>> it additionally needs hypothesis and sortedcontainers modules
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/python-numpy/files/run-ptest         | 5 +++++
>>  meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 7 +++++--
>>  2 files changed, 10 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-devtools/python-numpy/files/run-ptest
>>
>> diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python-numpy/files/run-ptest
>> new file mode 100644
>> index 0000000000..9a1c72aeb1
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python-numpy/files/run-ptest
>> @@ -0,0 +1,5 @@
>> +#!/usr/bin/env python3
>> +
>> +import numpy
>> +numpy.test(label='full', verbose=2)
>> +
>> diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
>> index d54f2f6c18..b484e7cddc 100644
>> --- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
>> +++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
>> @@ -8,6 +8,7 @@ SRCNAME = "numpy"
>>  SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>>             file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
>>             file://0001-numpy-core-Define-RISCV-32-support.patch \
>> +           file://run-ptest \
>>  "
>>  SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
>>
>> @@ -16,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>>
>>  DEPENDS += "python3-cython-native"
>>
>> -inherit setuptools3
>> +inherit ptest setuptools3
>>
>>  S = "${WORKDIR}/numpy-${PV}"
>>
>> @@ -30,7 +31,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
>>                    ${PYTHON_PN}-pprint \
>>                    ${PYTHON_PN}-pickle \
>>                    ${PYTHON_PN}-shell \
>> -                  ${PYTHON_PN}-nose \
>>                    ${PYTHON_PN}-doctest \
>>                    ${PYTHON_PN}-datetime \
>>                    ${PYTHON_PN}-distutils \
>> @@ -39,6 +39,9 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
>>                    ${PYTHON_PN}-netclient \__class__  = <class 'zipfile._ZipWriteFile'>
>>         # and may, or may not, abort the process depending on the LAPACK package.
>>
>>         XERBLA_OK = 255
>>
>>         try:
>>             pid = os.fork()
>>         except (OSError, AttributeError):
>>             # fork failed, or not running on POSIX
>>             pytest.skip("Not POSIX or fork failed.")
>>
>>         if pid == 0:
>>             # child; close i/o file handles
>>             os.close(1)
>>             os.close(0)
>>             # Avoid producing core files.
>> >           import resource
>> E           ModuleNotFoundError: No module named 'resource'
>>
>> XERBLA_OK  = 255
>> pid        = 0
>>
>> ../../python3.9/site-packages/numpy/linalg/tests/test_linalg.py:1808: ModuleNotFoundError
>>
>> """
>
>
>>
>>                    ${PYTHON_PN}-numbers \
>>                    ${PYTHON_PN}-pydoc \
>> +                  ${PYTHON_PN}-pytest \
>> +                  ${PYTHON_PN}-hypothesis \
>> +                  ${PYTHON_PN}-sortedcontainers \
>
>
> Also needs ${PYTHON_PN}-resource
>

Thanks, did you mean python3-pkg-resources ?
I did not encounter this locally and I have the above installed and
was wondering if thats the case.
but I have added this, I will send that in v4 otherwise.

> """
>
>>                    ${PYTHON_PN}-pkgutil \
>>                    ${PYTHON_PN}-email \
>>                    ${PYTHON_PN}-compression \
>> --
>> 2.29.2
>>
>>
>> 
>>
