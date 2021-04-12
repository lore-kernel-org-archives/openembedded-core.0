Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.19904.1618238743136222639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H9O8w2Zj;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id t22so6159753ply.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2XphpALMKLDtifk1rSvy6QeicgxOZTqKsDTGVQuyI5A=;
        b=H9O8w2ZjBaj1hDGcdWA/DQcyIoOydn92vaiQHwK4+xeXbz4kJyCukEKc9Bb+H9z17W
         Fo6+/ff8I+KZyr7xRKFVuHhYHCz2LTDO8ttWYRWDtHbshcq5VqqHMx9k/j9EmCkUFCxF
         +V4+X+3wkxiBhVRZToJo9Qx74mW15YYPkAVFqnW8wtpML5sIWTaes7ImbcZca9qMLm4S
         u/a+F/NQWwFMYLv/qaLJTUG1YiXnfYfTq1c+MMUba1ivAUzxWPrXs+VmbPxaFxpbJJmV
         K+nnFWLAVcvdI5z094DuE+2JUVAz/xntxEyG2IvOrP2QdICiu6N1RW3HuXzxn/LebCiB
         /vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=2XphpALMKLDtifk1rSvy6QeicgxOZTqKsDTGVQuyI5A=;
        b=VZefDm25X7OdqUyHUp0sEesmBA9PaySzR+ThXxrsjRW4u8iIKQQq5uG47DqVkak/5b
         ZYgdSInBi1eB6cIaubZI8n+Wf/utZWSTMx9BbXETV8yxNFnpVgOeVZoNF8PiBZA3pe8x
         yUWfgv6Zkcv/5gjAqr7DNPqRALNBTJxj1ARN3pMY8k+m+prFFNPsQ3TsYIsCdvagTI5c
         3nfaDb7YgK1mAR+aR5TnFUSRa37kiJJYFWwVnIliKPpOn3Bc+qJdsHwBlm7pZL95hWet
         pK0W2hepB7ISWWbr8HLozMvm2Ggz7DncONS++LRpOvgN6E0E53prbv6dHOjFonhJUq2n
         /NmQ==
X-Gm-Message-State: AOAM5307DEIbvJFmR7LI4fdqWjj3le+c79gTiAWNKWBoDrL1VQoIYVIp
	B0067DI4pOZ4WEQgxFTgFBjo27881Fs=
X-Google-Smtp-Source: ABdhPJzp0Tv6zsaitp/sMGtA+CmMEvVmnFFtuby0sgBhlVVEpccLoMp4MJmpBCdtNeJoHLIxXjAKcA==
X-Received: by 2002:a17:90b:1490:: with SMTP id js16mr28456483pjb.131.1618238742361;
        Mon, 12 Apr 2021 07:45:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cc6c:b0b9:f575:afd2? ([2601:202:4180:a5c0:cc6c:b0b9:f575:afd2])
        by smtp.gmail.com with ESMTPSA id w7sm10398352pff.208.2021.04.12.07.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 07:45:42 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] binutils: rename BRANCH var
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210411154900.20331-1-akuster808@gmail.com>
 <CAMKF1so45P=eZyYuLr2SVwfYQscM81URUQR37urrmppPdKJLWg@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <e1f15324-16c8-9ff8-2918-7766fce4e8c0@gmail.com>
Date: Mon, 12 Apr 2021 07:45:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so45P=eZyYuLr2SVwfYQscM81URUQR37urrmppPdKJLWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 4/11/21 11:03 AM, Khem Raj wrote:
> On Sun, Apr 11, 2021 at 8:49 AM akuster <akuster808@gmail.com> wrote:
>> If BRANCH is defined in local.conf then that name is used to d/l source=
s
>> for binutils. You will get this error:
>>
>> Fetcher failure for URL: 'git://sourceware.org/git/binutils-gdb.git;bra=
nch=3Dhardknott;protocol=3Dgit'. Unable to fetch URL from any source.
>>
>> Rename to SRCBRANCH like glibc has to avoid the more common variable na=
me BRANCH.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-devtools/binutils/binutils-2.36.inc | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/re=
cipes-devtools/binutils/binutils-2.36.inc
>> index 2968291889..f638f02e8f 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.36.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
>> @@ -19,13 +19,13 @@ def binutils_branch_version(d):
>>  PV =3D "2.36.1"
>>  CVE_VERSION =3D "2.36.1"
>>  BINUPV =3D "${@binutils_branch_version(d)}"
>> -#BRANCH =3D "binutils-${BINUPV}-branch"
>> -BRANCH ?=3D "binutils-2_36-branch"
>> +#SRCBRANCH =3D "binutils-${BINUPV}-branch"
>> +SRCBRANCH ?=3D "binutils-2_36-branch"
> if dropping to use BINUPV then lets drop setting this as well. Which
> also means you can drop
i wasn't the one who dropped BINUPV. Those were already commented out via
b71294c4de binutils: Upgrade to binutils 2.32


> binutils_branch_version as well which is fine with me.

I can do V2 to clean that up.

-armin
>
>>  UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
>>
>>  SRCREV ?=3D "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"
>> -BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branc=
h=3D${BRANCH};protocol=3Dgit"
>> +BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branc=
h=3D${SRCBRANCH};protocol=3Dgit"
>>  SRC_URI =3D "\
>>       ${BINUTILS_GIT_URI} \
>>       file://0004-configure-widen-the-regexp-for-SH-architectures.patch=
 \
>> --
>> 2.17.1
>>
>>
>>=20
>>


