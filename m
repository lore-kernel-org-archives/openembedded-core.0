Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.27173.1590387139917774447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 23:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=UWa5XfVx;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.221.66, mailfrom: rahulk@mvista.com)
Received: by mail-wr1-f66.google.com with SMTP id t18so1915690wru.6
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 23:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z19zZ9Cwziwc52kElKzzzrEBE/utKj37+IFLryZG1HQ=;
        b=UWa5XfVxzu1YjR3AGxQ1W6OWkPcAnL+8UGPrMaETHZtSWuItEGntTW+dzDjKz8KPFq
         WojgBBpqYaIhYMw6cz/+LCKiQLsSpy0y5aQ/eh0YrGTMmmMwqvC5S2NxHMMbE2zW09y5
         7hx94tsSbs5bmQ0rHn57WmJBr4SStM/Xj0OKKS8PmJ8N1ZMZKCguh8jFusz5CMIpMMSn
         TG+pwyGkU+Zu8p8sWt6PUQ8Nm+Mju3FwWGGTVjunXJvTrwUOm9SwXeW6ExuLpPaQCN+8
         o0s9Yf7n3cbkierRwufkDirHh1LNXl78c3pdq1hje7zVZKM53jr+Z+DuX5tinbXOH9Qr
         W/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z19zZ9Cwziwc52kElKzzzrEBE/utKj37+IFLryZG1HQ=;
        b=nz8kERBIU/04yl46zXfvO0DQDbKw55McbpQsdN8PVcZBwMxXGBK32T1IRYF15fqlpm
         EZF5FaJsVTP2KDsJhJyCGcIqlmxXDOUhkM2SmwJfnLPY4RG8l2oM4Hj7sJChaELHmfv3
         RDZIURlVCeFcnxQsVXLjgjLUPSJOqPy2Jg6o3H9lc/UH9+CYOZBXz0OrNji+QSFr1rOp
         4meFSSQqWXw0+h9hdjyXvo6SoI6VKWiNShgjOTYU21enzUkk5tXOLfMPLU9zsFIb395N
         N9Jc+kz2H89dzjJT6qI48INaJuw4v+3FmKvjGnamYVueV67etNZpF2/pjU2GFTUmc1wE
         9QPA==
X-Gm-Message-State: AOAM532MHzbLqMiKx4AoLRD3boi+HEGnlCBGtRfKLolnVhmdmt+eY7mZ
	vlP4YafWUWX89HNCcVtUXKSvofvl6sKSF5SDotJVDg==
X-Google-Smtp-Source: ABdhPJy/SrOlnBEYrsONY4W8g/1Hp1z7OUB6nmZw/oyGHIgFjwdrTJOQm6ISYB5nt7DNTBwAYsTviuGCoO/nu6tC0t0=
X-Received: by 2002:a5d:4a04:: with SMTP id m4mr7701830wrq.153.1590387138184;
 Sun, 24 May 2020 23:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
 <e4d2de1d300677bf61ec737d8847dd7dea967840.camel@linuxfoundation.org>
 <CANv91vNTDMES=ZCWUsEDWycsBW1kyy_dWNc62+93GozCMz1kUw@mail.gmail.com>
 <CANNYZj_61NP5ZSVHA5UWJN_s86esbc-1nEu2gDdmvMn6AGqRAg@mail.gmail.com>
 <543d70c2321008a46e4f21bf84fd3963624e655b.camel@linuxfoundation.org>
 <CANv91vOeLhAdf5RVzQ6Ftc+Y4eQH963BYcEVfmMJaKcYg_GFTw@mail.gmail.com>
 <CANNYZj801ksp6hFqRzkU3A8qXptrHdm-GBZLPespsoir59Tx9w@mail.gmail.com>
 <57f47042-407c-7fe6-008c-adc509331f6e@windriver.com> <CANv91vM-SuevnLi--bKzyON3z6YuXUMHUjCc70PKa41woypmTg@mail.gmail.com>
 <9c444c01c7b64ff99ebd3b22516dc052@XBOX03.axis.com> <CANv91vPLcNY+58xx_ZyOOwAviyiH6vD_hPU_KmreXeUj1cikXg@mail.gmail.com>
 <a7804056e3204ee7b986f9fdc02e80cf@XBOX03.axis.com> <1a0e97f9-886f-40f1-3b53-d0ac59ebc8c8@windriver.com>
 <172ff49855e74f94b5247f2b482e0f94@XBOX03.axis.com> <9e09c278-741a-3cc1-ef60-9dcacb3b7658@windriver.com>
In-Reply-To: <9e09c278-741a-3cc1-ef60-9dcacb3b7658@windriver.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Mon, 25 May 2020 11:42:06 +0530
Message-ID: <CANv91vM5RZErx0pZzLKimcvDhYJrurJjJ2h5h-Km9hNtDiDdsg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Randy MacLeod <randy.macleod@windriver.com>, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000006d5b5905a672dcae"

--0000000000006d5b5905a672dcae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy/Peter/community members,

Can you please conclude I should go with which option.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Thu, May 21, 2020 at 2:29 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2020-05-19 8:06 p.m., Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: Randy MacLeod <randy.macleod@windriver.com>
> >> Sent: den 19 maj 2020 23:45
> >> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Rahul Kumar
> >> <rahulk@mvista.com>
> >> Cc: Alexander Kanavin <alex.kanavin@gmail.com>; Richard Purdie
> >> <richard.purdie@linuxfoundation.org>; OE-core <openembedded-
> >> core@lists.openembedded.org>; Trevor Gamblin
> >> <trevor.gamblin@windriver.com>
> >> Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
> >>
> >> On 2020-05-19 12:29 p.m., Peter Kjellerstedt wrote:
> >>> The jzlib license is a three clause BSD license, and so is the
> >>> go/LICENSE, so you should be able to set LICENSE as:
> >>>
> >>> LICENSE =3D "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause=
 &
