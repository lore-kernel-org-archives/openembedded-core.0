Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EF6C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 17:36:20 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.14263.1639416978896789847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AOQxW0WQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id n9so11512897uaq.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Na0FBDkO+F3uumCyKtDH/YFxPQG7lkVKQc//S1Qh/OE=;
        b=AOQxW0WQZf7VBUXL6ALD7xr5FAkY+Umf7uvg5Pc5D3I2sMrHh7LqeKFBt1DzNdzJgg
         0PrPfkk4cVyOS/syqHIxyydWh94SBJ9jY1eyn+xqW9k8sVRgWs8Z/AfBqvWrmuIl7CMe
         I51G2ls56IZFAIwOE99HKos/rL0azBG7MI6QC+VGzPov1XYHrI+MVJYPsF8r+QCXlTMP
         nVJaL5ooB43OUYBF5h/WX2keZSo6itpFWOlrOiDT6qJScbLULKSgIFvbvhMFRr2We6Vh
         iZvCJ7fZbjSlbPBSz8uCgvG3zi+bLOH50h5lSv6ayVVnwZhj62tD6AKPYxLMuLuX9T4e
         l0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Na0FBDkO+F3uumCyKtDH/YFxPQG7lkVKQc//S1Qh/OE=;
        b=7Yw6ZTqM+sZFiYnsr65hHYqewpOXRqeBS5yDTXaT5djuWbq+RRwuvdG/hiZD40paIk
         CcAwkUKg85Z8dPSfxvgYv7ePVn99ZHepD7mqtZrFLSnSeE28qixVe5G6V8OXPGJOF87t
         iQfSKIXj2D0mJeDV7waRmAgdsCGqXXYnQaftWyaVMTGYteTH11lAS7/sRBU6nyY+YQ9G
         QU+QeVAqGQNeA+Hp6jePTk5n0AEefya7sImPyG/EhKvabNg7ml5i9Ds3N1xKgGP1Xi4b
         HvbkaV3erw7wDLBHs8UH2w9GUxCNdHeABvg5dLnRhN2BVYjJy8oCQlMUR+nHC4K3Nstc
         sspQ==
X-Gm-Message-State: AOAM532LYUQ1pDpmDCRAPmkLY3ZPubgpxxpeMjJoBtejPhhT7tKGu8m6
	ydjehNaPkgc9uV6cE8ilQlqy+dxJOx0EcmqNByo=
X-Google-Smtp-Source: 
 ABdhPJxBymW3t+CpC10XWBWveY8CUW3wE0Aali2A2cUt73qL4Bd5XVp3e9AGHpsZ8GCyuZgn47vb+KV5pfqj56AoKKg=
X-Received: by 2002:a9f:218c:: with SMTP id 12mr41373255uac.71.1639416977937;
 Mon, 13 Dec 2021 09:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
 <b2a5cb5f05016901b1c9d56e0d68f939c549db19.camel@linuxfoundation.org>
 <CAEHkU3U4g-dtXUujeyN0TowzA09HJowv4+Vz+n_um80A+Uk2Zg@mail.gmail.com>
In-Reply-To: 
 <CAEHkU3U4g-dtXUujeyN0TowzA09HJowv4+Vz+n_um80A+Uk2Zg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Dec 2021 18:36:06 +0100
Message-ID: 
 <CANNYZj8KyHPbVf+fkppo+wMyKB__mNs_-6kDFbYCiQ-Odaqzpw@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] implement applying patches from a
 directory
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="0000000000009bd7bc05d30a822c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 17:36:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159655

--0000000000009bd7bc05d30a822c
Content-Type: text/plain; charset="UTF-8"

But you can use externalsrc to simply point to a custom source checkout, no?

Alex

On Mon, 13 Dec 2021 at 18:34, Max Krummenacher <max.oss.09@gmail.com> wrote:

