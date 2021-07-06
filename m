Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.6740.1625580983609916402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GoEAHMz6;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.50, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f50.google.com with SMTP id j39-20020a05600c1c27b029020028e48b8fso1889794wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mm4hLKHyACg2HmTkezv30dW6mhD1CMjxyty6gD9SdwY=;
        b=GoEAHMz6AbLKhayNhzlB3p7YLt3qd3UZeRNHigGlhSiptSA+lJMrxgfENZTbgoOEjm
         efbEnx44q6K9PofgJEkef8+cqVgNESIJbpG6PgMMvmYIch82WEWWNYOeITRvEIwjIoHH
         T1C0Mvc8whO79x0ihUBY1MrQi66sVcslUjzde1djzDKCvfL5Cu8XzlYsON254r/tt128
         dyFJuydhrou+EJ0bA/2yYld1esTRzxNQyih0VM5/BFzPmEoL/aORWZba41TaP0kgK5dl
         EuuTpSboHOsNbDMApo99O1pPvRrYD2QxavJax3yWk6o6qT/zIo7NGcRB9QRLhKfdC11i
         SeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mm4hLKHyACg2HmTkezv30dW6mhD1CMjxyty6gD9SdwY=;
        b=QpxrcnBG6wFhKw86exulyQjrwzhzjMc599nUtDNn5R22zheaMhxZ3YomESLr6g0QhD
         27GFMTP0u86rLB4mdrYoyyNCvvNez3d+6l85Pd1wmEbnQc6c1E6i+ewJUrGS+naKkQUz
         lgtem7eD4IAj13Isgsj3OT8/4cI8nM1R5ZuhB52RLS9aKQQLeTgqMez/1k7eX9cEVq7Y
         TkfmP196hwkZbaC1QNTh+k6GMPWGs8JqwBqeY9YQgCM1dGSK/wNVYMKwQ+HMHvVwxtkV
         NEYRVt3Wdz0STvOuy7NtpC5ucRWQPq8tTxRlPYu5mBk8e5OSU3s5fzDn+S2IWDgSHpBu
         sqKQ==
X-Gm-Message-State: AOAM530LxiJeiT1/iWST26f2+aoT0eOyW8ZzyfyqCgJj3FY+SxnfJ1Yl
	2+BUrNjZM6pfjTRAmc6DcbX9rzZuEUjIzZh7AjYNgA==
X-Google-Smtp-Source: ABdhPJwSIEl6mEogTLISJlzjU/+DT/dxK91AKnYN89913NQVOfWpCW11MZ7MLR6rhz4QjkEe53ZztarynHm6NOM0u3E=
X-Received: by 2002:a05:600c:3504:: with SMTP id h4mr1056861wmq.118.1625580982061;
 Tue, 06 Jul 2021 07:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625511812.git.steve@sakoman.com> <e8d6eda3435226a11f8f31ac1767892c42593a73.1625511812.git.steve@sakoman.com>
 <CA+chaQeDf-ejU-XxZggWWTQnm-oFAC34mnZBgGZh_DOkwvNQ5A@mail.gmail.com>
In-Reply-To: <CA+chaQeDf-ejU-XxZggWWTQnm-oFAC34mnZBgGZh_DOkwvNQ5A@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 6 Jul 2021 04:16:08 -1000
Message-ID: <CAOSpxdZSqgkV430eGhO1V04Fm0ygNtH1xSZhxScn7tMYDO50Wg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 13/19] pypi: set SRC_URI with _prepend, not with +=
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 5, 2021 at 10:31 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> Is this one worth backporting? It breaks some recipes in other layers (e=
.g. podman-compose in meta-virtualization http://git.yoctoproject.org/cgit/=
cgit.cgi/meta-virtualization/commit/?id=3D92f976404b7f82c97996ffce94ca2d20b=
e2dcbda) and it's only fixing issue with devtool which imho isn't so import=
ant in dunfell compared to master.

Agreed, if this is breaking recipes in other layers, then the downside
outweighs the devtool benefit.  I'll drop this from the pull request.

Thanks for reviewing the patches, I really appreciate it!

Steve


> Regards,
>
> On Tue, Jul 6, 2021 at 12:36 AM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>
>> This did not cause problems in builds, but broke some devtool
>> workflows such as version upgrades or checking the latest version
>> from upstream. Tarballs should come first, not the patches.
>>
>> (From OE-Core rev: 5cee50c25197102658e0689f635b2d567a375471)
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> (cherry picked from commit 8f17b8bce85efb0e9a7e15d0b98a5cf7b6bd9750)
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  meta/classes/pypi.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
>> index 87b4c85fc0..384a209874 100644
>> --- a/meta/classes/pypi.bbclass
>> +++ b/meta/classes/pypi.bbclass
>> @@ -19,7 +19,7 @@ PYPI_SRC_URI ?=3D "${@pypi_src_uri(d)}"
>>
>>  HOMEPAGE ?=3D "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
>>  SECTION =3D "devel/python"
>> -SRC_URI +=3D "${PYPI_SRC_URI}"
>> +SRC_URI_prepend =3D "${PYPI_SRC_URI} "
>>  S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>>
>>  UPSTREAM_CHECK_URI ?=3D "https://pypi.org/project/${PYPI_PACKAGE}/"
>> --
>> 2.25.1
>>
>>
>>=20
>>
