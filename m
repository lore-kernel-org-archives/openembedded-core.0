Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web12.3402.1620679967993104068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 13:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i81AJlDT;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id p11so16085763iob.9;
        Mon, 10 May 2021 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ca1pNzFrDEB0kaOleIiQRNxaRqXYPXrgAUpPjAwYdfA=;
        b=i81AJlDTlm3fxwwHhqf0fzAEsZhWnO9yeT9wxaKd6EJ4f3GwRPdTGH+6wSERabz41c
         dlXCIZsmVYXLOv1SYtMbi0AJQO2u7BhPMFHmFLt2Y1+RCgoGKZj5+GfpP3bDcsQHR8c6
         ESQ+CYHOPlAho9f4DfaQLHGWAIdEFdJDb3Sk/gOkCn+zw+0LTcFxzvfPTJsNWMN7biAm
         N9Y74yF3X+RAhJLyHTPyAo1b1awiRHcplKKxeJIGxcskvQfWHcmmVt0y1tafDcgHsMLe
         OKH3UDYPx+YV3Kt0TH5O+VzRZtR/murSETa/fleBHKct8g/4u+B7vWj/miOO5GMdJ/p1
         7oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ca1pNzFrDEB0kaOleIiQRNxaRqXYPXrgAUpPjAwYdfA=;
        b=IVzngqGeeT9IVMvcrayBKeDOm8lZR3ohFXqaDKXS1eALKJ/f9M9+i9Aqqfynw9DMSG
         ddepljEx11D3m2s/rdF5Dq3IzMFKlpy6omAdGv/up+UaUKMcwAbRuTAwuSDYJvu8mnwc
         NI+cfgdrZdffuM+uyHfU6MZ4CuDP5lHcngOrpVEiVuNKuGHfLw1RO0WIOkSPhg5CTNwT
         bXP84ORXbLb3TdHQO66uQ0vAgCJmDtbiprDB5GUxO1bBxQwcgulvjIlpBNH4lvL042MY
         4uRC48PYCPzAVbBQAEq+zI/N94Pz8l6qb1Srsy90/P8Oj+jSjfBg6Hh1c8ii1JIG1/42
         MieA==
X-Gm-Message-State: AOAM530mceIloLHAQkWJsn46/t80cYVg4mKr55ttk12Na7T73PotElCq
	zM47BSWCcN3RD21ZBP5Cr4s=
X-Google-Smtp-Source: ABdhPJwhtKmahtLRZ+38A8Gc6tEsp3MNlxwTu4aygmB5BxrTvl1KEpCaFhZKZd0/3PSumMXNWVcQbw==
X-Received: by 2002:a05:6638:1650:: with SMTP id a16mr23096133jat.23.1620679967367;
        Mon, 10 May 2021 13:52:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:f4b0:1313:b42f:b478? ([2601:202:4180:a5c0:f4b0:1313:b42f:b478])
        by smtp.gmail.com with ESMTPSA id v17sm6652196ios.46.2021.05.10.13.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 13:52:46 -0700 (PDT)
Subject: Re: [Openembedded-architecture] Open Source Maintainers - An open letter/request
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 yocto@lists.yoctoproject.org
References: <4be3a7006f265957fadf8f5118acb756691c2f81.camel@linuxfoundation.org>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <fafe1a94-c4f9-adf5-03d2-50f6c4750d18@gmail.com>
Date: Mon, 10 May 2021 13:52:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4be3a7006f265957fadf8f5118acb756691c2f81.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 5/10/21 8:14 AM, Richard Purdie wrote:
> TLDR: The project is seen as mature, employers don't prioritise maintain=
ing
> things and we're struggling for maintainers and help with day to day wor=
k
>
>
> Open source projects survive, not just through development work and=C2=
=A0
> contributions of new features but through a whole load of "unglamorous"=
=C2=A0
> day to day "admin" work. This may be tracking down a regression,=C2=A0
> triaging failing builds, making a release of a component, reviewing a=C2=
=
=A0
> patch, documenting something or many other activities.
>
> I love the fact we have active contributions, particularly for new featu=
res
> but we are continuing to struggle in many of the other areas above. I am
> extrememly grateful for the help we do receive with these tasks!
>
> As a project we have automated an absolute ton of things, we can test
> changes in ways we could only dream of a few years ago but maintaining
> this automation, tracking down regressions and ensuring it all stays wor=
king
> does have a cost.
>
> I am worried, not just about the core of the project, but the wider laye=
r
> ecosystem since "layer maintainer" isn't seen as a particularly interest=
ing
> career enabling focus by employers and it seems a lot of this work isn't=
 being=20
> recognised. Internal business pressures are often continually being
> prioritised over this.
>
> The YP+OE ecosystem is becoming more mature and this means we have our=
=C2=A0
> experienced developers being pulled away to new things and few people
> are replacing them so it feels like we're seeing a gradual skills drain/=
fade.
>
> There are a few things companies can do to help:
>
> a) Publicly acknowledge you use the project.=C2=A0
>
> I'm often asked where the project is being used but I find it hard to po=
int
> at companies using it, or products developed with it. It does help to be=
 able
> to point at real users rather than theoretical scenarios. We *know* it i=
s used
> in some interesting places but many won't let us say that publicly.
>
> https://wiki.yoctoproject.org/wiki/Project_Users
>
> b) Embrace employee's Open Source contributions, code and otherwise
>
> If companies can find ways to recognise the value of having open source
> experts/leaders working for them from a career development and reward=C2=
=
=A0
> perspective, that would encourage people to do the important work needed
>
> c) Consider Yocto Project membership
>
> https://www.yoctoproject.org/ecosystem/members/
> https://www.yoctoproject.org/join/
>
> We're finding that some infrastructure and roles need to be centrally fu=
nded
> as the work is important but no one company is willing to commit people =
to it.
> We're only able to to this through project membership which supports thi=
ngs
> like the autobuilder, LTS, our build triage process and my own role.
>
> d) Support employees in spending some time on open source projects
>
> I hear quite often that employees get XX% time to spend on open source
> projects. I also hear they get pulled onto mission critical product=C2=
=A0
> deliverables and can't prioritise that other project work. Finding ways
> to ensure employees can spend time on open source projects including=C2=
=A0
> management support would help a lot.
>
> e) Transition roles
>
> If someone has a key role in a project but is moving to new things, help
> them find a replacement and allow them time to train/transition to that
> new person. Some companies do this really well, I'd call out NI and opkg
> maintainership as a particularly good exmaple.
>
>
>
> I appreciate these are difficult times, both for individuals and for=C2=
=A0
> businesses. I'd like to conclude by thanking everyone who does participa=
te
> and contribute. Whilst I do want/need to highlight the above (and have b=
een
> asked to do so that people have something they can point people at), the=
=
=C2=A0
> project is proving to be successful, going to=C2=A0interesting places an=
d making
> things=C2=A0possible we can all be proud of!
Thanks for summarizing all this.

So is the ask to forward this within the one's Employer?

-armin
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>=20
>


