Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F7BC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 10:29:35 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.5522.1643365774006302748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 02:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z8t7pgb3;
 spf=pass (domain: gmail.com, ip: 209.85.217.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id l14so2422596vsm.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 02:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9PasXJ/yqMIF+WA8w7Id4AfXfpEzyK+grr8j5np02i0=;
        b=Z8t7pgb32wHGt51o14HSmTUebUe5TYkpkb+urIWSmGEjEL699ClHBpZ8eeQlm53DVc
         fP9XDawYPiw4xdYUzfVsOGPBOhPeu+ocYYxpg6SUOOW/0iS0zCrCNhmWnJ4BYviRgVDf
         7q/BHUFwn+szDrpzrjBA1lpTdA7Bu4Fx/mP6UD7IsS2Ic6EfSmunodwwyAHIW1Kn4nU9
         aDyylS+UeqEwe6BHH8n9GOhRSyPYSY6ZIoHA0sIbK6UXTgRZgKaJZLl4KuraDIb3RSVB
         GbSuxYxKL+bVRTR6GQZno4VLCO3Mif6OXJIQibSHGjDdsjUR8F61E5NPC68jNn1kSFhG
         3qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9PasXJ/yqMIF+WA8w7Id4AfXfpEzyK+grr8j5np02i0=;
        b=PtFMENkLsoR5n1x1q2j1HEkhPqKTEuGMMunAVai0U+CBGpOKoXM4p7nOkJgcjK7Xdb
         ekXc9MxIBk48zy00OMobhsCDpFnJaHv8kBDvE+wGKSKok/soyLHBiuiu+OqUUzXt5gEF
         qG5ix1+Jl67TTu3wHow8KMJOhdI8ZSPfK4AtGtc35XHiQH2RaTNwYIdAQ4PthffSaNpQ
         fmM3XR1RAGnRfZXE1r11vh+P36UrRiARiNOxvW57t8mLu4Erma8NHouSVlmn0vk1Z5Q1
         Z4SkDeE/dvZ8vi5Ncwd86qMxq4zDBfH8SRHCtedMixidrayCgNFJ+V9f8wS0mJBqMpAo
         6QVw==
X-Gm-Message-State: AOAM533Sdf8+Q2yi+ZTVBkt7LbHnj9G0uALm6WFFq1wo3q7+K65ploXD
	N6pEXBQtk9RUiSraxGwWIFTP4s3sDcLB9d6KoWo=
X-Google-Smtp-Source: 
 ABdhPJw9xCaHK7NBTRV37OUSqFxLRS9okXFoahSWqMiDrZGM4Jii70a6t35V0KY3hSeuRt2+6Tg42IS1hv8oQxQwTMU=
X-Received: by 2002:a05:6102:22d1:: with SMTP id
 a17mr2653045vsh.42.1643365773029;
 Fri, 28 Jan 2022 02:29:33 -0800 (PST)
MIME-Version: 1.0
References: <fd53e270-fe25-c1ad-522a-8444ca8ba642@windriver.com>
In-Reply-To: <fd53e270-fe25-c1ad-522a-8444ca8ba642@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Jan 2022 11:29:21 +0100
Message-ID: 
 <CANNYZj8-SNPbD0Mbmbe-BovkrDTLH8dQYijvDjoqPDo2Mnjd=w@mail.gmail.com>
Subject: Re: [OE-core] About the sstate cache directory hierarchy
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000023361f05d6a1e9fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 10:29:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161075

--00000000000023361f05d6a1e9fa
Content-Type: text/plain; charset="UTF-8"

I do like the idea; not everyone has a pcie gen4/5 ssd for builds, or
rigorously trims sstate on a schedule. But there may be consequences or
regressions, maybe RP will immediately shoot it down :)

I would however still place a single level of hash[:2] *under* the
pn/task/, to avoid too many files piling up in a single directory.

Can you send this as an RFC patch?

Alex

On Fri, 28 Jan 2022 at 08:06, Chen Qi <Qi.Chen@windriver.com> wrote:

> Hi All,
>
> I'm sending out this email because I'm wondering if we can change the
> sstate cache directory to use ${PN} and taskname as subditories. Hope to
> hear your opinions.
>
> Below is the long story.
>
> Recently I noticed that running `bitbake xxx -c cleansstate' usually
> takes more than 10 minutes.
>
> After some investigation, I can see that most of the time is spent on
> file searching. This is because we have:
>
> SSTATE_PATHSPEC   =
>
> "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}${PN}/${SSTATE_PATH_CURRTASK}/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*"
>
> And our sstate cache directory's hierarchy uses hash[:2]/hash[2:4]/ as
> sub-directories.
>
> This essentially means that all sub-directories are searched. This would
> take a long time, especially when run for the first time. I made some
> changes to  output the time and the logs are as below.
>
> $ bitbake glibc -c cleansstate
> WARNING: glibc-2.34-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 611.8865714073181 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.3219327926635742 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package_qa.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.470815658569336 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_package_write_rpm.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.251939058303833 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_packagedata.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.2369801998138428 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc::2.34:r0::7:*_populate_lic.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.1668426990509033 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_populate_sysroot.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.385568380355835 seconds
> WARNING: glibc-2.34-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64-poky-linux:2.34:r0:core2-64:7:*_stash_locale.tar.zst*
> WARNING: glibc-2.34-r0 do_cleansstate: Took 1.4884181022644043 seconds
>
> I figured that unlike git, we do have knowledge on our sstate objects.
> It does not seem necessary to use hash value as sub directory. So I
> changed the sstate directory hierarchy to use ${PN}/taskname/ as sub
> directories, and here's the result.
>
> $ bitbake libgcc -c cleansstate
>
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/deploy_source_date_epoch/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.020630598068237305 seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0011608600616455078
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_qa/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_qa.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007557868957519531
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_write_rpm/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_write_rpm.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0013995170593261719
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/packagedata/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_packagedata.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007488727569580078
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_lic/sstate:libgcc::11.2.0:r0::7:*_populate_lic.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0005896091461181641
> seconds
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing
>
> /ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_sysroot/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_populate_sysroot.tar.zst*
> WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.00080108642578125 seconds
>
> It's much faster.
>
> In addition, the sub dirs now give more info, which should potentially
> make sstate cache easier to manage.
>
> Attached is the patch to quickly try things out. Hope to hear your
> opinions.
>
> Best Regards,
>
> Chen Qi
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161067):
> https://lists.openembedded.org/g/openembedded-core/message/161067
> Mute This Topic: https://lists.openembedded.org/mt/88740516/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000023361f05d6a1e9fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I do like the idea; not everyone has a pcie gen4/5 ss=
d for builds, or rigorously trims sstate on a schedule. But there may be co=
nsequences or regressions, maybe RP will immediately shoot it down :)<br></=
div><div><br></div><div>I would however still place a single level of hash[=
:2] *under* the pn/task/, to avoid too many files piling up in a single dir=
ectory.</div><div><br></div><div>Can you send this as an RFC patch?<br></di=
v><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, 28 Jan 2022 at 08:06, Chen Qi &=
lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi All,<br=
>
<br>
I&#39;m sending out this email because I&#39;m wondering if we can change t=
he <br>
sstate cache directory to use ${PN} and taskname as subditories. Hope to <b=
r>
hear your opinions.<br>
<br>
Below is the long story.<br>
<br>
Recently I noticed that running `bitbake xxx -c cleansstate&#39; usually <b=
r>
takes more than 10 minutes.<br>
<br>
After some investigation, I can see that most of the time is spent on <br>
file searching. This is because we have:<br>
<br>
SSTATE_PATHSPEC=C2=A0=C2=A0 =3D <br>
&quot;${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}${PN}/${SSTATE_PATH_CURRTASK=
}/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*&quot;<br>
<br>
And our sstate cache directory&#39;s hierarchy uses hash[:2]/hash[2:4]/ as =
<br>
sub-directories.<br>
<br>
This essentially means that all sub-directories are searched. This would <b=
r>
take a long time, especially when run for the first time. I made some <br>
changes to=C2=A0 output the time and the logs are as below.<br>
<br>
$ bitbake glibc -c cleansstate<br>
WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64=
-poky-linux:2.34:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst*<br>
WARNING: glibc-2.34-r0 do_cleansstate: Took 611.8865714073181 seconds<br>
WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64=
-poky-linux:2.34:r0:core2-64:7:*_package.tar.zst*<br>
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.3219327926635742 seconds<br>
WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64=
-poky-linux:2.34:r0:core2-64:7:*_package_qa.tar.zst*<br>
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.470815658569336 seconds<br>
WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64=
-poky-linux:2.34:r0:core2-64:7:*_package_write_rpm.tar.zst*<br>
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.251939058303833 seconds<br>
WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64=
-poky-linux:2.34:r0:core2-64:7:*_packagedata.tar.zst*<br>
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.2369801998138428 seconds<br>
WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc::2.34:r0=
::7:*_populate_lic.tar.zst*<br>
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.1668426990509033 seconds<br>
WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64=
-poky-linux:2.34:r0:core2-64:7:*_populate_sysroot.tar.zst*<br>
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.385568380355835 seconds<br>
WARNING: glibc-2.34-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-64=
-poky-linux:2.34:r0:core2-64:7:*_stash_locale.tar.zst*<br>
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.4884181022644043 seconds<br>
<br>
I figured that unlike git, we do have knowledge on our sstate objects. <br>
It does not seem necessary to use hash value as sub directory. So I <br>
changed the sstate directory hierarchy to use ${PN}/taskname/ as sub <br>
directories, and here&#39;s the result.<br>
<br>
$ bitbake libgcc -c cleansstate<br>
<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/deploy_source_date=
_epoch/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_deploy_sour=
ce_date_epoch.tar.zst*<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.020630598068237305 seconds=
<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package/sstate:lib=
gcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package.tar.zst*<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0011608600616455078 second=
s<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_qa/sstate:=
libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_qa.tar.zst*<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007557868957519531 second=
s<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_write_rpm/=
sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_write_rpm.=
tar.zst*<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0013995170593261719 second=
s<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/packagedata/sstate=
:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_packagedata.tar.zst*<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007488727569580078 second=
s<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_lic/sstat=
e:libgcc::11.2.0:r0::7:*_populate_lic.tar.zst*<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0005896091461181641 second=
s<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing <br>
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_sysroot/s=
state:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_populate_sysroot.ta=
r.zst*<br>
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.00080108642578125 seconds<=
br>
<br>
It&#39;s much faster.<br>
<br>
In addition, the sub dirs now give more info, which should potentially <br>
make sstate cache easier to manage.<br>
<br>
Attached is the patch to quickly try things out. Hope to hear your opinions=
.<br>
<br>
Best Regards,<br>
<br>
Chen Qi<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161067): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161067" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161067</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88740516/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88740516/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000023361f05d6a1e9fa--

