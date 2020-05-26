Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.55473.1590512900873977698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 10:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DohsbVRT;
 spf=pass (domain: konsulko.com, ip: 209.85.210.49, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f49.google.com with SMTP id b18so16933053oti.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UmFgLZOyHnaxfzQHvB7ib9adsSUUGSqKMem5Q+sqFK8=;
        b=DohsbVRTBEPaqhALlHwrkl2gbREtQO6GPoBO7QedL6SFni9AmIAwL8vty3cfgwdEyG
         7W5rDBUjsa02edLuxvumBaiVgRfPx5D+//dLDZQo5gQarlsKiTj1Ig39YqR/LR5axTRZ
         WcAvynsE9Urm5o6Y6IWlTdTOA8DhjAZUjB3eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UmFgLZOyHnaxfzQHvB7ib9adsSUUGSqKMem5Q+sqFK8=;
        b=O+LbAU0cAu3qYmadXBGKXodnf8PkB9o8OGJJbFALXATxC/IZ84qH4pxF5coiimdoDK
         umHJ0dhcstbvnkLCyD6QXsqM6iKI2ebq1iMMtc9x1khRDvFC/Nz7UpRPha5kA9tRkpVH
         o/Un/aoXgeYweIh2DZ7Quf3w+ze8h9HYtONRkJK00evSjIvLOsKmH8H6MZZdJ0MUqdyj
         +OR9oh59L5TKRhXd7mjl8qGNT6GaVpYAaV7uzDrVmv+bQEVuwYt/kSqajHGNXdvXnqqv
         Ps9yCNzE5TBhxHVxM64Wdv3aBdgZR3fnwf/oSVlF42I4MsZBwdXhFhleIrqTV6fZk6XQ
         DFQQ==
X-Gm-Message-State: AOAM530ECk++jHfPrvuqMY96o+R4JBIMKQARyX13DnCNt+g6Ga6lXUzC
	Rv/YRpcCg6NpruvrP5wgux6D5UXUxkEg3rhtlzDVgw==
X-Google-Smtp-Source: ABdhPJxE13Ycss+wC7kmVN0GqXfwDe8/sjfFeOL7U6bn7tcJc/hzrqzmYwBOcSEVYnS+hg5d9kCRDjFT8/qScy/ERKk=
X-Received: by 2002:a9d:a6a:: with SMTP id 97mr1436019otg.305.1590512900009;
 Tue, 26 May 2020 10:08:20 -0700 (PDT)
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
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 26 May 2020 18:08:08 +0100
Message-ID: <CAM9ZRVtJY8NZ8nnmNUZ6KNbRNYtfQzkoW929hn2wRFb2C1btDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Rahul Kumar <rahulk@mvista.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm looking at this after our chat on the call today, picked on this
email in particular just because I needed one to reply to....

On Wed, 20 May 2020 at 21:59, Randy MacLeod <randy.macleod@windriver.com> w=
rote:
>
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
 & Zlib"
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

If the bzip2-tests repository is added to SRC_URI then it will be
considered part of the "sources" when you collect all the sources
using something like the archiver bbclass. So LICENSE needs to state
the conditions which need to be followed if you then distribute all
those sources together as an aggregate.

Therefore option (1) is the more accurate representation of the
licenses as they're reported to us by upstream. I'd follow that unless
you've got reason to believe that upstream (in this case,
https://sourceware.org/git/?p=3Dbzip2-tests.git;a=3Dtree) are wrong about
their own licenses.

If you have reason to believe that upstream are wrong then that should
be discussed upstream if possible and any conclusions reached should
go into the recipe as a comment alongside the LICENSE line.

I also think it's worth making clear that the job of OpenEmbedded /
Yocto Project is not to provide legal advice on how to interpret the
various upstream collections of license conditions and license files
that we find. We're not qualified or resourced to do that and it's
always nuanced by jurisdiction and other concerns in practice anyway.
So when I say "any conclusions reached should go into the recipe as a
comment", those conclusions should be about where those license
conditions come from rather than justifying some interpretation of the
conditions.

Thanks,

--=20
Paul Barker
Konsulko Group
