Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D42C83F17
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 02:10:34 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.4574.1752199831070393475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 19:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UW8GJ61h;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e302191a3so15843557b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 19:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752199830; x=1752804630; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjujb4Um726oqKI+8F0u6Y3m3dfKliEDgQ5Bn6ihFMk=;
        b=UW8GJ61hoavabvMxxy3WncIG13psobYQIiU0XC0VkfjaoctFdf6gKQHoRkYPL0JVps
         i5dePUZhZPvycmbqRW/KN2XHEmH5lDBnHaRhAwGlnISXPKhzfTVbik7gmDP4N+PDY7Ma
         uHSCyx9zTEV9i6yZi9LS/4rEeyRy5iOub7KgfPZB8cGklO7X473wFxQ1MeV0kZjn5cys
         /399R/6heGwWmZq28bLxSgL0kycRS31u+OAxh/PY0cEBxmUG+0v19nC00iJbxoAHnHSK
         XgN1YSDeYVy10pxkWqZNkmSYRJcDrE9kvxkynhKAzs+ewRM6rYm/pvontoFpyIuzBTPI
         Spvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752199830; x=1752804630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjujb4Um726oqKI+8F0u6Y3m3dfKliEDgQ5Bn6ihFMk=;
        b=YfxUT8ykgoL4VAWhfcxixQq/8Fa1uCz15fFtsr7uOhnquYhozAoaXf4CwzfX84gNRT
         kxwztqKSWIuS34j4HJ+nFt9ZrKxi1ywKtwwCoFwBRFB3KEKCAc7XS5I9ZBgyL2z8p96s
         KjQ5IgKEzVH8dYSG7rsk0L0HUcr1jrokdcZ26lyMeAuSYqWYnFsQ1/rrq3PGzvScABlw
         k1MyJATv/oBS9T2xrP6uFp42ARqjVtUBCd2FhyKbPqQVSvmHG0GZpHrFfndGoP2ecnGX
         7hovC7awGGpXdXZlIlcabtop8y/cIH+LSbC+TJRiHTahkZeKnX4L4o9sE7xDewz9+6qK
         Cmyg==
X-Forwarded-Encrypted: i=1; AJvYcCVmDrUgAGnCmLy72J9PexpTYI+QbIwflwJiGsrgGdLhuSe2EhN6yBv1LmG8WGiN6NcW/B2zO3SSDH9xaOwethsyXQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQjvULCTu+GB0Fk+EM0AcaXlomyz52B5VUIhR7510HlwvviTqy
	kfBpNIAzkhicc8OGmC0CUkPHnTjj5kVdZNfVrkr0EbjKV6bKZkiYLYBp49SspZQO5N9SdQi4xH3
	e+MuGfHxp2Yq6JyNX8XXlm++eJrfen9A=
X-Gm-Gg: ASbGncsU37BxQago4pKfvkpHjQ7B4xNFKaTizvA1PMvdSrBzfmVU/3N0kEzXg+H9Dai
	yNDud3YVnlT88P115MFUrxJHjkp8RG7m5XIdvOqYx19ZFhtVcDLAV9GaIwZ1k/KheLA9khTnyn+
	a1gjqn2JWwqhIR74LfcHqou4QXhSvpZtSCbda8XRO5BebpUuB5/QYfMGdrjfHaj/fl+PEOfcRgu
	GNdgb4=
X-Google-Smtp-Source: AGHT+IGHKTHaU1QqyjeXUI6FjKQa0JbE8T0DLYlQm2XYnX3jbr225uK4fk6GA08ogk1HPc5dvRjM7VK6qeaa79iNS7Q=
X-Received: by 2002:a05:690c:46c5:b0:70e:26ef:95eb with SMTP id
 00721157ae682-717dac30cd2mr9288357b3.5.1752199829988; Thu, 10 Jul 2025
 19:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org> <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com> <CAGpma=4Kr8D_R7Sn3mQNc5Eg-06DwK2fAmuunXZyESemFx1+VQ@mail.gmail.com>
In-Reply-To: <CAGpma=4Kr8D_R7Sn3mQNc5Eg-06DwK2fAmuunXZyESemFx1+VQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jul 2025 19:10:03 -0700
X-Gm-Features: Ac12FXxocCl5_kCSZgRgnPlRHTtU6Ok8HLDpM9PzqU7KWxhQwuLcxhFHjujpRxg
Message-ID: <CAMKF1sqm+88C1s0M7p4YQAFzFfY_6SZPjh+CvpvD87JkHb4bGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: Alper Ak <alperyasinak1@gmail.com>
Cc: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, f_l_k@t-online.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 02:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220133

41 more to go - https://errors.yoctoproject.org/Errors/Build/211165/?limit=
=3D50

On Thu, Jul 10, 2025 at 12:10=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
>
> Hello everyone,
>
> It looks like Markus is also sending fixes to meta-openembedded
> regarding the CMake 4+ compatibility issue, so I have added him to cc
> as well.
>
> I collected the errors from Khem=E2=80=99s latest qemuarm run into a
> spreadsheet and added checkboxes. You can tick off the ones you have
> fixed, so we can avoid conflicts and waste of time.
>
> https://docs.google.com/spreadsheets/d/1X8LN9x4xhqqzuAiTdE27pJdabS1P9ijeu=
UGAL6oQyzo/edit?usp=3Dsharing
>
> Khem Raj <raj.khem@gmail.com>, 10 Tem 2025 Per, 20:40 tarihinde =C5=9Funu=
 yazd=C4=B1:
> >
> > On Wed, Jul 9, 2025 at 11:34=E2=80=AFPM Haase Moritz, JD-62 <Moritz.Haa=
se@bmw.de> wrote:
> > >
> > > Hi,
> > >
> > > > I also considered the idea of temporarily using
> > > > -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to quickly work around the CMa=
ke 4 issues
> > > > across multiple recipes. Then, I thought that directly upgrading re=
cipes where
> > > > the upstream version could be updated was more sustainable solution=
. I
> > > > believed this would resolve many compatibility issues by relying on=
 upstream
> > > > fixes and encourage the community to use the latest versions.
> > > >
> > > > [...]
> > >
> > > I totally agree. Updating should be the preferred approach, followed =
by patching
> > > and the policy workaround.
> > >
> > > > Before our conversation I made a few things and sent them to meta-o=
penembedded
> > > > and Khem accepted them to master-next, but I still had the feeling =
that maybe
> > > > something better could be done.
> > >
> > > Awesome, thanks!
> > >
> > > > As I said, I have the feeling that it can be done better, so I will=
 wait for
> > > > your answers before I do anything.
> > >
> > > How about splitting the remaining build failures in half (after sorti=
ng them
> > > alphabetically by recipe name?). Would start working on the *second* =
half then.
> > > In case of dependency issues we can sync here.
> > >
> > > @Khem: Would you mind sharing a link to the failures of the latest 'm=
aster-next'
> > > build?
> > >
> >
> > Alper has sent a set of fixes which lowered the volume quite a bit,
> > Thanks a lot Alper !. it's down to 52 now.
> > here is latest qemuarm run
> >
> > https://errors.yoctoproject.org/Errors/Build/211141/?limit=3D100
> >
> >
> > > Moritz
> > >