> Zlib"
> >>
> >> Peter,
> >>
> >> I respectfully disagree.
> >>
> >> The only source that is _executed_ in normal use by bzip2-test is
> >> the run-tests.sh script that is licensed as GPLv3+
> >
> > Well, I am definitely not a lawyer either,
>
> Phew! :)
>
> > but I am pretty sure that
> > whether something that is distributed under a certain license is
> > executed or not is irrelevant (unless of course the license covers
> > execution of the code).
>
> There's a difference between a legal report and the Yocto LICENSE tag.
> The Yocto tag is meant to be an over-all/community acknowledged license
> for the _code_ in the package that ends up as executable / script on
> the target. We should probably document this in greater detail, perhaps
> in:
>
>
> https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#va=
r-LICENSE
>
> A more comprehensive analysis usually includes a file by file
> IP report often accompanied by a summary generated by an IP expert.
>
> >
> >> The other files, although they came from source packages,
> >> are *only* used as  test data. The source code has been completely
> >> stripped out, hasn't it?
> >
> > Given that they were originally distributed in an archive together
> > with a LICENSE/COPYING/similar file covering the entire archive,
> > those files are still covered by that license even if they are not
> > source files per se.
>
>
> Licenses describe the terms that apply to items that are covered
> under copyright. Data generally can not be copyrighted.
>
>  From my IP contact:
>
> ---
>
> In order for something to be copyrightable three requirements
> must be satisfied:
>
>   1. The work represents a creative form of expression
>      (basic facts do not represent a creative form of expression)
>
>   2. The work is original (novel) =E2=80=93 not copied from someone else.
>      Two different people could come up with similar creative forms
>      of expression. They just can=E2=80=99t copy from someone else.
>
>   3. It must be put in tangible form (e.g., written, digital, =E2=80=A6).
>      Someone can=E2=80=99t just claim it resides inside their head.
>
>
>
> Data as a general is not copyrightable because it fails number 1.
> However if someone can argue that a certain compilation of data
> represents some form of creative expression, they might have a case.
> This is discussed in the first two paragraphs here:
>
>     https://libguides.library.kent.edu/data-management/copyright
>
>
> Data can be protected under patent or trade secret law but different
> requirements apply and a different license would need to be created.
> Open Source licenses are largely copyright licenses. Although sometimes
> they include patent terms, they are generally not considered patent
> licenses.
>
> ---
>
>
> Most of the files here are clearly just data and
> are therefore neither subject to copyright nor governed by
> typical open source licenses.
>
> Some possible exceptions are:
>
> dotnetzip/dancing-color.ps.bz2
>    - This could be considered as software since that's what a PostScript
>      file is. In fact it's the 'Dancing links" paper by Donald Knuth:
>      https://www-cs-faculty.stanford.edu/~knuth/preprints.html
>      Copyright is not asserted but is of course implied for such works.
>      No licensing terms are declared.
>
> go/compress/Isaac.Newton-Opticks.txt.bz2
>    - out of copyright since unfortunately the author died long ago :-/
>      It seems that the people who prepared this document:
>        "Produced by Suzanne Lybarger, steve harris, Josephine
>        Paolucci and the Online Distributed Proofreading Team at
>        http://www.pgdp.net. "
>      are interested in:
>         "...dedicated to the preservation of written works
>          that are in the Public Domain ..."
>
>
> https://www.pgdp.net/wiki/DP_Official_Documentation:General/Distributed_P=
roofreaders_Mission_Statement
>
>
>
> It seems that the README/COPYING/LICENSE.txt/... files
> were left in the repo by people who while well intentioned,
> were misguided. We could try to fix that error upstream.
>
>
> >
> >> If, instead of compressed data,
> >> someone were to give me an image file covered by a creative common's
> >> license and the image had a watermark that when extracted produced
> >> file with source code with a FOO license, would you change the
> >> package license to include FOO? In fact, we don't even look at
> >> image file licensing let alone at embedded watermarks.
> >
> > Well, if there is a file distributed in the picture (not using the
> > word "image" here to avoid confusing the discussion any more) in the
> > form of a watermark, then that is no different from distributing it
> > as part of a tar.gz file (albeit a bit unusual). Whatever license
> > that file is covered by still applies in both cases.
>
>
> To me, this is the crux of the matter, i.e.:
>    "Whatever license that file is covered by
>     still applies in both cases."
>
> I agree with you but I think that the LICENSE can not and should
> not and was not meant to apply to the data files.
>
> >
> > Actually, here is something to think about. I recently read an
> > article published by the Linux Foundation called "Docker Containers
> > for Legal Professionals". [1] There they discussed the distribution
> > of Docker images. Consider this, you take an existing Docker image,
> > e.g., fedora:32, and remove everything that is covered by GPL-3.0
> > (not sure how to actually accomplish that, but anyway) and then you
> > distribute this new Docker image to someone. Does this mean that
> > GPL-3.0 covered code is being distributed? The answer is yes.
> > Because of the way Docker images are made up from layers, you need
> > to adhere to the licenses covering everything in all layers, not
> > just the final result. And somewhere down the stack of layers
> > making up your Docker image is still all of that GPL-3.0 code
> > that you removed in a higher layer.
>
> Yes, that's an interesting case that makes sense due to the layered
> nature of the docker images.
>
> >
> >> I'm not a lawyer so this is simply my opinion on the matter.
> >> How do we come to an agreement?
> >> I'd be happy to add a comment in the recipe explaining our position:
> >>
> >> # This package contains a script and test data this is derived from
> >> # other software packages as explained in the top level README.
> >> # Although there are COPYING files explaining the license terms
> >> # for each sub-directory, the files in each directory are only used
> >> # as test data so the LICENSING terms do not appear to apply to
> >> # the recipe as we ship it and have therefore NOT been incorporated
> >> # into the bzip2-ptests recipe licensing tags.
> >
> > I would be very worried seeing such a statement, and I believe any
> > lawyer would too.
>
> As written I agree but if I change it to:
>
>  >> # This package contains a script and test data this is derived from
>  >> # other software packages as explained in the top level README.
>  >> # Although there are COPYING files explaining the license terms
>  >> # for each sub-directory, the files in each directory are only used
> # for each sub-directory, the files in each directory are only
>
>  >> # as test data so the LICENSING terms do not appear to apply to
> # test data so the LICENSING terms do not appear to apply to
>
>  >> # the recipe as we ship it and have therefore NOT been incorporated
>  >> # into the bzip2-ptests recipe licensing tags.
>
>
> would that make more sense?
>
>
> So this email chain is all about deciding between:
> 1) LICENSE =3D \
>    "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
>
> and
>
> 2) LICENSE =3D "GPLv3+"
>
>
> My vote is still for 2). Yours?
>
> ../Randy
>
>
>  >
> >
> >> I can consult with some intellectual property experts that I know
> >> about this particular case if you like.
> >
> > If you have the possibility to do so, I think it may be a good idea.
> >
> >> ../Randy
> >
> > //Peter
> >
> > [1]
> https://www.linuxfoundation.org/wp-content/uploads/2020/04/Docker-Contain=
ers-for-Legal-Professionals-Whitepaper_v4.ac_-3.pdf
> >
> >>> You also need to add:
> >>>
> >>> LICENSE_${PN} =3D "bzip2-1.0.6"
> >>>
> >>> LICENSE_${PN}-dev =3D "bzip2-1.0.6"
> >>>
> >>> LICENSE_${PN}-dbg =3D "bzip2-1.0.6"
> >>>
> >>> LICENSE_${PN}-doc =3D "bzip2-1.0.6"
> >>>
> >>> LICENSE_${PN}-src =3D "bzip2-1.0.6"
> >>>
> >>> LICENSE_libbz2 =3D "bzip2-1.0.6"
> >>>
> >>> so the non-ptest packages are not affected by the licenses for the
> >> ptest
> >>> package.
> >>>
> >>> //Peter
> >>>
> >>> *From:*Rahul Kumar <rahulk@mvista.com>
> >>> *Sent:* den 19 maj 2020 13:58
> >>> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >>> *Cc:* Randy MacLeod <randy.macleod@windriver.com>; Alexander Kanavin
> >>> <alex.kanavin@gmail.com>; Richard Purdie
> >>> <richard.purdie@linuxfoundation.org>; OE-core
> >>> <openembedded-core@lists.openembedded.org>; Trevor Gamblin
> >>> <trevor.gamblin@windriver.com>
> >>> *Subject:* Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
> >>>
> >>> Hi Peter,
> >>>
> >>> I am sharing a few information related to bzip2-test source and
> >>> licensing information.
> >>> As per your suggestion and as per my understanding I added License to
> >>> the bzip2 recipe file.
> >>>
> >>> bzip2-tests.git source tree structure is given below
> >>> (here showing licence related fle, removed other file names )
> >>>
> >>> bzip2-tests.git/
> >>> =E2=94=9C=E2=94=80=E2=94=80commons-compress
> >>> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80LICENSE.txt
> >>> =E2=94=82
> >>> =E2=94=9C=E2=94=80=E2=94=80dotnetzip
> >>> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80License.txt
> >>> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80License.zlib.txt
> >>> |
> >>> =E2=94=9C=E2=94=80=E2=94=80go
> >>> =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80LICENSE
> >>> =E2=94=82
> >>> =E2=94=9C=E2=94=80=E2=94=80lbzip2
> >>> =E2=94=9C=E2=94=80=E2=94=80pyflate
> >>> =E2=94=9C=E2=94=80=E2=94=80README
> >>> =E2=94=94=E2=94=80=E2=94=80 run-tests.sh
> >>>
> >>> source code link:
> >>> https://sourceware.org/git/bzip2-tests.git
> >>>
> >>> bzip2-tests.git source contains
> >>> 1) comman-commpress: which is Originally distributed under the Apache
> >>> License Version 2.0.
> >>>
> >>> See LICENSE.txt
> >>>
> >>>
> >>> 2) dotnetzip:
> >>> (i)  The DotNetZip Library is distributed under the MicroSoft Public
> >> License
> >>>       (Ms-PL) see the License.txt file.
> >>> (ii) The BZ2 related resources are distributed under the licenses in
> >>> License.zlib.txt.
> >>>
> >>> 3) go:
> >>>
> >>>    Go is distributed under a BSD-style license.
> >>>    See the LICENSE file.
> >>>
> >>> 4) lbzip2:
> >>> lbzip2 is free software: you can redistribute it and/or modify it und=
er
> >> the
> >>> terms of the GNU General Public License as published by the Free
> >> Software
> >>> Foundation, either version 3 of the License, or (at your option) any
> >> later
> >>> version
> >>>
> >>> 5) pyflate: You may use and distribute this code and documentation
> >> under any
> >>>               DFSG-compatible license (eg. BSD, GNU GPLv2).
> >>>
> >>> 6) run-tests.sh: you can redistribute it and/or modify it under the
> >>> terms of the GNU General Public License (GPL); either
> >>>                    version 3, or (at your option) any later version.
> >>>
> >>>
> >>> SO in recipe I added the License like below
> >>> LICENSE =3D "bzip2-1.0.6 & GPLv3+ & Apache-2.0 & MS-PL & BSD "
> >>> LICENSE_${PN}-ptest =3D "GPLv3+ & Apache-2.0 & MS-PL & BSD"
> >>> LIC_FILES_CHKSUM =3D
> >>>
> >>
> "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b=
32df46
> >> 64
> >>> \
> >>>
> >>> file://${WORKDIR}/git/commons-
> >> compress/LICENSE.txt;md5=3D86d3f3a95c324c9479bd8986968f4327
> >>> \ # For comman-commpress (Apache-2.0)
> >>>
> >>>
> >>
> file://${WORKDIR}/git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8=
ff
> >> 352a54f
> >>> \      # For dotnetzip (Ms-PL)
> >>>
> >>>
> >>
> file://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db=
6b
> >> 79e6de0a029f
> >>> \   # For dotnetzip  (jzlib +zlib)
> >>>
> >>> file://${WORKDIR}/git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd747=
07 \
> >>>        # For go (BSD-style license)
> >>>
> >>> here I need few suggestion:
> >>>
> >>> 1) I added the BSD and GPLv3+ license in LICENSE and LICENSE_${PN}-
> >> ptest.
> >>>      but not added LIC_FILES_CHKSUM for GPLv3 and BSD because
> >>> bzip2-tests.git source code doesn't have GPLv3 and BSD License text
> >> file
> >>> like other
> >>>      directories.
> >>>
> >>> 2) License.zlib.txt: This is a combination of two licence jzlib and
> >>> zlib. In meta/files/common-licenses Zlib license is available but not
> >> jzlib.
> >>>      In this case how can I proceed?
> >>>
> >>> Kindly comment on this and feel free to point out if i am wrong at an=
y
> >>> place.
> >>>
> >>> *Thanks & Regards,*
> >>>
> >>> Rahul Kumar
> >>>
> >>> Software Engineer,Linux Solutions Engineering
> >>>
> >>> Group,Montavista Software LLC
> >>>
> >>> Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> >>> <https://plus.google.com/+CodeTwoSoftware>
> >>>
> >>> On Mon, May 18, 2020 at 1:18 AM Peter Kjellerstedt
> >>> <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>>
> >> wrote:
> >>>
> >>>      As I wrote in my previous mail, when it comes to licenses, it is
> >> the
> >>>      distribution that is important. So if you build a package
> >>>      (bzip2-ptest) that includes code that is GPL-3.0, it does not
> >> matter
> >>>      if that code is only used as a binary blob, it is still
> distributed
> >>>      in the package, and thus the package needs to be covered by the
> >>>      GPL-3.0 license.
> >>>
> >>>      //Peter
> >>>
> >>>      *From:*openembedded-core@lists.openembedded.org
> >>>      <mailto:openembedded-core@lists.openembedded.org>
> >>>      <openembedded-core@lists.openembedded.org
> >>>      <mailto:openembedded-core@lists.openembedded.org>> *On Behalf Of
> >>>      *Rahul Kumar
> >>>      *Sent:* den 17 maj 2020 21:18
> >>>      *To:* Randy MacLeod <randy.macleod@windriver.com
> >>>      <mailto:randy.macleod@windriver.com>>
> >>>      *Cc:* Alexander Kanavin <alex.kanavin@gmail.com
> >>>      <mailto:alex.kanavin@gmail.com>>; Richard Purdie
> >>>      <richard.purdie@linuxfoundation.org
> >>>      <mailto:richard.purdie@linuxfoundation.org>>; OE-core
> >>>      <openembedded-core@lists.openembedded.org
> >>>      <mailto:openembedded-core@lists.openembedded.org>>; Trevor
> Gamblin
> >>>      <trevor.gamblin@windriver.com
> >> <mailto:trevor.gamblin@windriver.com>>
> >>>      *Subject:* Re: [OE-core] [PATCH v2] bzip2: Add test suite for
> bzip2
> >>>
> >>>      Hi Randy,
> >>>
> >>>      patch has been accepted by bzip2 community with additional
> changes.
> >>>      https://sourceware.org/git/?p=3Dbzip2-
> >> tests.git;a=3Dcommit;h=3Df9061c030a25de5b6829e1abf373057309c734c0
> >>>
> >>>
> >>>      So I need your suggestion with respect to Yocto.
> >>>
> >>>      Since required changes for ptest infrastructure is integrated to
> >> the
> >>>      bzip2-tests.git source code.
> >>>      So now we can just change the SRCREV with the latest commit
> instead
> >>>      of applying the patch to the bzip2-tests.git source code.
> >>>
> >>>      And since we are just integrating the bzip2-tests source to the
> >>>      bzip2 recipe and not modifying any file so i think no need to ad=
d
> >>>      any License for it.
> >>>
> >>>
> >>>      Now patch will look like
> >>>
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>      --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> >>>      +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> >>>      @@ -46,6 +46,7 @@ runtest:
> >>>               else echo "FAIL: sample2 decompress"; fi
> >>>               @if cmp sample3.tst sample3.ref; then echo "PASS: sampl=
e3
> >>>      decompress";\
> >>>               else echo "FAIL: sample3 decompress"; fi
> >>>      +       ./bzip2-tests/run-tests.sh
> --tests-dir=3D"$(PWD)/bzip2-tests"
> >>>
> >>>        install-ptest:
> >>>               sed  -n '/^runtest:/,/^install-ptest:/{/^install-
> >> ptest:/!p}' \
> >>>      @@ -56,6 +57,7 @@ install-ptest:
> >>>               cp $(srcdir)/sample1.bz2        $(DESTDIR)/
> >>>               cp $(srcdir)/sample2.bz2        $(DESTDIR)/
> >>>               cp $(srcdir)/sample3.bz2        $(DESTDIR)/
> >>>      +       cp -rf $(srcdir)/../git         $(DESTDIR)/bzip2-tests
> >>>               ln -s $(bindir)/bzip2           $(DESTDIR)/bzip2
> >>>
> >>>        install-exec-hook:
> >>>      diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> >>>      <http://bzip2_1.0.8.bb> b/meta/recipes-
> >> extended/bzip2/bzip2_1.0.8.bb
> >>>      <http://bzip2_1.0.8.bb>
> >>>      index d58f553..c5aa690 100644
> >>>      --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> >> <http://bzip2_1.0.8.bb>
> >>>      +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> >> <http://bzip2_1.0.8.bb>
> >>>      @@ -8,13 +8,17 @@ LICENSE =3D "bzip2-1.0.6"
> >>>        LIC_FILES_CHKSUM =3D
> >>>
> >>
> "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b=
32df46
> >> 64"
> >>>
> >>>        SRC_URI =3D "
> https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz
> >>>      <
> https://sourceware.org/pub/$%7bBPN%7d/$%7bBPN%7d-$%7bPV%7d.tar.gz>
> >> \
> >>>      +
> >>>      git://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests
> >>>      <http://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests> \
> >>>                   file://configure.ac <http://configure.ac
> >;subdir=3D${BP}
> >> \
> >>>                   file://Makefile.am;subdir=3D${BP} \
> >>>                   file://run-ptest \
> >>>                   "
> >>>      +
> >>>        SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
> >>>        SRC_URI[sha256sum] =3D
> >>>      "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a226=
9"
> >>>
> >>>      +SRCREV_bzip2-tests =3D "f9061c030a25de5b6829e1abf373057309c734c=
0"
> >> *<<
> >>>      this commit Id includes latest charges for ptest infrastruct.*
> >>>      +
> >>>        UPSTREAM_CHECK_URI =3D "https://www.sourceware.org/pub/bzip2/"
> >>>
> >>>        PACKAGES =3D+ "libbz2"
> >>>      @@ -39,7 +43,7 @@ do_install_ptest () {
> >>>
> >>>        FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
> >>>
> >>>      -RDEPENDS_${PN}-ptest +=3D "make"
> >>>      +RDEPENDS_${PN}-ptest +=3D "make bash"
> >>>
> >>>        PROVIDES_append_class-native =3D " bzip2-replacement-native"
> >>>        BBCLASSEXTEND =3D "native nativesdk"
> >>>
> >>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>>      Kindly comment on it and feel free to point out, if i am wrong a=
t
> >>>      any place.
> >>>
> >>>      *Thanks & Regards,*
> >>>
> >>>      Rahul Kumar
> >>>
> >>>      Software Engineer,Linux Solutions Engineering
> >>>
> >>>      Group,Montavista Software LLC
> >>>
> >>>      Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> >>>      <https://plus.google.com/+CodeTwoSoftware>
> >>>
> >>>      On Fri, May 1, 2020 at 6:56 AM Randy MacLeod
> >>>      <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com
> >>
> >>>      wrote:
> >>>
> >>>          On 2020-04-27 3:39 p.m., Alexander Kanavin wrote:
> >>>           > You need to first see from the failure page which
> >>>          configuration is
> >>>           > failing, for example non-gpl3 is one such.
> >>>           >
> >>>           > Then you find that configuration in config.json. The belo=
w
> >>>          should
> >>>           > hopefully be self-explanatory in how you should set up th=
e
> >> build?
> >>>           >
> >>>           > |"non-gpl3" : { "NEEDREPOS" : ["poky", "meta-gplv2"],
> >>>          "MACHINE" :
> >>>           > "qemux86", "BBTARGETS" : "core-image-minimal
> >>>          core-image-full-cmdline",
> >>>           > "extravars" : [ "INCOMPATIBLE_LICENSE =3D '*GPLv3'",
> >>>          "WARN_QA_remove =3D
> >>>           > 'incompatible-license'" ], "EXTRACMDS" : [
> >>>           > "../../yocto-autobuilder-helper/scripts/check-gplv3" ] },
> >>>           >
> >>>           > |
> >>>           >
> >>>           > |
> >>>           > |
> >>>           >
> >>>           > |Alex
> >>>
> >>>          Hi Rahul,
> >>>
> >>>          Sorry for my late reply.
> >>>
> >>>          The commit log for v2 is very good now!
> >>>          Thanks for incorporating my --pedantic suggestions. ;-)
> >>>
> >>>          It seems that you need a perl dependency for something (docs=
?
> >>>               $ cd .../bzip2.git
> >>>               $ grep -r "perl " *
> >>>               format.pl:#!/usr/bin/perl -w
> >>>               README.XML.STUFF:It uses format.pl <http://format.pl>, =
a
> >>>          perl script...
> >>>
> >>>          Then we need to figure out how to deal with the GPLv3 issue.
> >>>
> >>>          The buildbot output can be tedious to figure out. I haven't
> >> really
> >>>          spent enough time plugging away at it to be proficient yet
> >> either.
> >>>          Have you been able to reproduce the problems that Richard
> >> reported?
> >>>          If not, and you've tried for a bit, then just say so and I'l=
l
> >> try to
> >>>          help tomorrow or early next week.
> >>>
> >>>          It looks like you are packaging the test code/data with the
> >> main
> >>>          package
> >>>          not in bzip2-ptest. Have a look at:
> >>>               meta/recipes-support/libpcre/libpcre_8.44.bb
> >>>          <http://libpcre_8.44.bb>
> >>>          for an example. There are many more.
> >>>          Also, if you look at oe-core.git:
> >>>               $ rgrep LICENSE_ *  | grep PN
> >>>          you can see many examples of sub-packages with different
> >> licenses
> >>>          than the main package. One example is:
> >>>               meta/recipes-support/gnutls/gnutls_3.6.13.bb
> >>>          <http://gnutls_3.6.13.bb>
> >>>          I hope that can address the buildbot problem but I haven't
> >> tried it
> >>>          myself yet.
> >>>
> >>>          BTW, Trevor has gotten the YP autobuilder going at Wind Rive=
r
> >> and
> >>>          he'll be sending a few documentation updates next week or so=
.
> >>>          That may help in case you want to reproduce the YP AB test
> >>>          infrastructure. I expect that you don't _have_ to do so but
> >>>          I think it would be good if more contributing organizations
> did
> >>>          have an instance with only limited builders of the YP AB so
> >> that
> >>>          we can do more testing before Richard runs our changes throu=
gh
> >>>          the main system. Richard has cautioned that the YP AB has lo=
ts
> >> of
> >>>          builders each of which has many cores but I hope that we can
> at
> >>>          least
> >>>          do some AB checking ourselves.
> >>>
> >>>          ../Randy
> >>>
> >>>
> >>>           > |
> >>>           >
> >>>           >
> >>>           > On Mon, 27 Apr 2020 at 20:54, Rahul Kumar <
> rahulk@mvista.com
> >>>          <mailto:rahulk@mvista.com>
> >>>           > <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>>
> >> wrote:
> >>>           >
> >>>           >     Hi Richard/Alexander,
> >>>           >
> >>>           >     I am not able to understand how I can use the below
> >> file.
> >>>           >
> >>>          http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-
> >> helper/tree/config.json
> >>>           >
> >>>           >     did you mean to say that i have to set MACRO in
> >>>          local.conf based on
> >>>           >     this file.
> >>>           >
> >>>           >     *Thanks & Regards,*
> >>>           >     Rahul Kumar
> >>>           >     Software Engineer,Linux Solutions Engineering
> >>>           >     Group,Montavista Software LLC
> >>>           >     Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com=
>
> >>>          <mailto:rahulk@mvista.com <mailto:rahulk@mvista.com>>
> >>>           >     <https://plus.google.com/+CodeTwoSoftware>
> >>>           >
> >>>           >
> >>>           >     On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie
> >>>           >     <richard.purdie@linuxfoundation.org
> >>>          <mailto:richard.purdie@linuxfoundation.org>
> >>>           >     <mailto:richard.purdie@linuxfoundation.org
> >>>          <mailto:richard.purdie@linuxfoundation.org>>> wrote:
> >>>           >
> >>>           >         On Mon, 2020-04-27 at 18:30 +0200, Alexander
> Kanavin
> >>>          wrote:
> >>>           >          > You need to look at configurations defined her=
e:
> >>>           >          >
> >>>           >
> >>>          http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-
> >> helper/tree/config.json
> >>>           >          > and replicate them locally. Then you can
> >> reproduce the
> >>>           >         failures that
> >>>           >          > the AB gets in those configurations.
> >>>           >
> >>>           >         That start of the failing logs on the autobuilder
> >>>          also list out the
> >>>           >         configuration options for that build.
> >>>           >
> >>>           >         Cheers,
> >>>           >
> >>>           >         Richard
> >>>           >
> >>>           >
> >>>           >
> >>>           >
> >>>
> >>>
> >>>          --
> >>>          # Randy MacLeod
> >>>          # Wind River Linux
> >>>
> >>
> >>
> >> --
> >> # Randy MacLeod
> >> # Wind River Linux
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

--0000000000006d5b5905a672dcae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Randy/Peter/community members,</div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b5394"><=
br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:#0b5394">Can you please conclude I should go with which option.</d=
iv><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;col=
or:#0b5394"><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><=
div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><span style=3D"color:rgb(111,168,220)">	=09
  =09
 =20
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b>=
</span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"col=
or:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><sp=
an style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"c=
olor:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</sp=
an></span></div><div><span style=3D"color:rgb(11,83,148)">Software Engineer=
,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,8=
3,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"colo=
r:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mailt=
o:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span><=
span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener" =
target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:1=
0pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 21,=
 2020 at 2:29 AM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windrive=
r.com">randy.macleod@windriver.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 2020-05-19 8:06 p.m., Peter Kjellerste=
dt wrote:<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.=
com" target=3D"_blank">randy.macleod@windriver.com</a>&gt;<br>
&gt;&gt; Sent: den 19 maj 2020 23:45<br>
&gt;&gt; To: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@ax=
is.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;; Rahul Kumar<=
br>
&gt;&gt; &lt;<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@=
mvista.com</a>&gt;<br>
&gt;&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;; Richard Purdie<br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;; OE-core &lt;openemb=
edded-<br>
&gt;&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">c=
ore@lists.openembedded.org</a>&gt;; Trevor Gamblin<br>
&gt;&gt; &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" target=3D"_bla=
nk">trevor.gamblin@windriver.com</a>&gt;<br>
&gt;&gt; Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2<=
br>
&gt;&gt;<br>
&gt;&gt; On 2020-05-19 12:29 p.m., Peter Kjellerstedt wrote:<br>
&gt;&gt;&gt; The jzlib license is a three clause BSD license, and so is the=
<br>
&gt;&gt;&gt; go/LICENSE, so you should be able to set LICENSE as:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; LICENSE =3D &quot;bzip2-1.0.6 &amp; GPLv3+ &amp; Apache-2.0 &a=
mp; MS-PL &amp; BSD-3-Clause &amp; Zlib&quot;<br>
&gt;&gt;<br>
&gt;&gt; Peter,<br>
&gt;&gt;<br>
&gt;&gt; I respectfully disagree.<br>
&gt;&gt;<br>
&gt;&gt; The only source that is _executed_ in normal use by bzip2-test is<=
br>
&gt;&gt; the run-tests.sh script that is licensed as GPLv3+<br>
&gt; <br>
&gt; Well, I am definitely not a lawyer either, <br>
<br>
Phew! :)<br>
<br>
&gt; but I am pretty sure that<br>
&gt; whether something that is distributed under a certain license is<br>
&gt; executed or not is irrelevant (unless of course the license covers<br>
&gt; execution of the code).<br>
<br>
There&#39;s a difference between a legal report and the Yocto LICENSE tag.<=
br>
The Yocto tag is meant to be an over-all/community acknowledged license<br>
for the _code_ in the package that ends up as executable / script on<br>
the target. We should probably document this in greater detail, perhaps<br>
in:<br>
<br>
<a href=3D"https://www.yoctoproject.org/docs/current/mega-manual/mega-manua=
l.html#var-LICENSE" rel=3D"noreferrer" target=3D"_blank">https://www.yoctop=
roject.org/docs/current/mega-manual/mega-manual.html#var-LICENSE</a><br>
<br>
A more comprehensive analysis usually includes a file by file<br>
IP report often accompanied by a summary generated by an IP expert.<br>
<br>
&gt; <br>
&gt;&gt; The other files, although they came from source packages,<br>
&gt;&gt; are *only* used as=C2=A0 test data. The source code has been compl=
etely<br>
&gt;&gt; stripped out, hasn&#39;t it?<br>
&gt; <br>
&gt; Given that they were originally distributed in an archive together<br>
&gt; with a LICENSE/COPYING/similar file covering the entire archive,<br>
&gt; those files are still covered by that license even if they are not<br>
&gt; source files per se.<br>
<br>
<br>
Licenses describe the terms that apply to items that are covered<br>
under copyright. Data generally can not be copyrighted.<br>
<br>
=C2=A0From my IP contact:<br>
<br>
---<br>
<br>
In order for something to be copyrightable three requirements<br>
must be satisfied:<br>
<br>
=C2=A0 1. The work represents a creative form of expression<br>
=C2=A0 =C2=A0 =C2=A0(basic facts do not represent a creative form of expres=
sion)<br>
<br>
=C2=A0 2. The work is original (novel) =E2=80=93 not copied from someone el=
se.<br>
=C2=A0 =C2=A0 =C2=A0Two different people could come up with similar creativ=
e forms<br>
=C2=A0 =C2=A0 =C2=A0of expression. They just can=E2=80=99t copy from someon=
e else.<br>
<br>
=C2=A0 3. It must be put in tangible form (e.g., written, digital, =E2=80=
=A6).<br>
=C2=A0 =C2=A0 =C2=A0Someone can=E2=80=99t just claim it resides inside thei=
r head.<br>
<br>
<br>
<br>
Data as a general is not copyrightable because it fails number 1. <br>
However if someone can argue that a certain compilation of data <br>
represents some form of creative expression, they might have a case. <br>
This is discussed in the first two paragraphs here:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://libguides.library.kent.edu/data-management=
/copyright" rel=3D"noreferrer" target=3D"_blank">https://libguides.library.=
kent.edu/data-management/copyright</a><br>
<br>
<br>
Data can be protected under patent or trade secret law but different <br>
requirements apply and a different license would need to be created. <br>
Open Source licenses are largely copyright licenses. Although sometimes <br=
>
they include patent terms, they are generally not considered patent <br>
licenses.<br>
<br>
---<br>
<br>
<br>
Most of the files here are clearly just data and<br>
are therefore neither subject to copyright nor governed by<br>
typical open source licenses.<br>
<br>
Some possible exceptions are:<br>
<br>
dotnetzip/dancing-color.ps.bz2<br>
=C2=A0 =C2=A0- This could be considered as software since that&#39;s what a=
 PostScript<br>
