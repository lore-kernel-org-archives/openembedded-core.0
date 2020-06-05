Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web12.10908.1591363784030469474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 06:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cF3y3pIV;
 spf=pass (domain: konsulko.com, ip: 209.85.167.177, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f177.google.com with SMTP id m67so8206712oif.4
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XOpCXvTTgC8DnOXkBeU6rI+W2P0clZ7SoFLB1NOFmsE=;
        b=cF3y3pIVONbesWPKfZJDpkQQQ8EMW29Qrd8JMZGWN61Zt5uSVUyDi8t3Pl9mrPxY9X
         CuL5jz+2OzGp1E+4Y82qto6hAelKZubJYuIlsTEMWfyGTIq6AlgNX5Rm+2nR/q/zMUNA
         pLLKwLY7sM4Di77thJEgaNBbps8GRkltSrHaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XOpCXvTTgC8DnOXkBeU6rI+W2P0clZ7SoFLB1NOFmsE=;
        b=B0/zZXBVwC5sRoH7C1TLa4YW8jSZr11d2l300VDMk+HtpJppOS3uZGsd01vjLsLWj8
         QyjQVUeIfaW7JMruPfIMHw8Pa/DWwIBOqROZhahcY3uIhd+HxS7jIznW8JZpv6zsTbXc
         RR3XakqDufMmpo77Zmw97atatpwo2f0xiflj1RxsBwBLlhLmdoPo3IBQgK+vzACKYTOz
         PTDJHY0CFOHCrePBWF4Cq5pEBCT4feornfqBp9B9JdKfaOtRgRF+OSeU8bc43y4/Z1S2
         zyUL2j1ZBG2tvjHH1Y67ZHX/J2LtrZxE0YMdBcx6F/Z/UtTbVhAzyncyVsjzNHyGKIry
         H22Q==
X-Gm-Message-State: AOAM530KpmEaPjjm5ScSJjWNg6e7PtzH5tiIirD5qkQGllSmTkAWUPJ1
	VG1leA4wS2a2Af8wKkm+Lt227KH58E9AirCBRWH9Qw==
X-Google-Smtp-Source: ABdhPJzmyLMwOoRBFm1zj82xhwI/4WyKT5HIQnqeCzZDSHwft/uVZXxFcYfQ3KQFA4KenCzjghiSFETkk7BGkl/FZQM=
X-Received: by 2002:a54:439a:: with SMTP id u26mr1819377oiv.6.1591363783138;
 Fri, 05 Jun 2020 06:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <1615A7E9D8CB7FC6.25101@lists.openembedded.org> <CA+4=imaaV_2OtheyeYqcV1tFgiPGe3OMsj=rA8EWRXO5XD0FRw@mail.gmail.com>
In-Reply-To: <CA+4=imaaV_2OtheyeYqcV1tFgiPGe3OMsj=rA8EWRXO5XD0FRw@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 5 Jun 2020 14:29:32 +0100
Message-ID: <CAM9ZRVtELmoGty5fuPKOoBUP1PJW8ew7nLCTwpSq1U=Y_gMyoQ@mail.gmail.com>
Subject: Re: [OE-core] Status of support for recent host glibc
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Jun 2020 at 14:25, Yann Dirson <yann.dirson@blade-group.com> wrot=
e:
>
> Le ven. 5 juin 2020 =C3=A0 15:11, Yann Dirson via lists.openembedded.org =
<yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :
>>
>> I just got hit by the following dunfell build issue on my debian/testing=
 dev box:
>
>
> My bad (too many build trees), it is a sumo build.

Sumo is now EOL (https://wiki.yoctoproject.org/wiki/Releases), you'll
probably need to update to something more recent to support Debian
testing.

--=20
Paul Barker
Konsulko Group
