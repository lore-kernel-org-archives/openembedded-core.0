Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC802C63797
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 15:19:24 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.15046.1675178359259648686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 07:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b+gNmFnr;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id k4so37112216eje.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 07:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLxEwTRkTsYyHOEOmiuQ7C6Rz9qlDtG5re0LInPpkRk=;
        b=b+gNmFnrFy1vbwOeaY5hY2NlyR/CGtdU9m1QSLMOoXzq9ATjk06OQTnB8dQpaBQnfh
         K7nn4oJZDTVluZcuLfk68zdTwmdaFfhDD9/PgfuGquhus+eVd7HIpV4A+/50SINtdPV6
         VxVhKnKZVq3Mp0zif0ElAePeivI9hGDq3OcZkSMB16F+npaJATotrKVSCnPu+LZ5fEF9
         Mgv0k0AchRR/Wj8PwJGjoC6EAkpHe+NGVTdNiRNHDNanMeumH51AHX5LcXdKViPWJQl8
         wGGB1LOwxjYU4t/oJll4iMl4Pk+pkX4A1JM7AzYipJTtxxN9RMU3p/0uoaPMYW/vc0nL
         2Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLxEwTRkTsYyHOEOmiuQ7C6Rz9qlDtG5re0LInPpkRk=;
        b=ki7lLJ3x5t/EyP/jT9fHnyS+eLsv5sfXRaS9+Nv5FWGs3C1NKuWygNxkQHAoaiZBUf
         g4yf8NJFSu/N56bXy7OHQIqxqKmcbFTCN8uSTftbjUUY/9Bia+0mXYu1OuViEGZEWA+q
         +NuSMFoDva0vI9wBS+MFFwLzactBSfv4UNt1NN0giu8B+pax2RqXIac4vl6yU86h7TV8
         Ero7lc3YaPZofnoFTmf1d2kRP6OW2tmIZFTQRaQnn6/aVkcPfb1t6zAgckQApM73v8h7
         S3NmMH+bG3nGUZSkecRHu8xeBmQQgBhEnauGRHXCELY1kdvc+XUuxMNePLvMMhbmfSeQ
         cawg==
X-Gm-Message-State: AFqh2kpucsSShpWdZQ1ZWHDpYufT59HBcbfI15Nmp5+7/ftUIeMQJpMX
	0Tn6D/OXJaJfNWc2i231H44zIbNY6M6St09vV5tElq9srPY=
X-Google-Smtp-Source: AMrXdXvaE/5sHEFBOKMZn2aPcx5K0IQ9nCWmIB5pFq4jjL9t6UgqsugSSP5Jx5zlcZZ5ia8yxGcNnivKhbhm3Z9mveI=
X-Received: by 2002:a17:907:c928:b0:85e:4218:c011 with SMTP id
 ui40-20020a170907c92800b0085e4218c011mr8435009ejc.258.1675178357344; Tue, 31
 Jan 2023 07:19:17 -0800 (PST)
MIME-Version: 1.0
References: <0dbb01d9357e$5e847230$1b8d5690$@gmail.com>
In-Reply-To: <0dbb01d9357e$5e847230$1b8d5690$@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Jan 2023 16:19:05 +0100
Message-ID: <CANNYZj99OYt9uCw34eX_d+73cZcJaCutQqjQ32kiPs64_xz=JQ@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 31 January 2023 (WW05)
To: Stephen Jolley <sjolley.yp.pm@gmail.com>
Cc: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 15:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176522

On Tue, 31 Jan 2023 at 15:14, Stephen Jolley <sjolley.yp.pm@gmail.com> wrot=
e:
> Key Status/Updates:
>
> YP 4.0.7 and YP 4.2 M2 are in QA
> We switched to the 6.1 kernel by default for M2. Unfortunately there are =
a couple of intermittent issues that seem to have crept in. One is a reprod=
ucibility issue in perf, likely with some host component causing it as it o=
nly occurs on second builds. The second appears to be an intermittent netwo=
rking issue accessing a python http-server for testing dnf which appeared a=
fter the kernel version change.
> We are continuing to see other intermittent failures which are limiting h=
ow quickly we can merge changes. A summary of some of the key issues was se=
nt to the mailing list: https://lists.openembedded.org/g/openembedded-core/=
message/176476
> There have been changes to the way the codeparser cache in bitbake stores=
 data which should reduce cache size, reduce the times data needs to be wri=
tten out and generally help performance.
> CVE levels in master are still high but there are patches in progress for=
 most issues as I understand it.
> We have a growing number of bugs in bugzilla, any help with them is appre=
ciated.

Please do notice there's a new public article by RP:
https://www.linux.com/audience/maintainer-confidential-opportunities-and-ch=
allenges-of-the-ubiquitous-but-under-resourced-yocto-project/

"Maintainer confidential: Opportunities and challenges of the
ubiquitous but under-resourced Yocto Project.
Maintainers are an important topic of discussion. I=E2=80=99ve read a few
perspectives, but I=E2=80=99d like to share mine as one of the lesser-known
maintainers in the open source world."

LWN has picked it up as well:
https://lwn.net/Articles/921646
(many of the comments are the usual 'yocto is hard' fare, which should
be treated like the weather - inevitable)

Alex

Alex

