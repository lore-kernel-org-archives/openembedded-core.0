Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96FFC761AF
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 18:03:46 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.3830.1680113022920348115
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 11:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q9JJDhrN;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id r40-20020a05683044a800b006a14270bc7eso5318559otv.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 11:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680113022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhbTzG2tUdGmCeWzLPpPbb0A4pu/LJaNRsX1YHV69Ds=;
        b=Q9JJDhrNMBgDt+Z6J9ZDfYO9CSVwEv0V/3i6kKwy+c8HNQfQPB8USpm1rmbVuz4A/y
         kHkIdUD3n0sa8S86YnamX5e8jQVeCWpvCuNMUlid0tL6NEhZHUWaBI0AvRv04Dm2MTc2
         mobdhJZy/R5fKsZhLDMaoWEGNx8uZFQs4DArOEr11+RR78D9DunJIAnugfY8qmePHNfj
         dzWSGEO8UTz3duhH2EDeHsmsEf0LshCr7HUyTz16DHoG7juCVtH5fyDPm6IzOkkauZF5
         vqq89cNXNZncFGIgeDWRlX8urPVKK21G2uYMoC/hnXeAMUZA9tW+r/pzytJcJs2eWA46
         zVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680113022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhbTzG2tUdGmCeWzLPpPbb0A4pu/LJaNRsX1YHV69Ds=;
        b=UbMJnLvf5FT6Tci6tEum8jF1Fwkr8zgLeEl8jiEZckcfE4vgkevM10f+bauhd4laKS
         U1OVYgilpJB3l6JPJNSTUJfSq2CHzA/HP+oGp1rWIiSsg/ggbwkajk3TsSf4EwFZsjA/
         sPLlO70eTo7F5wUMLNYudOOEmRJMjKrWbV+9YyFWyiV5n21dBm87diFek55ylXAXnA6g
         Lyjlr/hzS2W1Chgp2eWJr8i+0BYpdbdFid/nloLiNfp3fudiIeuYT/xtLMQdnTSnQiyM
         8GqRqvXdI3w/8DHuNVk83H84sQHuBeDRlfYCn0ec/9R8Mmdj9cfJrlERCZLqTrlaW/51
         NJ5g==
X-Gm-Message-State: AAQBX9dcz6foLrvtywW7waMVTXanq09orLACPcMPzu24ma+S5OsQYv6t
	yQbvVzp5Ra4fUU3fKMKRrRdH2A3qvhwmQ+H9TF0=
X-Google-Smtp-Source: AKy350YMgE/TtKABu8QwTIdPZpmktCX5RDX45RB59QUavR1yrgxbGZwY55cFtnWo8+0mMJqM2AVL1fMXXx66wrrzESQ=
X-Received: by 2002:a9d:6ad3:0:b0:6a1:4c0e:1268 with SMTP id
 m19-20020a9d6ad3000000b006a14c0e1268mr3070006otq.2.1680113022158; Wed, 29 Mar
 2023 11:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR11MB28862F0807337647C5351586C2899@BYAPR11MB2886.namprd11.prod.outlook.com>
 <BYAPR11MB28862F6E6A1DFB11BFFB0FB9C2899@BYAPR11MB2886.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB28862F6E6A1DFB11BFFB0FB9C2899@BYAPR11MB2886.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Mar 2023 11:03:16 -0700
Message-ID: <CAMKF1sq0z7KDh1F243rKKCPr2x2thwvWrx68uw93spkx-2z1=w@mail.gmail.com>
Subject: Re: [OE-core] Build error with dunfell release "yocto-3.1.24"
To: gauragup@cisco.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 18:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179293

On Wed, Mar 29, 2023 at 9:51=E2=80=AFAM Gaurav Gupta (gauragup) via
lists.openembedded.org <gauragup=3Dcisco.com@lists.openembedded.org>
wrote:
>
> Hello,
>
>
>
> On latest =E2=80=9Cdunfell=E2=80=9D branch, there=E2=80=99s a compiler wa=
rning/error when building QEMU.
>
>
>
> The patch for CVE-2021-3929 applied on dunfell returns a value for a void=
 function: https://github.com/openembedded/openembedded-core/blob/dunfell/m=
eta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch#L58
>
>
>
> This results in the following warning/error:
>
>
>
> <ws>/qemu/4.2.0-r0/qemu-4.2.0/hw/block/nvme.c:77:6: error: void function =
'nvme_addr_read' should not return a value [-Wreturn-type]
>
> return NVME_DATA_TRAS_ERROR;
>
> ^      ~~~~~~~~~~~~~~~~~~~~
>
>
>
> In newer versions of qemu, the functions is changed to have a return valu=
e, but that is not present in the version of qemu used in =E2=80=9Cdunfell=
=E2=80=9D.
>
>

yeah perhaps we need to backport
https://github.com/qemu/qemu/commit/94cbcf530f9d9789b75ef1ae227ba4a4f702bf7=
d
as well.

https://github.com/openembedded/openembedded-core/blob/dunfell/meta/recipes=
-devtools/qemu/qemu/CVE-2021-3929.patch#L58

>
> Thanks,
>
> Gaurav
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179292): https://lists.openembedded.org/g/openembedde=
d-core/message/179292
> Mute This Topic: https://lists.openembedded.org/mt/97933015/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

