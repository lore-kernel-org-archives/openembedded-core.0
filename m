Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A40C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 10:26:08 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.18573.1665570363228595960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 03:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DFhCzPdz;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id by36so20112037ljb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWBAkgwzLRY9iaOYOfRp5VvXH2TpMyOtA7oemBLwKSk=;
        b=DFhCzPdzc1Tj3/f5hDv+HxOyr+V/mTeI1LELTNnLcuTyBCWygePQ4fRnTK/f4p6y38
         zLTvGoNwcr0Z30NvdE8TjZ14wsMTPBfnOPTe/rOQpWz35IM7KlhD84v+fPnFTuluXFeI
         CH+IjlnYZ9yyzUYxZAZlV69m1tAepkXiUXAXLUizGiY4CZk0Cr8hHHJ/JP3w67Q1uUZv
         CzS0LIM/PzY6SA33uyTJvV9zcOJmhWDxNDvbPsHxIGkpQPs/+ncpExAwJB9kg8d9jYBN
         JKEdu6DcPjy4xIduA0u697n595LbX+3wVKO8auTgSD5mtcivYuFTFPkfG5iV+FNo2tRE
         swjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWBAkgwzLRY9iaOYOfRp5VvXH2TpMyOtA7oemBLwKSk=;
        b=U5d4xBrNvhf/qdPCaDsTfJilUEYoGm8buI4FEFkVe+MrAd23L3dtYr2c+8JLvulF/1
         nGC1tikjWOrl7aRMFYqlYkbYoc9yzXXctdxuCuUbu0HmXGtvGL1vXqf+WPnSeMbBi6rw
         3T5JO88lTzfPOv31YD7w2FgjjIQQzR1RSGZ9oREWBL/ekPDnSDgHriWmURd8DsTi2fIQ
         W/6Wz2bb3M0e7/DFKJKearxRMt7LVntjvCmN09NgSYMk+RPrlPH5obBuZM+Ji3irBfzP
         uPozHrfAfSkQW11+RbyvROOTvdDPNSbttoBdYiZU/QxCelcxTqCuGQaCVwvH2vzO57CJ
         LYHg==
X-Gm-Message-State: ACrzQf1nMYPGrdQMpF1DelbUb+tVUoWFOas3vrD9iwVPpdDJDKuCRmM5
	nOc5XCu1JVKjtV1KIxYjccMOHh5HXtoqZ//qBnU=
X-Google-Smtp-Source: AMsMyM7zvnP5jheKFodRr4p4H2DtEj72l4n0o+qhBZHJKUbEkxPN77/xCoxqG40I6/LCBUe6RORhUupe16ryV4z7hSA=
X-Received: by 2002:a2e:a887:0:b0:25e:3174:fb67 with SMTP id
 m7-20020a2ea887000000b0025e3174fb67mr10082443ljq.337.1665570361100; Wed, 12
 Oct 2022 03:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <1529445347.7178896.1665568288122.JavaMail.zimbra@piana.eu> <Y0aRBGVaqoPZHXdG@nuoska>
In-Reply-To: <Y0aRBGVaqoPZHXdG@nuoska>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 12 Oct 2022 12:25:48 +0200
Message-ID: <CAApg2=Qz8Bo926jAmMPiGHuFKvwM6asFGxCokwSqfTzBBch5SQ@mail.gmail.com>
Subject: Re: [OE-core] severe issue in CVE checker
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Carlo Piana <k@piana.eu>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alberto Pianon <alberto@pianon.eu>, OE-core <openembedded-core@lists.openembedded.org>, 
	marta rybczynska <marta.rybczynska@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171663

Mikko et al,
I think that we all agree here that we need to fix that database corruption=
.

BTW The Oniro team has worked to fix many issues from the list you
mention, including frequent communication with NVD. Alberto and team
have been stressing the tool more than most people before, I think.
This is a good thing. And that they find bugs in the process...

I agree that the cve-check does not give perfect security (after all,
not all security issues have CVEs, and there is a delay between the
CVE creation and the NVD update). Using it is the best recommendation
we have for the users so it is in interest of all of us to make sure
the check is working reliably. We don't want unnoticed security issues
in our appliances, don't we? :)

So, let's concentrate on "how"/"who" in the process of fixing this issue...

Kind regards,
Marta

