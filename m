Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.17887.1627222408292701487
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jul 2021 07:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NLpGTHFq;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id f28so3750986vsh.12
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jul 2021 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YewlUXoel4W9iY58k1CHRSgZ1aEn0+oxhmFjDbf3JBA=;
        b=NLpGTHFqR/0hUyaVd9qB6u1Lsk1ABVoLth/NGWoxeJKOgR7diqT23nI0/nltcCXzdq
         zzw0jb8ev4xMCzAkb8Tqj3TMd5MMPIFb5k4JpHAF/zqjV8Y61NRJKSUbc4LhhhgRxYeF
         y+fRmGMIhMlgazVj1sbaypI1TN9sQSrxANEOYquSDANT0TKcsx0IAOVH+lscxU3r8g7j
         pZ5MWLnvd2Z5sP7b7lhkw7TTLaKAGTVitHFO0EzmKubSF1pmrXALZKbdw7OV9nl2OQLV
         cGen841qSTCREIJqm7gwxJob/ptQg8vg3YE3BXOraLxf2A9OFZvEz2qdMQm3sKqVXFT4
         HgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YewlUXoel4W9iY58k1CHRSgZ1aEn0+oxhmFjDbf3JBA=;
        b=EKDFOZv2yhIiA2ihGLwfnWV1aYg4RzfJ7oxU7aKXhc6HHzDtw9be8/JYEpEzeUMmnX
         nu3RpZhdbYYn4dUE4pRF6V1KulMZrXIr9G1gliDD6M9nZM3Hz6HpAR26fNYz7ixv7KpU
         OVaQJtWzqF6WGuVI4ZTt0X7h1Bg03dJgR97Rpejj0OiS5yhh45bK3Xia0RX7mFCEqFcd
         KWmeGckW9/LJ/Qp7sAsLN0YSmDY4WLUGfMFrwvj1JHR3ZnfmsHA1+d2nZ0Uh6Yui6irg
         w6n9T1BVbf079O6qgL6WLkR1lJpi9f7srA0JBG2/nfPWvHWvyay85gL0tfC40lDjuFmw
         iNcQ==
X-Gm-Message-State: AOAM533REV9AydANYqvS2VjnIFkI16XGEfIYwWlYwsE/he/xGgR+fNQk
	BXImvTOarlf9KmqPfeGenYV9C0pCxaO5WFn+PyWL18jCqRA=
X-Google-Smtp-Source: ABdhPJyGhyt+Pirwj/EJ3sd8TmDzOhEMGfQCJHvqqsyZraGEy+Ux7etoQSZUIiGKKWfvwZ41RTDi0yBysDk8Ov8Nro0=
X-Received: by 2002:a05:6102:23dc:: with SMTP id x28mr9587001vsr.31.1627222407420;
 Sun, 25 Jul 2021 07:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <60fd58d6.1c69fb81.aba65.176aSMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <60fd58d6.1c69fb81.aba65.176aSMTPIN_ADDED_MISSING@mx.google.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 25 Jul 2021 16:13:16 +0200
Message-ID: <CANNYZj8RqniPmbYKPyOEQoL2E-s2LK_H4-D2VfxcCKEqHGu4uw@mail.gmail.com>
Subject: Re: [AUH] meson: upgrading to 0.59.0 FAILED
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000909d8405c7f33d7d"

--000000000000909d8405c7f33d7d
Content-Type: text/plain; charset="UTF-8"

The latest round of upgrade helper emails didn't make it to oe-core list
(but I did get ones that were also CCd to me directly) - can you please
check?

Here's the log:
https://autobuilder.yoctoproject.org/typhoon/#/builders/112/builds/37/steps/11/logs/stdio

Alex

On Sun, 25 Jul 2021 at 14:28, <auh@auh.yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *meson* to *0.59.0* has
> Failed (devtool error).
>
> Detailed error information:
>
> Running 'devtool upgrade' for recipe meson failed.
> NOTE: Starting bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)...
> Loading cache...done.
> Loaded 1459 entries from dependency cache.
> INFO: Extracting current version source...
> Removing 1 recipes from the x86_64 sysroot...done.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.51.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       =
> "3.3+snapshot-0421d4df954a35ad0176a12db1060e52115b14b1"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       =
> "tmp-auh-upgrades:0421d4df954a35ad0176a12db1060e52115b14b1"
> workspace            = "master:982f98f721af11b5698be8fe959058823d1de0d3"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match,
> 100% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be
> rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> INFO: Extracting upgraded version source...
> INFO: Fetching
> https://github.com/mesonbuild/meson/releases/download/0.59.0/meson-0.59.0.tar.gz.
> ..
> Loading cache...done.
> Loaded 1459 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 822 .bb files complete (820 cached, 2 parsed). 1460 targets, 35
> skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "1.51.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       =
> "3.3+snapshot-0421d4df954a35ad0176a12db1060e52115b14b1"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       =
> "tmp-auh-upgrades:0421d4df954a35ad0176a12db1060e52115b14b1"
> workspace            = "master:982f98f721af11b5698be8fe959058823d1de0d3"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match,
> 0% complete)
> NOTE: No setscene tasks
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun
> and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> DEBUG 5 [Errno 25] Inappropriate ioctl for device
> Adding changed files:   0% |                                   | ETA:
> --:--:--
> Adding changed files:   0% |                                   | ETA:
> --:--:--
> Adding changed files:  15% |#####                               | ETA:
> 0:00:00
> Adding changed files:  30% |##########                          | ETA:
> 0:00:00
> Adding changed files:  45% |################                    | ETA:
> 0:00:00
> Adding changed files:  60% |#####################               | ETA:
> 0:00:00
> Adding changed files:  75% |###########################         | ETA:
> 0:00:00
> Adding changed files:  90% |################################    | ETA:
> 0:00:00
> Adding changed files: 100% |####################################| Time:
> 0:00:00
> INFO: Rebasing devtool onto c5d7d02bfafd0664a2d3e9c304d3aedf2b771bda
> WARNING: Command 'git rebase c5d7d02bfafd0664a2d3e9c304d3aedf2b771bda'
> failed:
> Rebasing (1/8)
> Rebasing (2/8)
> error: could not apply 7f3dc56... native_bindir
> Resolve all conflicts manually, mark them as resolved with
> "git add/rm <conflicted_files>", then run "git rebase --continue".
> You can instead skip this commit: run "git rebase --skip".
> To abort and get back to the state before "git rebase", run "git rebase
> --abort".
> Could not apply 7f3dc56... native_bindir
> Auto-merging mesonbuild/dependencies/base.py
> CONFLICT (content): Merge conflict in mesonbuild/dependencies/base.py
>
> You will need to resolve conflicts in order to complete the upgrade.
> INFO: Upgraded source extracted to
> /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/meson
> INFO: New recipe is
> /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/meson/
> meson_0.59.0.bb
>
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