=C2=A0 =C2=A0 =C2=A0file is. In fact it&#39;s the &#39;Dancing links&quot; =
paper by Donald Knuth:<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www-cs-faculty.stanford.edu/~knuth/p=
reprints.html" rel=3D"noreferrer" target=3D"_blank">https://www-cs-faculty.=
stanford.edu/~knuth/preprints.html</a><br>
=C2=A0 =C2=A0 =C2=A0Copyright is not asserted but is of course implied for =
such works.<br>
=C2=A0 =C2=A0 =C2=A0No licensing terms are declared.<br>
<br>
go/compress/Isaac.Newton-Opticks.txt.bz2<br>
=C2=A0 =C2=A0- out of copyright since unfortunately the author died long ag=
o :-/<br>
=C2=A0 =C2=A0 =C2=A0It seems that the people who prepared this document:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Produced by Suzanne Lybarger, steve harris=
, Josephine<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Paolucci and the Online Distributed Proofreading=
 Team at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.pgdp.net" rel=3D"noreferre=
r" target=3D"_blank">http://www.pgdp.net</a>. &quot;<br>
=C2=A0 =C2=A0 =C2=A0are interested in:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;...dedicated to the preservation of writt=
en works<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that are in the Public Domain ...&quot;<b=
r>
<br>
<a href=3D"https://www.pgdp.net/wiki/DP_Official_Documentation:General/Dist=
ributed_Proofreaders_Mission_Statement" rel=3D"noreferrer" target=3D"_blank=
">https://www.pgdp.net/wiki/DP_Official_Documentation:General/Distributed_P=
roofreaders_Mission_Statement</a><br>
<br>
<br>
<br>
It seems that the README/COPYING/LICENSE.txt/... files<br>
were left in the repo by people who while well intentioned,<br>
were misguided. We could try to fix that error upstream.<br>
<br>
<br>
&gt; <br>
&gt;&gt; If, instead of compressed data,<br>
&gt;&gt; someone were to give me an image file covered by a creative common=
&#39;s<br>
&gt;&gt; license and the image had a watermark that when extracted produced=
<br>
&gt;&gt; file with source code with a FOO license, would you change the<br>
&gt;&gt; package license to include FOO? In fact, we don&#39;t even look at=
<br>
&gt;&gt; image file licensing let alone at embedded watermarks.<br>
&gt; <br>
&gt; Well, if there is a file distributed in the picture (not using the<br>
&gt; word &quot;image&quot; here to avoid confusing the discussion any more=
) in the<br>
&gt; form of a watermark, then that is no different from distributing it<br=
>
&gt; as part of a tar.gz file (albeit a bit unusual). Whatever license<br>
&gt; that file is covered by still applies in both cases.<br>
<br>
<br>
To me, this is the crux of the matter, i.e.:<br>
=C2=A0 =C2=A0&quot;Whatever license that file is covered by<br>
=C2=A0 =C2=A0 still applies in both cases.&quot;<br>
<br>
I agree with you but I think that the LICENSE can not and should<br>
not and was not meant to apply to the data files.<br>
<br>
&gt; <br>
&gt; Actually, here is something to think about. I recently read an<br>
&gt; article published by the Linux Foundation called &quot;Docker Containe=
rs<br>
&gt; for Legal Professionals&quot;. [1] There they discussed the distributi=
on<br>
&gt; of Docker images. Consider this, you take an existing Docker image,<br=
>
&gt; e.g., fedora:32, and remove everything that is covered by GPL-3.0<br>
&gt; (not sure how to actually accomplish that, but anyway) and then you<br=
>
&gt; distribute this new Docker image to someone. Does this mean that<br>
&gt; GPL-3.0 covered code is being distributed? The answer is yes.<br>
&gt; Because of the way Docker images are made up from layers, you need<br>
&gt; to adhere to the licenses covering everything in all layers, not<br>
&gt; just the final result. And somewhere down the stack of layers<br>
&gt; making up your Docker image is still all of that GPL-3.0 code<br>
&gt; that you removed in a higher layer.<br>
<br>
Yes, that&#39;s an interesting case that makes sense due to the layered<br>
nature of the docker images.<br>
<br>
&gt; <br>
&gt;&gt; I&#39;m not a lawyer so this is simply my opinion on the matter.<b=
r>
&gt;&gt; How do we come to an agreement?<br>
&gt;&gt; I&#39;d be happy to add a comment in the recipe explaining our pos=
ition:<br>
&gt;&gt;<br>
&gt;&gt; # This package contains a script and test data this is derived fro=
m<br>
&gt;&gt; # other software packages as explained in the top level README.<br=
>
&gt;&gt; # Although there are COPYING files explaining the license terms<br=
>
&gt;&gt; # for each sub-directory, the files in each directory are only use=
d<br>
&gt;&gt; # as test data so the LICENSING terms do not appear to apply to<br=
>
&gt;&gt; # the recipe as we ship it and have therefore NOT been incorporate=
d<br>
&gt;&gt; # into the bzip2-ptests recipe licensing tags.<br>
&gt; <br>
&gt; I would be very worried seeing such a statement, and I believe any<br>
&gt; lawyer would too.<br>
<br>
As written I agree but if I change it to:<br>
<br>
=C2=A0&gt;&gt; # This package contains a script and test data this is deriv=
ed from<br>
=C2=A0&gt;&gt; # other software packages as explained in the top level READ=
ME.<br>
=C2=A0&gt;&gt; # Although there are COPYING files explaining the license te=
rms<br>
=C2=A0&gt;&gt; # for each sub-directory, the files in each directory are on=
ly used<br>
# for each sub-directory, the files in each directory are only<br>
<br>
=C2=A0&gt;&gt; # as test data so the LICENSING terms do not appear to apply=
 to<br>
