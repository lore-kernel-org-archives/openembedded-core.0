Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D852CCCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 15:29:57 +0000 (UTC)
Subject: Re: [PATCH v7] kernel-fit-image: allow overriding DTB compatible string
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.111)
X-Originating-Platform: Windows Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 16 Oct 2025 08:29:48 -0700
References: <CAB3asfhhUoscOusRRkjWavdC3QvqROuo4WvZnVH2O0sCsuB1oA@mail.gmail.com>
In-Reply-To: <CAB3asfhhUoscOusRRkjWavdC3QvqROuo4WvZnVH2O0sCsuB1oA@mail.gmail.com>
Message-ID: <774.1760628588661308317@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 15:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224972

On Wed, Oct 15, 2025 at 10:43 PM, Adrian Freihofer wrote:

>
> What I don't quite understand yet is: Does this make sense from the kerne=
l or
> DTB perspective? Or are we circumventing problems that should be fixed on=
 the
> kernel or DTB side instead of overriding them on the Yocto side? I mean,
> wouldn't it make more sense to assign a compatible string that is useful =
for
> u-boot in the DTB without requiring FIT_DTB_COMPATIBLE_OVERRIDE?
> >=20
> >=20
> >
>

Hi Adrian,

Thank you for all your valuable reviews and inputs. After an internal discu=
ssion with our colleagues, we feel that the proposed change does not fully =
align with Qualcomm=E2=80=99s current approach to implementing DTB-only FIT=
 in the format expected by our UEFI bootloader. Given this, we=E2=80=99ve d=
ecided to hold off on upstreaming the change for now. Our plan is to first =
implement the DTB-only FIT support within our meta layer, refine it further=
, and then propose a solution to oe-core that support both kernel+DTB FIT a=
nd DTB-only FIT formats effectively.

Thanks,
Kavinaya

