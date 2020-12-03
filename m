Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web08.1860.1607023152011398364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vhgaK8NZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id i199so3211793qke.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eb4R1nrhlB+M2oRCQ5lvUkkxpPLOstF0HsdJJEgZ0LY=;
        b=vhgaK8NZ4df+KutCAwnXUP/ISlA81nwDg2hRRoeO6p3JzbXA08sMeleh15J4ReT9Db
         o5YiTNK7t3Sct9yAgCLZqaXF2jE6dznFvbpfCiG7PyGa86bcXm+8/dcWEBr2cHmZKQ1D
         0TMIH7DPgVGXwFO3+zEpak9S5fbgMW4TB518F0TWATE2LkPx3wr7sYAEjFra0IuuBoN7
         zGASchsAHNvctLX8iaZPWgQfpwbqbezMDJZtLbq3ek9C8BF0uQ1qexe9RcABhyoebtbu
         d4DX9THvqEjL7/CeGkOb2bx3N1nO41g4aRoA6aIxrVuCTF4pSSBN3kqYYTGsts6kSLsf
         dqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eb4R1nrhlB+M2oRCQ5lvUkkxpPLOstF0HsdJJEgZ0LY=;
        b=AD2FANNC0muRvn1YxsCmTpzCFAMrcd2avcb7AMP4hJjS38to2biW1KqjnM8ncN8Qzz
         o407ntILKSSvs5F+v1HvkDrSbH8DiEkg1mmBOZ6eZRSyEVwghMaD2VTVg9zsFfveKegZ
         mfjmzfrT39TJozO0P0aPyK0JGxUGimES2/0K494Z4lCslMv9/++9Pppce1aUYlmLV92F
         Yma2scEzfypLM4XOVgiNFKabLyJCthwOUYoVqeYP6o0OOZfojln4dGXdF4vQ8jm3qFmp
         O/r1/dT+TTesbWtE8Dtq18Mg7PVjRHRHnwvAP3L7xSOf5F72EsCGCY8kOmzToswaVUJC
         z8yg==
X-Gm-Message-State: AOAM531uTfj4LOHcwP58Krk4FHEJZCanqbsM2I2PFgUeCheYOf4Vl5uq
	51fz/JeqjuGeuiAlmKARjGqeK2py9zk9JotBLcg=
X-Google-Smtp-Source: ABdhPJz1tcYIJ7ezWSQs/SItmp9vaWqIzG31T/kAENUdWhyLZOAgBq22am0NoVGtz60LRyHsXB8lCCXzZEQRsnHw5ok=
X-Received: by 2002:a37:6195:: with SMTP id v143mr4228295qkb.71.1607023151094;
 Thu, 03 Dec 2020 11:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
 <20201203133727.12936-2-alex.kanavin@gmail.com> <CAMKF1spavgHqm9YuCqo3mr-=kRGzW-J60T4gTQ5=uoBn98Hb9Q@mail.gmail.com>
 <CANNYZj_FvTGSUtBoEi_Nc=jA4szr1WrPNQSwjRuuawuJ7H6-rg@mail.gmail.com>
In-Reply-To: <CANNYZj_FvTGSUtBoEi_Nc=jA4szr1WrPNQSwjRuuawuJ7H6-rg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 11:18:44 -0800
Message-ID: <CAMKF1sq0cnt27qB5qSnKpVA2F4Tnf-ha1Va+P7F8B3OjGh9R_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/11] kea: fix reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 11:12 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 3 Dec 2020 at 20:07, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> does this test then work or do we also need to ensure that
>> KEA_LOCKFILE_DIR is set to somewhere in /run dir
>> via Compiler flags or some such
>
>
> As we are not executing the test, it does not matter, and it would not have worked on target anyway as it hardcodes the build path. If someone wants to work on the tests, they can look into it properly.
>

but say if you were. Would it make the problem more obscure than what
it is now. So while here, perhaps defining KEA_LOCKFILE_DIR to point
to /run would be a prudent thing to do if it's already not done.


> Alex
