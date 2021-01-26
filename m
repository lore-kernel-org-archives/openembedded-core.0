Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.10177.1611654268083538872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 01:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JJGSZ0tn;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a10so22046444ejg.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 01:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fe9ItR5viKzCCbNGA3JjY36Df6cbF1ii6Z30AWjDPRI=;
        b=JJGSZ0tnoJFnkQRhjnV8INKspFTYgweIYFulAsIbeRcT77Y17MmRLplGZ4lNh/LJ1U
         B5LxcXdHc3IVEQ8MMYXCtMfQqxhnErETuVx9NnvZmPcK4QKx85MSXsHsgwWR4v/Jn+Tr
         ayF4aHX3wRDNxcp5hX7rd0scVjDj/laTfrmWepCR/37xfVtFiGkZaUgBWPI3uLFSppdG
         pon4BC/ilXu1QVCBaHjh1p+S1ZgKU8m3UX+SFA8+GLuif/BndFajcJYLak6OnQAD1YlX
         wfGjbMk2sl9ra7UapliM3OiQ16IVLWVLwTdaj85JJUb0uDB1sRqBOLoIN+qeABmdQ4PS
         tfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fe9ItR5viKzCCbNGA3JjY36Df6cbF1ii6Z30AWjDPRI=;
        b=tg0zVw1IHwIlJHDC2Ok2ERtciGmBB02PXvrnfU8AQS4efL0siOJ4FJ6SHphy0VR/11
         7cTfQApQVRdbtGL6LJINkGPeWsuSbBmHlvxjI4aZQJ8fLwUZnNkTMqkNZXVz2Jq0AJip
         51PY0Dfq6+/cEakWOuNYWRtrJ0so2QQ8lCxhEj3R1pmcF90aWVIFEsBG7+79MfEfqQvb
         SisBK9mSJso/A6B1VR8u+gg8SpxoT4jzQBqoY4YvnyHv7QMc4G8XfO5x6WMozMVFFpug
         EsomJgKfim3Nf+00e/YKiMpA03TryKF+L/bRgjg72lWv5G74kHfcHuR5dzDW3B8rKVE+
         jKKg==
X-Gm-Message-State: AOAM530rn+LFezPjctaZN9z5Ac4onlH/F1WvJYcIawbCA3RCAUF92y/T
	P9gD8+HKCndi42KAkyKJZ1QlvPff4oOw6EXiXpI=
X-Google-Smtp-Source: ABdhPJwoB3W4RZOGQt8K/Ng4FOJ+3tf8JF+o/YxxhHmTumdcH9wSvY8Lv5zBSp0MbUAgKLka66yQG18BCt6GJk3J4so=
X-Received: by 2002:a17:906:49c2:: with SMTP id w2mr2828901ejv.12.1611654266593;
 Tue, 26 Jan 2021 01:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20210124182647.1613511-1-quaresma.jose@gmail.com>
 <20210124182647.1613511-3-quaresma.jose@gmail.com> <37e34b2d593317b1910784a988fe14de1d32c232.camel@linuxfoundation.org>
 <CANPvuR=3dY1KvoPcjrpAzdMnr2o5kSfR_M7PcVQEnFmhQn3wTw@mail.gmail.com> <d49db6f343cc465a25909c516d5618c403b9098d.camel@linuxfoundation.org>
In-Reply-To: <d49db6f343cc465a25909c516d5618c403b9098d.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 26 Jan 2021 09:44:15 +0000
Message-ID: <CANPvuRnsocSn5ZrevfHG-S+mJ=MmieLQ35JbP-nsm=91VGFizg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] selftest/reproducible: remove spirv-tools-dev from exclusion list
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000000fb4ed05b9ca80df"

--0000000000000fb4ed05b9ca80df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Many thanks for your explanation.

For now i think is better to drop this pacth and will resend it when I have
a solution.

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia ter=C3=
=A7a,
26/01/2021 =C3=A0(s) 00:04:

> On Mon, 2021-01-25 at 23:52 +0000, Jose Quaresma wrote:
> > Hi Richard,
> >
> > librt.so is part of the glibc and are allays present on staging
> > sysroot.
> > how does the cmake can find the librt.so outside of the sysroot if it
> > are present on that.
> >
> > The problem is at:
> >
> https://github.com/KhronosGroup/SPIRV-Tools/blob/b27b1afd12d05bf238ac7368=
bb49de73cd620a8e/source/CMakeLists.txt#L397
> >
> > Probably I need to force the find_library to search first on
> > STAGING_DIR_HOST
>
> I think somehow we need to replace the full sysroot path with a
> variable, or make cmake do that itself if we can. It may be possible to
> have cmake evaluate the variable with reference to the sysroot too but
> that is likely more complex. I'm afraid cmake isn't one of my strong
> areas.
>

I will look at this to see what can be changed in the cmake.bbclass to
achieve
your suggestion.


>
> We do have a second issue too the autobuilder has shown up:
>
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210125-3iaw=
hiyz/packages/diff-html/
>
> Does something in glslang or spriv-tools use precompiled headers? We
> had problems with that in the vulkan-samples recipe that looked like
> this (a cmake based C++ project where there were changes in the
> debug_loc section) so we may need to disable PCH here too...
>

Yes, I think there are the glslang that have precompiled headers enabled.
I will investigate this issue and send a fix for it.


>
> Cheers,
>
> Richard
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--0000000000000fb4ed05b9ca80df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,</div><div><br></div><div>Many thanks for =
your explanation.</div><div><br></div><div>For now i think is better to dro=
p this pacth and will resend it when I have a solution.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; escreveu no dia ter=C3=A7a, 26/01/2021 =C3=A0(s) 00:04=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2021-0=
1-25 at 23:52 +0000, Jose Quaresma wrote:<br>
&gt; Hi Richard,<br>
&gt; <br>
&gt; librt.so is part of the glibc and are allays present on staging<br>
&gt; sysroot.<br>
&gt; how does the cmake can find the librt.so outside of the sysroot if it<=
br>
&gt; are present on that.<br>
&gt; <br>
&gt; The problem is at:<br>
&gt; <a href=3D"https://github.com/KhronosGroup/SPIRV-Tools/blob/b27b1afd12=
d05bf238ac7368bb49de73cd620a8e/source/CMakeLists.txt#L397" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/KhronosGroup/SPIRV-Tools/blob/b27b1=
afd12d05bf238ac7368bb49de73cd620a8e/source/CMakeLists.txt#L397</a><br>
&gt; <br>
&gt; Probably I need to force the find_library=C2=A0to search first on<br>
&gt; STAGING_DIR_HOST<br>
<br>
I think somehow we need to replace the full sysroot path with a<br>
variable, or make cmake do that itself if we can. It may be possible to<br>
have cmake evaluate the variable with reference to the sysroot too but<br>
that is likely more complex. I&#39;m afraid cmake isn&#39;t one of my stron=
g<br>
areas.<br></blockquote><div><br></div><div>I will look at this to see what =
can be changed in the cmake.bbclass to achieve</div><div>your suggestion.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
We do have a second issue too the autobuilder has shown up:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2021=
0125-3iawhiyz/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210125-3iawhiyz/=
packages/diff-html/</a><br>
<br>
Does something in glslang or spriv-tools use precompiled headers? We<br>
had problems with that in the vulkan-samples recipe that looked like<br>
this (a cmake based C++ project where there were changes in the<br>
debug_loc section) so we may need to disable PCH here too...<br></blockquot=
e><div><br></div><div>Yes, I think there are the glslang that have precompi=
led headers enabled.</div><div>I will investigate this issue and send a fix=
 for it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Quar=
esma</div></div></div>

--0000000000000fb4ed05b9ca80df--
