Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A28C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 13:43:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.19599.1700660604120714175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 05:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lWy2GyYF;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b2b3da41eso12534255e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 05:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700660602; x=1701265402; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AqoJt/3IlIFtlA4PX99ytIpQDhTP2NUA+k+G5oYVv0k=;
        b=lWy2GyYFjNLy/nIX6caJL2NS1JHj+yv3hSrdmscikIHa0i9XV5dwgUGqpQnkb13isw
         Notn8eSfw65ZmL2iXQLa/hQjGgxOBm9VSz93ZeDopdkZwII0CM3g1ww53q61yYbUgVVn
         mtpx8BF4PiDculwtjwEbcb4LcmilvWcBf5bLa+Lr3SP+wfKAY7vEGrZCwWluii5Qdpqs
         3xn/SVNbCGxQK2xp5dwzCOuc4UdeixZOQ90dLoDH+keF5JL0FMkpyEBJF7mxKs7hXlF2
         UVfRmvXZ9HSPwSexNAMr/TJnMMOa/RZdFKPYXWSoyZukGp4GpBY66F6vGO4aYLmKDn9Q
         Zc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700660602; x=1701265402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqoJt/3IlIFtlA4PX99ytIpQDhTP2NUA+k+G5oYVv0k=;
        b=uzLNlbKPV/a3qred3F252VtTtItF1zEh2nncRW1yDOJIzacgVgCVG4/+tsdUww0VYv
         FgcKDtdz29RiwmDM9YMvQTuudfkNZtUV468xTHr8F/jOhNjE3t/lSSIzC47IP/V19/Hn
         ihVoFsU8smMskBSSbGYt259LroWeuVGoJKD1Ydbu5uKnAlAiroDNiFEkGjNrassc5IxN
         fphetAz+sELO6Kn3jB4SXZ5IkOOLouMZ1ctqVMxbb8NVlxdgww6rUSbJsZ6aa75wdOMN
         2n4A+ICl/LBKEOW7ycOKrSum+PXc/gVb8qQJLyitUxzLWVTHrZ9N55X+GIP5BSM4xx8x
         fZOA==
X-Gm-Message-State: AOJu0YxHDl91R7roKQ9dT7iJ29xz7rvaAHRAZN7UnszePJ2Sx+LeiZR4
	S98IBEz85ZJ15ydatQyxLRJ7nM54tDIRej+cADc=
X-Google-Smtp-Source: AGHT+IGuZQSeDC8Q3ad+7xKLTLivhQIEC5YwLeT/zKNGMLXwRXhVEYL1YGzgb+GhQw+BIPPGpuUvlUSW72MB2yplJGQ=
X-Received: by 2002:a5d:6985:0:b0:32d:9a20:c9e0 with SMTP id
 g5-20020a5d6985000000b0032d9a20c9e0mr1650344wru.61.1700660602243; Wed, 22 Nov
 2023 05:43:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1700600804.git.martin.jansa@gmail.com> <c70900d21794156f56b8b54978422e89638fba71.camel@linuxfoundation.org>
In-Reply-To: <c70900d21794156f56b8b54978422e89638fba71.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 Nov 2023 14:43:06 +0100
Message-ID: <CA+chaQcWYmTCPkBRMbAUTYQi4PuKE+w+gV=EzRFnGyFBvFJ+BQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/21] Consistent naming scheme for deployed artifacts
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001490ae060abde70c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 13:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191102

--0000000000001490ae060abde70c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 2:19=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2023-11-22 at 13:44 +0100, Martin Jansa wrote:
> > This is the final part of changes for [YOCTO #12937].
> >
> > I've run complete selftest with this and didn't see any failures.
> >
> > Only these 4 fail once, but pass when re-executed (and the same is
> > reproducible here with master):
> > pkgdata.OePkgdataUtilTests.test_lookup_recipe
> > spdx.SPDXCheck.test_spdx_base_files
> > esdk.oeSDKExtSelfTest.test_image_generation_binary_feeds
> > esdk.oeSDKExtSelfTest.test_install_libraries_headers
> >
> > runtime_test.TestImage.test_testimage_virgl_gtk_sdl and this one
> > needs extra "xhost +local" otherwise fails with:
> >   runqemu - ERROR - Failed to run qemu: Invalid MIT-MAGIC-COOKIE-1 key
> >   qemu-system-x86_64: OpenGL is not supported by the display
> >
> > The short description of these changes is that instead of symlinks
> > it creates hardlinks in deploy dir and the kernel do_deploy creates
> > the artifacts without version suffix and the do_deploy_links task
> > adds those versioned hardlinks (this way do_deploy can be reused from
> > sstate and only quick do_deploy_links is re-executed when the
> > IMAGE_VERSION_SUFFIX changes - before that if you cannot re-use do_depl=
oy
> > from sstate due to different artifact filenames you had to re-run e.g.
> > do_compile as well if you haven't built the same in the same TMPDIR
> > before).
>
> I am a bit worried about this change since there were uses for having
> the symlinks present and this unconditionally moves everything over to
> hardlinks.
>
> With the symlink, you can see the pointer quite clearly, with
> hardlinks, it is unclear which files are duplicates of each other
> withouth diving into comparing inodes.
>

Yes, it's definitely disadvantage of hardlinks (especially if someone
forgets to preserve hardlinks when cp or rsync the deploy directory). But
having the version in symlink would be even worse (as it could point to
different artifact already).

And having the version in the artifact itself requires do_deploy to re-run
and without prior build it would re-run do_compile for kernel, bootloader
and other artifacts as well.