# test data so the LICENSING terms do not appear to apply to<br>
<br>
=C2=A0&gt;&gt; # the recipe as we ship it and have therefore NOT been incor=
porated<br>
=C2=A0&gt;&gt; # into the bzip2-ptests recipe licensing tags.<br>
<br>
<br>
would that make more sense?<br>
<br>
<br>
So this email chain is all about deciding between:<br>
1) LICENSE =3D \<br>
=C2=A0 =C2=A0&quot;bzip2-1.0.6 &amp; GPLv3+ &amp; Apache-2.0 &amp; MS-PL &a=
mp; BSD-3-Clause &amp; Zlib&quot;<br>
<br>
and<br>
<br>
2) LICENSE =3D &quot;GPLv3+&quot;<br>
<br>
<br>
My vote is still for 2). Yours?<br>
<br>
../Randy<br>
<br>
<br>
=C2=A0&gt;<br>
&gt; <br>
&gt;&gt; I can consult with some intellectual property experts that I know<=
br>
&gt;&gt; about this particular case if you like.<br>
&gt; <br>
&gt; If you have the possibility to do so, I think it may be a good idea.<b=
r>
&gt; <br>
&gt;&gt; ../Randy<br>
&gt; <br>
&gt; //Peter<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.linuxfoundation.org/wp-content/uploads/2020=
/04/Docker-Containers-for-Legal-Professionals-Whitepaper_v4.ac_-3.pdf" rel=
=3D"noreferrer" target=3D"_blank">https://www.linuxfoundation.org/wp-conten=
t/uploads/2020/04/Docker-Containers-for-Legal-Professionals-Whitepaper_v4.a=
c_-3.pdf</a><br>
&gt; <br>
&gt;&gt;&gt; You also need to add:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; LICENSE_${PN} =3D &quot;bzip2-1.0.6&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; LICENSE_${PN}-dev =3D &quot;bzip2-1.0.6&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; LICENSE_${PN}-dbg =3D &quot;bzip2-1.0.6&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; LICENSE_${PN}-doc =3D &quot;bzip2-1.0.6&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; LICENSE_${PN}-src =3D &quot;bzip2-1.0.6&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; LICENSE_libbz2 =3D &quot;bzip2-1.0.6&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; so the non-ptest packages are not affected by the licenses for=
 the<br>
