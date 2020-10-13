Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web11.13559.1602599925009782801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 07:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HC4Q2+Ua;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id y16so16860353ila.7
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6zuf1WPagkxFYrNkUBMyFi4GQgSJfybj7ieZaA9VmDo=;
        b=HC4Q2+UaU2PXb9OJgVZElf9EEgOfNoIUdsminfyzaZnGcfvCUoxBGu5mBzw2vWEDjC
         3W0Lv022vb4kwN/IC4gzh0pWkc97lC2HNh1m6uiKDDbvWjdvRf30euHjbvNFnrAF/4u1
         UitmdGirzbceBpKJcgHHEUj+tknWYmzbdgXq1HSt0RFregHBB0EKcQ/6lXdQKFmi0YNG
         U186PD9TDow29nEpgDVQoJj9uQyB3VAa86MeAIibvJLKPJi9bLXYMGiOSTLlYjD22u9a
         339b0Lriw73QN/8Jx3aCQp3DaHtzPiQ0F20RDOgNX7o6EstCpVYxOa1pfjFqz+bGEXn5
         qMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6zuf1WPagkxFYrNkUBMyFi4GQgSJfybj7ieZaA9VmDo=;
        b=RPKl2Ao68xAkCZ1+T/6wBoCbnQGRFME+NIoPjwOqsWm8i7UsCwz6aZyNcZ1vqDtVJR
         W8IJhEKGbQE6EVHgG/Yplh11+rJrHiE5XOMW7ckmtYFk8CSYzIw74DAXYBj2iISRkny1
         6qNuS9K2eHWU22uQrYrXYLeBsDT0sJRLfjKtw8M0TlMGquqlufPZO1y13Dsn9nY+nxHV
         1JwosBepFFCLu8W8E4V+XolUzCpo/vtngDzhLnCwkryDRCz/pZesUQumfZ3zP8eWBoI1
         iQI2ji78mmKp57LwYJc4dbkTSiYT+jnFPul8IboUmBrHk18CtK1FlSNIx2EFNK/5ksUn
         fBFw==
X-Gm-Message-State: AOAM530zjNJSU3A5oiO6iOmGFLri9CbLPpkoanZIkuAVBeocP5hDPN8f
	ksf99LKlio+grY/gwkxJkcXtHmidHeAdCxkFgqU=
X-Google-Smtp-Source: ABdhPJy3yN4sSYhAgHfp5TtxmLkDifgUxQ9Dse+AUhUN3bg7fnmG8jZOUMWKE5vhFsV8/L0SrqaA7oaVnSRclfMNLI4=
X-Received: by 2002:a92:cd42:: with SMTP id v2mr190283ilq.65.1602599924328;
 Tue, 13 Oct 2020 07:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
 <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
 <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
 <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com>
 <CAHtQpK7T7rqfACB7MSnTh701yPbPy2B51Em924-FueriejFXOA@mail.gmail.com>
 <CANNYZj_AqswY3JJnVu=vtNQPdgfd=tbE89WgRD4Fxm1O=msFFQ@mail.gmail.com> <163D7EFF5EFA949A.25724@lists.openembedded.org>
In-Reply-To: <163D7EFF5EFA949A.25724@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 13 Oct 2020 15:38:34 +0100
Message-ID: <CANPvuRmeDf9Mmcj95noPET0d=NGtcC33k8qRhBRb95pLOxMQHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Andrey Zhizhikin <andrey.z@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have new 3 recipes for fix the build of the vulkan gstreamer plugin

spirv-tools:
move it from meta-oe, add native build and install some extra header files=
.

glslang:
is the official reference compiler front end for the OpenGL ES and
OpenGL shading languages.

shaderc:
A collection of tools, libraries and tests for shader compilation that
provide the binary glslc need to build the vulkan plugin.

What is the better method to submit this?
A new patch series with these 3 recipes or a gstreamer patch series v2
with all the recipes needed.

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
ter=C3=A7a, 13/10/2020 =C3=A0(s) 09:11:
>
> Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
> 12/10/2020 =C3=A0(s) 20:45:
> >
> > On Mon, 12 Oct 2020 at 20:20, Andrey Zhizhikin <andrey.z@gmail.com> wr=
ote:
> >>
> >>
> >> What I meant to point out was - there is a dependency in Vulkan on
> >> glslang, irrespective whether it is compiled standalone or as a
> >> dependency of another package. I believe this Vulkan <- glslang
> >> dependency should be solved first before Vulkan can be included
> >> anywhere further.
> >>
> >> As I know, it is currently solved locally in meta-freescale-distro
> >> layer, hence it was my question on whether it should be moved to
> >> OE-Core to solve the Vulkan dependency altogether?
> >
> >
> > Can you please point to where glslang is used in the vulkan source tre=
e? Is it something recently added, as vulkan bits and examples have been bu=
ilding fine without it in oe-core?
>
> I am working on a recipe for 'shaderc' that is needed for build the
> gstreamer vulkan plugin
>
> This recipe needs glslang and spirv-tools.
> I don't have knowledge of the existence of glslang on
> meta-freescale-distro and I created one for myself.
>
> >
> > Alex
>
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