This is also why I've made sure you can set IMAGE_VERSION_SUFFIX to empty
to prevent all of these hardlinks to be created, if all you care is just
whatever is latest to be in the deploy directory.

It might be interesting to have the versioned and version-less artifacts in
different directories, so that you always cp/rsync only one set of them,
but I fear that it would require even more oeqa changes and this area is
already a bit too complicated I think.

FWIW: we're using this for webOS builds since 2015 with webos_deploy task
mentioned in the first patch, but to do this from "outside" is a bit
difficult to maintain as webos_deploy needs to know about all possible
artifacts other layers might create and also to inject dependency on
webos_deploy task from all the right places.

Thanks for review Richard, lets hope that someone else will also share an
opinion about this.

Cheers,

Part of the reasoning was due to the way OE used to work where it would
> stack images, each build would add a new one and it would update the
> end symlink to point at the latest. Once sstate started removing old
> entries, that became less needed but the pointers still help runqemu
> and other tooling find the latest.
>
> This change is trying make the code do something different and it to
> change versioning and do that in a way which allows maximal reuse from
> sstate.
>
> Both are valid usages so we gain some things with the change but lose
> others. I'm not sure how users in general are going to find things
> overall :/.
>
> Cheers,
>
> Richard
>
>
>

--0000000000001490ae060abde70c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Nov 22, 2023 at 2:19=E2=80=AFPM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2023-11-2=
2 at 13:44 +0100, Martin Jansa wrote:<br>
&gt; This is the final part of changes for [YOCTO #12937].<br>
&gt; <br>
&gt; I&#39;ve run complete selftest with this and didn&#39;t see any failur=
es.<br>
&gt; <br>
&gt; Only these 4 fail once, but pass when re-executed (and the same is<br>
&gt; reproducible here with master):<br>
&gt; pkgdata.OePkgdataUtilTests.test_lookup_recipe<br>
&gt; spdx.SPDXCheck.test_spdx_base_files<br>
&gt; esdk.oeSDKExtSelfTest.test_image_generation_binary_feeds<br>
&gt; esdk.oeSDKExtSelfTest.test_install_libraries_headers<br>
&gt; <br>
&gt; runtime_test.TestImage.test_testimage_virgl_gtk_sdl and this one<br>
&gt; needs extra &quot;xhost +local&quot; otherwise fails with:<br>
&gt;=C2=A0 =C2=A0runqemu - ERROR - Failed to run qemu: Invalid MIT-MAGIC-CO=
OKIE-1 key<br>
&gt;=C2=A0 =C2=A0qemu-system-x86_64: OpenGL is not supported by the display=
<br>
&gt; <br>
&gt; The short description of these changes is that instead of symlinks<br>
&gt; it creates hardlinks in deploy dir and the kernel do_deploy creates<br=
>
&gt; the artifacts without version suffix and the do_deploy_links task<br>
&gt; adds those versioned hardlinks (this way do_deploy can be reused from<=
br>
&gt; sstate and only quick do_deploy_links is re-executed when the<br>
&gt; IMAGE_VERSION_SUFFIX changes - before that if you cannot re-use do_dep=
loy<br>
&gt; from sstate due to different artifact filenames you had to re-run e.g.=
<br>
&gt; do_compile as well if you haven&#39;t built the same in the same TMPDI=
R<br>
&gt; before).<br>
<br>
I am a bit worried about this change since there were uses for having<br>
the symlinks present and this unconditionally moves everything over to<br>
hardlinks.=C2=A0<br>
<br>
With the symlink, you can see the pointer quite clearly, with<br>
hardlinks, it is unclear which files are duplicates of each other<br>
withouth diving into comparing inodes.<br></blockquote><div><br></div><div>=
Yes, it&#39;s definitely disadvantage of hardlinks (especially if someone f=
orgets to preserve hardlinks when cp or rsync the deploy directory). But ha=
ving the version in symlink would be even worse (as it could point to diffe=
rent artifact already).</div><div><br></div><div>And having the version in =
the artifact itself requires do_deploy to re-run and without prior build it=
 would re-run do_compile for kernel, bootloader and other artifacts as well=
.</div><div><br></div><div>This is also why I&#39;ve made sure you can set =
IMAGE_VERSION_SUFFIX to empty to prevent all of these hardlinks to be creat=
ed, if all you care is just whatever is latest to be in the deploy director=
y.</div><div><br></div><div>It might be interesting to have the versioned a=
nd version-less artifacts in different directories, so that you always cp/r=
sync only one set of them, but I fear that it would require even more oeqa =
changes and this area is already a bit too complicated I think.</div><div><=
br></div><div>FWIW: we&#39;re using this for webOS builds since 2015 with w=
ebos_deploy task mentioned in the first patch, but to do this from &quot;ou=
tside&quot; is a bit difficult to maintain as webos_deploy needs to know ab=
out all possible artifacts other layers might create and also to inject dep=
endency on webos_deploy task from all the right places.</div><div><br></div=
><div>Thanks for review Richard, lets hope that someone else will also shar=
e an opinion about this.</div><div><br></div><div>Cheers,</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Part of the reasoning was due to the way OE used to work where it would<br>
stack images, each build would add a new one and it would update the<br>
end symlink to point at the latest. Once sstate started removing old<br>
entries, that became less needed but the pointers still help runqemu<br>
and other tooling find the latest.<br>
<br>
This change is trying make the code do something different and it to<br>
change versioning and do that in a way which allows maximal reuse from<br>
sstate.<br>
<br>
Both are valid usages so we gain some things with the change but lose<br>
others. I&#39;m not sure how users in general are going to find things<br>
overall :/.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div>

--0000000000001490ae060abde70c--

