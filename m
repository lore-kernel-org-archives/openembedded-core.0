Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D538DC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 22:40:00 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.26419.1738795193541895769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 14:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dprM+rHD;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3cfae81ab24so701085ab.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 14:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738795193; x=1739399993; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plhc/q7n49ZYaI36CmAilmZMOpbmwb8Ila/Zl8x4u98=;
        b=dprM+rHDVBhTWlBJmnGCr1hwRsi1jWorNTRyFavq8Agn87NHLjePegIESEB29nRoVs
         iAt69wV3EaLrH3l+ahIrRw/WFYWMGNfXIxH3Jk+yE5bt2eQEtCzdYvKBBHhr+aPOBHxE
         ExOvFI/KPmt9Z52Iyees+khMRWnKncXm846jyw4AcUSC1IeI2IX7LIgP8xCCd1fF5ggE
         kergUjmO2Dhiq95raYy5fGoqB5oIUf7xyV+7g7llTemVhP0Ov8H27c67lln7u4ck5ap5
         T+e6nNksHJlyZVrbSANdsKtP0AYgAi0XfZgWyFnzLR1uYqDzSTm0+ZEHyYVlfiuZudyq
         azuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738795193; x=1739399993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plhc/q7n49ZYaI36CmAilmZMOpbmwb8Ila/Zl8x4u98=;
        b=klJTjmUm2Yn/FLNakctDVhBGLw+sH/FyOF3j1YP5io25UbOvV6q01WnchlnPyKJsBR
         gEsi/E1k1pjVsEaHt1eVKodO+5cbn6/ZVmduqO282ybI8m+8Hg3kuie3pKGTZeVpJBMt
         g/URZvXiX+aq52Ya6dWkj/nfocAkPa6YXyLTmPlS06J4WdglxbQsvgm8HeFt3GO38neF
         lx5iviPffZEVNdeLWqjC0+a9AXB1E6xItd1ugRlOsw2jLZGjuyowdG7wFF4NZzz2jZtL
         mqYMpbOSJyhdDbgM1r5w+j9t7XYkj9TpPzXedtuh6YQ6U9rJCMA8KjYj0pdCWleoP4Np
         GAwQ==
X-Gm-Message-State: AOJu0Yx32sgbNv2ppgVgNO4GiPemWtC59vqCw/7wN5YKNg9HtXqZ1eqK
	iSYIPMLbmGzwGVCbHh5kx1XzmAzFXgCam6WFXDoFJtMlLUifiSUVNSDcRtDRBJbDUY3AO/7pDF/
	XBgw2gaFLD+k1dFzQRlc1zXBOj8M=
X-Gm-Gg: ASbGnctzYRILRyPwjPKN6v695izaQUlt8YCQjLDOUyy+f+X5AYGSQVIe0jIwjnjkFKM
	Ii7kyvk1ekIhOkHsX6ERChwXNofoeI32wO1sTvvO7RygX2OHzHHPMMyWVPuVkHjUXi9Z2WVW4
X-Google-Smtp-Source: AGHT+IEIrPoYqUapaY04AaiorkOadcAl7bEsfKZTjizCn/NEh8SHKrAp6EFHil2s5HTgUNWB3wO7fzzOXX8S13a9+bU=
X-Received: by 2002:a05:6e02:2610:b0:3cf:ba5:1ea3 with SMTP id
 e9e14a558f8ab-3d04f42562amr51309575ab.7.1738795192694; Wed, 05 Feb 2025
 14:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20250205212427.2044310-1-JPEWhacker@gmail.com>
 <CANNYZj9Ca6cQcFcb_moABSKX5=HtdRAzvL_ayyCg2cnkuEKcqw@mail.gmail.com>
 <CAJdd5Ga3VU_CW_Dw2TTacOEsACgMJE9i4SnVo4mrZ=tGMwc95A@mail.gmail.com> <CANNYZj-OZGfU8m-CG=M_tD50hcbzJyyyhopML61r44KFBEJ93g@mail.gmail.com>
In-Reply-To: <CANNYZj-OZGfU8m-CG=M_tD50hcbzJyyyhopML61r44KFBEJ93g@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 5 Feb 2025 15:39:32 -0700
X-Gm-Features: AWEUYZne5HWH9sf2tF5_D7KEefYJMp7yRq-OIG-15fsFyNzPqXY4bmTTO0GsZFE
Message-ID: <CAJdd5GYNEs6DR72cjdTyY1tof7YzMDMxQDKdetbv_x7oCJXAwA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Include fragments before local.conf
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 22:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210884

