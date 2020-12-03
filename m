Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web09.3113.1607027639350189508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 12:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UYObDnic;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id v11so2359193qtq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 12:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E2ceWKV89VaBHs2YvIlyeBce4cYBoEnHLznbbF5gwKQ=;
        b=UYObDnicxRw77YOyr96ZmUUUhiH4WDYNxbOuwf+Fy8BXyVWn3/mnQ6m+LaQ/Chnq4C
         QW74lmmv8o/LDn2Husb9DpxJW3UvNz9+nZ8kL2k+3TLfwLeIz4+1uDQXw1L/D073PekX
         PTDrMeRMikVcD9h93R71v4kCBreO2X4LwMIdXitwDsO3kOtCGHIXyBsyYfonoG2W4CW8
         aCIRDec63Et6VZRoBrSgN5K6+EAy+MLNajSXnEHFPAqmTxii+E3vNoDtrMuS7nmexrbf
         rjcWGNKh5BMh5Wldx8cPZtmt/KboAP9Rk1ZUuzCpzA1nRxX5CnHf7FUL+VEyKq81bwHd
         R36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E2ceWKV89VaBHs2YvIlyeBce4cYBoEnHLznbbF5gwKQ=;
        b=MbRFi4NKT6fKkMe1TmWZI17e6W2f1z4TwJHj02jdFsE9zcq3FOepJz49yapB7gnX+K
         mSF1BZGiALBrtWlMaip04u/9CcXiLj/fgFLbOhyN2Z5u4XP2YEzwO3/6Yz+Y/Dsg8Yyr
         31Zc866ix/rVKlxCtP70DJ4sbFZh4Ggkk0qw6A4h9KY2XEEWJExHRZPAJBDkTbAjOP3f
         tKC7+HlMRinD8cZT6hEkAy25sVHyoAKD9SPWwibjknoLW1yEv1LwEALhU4at0KeQlGLg
         k2ZADUkzHd23GFCFV5IWwVT43FBdaDG2P9l65Vt3o8NWhDMDFZfSAuxq+a4//DzO50gY
         5WWA==
X-Gm-Message-State: AOAM533dyCZb5+fbmhDEp2avf6svnNlKzBNLS2N5fInEhEuzU0qKUB9K
	6LoiNz5xZgf+OTh/g4YgkRhkMkCl7I4HJVASJbs=
X-Google-Smtp-Source: ABdhPJyVoCaiCG+T2SUCaLhoTb3wCF+pAiE7OkpQtcshAc/IEh2elH7uO+iyYdVQ3dHLH2NDl8o8W9AIiMlG0QdTj6Y=
X-Received: by 2002:ac8:729a:: with SMTP id v26mr3760441qto.53.1607027638420;
 Thu, 03 Dec 2020 12:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
 <20201203133727.12936-2-alex.kanavin@gmail.com> <CAMKF1spavgHqm9YuCqo3mr-=kRGzW-J60T4gTQ5=uoBn98Hb9Q@mail.gmail.com>
 <CANNYZj_FvTGSUtBoEi_Nc=jA4szr1WrPNQSwjRuuawuJ7H6-rg@mail.gmail.com>
 <CAMKF1sq0cnt27qB5qSnKpVA2F4Tnf-ha1Va+P7F8B3OjGh9R_Q@mail.gmail.com> <CANNYZj9yrOVHM44Cd2Sz+FVxE5QSO3p7abcixjuMVQNJ91p2oQ@mail.gmail.com>
In-Reply-To: <CANNYZj9yrOVHM44Cd2Sz+FVxE5QSO3p7abcixjuMVQNJ91p2oQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 12:33:32 -0800
Message-ID: <CAMKF1sqK2SzqBNkDPoz90mzLXa3trkiRbS_zDv7YzafvMHvP8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/11] kea: fix reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 11:22 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 3 Dec 2020 at 20:19, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> but say if you were. Would it make the problem more obscure than what
>> it is now. So while here, perhaps defining KEA_LOCKFILE_DIR to point
>> to /run would be a prudent thing to do if it's already not done.
>
>
> Apologies, but no. I am not defining something that I have no way to test the correctness of, and I am not going to bring up the kea tests on target to achieve that.
>

Looking at code it seems defaults are /var/run/kea so perhaps we are
fine by not setting it explicitly here,  I know systemd wants to move
away from /var/run but that's perhaps an independent issue

> Alex