&gt;&gt; ptest<br>
&gt;&gt;&gt; package.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; //Peter<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; *From:*Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com" ta=
rget=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;&gt;&gt; *Sent:* den 19 maj 2020 13:58<br>
&gt;&gt;&gt; *To:* Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerst=
edt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt;&gt;&gt; *Cc:* Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windri=
ver.com" target=3D"_blank">randy.macleod@windriver.com</a>&gt;; Alexander K=
anavin<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank=
">alex.kanavin@gmail.com</a>&gt;; Richard Purdie<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" targ=
et=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;; OE-core<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org=
" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;; Trevo=
r Gamblin<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" target=3D"=
_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt;&gt;&gt; *Subject:* Re: [OE-core] [PATCH v2] bzip2: Add test suite for =
bzip2<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi Peter,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I am sharing a few information related to bzip2-test source an=
d<br>
&gt;&gt;&gt; licensing information.<br>
&gt;&gt;&gt; As per your suggestion and as per my understanding I added Lic=
ense to<br>
&gt;&gt;&gt; the bzip2 recipe file.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; bzip2-tests.git source tree structure is given below<br>
&gt;&gt;&gt; (here showing licence related fle, removed other file names )<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; bzip2-tests.git/<br>
&gt;&gt;&gt; =E2=94=9C=E2=94=80=E2=94=80commons-compress<br>
&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80LICENSE.txt<br>
&gt;&gt;&gt; =E2=94=82<br>
&gt;&gt;&gt; =E2=94=9C=E2=94=80=E2=94=80dotnetzip<br>
&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80License.txt<br>
&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80License.zlib.txt<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt; =E2=94=9C=E2=94=80=E2=94=80go<br>
&gt;&gt;&gt; =E2=94=82 =E2=94=9C=E2=94=80=E2=94=80LICENSE<br>
&gt;&gt;&gt; =E2=94=82<br>
&gt;&gt;&gt; =E2=94=9C=E2=94=80=E2=94=80lbzip2<br>
&gt;&gt;&gt; =E2=94=9C=E2=94=80=E2=94=80pyflate<br>
&gt;&gt;&gt; =E2=94=9C=E2=94=80=E2=94=80README<br>
&gt;&gt;&gt; =E2=94=94=E2=94=80=E2=94=80 run-tests.sh<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; source code link:<br>
&gt;&gt;&gt; <a href=3D"https://sourceware.org/git/bzip2-tests.git" rel=3D"=
noreferrer" target=3D"_blank">https://sourceware.org/git/bzip2-tests.git</a=
><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; bzip2-tests.git source contains<br>
&gt;&gt;&gt; 1) comman-commpress: which is Originally distributed under the=
 Apache<br>
