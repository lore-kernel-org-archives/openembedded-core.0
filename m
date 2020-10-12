Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.1333.1602517162189850642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 08:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U74kMzND;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id qp15so23815478ejb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9EI4nPUWPVtHCNO+s5p64LmucJVGhZQ4bmxafp+eHdU=;
        b=U74kMzNDrJVv6q9QTgOHuZqqbmsQY6VRFacKAv5rFW0FBFhNFqP/iFQHOC4DMTYhlV
         XN2s1JbdLeB6VpEZgjwdAkGz3HCmRC79UUd1FKurENtxMPGqez3zcMeTmKfEZi64BMSV
         Hyq45XNYuqcYGGgbGigHSaqV32z40Oypc9DOYNuZSwi1UH7ecQ7o37K3L0QfLYEmR5uC
         7w7LQ5CM0UFQl7HP6TKApWwAJn0Bu8YyVSSsx7oqFWOiuArwr/jHHty/eT/rZ9tjjX5K
         NjD3jQvqwsJMj2+OtoY2Xm4GSlSq6z99gLX9r2lpUJLgRV/nwdd+d9GMeg9aFSnYEHS6
         0waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9EI4nPUWPVtHCNO+s5p64LmucJVGhZQ4bmxafp+eHdU=;
        b=j1HfwWqm9g/eF9N/PYIFdcOEuGHlKvOzsSMCSRXuofB9rVEZt8K+FQNqKdTttpITvw
         vQk8ER+TIr+Hng5rMleduHQxOmuVltMRUeacwcOg06ngsuf/Xvx2N9QcNh95yOktymlE
         euJGcaR/fNlQtmNC3ajpmIDpdfOKqTLXby+Fq83yVfu0/J+D4Kzr1MXLaCR/qh6cg1BC
         R5d+PM8zJbRzbZp7L5TPtvv5bh9J1jaLy6Mlxo8LOvS9os6evN6mwNq4vjlkxZp5GjDb
         SrfWGFYTD4gHH7ekIDIivjz2gm6Jw3Eh8ZAkg1HNgZyRxnc032Rfwzrrd69Cq95zx1h0
         w1AA==
X-Gm-Message-State: AOAM532QdBIOGloWKjp4lHM+7vOmfOVq48Mxz9ta58xytQgVTi+tNUlG
	HsKfPw+TKCTJAzqqOALuPGQ4CCmZ0D+ZCsejBZ8=
X-Google-Smtp-Source: ABdhPJwwHaFODH2TdCVW79WhhUMhdWZY4NwvvGSK4gToMxEjjnDp0y/p0HAauKOVb2gKOWKoIN8SP0V8ylwPtVaC1tY=
X-Received: by 2002:a17:906:5509:: with SMTP id r9mr29652521ejp.12.1602517160583;
 Mon, 12 Oct 2020 08:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-3-quaresma.jose@gmail.com> <CANNYZj85PCVxp-8_rEWLw1rU2w=v_=tR-dFHSohfcyT=ndbfvA@mail.gmail.com>
In-Reply-To: <CANNYZj85PCVxp-8_rEWLw1rU2w=v_=tR-dFHSohfcyT=ndbfvA@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 12 Oct 2020 16:39:09 +0100
Message-ID: <CANPvuRkpH1s3Kpygx0sSJu=AYC7k7fiRMjCDQWmh3NqUSwGFAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/13] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
12/10/2020 =C3=A0(s) 16:31:
>
> On Mon, 12 Oct 2020 at 14:36, Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>>
>> +
>> +%% original patch: 0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-g=
stglf.patch
>
>
> These additions are all over your patchset - please remove them all.
> (I guess you used 'devtool upgrade'? That should be followed by 'devtool =
finish')

Yes, Initially I used the 'devtool finish' but in a second interaction
I rename all the patches with git format-patch.
And these mistakes came from there. I will fixe it in the next version.

>
> Alex



--=20
Jos=C3=A9 Quaresma
