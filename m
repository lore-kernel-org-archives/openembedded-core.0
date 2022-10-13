Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CD2C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 05:49:30 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.4252.1665640163668751335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 22:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DuBiz+9j;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id j4so957432lfk.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 22:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmgJVrcRXrUAma8mmv5OeiBbv1RPpDFIo5tUIeIyc+8=;
        b=DuBiz+9jq8iKXCbsAUp0VsGwqWQJu7KXtuijon7uCqgaHs3KR4AVAvPePv907Oep9E
         OkRKPl1LqeMIB3o60uA3QdcK+PN82CBAm53MUNWJXcKMXCC2MkhWK+wCyPSHb1d5fYSI
         TpNfCiotr8bKCXux1CMXLgofxxAuC/KB3TcA7UZe7S0eHQH8weR9klNCrmXj3g/vfQIt
         g5xWmzGLu2khn+PxQsUxWZy0g3Wo6UOce/ZokHMAJfoMGLP9Om5i+R/c9Xz+nGVqEolc
         ZFRYv6L60xtpr+yqIkArNp0tnVI8x0wq2Q89A9emorkqTRpwjOfH5vqxBdl1v53DqYC7
         zNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmgJVrcRXrUAma8mmv5OeiBbv1RPpDFIo5tUIeIyc+8=;
        b=eEmCZLLXllI4tousC5m6/vS3bLDTzEhiUCGuEGqCXQxTCqsYlH9UXVwtpij8KC/2n0
         cjd2//Ldg5Pzhx4DhuLNcQwQVRzb9P0RQ5rIaFNE9PTOzzioiVOzlA05qZrqbY0Fyye4
         Nr7lnOlugjAsP8VONs3e/vOa+txQ1erJIHBupKphfuuXoE4FLhiV/6TzCPfrFoAXd1mH
         QZOzK57VwLAEMtyFsiEnQ0Oa7A+r5THd7sBqp/OdCdVM12wgWUhzb6UtLs/DvZNSX+p2
         ZN0hYZJiTRkqlqD3alenViQ1eEu73EgsoRQyGpclp6U1YSAg81EYPh/9+5iphQVI5N0E
         ZPlg==
X-Gm-Message-State: ACrzQf1/LJeERRf+NcFcYs0GeotOzsFLeWUbX6O5PmRKh8lRSDr+/9Q6
	sFgCCKBr8UtqXhYLnVfDqzU/t2iMJMbC1bV4E8o=
X-Google-Smtp-Source: AMsMyM4BEcqnEXDuwk12tkPvighQaWt0WctIEzyhOPZtP8fS0/SL0AvkjDRfp3FJKObT19g0qQrO2KzfRJE/4OMWjo0=
X-Received: by 2002:a05:6512:1699:b0:4a2:1924:af2a with SMTP id
 bu25-20020a056512169900b004a21924af2amr11435673lfb.491.1665640161619; Wed, 12
 Oct 2022 22:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <233c014c169e00e6a9ce464f3ab2bf79@pianon.eu> <1E128F9E-4B95-43D4-BD73-915FECB99774@arm.com>
In-Reply-To: <1E128F9E-4B95-43D4-BD73-915FECB99774@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 13 Oct 2022 07:49:09 +0200
Message-ID: <CAApg2=TAQe66J6T7HN7jzPXWnBc0U7GSWpA5MAooNxcTw0N_RQ@mail.gmail.com>
Subject: Re: [OE-core] severe issue in CVE checker
To: Ross Burton <ross.burton@arm.com>
Cc: "alberto@pianon.eu" <alberto@pianon.eu>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"marta.rybczynska@linaro.org" <marta.rybczynska@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Carlo Piana <carlo@piana.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 05:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171681

Reported as https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14929

On Wed, Oct 12, 2022 at 6:29 PM Ross Burton <ross.burton@arm.com> wrote:
>
> On 12 Oct 2022, at 08:25, Alberto Pianon via lists.openembedded.org <albe=
rto=3Dpianon.eu@lists.openembedded.org> wrote:
> >
> > It iterates over NIST CVE db years, but if some year fail to download, =
it goes on anyway, and it still merges the successful downloads into nvdcve=
_1.1.db, without returning error.
> >
> > IMHO this is a severe issue because it may silently lead to false negat=
ives in the CVE check. If some downloads fail due to timeouts or other conn=
ection problems, cve-check should retry a number of times, and if any downl=
oad still fails, cve-update-db-native do_fecth should fail, and it turn all=
 do_cve_check tasks should fail, since doing a CVE check against a corrupte=
d/incomplete CVE database is clearly useless
>
> Yes, that=E2=80=99s a bug.
>
> Please do file a bug (bugzilla.yoctoproject.org), and ideally send a patc=
h if you can.
>
> Ross
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171668): https://lists.openembedded.org/g/openembedde=
d-core/message/171668
> Mute This Topic: https://lists.openembedded.org/mt/94276393/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ry=
bczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