&gt;&gt;&gt; License Version 2.0.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; See LICENSE.txt<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 2) dotnetzip:<br>
&gt;&gt;&gt; (i) =C2=A0The DotNetZip Library is distributed under the Micro=
Soft Public<br>
&gt;&gt; License<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 (Ms-PL) see the License.txt file.<br=
>
&gt;&gt;&gt; (ii) The BZ2 related resources are distributed under the licen=
ses in<br>
&gt;&gt;&gt; License.zlib.txt.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 3) go:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0Go is distributed under a BSD-style license.=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0See the LICENSE file.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 4) lbzip2:<br>
&gt;&gt;&gt; lbzip2 is free software: you can redistribute it and/or modify=
 it under<br>
&gt;&gt; the<br>
&gt;&gt;&gt; terms of the GNU General Public License as published by the Fr=
ee<br>
&gt;&gt; Software<br>
&gt;&gt;&gt; Foundation, either version 3 of the License, or (at your optio=
n) any<br>
&gt;&gt; later<br>
&gt;&gt;&gt; version<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 5) pyflate: You may use and distribute this code and documenta=
tion<br>
&gt;&gt; under any<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DFSG-com=
patible license (eg. BSD, GNU GPLv2).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 6) run-tests.sh: you can redistribute it and/or modify it unde=
r the<br>
&gt;&gt;&gt; terms of the GNU General Public License (GPL); either<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0version 3, or (at your option) any later version.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; SO in recipe I added the License like below<br>
&gt;&gt;&gt; LICENSE =3D &quot;bzip2-1.0.6 &amp; GPLv3+ &amp; Apache-2.0 &a=
mp; MS-PL &amp; BSD &quot;<br>
&gt;&gt;&gt; LICENSE_${PN}-ptest =3D &quot;GPLv3+ &amp; Apache-2.0 &amp; MS=
-PL &amp; BSD&quot;<br>
&gt;&gt;&gt; LIC_FILES_CHKSUM =3D<br>
&gt;&gt;&gt;<br>
&gt;&gt; &quot;file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1=
fcb82e32f19b32df46<br>
&gt;&gt; 64<br>
&gt;&gt;&gt; \<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; file://${WORKDIR}/git/commons-<br>
&gt;&gt; compress/LICENSE.txt;md5=3D86d3f3a95c324c9479bd8986968f4327<br>
&gt;&gt;&gt; \ # For comman-commpress (Apache-2.0)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt; file://${WORKDIR}/git/dotnetzip/License.txt;md5=3D9cb56871eed4e748=
c3bc7e8ff<br>
&gt;&gt; 352a54f<br>
&gt;&gt;&gt; \ =C2=A0 =C2=A0 =C2=A0# For dotnetzip (Ms-PL)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt; file://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22e=
eb2e5db6b<br>
&gt;&gt; 79e6de0a029f<br>
&gt;&gt;&gt; \ =C2=A0 # For dotnetzip =C2=A0(jzlib +zlib)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; file://${WORKDIR}/git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4=
e0dd74707 \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0# For go (BSD-style license)<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; here I need few suggestion:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 1) I added the BSD and GPLv3+ license in LICENSE and LICENSE_$=
{PN}-<br>
&gt;&gt; ptest.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0but not added LIC_FILES_CHKSUM for GP=
Lv3 and BSD because<br>
&gt;&gt;&gt; bzip2-tests.git source code doesn&#39;t have GPLv3 and BSD Lic=
ense text<br>
&gt;&gt; file<br>
&gt;&gt;&gt; like other<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0directories.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 2) License.zlib.txt: This is a combination of two licence jzli=
b and<br>
&gt;&gt;&gt; zlib. In meta/files/common-licenses Zlib license is available =
but not<br>
&gt;&gt; jzlib.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0In this case how can I proceed?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Kindly comment on this and feel free to point out if i am wron=
g at any<br>
&gt;&gt;&gt; place.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; *Thanks &amp; Regards,*<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Rahul Kumar<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Software Engineer,Linux Solutions Engineering<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Group,Montavista Software LLC<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Email Id: <a href=3D"mailto:rahulk@mvista.com" target=3D"_blan=
k">rahulk@mvista.com</a> &lt;mailto:<a href=3D"mailto:rahulk@mvista.com" ta=
rget=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;&gt;&gt; &lt;<a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=
=3D"noreferrer" target=3D"_blank">https://plus.google.com/+CodeTwoSoftware<=
/a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Mon, May 18, 2020 at 1:18 AM Peter Kjellerstedt<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_=
blank">peter.kjellerstedt@axis.com</a> &lt;mailto:<a href=3D"mailto:peter.k=
jellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;=
&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 As I wrote in my previous mail, when it co=
mes to licenses, it is<br>
&gt;&gt; the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 distribution that is important. So if you =
build a package<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 (bzip2-ptest) that includes code that is G=
PL-3.0, it does not<br>
&gt;&gt; matter<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if that code is only used as a binary blob=
, it is still distributed<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 in the package, and thus the package needs=
 to be covered by the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 GPL-3.0 license.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 //Peter<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *From:*<a href=3D"mailto:openembedded-core=