--000000000000909d8405c7f33d7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The latest round of upgrade helper emails didn&#39;t =
make it to oe-core list (but I did get ones that were also CCd to me direct=
ly) - can you please check?</div><div><br></div><div>Here&#39;s the log:</d=
iv><div><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/=
112/builds/37/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typ=
hoon/#/builders/112/builds/37/steps/11/logs/stdio</a></div><div><br></div><=
div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sun, 25 Jul 2021 at 14:28, &lt;<a href=3D"mailto:auh@a=
uh.yoctoproject.org">auh@auh.yoctoproject.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *meson* to *0.59.0* has Fa=
iled (devtool error).<br>
<br>
Detailed error information:<br>
<br>
Running &#39;devtool upgrade&#39; for recipe meson failed.<br>
NOTE: Starting bitbake server...<br>
NOTE: Reconnecting to bitbake server...<br>
NOTE: Retrying server connection (#1)...<br>
Loading cache...done.<br>
Loaded 1459 entries from dependency cache.<br>
INFO: Extracting current version source...<br>
Removing 1 recipes from the x86_64 sysroot...done.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.51.0&quot;<b=
r>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;3.3+snapshot-0421d4df954=
a35ad0176a12db1060e52115b14b1&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;tmp-auh-upgrades:0421d4d=
f954a35ad0176a12db1060e52115b14b1&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:982f98f=
721af11b5698be8fe959058823d1de0d3&quot;<br>
<br>
Initialising tasks...done.<br>
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 1=
00% complete)<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn&#39;t need to be r=
erun and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 1 seconds<br>
INFO: Extracting upgraded version source...<br>
INFO: Fetching <a href=3D"https://github.com/mesonbuild/meson/releases/down=
load/0.59.0/meson-0.59.0.tar.gz." rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/mesonbuild/meson/releases/download/0.59.0/meson-0.59.0.tar.g=
z.</a>..<br>
Loading cache...done.<br>
Loaded 1459 entries from dependency cache.<br>
Parsing recipes...done.<br>
Parsing of 822 .bb files complete (820 cached, 2 parsed). 1460 targets, 35 =
skipped, 0 masked, 0 errors.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.51.0&quot;<b=
r>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;3.3+snapshot-0421d4df954=
a35ad0176a12db1060e52115b14b1&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;tmp-auh-upgrades:0421d4d=
f954a35ad0176a12db1060e52115b14b1&quot;<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:982f98f=
721af11b5698be8fe959058823d1de0d3&quot;<br>
<br>
Initialising tasks...done.<br>
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0%=
 complete)<br>
NOTE: No setscene tasks<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn&#39;t need to be rer=
un and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 1 seconds<br>
DEBUG 5 [Errno 25] Inappropriate ioctl for device<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--<br>
Adding changed files:=C2=A0 15% |#####=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 30% |##########=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:=
00:00<br>
Adding changed files:=C2=A0 45% |################=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 60% |#####################=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 75% |###########################=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| ETA:=C2=A0 0:00:00<br>
Adding changed files:=C2=A0 90% |################################=C2=A0 =C2=
=A0 | ETA:=C2=A0 0:00:00<br>
Adding changed files: 100% |####################################| Time: 0:0=
0:00<br>
INFO: Rebasing devtool onto c5d7d02bfafd0664a2d3e9c304d3aedf2b771bda<br>
WARNING: Command &#39;git rebase c5d7d02bfafd0664a2d3e9c304d3aedf2b771bda&#=
39; failed:<br>
Rebasing (1/8)<br>
Rebasing (2/8)<br>
error: could not apply 7f3dc56... native_bindir<br>
Resolve all conflicts manually, mark them as resolved with<br>
&quot;git add/rm &lt;conflicted_files&gt;&quot;, then run &quot;git rebase =
--continue&quot;.<br>
You can instead skip this commit: run &quot;git rebase --skip&quot;.<br>
To abort and get back to the state before &quot;git rebase&quot;, run &quot=
;git rebase --abort&quot;.<br>
Could not apply 7f3dc56... native_bindir<br>
Auto-merging mesonbuild/dependencies/base.py<br>
CONFLICT (content): Merge conflict in mesonbuild/dependencies/base.py<br>
<br>
You will need to resolve conflicts in order to complete the upgrade.<br>
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/b=
uild/build/workspace/sources/meson<br>
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/work=
space/recipes/meson/<a href=3D"http://meson_0.59.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">meson_0.59.0.bb</a><br>
<br>
<br>
<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper</blockquote></div>

--000000000000909d8405c7f33d7d--