On Wed, Oct 12, 2022 at 12:03 PM Mikko Rapeli <mikko.rapeli@linaro.org> wro=
te:
>
> Hi,
>
> I did not mean that yocto CVE checker is useless, or that bugs like
> this should not be fixed. Using it is part of the best practice
> processes for making secure products with yocto (even if it's currently
> not documented as such).
>
> But we should also document that the CVE checker makes a LOT of
> assumptions which are frequently broken in real life. poky tries to work =
well
> with CVE checker but many other layers and recipes may not work at all.
>
> Few reasons are:
>
>  * recipe name may not match to a CPE product name in the NVD database,
>    and CVE_PRODUCT may not be set
>
>  * recipe versions PV may not be compatible with upstream version
>    numbers and hance the version range checks may fail
>
>  * data in NVD is frequently wrong about the version ranges of CVEs
>
> And there are more corner cases. All these fail silently.
>
> Now you found a problem with the NVD download scripting which I think
> needs to be fixed. But even if it works, developers who need to run
> security checks on real products need to do more than just rely on
> CVE check output.
>
> Cheers,
>
> -Mikko
>
> On Wed, Oct 12, 2022 at 11:51:28AM +0200, Carlo Piana wrote:
> > [sent from the wrong account, resent, sorry for the noise]
> >
> > ----- Messaggio originale -----
> > > Da: "Mikko Rapeli" <mikko.rapeli@linaro.org>
> > > A: "Marta Rybczynska" <rybczynska@gmail.com>
> > > Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Alberto Pianon" <a=
lberto@pianon.eu>, "OE-core"
> > > <openembedded-core@lists.openembedded.org>, "marta rybczynska" <marta=
.rybczynska@linaro.org>, "Richard Purdie"
> > > <richard.purdie@linuxfoundation.org>, "Carlo Piana" <carlo@piana.eu>
> > > Inviato: Mercoled=C3=AC, 12 ottobre 2022 10:04:07
> > > Oggetto: Re: [OE-core] severe issue in CVE checker
> >
> > > Hi,
> > >
> > > Can the downloads be turned into normal do_fetch() SRC_URI downloads =
including
> > > caches in yocto infrastructure?
> > >
> > > There are many issues around CVE checking that it's really
> > > a process where a lot of details and uncertainties just need to be
> > > accepted. It's far from a perfect and users just need to accept this.
> > >
> > >
> >
> > [...]
> >
> > I beg to (strongly, if I may) differ.
> >
> > CVE is broken? This is no excuse of course to ignore a known insecurity=
.
> >
> > Is it better to include a process that, when fails, the fail goes unnot=
iced, than nothing? No, "nothing" is better than flawed here, speaking of s=
ecurity, since a false sense of security is worse than insecurity itself.
> >
> > If we put a CVE checker that just throws in a contradictory message (a =
warning and eventually a "success" one) and then silently moves on without =
any fuss, we leave users in a state of false belief that they have complete=
d at least the CVE checks -- however insufficient this may be -- but in rea=
lity it's a test that never fails because the database is empty or outdated=
. I agree that for developers CVE checking, compliance, software component =
inventory are a PITA, but it's way more a PITA when an attacker exploits an=
 unpatched known insecurity kept out in the wild, or when a copyright troll=
 comes after you demanding (many!) millions in damages (I can't disclose wh=
o has received it, but I have seen it in real life), because you failed to =
notice that a GPL component went into a mass-distribution device.
> >
> > Once the function is advertised, the expected behaviour for a thing of =
that importance must be to visibly flag the issue and **stand in the way** =
until you acknowledge it, so that the warning cannot be missed. It is up to=
 the duly informed user to say "Ok, it's nothing, I know it" and shrug the =
problem off. Not a decision taken for the user by others and hidden under t=
he carpet. We have several clients relying on that CVE checking and just by=
 coincidence we noticed that something did not add up. God only knows how m=
any times did this happen before.
> >
> > One can think it's not their problem, this is open source after all. Bu=
t being open source is not total relief from liability. If you create a hol=
e in the road and cover it with foliage, the fact that you are not paid to =
pave the road and you are doing it as a service for the community does not =
shield you if a car takes a nose-dive into it.
> >
> > I am sorry to intrude in the discussion so bluntly, but I prefer that t=
he legal implications are correctly perceived before making a decision.
> >
> > All the best,
> >
> > Carlo
> >

