Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B376EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 09:45:15 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.13183.1688550312216204903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 02:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AwB3Mpnc;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso104952831fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688550310; x=1691142310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E+CUPwZ/zFjpb2YxniEIcCUPg4n6E6R3yMSVKKsUHYk=;
        b=AwB3Mpnc7GhlSh66xv5LSU3ll8Fars1tE01iXvoqxATv1U4RCkJhKDEix7x4EDnsTm
         nNmva9PpeNjPlMfVmUtP1UYP7B9a9J7+yd2ibAyIlCzDswng/wt+Q58Wtd/1yYFdMUTu
         l9Cr6+8yJqvIojqsFInYy8cITPR7x/SFa+BfMjXNVodj2ObX2Iu9YmqcOiPxyqW56Fsi
         v1EzxJ3SD33NE6I/L+A9RbnlEQwi4NUGOc379vyNtkHunpW6ibp3A7VTyKU3GPkChlIK
         TIgM3RDIrS2wt17oBzWl1hKlKTmMfugRwmoo9iVo8wWd1pWcHJsmf6Ygd4iFtDPVKBv0
         f2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550310; x=1691142310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+CUPwZ/zFjpb2YxniEIcCUPg4n6E6R3yMSVKKsUHYk=;
        b=AFQDoZG+wBnzmo+V/JtPXsc/lnjF31QR/lzQzARddeP72bj+sw16duNTIJieGuGNd4
         iC6oFSFla3zPzZhlLVetJn04R1Forj7ZfhF58mEc3Qgi87kwLOYUNX1dfr1/xHFt8cgw
         Z9cHtyYnCYd2RXtxXD2yK8ncADB4Ig1bEMceC2rKgPh2t8AxbjSMKVQdh/oUU1W1PYgv
         pG58Rao2Y7A8UhCz6qwYHQFKzXjLEbJSTM+ppMABQou1mu8eyKf325p9e4hTVwx04nHW
         fD1CoFWOWnpuwPaiy+RMzZAZYnKBxPcmDfzTvOiiIXPrdYOVNbj8nviVqOHOX5PbpIb5
         fXVw==
X-Gm-Message-State: ABy/qLYnQCVxYSdek29EyYezq+9RcvIQkggSA3OyGByVQw4h0ITvFxGU
	03mG6nQWdAq9bV3kqpC0wZ9KwowVw027Lbsjy+4=
X-Google-Smtp-Source: APBJJlHRsEGoYiBmFR4vhelIIAV3m4BDldWOCN81Nt6I3a55weRHScyzSHypX/Xw40ZfweU84a4X6aGkfDGR+UnD5Ac=
X-Received: by 2002:a2e:918e:0:b0:2b6:e96c:5414 with SMTP id
 f14-20020a2e918e000000b002b6e96c5414mr5907884ljg.52.1688550310048; Wed, 05
 Jul 2023 02:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230704200907.20403-1-sudipm.mukherjee@gmail.com>
 <CANx9H-AHG59Fw4s5zQ-2yJRksJszGwdZghznqsjYyxjXnMAiEg@mail.gmail.com> <176EEE6570F0DE1C.25260@lists.openembedded.org>
In-Reply-To: <176EEE6570F0DE1C.25260@lists.openembedded.org>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 5 Jul 2023 10:44:34 +0100
Message-ID: <CADVatmNN7Oy3Aw0u0J5s+GEPtiK1jeW27imf5P1_2eX60c2FOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pygments: upgrade to 2.15.1
To: sudipm.mukherjee@gmail.com
Cc: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 09:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183879

On Wed, 5 Jul 2023 at 10:23, Sudip Mukherjee via
lists.openembedded.org
<sudipm.mukherjee=gmail.com@lists.openembedded.org> wrote:
>
> On Wed, 5 Jul 2023 at 08:45, Tim Orling <ticotimo@gmail.com> wrote:
> >
> >
> >
> > On Tue, Jul 4, 2023 at 10:09 PM Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> >>
> >> Upstream has removed setup.py and started using pyproject.toml
> >>
> >> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> >> ---
> >>  ...ython3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>  rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} (76%)
> >>
> >> diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> >> similarity index 76%
> >> rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> >> rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> >> index 16769e9263..7e3b286f41 100644
> >> --- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
> >> +++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
> >> @@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
> >>  LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
> >>
> >>  inherit setuptools3
> >
> >
> >  instead of setuptools3, inherit python_setuptools_build_meta
> > Look at the build.backend variable in pyproject.toml for hints
> > https://github.com/pygments/pygments/blob/master/pyproject.toml#L4
>
> Thanks Tim. I was going through all the python*.bbclass to find a
> suitable one but obviously I missed it.
> Will update, test and send a v2.

nm, I can see you have already sent a patch for this.


-- 
Regards
Sudip