On Wed, Feb 5, 2025 at 3:26=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> One could conceivably want to ship a local.conf.sample template with frag=
ments already enabled in it, or hand edit local.conf to enable something vi=
a fragment. We can=E2=80=99t force users to use fragment tooling.
>
> It would be equally surprising to find out that setting fragments this wa=
y doesn=E2=80=99t actually have any effect.
>
> I understand your argument, it=E2=80=99s just that we=E2=80=99ve taken th=
e least worst option. Consider fragments as extensions of distro and machin=
e configurations - both come after local.conf and can=E2=80=99t be tweaked =
from it.

That's an expected design choice; we already have MACHINE and DISTRO
which work pretty well, so I though config fragments were intended to
standardize the part that is more difficult e.g. setting configuration
files from source control roundabout the time of auto.conf, since that
is where all the different mechanisms that have cropped up do.

>
> Alex
>
> On Wed 5. Feb 2025 at 22.55, Joshua Watt <jpewhacker@gmail.com> wrote:
>>
>> On Wed, Feb 5, 2025 at 2:36=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
>> >
>> > We have discussed this before. With this change, users will no longer =
be able to set fragments from local.conf, as addfragments would be processe=
d before that file. You need to use ?=3D in fragments instead for things th=
at are meant to be overridden.
>>
>> Is there need to set fragments from local.conf? IMHO, not being able
>> to override a fragment in local.conf is "surprising" behavior, and I
>> don't think it's going to necessarily be possible to alway use ?=3D in a
>> fragment; all of the ad-hoc "fragment" management systems I've used
>> before have allowed local.conf to be the final source of truth, so it
>> will also make migration to use config fragments harder if they don't
>> follow suite.
>>
>> Anyway, maybe some other users of "fragment" like systems can chime in
>> if they have an opinion.
>>
>> >
>> > Alex
>> >
>> > On Wed 5. Feb 2025 at 22.24, Joshua Watt <jpewhacker@gmail.com> wrote:
>> >>
>> >> Per some usability assessment and offline discussion, one of the usef=
ul
>> >> use cases of config fragments is that they allow the "default"
>> >> configuration for some device to be committed to source control and
>> >> easily selected and used by the end users. However, when doing this,
>> >> there is still the desire that the user can "override" the provided
>> >> fragments for their local builds in local.conf
>> >>
>> >> As a practical example, the configuration for a product can be captur=
e
>> >> as a config fragment, and an empty local.conf will reproduce the
>> >> standard build for the product. If the user wants to make "tweaks" to
>> >> the standard build, they can do so in local.conf
>> >>
>> >> As such, move the config fragments to be loaded before local.conf
>> >>
>> >> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> >> ---
>> >>  meta/conf/bitbake.conf | 3 ++-
>> >>  1 file changed, 2 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> >> index 8b607088c6e..d0154044f5a 100644
>> >> --- a/meta/conf/bitbake.conf
>> >> +++ b/meta/conf/bitbake.conf
>> >> @@ -826,12 +826,13 @@ FILESOVERRIDES =3D "${TRANSLATED_TARGET_ARCH}:$=
{MACHINEOVERRIDES}:${DISTROOVERRIDE
>> >>  require conf/abi_version.conf
>> >>  include conf/site.conf
>> >>  include conf/auto.conf
>> >> -include conf/local.conf
>> >>
>> >>  OE_FRAGMENTS_PREFIX ?=3D "conf/fragments"
>> >>  OE_FRAGMENTS_METADATA_VARS ?=3D "BB_CONF_FRAGMENT_SUMMARY BB_CONF_FR=
AGMENT_DESCRIPTION"
>> >>  addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS OE_FRAGMENTS_METADA=
TA_VARS
>> >>
>> >> +include conf/local.conf
>> >> +
>> >>  require ${@"conf/multiconfig/${BB_CURRENT_MC}.conf" if "${BB_CURRENT=
_MC}" !=3D "" else ""}
>> >>  include conf/machine/${MACHINE}.conf
>> >>  include conf/machine-sdk/${SDKMACHINE}.conf
>> >> --
>> >> 2.47.1
>> >>

