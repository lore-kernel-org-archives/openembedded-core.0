Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web09.34537.1611571070501185682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 02:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gP+3fKIy;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id f3so2979789vkf.5
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCROLMZ+3Pnj8M+d8jkN9NrI2FoRJWQDPhqaXGSAdVY=;
        b=gP+3fKIy8eS6rQ8N/DdHPW6pU7Fek7xcEdikYv3rLLew9ErIhOhRybaX8xZFBJS/bU
         u7IRkIqG09mMXC2C5MM6L1pReLmkYiMsWCEfwjys7Z2n+F9yu0Iey8dkU+nE+tmG46uS
         X/G7uCc60+Ml7i6Sw1myY1muPBTfSFLQNzjLXPGImPVd+l7N0f4qUuAhTTa8tdXfG9N7
         5+M+FtLxC2KNY7k7Ln20RBvMx0r09Zsr1H9OJYbkdOoQrGAjGzyHdsb804h0362H9+33
         aS57gxrk3NXNxTl0ajW2tfXQ8lRlO9kT6VrbTZwl+v/BhatbI4cDY4qai/jWWzfOkEr3
         59VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCROLMZ+3Pnj8M+d8jkN9NrI2FoRJWQDPhqaXGSAdVY=;
        b=nSCOBtdlBdtETrRrEmJsoR6Kl5WgHk7yKw+06Gyfgoac6zopreTPNbO77bzKY/yWeB
         NTLzJjWVW3viPNvRmEF7BW4TAB9o+0lYHEiPwh8X0YFVdYyyD4Vp9iwZ64/nBW2Qe2g0
         n7GKfz9x38EYVzXF92ZxL7uDtu25Aum9ghnsI16BHACAxcWOLrXgV6dpSf9uL8BGkEEU
         9LMXGE6rKJFN1AsjcQuI/jEyWSvmS8r4bx4pj/8OXmvkzm2V+D66hlTuGgfoiYgk/lE8
         Eg4IVTTQffuXXbG78XHJ2CVTFq0I34FUtiuqixszR0FWQCUG0Bt2OAuLlVg6PBHXvLkW
         Obng==
X-Gm-Message-State: AOAM530gpIkzU6AV79TFo7Wj3Oz6zeszC0PMIw5RSF3nP/e2Yc8pgx+k
	eGfv2Vya9fUElF6fATNquXuWfPTiChSt59jYpA4=
X-Google-Smtp-Source: ABdhPJyXAMH/Ue4Fyhy4Ftp7LIyxF2tUnmrqklMUhkJilg2SA9GAetoYp2F8anDGKSw6d8ph20wfpEAvcp+QimhZY6s=
X-Received: by 2002:a1f:9854:: with SMTP id a81mr285028vke.0.1611571069520;
 Mon, 25 Jan 2021 02:37:49 -0800 (PST)
MIME-Version: 1.0
References: <MADEUP.165A67B026073E9B.4055@lists.openembedded.org>
In-Reply-To: <MADEUP.165A67B026073E9B.4055@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 25 Jan 2021 11:37:37 +0100
Message-ID: <CANNYZj9ALK125Jzn4YY+HScZr2+Dyv8ee6nq-stW1Nm4X=GDZQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] llvm: upgrading to 11.0.1 FAILED
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000021105b05b9b721dc"

--00000000000021105b05b9b721dc
Content-Type: text/plain; charset="UTF-8"

Khem, can you get this in please?

Alex

On Fri, 15 Jan 2021 at 13:31, <auh@auh.yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *llvm* to *11.0.1* has
> Failed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  upgrade llvm -V 11.0.1 -S
> 43ff75f2c3feef64f9d73328230d34dac8832a91
> NOTE: Starting bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)...
> Loading cache...done.
> Loaded 1420 entries from dependency cache.
> INFO: Extracting current version source...
> Removing 1 recipes from the x86_64 sysroot...done.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.49.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       =
> "3.2+snapshot-a040771cfe91971d3074d20435735f6cb47271d6"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       =
> "tmp-auh-upgrades:a040771cfe91971d3074d20435735f6cb47271d6"
> workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100%
> complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be
> rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> Traceback (most recent call last):
>   File
> "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line
> 334, in <module>
>     ret = main()
>   File
> "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line
> 321, in main
>     ret = args.func(args, config, basepath, workspace)
>   File
> "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py",
> line 553, in upgrade
>     old_licenses = _extract_licenses(srctree,
> (rd.getVar('LIC_FILES_CHKSUM') or ""))
>   File
> "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py",
> line 468, in _extract_licenses
>     with open(os.path.join(srcpath, path), 'rb') as f:
> FileNotFoundError: [Errno 2] No such file or directory:
> '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/llvm/LICENSE.TXT'
>
>
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> 
>
>

--00000000000021105b05b9b721dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Khem, can you get this in please?</div><div><br></div=
><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, 15 Jan 2021 at 13:31, &lt;<a href=3D"mailto:auh=
@auh.yoctoproject.org">auh@auh.yoctoproject.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *llvm* to *11.0.1* has Fa=
iled (devtool error).<br>
<br>
Detailed error information:<br>
<br>
The following devtool command failed:=C2=A0 upgrade llvm -V 11.0.1 -S 43ff=
75f2c3feef64f9d73328230d34dac8832a91<br>
NOTE: Starting bitbake server...<br>
NOTE: Reconnecting to bitbake server...<br>
NOTE: Retrying server connection (#1)...<br>
Loading cache...done.<br>
Loaded 1420 entries from dependency cache.<br>
INFO: Extracting current version source...<br>
Removing 1 recipes from the x86_64 sysroot...done.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.49.0&quot;<=
br>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&=
quot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-l=
inux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-=
64&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;pok=
y&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;3.2+snapshot-a040771cfe=
91971d3074d20435735f6cb47271d6&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;tmp-auh-upgrades:a04077=
1cfe91971d3074d20435735f6cb47271d6&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:09c7fc=
6e5341bfadb0f6037e7294aee2454eedef&quot;<br>
<br>
Initialising tasks...done.<br>
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% compl=
ete)<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn&#39;t need to be =
rerun and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 1 seconds<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/auh/build/build/poky/script=
s/devtool&quot;, line 334, in &lt;module&gt;<br>
=C2=A0 =C2=A0 ret =3D main()<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/auh/build/build/poky/script=
s/devtool&quot;, line 321, in main<br>
=C2=A0 =C2=A0 ret =3D args.func(args, config, basepath, workspace)<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/auh/build/build/poky/script=
s/lib/devtool/upgrade.py&quot;, line 553, in upgrade<br>
=C2=A0 =C2=A0 old_licenses =3D _extract_licenses(srctree, (rd.getVar(&#39;=
LIC_FILES_CHKSUM&#39;) or &quot;&quot;))<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/auh/build/build/poky/script=
s/lib/devtool/upgrade.py&quot;, line 468, in _extract_licenses<br>
=C2=A0 =C2=A0 with open(os.path.join(srcpath, path), &#39;rb&#39;) as f:<b=
r>
FileNotFoundError: [Errno 2] No such file or directory: &#39;/home/pokybui=
ld/yocto-worker/auh/build/build/build/workspace/sources/llvm/LICENSE.TXT&#3=
9;<br>
<br>
<br>
<br>
Please review the attached files for further information and build/update =
failures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.=
org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer=
" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000021105b05b9b721dc--
