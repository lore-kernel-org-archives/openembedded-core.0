Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB65C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 17:25:46 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.21705.1670261138799251522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 09:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P8IODIeZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1322d768ba7so14262004fac.5
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 09:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+tzI7KqzA2bXEwJbqkf5hiSc+qY2nRXWT4XLXzGFNk=;
        b=P8IODIeZ6cE97o38Gz9bjAzfyxmpOiOVz1uf9m4NEskHUuaonRCzAtTJ0cjgtGOpp+
         xVBtw/5xXIeaS50tmhS8Eu+Vc5OCiuRB3VkuHuChEtplN1fFObg4WGsSzxkyfJPzKeSE
         YGkuFAiMJqIfA5xY0x+oW6y3JXicwMnnpY9w3efvIPipK++VZSrntxaQtf2Ja/x9gwQ/
         dUYdIBaIu8EcFoNQsS6KFXUWTUo6Kb1qO/BFXLewZcxGUyBfsDqc4KUpouWzVDxBSLPa
         ehTz6rZ5WEtbtLtFetg4OqARxDRacD+YAPPhi8/vB0ys6ySpBKqBHDc1DYWqVMx0dw3X
         r1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+tzI7KqzA2bXEwJbqkf5hiSc+qY2nRXWT4XLXzGFNk=;
        b=6vrjVlCx8hHG/FG2zV1ZgYnNO+B2mI3WOeTtLUkkzIc5Y8Lal8gf8XszQBrFGoGqYJ
         pwQ5ZGcIkIeBTyhw0PHXJX/DnYFrR7eXYOxBMpw0QiZoq1IoCw4A++VQ9N8schDDHfDF
         U77S6nb3o5059tmUyKIuRaIEB2fzD4OjOEqO/9rx1d5qmyRSiO5HJzGezprPmKWEKy3C
         vWXV1muZlKX1+DSPN948uExxf/YyVeeEjs6mwJy+zKwVdAqRsopb0yHZw3Y2Xh/kzc0F
         Q9vNE6wF90QlOSGPI0qfMQ6yN+2ql58ztvEEk6IYX9nGBUauzQAmf02m+SVZZlt1fkTl
         1JJA==
X-Gm-Message-State: ANoB5pnqIGvQGAnmNVVoPYkYVWQFJWzZ10uHjHUaAqXbgPVMolnTfpMN
	TGkylOYiXrTlBrSyGmuaPxCj7n7YF/9zHz0x9vk=
X-Google-Smtp-Source: AA0mqf7jczYswJNxNVC29NjQlRQ8ziujTQJ2ErH4rDkv93Ww7fswxhvv5PJttPaFs7PsaUiTqwumg9ShTj08nrFj6y8=
X-Received: by 2002:a05:6871:4199:b0:142:d126:dc55 with SMTP id
 lc25-20020a056871419900b00142d126dc55mr36263505oab.262.1670261137924; Mon, 05
 Dec 2022 09:25:37 -0800 (PST)
MIME-Version: 1.0
References: <CY4PR1101MB21833846A4FBE3749853564DEB189@CY4PR1101MB2183.namprd11.prod.outlook.com>
 <f303f240-9ff8-2087-e5a9-237668caca1a@windriver.com>
In-Reply-To: <f303f240-9ff8-2087-e5a9-237668caca1a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2022 09:25:11 -0800
Message-ID: <CAMKF1srqFWaN-p8f=k0eKcdPRRdapo7hsGC5ALRw=arBeJmjgg@mail.gmail.com>
Subject: Re: GCC Patch Tracking
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Shinde, Yash" <Yash.Shinde@windriver.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 17:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174295

On Mon, Dec 5, 2022 at 5:48 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Let's keep the discussion on the list to give everyone a chance to know w=
hat's going on and to contribute.
> Oh and please use in-line email instead of attachments when possible.
>
> Also add Khem who is the author of many of these patches. Hopefully he ca=
n
> help us clean-up the status and advise about which 'Pending' patches are
> candidates to send upstream.
>
> On 2022-12-05 08:06, Shinde, Yash wrote:
>
> Hi Richard,
>
> PFA  document for GCC patch analysis. There were about 28 patches in GCC =
sources out of which 3 patches are with the upstream status of =E2=80=98Sub=
mitted=E2=80=99 and other 10 are =E2=80=98Pending=E2=80=99.  I had analysed=
 the current status of these patches by checking them with the GCC patch li=
st and archive list and documented the same in the attached document.
>
> Out of the 3 patches with =E2=80=98submitted=E2=80=99 as the status,
>
> - The 1st patch is submitted but changes are not reflected in the upstrea=
m. (hardcoded-paths.patch)
>
> - The 2nd patch is not found in the upstream (0014-Don-t-search-host-dire=
ctory-during-relink-if-inst_pr.patch), was not found in patch list or archi=
ve list and
>
> - For the 3rd patch 1 hunk taken to upstream and can be marked as 'backpo=
rted' and the other hunk is not taken to upstream yet. (prefix-map-realpath=
.patch)

Did you check upstream master branch of gcc ?

>
> All the patch links are given in the doc.
>
>
> GCC 12.2 Patch Analysis
>
> hardcoded-paths.patch:Upstream-Status: Submitted [https://gcc.gnu.org/pip=
ermail/gcc-patches/2022-August/599882.html]
> ->Patch is submitted but changes not reflected in upstream
>
>
>
> 0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch:Upstream-=
Status: Submitted
> ->not yet submitted to upstream but link provided here- http://lists.gnu.=
org/archive/html/libtool-patches/2011-01/msg00026.html
>
> prefix-map-realpath.patch:Upstream-Status: Submitted [https://gcc.gnu.org=
/pipermail/gcc-patches/2022-August/599885.html]
> ->1 of the 2 hunks of patch send to upstream and other is not included. L=
ink- https://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg294480.html
>
> 0013-Ensure-target-gcc-headers-can-be-included.patch:Upstream-Status: Pen=
ding
> ->not yet submitted to upstream
>
> 0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch:Upstream-St=
atus: Pending
> ->not yet submitted to upstream
>
> 0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch:Upstream-=
Status: Pending [should be submittable]
> ->not yet submitted to upstream
>
> 0002-gcc-poison-system-directories.patch:Upstream-Status: Pending
> ->not yet submitted to upstream
>
> 0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch:Upstream-Sta=
tus: Pending
> ->not yet submitted to upstream
>
> 0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch:Upstream-=
Status: Pending
> ->not yet submitted to upstream
>
> 0008-libtool.patch:Upstream-Status: Pending
> ->not yet submitted to upstream
>
> 0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch:Upstream-=
Status: Pending
> ->not yet submitted to upstream
>
> 0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch:Upstream-=
Status: Pending
> ->not yet submitted to upstream
>
> 0006-cpp-honor-sysroot.patch:Upstream-Status: Pending
> ->not yet submitted to upstream
>
>
>
>
> For the patches with =E2=80=98pending=E2=80=99 as the status, they are pe=
nding from quite some time. Should we contact the author of the patch or th=
e community for these patches?
>
> Please guide me on how to proceed further in GCC patch analysis and what =
are the next steps.
>
> Let's see what Khem has to say about his collection of 'Pending' patches.
>
>
> Thanks Yash,
>
> ../Randy
>
>
> Regards,
> Yash Shinde
>
>
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux

