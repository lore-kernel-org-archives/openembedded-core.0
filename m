Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8D3CA0EE1
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 06:09:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6855.1724998146207147785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 23:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iZaCQnxI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bbbff40bbso2204865e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 23:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724998145; x=1725602945; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=537QUViuhtt0I/jQMzclhAi1kpOddvqBOnnIcg4b8Bs=;
        b=iZaCQnxIpO+smEjDQQi3hEakZu1A/iN+JhcMaQgo/68iGxDx3bcbJ3rX/ZN563zJ7S
         nOd4HvcqKRQHzEf+9+UugLTzNYKxoIke3soCsHy8DvXK6Pe6CbnYEhQ0xiGpRdSr7QUY
         aBjyi5tk5eteQrq1Dtl3jj1C8deCrJILJ78tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724998145; x=1725602945;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=537QUViuhtt0I/jQMzclhAi1kpOddvqBOnnIcg4b8Bs=;
        b=u5PtubLf5ujea8re4WHUlOt4BLYg8l0CtQdpQ8DlxfhTQebtC4qgEq7SPWmlwMDRMt
         ynJ41rXZ7mhYU4pRJS4ASSOBIVSkWMB1C1Jtb1vMTiYwf0cylrF8txopoygH9ocA7Ebw
         NHcgOvBenygTi1UFXxnQYVCtpSofQc7CDVygvDv5uISijIXgjgDMynnBpdvwt3Pr1q+J
         mAguYGFBU4VPIcr+r9+l7havdwMV9J4SSkO2FgeOoqaQToULbCNOc132WwpuHFL5YMMG
         11fNiViEC8q4H/BYoPf8bmCZ3eotEHWeFAwi9IXeWrcfv6dGBgBgZBGy+OgsEmc1AV5T
         HOUg==
X-Forwarded-Encrypted: i=1; AJvYcCUIwI3TCwqb9JDY+GUAKARlyUG/GvebPfKjFD/CqW/15Pz9Kqm5YbHAMNwxXDY7aZhRW/zwTb/3B4DiuXHYuhRlkg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx84BI6vEu9u++uxJNGDWmCqv5RKyjmBoWctrlDe3mWa2czxRI0
	PhXEjWz89dewqFYT+HDcFW32po42nM3l6iLvfz4TDs3hLgGnaDMBTbsr9bzDHXQ=
X-Google-Smtp-Source: AGHT+IFYd88oMmj2hAPk7G2LD+LA8ead5s5oOMp7LTADkvgrw9oXSDw9YycL2wL16u2LH6uTsiN0+Q==
X-Received: by 2002:a05:600c:3c9e:b0:426:627e:37af with SMTP id 5b1f17b1804b1-42bbb10d2d5mr7674145e9.3.1724998144431;
        Thu, 29 Aug 2024 23:09:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c1e:eed1:2e30:722b? ([2001:8b0:aba:5f3c:c1e:eed1:2e30:722b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb9ff0acdsm15187265e9.38.2024.08.29.23.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:09:03 -0700 (PDT)
Message-ID: <64c0811f16f7b9af17c4f493af3080befc1bb1b7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.04 -> 3.10
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mr.name@web.de, openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2024 07:09:02 +0100
In-Reply-To: <18822.1724963809858109674@lists.openembedded.org>
References: 
	<CAMKF1srySLdab0SR9map64pZ9nvGVzsE=K13hqUs_J-RqTi62g@mail.gmail.com>
	 <18822.1724963809858109674@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 06:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203952

On Thu, 2024-08-29 at 13:36 -0700, Sven Reschke via
lists.openembedded.org wrote:
> > On Thu, Aug 29, 2024 at 1:52=E2=80=AFAM Richard Purdie via
> > lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@...> wrote:
> > > On Mon, 2024-08-26 at 12:01 -0700, Sven Reschke via
> > > lists.openembedded.org wrote:
> > > > Hi Alex and Alexandre,
> > > >=20
> > > > sorry for the delay.
> > > > I've created a PR on Github on top of your latest changes:
> > > > https://github.com/Nanowires/oe-core-clone/pull/1
> > > I did try this on our automated testing and there were some
> > > issues:
> > >=20
> > > musl build failures:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/944=
0/steps/11/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/945=
6/steps/11/logs/stdio
> > This can be fixed by using realpath(path, NULL) API instead of
> > canonicalize_file_name(path), we have done such changes
> > in few packages e.g. elfutils
> >=20
> > https://sourceware.org/git/?p=3Delfutils.git;a=3Dcommitdiff;h=3D06263dd=
a990be6778a4beb33481cfd39ce60c623;hp=3Dfd0cee63fb02455a5021ca298da8dadb4df6=
3a9a
> >=20
> > there is a meta-oe patch for ssiapi
> > https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-sup=
port/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch
> > =C2=A0
> first of all: Thanks for the automated testing :-)
> Yes, I broke the realpath.patch with my update. I've pushed a fix,
> which should solve this issue.
>=20
>=20
> > systemd+sysvinit build failure:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/9431/=
steps/25/logs/stdio
> >=20
> > Cheers,
> >=20
> > Richard
> For this I fixed the install.patch (which I removed in the first
> place). Could you re-run the tests with my latest commits? ;-)

I can't just test one persons changes so there are multiple patches
causing multiple issues in this build but there still seem to be
sysvinit issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5903/ste=
ps/12/logs/stdio

There are probably other issues in there too.

As Alex says, pulling patches from github subverts our review process
so whilst I did it as a one off, I can't do this on a regular basis.=20

Cheers,

Richard