@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.openembe=
dded.org</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:openembedded-=
core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.open=
embedded.org</a>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:openembedded-core@li=
sts.openembedded.org" target=3D"_blank">openembedded-core@lists.openembedde=
d.org</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:openembedded-=
core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.open=
embedded.org</a>&gt;&gt; *On Behalf Of<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *Rahul Kumar<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *Sent:* den 17 maj 2020 21:18<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *To:* Randy MacLeod &lt;<a href=3D"mailto:=
randy.macleod@windriver.com" target=3D"_blank">randy.macleod@windriver.com<=
/a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:randy.macleod=
@windriver.com" target=3D"_blank">randy.macleod@windriver.com</a>&gt;&gt;<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *Cc:* Alexander Kanavin &lt;<a href=3D"mai=
lto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a><br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;&gt;; Richard Pu=
rdie<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:richard.purdie@linux=
foundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a><br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;&gt;; OE-core<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:openembedded-core@li=
sts.openembedded.org" target=3D"_blank">openembedded-core@lists.openembedde=
d.org</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:openembedded-=
core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.open=
embedded.org</a>&gt;&gt;; Trevor Gamblin<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:trevor.gamblin@windr=
iver.com" target=3D"_blank">trevor.gamblin@windriver.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:trevor.gamblin@windriver.com" target=
=3D"_blank">trevor.gamblin@windriver.com</a>&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *Subject:* Re: [OE-core] [PATCH v2] bzip2:=
 Add test suite for bzip2<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Hi Randy,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 patch has been accepted by bzip2 community=
 with additional changes.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://sourceware.org/git/?p=
=3Dbzip2-" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/git/=
?p=3Dbzip2-</a><br>
&gt;&gt; tests.git;a=3Dcommit;h=3Df9061c030a25de5b6829e1abf373057309c734c0<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 So I need your suggestion with respect to =
Yocto.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Since required changes for ptest infrastru=
cture is integrated to<br>
&gt;&gt; the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bzip2-tests.git source code.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 So now we can just change the SRCREV with =
the latest commit instead<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 of applying the patch to the bzip2-tests.g=
it source code.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 And since we are just integrating the bzip=
2-tests source to the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bzip2 recipe and not modifying any file so=
 i think no need to add<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 any License for it.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Now patch will look like<br>
&gt;&gt;&gt;<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 --- a/meta/recipes-extended/bzip2/bzip2/Ma=
kefile.am<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 +++ b/meta/recipes-extended/bzip2/bzip2/Ma=
kefile.am<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 @@ -46,6 +46,7 @@ runtest:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 else ech=
o &quot;FAIL: sample2 decompress&quot;; fi<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 @if cmp =
sample3.tst sample3.ref; then echo &quot;PASS: sample3<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 decompress&quot;;\<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 else ech=
o &quot;FAIL: sample3 decompress&quot;; fi<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 =C2=A0 ./bzip2-tests/run-t=
ests.sh --tests-dir=3D&quot;$(PWD)/bzip2-tests&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0install-ptest:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed =C2=
=A0-n &#39;/^runtest:/,/^install-ptest:/{/^install-<br>
&gt;&gt; ptest:/!p}&#39; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 @@ -56,6 +57,7 @@ install-ptest:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(src=
dir)/sample1.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)/<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(src=
dir)/sample2.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)/<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp $(src=
dir)/sample3.bz2 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)/<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 =C2=A0 cp -rf $(srcdir)/..=
/git =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DESTDIR)/bzip2-tests<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s $(=
bindir)/bzip2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DESTDIR)/bzip2<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0install-exec-hook:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 diff --git a/meta/recipes-extended/bzip2/<=
a href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">bzip2=
_1.0.8.bb</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://bzip2_1.0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">http://bzip2_1.0.8.bb</a>&gt; b/meta/reci=
pes-<br>
&gt;&gt; extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer=
" target=3D"_blank">bzip2_1.0.8.bb</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://bzip2_1.0.8.bb" rel=
=3D"noreferrer" target=3D"_blank">http://bzip2_1.0.8.bb</a>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 index d58f553..c5aa690 100644<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 --- a/meta/recipes-extended/bzip2/<a href=
=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8=
.bb</a><br>
&gt;&gt; &lt;<a href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer" target=3D=
"_blank">http://bzip2_1.0.8.bb</a>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 +++ b/meta/recipes-extended/bzip2/<a href=
=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8=
.bb</a><br>
&gt;&gt; &lt;<a href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer" target=3D=
"_blank">http://bzip2_1.0.8.bb</a>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 @@ -8,13 +8,17 @@ LICENSE =3D &quot;bzip2-=
1.0.6&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0LIC_FILES_CHKSUM =3D<br>
&gt;&gt;&gt;<br>
&gt;&gt; &quot;file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1=
fcb82e32f19b32df46<br>
&gt;&gt; 64&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0SRC_URI =3D &quot;<a href=3D"h=
ttps://sourceware.org/pub/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"no=
referrer" target=3D"_blank">https://sourceware.org/pub/${BPN}/${BPN}-${PV}.=
tar.gz</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://sourceware.org/pub/=
$%7bBPN%7d/$%7bBPN%7d-$%7bPV%7d.tar.gz" rel=3D"noreferrer" target=3D"_blank=
">https://sourceware.org/pub/$%7bBPN%7d/$%7bBPN%7d-$%7bPV%7d.tar.gz</a>&gt;=
<br>
&gt;&gt; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://sourceware.org/git=
/bzip2-tests.git;name=3Dbzip2-tests" rel=3D"noreferrer" target=3D"_blank">s=
ourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://sourceware.org/git/b=
zip2-tests.git;name=3Dbzip2-tests" rel=3D"noreferrer" target=3D"_blank">htt=
p://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests</a>&gt; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> &lt;<a href=3D"http://configure.ac" rel=3D"norefer=
rer" target=3D"_blank">http://configure.ac</a>&gt;;subdir=3D${BP}<br>
&gt;&gt; \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://Makefile.am;subdir=3D${BP} \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://run-ptest \<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0SRC_URI[md5sum] =3D &quot;67e0=
51268d0c475ea773822f7500d0e5&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0SRC_URI[sha256sum] =3D<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;ab5a03176ee106d3f0fa90e381da478ddae4=
05918153cca248e682cd0c4a2269&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 +SRCREV_bzip2-tests =3D &quot;f9061c030a25=
de5b6829e1abf373057309c734c0&quot;<br>
&gt;&gt; *&lt;&lt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 this commit Id includes latest charges for=
 ptest infrastruct.*<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0UPSTREAM_CHECK_URI =3D &quot;<=
