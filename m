Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6A0C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:49:48 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.39722.1656686980173136350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WHcBUQWC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id r20so3601018wra.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=+EY7o4PRQIy4p4JDKuh8X8Mgky4r9BVnAnsJcsFmpEI=;
        b=WHcBUQWCOfKzJusJNcoPhhiOqYXohZXjc9zjv3v4bcDRp/DZn6TsKp91roTZ9FK1lK
         AzRvHy1gtAjbJGmWGAkor9+ouQ+1gvB8jeemRXXpyzyUzAArZtUj8pcw1EH2Wk3in9yb
         82Zfg7qkdJkRh2SstZvip0oUyXiwGlGixtcds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=+EY7o4PRQIy4p4JDKuh8X8Mgky4r9BVnAnsJcsFmpEI=;
        b=hqAklpAg+/efXJeQCuqQe4CZ+PbNi4itssvo7Bqap1KkIpnxATfnV2Gpzts+Yu2Clm
         pHalXIXmibBvRaJkWAsB6XLnS8lWXn9Sn7dK1Tp+Y4So2N5l4wTcTcmZYpBZcJF8dIHS
         0GNrZaYQqhg7aywr4sofqz/hpDYkaUgfQwDdDOr3/IOv8X9JUFPBD3q7PfCVB1XkSGfC
         uLC53U3GVUftIquWLUIDzSahY+PX/IaohTtxB/UmxvunqsOdmzUENb8yFej42dY34Kg8
         YhluL6gmMojuadKyUOOIsBspOixqV3M0xLFGUnlgmTcuNWS6frDNANRf03nCnzEYxdgb
         AeBQ==
X-Gm-Message-State: AJIora9nGNJ8GVTibc0nQpasHdXjrSrfwKExYvy/AUspzTAaMalrTSO7
	9gtewnWxxMVuxnsH9hWJQzT+KQ==
X-Google-Smtp-Source: 
 AGRyM1u9B6D1PJZoJgEZ3+nDzg3ugYEmX/ADY6Ls14xXeZFm190/WdDaJfojTn3OwDnHYmBBjPhrdA==
X-Received: by 2002:adf:f306:0:b0:21d:f46:de5c with SMTP id
 i6-20020adff306000000b0021d0f46de5cmr13574995wro.544.1656686978431;
        Fri, 01 Jul 2022 07:49:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a49f:615b:a613:6a47?
 ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b002185631adf0sm23494990wre.23.2022.07.01.07.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:49:37 -0700 (PDT)
Message-ID: 
 <694b9d319c6fa7a57807a188e5c8b27992a17e76.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 01 Jul 2022 15:49:37 +0100
In-Reply-To: <16FDB9E325C9E889.5468@lists.openembedded.org>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
	 <16FDAC3178C621FE.2437@lists.openembedded.org>
	 <16FDB5A16CDF6390.2437@lists.openembedded.org>
	 <16FDB9E325C9E889.5468@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:49:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167476

On Fri, 2022-07-01 at 15:10 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2022-07-01 at 13:52 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2022-07-01 at 10:59 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Thu, 2022-06-30 at 15:16 -0400, bruce.ashfield@gmail.com wrote:
> > > > With conference travel and issues with meta-virtualization, I've be=
en
> > > > behind in sending this out .. but I have been queueing changes, I j=
ust
> > > > wanted to be around in case something breaks.
> > > >=20
> > > > Here are the -stable updates and the start of my efforts to bring
> > > > 5.19 in as the new reference kernel for the fall release.
> > > >=20
> > > > lttng-modules needed it's normal tweaks to work against the 5.19 so=
urce,
> > > > but otherwise, nothing significant has popped up.  I have other par=
ts
> > > > of that uprev under test (libc-headers, systemtap, etc).
> > >=20
> > > Thanks Bruce!
> > >=20
> > > Unfortunately there was one issue the autobuilder found, a
> > > reproducibility issue in perf:
> > >=20
> > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220630-5=
3gdlqxv/packages/diff-html/
> > >=20
> > > I've not looked into it other than looking at the above link but it
> > > seems some python paths are creeping into the binaries.
> >=20
> > This looked a little suspicious to me:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit=
/?h=3Dlinux-5.15.y&id=3D18f2967418d031a390a5befe855dd0faa8af70b9
>=20
> Confirmed that it is this change.=C2=A0Not sure why but at least we have =
an
> idea of where the isssue is.
>=20
> I've also sent a patch to insane.bbclass to change WARN_QA such that we
> can detect this kind of issue much earlier in people's local builds. It
> may expose issues in other layers but those issues probably do need
> exposing at this point too...

This breaks:

override PYTHON :=3D $(call get-executable-or-default,PYTHON,$(subst -confi=
g,,$(PYTHON_AUTO)))

as somehow PYTHON is expanded to a full path, yet:

override PYTHON :=3D $(call get-executable-or-default,PYTHON,$(PYTHON_AUTO)=
)

this works and doesn't expand PYTHON. I have no idea why, it doesn't
make sense.

Cheers,

Richard