> On Fri, Dec 10, 2021 at 4:57 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2021-12-10 at 14:04 +0100, Max Krummenacher wrote:
> > > The current developer manual [1] specifies that patches that are
> > > part of a directory which is given in SRC_URI are applied by
> > > the do_patch task. However that is not implemented in the
> > > current code.
> > >
> > > This patchset implements that, but deviates from what is
> > > documented. If the patches are applied I will send a patch
> > > for the documentation changing the relevant part to:
> > >
> > > ```
> > > If you have a directory full of patch files and you want to
> > > apply them all you can add the directory to SRC_URI and add
> > > the "apply=yes" parameter. This will apply ALL files in the
> > > directiory, including files in subdirectories.
> > > The patches will be applied sorted by their filename. Files
> > > from subdirectories will be sorted into the list at the
> > > position given by the subdirectory name.
> > >
> > >    SRC_URI = " \
> > >        git://path_to_repo/some_package \
> > >        file://path_to_lots_of_patch_files;apply=yes \
> > >        "
> > >
> > > In the previous example all the files in the directory holding
> > > the patch files would be applied as a patch.
> > > ```
> > >
> > > Max
> > >
> > > [1]
> https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-tasks-patch
> > >
> > > Max Krummenacher (2):
> > >   lib/oe/patch.py: apply patches from src_uri specified directories
> > >   lib/oe/recipeutils.py: follow changed method argument list
> > >
> >
> > Can I ask about the motivation here? Have you a use case you needed this
> to work
> > with or are you just making the code match the docs?
> >
> > I'm a little worried about adding features like this which aren't
> commonly used
> > and clearly haven't been needed for a while. Such changes really do need
> some
> > kind of test case and as Bruce mentions, ordering of patches patches in
> > directories is a concern, you did at least sort the listdir() output
> which is
> > good :)
> >
> > In the past when I've needed something like this, dumping "ls -1" into a
> file
> > and turning it into a SRC_URI hasn't been too hard even for long lists of
> > patches...
>
> I want to do continuous integration / testing in our upstreaming efforts
> to U-Boot/Kernel. So I would create a directory with any prerequisite
> patchsets and our mainlining patchsets which are on the ML but not yet
> in the repo and put the individual patches in the relevant directory.
>
> Should any work on the repo break any of the patches automated testing
> would then trigger us to rebase/change whatever needed.
> With the directory approach would take away the burden of fiddling
> with patch lists in SRC_URI.
>
> I assume there already is a test for do_patch in the current automated
> testing. I could integrate the recipe I used for testing this extension
> of the patch functionality.
>
> I used the "ls -1" approach in the past to make my life easier, I guess
> however that the directory approach would simplify things even more.
>
> Would a patchset with a test be acceptable?
>
> Cheers,
> Max
> >
> > Cheers,
> >
> > Richard
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159654):
> https://lists.openembedded.org/g/openembedded-core/message/159654
> Mute This Topic: https://lists.openembedded.org/mt/87635232/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009bd7bc05d30a822c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>But you can use externalsrc to simply point to a cust=
om source checkout, no?</div><div><br></div><div>Alex<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 13 D=
ec 2021 at 18:34, Max Krummenacher &lt;<a href=3D"mailto:max.oss.09@gmail.c=
om">max.oss.09@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Fri, Dec 10, 2021 at 4:57 PM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 2021-12-10 at 14:04 +0100, Max Krummenacher wrote:<br>
&gt; &gt; The current developer manual [1] specifies that patches that are<=
br>
&gt; &gt; part of a directory which is given in SRC_URI are applied by<br>
&gt; &gt; the do_patch task. However that is not implemented in the<br>
&gt; &gt; current code.<br>
&gt; &gt;<br>
&gt; &gt; This patchset implements that, but deviates from what is<br>
&gt; &gt; documented. If the patches are applied I will send a patch<br>
&gt; &gt; for the documentation changing the relevant part to:<br>
&gt; &gt;<br>
&gt; &gt; ```<br>
&gt; &gt; If you have a directory full of patch files and you want to<br>
&gt; &gt; apply them all you can add the directory to SRC_URI and add<br>
&gt; &gt; the &quot;apply=3Dyes&quot; parameter. This will apply ALL files =
in the<br>
&gt; &gt; directiory, including files in subdirectories.<br>
&gt; &gt; The patches will be applied sorted by their filename. Files<br>
&gt; &gt; from subdirectories will be sorted into the list at the<br>
&gt; &gt; position given by the subdirectory name.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 SRC_URI =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://path_to_repo/some_package \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://path_to_lots_of_patch_files;app=
ly=3Dyes \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt; In the previous example all the files in the directory holding<br=
>
&gt; &gt; the patch files would be applied as a patch.<br>
&gt; &gt; ```<br>
&gt; &gt;<br>
&gt; &gt; Max<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"https://www.yoctoproject.org/docs/current/mega-man=
ual/mega-manual.html#ref-tasks-patch" rel=3D"noreferrer" target=3D"_blank">=
https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#ref-=
tasks-patch</a><br>
&gt; &gt;<br>
&gt; &gt; Max Krummenacher (2):<br>
&gt; &gt;=C2=A0 =C2=A0lib/oe/patch.py: apply patches from src_uri specified=
 directories<br>
&gt; &gt;=C2=A0 =C2=A0lib/oe/recipeutils.py: follow changed method argument=
 list<br>
&gt; &gt;<br>
&gt;<br>
&gt; Can I ask about the motivation here? Have you a use case you needed th=
is to work<br>
&gt; with or are you just making the code match the docs?<br>
&gt;<br>
&gt; I&#39;m a little worried about adding features like this which aren&#3=
9;t commonly used<br>
&gt; and clearly haven&#39;t been needed for a while. Such changes really d=
o need some<br>
&gt; kind of test case and as Bruce mentions, ordering of patches patches i=
n<br>
&gt; directories is a concern, you did at least sort the listdir() output w=
hich is<br>
&gt; good :)<br>
&gt;<br>
&gt; In the past when I&#39;ve needed something like this, dumping &quot;ls=
 -1&quot; into a file<br>
&gt; and turning it into a SRC_URI hasn&#39;t been too hard even for long l=
ists of<br>
&gt; patches...<br>
<br>
I want to do continuous integration / testing in our upstreaming efforts<br=
>
to U-Boot/Kernel. So I would create a directory with any prerequisite<br>
patchsets and our mainlining patchsets which are on the ML but not yet<br>
in the repo and put the individual patches in the relevant directory.<br>
<br>
Should any work on the repo break any of the patches automated testing<br>
would then trigger us to rebase/change whatever needed.<br>
With the directory approach would take away the burden of fiddling<br>
with patch lists in SRC_URI.<br>
<br>
I assume there already is a test for do_patch in the current automated<br>
testing. I could integrate the recipe I used for testing this extension<br>
of the patch functionality.<br>
<br>
I used the &quot;ls -1&quot; approach in the past to make my life easier, I=
 guess<br>
however that the directory approach would simplify things even more.<br>
<br>
Would a patchset with a test be acceptable?<br>
<br>
Cheers,<br>
Max<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159654): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159654" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159654</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87635232/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87635232/1686489</a><br>
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

--0000000000009bd7bc05d30a822c--