a href=3D"https://www.sourceware.org/pub/bzip2/" rel=3D"noreferrer" target=
=3D"_blank">https://www.sourceware.org/pub/bzip2/</a>&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0PACKAGES =3D+ &quot;libbz2&quo=
t;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 @@ -39,7 +43,7 @@ do_install_ptest () {<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0FILES_libbz2 =3D &quot;${libdi=
r}/lib*${SOLIBS}&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 -RDEPENDS_${PN}-ptest +=3D &quot;make&quot=
;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 +RDEPENDS_${PN}-ptest +=3D &quot;make bash=
&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0PROVIDES_append_class-native =
=3D &quot; bzip2-replacement-native&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0BBCLASSEXTEND =3D &quot;native=
 nativesdk&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Kindly comment on it and feel free to poin=
t out, if i am wrong at<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 any place.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 *Thanks &amp; Regards,*<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Rahul Kumar<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Software Engineer,Linux Solutions Engineer=
ing<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Group,Montavista Software LLC<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Email Id: <a href=3D"mailto:rahulk@mvista.=
com" target=3D"_blank">rahulk@mvista.com</a> &lt;mailto:<a href=3D"mailto:r=
ahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://plus.google.com/+Co=
deTwoSoftware" rel=3D"noreferrer" target=3D"_blank">https://plus.google.com=
/+CodeTwoSoftware</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 On Fri, May 1, 2020 at 6:56 AM Randy MacLe=
od<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:randy.macleod@windri=
ver.com" target=3D"_blank">randy.macleod@windriver.com</a> &lt;mailto:<a hr=
ef=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@w=
indriver.com</a>&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 On 2020-04-27 3:39 p.m., Ale=
xander Kanavin wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; You need to first=
 see from the failure page which<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration is<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; failing, for exam=
ple non-gpl3 is one such.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Then you find tha=
t configuration in config.json. The below<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 should<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; hopefully be self=
-explanatory in how you should set up the<br>
&gt;&gt; build?<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; |&quot;non-gpl3&q=
uot; : { &quot;NEEDREPOS&quot; : [&quot;poky&quot;, &quot;meta-gplv2&quot;]=
,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;MACHINE&quot; :<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &quot;qemux86&quo=
t;, &quot;BBTARGETS&quot; : &quot;core-image-minimal<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 core-image-full-cmdline&quot=
;,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &quot;extravars&q=
uot; : [ &quot;INCOMPATIBLE_LICENSE =3D &#39;*GPLv3&#39;&quot;,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;WARN_QA_remove =3D<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &#39;incompatible=
-license&#39;&quot; ], &quot;EXTRACMDS&quot; : [<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &quot;../../yocto=
-autobuilder-helper/scripts/check-gplv3&quot; ] },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; |Alex<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi Rahul,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sorry for my late reply.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The commit log for v2 is ver=
y good now!<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanks for incorporating my =
--pedantic suggestions. ;-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 It seems that you need a per=
l dependency for something (docs?<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 $ cd ...=
/bzip2.git<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 $ grep -=
r &quot;perl &quot; *<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 format.p=
l:#!/usr/bin/perl -w<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 README.X=
ML.STUFF:It uses <a href=3D"http://format.pl" rel=3D"noreferrer" target=3D"=
_blank">format.pl</a> &lt;<a href=3D"http://format.pl" rel=3D"noreferrer" t=
arget=3D"_blank">http://format.pl</a>&gt;, a<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl script...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Then we need to figure out h=
ow to deal with the GPLv3 issue.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The buildbot output can be t=
edious to figure out. I haven&#39;t<br>
&gt;&gt; really<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spent enough time plugging a=
way at it to be proficient yet<br>
&gt;&gt; either.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Have you been able to reprod=
uce the problems that Richard<br>
&gt;&gt; reported?<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If not, and you&#39;ve tried=
 for a bit, then just say so and I&#39;ll<br>
&gt;&gt; try to<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help tomorrow or early next =
week.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 It looks like you are packag=
ing the test code/data with the<br>
&gt;&gt; main<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 not in bzip2-ptest. Have a l=
ook at:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 meta/rec=
ipes-support/libpcre/<a href=3D"http://libpcre_8.44.bb" rel=3D"noreferrer" =
target=3D"_blank">libpcre_8.44.bb</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://libpcr=
e_8.44.bb" rel=3D"noreferrer" target=3D"_blank">http://libpcre_8.44.bb</a>&=
gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for an example. There are ma=
ny more.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Also, if you look at oe-core=
.git:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 $ rgrep =
LICENSE_ *=C2=A0 | grep PN<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 you can see many examples of=
 sub-packages with different<br>
&gt;&gt; licenses<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 than the main package. One e=
xample is:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 meta/rec=
ipes-support/gnutls/<a href=3D"http://gnutls_3.6.13.bb" rel=3D"noreferrer" =
target=3D"_blank">gnutls_3.6.13.bb</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://gnutls=
_3.6.13.bb" rel=3D"noreferrer" target=3D"_blank">http://gnutls_3.6.13.bb</a=
>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I hope that can address the =
buildbot problem but I haven&#39;t<br>
&gt;&gt; tried it<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 myself yet.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BTW, Trevor has gotten the Y=
P autobuilder going at Wind River<br>
&gt;&gt; and<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 he&#39;ll be sending a few d=
ocumentation updates next week or so.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 That may help in case you wa=
nt to reproduce the YP AB test<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 infrastructure. I expect tha=
t you don&#39;t _have_ to do so but<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I think it would be good if =
more contributing organizations did<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 have an instance with only l=
imited builders of the YP AB so<br>
&gt;&gt; that<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 we can do more testing befor=
e Richard runs our changes through<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the main system. Richard has=
 cautioned that the YP AB has lots<br>
&gt;&gt; of<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 builders each of which has m=
any cores but I hope that we can at<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 least<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do some AB checking ourselve=
s.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ../Randy<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; |<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Mon, 27 Apr 20=
20 at 20:54, Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com" target=3D=
"_blank">rahulk@mvista.com</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto=
:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a hre=
f=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a> &lt;=
mailto:<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista=
.com</a>&gt;&gt;&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0Hi Richard/Alexander,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0I am not able to understand how I can use the below<br>
&gt;&gt; file.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://git.yoctop=
roject.org/cgit/cgit.cgi/yocto-autobuilder-" rel=3D"noreferrer" target=3D"_=
blank">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-</a><br>
&gt;&gt; helper/tree/config.json<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0did you mean to say that i have to set MACRO in<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local.conf based on<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0this file.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0*Thanks &amp; Regards,*<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0Rahul Kumar<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0Software Engineer,Linux Solutions Engineering<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0Group,Montavista Software LLC<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0Email Id: <a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@=
mvista.com</a> &lt;mailto:<a href=3D"mailto:rahulk@mvista.com" target=3D"_b=
lank">rahulk@mvista.com</a>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto=
:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a> &lt;mailto:<a h=
ref=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a>&gt=
;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0&lt;<a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noreferr=
er" target=3D"_blank">https://plus.google.com/+CodeTwoSoftware</a>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0On Mon, Apr 27, 2020 at 11:46 PM Richard Purdie<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bla=
nk">richard.purdie@linuxfoundation.org</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto=
:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linux=
foundation.org</a>&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0&lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto=
:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linux=
foundation.org</a>&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0On Mon, 2020-04-27 at 18:30 +0200, Alexander Kanavin<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wrote:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &gt; You need to look at configurations defined here:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://git.yoctop=
roject.org/cgit/cgit.cgi/yocto-autobuilder-" rel=3D"noreferrer" target=3D"_=
blank">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-</a><br>
&gt;&gt; helper/tree/config.json<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &gt; and replicate them locally. Then you can<br>
&gt;&gt; reproduce the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0failures that<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &gt; the AB gets in those configurations.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0That start of the failing logs on the autobuilder<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 also list out the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0configuration options for that build.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Cheers,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Richard<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Randy MacLeod<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Wind River Linux<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; # Randy MacLeod<br>
&gt;&gt; # Wind River Linux<br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
</blockquote></div>

--0000000000006d5b5905a672dcae--
