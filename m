Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0184DC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 09:02:32 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.88718.1722589344989311008
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 02:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fDdBq+Ju;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so90095661fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 02:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722589343; x=1723194143; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D99Do8G2crTM7kQEAYBiIy9XJIKZ62+P/Ad4v2wDrS8=;
        b=fDdBq+Ju7EjfJHWuDNiosY4SuauCJru712eZO0JFv3uVoNvVMiWge5C9ZqndN6itTr
         ArcxqeTvlRfX3yni8RVsJcjCZNS43Qge7lUus+KZ+sMPf8evJcbRPt0agac8CATKhtTc
         fG073tHttxp3Cj0F8AKLtn7mauuB8b+TrHrvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722589343; x=1723194143;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D99Do8G2crTM7kQEAYBiIy9XJIKZ62+P/Ad4v2wDrS8=;
        b=pgIombFS1Hm1KQBGucuUW+FFJKsrOOKATOmAKdVaVAjGjVceB+ZNazBqL0gJfR1fIf
         e0iUIN7ishNkCwp8awdQ9W3PHtQW1MhbsDWxgWm9fHjpGHyASy2r8wGKT0lYK/g30Jf8
         OzGzudDR7CEMZgYNFv+GmEWoWDNcQqORHKNWTXzZGNqUhbFb04p1cAZk46SYSVjhCCC7
         SgGnMhgwoqKzhSz/uXUgvRLm5Az1lBoR4f8nRE/NFP43GPAq1fzlJHrhZyJ/pQBKTIV4
         fcqgKzJHfbPUnhHV/UsSMWGVv71iyzhJP+xHWukK/07Nc9dtM9jyE3shdeisaP3VrwoP
         ougA==
X-Gm-Message-State: AOJu0Yy/AaAonwaeLK/6UikExE0lMta4F1N7kBgW44IKmy6zvDc5WVWY
	/4sln8E+Cwn03JlqHQ4f48pu9IyV+cbA69cVP0fD5evRH4zZky6a7Yyn53N9V/4=
X-Google-Smtp-Source: AGHT+IGJpURy22wdrDXTwn0JnnZ64nihgekzpfnuMal4c5efV69leJ7uJT4UrjSgqekFJRYE9dTFUA==
X-Received: by 2002:a2e:a9a4:0:b0:2f1:5c73:f215 with SMTP id 38308e7fff4ca-2f15c73f368mr15452401fa.46.1722589342856;
        Fri, 02 Aug 2024 02:02:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2ef2:8ccb:3250:e48c? ([2001:8b0:aba:5f3c:2ef2:8ccb:3250:e48c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e3ef10sm25094975e9.24.2024.08.02.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 02:02:22 -0700 (PDT)
Message-ID: <8e96d9f2ce3e7f2e35a69ec2d9bec9aa6ea0f2fd.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/10] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com, Scott Murray <scott.murray@konsulko.com>, 
 Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>, Jon
 Mason <Jon.Mason@arm.com>, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 02 Aug 2024 10:02:21 +0100
In-Reply-To: <cover.1722524523.git.bruce.ashfield@gmail.com>
References: <cover.1722524523.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 09:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202893

Hi Bruce,

On Thu, 2024-08-01 at 11:08 -0400, bruce.ashfield@gmail.com wrote:
> Here's the next batch of kernel updates. Obviously the -stable
> updates to 6.1 are routine, but the larger changes are the
> introduction of the 6.10 kernel as a new / validated reference
> version.
>=20
> Some notes:
>=20
> =C2=A0 - I've included the poky/poky-tiny preferred version bumps
> =C2=A0=C2=A0=C2=A0 in this pull request for simplicity. Yes, I know they =
go
> =C2=A0=C2=A0=C2=A0 to meta-yocto, but it is easier to make this available=
 for
> =C2=A0=C2=A0=C2=A0 AB testing when they are all together.
>=20
> =C2=A0 - I'm watching the status of 6.10, if for some reason it
> =C2=A0=C2=A0=C2=A0 EOLs before we release, we'll jump to 6.11, which I ha=
ve
> =C2=A0=C2=A0=C2=A0 under test and will push as linux-yocto-dev shortly.
>=20
> =C2=A0 - There's one known build issue with 6.10, it is zfs in
> =C2=A0=C2=A0=C2=A0 meta-oe. The upstream hasn't updated to support 6.10 y=
et,
> =C2=A0=C2=A0=C2=A0 so I'm watching and waiting on that .. but there's no
> =C2=A0=C2=A0=C2=A0 reason to hold this request for more testing on that.
>=20
> =C2=A0 - I've tested 6.10 for all architectures on core-image-minimal,
> =C2=A0=C2=A0=C2=A0 core-image-sato and core-image-kernel-dev. I've also
> =C2=A0=C2=A0=C2=A0 tested against musl and poky-altconfig (6.1 with the
> =C2=A0=C2=A0=C2=A0 6.10 headers)
>=20
> There will surely be AB issues with this, but it is now
> to the point where I need additional coverage and eyes
> on the changes.

Thanks for this, I put it through testing after tweaking it to remove a
rouge inherit. There were some issues:

a) genericarm64 version issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/687

Warnings since genericarm64 isn't available as 6.10. Everything else
seemed to miss the preferred_version and build 6.6

b) crypto-dev failures:
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9329
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9340
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9313
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/9161/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5141/ste=
ps/12/logs/stdio
(the latter taking out the reproducibility build so that wasn't tested)

c) meta-virt xen issues:
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3455

d) meta-agl kernel config fragment warnings:
https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/4556

e) meta-arm kernel config fragment warnings:
https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5810

f) qemumips64 parselogs issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/9240/step=
s/14/logs/stdio
"failed when register_sysctl_sz sched_fair_sysctls to kernel"
"failed when register_sysctl_sz sched_core_sysctls to kernel"
"pci 0000:00:00.0: [Firmware Bug]: BAR 5: invalid; can't size"
(and other BARs)

g) qemumips parselogs issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/9256/step=
s/15/logs/stdio
Similar to qemumips64

h) qemuarmv5 config fragment warning:
https://autobuilder.yoctoproject.org/typhoon/#/builders/160/builds/989

I've copied agl/arm people.

Probably nothing too surprising. I'll drop some of the patches whilst
we resolve these but see if we can keep the headers upgrade and the
point release bumps.

I'll try and test the crypto-dev upgrade on the list as that might help
that issue.

Cheers,

Richard



