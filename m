Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.3501.1620249992781392428
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 14:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZavssCPg;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id q5so2052469qvv.6
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mPOulutzzh1jtSk331xJwcWWdrSnwVUUwch+op28ev8=;
        b=ZavssCPgGizDjwHM6H7Tv1VrWmCpmc8469w5l16J7I4whcHjumSoKzDAOjoEr/kENm
         wwgclJ5c8SlFjzQtA/74woq/3P5iACs24Lw2iECSplNroAilc7S+OZoDnUjylqFGhJxc
         zMJwMnguA4uyol5Cvgl/nD2hWWNy3SgpDxW9WCucMRr1GW0hpzwYrSJRxV6Ok7qvvcSx
         Tl9KvVZZZgYIzn1xBit1CuzzUahrOT6SHx3iloEtLYE9sYFHvy7NQIMRlpvqwVUIsP/1
         kvWQMpu7lnPUL1Oobv1b1SZ8WIGaVBzdJ2rm6foptFK2815Auofq6g5fHUtKVFYTFKnZ
         u2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mPOulutzzh1jtSk331xJwcWWdrSnwVUUwch+op28ev8=;
        b=EF/ogKOLlj7a+ysvRfa96IppmMs5CvbVRHlD3MCjCOWcTnd2L3AMeQOIvSSkMjwKiM
         hrsI9ZZEMzW/GrewIHBGh24iBMkDp8Bf6ZT6qjuW2pEy2HbrktU6KuIrmo+dfn3ZZk3N
         52ty1NC6UpwO8Wl8RnbV9Ri4nmuauf3F9rFaim2jjpPIh+B6cogDY3awL3Lu4p3iKXTQ
         RaHf1byMiV3sUSp82JaqbcvExflSUPs5E2LuPzgfyODjOvjHSabX9iinLX0OAeBhUIe0
         AeuebowuNDAmgmsezfayL4SyH6w7WGs06DURsIsaXLv35emf8sVGvDCKxRjaXs6UzfgQ
         cQ1g==
X-Gm-Message-State: AOAM530GWnrj3h0lr0IHiPhNZYfHf58WMCheuJ5gBJpBAXtE+QQ0hwpR
	RJtu+4VPezpKnHgQj1sjvyZIetpnfEvWSjdnDaU=
X-Google-Smtp-Source: ABdhPJzypgmjFTBkJNtBxvZF2o8iXQGX6cbmg3BQklk1p+YE6FZzrT6IX+XsA+ifXBP7toWO18rVPIRVKHLtNTn2Poo=
X-Received: by 2002:a05:6214:a62:: with SMTP id ef2mr780427qvb.31.1620249991813;
 Wed, 05 May 2021 14:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-23-alex.kanavin@gmail.com> <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
 <CANNYZj8Q7GLF_6oLZQ9oZYO3nMKkThZnj7CZGL=duS1u_wQicA@mail.gmail.com>
 <46ffd119-9523-cb0f-d582-ced91ccccef6@gmail.com> <CANNYZj8iZrEC0kc5GGJSb6ddBH77Tz_pN+pFzuD0Hhbdjhpjbw@mail.gmail.com>
In-Reply-To: <CANNYZj8iZrEC0kc5GGJSb6ddBH77Tz_pN+pFzuD0Hhbdjhpjbw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 14:26:05 -0700
Message-ID: <CAMKF1sozSbDLB08dWLOTnSAFFpgp3j7rkoQ-7NGe5fYF7f+ceQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/61] powertop: update 2.13 -> 2.14
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021 at 12:49 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 5 May 2021 at 21:43, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > Sorry, no. If I do not understand what it does, the version update is
>> > incompatible with it,
>> > and there is no trouble detected by the AB from dropping it, then it h=
as
>> > to go.
>>
>> OK thats fair, no one knows everything so drop this patch from your v2
>> series and let someone else handle it.
>
>
> I assure you, nobody else will do it. I regularly drop poorly written thi=
ngs that are a maintenance headache, if you have specific objections or use=
 cases or issue reproducers, please state them, but saying 'don't remove be=
cause it might be useful to somebody, somewhere' is far too vague.

I went through the history and some of these changes were added by
you, so I hope you know why they were needed

188862de64b meta/recipes-kernel/powertop/powertop_2.3.bb   (Marcin
Juszkiewicz    2013-04-11 16:05:14 +0200 19) do_configure_prepend() {
188862de64b meta/recipes-kernel/powertop/powertop_2.3.bb   (Marcin
Juszkiewicz    2013-04-11 16:05:14 +0200 20)     # configure.ac checks
for delwin() in "ncursesw ncurses" so let's drop first one
188862de64b meta/recipes-kernel/powertop/powertop_2.3.bb   (Marcin
Juszkiewicz    2013-04-11 16:05:14 +0200 21)     sed -i -e
"s/ncursesw//g" ${S}/configure.ac
6612c5e48c9 meta/recipes-kernel/powertop/powertop_2.6.1.bb (Richard
Purdie        2014-07-16 10:58:34 +0000 22)     mkdir -p
${B}/src/tuning/
bcd6475928d meta/recipes-kernel/powertop/powertop_2.10.bb  (Alexander
Kanavin     2020-05-05 15:01:21 +0200 23)     echo "${PV}" >
${S}/version-long
bcd6475928d meta/recipes-kernel/powertop/powertop_2.10.bb  (Alexander
Kanavin     2020-05-05 15:01:21 +0200 24)     echo "${PV}" >
${S}/version-short
f1cb1f5b29a meta/recipes-kernel/powertop/powertop_2.12.bb  (Alexander
Kanavin     2020-05-31 17:52:20 +0200 25)     cp
${STAGING_DATADIR}/aclocal/ax_require_defined.m4 ${S}/m4/
188862de64b meta/recipes-kernel/powertop/powertop_2.3.bb   (Marcin
Juszkiewicz    2013-04-11 16:05:14 +0200 26) }

besidest, I think we still need

# we do not want libncursesw if we can
do_configure_prepend() {
    # configure.ac checks for delwin() in "ncursesw ncurses" so let's
drop first one
    sed -i -e "s/ncursesw//g" ${S}/configure.ac
}

since we control enabling widechar support in ncurses via
ENABLE_WIDEC, its better to either check for that here perhaps via a
DISTRO_FEATURE or just disable the widechar support
like it is doing.

other perhaps are fine to drop.

>
> Alex
